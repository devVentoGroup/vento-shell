### MINI-BLOQUE — TECNOLOGÍA CUMPLIMIENTO DATOS CONTINUIDAD Y APROBACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **tecnología cumplimiento datos continuidad y aprobación** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-SCOPE-015` a `CAP-SCOPE-019` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-SCOPE-015`: Evaluar TI, dispositivos, redes, impresión, soporte y seguridad
- `CAP-SCOPE-016`: Evaluar privacidad, cumplimiento, documentos, conservación y auditoría
- `CAP-SCOPE-017`: Evaluar analítica, indicadores y datos maestros
- `CAP-SCOPE-018`: Evaluar continuidad operativa, contingencia, incidentes, respaldo y recuperación
- `CAP-SCOPE-019`: Aprobar clasificación y propietario de cada dominio evaluado
<!-- PLAN-SECTION-META:END -->

### ✅ CAP-SCOPE-015 — Evaluar TI, dispositivos, redes, impresión, soporte y seguridad

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-014` aprobada  
**Tarea anterior:** `CAP-SCOPE-014`  
**Siguiente tarea reservada:** `CAP-SCOPE-016`  
**Familia evaluada:** `CAP-15 — Gestionar tecnología y soporte`  
**Superficies objetivo:** `SHELL`, `NEXO`, `ANIMA`, `VISO`, servicio transversal de impresión y proveedores tecnológicos  
**Implementación técnica:** no autorizada  
**Cambios de cuentas, red, impresoras, dispositivos o proveedores reales:** no autorizados  
**Requisitos generados:** `TREQ-SHELL-010`, `TREQ-VISO-002`, `TREQ-NEXO-019`, `TREQ-INTEGRATION-020`  
**Tareas nuevas derivadas:** `TI-DOM-001` a `013`, `TI-AUTH-001` a `004`, `TI-UX-001` a `006`, `TI-INT-001` a `003`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas  

---

#### 1. Propósito

Definir el modelo empresarial objetivo para operar tecnología en Vento Group: cuentas, dispositivos, endpoints, redes, impresoras, aplicaciones, soporte, incidentes, cambios, pruebas, proveedores, licencias, costos, seguridad técnica, conocimiento y recuperación.

La tarea consolida capacidades existentes sin crear una aplicación monolítica ni una fuente paralela. El objetivo es que cualquier falla o cambio pueda responder de manera trazable:

```text
qué servicio está afectado
qué elemento técnico participa
quién lo usa y dónde
qué cambió
qué impacto produce
quién responde
cómo se recupera
cómo se comprueba el cierre
```

---

#### 2. Decisión principal

```text
SHELL
→ identidad, catálogo de aplicaciones y política de acceso

NEXO
→ activo físico, ubicación, custodia, mantenimiento y garantía

ANIMA
→ portal del trabajador, capacitación y seguimiento personal

VISO
→ mesa de servicio, incidentes, problemas, cambios y supervisión

PRINT-ARC
→ documentos, colas, routing, adaptadores y trabajos de impresión

BLOQUE T / E5 / U
→ calidad, despliegue, piloto, rollback y certificación

ORIGO / NUMERA
→ compra, contrato, renovación, compromiso, gasto y costo

BLOQUE Y — TECNOLOGÍA Y SOPORTE
→ modelo transversal, relaciones, reglas y experiencia integrada
```

TI no concederá permisos por criterio propio, no reemplazará el maestro de activos, no ejecutará operaciones empresariales por medio de la cola de impresión y no declarará restaurado un servicio sin verificación.

---

#### 3. Alcance evaluado

- `CAP-15.01` — Gestionar cuentas y accesos;
- `CAP-15.02` — Gestionar computadores, celulares y tabletas;
- `CAP-15.03` — Gestionar redes y conectividad;
- `CAP-15.04` — Gestionar impresoras y periféricos;
- `CAP-15.05` — Gestionar aplicaciones y proveedores tecnológicos;
- `CAP-15.06` — Atender solicitudes de soporte;
- `CAP-15.07` — Gestionar fallas e incidentes tecnológicos;
- `CAP-15.08` — Gestionar cambios y versiones;
- `CAP-15.09` — Probar soluciones antes de usarlas;
- `CAP-15.10` — Gestionar licencias, contratos y costos tecnológicos;
- `CAP-15.11` — Capacitar en el uso de herramientas;

---

#### 4. Clasificación de cobertura

| Subcapacidad | Nombre                                               | Tratamiento       | Propietaria objetivo                         | Decisión                                                                                                                                                                                |
| ------------ | ---------------------------------------------------- | ----------------- | -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CAP-15.01    | Gestionar cuentas y accesos                          | REUSE_OR_REFACTOR | SHELL + TI                                   | Reutilizar identidad, roles, permisos, catálogos de aplicaciones y cierres laborales; TI ejecutará aprovisionamiento y revocación sin convertirse en autoridad para conceder acceso.    |
| CAP-15.02    | Gestionar computadores, celulares y tabletas         | REUSE_OR_REFACTOR | NEXO + SHELL + TI                            | Reutilizar activos y dispositivos compartidos, añadiendo identidad lógica, configuración estándar, postura, parches, cifrado, aplicaciones, salud, soporte y retiro seguro.             |
| CAP-15.03    | Gestionar redes y conectividad                       | BUILD             | TI + NEXO                                    | Construir inventario y gobierno de enlaces, routers, switches, puntos de acceso, segmentos, SSID, direccionamiento, reservas, monitoreo, capacidad, fallas y contingencia.              |
| CAP-15.04    | Gestionar impresoras y periféricos                   | REUSE_OR_REFACTOR | TI + NEXO + PRINT-ARC                        | Reutilizar activos, BrowserPrint, colas y arquitectura transversal de impresión; separar impresora física, cola, ruta, adaptador, plantilla, trabajo y resultado.                       |
| CAP-15.05    | Gestionar aplicaciones y proveedores tecnológicos    | REUSE_OR_REFACTOR | SHELL + TI + ORIGO                           | Reutilizar catálogo de aplicaciones e integraciones y construir su dimensión de servicio, propietario, ambiente, dependencia, proveedor, contrato, licencia, datos, SLA y recuperación. |
| CAP-15.06    | Atender solicitudes de soporte                       | REUSE_OR_REFACTOR | ANIMA + VISO + TI                            | Refactorizar support_tickets y support_messages como portal del trabajador y mesa de servicio, con catálogo, prioridad, recurso afectado, SLA, comunicación, validación y reapertura.   |
| CAP-15.07    | Gestionar fallas e incidentes tecnológicos           | BUILD             | VISO + TI                                    | Construir incidentes, impacto, urgencia, severidad, escalamiento, comunicación, workaround, problema, causa raíz, error conocido, recuperación y revisión posterior.                    |
| CAP-15.08    | Gestionar cambios y versiones                        | REUSE_OR_REFACTOR | TI + BLOQUE T + propietarios de aplicaciones | Extender CI, releases y rollback al gobierno operativo de cambios de configuración, red, dispositivo, impresora, proveedor y aplicación con ventana, aprobación y revisión.             |
| CAP-15.09    | Probar soluciones antes de usarlas                   | REUSE_OR_REFACTOR | TI + BLOQUES E5/T/U                          | Reutilizar pruebas y pilotos, añadiendo aceptación técnica y operativa para hardware, red, impresión, configuración, recuperación, seguridad y compatibilidad.                          |
| CAP-15.10    | Gestionar licencias, contratos y costos tecnológicos | BUILD             | TI + ORIGO + NUMERA                          | Construir catálogo de licencias, asientos, renovaciones, propietarios, consumo, garantías, contratos, compromisos, costos, alertas y conciliación con compra y gasto.                   |
| CAP-15.11    | Capacitar en el uso de herramientas                  | BUILD             | TI + ANIMA + propietarios funcionales        | Construir conocimiento, guías cortas, entrenamiento por rol, comprobación, novedades de versión, soporte guiado y evidencia de adopción sin saturar las pantallas.                      |

---

#### 5. Resumen de clasificación

| Tratamiento       | Cantidad |
| ----------------- | -------- |
| REUSE_OR_REFACTOR | 7        |
| BUILD             | 4        |
| TOTAL             | 11       |

---

#### 6. Modelo de objetos tecnológicos

La administración utilizará una configuración relacionada de elementos técnicos, no una tabla genérica sin semántica:

```text
SERVICIO TECNOLÓGICO
→ depende de APLICACIONES y PROVEEDORES
→ se ejecuta en ENDPOINTS o INFRAESTRUCTURA
→ usa REDES, CREDENCIALES y LICENCIAS
→ puede producir IMPRESIÓN o NOTIFICACIONES
→ recibe SOLICITUDES, INCIDENTES, PROBLEMAS y CAMBIOS
```

Cada elemento conservará identidad estable, propietario, criticidad, sede o alcance, estado, relaciones, versión, evidencia y ciclo de vida.

---

#### 7. Fronteras conceptuales obligatorias

```text
activo físico ≠ endpoint lógico ≠ dispositivo compartido ≠ sesión ≠ actor
```

```text
cuenta ≠ permiso ≠ credencial ≠ secreto ≠ asiento de licencia
```

```text
solicitud ≠ incidente ≠ problema ≠ error conocido ≠ cambio
```

```text
incidente resuelto ≠ causa eliminada ≠ ticket cerrado
```

```text
impresora ≠ cola ≠ ruta ≠ adaptador ≠ plantilla ≠ trabajo
```

```text
router ≠ enlace ≠ segmento ≠ SSID ≠ reserva DHCP ≠ dirección IP
```

```text
despliegue ≠ cambio aprobado ≠ release ≠ rollback
```

```text
respaldo configurado ≠ restauración comprobada
```

---

#### 8. Cuentas y accesos

SHELL y el modelo de autorización continuarán siendo la fuente de decisión. TI podrá ejecutar altas, bajas, recuperación y configuración únicamente a partir de una relación laboral, contractual o empresarial autorizada.

El ciclo deberá cubrir:

- solicitud y aprobación;
- aprovisionamiento;
- MFA y recuperación;
- asignación de licencia;
- cambio de función o sede;
- acceso privilegiado temporal;
- proveedor o soporte remoto;
- suspensión, revocación y cierre;
- evidencia de ejecución.

Una cuenta técnica o de proveedor tendrá propietario humano, finalidad, alcance, vigencia y revisión periódica.

---

#### 9. Computadores, celulares, tabletas y endpoints

NEXO conservará el activo físico. TI añadirá la vista lógica del endpoint:

- nombre estable y clase;
- activo relacionado;
- número de serie y huellas técnicas permitidas;
- sede, área, custodia y uso compartido o personal;
- sistema operativo y versión;
- configuración estándar aplicada;
- cifrado, bloqueo y postura de seguridad;
- aplicaciones instaladas;
- última comprobación y salud;
- parches pendientes;
- soporte remoto autorizado;
- retiro, borrado y disposición.

Un endpoint podrá cambiar de custodio sin perder historial y un activo podrá existir temporalmente sin estar habilitado como endpoint productivo.

---

#### 10. Dispositivos compartidos

El bloque `AUTH-DEV` continuará limitando la operación por sede, área, aplicación y capacidad máxima. CAP-SCOPE-015 añadirá:

- inventario técnico y salud;
- configuración estándar;
- versión de navegador o aplicación;
- periféricos relacionados;
- conectividad esperada;
- procedimiento de recuperación;
- cambio seguro de trabajador;
- revocación técnica y borrado local.

El dispositivo nunca prestará permisos administrativos al trabajador activo.

---

#### 11. Redes y conectividad

La red deberá representarse mediante:

- proveedor y enlace de internet;
- router, switch, punto de acceso y UPS relacionados;
- segmento o VLAN;
- SSID y finalidad;
- rango y política de direccionamiento;
- reservas DHCP y nombres estables;
- dispositivos esperados;
- dependencia de impresoras, cámaras, POS y tablets;
- métricas de disponibilidad, latencia y pérdida;
- cambios, respaldos de configuración y recuperación.

Las redes de invitados, administración, operación, IoT, cámaras e impresión deberán separarse o justificar expresamente su convivencia.

---

#### 12. Impresoras y periféricos

El servicio transversal `PRINT-ARC` ya define inventario, routing, heartbeat, idempotencia, reintentos, fallback y adaptadores. CAP-SCOPE-015 no duplicará esas tareas.

TI administrará la dimensión física y de soporte:

- impresora, modelo, serie, interfaz y dirección estable;
- ubicación y responsable;
- papel, lenguaje y capacidades;
- cola y adaptador relacionados;
- consumibles y mantenimiento;
- estado, heartbeat y último diagnóstico;
- red, reserva y ruta esperadas;
- fallback autorizado;
- evidencia de prueba.

Cambiar IP, USB, Bluetooth, puente local o driver será un cambio tecnológico versionado, no una corrección informal.

---

#### 13. Aplicaciones y proveedores tecnológicos

Cada aplicación o servicio deberá declarar:

- propietario empresarial y técnico;
- ambientes y URL autorizadas;
- repositorio y versión cuando aplique;
- proveedor y contrato;
- autenticación y cuentas técnicas;
- datos tratados y clasificación;
- dependencias y servicios críticos;
- licencia, asientos y renovación;
- SLA y soporte;
- respaldo, recuperación y salida del proveedor.

El catálogo de aplicaciones de SHELL seguirá gobernando identidad y acceso; el catálogo de TI añadirá la operación del servicio.

---

#### 14. Mesa de servicio

El flujo mínimo será:

```text
reporte o solicitud
→ clasificación
→ impacto + urgencia
→ prioridad y SLA
→ asignación
→ diagnóstico
→ acción o workaround
→ restauración
→ validación del solicitante o responsable
→ cierre
```

ANIMA ofrecerá un formulario corto y contextual. VISO mostrará la cola administrativa. El usuario no deberá escoger términos técnicos que desconoce; sede, dispositivo, aplicación y contexto se propondrán automáticamente cuando sea posible.

---

#### 15. Incidentes, problemas y errores conocidos

Un incidente restablece servicio. Un problema investiga recurrencia. Un error conocido conserva causa identificada y workaround.

Los incidentes críticos incluirán:

- impacto y servicios afectados;
- línea de tiempo;
- comunicación a usuarios;
- decisiones y cambios de emergencia;
- restauración y validación;
- causa preliminar y definitiva;
- acciones preventivas;
- revisión posterior.

Cerrar una conversación de soporte no cerrará automáticamente el incidente o problema relacionado.

---

#### 16. Cambios y versiones

Todo cambio productivo relevante conservará:

- razón y alcance;
- elementos afectados;
- riesgo e impacto;
- dependencias;
- aprobación;
- ventana;
- plan de prueba;
- respaldo o estado anterior;
- rollback;
- ejecutor;
- resultado y revisión posterior.

Los releases de código seguirán el BLOQUE T. Red, impresoras, dispositivos, cuentas, proveedores y configuraciones utilizarán el mismo principio de control, aunque no exista un commit de software.

---

#### 17. Prueba antes de uso

La aceptación deberá cubrir, según el cambio:

- funcionalidad;
- permisos y RLS;
- dispositivo real;
- red real o simulada;
- impresión y periféricos;
- operación offline;
- reintentos e idempotencia;
- recuperación y rollback;
- rendimiento y capacidad;
- seguridad y privacidad;
- comprensión del usuario.

Una prueba técnica exitosa no bastará cuando el flujo completo de la sede no haya sido validado.

---

#### 18. Monitoreo y observabilidad

La salud técnica deberá poder correlacionar:

```text
servicio
→ aplicación
→ endpoint o infraestructura
→ red
→ proveedor
→ incidente
```

Alertas repetidas se agruparán y no generarán cientos de tickets. La ausencia de telemetría se distinguirá de un servicio saludable. Logs y métricas conservarán retención, acceso, minimización y reloj coherente.

---

#### 19. Respaldo y recuperación

Cada servicio crítico declarará:

- qué se respalda;
- propietario;
- frecuencia y retención;
- cifrado y ubicación;
- objetivo de pérdida aceptable;
- objetivo de recuperación;
- procedimiento de restauración;
- última prueba y resultado;
- dependencias externas.

CAP-SCOPE-018 gobernará continuidad empresarial. TI será responsable de demostrar la recuperación técnica que esa continuidad requiera.

---

#### 20. Licencias, contratos y costos

TI administrará uso y asignación. ORIGO conservará compra y contrato. NUMERA conservará compromiso, gasto y costo.

Se controlarán:

- producto, plan y proveedor;
- propietario y usuarios asignados;
- cantidad comprada, utilizada y disponible;
- fecha de inicio, renovación y cancelación;
- costo y centro responsable;
- garantía y soporte;
- condición de salida y exportación de datos;
- alertas de vencimiento y sobredimensionamiento.

Una cuenta activa sin necesidad no justificará conservar una licencia.

---

#### 21. Capacitación y conocimiento

La ayuda deberá ser breve, contextual y accionable:

- guías de una tarea;
- diagnóstico guiado;
- procedimientos de contingencia;
- cambios relevantes de versión;
- entrenamiento por rol;
- evidencia de comprensión cuando sea crítica;
- artículos vinculados a incidentes y problemas.

Las pantallas no se llenarán de explicaciones permanentes. La ayuda extensa estará bajo demanda y la operación cotidiana mostrará únicamente estado, acción y resultado.

---

#### 22. Seguridad técnica

La seguridad abarcará:

- MFA y recuperación;
- mínimos privilegios;
- acceso privilegiado temporal;
- soporte remoto autorizado;
- segmentación de red;
- configuración y parches;
- secretos fuera de tickets y capturas;
- cifrado y bloqueo;
- revocación de proveedor;
- logs protegidos;
- respuesta coordinada a incidentes de seguridad.

SHELL/AUTH decidirá autorización. CAP-SCOPE-016 gobernará información y evidencia. CAP-SCOPE-018 gobernará continuidad. TI ejecutará y comprobará controles técnicos.

---

#### 23. Experiencia simple

El trabajador verá:

```text
Reportar un problema
Mis solicitudes
Avisos de servicio
Ayuda rápida
```

La mesa de servicio verá:

```text
Nuevos
En riesgo de SLA
Incidentes activos
Cambios de hoy
Dispositivos o servicios con alerta
Pendientes de validación
```

No se expondrán IP, payloads, logs o códigos de error en la vista principal salvo que el usuario abra el diagnóstico técnico autorizado.

---

#### 24. Preguntas y decisiones pendientes

No se crean preguntas nuevas.

Se reutilizan:

- `DIF-05` — funcionamiento sin internet;
- `DIF-07` — recuperación por caída de energía, red o dispositivo;
- `DIF-10` — propietario objetivo del soporte tecnológico.

Esta tarea resuelve funcionalmente `DIF-10` mediante propiedad distribuida y mesa de servicio en VISO. La actualización formal del registro vivo se consolidará posteriormente en lote. `DIF-05` y `DIF-07` continúan hasta diseño, piloto y CAP-SCOPE-018.

---

#### 25. Hallazgos

| ID                  | Hallazgo                                                                                                                                                          | Severidad | Tarea propietaria                                     | Puerta  |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | ----------------------------------------------------- | ------- |
| H-CAP-SCOPE-015-001 | Las capacidades tecnológicas están distribuidas entre SHELL, NEXO, ANIMA, VISO, impresión y CI sin un modelo operativo único.                                     | crítica   | TI-DOM-001; TI-INT-002                                | E1/E2   |
| H-CAP-SCOPE-015-002 | No existe un catálogo canónico de servicios tecnológicos, propietarios, criticidad y niveles de atención.                                                         | alta      | TI-DOM-001; TI-UX-002                                 | E2      |
| H-CAP-SCOPE-015-003 | support_tickets solo conserva categoría, título, descripción, estado básico y asignación; no modela impacto, urgencia, SLA ni recurso afectado.                   | crítica   | TI-DOM-007; TI-UX-001; TI-UX-002                      | E2/E3   |
| H-CAP-SCOPE-015-004 | Los mensajes y notificaciones de soporte existen, pero no prueban un ciclo completo de diagnóstico, validación y reapertura.                                      | alta      | TI-DOM-007; TI-UX-002                                 | E2/E3   |
| H-CAP-SCOPE-015-005 | Activo físico, endpoint lógico, dispositivo compartido, sesión y actor pueden confundirse.                                                                        | crítica   | TI-DOM-002; TI-DOM-003; AUTH-DEV-001 a AUTH-DEV-016   | E2/E3   |
| H-CAP-SCOPE-015-006 | No existe una CMDB o grafo de relaciones que permita evaluar qué servicio depende de qué dispositivo, red, aplicación o proveedor.                                | crítica   | TI-DOM-002; TI-DOM-006; TI-INT-002                    | E2/E3   |
| H-CAP-SCOPE-015-007 | El alta, cambio y baja de cuentas puede no estar reconciliado integralmente con vinculación, cambio de función, retiro y contratos externos.                      | crítica   | TI-DOM-001; TI-AUTH-001; TI-AUTH-002; CAP-SCOPE-002   | E2/E3   |
| H-CAP-SCOPE-015-008 | Una cuenta, permiso, credencial, secreto y asiento de licencia pueden tratarse como si fueran el mismo objeto.                                                    | crítica   | TI-DOM-006; TI-DOM-012; TI-AUTH-002                   | E2/E3   |
| H-CAP-SCOPE-015-009 | Accesos privilegiados, de proveedor o de soporte remoto no tienen un ciclo tecnológico explícito de solicitud, tiempo limitado, supervisión y cierre.             | crítica   | TI-AUTH-002; TI-DOM-009                               | E2/E3   |
| H-CAP-SCOPE-015-010 | No existe una configuración estándar y versionada por clase de computador, celular o tableta.                                                                     | alta      | TI-DOM-003; TI-UX-003                                 | E2/E3   |
| H-CAP-SCOPE-015-011 | Parches, versión de sistema, cifrado, bloqueo, salud, aplicaciones y fecha de última comprobación no están gobernados integralmente.                              | crítica   | TI-DOM-003; TI-DOM-010; TI-AUTH-003                   | E2/E3   |
| H-CAP-SCOPE-015-012 | La topología real de enlaces, routers, switches, puntos de acceso, segmentos y dependencias no está consolidada.                                                  | crítica   | TI-DOM-004; TI-UX-003                                 | E1/E2   |
| H-CAP-SCOPE-015-013 | SSID, red de invitados, operación, administración, IoT, cámaras e impresoras pueden compartir límites no certificados.                                            | crítica   | TI-DOM-004; TI-AUTH-003                               | E2/E3   |
| H-CAP-SCOPE-015-014 | El direccionamiento, DHCP, reservas, nombres y configuración de impresoras pueden divergir y causar cambios de IP o rutas rotas.                                  | crítica   | TI-DOM-004; TI-DOM-005; PRINT-ARC-007 a PRINT-ARC-009 | E2/E3   |
| H-CAP-SCOPE-015-015 | No existe monitoreo transversal comprobado de internet, red local, endpoint, impresora, aplicación y proveedor.                                                   | crítica   | TI-DOM-010; TI-INT-001                                | E3/E4   |
| H-CAP-SCOPE-015-016 | La arquitectura PRINT-ARC define el objetivo, pero todavía debe reconciliar inventario físico, heartbeat, routing, adaptadores y fallos reales.                   | alta      | TI-DOM-005; PRINT-ARC-001 a PRINT-ARC-020             | E2/E4   |
| H-CAP-SCOPE-015-017 | BrowserPrint, puentes locales, LAN, USB, Bluetooth y aplicaciones de terceros pueden producir rutas de impresión no equivalentes.                                 | alta      | TI-DOM-005; TI-INT-001; PRINT-ARC-018                 | E3/E4   |
| H-CAP-SCOPE-015-018 | Impresora, cola, plantilla, documento, ruta y trabajo pueden confundirse al diagnosticar o reimprimir.                                                            | crítica   | TI-DOM-005; PRINT-ARC-003 a PRINT-ARC-014             | E2/E3   |
| H-CAP-SCOPE-015-019 | El catálogo de aplicaciones no incorpora de forma completa ambientes, propietario de servicio, dependencias, datos, autenticación, SLA, proveedor y recuperación. | crítica   | TI-DOM-006; TI-UX-005                                 | E2/E3   |
| H-CAP-SCOPE-015-020 | Licencias, asientos, renovaciones, usuarios asignados, garantías y costos pueden estar dispersos entre correos, cuentas personales y facturas.                    | alta      | TI-DOM-012; TI-UX-005; ORIGO; NUMERA                  | E1/E2   |
| H-CAP-SCOPE-015-021 | Credenciales, tokens, códigos de recuperación o diagnósticos sensibles pueden terminar en tickets, capturas o mensajería.                                         | crítica   | TI-AUTH-002; TI-AUTH-004; CAP-SCOPE-016               | E2/E4   |
| H-CAP-SCOPE-015-022 | El bloque de CI y despliegue cubre software, pero no gobierna por sí solo cambios de router, impresora, endpoint, cuenta o proveedor.                             | alta      | TI-DOM-009; SHELL-CI-001 a SHELL-CI-019               | E2/E5   |
| H-CAP-SCOPE-015-023 | Un cambio tecnológico puede ejecutarse sin ventana, dependencias, aprobación, prueba de reversión ni revisión posterior.                                          | crítica   | TI-DOM-009; TI-UX-004                                 | E2/E5   |
| H-CAP-SCOPE-015-024 | Probar una aplicación no equivale a probar dispositivo, red, impresora, contingencia y operación real en la sede.                                                 | crítica   | TI-DOM-009; CAP-SCOPE-005; BLOQUES E5/T/U             | E5/U    |
| H-CAP-SCOPE-015-025 | Solicitud, incidente, problema, error conocido y cambio pueden registrarse como un único ticket genérico.                                                         | crítica   | TI-DOM-007 a TI-DOM-009                               | E2/E3   |
| H-CAP-SCOPE-015-026 | Marcar un ticket como resuelto no demuestra restauración del servicio, validación del usuario ni eliminación de la causa.                                         | crítica   | TI-DOM-007; TI-DOM-008; TI-UX-002                     | E2/E3   |
| H-CAP-SCOPE-015-027 | Workarounds, procedimientos y conocimiento técnico pueden depender de memoria personal y no de una base versionada.                                               | alta      | TI-DOM-008; TI-DOM-013; TI-UX-006                     | E2/E4   |
| H-CAP-SCOPE-015-028 | Capacitación y adopción no están vinculadas sistemáticamente a cambio, versión, rol, herramienta y evidencia de comprensión.                                      | alta      | TI-DOM-013; TI-UX-006; ANIMA                          | E2/E5   |
| H-CAP-SCOPE-015-029 | Tener respaldo configurado puede confundirse con haber probado restauración, integridad y tiempo de recuperación.                                                 | crítica   | TI-DOM-011; CAP-SCOPE-018                             | E3/E5/U |
| H-CAP-SCOPE-015-030 | La recuperación ante caída de energía, red o dispositivo continúa diferida y debe enlazarse con continuidad y piloto.                                             | crítica   | TI-DOM-011; DIF-05; DIF-07; CAP-SCOPE-018             | E2/E5   |
| H-CAP-SCOPE-015-031 | Diagnóstico remoto, modo offline y reintentos pueden duplicar acciones o perder evidencia del actor y del dispositivo.                                            | alta      | TI-DOM-007; TI-AUTH-002; TI-INT-003                   | E3/E4   |
| H-CAP-SCOPE-015-032 | Logs, capturas y exportaciones de soporte pueden exponer datos personales, secretos, direcciones o información financiera.                                        | crítica   | TI-AUTH-004; CAP-SCOPE-016                            | E2/E4   |
| H-CAP-SCOPE-015-033 | Proveedores tecnológicos, ISP, garantías, contratos, compras y gastos no tienen conciliación transversal de ciclo de vida.                                        | alta      | TI-DOM-006; TI-DOM-012; TI-INT-003; ORIGO; NUMERA     | E2/E4   |
| H-CAP-SCOPE-015-034 | Un incidente de servicio, un incidente de seguridad y un incidente de continuidad requieren clasificación y propietarios diferentes.                              | crítica   | TI-DOM-007; TI-AUTH-004; CAP-SCOPE-016; CAP-SCOPE-018 | E2      |

---

#### 26. Tareas nuevas derivadas

| ID          | Tarea                                                                                                                                                       | Bloque                                         | Momento                                                              |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- | -------------------------------------------------------------------- |
| TI-DOM-001  | Definir modelo operativo de tecnología, catálogo de servicios, propietarios y niveles de atención                                                           | BLOQUE Y — Tecnología y soporte / dominio      | Primera tarea del bloque, antes de diseñar soporte o herramientas    |
| TI-DOM-002  | Definir configuración canónica de elementos tecnológicos y relaciones entre activo, endpoint, dispositivo compartido, red, impresora, aplicación y servicio | BLOQUE Y — Tecnología y soporte / dominio      | Después de TI-DOM-001 y coordinada con NEXO y SHELL                  |
| TI-DOM-003  | Definir ciclo de vida de computadores, celulares, tabletas y endpoints                                                                                      | BLOQUE Y — Tecnología y soporte / dominio      | Antes de inventario técnico, estandarización o administración remota |
| TI-DOM-004  | Definir arquitectura, inventario, segmentación, direccionamiento, monitoreo y contingencia de redes                                                         | BLOQUE Y — Tecnología y soporte / dominio      | Antes de cambios de router, Wi-Fi, VLAN, DHCP o reservas productivas |
| TI-DOM-005  | Definir gobierno de impresoras y periféricos físicos frente al servicio transversal de impresión                                                            | BLOQUE Y — Tecnología y soporte / dominio      | Coordinada con PRINT-ARC-001 a PRINT-ARC-020                         |
| TI-DOM-006  | Definir catálogo de aplicaciones, ambientes, dependencias, proveedores, licencias y criticidad                                                              | BLOQUE Y — Tecnología y soporte / dominio      | Antes de administrar contratos, accesos o continuidad por aplicación |
| TI-DOM-007  | Definir solicitud de servicio, incidente, impacto, urgencia, prioridad, SLA, escalamiento, comunicación y cierre                                            | BLOQUE Y — Tecnología y soporte / dominio      | Antes de refactorizar support_tickets                                |
| TI-DOM-008  | Definir problema, causa raíz, error conocido, workaround y prevención de recurrencia                                                                        | BLOQUE Y — Tecnología y soporte / dominio      | Después de TI-DOM-007                                                |
| TI-DOM-009  | Definir cambio tecnológico, aprobación, ventana, prueba, despliegue, rollback y revisión posterior                                                          | BLOQUE Y — Tecnología y soporte / dominio      | Coordinada con BLOQUE T, E5 y propietarios funcionales               |
| TI-DOM-010  | Definir monitoreo, eventos técnicos, alertas, logs, salud y observabilidad de servicios                                                                     | BLOQUE Y — Tecnología y soporte / dominio      | Antes de integrar herramientas de monitoreo                          |
| TI-DOM-011  | Definir respaldo, restauración, recuperación técnica y relación con continuidad empresarial                                                                 | BLOQUE Y — Tecnología y soporte / dominio      | Coordinada con CAP-SCOPE-018 y pruebas de restauración               |
| TI-DOM-012  | Definir licencias, asientos, garantías, contratos, renovaciones, uso y costos tecnológicos                                                                  | BLOQUE Y — Tecnología y soporte / dominio      | Coordinada con ORIGO y NUMERA                                        |
| TI-DOM-013  | Definir base de conocimiento, capacitación, adopción y comunicación de cambios tecnológicos                                                                 | BLOQUE Y — Tecnología y soporte / dominio      | Después de catálogo de servicios y aplicaciones                      |
| TI-AUTH-001 | Definir roles y segregación para solicitar, diagnosticar, administrar, aprobar, cambiar y cerrar servicios tecnológicos                                     | BLOQUE Y — Tecnología y soporte / autorización | Antes de implementar mesa de servicio                                |
| TI-AUTH-002 | Proteger acceso privilegiado, cuentas técnicas, proveedores, soporte remoto y elevación temporal                                                            | BLOQUE Y — Tecnología y soporte / autorización | Antes de acceso remoto o administración productiva                   |
| TI-AUTH-003 | Proteger configuración de endpoints, redes, impresoras, aplicaciones, licencias y monitoreo                                                                 | BLOQUE Y — Tecnología y soporte / autorización | Antes de exponer controles administrativos                           |
| TI-AUTH-004 | Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte                                                                | BLOQUE Y — Tecnología y soporte / autorización | Antes de recopilar telemetría o evidencia real                       |
| TI-UX-001   | Diseñar portal simple de soporte para trabajadores dentro de ANIMA                                                                                          | BLOQUE Y — Tecnología y soporte / experiencia  | Después de TI-DOM-001 y TI-DOM-007                                   |
| TI-UX-002   | Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación                                                           | BLOQUE Y — Tecnología y soporte / experiencia  | Después de TI-DOM-007 y TI-AUTH-001                                  |
| TI-UX-003   | Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica                                                                               | BLOQUE Y — Tecnología y soporte / experiencia  | Después de TI-DOM-002 a TI-DOM-006 y TI-DOM-010                      |
| TI-UX-004   | Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación                                                                                 | BLOQUE Y — Tecnología y soporte / experiencia  | Después de TI-DOM-007 a TI-DOM-011                                   |
| TI-UX-005   | Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos                                                                   | BLOQUE Y — Tecnología y soporte / experiencia  | Después de TI-DOM-006 y TI-DOM-012                                   |
| TI-UX-006   | Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica                                                           | BLOQUE Y — Tecnología y soporte / experiencia  | Después de TI-DOM-013                                                |
| TI-INT-001  | Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos                                                      | BLOQUE Y — Tecnología y soporte / integración  | Antes de monitoreo productivo                                        |
| TI-INT-002  | Definir contratos con SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, PRINT-ARC, BLOQUE T y continuidad                                                            | BLOQUE Y — Tecnología y soporte / integración  | Antes de implementar el modelo transversal                           |
| TI-INT-003  | Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos                                                  | BLOQUE Y — Tecnología y soporte / integración  | Antes de conectar proveedores o consolas externas                    |

---

#### 27. Ubicación exacta de tareas nuevas

Crear el archivo:

```text
docs/plan-canonico/modular/bloques/Y_TECNOLOGIA_Y_SOPORTE/00_BLOQUE_Y.md
```

Agregar su ruta en `docs/plan-canonico/modular/manifest.json` inmediatamente después de:

```text
bloques/X_INTEGRACIONES/00_BLOQUE_X.md
```

El nuevo bloque contendrá, en este orden:

1. `TI-DOM-001` a `TI-DOM-013`;
2. `TI-AUTH-001` a `TI-AUTH-004`;
3. `TI-UX-001` a `TI-UX-006`;
4. `TI-INT-001` a `TI-INT-003`.

No se trasladarán ni duplicarán `AUTH-DEV-*`, `PRINT-ARC-*` o `SHELL-CI-*`; el BLOQUE Y los referenciará como dependencias.

---

#### 28. Requisitos de prueba generados

El registro `04A` completo incorpora:

```text
TREQ-SHELL-010
TREQ-VISO-002
TREQ-NEXO-019
TREQ-INTEGRATION-020
```

- `TREQ-SHELL-010` protege cuentas, aplicaciones, endpoints, acceso privilegiado y ejecución autorizada del ciclo de acceso.
- `TREQ-VISO-002` protege mesa de servicio, incidentes, problemas, cambios, SLA, comunicación, validación y experiencia simple.
- `TREQ-NEXO-019` protege inventario y relaciones físicas de tecnología, red, impresoras y endpoints.
- `TREQ-INTEGRATION-020` protege telemetría, impresión, soporte, proveedores, licencias y coordinación transversal.

---

#### 29. Dependencias principales

- `CAP-SCOPE-002`: personas, altas, cambios y retiros;
- `CAP-SCOPE-007`: activos, mantenimiento y garantías;
- `CAP-SCOPE-012`: contratos, obligaciones, gasto y costos;
- `CAP-SCOPE-013`: instalaciones, energía y condiciones físicas;
- `CAP-SCOPE-016`: información, documentos, secretos, logs y evidencia;
- `CAP-SCOPE-018`: continuidad e incidentes empresariales;
- `AUTH-DEV-001` a `AUTH-DEV-016`: dispositivo compartido;
- `PRINT-ARC-001` a `PRINT-ARC-020`: impresión transversal;
- `SHELL-CI-001` a `SHELL-CI-019`: versionado y despliegue;
- BLOQUES `E5` y `U`: piloto, aceptación y certificación.

---

#### 30. Criterios de aceptación

`CAP-SCOPE-015` podrá aprobarse cuando:

- las once subcapacidades estén clasificadas;
- la propiedad distribuida entre SHELL, NEXO, ANIMA, VISO, PRINT-ARC, ORIGO y NUMERA sea explícita;
- activo, endpoint, dispositivo compartido, cuenta, licencia y sesión estén separados;
- solicitud, incidente, problema y cambio estén separados;
- red, impresora y aplicación tengan identidades y relaciones estables;
- el soporte tenga impacto, urgencia, SLA, validación y reapertura;
- cambios y pruebas cubran hardware y configuración además de código;
- seguridad, acceso remoto, logs y secretos tengan controles explícitos;
- respaldo y restauración no se confundan;
- cada brecha tenga tarea propietaria;
- los cuatro `TREQ` estén incorporados en el `04A` completo;
- no se autorice ninguna intervención técnica real;
- `CAP-SCOPE-016` permanezca como continuidad inmediata.

---

#### 31. Lo que esta tarea no autoriza

- crear cuentas, permisos o licencias;
- conectarse remotamente a equipos;
- cambiar routers, DHCP, SSID, VLAN, IP o reservas;
- instalar, actualizar, bloquear o borrar dispositivos;
- modificar impresoras, drivers, colas o adaptadores;
- conectar herramientas de monitoreo, MDM o proveedores;
- abrir, cerrar o alterar tickets reales;
- desplegar código o configuración;
- probar restauraciones en producción;
- iniciar `CAP-SCOPE-016`.

---

#### 32. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
servicio y elemento tecnológico identificados
→ solicitud, incidente o cambio
→ autorización y diagnóstico
→ ejecución controlada
→ restauración o despliegue
→ validación
→ conocimiento y prevención
```

La continuidad será exclusivamente:

```text
CAP-SCOPE-016
— Evaluar información, documentos, archivos, evidencia y privacidad
```

---

#### 33. Estado de aprobación

```text
PROPUESTA PARA APROBACIÓN — NO APROBADA
```

No deberá marcarse como aprobada hasta que el usuario responda expresamente `APROBADO`.


### ✅ CAP-SCOPE-016 — Evaluar privacidad, cumplimiento, documentos, conservación y auditoría

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-015` aprobada  
**Tarea anterior:** `CAP-SCOPE-015`  
**Siguiente tarea reservada:** `CAP-SCOPE-017`  
**Familia evaluada:** `CAP-16 — Proteger información, documentos y evidencia`  
**Superficies objetivo:** todas las aplicaciones Vento OS, Supabase, Storage, archivos físicos, proveedores y canales externos  
**Implementación técnica o jurídica:** no autorizada  
**Eliminaciones, retenciones, firmas o investigaciones reales:** no autorizadas  
**Requisitos generados:** `TREQ-SHELL-011`, `TREQ-SUPABASE-013`, `TREQ-ANIMA-005`, `TREQ-VISO-003`, `TREQ-PASS-012`, `TREQ-INTEGRATION-021`  
**Tareas nuevas derivadas:** `INFO-DOM-001` a `013`, `INFO-AUTH-001` a `004`, `INFO-UX-001` a `006`, `INFO-INT-001` a `003`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas  

---

#### 1. Propósito

Definir el modelo empresarial objetivo para gobernar información, datos personales, documentos, archivos y evidencia durante todo su ciclo de vida, desde la creación o recepción hasta su disposición final.

La tarea debe permitir responder de forma inequívoca:

```text
qué información existe
qué proceso y entidad legal la producen
quién es su propietario funcional
qué finalidad autoriza su uso
qué nivel de sensibilidad tiene
quién puede verla, cambiarla, aprobarla, compartirla o eliminarla
qué versión está vigente
cuánto tiempo debe conservarse
qué obligación impide eliminarla
qué evidencia demuestra autenticidad e integridad
cómo se atiende al titular
cómo se investiga un acceso o cambio indebido
```

No se busca crear una carpeta documental genérica ni convertir cada aplicación en un repositorio de archivos. Cada documento y evidencia continuará asociado al proceso y recurso empresarial que respalda.

---

#### 2. Decisión principal y propiedad

```text
CADA APLICACIÓN DE DOMINIO
→ conserva el hecho empresarial y su expediente funcional

SHELL / AUTH
→ decide quién puede acceder, compartir, exportar o administrar

SUPABASE / STORAGE
→ conserva datos, metadatos, archivos, versiones y controles físicos

ANIMA
→ presenta documentos laborales propios y solicitudes del trabajador

PASS
→ presenta privacidad, consentimiento y derechos del cliente

VISO
→ administra gobierno, solicitudes, cumplimiento, investigaciones y auditoría

EVID-ARC
→ define arquitectura transversal de archivos, documentos y evidencia

BLOQUE AA — GOBIERNO DE INFORMACIÓN
→ define clasificación, finalidad, retención, firma, custodia,
  derechos de titulares y reglas transversales
```

Ningún repositorio central podrá sustituir el expediente funcional ni permitir que un archivo sin recurso propietario se convierta en fuente de verdad.

---

#### 3. Marco normativo y de cumplimiento

Esta tarea adopta un modelo de cumplimiento configurable y verificable, no una interpretación jurídica automática.

Como línea base colombiana se reconocen:

- Ley 1581 de 2012 para tratamiento de datos personales, finalidad, autorización, calidad, acceso restringido, seguridad, confidencialidad y derechos de los titulares;
- Decreto 1074 de 2015 y reglas aplicables al tratamiento y atención de consultas o reclamos;
- Ley 527 de 1999 para mensajes de datos, integridad, conservación, firma electrónica y firma digital;
- obligaciones laborales, comerciales, tributarias, sanitarias, contractuales y probatorias que determinen conservación por tipo documental;
- principios archivísticos como referencia técnica, sin asumir que toda regla propia de entidades públicas aplica automáticamente a Vento Group.

Regla obligatoria:

```text
NORMA O CONTRATO
→ OBLIGACIÓN DE CUMPLIMIENTO
→ CONTROL
→ EVIDENCIA
→ RESPONSABLE
→ FRECUENCIA
→ RESULTADO
```

Los términos concretos de retención, obligaciones regulatorias, necesidad de registro, firma certificada o comunicación a autoridades deberán validarse por tipo documental y entidad legal mediante `INFO-DOM-012`; no se fijarán periodos universales inventados.

---

#### 4. Alcance evaluado

- `CAP-16.01` — Clasificar información y documentos;
- `CAP-16.02` — Crear y aprobar documentos;
- `CAP-16.03` — Guardar y localizar documentos;
- `CAP-16.04` — Controlar versiones y vigencia;
- `CAP-16.05` — Compartir información de forma autorizada;
- `CAP-16.06` — Proteger datos personales y sensibles;
- `CAP-16.07` — Conservar registros y evidencia;
- `CAP-16.08` — Archivar y eliminar de forma controlada;
- `CAP-16.09` — Gestionar firmas y aprobaciones;
- `CAP-16.10` — Atender solicitudes sobre información;
- `CAP-16.11` — Investigar accesos o cambios indebidos.

---

#### 5. Clasificación de cobertura

| Subcapacidad | Nombre                                    | Tratamiento       | Propietaria objetivo                         | Decisión                                                                                                                                                                               |
| ------------ | ----------------------------------------- | ----------------- | -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CAP-16.01    | Clasificar información y documentos       | REUSE_OR_REFACTOR | BLOQUE AA + propietarios funcionales         | Reutilizar clasificación de sensibilidad, contratos de recurso y EVID-ARC; consolidar categorías, finalidades, propietarios, sujetos, territorios y controles en un registro canónico. |
| CAP-16.02    | Crear y aprobar documentos                | BUILD             | aplicación propietaria + VISO + BLOQUE AA    | Construir ciclo común de borrador, revisión, aprobación, publicación, sustitución, anulación y retiro sin convertir la aprobación en edición destructiva.                              |
| CAP-16.03    | Guardar y localizar documentos            | REUSE_OR_REFACTOR | aplicación propietaria + Supabase/Storage    | Reutilizar Storage y módulos documentales existentes; exigir metadatos, recurso, entidad legal, búsqueda, integridad, versión y ubicación física o digital.                            |
| CAP-16.04    | Controlar versiones y vigencia            | REUSE_OR_REFACTOR | aplicación propietaria + BLOQUE AA           | Reutilizar versiones parciales y vencimientos; separar versión, vigencia, estado, reemplazo y documento aplicable a una fecha.                                                         |
| CAP-16.05    | Compartir información de forma autorizada | REUSE_OR_REFACTOR | SHELL + aplicación propietaria               | Reutilizar autorización, URLs firmadas y exportaciones, añadiendo destinatario, finalidad, campos, caducidad, revocación, marca de agua y evidencia de entrega cuando corresponda.     |
| CAP-16.06    | Proteger datos personales y sensibles     | REUSE_OR_REFACTOR | BLOQUE AA + SHELL + ANIMA + PASS             | Consolidar políticas existentes, minimización, finalidad, consentimiento o base aplicable, datos sensibles, responsables, encargados, derechos y privacidad por diseño.                |
| CAP-16.07    | Conservar registros y evidencia           | REUSE_OR_REFACTOR | aplicación propietaria + EVID-ARC + Supabase | Reutilizar auditoría y evidencia parcial, añadiendo integridad, procedencia, cadena de custodia, retención, preservación y posibilidad de reproducción.                                |
| CAP-16.08    | Archivar y eliminar de forma controlada   | BUILD             | BLOQUE AA + propietarios + Supabase          | Construir tablas de retención, disparadores, archivo, revisión, legal hold, anonimización, eliminación verificable, certificado y conciliación de copias.                              |
| CAP-16.09    | Gestionar firmas y aprobaciones           | BUILD             | BLOQUE AA + aplicación propietaria           | Definir niveles distintos para aprobación interna, aceptación, firma electrónica y firma digital; integrar proveedor certificado solo cuando el riesgo o la norma lo exijan.           |
| CAP-16.10    | Atender solicitudes sobre información     | BUILD             | VISO + ANIMA + PASS + BLOQUE AA              | Construir caso trazable para acceso, actualización, rectificación, prueba de autorización, revocación, supresión, copia y otras solicitudes aplicables.                                |
| CAP-16.11    | Investigar accesos o cambios indebidos    | BUILD             | VISO + SHELL + BLOQUE AA                     | Construir investigación con preservación, alcance, línea de tiempo, actores, evidencia, causa, acciones y cierre; coordinar incidentes de seguridad y continuidad sin mezclarlos.      |

---

#### 6. Resumen de clasificación

| Tratamiento       | Cantidad |
| ----------------- | -------: |
| REUSE_OR_REFACTOR |        6 |
| BUILD             |        5 |
| TOTAL             |       11 |

---

#### 7. Modelo canónico de gobierno de información

```text
ACTIVO DE INFORMACIÓN
→ contiene DATOS o CONOCIMIENTO
→ puede materializarse como DOCUMENTO, REGISTRO o EVIDENCIA
→ puede tener uno o varios ARCHIVOS o representaciones
→ pertenece a un PROCESO y ENTIDAD LEGAL
→ tiene PROPIETARIO FUNCIONAL y CUSTODIO
→ se usa para FINALIDADES autorizadas
→ aplica CLASIFICACIÓN, ACCESO, RETENCIÓN y DISPOSICIÓN
```

Cada activo de información conservará como mínimo:

- identificador estable;
- entidad legal y proceso;
- propietario funcional y custodio;
- recurso empresarial relacionado;
- tipo, serie o categoría documental;
- sujetos o colectivos afectados;
- finalidad y fundamento aplicable;
- sensibilidad y restricciones;
- ubicación física o digital;
- versión, estado, vigencia y reemplazo;
- plazo, evento inicial de retención y disposición;
- obligación, contrato o política que lo sustenta;
- evidencia de creación, aprobación, acceso y disposición.

---

#### 8. Fronteras conceptuales obligatorias

```text
información ≠ dato personal ≠ documento ≠ registro ≠ evidencia ≠ archivo/blob
```

```text
tipo documental ≠ serie documental ≠ expediente ≠ carpeta ≠ ubicación de Storage
```

```text
borrador ≠ aprobado ≠ publicado ≠ vigente ≠ vencido ≠ retirado ≠ anulado
```

```text
versión nueva ≠ edición silenciosa ≠ corrección de metadatos
```

```text
usuario ≠ titular del dato ≠ trabajador ≠ cliente ≠ representante
```

```text
consentimiento ≠ aviso de privacidad ≠ finalidad ≠ obligación legal o contractual
```

```text
anonimización ≠ seudonimización ≠ bloqueo ≠ archivo ≠ eliminación
```

```text
solicitud de eliminación ≠ borrado inmediato de todo registro
```

```text
aprobación interna ≠ aceptación ≠ firma electrónica ≠ firma digital certificada
```

```text
URL firmada ≠ autorización empresarial para compartir
```

```text
historial operativo ≠ log técnico ≠ auditoría ≠ evidencia probatoria
```

```text
retención vencida ≠ eliminación automática sin revisión
```

---

#### 9. Inventario y clasificación

`INFO-DOM-001` y `INFO-DOM-002` deberán inventariar:

- bases y conjuntos de datos;
- documentos empresariales y laborales;
- contratos, facturas y soportes;
- archivos físicos originales;
- fotografías, videos, audios y grabaciones;
- datos de clientes, trabajadores, candidatos y proveedores;
- datos financieros, médicos, biométricos, geográficos y de seguridad;
- logs, exportaciones, copias locales y hojas de cálculo;
- canales y terceros que reciben información;
- responsables y encargados del tratamiento cuando aplique.

Clasificación mínima propuesta:

```text
PÚBLICA
INTERNA
CONFIDENCIAL
RESTRINGIDA
ESPECIALMENTE SENSIBLE
```

La clasificación no dependerá únicamente de la carpeta, el nombre del archivo o la aplicación. Será un atributo versionado del tipo de información y podrá elevarse para un documento concreto.

---

#### 10. Ciclo documental

El ciclo común será:

```text
plantilla o recepción
→ borrador
→ revisión
→ aprobación o rechazo
→ publicación o entrada en vigencia
→ uso y consulta
→ nueva versión o sustitución
→ vencimiento o retiro
→ archivo
→ disposición autorizada
```

Reglas:

1. una versión aprobada no se sobrescribe;
2. una corrección material genera versión o acto de corrección relacionado;
3. la versión aplicable a una fecha debe poder reconstruirse;
4. el archivo binario y sus metadatos deben mantenerse consistentes;
5. anular no significa borrar;
6. un documento retirado deja de usarse, pero conserva trazabilidad;
7. plantillas, documentos emitidos y registros recibidos son objetos diferentes.

---

#### 11. Almacenamiento, búsqueda y localización

Guardar un archivo requerirá vincularlo con:

- entidad legal;
- proceso y aplicación propietaria;
- recurso o expediente;
- tipo documental;
- actor que lo aporta;
- fecha del hecho y fecha de carga;
- versión y vigencia;
- clasificación;
- hash, tamaño, formato y validaciones;
- retención y legal hold;
- original físico, copia o representación digital.

La búsqueda deberá respetar autorización antes de indexar o devolver resultados. No se permitirá una búsqueda global que revele títulos, fragmentos, nombres o metadatos sensibles de recursos no autorizados.

---

#### 12. Datos personales y sensibles

El modelo deberá registrar por finalidad:

- titular o colectivo;
- categorías de datos;
- fuente;
- responsable y encargado;
- finalidad informada;
- autorización, obligación o fundamento aplicable;
- destinatarios;
- periodo o criterio de conservación;
- medidas y restricciones;
- canal para ejercer derechos;
- versión del aviso o política presentada.

Datos médicos, biométricos, geolocalización precisa, documentos de identidad, datos financieros, expedientes laborales, declaraciones SST y otros datos sensibles no podrán circular en eventos, logs o exportaciones generales.

La cuenta del usuario puede eliminarse o desactivarse sin que ello autorice borrar expedientes laborales, contables, transaccionales, de seguridad o auditoría sujetos a conservación. Cuando sea posible se desvinculará, anonimizará o limitará el dato sin destruir el hecho empresarial.

---

#### 13. Consentimiento, avisos y finalidad

Las políticas estáticas de ANIMA y PASS se reutilizarán como evidencia inicial, pero no serán la única fuente de verdad.

Deberá conservarse:

- versión del aviso o política;
- idioma y canal;
- finalidades aceptadas o rechazadas;
- carácter obligatorio o facultativo;
- fecha, actor y evidencia;
- cambios posteriores;
- revocaciones y restricciones;
- relación con comunicaciones comerciales.

```text
aceptar términos de servicio
≠ autorizar marketing
≠ autorizar datos sensibles
≠ autorizar una finalidad futura no informada
```

---

#### 14. Solicitudes de titulares y personas autorizadas

El caso de privacidad deberá permitir:

```text
recepción
→ validación de identidad o representación
→ clasificación de la solicitud
→ localización de sistemas y responsables
→ bloqueo o marca de reclamo cuando aplique
→ decisión y ejecución por cada sistema
→ revisión de excepciones de conservación
→ respuesta comprensible
→ evidencia y cierre
```

Tipos mínimos:

- consulta o acceso;
- copia;
- actualización;
- rectificación;
- prueba de autorización;
- información sobre uso;
- revocación;
- supresión;
- oposición o restricción cuando corresponda;
- reclamación por uso o acceso indebido.

La respuesta deberá ser legible y no exigir al titular comprender tablas, IDs internos o arquitectura técnica.

---

#### 15. Retención, archivo, legal hold y eliminación

Cada regla de retención tendrá:

- tipo o serie documental;
- entidad legal;
- evento que inicia el cómputo;
- duración y fuente de la obligación;
- archivo activo, semiactivo o histórico interno;
- disposición final;
- responsable de revisar;
- excepciones;
- periodicidad de ejecución;
- evidencia de disposición.

```text
solicitud de eliminación
→ búsqueda de obligaciones y legal holds
→ decisión por categoría de datos
→ eliminación, anonimización, bloqueo o conservación justificada
→ conciliación de copias y derivados
→ evidencia de ejecución
```

Un legal hold suspenderá la disposición sin modificar retroactivamente la regla de retención. Su creación y liberación exigirán autoridad, alcance, motivo y auditoría.

---

#### 16. Firmas y aprobaciones

Se definen cuatro niveles:

| Nivel                     | Uso                                                     | Evidencia mínima                                                        |
| ------------------------- | ------------------------------------------------------- | ----------------------------------------------------------------------- |
| aprobación interna        | decisiones operativas o administrativas                 | actor autenticado, permiso, versión, fecha, decisión y motivo           |
| aceptación                | constancia de lectura o conformidad                     | identidad, contenido presentado, acción y timestamp                     |
| firma electrónica         | vinculación confiable entre firmante y documento        | método apropiado, identidad, intención, integridad y trazabilidad       |
| firma digital certificada | casos que exijan mayor fuerza o proveedor especializado | certificado, validación, integridad, vigencia y evidencia del proveedor |

No se dibujará una firma manuscrita ni se almacenará una imagen de firma como sustituto automático de identidad, intención e integridad.

---

#### 17. Compartición, exportación y terceros

Compartir deberá registrar:

- quién autoriza;
- quién entrega;
- destinatario;
- finalidad;
- campos y documentos incluidos;
- clasificación;
- canal;
- vigencia;
- descarga o entrega cuando sea verificable;
- revocación;
- obligación de confidencialidad o contrato.

Las URLs firmadas serán cortas, revocables y vinculadas al recurso autorizado. La capacidad de generar una URL no concederá por sí sola derecho a compartir.

Los proveedores que procesen información deberán tener propietario, finalidad, categorías de datos, ubicación o región, medidas, subencargados, eliminación o devolución, incidentes, terminación y evidencia contractual.

---

#### 18. Auditoría e investigación

La auditoría transversal deberá distinguir:

- decisión de autorización;
- acceso o consulta sensible;
- descarga, impresión o exportación;
- creación, edición y cambio de metadatos;
- aprobación y firma;
- compartición;
- cambio de clasificación;
- retención, legal hold y disposición;
- acceso de emergencia;
- acciones de proveedor o cuenta técnica.

Una investigación de acceso o cambio indebido conservará:

```text
caso
→ alcance
→ preservación
→ línea de tiempo
→ actores y recursos
→ evidencia y fuentes
→ hipótesis y comprobaciones
→ hallazgo
→ acciones de contención y corrección
→ notificaciones aplicables
→ cierre y seguimiento
```

Los logs no deberán incluir secretos ni el contenido completo de datos sensibles cuando basten identificadores, hashes, categorías y resultados.

---

#### 19. Integridad, procedencia y cadena de custodia

La evidencia deberá poder demostrar:

- quién la creó, recibió o capturó;
- sobre qué recurso y proceso;
- fecha y fuente;
- archivo y hash;
- transformaciones o derivados;
- accesos y transferencias relevantes;
- versión del software o plantilla cuando aplique;
- conservación y disponibilidad;
- relación entre original físico y copia digital.

Capturas de pantalla, fotos, chats y archivos adjuntos no serán considerados evidencia suficiente por sí solos si no conservan contexto, procedencia e integridad.

---

#### 20. Obligaciones y controles de cumplimiento

`INFO-DOM-012` mantendrá un registro de obligaciones con:

- entidad legal y actividad aplicable;
- fuente normativa, contractual o interna;
- obligación;
- propietario;
- control;
- evidencia;
- frecuencia;
- fecha límite;
- estado;
- excepción o incumplimiento;
- acción correctiva.

El sistema no determinará por sí solo que Vento cumple una norma. Mostrará la obligación, la evidencia disponible, las brechas y la validación responsable.

---

#### 21. Experiencia simple

La experiencia principal deberá evitar formularios jurídicos o técnicos extensos.

Pantallas objetivo:

```text
Gobierno de información
Documentos
Solicitudes de privacidad
Retención y disposición
Aprobaciones y firmas
Auditoría e investigaciones
```

Reglas de UX:

- lenguaje humano antes que nombres de tablas o políticas;
- acciones principales visibles y detalles bajo demanda;
- clasificación sugerida, pero confirmada por regla y propietario;
- advertencias concretas al compartir, exportar o eliminar;
- vista clara de versión vigente;
- respuesta al titular en formato comprensible;
- ocultamiento de datos sensibles hasta abrir el detalle autorizado;
- ninguna explicación larga permanente en la pantalla cotidiana.

---

#### 22. Privacidad, seguridad y cumplimiento por diseño

Toda capacidad nueva deberá especificar antes de implementarse:

- finalidad y minimización;
- campos necesarios;
- autorización y alcance;
- exposición en interfaz, API, eventos, logs y exportaciones;
- retención y disposición;
- evidencia de consentimiento o fundamento;
- riesgos de terceros;
- comportamiento offline;
- restauración y copias;
- pruebas de acceso negativo;
- respuesta ante incidentes.

Las decisiones de privacidad no se dejarán exclusivamente a textos legales publicados; deberán materializarse en contratos de datos, permisos, RLS, Storage, eventos y pruebas.

---

#### 23. Evidencia de implementación actual

Se reconoce como base reutilizable:

- `EVID-ARC-001` a `EVID-ARC-010`, que ya reservan inventario, propiedad, sensibilidad, metadatos, versiones, retención, validación, URLs firmadas, auditoría y eliminación;
- ANIMA, que ya presenta y permite cargar documentos laborales, tipos, vencimientos y filtros;
- políticas de privacidad y páginas de eliminación de cuenta en ANIMA y PASS;
- flujo auditado de solicitud de eliminación en PASS;
- decisiones y logs de autorización previstos por `AUTH-CTX`, `AUTH-DB` y `TREQ-AUTH-015`;
- documentos, exportaciones y evidencias distribuidos en las aplicaciones de dominio.

Estas piezas no demuestran todavía:

- inventario corporativo completo;
- finalidad y responsable por tratamiento;
- retención por tipo documental;
- legal hold;
- versión canónica de consentimiento;
- atención transversal de titulares;
- firma por nivel de riesgo;
- investigación integral de acceso o modificación;
- eliminación reconciliada entre sistemas, copias y derivados.

---

#### 24. Preguntas y decisiones pendientes

No se crean preguntas nuevas.

Se reutilizan:

- `ADM-13` — confirma que existen documentos empresariales originales en Oficina 1;
- `ACT-14` — custodio habitual de documentos originales, todavía pendiente;
- `DAT-18` y `DAT-19` — ubicación de instrucciones importantes y mecanismo de corrección;
- `EXT-06` a `EXT-09` — documentos vigentes sobre uso de marcas;
- `TEC-17` — exportaciones existentes por aplicación;
- `DIF-12` — propiedad documental por hecho respaldado, ya resuelta funcionalmente.

Las respuestas se consolidarán posteriormente en lote dentro del registro vivo. Ninguna pregunta queda sin tarea propietaria: `INFO-DOM-001`, `INFO-DOM-003`, `INFO-DOM-006`, `INFO-DOM-012` e `INFO-INT-002` resolverán su efecto documental.

---

#### 25. Hallazgos

| ID                  | Hallazgo                                                                                                                                            | Severidad | Tarea propietaria                             | Puerta |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | --------------------------------------------- | ------ |
| H-CAP-SCOPE-016-001 | No existe un modelo corporativo único de gobierno de información que conecte datos, documentos, evidencia, privacidad y cumplimiento.               | crítica   | INFO-DOM-001; INFO-INT-002                    | E1/E2  |
| H-CAP-SCOPE-016-002 | No existe inventario completo de activos de información, bases, finalidades, propietarios, responsables, encargados y destinatarios.                | crítica   | INFO-DOM-001; INFO-DOM-008; INFO-DOM-010      | E1/E2  |
| H-CAP-SCOPE-016-003 | La sensibilidad puede depender de permisos o carpetas sin una clasificación canónica versionada.                                                    | crítica   | INFO-DOM-002; INFO-AUTH-001                   | E2/E3  |
| H-CAP-SCOPE-016-004 | Información, documento, registro, evidencia, archivo y expediente pueden confundirse.                                                               | alta      | INFO-DOM-003; INFO-INT-002                    | E2     |
| H-CAP-SCOPE-016-005 | Los archivos están distribuidos entre aplicaciones y Storage sin metadatos y vínculos uniformes.                                                    | crítica   | INFO-DOM-005; EVID-ARC-004                    | E2/E3  |
| H-CAP-SCOPE-016-006 | Un archivo puede existir sin entidad legal, proceso, recurso, propietario o tipo documental claramente resuelto.                                    | crítica   | INFO-DOM-003; INFO-DOM-005                    | E2/E3  |
| H-CAP-SCOPE-016-007 | El borrado directo de archivo o fila puede eludir retención, legal hold, evidencia y conciliación de copias.                                        | crítica   | INFO-DOM-006; INFO-AUTH-003; INFO-UX-005      | E2/E3  |
| H-CAP-SCOPE-016-008 | Versiones, vigencia, sustitución, anulación y retiro no tienen contrato transversal.                                                                | crítica   | INFO-DOM-004; INFO-UX-002                     | E2/E3  |
| H-CAP-SCOPE-016-009 | La aprobación documental no está estandarizada entre aplicaciones.                                                                                  | alta      | INFO-DOM-004; INFO-DOM-011; INFO-UX-003       | E2     |
| H-CAP-SCOPE-016-010 | Una URL firmada puede confundirse con autorización empresarial para compartir.                                                                      | crítica   | INFO-DOM-010; INFO-AUTH-002; EVID-ARC-007     | E2/E4  |
| H-CAP-SCOPE-016-011 | Las políticas de privacidad existen de forma estática y separada en ANIMA y PASS.                                                                   | alta      | INFO-DOM-008; INFO-INT-002                    | E1/E2  |
| H-CAP-SCOPE-016-012 | No existe registro transversal comprobado de versión de aviso, finalidades y prueba de autorización.                                                | crítica   | INFO-DOM-008; INFO-AUTH-001                   | E2/E3  |
| H-CAP-SCOPE-016-013 | Consentimiento general, marketing, datos sensibles y aceptación contractual pueden mezclarse.                                                       | crítica   | INFO-DOM-008; INFO-DOM-010                    | E2/E3  |
| H-CAP-SCOPE-016-014 | Las solicitudes de acceso, corrección, revocación o supresión no tienen un caso transversal y reconciliable.                                        | crítica   | INFO-DOM-009; INFO-UX-004                     | E2/E3  |
| H-CAP-SCOPE-016-015 | Cuenta, identidad, titular y expediente pueden confundirse al eliminar o desactivar.                                                                | crítica   | INFO-DOM-009; INFO-DOM-006; INFO-AUTH-003     | E2/E3  |
| H-CAP-SCOPE-016-016 | La eliminación de cuenta de cliente es una base parcial, pero no demuestra disposición en todos los dominios y copias.                              | crítica   | INFO-DOM-006; INFO-DOM-009; INFO-INT-002      | E2/E3  |
| H-CAP-SCOPE-016-017 | Un retiro laboral podría interpretarse erróneamente como permiso para borrar documentos y auditoría sujetos a conservación.                         | crítica   | INFO-DOM-006; CAP-SCOPE-002; INFO-AUTH-003    | E2     |
| H-CAP-SCOPE-016-018 | No existen tablas de retención corporativas versionadas por entidad y tipo documental.                                                              | crítica   | INFO-DOM-006; INFO-DOM-012                    | E1/E2  |
| H-CAP-SCOPE-016-019 | El evento que inicia el término de retención puede no estar definido.                                                                               | alta      | INFO-DOM-006                                  | E2     |
| H-CAP-SCOPE-016-020 | No existe legal hold canónico para suspender disposición por investigación, litigio o requerimiento.                                                | crítica   | INFO-DOM-006; INFO-AUTH-003; INFO-UX-005      | E2/E3  |
| H-CAP-SCOPE-016-021 | Anonimización, seudonimización, bloqueo, archivo y eliminación pueden tratarse como equivalentes.                                                   | crítica   | INFO-DOM-006; INFO-DOM-009                    | E2/E3  |
| H-CAP-SCOPE-016-022 | Proveedores que reciben datos o documentos no tienen inventario transversal de finalidad, ubicación, subencargados y terminación.                   | crítica   | INFO-DOM-010; INFO-INT-003                    | E1/E2  |
| H-CAP-SCOPE-016-023 | Las exportaciones pueden producir copias fuera de control sin destinatario, finalidad, expiración ni revocación.                                    | crítica   | INFO-DOM-010; INFO-AUTH-002; INFO-UX-006      | E2/E3  |
| H-CAP-SCOPE-016-024 | Datos médicos, biométricos, geográficos, financieros y documentos de identidad requieren controles más estrictos que los datos internos ordinarios. | crítica   | INFO-DOM-002; INFO-AUTH-001; INFO-AUTH-002    | E2/E3  |
| H-CAP-SCOPE-016-025 | Los logs y auditorías están distribuidos y no comparten un modelo común de actor, recurso, motivo, decisión y correlación.                          | crítica   | INFO-DOM-013; INFO-INT-002                    | E2/E3  |
| H-CAP-SCOPE-016-026 | Consultas, descargas, impresiones y exportaciones sensibles pueden no quedar auditadas uniformemente.                                               | crítica   | INFO-DOM-013; INFO-AUTH-004                   | E2/E3  |
| H-CAP-SCOPE-016-027 | Logs, tickets, capturas y eventos pueden exponer secretos o contenido personal innecesario.                                                         | crítica   | INFO-AUTH-004; TI-AUTH-004                    | E2/E4  |
| H-CAP-SCOPE-016-028 | Un log mutable o sin protección de integridad puede no servir para investigación confiable.                                                         | crítica   | INFO-DOM-007; INFO-DOM-013; TREQ-SUPABASE-013 | E3     |
| H-CAP-SCOPE-016-029 | Aprobación, aceptación, firma electrónica e imagen de firma pueden confundirse.                                                                     | crítica   | INFO-DOM-011; INFO-UX-003                     | E2     |
| H-CAP-SCOPE-016-030 | No existe estándar transversal de hash, timestamp, procedencia y transformación para evidencia.                                                     | crítica   | INFO-DOM-007; EVID-ARC-006                    | E2/E3  |
| H-CAP-SCOPE-016-031 | Los accesos o cambios indebidos no tienen expediente de investigación común y preservación coordinada.                                              | crítica   | INFO-DOM-013; INFO-UX-006; INFO-AUTH-004      | E2/E3  |
| H-CAP-SCOPE-016-032 | Requerimientos de autoridades o entregas regulatorias pueden ejecutarse sin alcance, aprobación y evidencia uniforme.                               | crítica   | INFO-DOM-010; INFO-DOM-012; INFO-INT-003      | E2/E3  |
| H-CAP-SCOPE-016-033 | Los originales físicos y sus copias digitales no tienen cadena de custodia y correspondencia transversal comprobada.                                | alta      | INFO-DOM-003; INFO-DOM-007                    | E1/E2  |
| H-CAP-SCOPE-016-034 | Captura offline, reintento o reemplazo puede duplicar archivos, versiones, firmas o disposiciones.                                                  | crítica   | INFO-DOM-004; INFO-DOM-007; INFO-INT-001      | E3/E4  |
| H-CAP-SCOPE-016-035 | Las obligaciones de cumplimiento no tienen registro común de propietario, control, evidencia, frecuencia y brecha.                                  | crítica   | INFO-DOM-012; INFO-UX-001                     | E1/E2  |

---

#### 26. Tareas nuevas derivadas

| ID            | Tarea                                                                                                                         | Bloque                                             | Momento                                                                |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- | ---------------------------------------------------------------------- |
| INFO-DOM-001  | Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios     | BLOQUE AA — Gobierno de información / dominio      | Primera tarea del bloque, antes de clasificación o diseño de pantallas |
| INFO-DOM-002  | Definir clasificación, sensibilidad, minimización y manejo por categoría de información                                       | BLOQUE AA — Gobierno de información / dominio      | Después de INFO-DOM-001                                                |
| INFO-DOM-003  | Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias                               | BLOQUE AA — Gobierno de información / dominio      | Después de INFO-DOM-001 y coordinada con EVID-ARC                      |
| INFO-DOM-004  | Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro                                       | BLOQUE AA — Gobierno de información / dominio      | Después de INFO-DOM-003                                                |
| INFO-DOM-005  | Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales                                | BLOQUE AA — Gobierno de información / dominio      | Después de INFO-DOM-002 a INFO-DOM-004                                 |
| INFO-DOM-006  | Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición | BLOQUE AA — Gobierno de información / dominio      | Después del inventario y antes de ejecutar eliminación real            |
| INFO-DOM-007  | Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia                             | BLOQUE AA — Gobierno de información / dominio      | Coordinada con EVID-ARC y arquitectura de Supabase                     |
| INFO-DOM-008  | Definir avisos, finalidades, autorizaciones, fundamentos, consentimiento, revocación y datos sensibles                        | BLOQUE AA — Gobierno de información / dominio      | Antes de ampliar captura o uso de datos personales                     |
| INFO-DOM-009  | Definir consultas, reclamos y solicitudes de acceso, rectificación, prueba, revocación y supresión                            | BLOQUE AA — Gobierno de información / dominio      | Después de INFO-DOM-008                                                |
| INFO-DOM-010  | Definir compartición, exportación, divulgación, terceros, encargados, transferencias y requerimientos de autoridad            | BLOQUE AA — Gobierno de información / dominio      | Antes de nuevas exportaciones o integraciones externas                 |
| INFO-DOM-011  | Definir aprobación, aceptación, firma electrónica, firma digital y niveles de evidencia                                       | BLOQUE AA — Gobierno de información / dominio      | Antes de implementar firmas o aceptar documentos vinculantes           |
| INFO-DOM-012  | Crear registro de obligaciones, controles, evidencias, responsables, frecuencias y brechas de cumplimiento                    | BLOQUE AA — Gobierno de información / dominio      | Después del inventario y con validación responsable                    |
| INFO-DOM-013  | Definir auditoría, investigación de accesos o cambios indebidos, preservación y cierre                                        | BLOQUE AA — Gobierno de información / dominio      | Después de INFO-DOM-002 y INFO-DOM-007                                 |
| INFO-AUTH-001 | Proteger información por clasificación, finalidad, identidad, relación, recurso, territorio y estado                          | BLOQUE AA — Gobierno de información / autorización | Antes de exponer bibliotecas, búsqueda o solicitudes                   |
| INFO-AUTH-002 | Proteger datos sensibles, descargas, impresiones, exportaciones, compartición y URLs firmadas                                 | BLOQUE AA — Gobierno de información / autorización | Antes de habilitar acciones masivas o externas                         |
| INFO-AUTH-003 | Segregar creación, revisión, aprobación, firma, retención, legal hold, disposición y eliminación                              | BLOQUE AA — Gobierno de información / autorización | Antes de mutaciones documentales sensibles                             |
| INFO-AUTH-004 | Proteger auditoría, investigaciones, accesos de emergencia, logs y evidencia preservada                                       | BLOQUE AA — Gobierno de información / autorización | Antes de habilitar consola de auditoría                                |
| INFO-UX-001   | Diseñar tablero simple de gobierno, obligaciones, alertas, solicitudes y brechas                                              | BLOQUE AA — Gobierno de información / experiencia  | Después de INFO-DOM-001 y INFO-DOM-012                                 |
| INFO-UX-002   | Diseñar biblioteca documental con búsqueda autorizada, expediente, versión y vigencia                                         | BLOQUE AA — Gobierno de información / experiencia  | Después de INFO-DOM-003 a INFO-DOM-005                                 |
| INFO-UX-003   | Diseñar creación, revisión, aprobación, publicación y firma de documentos                                                     | BLOQUE AA — Gobierno de información / experiencia  | Después de INFO-DOM-004 y INFO-DOM-011                                 |
| INFO-UX-004   | Diseñar portal y caso de solicitudes de privacidad para trabajadores y clientes                                               | BLOQUE AA — Gobierno de información / experiencia  | Después de INFO-DOM-008 y INFO-DOM-009                                 |
| INFO-UX-005   | Diseñar retención, legal hold, archivo y disposición controlada                                                               | BLOQUE AA — Gobierno de información / experiencia  | Después de INFO-DOM-006 y INFO-AUTH-003                                |
| INFO-UX-006   | Diseñar explorador de auditoría e investigación con divulgación progresiva                                                    | BLOQUE AA — Gobierno de información / experiencia  | Después de INFO-DOM-013 y INFO-AUTH-004                                |
| INFO-INT-001  | Definir adaptadores de Storage, escaneo, OCR, firma, certificación, preservación y archivo externo                            | BLOQUE AA — Gobierno de información / integración  | Antes de conectar servicios externos                                   |
| INFO-INT-002  | Definir contratos con SHELL, Supabase, EVID-ARC, ANIMA, VISO, PASS y aplicaciones de dominio                                  | BLOQUE AA — Gobierno de información / integración  | Antes de implementar modelo transversal                                |
| INFO-INT-003  | Definir contratos con encargados, asesores, autoridades, proveedores y destinatarios externos                                 | BLOQUE AA — Gobierno de información / integración  | Antes de compartir datos o documentos con terceros                     |

---

#### 27. Ubicación exacta de tareas nuevas

Crear el archivo:

```text
docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/00_BLOQUE_AA.md
```

Agregar su ruta en `docs/plan-canonico/modular/manifest.json` después de:

```text
bloques/Z_TECNOLOGIA_Y_SOPORTE/00_BLOQUE_Z.md
```

El nuevo bloque contendrá, en este orden:

1. `INFO-DOM-001` a `INFO-DOM-013`;
2. `INFO-AUTH-001` a `INFO-AUTH-004`;
3. `INFO-UX-001` a `INFO-UX-006`;
4. `INFO-INT-001` a `INFO-INT-003`.

No se trasladarán ni duplicarán `EVID-ARC-*`, `AUTH-*`, tareas documentales de ANIMA/PASS o auditorías de cada aplicación. BLOQUE AA las coordinará mediante contratos y dependencias.

---

#### 28. Requisitos de prueba generados

El registro `04A` completo incorpora:

```text
TREQ-SHELL-011
TREQ-SUPABASE-013
TREQ-ANIMA-005
TREQ-VISO-003
TREQ-PASS-012
TREQ-INTEGRATION-021
```

- `TREQ-SHELL-011` protege clasificación, finalidad, acceso, búsqueda, compartición y exportación autorizada.
- `TREQ-SUPABASE-013` protege documentos, versiones, integridad, retención, legal hold, disposición y auditoría física.
- `TREQ-ANIMA-005` protege privacidad, documentos laborales, solicitudes y conservación del trabajador.
- `TREQ-VISO-003` protege cumplimiento, solicitudes, aprobaciones, auditoría e investigaciones.
- `TREQ-PASS-012` protege consentimiento, derechos, eliminación y comunicaciones del cliente.
- `TREQ-INTEGRATION-021` protege el ciclo transversal entre aplicaciones, Storage, proveedores y copias externas.

---

#### 29. Dependencias principales

- `CAP-SCOPE-002`: identidad laboral, retiro y conservación de expedientes;
- `CAP-SCOPE-003`: SST, salud y datos especialmente sensibles;
- `CAP-SCOPE-009`: pedidos, clientes, pagos y documentos comerciales;
- `CAP-SCOPE-012`: documentos financieros, contables, tributarios y cartera;
- `CAP-SCOPE-014`: consentimiento y comunicaciones comerciales;
- `CAP-SCOPE-015`: logs, soporte, secretos e incidentes técnicos;
- `CAP-SCOPE-018`: incidentes de seguridad, continuidad, respaldo y recuperación;
- `EVID-ARC-001` a `EVID-ARC-010`: archivos, documentos y evidencia;
- bloques `AUTH`, `E3`, `E4`, `E5`, `T` y `U`;
- propietarios funcionales de todas las aplicaciones.

---

#### 30. Criterios de aceptación

`CAP-SCOPE-016` podrá aprobarse cuando:

- las once subcapacidades estén clasificadas;
- la propiedad del hecho, del documento, del archivo y de la política transversal esté separada;
- información, dato, documento, registro, evidencia y archivo estén diferenciados;
- exista modelo para finalidad, sensibilidad, consentimiento y derechos;
- retención, legal hold, anonimización y eliminación no se confundan;
- aprobación, firma electrónica y firma digital estén separadas;
- las URLs firmadas no se interpreten como autorización suficiente;
- auditoría e investigación tengan integridad y preservación;
- cada hallazgo tenga tarea y puerta de resolución;
- los seis `TREQ` estén incorporados en el `04A` completo;
- no se fijen plazos legales universales sin validación por tipo documental;
- no se autorice eliminación, acceso, firma o investigación real;
- `CAP-SCOPE-017` permanezca como continuidad inmediata.

---

#### 31. Lo que esta tarea no autoriza

- crear o cambiar políticas legales vigentes;
- declarar cumplimiento normativo;
- eliminar, anonimizar, bloquear o archivar datos reales;
- destruir documentos físicos;
- crear legal holds reales;
- responder solicitudes reales de titulares;
- firmar o aprobar documentos vinculantes;
- contratar proveedores de firma, OCR, archivo o privacidad;
- abrir investigaciones sobre personas;
- exportar datos o entregar información a terceros;
- modificar Storage, RLS, tablas, triggers o logs;
- iniciar `CAP-SCOPE-017`.

---

#### 32. Resultado y continuidad

Al aprobarse quedará definida la cadena:

```text
información y finalidad identificadas
→ clasificación y propietario
→ documento, registro o evidencia vinculados
→ acceso y uso autorizados
→ versión, aprobación y vigencia
→ conservación y solicitudes
→ archivo o disposición controlada
→ auditoría e investigación
```

La continuidad será exclusivamente:

```text
CAP-SCOPE-017
— Evaluar analítica, indicadores y datos maestros
```

---

#### 33. Estado de aprobación

```text
PROPUESTA PARA APROBACIÓN — APROBADA
```

No deberá marcarse como aprobada hasta que el usuario responda expresamente `APROBADO`.


### ✅ CAP-SCOPE-017 — Evaluar analítica, indicadores y datos maestros

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-016` aprobada  
**Tarea anterior:** `CAP-SCOPE-016`  
**Siguiente tarea reservada:** `CAP-SCOPE-018`  
**Familia evaluada:** `CAP-17 — Medir, analizar y mejorar`  
**Superficies objetivo:** todas las aplicaciones Vento OS, Supabase, fuentes externas, reportes, tableros, exportaciones y modelos analíticos  
**Implementación técnica:** no autorizada  
**Modificación de métricas, metas o datos reales:** no autorizada  
**Requisitos generados:** `TREQ-DATA-001` a `TREQ-DATA-005` y `TREQ-INTEGRATION-022`  
**Tareas nuevas derivadas:** `DATA-DOM-001` a `017`, `DATA-AUTH-001` a `004`, `DATA-UX-001` a `008`, `DATA-INT-001` a `004`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas  

---

#### 1. Propósito

Definir el modelo empresarial objetivo para que Vento Group pueda medir, explicar y mejorar su operación utilizando datos confiables, definiciones comunes y decisiones trazables.

La tarea deberá permitir responder de forma inequívoca:

```text
qué ocurrió
cuándo ocurrió
qué entidad, marca, sede, área, canal, producto o actor estuvo involucrado
qué fuente conserva el hecho original
qué definición y versión utiliza cada indicador
qué calidad y frescura tiene la información
por qué cambió un resultado
qué decisión debe tomarse
qué acción se ejecutó
si la acción produjo la mejora esperada
```

No se busca crear un tablero lleno de cifras ni una base paralela que copie todos los datos. La analítica deberá reducir ambigüedad, orientar una decisión concreta y permitir llegar desde el resultado agregado hasta los hechos que lo explican.

---

#### 2. Decisión principal y propiedad

```text
APLICACIONES DE DOMINIO
→ conservan sus datos maestros propietarios
→ conservan los hechos y estados operativos
→ exponen contratos de lectura o eventos

SUPABASE / E3
→ gobierna arquitectura, fuentes de verdad, calidad física,
  historial, rendimiento y contratos de datos

BLOQUE AB — ANALÍTICA Y DATOS MAESTROS
→ gobierna datos maestros federados, capa semántica,
  métricas, calidad analítica, reportes, diagnóstico y mejora

VISO
→ presenta visión ejecutiva transversal,
  seguimiento de objetivos y acciones de mejora

NUMERA
→ presenta analítica económica, financiera,
  de costos, rentabilidad, presupuesto y escenarios

CADA APLICACIÓN
→ presenta la analítica operativa necesaria para su proceso
```

No se crea una aplicación analítica monolítica ni un nuevo dueño de todos los datos.

La propiedad será federada:

```text
DATO MAESTRO O HECHO
→ conserva un propietario de dominio

DEFINICIÓN ANALÍTICA
→ conserva un propietario empresarial

IMPLEMENTACIÓN DE CÁLCULO
→ conserva un propietario técnico

CERTIFICACIÓN DE CALIDAD
→ conserva un responsable independiente o autorizado
```

---

#### 3. Evidencia y estado actual

La implementación actual contiene piezas útiles pero dispersas:

- ANIMA ya calcula turnos programados y atendidos, tardanzas, ausencias, incidencias, minutos y tasas de asistencia y puntualidad;
- NUMERA ya reserva tareas para costos, rentabilidad, reportes, indicadores, exportaciones, escenarios y un visor económico;
- NEXO contiene catálogo maestro de productos, presentaciones, proveedores relacionados, políticas, rutas, sedes y configuraciones;
- varias pantallas calculan KPI locales para apoyar una operación específica;
- E3 ya exige propiedad de fuentes de verdad, arquitectura de vistas y RPC, auditoría, rendimiento y contratos entre dominios;
- E3 también reserva una auditoría específica de normalización, duplicados semánticos, valores mostrados, valores de búsqueda y valores externos originales.

La existencia de estas piezas no demuestra todavía:

- que dos aplicaciones calculen igual el mismo indicador;
- que los nombres de las métricas tengan significado común;
- que cada dato maestro tenga propietario, steward y ciclo de vida;
- que se pueda reproducir un reporte histórico;
- que la calidad y frescura sean visibles;
- que una señal termine en una acción y una comprobación de resultado.

---

#### 4. Alcance evaluado

- `CAP-17.01` — Definir medidas e indicadores;
- `CAP-17.02` — Recopilar información;
- `CAP-17.03` — Verificar calidad de información;
- `CAP-17.04` — Preparar reportes;
- `CAP-17.05` — Analizar ventas y demanda;
- `CAP-17.06` — Analizar inventario y abastecimiento;
- `CAP-17.07` — Analizar producción y rendimiento;
- `CAP-17.08` — Analizar servicio y clientes;
- `CAP-17.09` — Analizar costos y rentabilidad;
- `CAP-17.10` — Identificar problemas y oportunidades;
- `CAP-17.11` — Definir y seguir acciones de mejora;
- `CAP-17.12` — Comprobar resultados.

El título de esta tarea también exige evaluar datos maestros porque toda comparación transversal depende de identidades, jerarquías y dimensiones comunes.

---

#### 5. Clasificación de cobertura

| Subcapacidad | Nombre                                | Tratamiento       | Propietaria objetivo                       | Decisión                                                                                                                                                                                    |
| ------------ | ------------------------------------- | ----------------- | ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CAP-17.01    | Definir medidas e indicadores         | BUILD             | BLOQUE AB + propietarios empresariales     | Construir registro canónico versionado de métricas, KPI, drivers, guardrails, fórmulas, granularidad, dimensiones, periodos, fuentes, calidad, responsables y decisiones asociadas.         |
| CAP-17.02    | Recopilar información                 | REUSE_OR_REFACTOR | aplicaciones propietarias + E3 + BLOQUE AB | Reutilizar tablas, eventos, importaciones y vistas existentes; formalizar contratos de ingestión, tiempos, claves, versiones, backfills, reconciliación y linaje.                           |
| CAP-17.03    | Verificar calidad de información      | REUSE_OR_REFACTOR | E3 + BLOQUE AB + stewards                  | Reutilizar auditorías de normalización y calidad; añadir certificación por uso, frescura, cobertura, integridad, cuarentena, degradación y remediación.                                     |
| CAP-17.04    | Preparar reportes                     | REUSE_OR_REFACTOR | VISO, NUMERA y aplicaciones propietarias   | Consolidar reportes parciales bajo un contrato común de versión, corte, filtros, fuente, calidad, snapshot, exportación y reproducción.                                                     |
| CAP-17.05    | Analizar ventas y demanda             | REUSE_OR_REFACTOR | PULSO + AURA + NUMERA                      | Reutilizar ventas, pedidos, precios, promociones y canales; diseñar análisis de demanda, mezcla, conversión, frecuencia, estacionalidad y rentabilidad sin confundir correlación con causa. |
| CAP-17.06    | Analizar inventario y abastecimiento  | REUSE_OR_REFACTOR | NEXO + ORIGO + NUMERA                      | Reutilizar existencias, movimientos, compras, proveedores y remisiones; consolidar disponibilidad, cobertura, rotación, faltantes, vencimientos, cumplimiento y costo.                      |
| CAP-17.07    | Analizar producción y rendimiento     | REUSE_OR_REFACTOR | FOGO + NEXO + NUMERA                       | Reutilizar recetas, lotes, consumos, salidas y mermas; consolidar capacidad, adherencia, rendimiento, variación, calidad y costo.                                                           |
| CAP-17.08    | Analizar servicio y clientes          | REUSE_OR_REFACTOR | PASS + PULSO + AURA + VISO                 | Reutilizar pedidos, feedback, reclamos, fidelización, reputación y reservas; consolidar servicio, recurrencia, satisfacción, resolución y valor del cliente con privacidad.                 |
| CAP-17.09    | Analizar costos y rentabilidad        | REUSE_OR_REFACTOR | NUMERA                                     | Reutilizar el alcance financiero y el visor económico; asegurar trazabilidad, escenarios separados, moneda, periodos, centros de costo y conciliación.                                      |
| CAP-17.10    | Identificar problemas y oportunidades | BUILD             | BLOQUE AB + VISO + propietarios            | Construir diagnóstico transversal, detección de variaciones y anomalías, oportunidades explicables, impacto, confianza, restricciones y ruta de investigación.                              |
| CAP-17.11    | Definir y seguir acciones de mejora   | BUILD             | VISO + propietarios funcionales            | Construir ciclo de acción con hipótesis, responsable, línea base, meta, drivers, guardrails, plazo, estado, evidencia y efectos no deseados.                                                |
| CAP-17.12    | Comprobar resultados                  | BUILD             | BLOQUE AB + propietarios + VISO            | Construir evaluación posterior que compare línea base, meta, ventana, segmentos, calidad, guardrails, confianza y aprendizaje; permitir cerrar, iterar, revertir o escalar.                 |

---

#### 6. Resumen de clasificación

| Tratamiento       | Cantidad |
| ----------------- | -------: |
| REUSE_OR_REFACTOR |        8 |
| BUILD             |        4 |
| TOTAL             |       12 |

---

#### 7. Modelo canónico de datos y analítica

```text
DATO MAESTRO
→ identifica entidades relativamente estables

DATO DE REFERENCIA
→ define códigos, listas y clasificaciones controladas

HECHO O EVENTO
→ registra algo que ocurrió

SNAPSHOT
→ conserva el estado observado en un momento

MÉTRICA
→ aplica una definición a hechos y dimensiones

KPI
→ métrica priorizada para una decisión y objetivo

DRIVER
→ explica o anticipa movimiento del KPI

GUARDRAIL
→ evita mejorar el KPI dañando otra dimensión

REPORTE O TABLERO
→ presenta métricas para una decisión

ACCIÓN DE MEJORA
→ modifica el proceso y luego comprueba el resultado
```

La capa analítica no podrá corregir un hecho operativo. Toda corrección deberá regresar al dominio propietario o registrarse como restatement analítico explícito.

---

#### 8. Fronteras conceptuales obligatorias

```text
dato maestro ≠ dato de referencia ≠ transacción ≠ evento ≠ snapshot
```

```text
métrica ≠ KPI ≠ meta ≠ umbral ≠ alerta
```

```text
numerador ≠ denominador ≠ porcentaje ≠ puntos porcentuales
```

```text
fecha del hecho ≠ fecha empresarial ≠ fecha de carga ≠ fecha de actualización
```

```text
cero ≠ nulo ≠ no aplica ≠ desconocido ≠ no recibido ≠ pendiente
```

```text
vista en vivo ≠ snapshot publicado ≠ reporte oficial ≠ exportación
```

```text
real ≠ presupuestado ≠ pronosticado ≠ simulado ≠ propuesto
```

```text
correlación ≠ causalidad ≠ hipótesis validada
```

```text
alerta ≠ diagnóstico ≠ acción ≠ resultado
```

```text
dashboard ≠ fuente de verdad
```

---

#### 9. Gobierno federado de datos maestros

No se construirá una tabla maestra universal que sustituya todos los dominios.

Cada objeto compartido tendrá:

- identificador canónico estable;
- propietario funcional;
- steward o responsable de calidad;
- sistema fuente;
- claves empresariales y técnicas;
- códigos externos y aliases;
- jerarquías y relaciones;
- estado y vigencia;
- atributos que cada dominio puede administrar;
- reglas de alta, corrección, fusión, separación y retiro;
- historial efectivo;
- consumidores y contratos;
- controles de calidad;
- crosswalks con sistemas externos.

Distribución objetivo inicial:

| Familia de datos                                                 | Propietaria objetivo                        | Observación                                                                        |
| ---------------------------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------- |
| entidades legales, marcas, sedes y áreas                         | dominio organizacional administrado en VISO | NUMERA y otras aplicaciones consumen la identidad; no crean copias independientes. |
| trabajadores, roles y asignaciones                               | VISO                                        | ANIMA conserva hechos laborales y de asistencia, no redefine la identidad maestra. |
| clientes, cuentas, contactos y consentimientos                   | PASS                                        | PULSO y AURA consumen proyecciones mínimas autorizadas.                            |
| productos, categorías, unidades, presentaciones, LOC y activos   | NEXO                                        | FOGO, ORIGO, PULSO y NUMERA referencian la identidad canónica.                     |
| proveedores y condiciones comerciales                            | ORIGO                                       | El producto relacionado conserva identidad NEXO.                                   |
| recetas, procesos, rutas y recursos productivos                  | FOGO                                        | Las salidas e insumos se relacionan con productos NEXO.                            |
| oferta, canales, precios de venta, pedidos y ventas              | PULSO                                       | Costos y rentabilidad se calculan en NUMERA.                                       |
| centros de costo, monedas, periodos y clasificaciones económicas | NUMERA                                      | No sustituyen empresa, sede, marca ni canal.                                       |
| campañas, audiencias y activos de marca                          | AURA, si continúa                           | Clientes y consentimientos continúan en PASS.                                      |
| servicios tecnológicos y endpoints                               | BLOQUE Z con SHELL y NEXO                   | Se separa activo físico, endpoint, dispositivo compartido y servicio.              |

La propiedad podrá dividirse por atributos cuando se documente explícitamente. La división no permitirá que dos dominios editen el mismo atributo sin contrato de precedencia.

---

#### 10. Identidad, fusión y ciclo de vida maestro

Estados mínimos:

```text
PROPUESTO
→ ACTIVO
→ DEPRECADO
→ RETIRADO
```

Estados especiales:

```text
DUPLICADO CONFIRMADO
FUSIONADO
SEPARADO
SUSTITUIDO
BLOQUEADO
```

Reglas:

- una coincidencia textual no autoriza fusión;
- toda fusión revisará relaciones, movimientos, documentos, integraciones e historia;
- la fusión conservará los identificadores anteriores como aliases;
- la separación deberá reconstruir relaciones cuando sea técnicamente posible;
- retirar un maestro impedirá usos nuevos, pero no borrará hechos históricos;
- un cambio de nombre no cambiará la identidad;
- los códigos externos tendrán fuente, vigencia y unicidad contextual;
- las jerarquías conservarán vigencia para reproducir reportes históricos.

---

#### 11. Registro canónico de métricas

Cada métrica deberá conservar como mínimo:

- identificador y nombre empresarial;
- descripción en lenguaje no técnico;
- decisión que apoya;
- propietario empresarial y técnico;
- fórmula;
- numerador y denominador;
- granularidad o grain;
- dimensiones permitidas;
- inclusiones y exclusiones;
- unidad, moneda y precisión;
- calendario, zona horaria y fecha empresarial;
- fuente de verdad y tablas o eventos derivados;
- tratamiento de anulaciones, devoluciones y correcciones;
- tratamiento de datos tardíos y periodos abiertos;
- frecuencia de actualización;
- calidad mínima y estado de certificación;
- versión y vigencia;
- ruta de drill-down;
- restricciones de privacidad;
- meta, drivers y guardrails cuando sea KPI.

Regla obligatoria:

```text
MISMA MÉTRICA + MISMA VERSIÓN + MISMO CONTEXTO + MISMO CORTE
→ MISMO RESULTADO
```

La implementación SQL, vista, RPC o modelo podrá cambiar sin alterar el significado. Un cambio de significado exigirá una versión nueva.

---

#### 12. Jerarquía de indicadores

Cada tablero de decisión deberá priorizar:

```text
1 a 3 KPI PRINCIPALES
→ resultado que cambia la decisión

1 a 2 DRIVERS por KPI
→ variables accionables que explican el movimiento

1 a 2 GUARDRAILS
→ límites que evitan daño a calidad, servicio, seguridad, margen o personas
```

No se aprobará un KPI porque sea fácil de mostrar.

Un indicador deberá:

- representar el resultado buscado o declarar que es proxy;
- cambiar una decisión real;
- producir señal con la cadencia de revisión;
- tener palancas controlables o drivers relacionados;
- ser medible sin trabajo manual recurrente;
- ser difícil de mejorar de forma engañosa.

No se fijarán metas definitivas sin línea base, histórico, capacidad de influencia y método de medición.

---

#### 13. Tiempo, granularidad y comparabilidad

Cada hecho analítico distinguirá:

- tiempo de ocurrencia;
- fecha empresarial;
- tiempo de recepción;
- tiempo de procesamiento;
- tiempo de última corrección;
- zona horaria;
- periodo operativo, económico, contable o fiscal aplicable.

Cada métrica declarará su granularidad:

```text
una fila por venta
una fila por línea de pedido
una fila por producto × sede × día
una fila por lote
una fila por trabajador × turno
```

No se unirán granos distintos sin una agregación declarada.

Las comparaciones conservarán:

- periodo actual y comparable;
- días completos o parciales;
- cambios de horario o calendario;
- sedes abiertas o cerradas;
- cambios de catálogo y jerarquía;
- inflación o moneda cuando corresponda;
- cambios de definición;
- datos tardíos y restatements.

---

#### 14. Recopilación, transformación y linaje

Flujo objetivo:

```text
FUENTE PROPIETARIA
→ CONTRATO VERSIONADO
→ VALIDACIÓN DE INGESTIÓN
→ ZONA DE CUARENTENA CUANDO APLIQUE
→ MODELO ANALÍTICO
→ MÉTRICA VERSIONADA
→ REPORTE O TABLERO
→ DRILL-DOWN A LA FUENTE
```

Cada transformación deberá conservar:

- fuente y versión;
- consulta, regla o código;
- fecha de ejecución;
- ventana procesada;
- número de registros de entrada y salida;
- rechazos y duplicados;
- dependencias;
- actor o proceso ejecutor;
- hash o versión de artefacto cuando corresponda;
- posibilidad de reconstrucción.

Una hoja de cálculo podrá servir como captura temporal controlada, pero no será fuente de verdad permanente sin contrato, propietario, validación y reconciliación.

---

#### 15. Calidad y certificación de datos

Dimensiones mínimas:

- completitud;
- unicidad;
- validez;
- consistencia;
- integridad referencial;
- frescura;
- cobertura;
- volumen y forma;
- reconciliación;
- estabilidad histórica.

Estados propuestos:

```text
NO EVALUADO
EN OBSERVACIÓN
CERTIFICADO
DEGRADADO
BLOQUEADO
```

Reglas:

- `CERTIFICADO` se otorga para un uso, periodo y versión concretos;
- una fuente degradada podrá mostrarse con advertencia si la decisión lo permite;
- un reporte oficial no podrá publicarse con una dependencia bloqueada;
- toda degradación tendrá propietario, impacto, inicio, causa conocida y plan;
- los controles estables se automatizarán;
- los umbrales variables no se endurecerán sin histórico suficiente;
- los datos recientes se tratarán considerando retrasos normales de llegada.

---

#### 16. Reportes, tableros y snapshots

Todo artefacto analítico deberá mostrar:

- qué pregunta responde;
- periodo y fecha de corte;
- filtros activos;
- versión de métricas;
- frescura;
- cobertura;
- calidad o certificación;
- moneda y unidad;
- última actualización;
- fuente y ruta de detalle;
- responsable;
- si es vivo, snapshot, oficial, provisional o simulado.

La vista principal será simple:

```text
QUÉ CAMBIÓ
POR QUÉ IMPORTA
DÓNDE OCURRIÓ
QUÉ REQUIERE ATENCIÓN
QUÉ ACCIÓN SIGUE
```

No se llenará la pantalla con explicaciones permanentes. Las fórmulas, linaje, notas y excepciones estarán disponibles mediante divulgación progresiva.

Los snapshots publicados serán inmutables. Una corrección generará un restatement relacionado, no reemplazo silencioso.

---

#### 17. Analítica de ventas y demanda

Familias candidatas, sujetas a definición en `DATA-DOM-009`:

- ventas netas y brutas;
- pedidos y conversión;
- ticket y unidades;
- mezcla por producto, categoría, canal y sede;
- demanda por franja, día y temporada;
- disponibilidad perdida;
- cancelaciones, devoluciones y descuentos;
- promociones y efecto incremental;
- recurrencia y frecuencia;
- margen relacionado;
- capacidad comercial no utilizada.

Las ventas no se interpretarán sin considerar devoluciones, impuestos, descuentos, canales, cierres parciales, disponibilidad y cambios de catálogo.

---

#### 18. Analítica de inventario y abastecimiento

Familias candidatas:

- existencia disponible y comprometida;
- cobertura y días de inventario;
- rotación y permanencia;
- faltantes y quiebres;
- vencimiento, daño y pérdida;
- diferencias de conteo;
- cumplimiento de remisiones;
- lead time y cumplimiento de proveedores;
- compras urgentes;
- consumo versus plan;
- costo de inventario;
- capacidad de almacenamiento.

Una existencia negativa, nula o no actualizada se tratará según causa; no se ocultará mediante agregación.

---

#### 19. Analítica de producción y rendimiento

Familias candidatas:

- demanda planificada versus producción;
- capacidad disponible y utilizada;
- adherencia al programa;
- rendimiento teórico y real;
- consumo estándar y real;
- merma, reproceso y aprovechamiento;
- calidad, retención y rechazo;
- tiempo de ciclo;
- cumplimiento de liberación;
- costo y variación por lote, producto y sede.

Las recetas, versiones, lotes y unidades aplicables deberán conservarse para reproducir el cálculo histórico.

---

#### 20. Analítica de servicio y clientes

Familias candidatas:

- cumplimiento de promesa;
- tiempos de preparación, despacho y entrega;
- pedidos completos;
- reclamos y tiempo de resolución;
- compensaciones;
- satisfacción y feedback;
- recurrencia, frecuencia y abandono;
- adquisición y activación;
- fidelización, puntos y redenciones;
- reputación y temas recurrentes;
- reservas, no-show y utilización;
- valor y rentabilidad del cliente cuando esté autorizado.

Los análisis de clientes aplicarán minimización, finalidad, consentimiento, segregación y umbrales para evitar exposición de personas o grupos pequeños.

---

#### 21. Analítica económica y de rentabilidad

NUMERA conservará la propiedad de:

- costos estándar y reales;
- variaciones;
- margen y contribución;
- gastos;
- centros de costo;
- presupuesto y forecast;
- caja, bancos y tesorería cuando aplique;
- cartera y obligaciones;
- rentabilidad por empresa, sede, canal, producto y periodo;
- escenarios y simulaciones.

Las métricas económicas deberán llegar al hecho fuente y separar:

```text
REAL
PRESUPUESTADO
PRONOSTICADO
SIMULADO
PROPUESTO
PUBLICADO
```

El visor económico de `NUMERA-UX-028` consumirá las definiciones del registro canónico y no mantendrá fórmulas locales competidoras.

---

#### 22. Diagnóstico, anomalías y oportunidades

Una señal automática deberá mostrar:

- métrica y versión;
- variación absoluta y relativa;
- periodo comparable;
- segmentos afectados;
- calidad y frescura;
- posibles factores relacionados;
- impacto estimado;
- nivel de confianza;
- restricciones y datos faltantes;
- enlace a investigación;
- acción sugerida, nunca ejecutada automáticamente.

Tipos de análisis:

```text
DESCRIPTIVO
→ qué ocurrió

DIAGNÓSTICO
→ qué factores lo explican

PRONÓSTICO
→ qué podría ocurrir

RECOMENDACIÓN
→ qué alternativa conviene evaluar

DECISIÓN
→ la toma un actor autorizado
```

La IA o un modelo analítico no podrá presentar una inferencia como hecho confirmado ni modificar precios, inventario, producción, campañas o personal por sí solo.

---

#### 23. Ciclo de mejora

```text
SEÑAL
→ INVESTIGACIÓN
→ HIPÓTESIS
→ ACCIÓN O EXPERIMENTO
→ RESPONSABLE
→ LÍNEA BASE
→ META
→ DRIVERS
→ GUARDRAILS
→ VENTANA DE MEDICIÓN
→ RESULTADO
→ APRENDIZAJE
→ CIERRE, ITERACIÓN, REVERSIÓN O ESCALAMIENTO
```

Cada acción conservará:

- problema u oportunidad;
- evidencia inicial;
- proceso y alcance;
- propietario;
- decisión autorizante;
- cambio ejecutado;
- fecha de inicio y finalización;
- indicadores principales;
- segmentos;
- efectos no deseados;
- resultado y confianza;
- aprendizaje reutilizable;
- tareas derivadas.

Una acción terminada no se marcará exitosa por haberse ejecutado. Debe demostrar resultado.

---

#### 24. Autorización, privacidad y seguridad

Se separarán permisos para:

- consultar datos maestros;
- administrar un maestro;
- consultar indicadores;
- acceder a detalle;
- comparar trabajadores, clientes, sedes o proveedores;
- definir una métrica;
- certificarla;
- fijar una meta;
- publicar un snapshot;
- crear una suscripción;
- exportar;
- usar datos en modelos o proveedores externos;
- administrar acciones de mejora.

Reglas:

- la vista agregada no autoriza el detalle;
- los grupos pequeños podrán ocultarse, agruparse o enmascararse;
- una exportación no ampliará el alcance del actor;
- las métricas sensibles aplicarán territorio y finalidad;
- consultas, exportaciones, publicaciones y uso por modelos quedarán auditados;
- los proveedores externos recibirán el mínimo necesario y no conservarán autoridad empresarial.

---

#### 25. Rendimiento y costo analítico

La arquitectura deberá evitar:

- recalcular métricas costosas en cada render;
- consultar tablas operativas completas desde el frontend;
- crear vistas sin índices o filtros territoriales;
- mantener cachés sin versión o fecha de corte;
- bloquear procesos operativos por cargas analíticas;
- multiplicar modelos por aplicación;
- generar exportaciones masivas sin control.

Se definirán:

- modelos de lectura;
- materializaciones o snapshots cuando convenga;
- frecuencia;
- límites y paginación;
- caché versionado;
- observabilidad;
- costo de consulta;
- degradación controlada;
- estrategia de reconstrucción.

---

#### 26. Experiencia simple y accionable

La analítica no deberá reproducir el problema de pantallas técnicas o saturadas.

Principios:

1. una pantalla responde una decisión principal;
2. pocos indicadores prioritarios antes del detalle;
3. lenguaje empresarial;
4. comparación visible y consistente;
5. fuente, frescura y calidad disponibles sin dominar la pantalla;
6. filtros relevantes y persistentes;
7. drill-down progresivo;
8. alertas con acción clara;
9. estados vacíos que expliquen si no hay actividad o faltan datos;
10. accesibilidad y uso en escritorio, tablet o móvil según actor.

---

#### 27. Preguntas y decisiones pendientes

No se dejan preguntas narrativas sin dueño.

| Decisión pendiente                               | Tarea propietaria                                | Momento                                             |
| ------------------------------------------------ | ------------------------------------------------ | --------------------------------------------------- |
| Propietario y steward de cada maestro compartido | `DATA-DOM-001` y `DATA-DOM-002`                  | antes de diseñar crosswalks o migraciones           |
| Definición y certificador de cada KPI            | `DATA-DOM-004` y `DATA-AUTH-003`                 | antes de publicar dashboards oficiales              |
| Arquitectura interna o herramienta BI externa    | `DATA-INT-002` y `DATA-INT-004`                  | durante diseño E3/E5, antes de contratar o integrar |
| Líneas base, metas y cadencias de revisión       | `DATA-DOM-015`                                   | antes de activar seguimiento de objetivos           |
| Umbrales de calidad y frescura                   | `DATA-DOM-007`                                   | antes de certificar datos o reportes                |
| Uso de modelos predictivos o IA                  | `DATA-DOM-014`, `DATA-AUTH-004` y `DATA-INT-004` | antes de enviar datos o mostrar recomendaciones     |

---

#### 28. Hallazgos

| ID                  | Hallazgo                                                               | Propietaria                     | Momento de resolución                |
| ------------------- | ---------------------------------------------------------------------- | ------------------------------- | ------------------------------------ |
| H-CAP-SCOPE-017-001 | No existe registro canónico de datos maestros compartidos.             | `DATA-DOM-001`, `DATA-DOM-002`  | diseño de gobierno federado          |
| H-CAP-SCOPE-017-002 | No están declarados propietario y steward de cada maestro.             | `DATA-DOM-001`                  | antes de cambios maestros            |
| H-CAP-SCOPE-017-003 | Dato maestro, referencia y transacción pueden confundirse.             | `DATA-DOM-002`                  | diseño de taxonomía                  |
| H-CAP-SCOPE-017-004 | No existe contrato común de claves, aliases y códigos externos.        | `DATA-DOM-003`, `DATA-INT-003`  | antes de integraciones y migraciones |
| H-CAP-SCOPE-017-005 | Una fusión de duplicados podría perder historia o relaciones.          | `DATA-DOM-003`, `DATA-DOM-017`  | antes de deduplicación               |
| H-CAP-SCOPE-017-006 | La desactivación de maestros podría romper reportes históricos.        | `DATA-DOM-003`, `DATA-DOM-005`  | diseño de vigencias                  |
| H-CAP-SCOPE-017-007 | Las jerarquías no tienen historial efectivo común.                     | `DATA-DOM-003`, `DATA-DOM-005`  | diseño de dimensiones                |
| H-CAP-SCOPE-017-008 | Los atributos pueden tener más de un editor sin precedencia.           | `DATA-DOM-001`, `DATA-AUTH-003` | gobierno por atributo                |
| H-CAP-SCOPE-017-009 | Los crosswalks externos están dispersos por proceso.                   | `DATA-INT-003`                  | contratos de integración             |
| H-CAP-SCOPE-017-010 | La normalización textual podría confundirse con identidad.             | `DATA-DOM-003`, `DATA-DOM-007`  | diseño de calidad                    |
| H-CAP-SCOPE-017-011 | No existe registro versionado de métricas.                             | `DATA-DOM-004`                  | antes de dashboards oficiales        |
| H-CAP-SCOPE-017-012 | Una misma métrica puede tener fórmulas locales diferentes.             | `DATA-DOM-004`, `DATA-INT-002`  | capa semántica                       |
| H-CAP-SCOPE-017-013 | La granularidad no se declara sistemáticamente.                        | `DATA-DOM-005`                  | modelado analítico                   |
| H-CAP-SCOPE-017-014 | Moneda, unidad, precisión y zona horaria pueden quedar implícitas.     | `DATA-DOM-004`, `DATA-DOM-005`  | definición de métricas               |
| H-CAP-SCOPE-017-015 | Empresa, marca, sede, área, canal y centro de costo pueden mezclarse.  | `DATA-DOM-002`, `DATA-DOM-005`  | diseño dimensional                   |
| H-CAP-SCOPE-017-016 | Cambios de definición podrían reescribir historia silenciosamente.     | `DATA-DOM-017`                  | versionado y restatement             |
| H-CAP-SCOPE-017-017 | Vista viva y snapshot oficial no están diferenciados globalmente.      | `DATA-DOM-008`, `DATA-UX-007`   | diseño de reportes                   |
| H-CAP-SCOPE-017-018 | Reportes exportados pueden quedar sin versión ni fecha de corte.       | `DATA-DOM-008`, `DATA-AUTH-002` | exportaciones                        |
| H-CAP-SCOPE-017-019 | KPI locales pueden mostrar cifras sin fuente o calidad visible.        | `DATA-DOM-004`, `DATA-UX-003`   | rediseño de dashboards               |
| H-CAP-SCOPE-017-020 | Cero y ausencia de dato pueden interpretarse igual.                    | `DATA-DOM-006`, `DATA-DOM-007`  | contratos y calidad                  |
| H-CAP-SCOPE-017-021 | Datos tardíos y backfills pueden cambiar periodos sin advertencia.     | `DATA-DOM-006`, `DATA-DOM-017`  | ingestión y restatement              |
| H-CAP-SCOPE-017-022 | No existe estado común de certificación de datos.                      | `DATA-DOM-007`, `DATA-UX-004`   | gobierno de calidad                  |
| H-CAP-SCOPE-017-023 | La auditoría de calidad puede quedar desconectada del uso empresarial. | `DATA-DOM-007`                  | certificación por uso                |
| H-CAP-SCOPE-017-024 | Los agregados pueden no reconciliarse con hechos fuente.               | `DATA-DOM-006`, `DATA-INT-001`  | modelos y pruebas                    |
| H-CAP-SCOPE-017-025 | Las hojas de cálculo pueden convertirse en fuentes paralelas.          | `DATA-DOM-006`, `DATA-INT-004`  | gobierno de importaciones            |
| H-CAP-SCOPE-017-026 | No existe linaje reproducible extremo a extremo.                       | `DATA-DOM-006`, `DATA-INT-002`  | arquitectura analítica               |
| H-CAP-SCOPE-017-027 | La frescura no se muestra sistemáticamente.                            | `DATA-DOM-007`, `DATA-UX-003`   | experiencia y calidad                |
| H-CAP-SCOPE-017-028 | Los dashboards pueden saturarse con cifras sin prioridad.              | `DATA-DOM-015`, `DATA-UX-001`   | diseño de KPI y UX                   |
| H-CAP-SCOPE-017-029 | El detalle puede exponer personas o grupos pequeños.                   | `DATA-AUTH-002`                 | autorización y privacidad            |
| H-CAP-SCOPE-017-030 | Los objetivos pueden fijarse sin línea base ni guardrails.             | `DATA-DOM-015`                  | diseño de medición                   |
| H-CAP-SCOPE-017-031 | Métricas de vanidad pueden sustituir resultados empresariales.         | `DATA-DOM-015`, `DATA-UX-001`   | selección de KPI                     |
| H-CAP-SCOPE-017-032 | Los reportes no tienen contrato común de suscripción y restatement.    | `DATA-DOM-008`, `DATA-UX-007`   | diseño de reportes                   |
| H-CAP-SCOPE-017-033 | Una correlación podría presentarse como causa confirmada.              | `DATA-DOM-014`, `DATA-UX-005`   | diagnóstico                          |
| H-CAP-SCOPE-017-034 | Las acciones de mejora no tienen ciclo medible común.                  | `DATA-DOM-016`, `DATA-UX-006`   | seguimiento de mejoras               |
| H-CAP-SCOPE-017-035 | BI, IA o modelos externos podrían adquirir autoridad implícita.        | `DATA-AUTH-004`, `DATA-INT-004` | antes de integración externa         |

Todos los hallazgos tienen tarea y momento de resolución. No queda pendiente narrativo sin propietario.

---

#### 29. Tareas nuevas derivadas

##### Dominio

- `DATA-DOM-001` — Definir gobierno federado de datos, propietarios, stewards y fuentes de verdad;
- `DATA-DOM-002` — Definir catálogo de datos maestros, datos de referencia y dimensiones compartidas;
- `DATA-DOM-003` — Definir identidad, claves, códigos, jerarquías, ciclo de vida, fusión y separación de datos maestros;
- `DATA-DOM-004` — Definir capa semántica y registro canónico de métricas e indicadores;
- `DATA-DOM-005` — Definir hechos, eventos, granularidad, dimensiones, calendarios, snapshots y comparabilidad histórica;
- `DATA-DOM-006` — Definir contratos de recopilación, ingestión, transformación, backfill y reconciliación;
- `DATA-DOM-007` — Definir calidad, certificación, frescura, completitud, unicidad, validez e integridad;
- `DATA-DOM-008` — Definir reportes, tableros, exportaciones, suscripciones, alertas y snapshots oficiales;
- `DATA-DOM-009` — Definir analítica de ventas, demanda, precios, promociones y canales;
- `DATA-DOM-010` — Definir analítica de inventario, abastecimiento, proveedores y logística;
- `DATA-DOM-011` — Definir analítica de producción, rendimiento, capacidad, merma y calidad;
- `DATA-DOM-012` — Definir analítica de servicio, clientes, fidelización, reputación y experiencia;
- `DATA-DOM-013` — Definir analítica de costos, rentabilidad, liquidez, presupuesto y escenarios;
- `DATA-DOM-014` — Definir diagnóstico transversal, anomalías, causas, oportunidades y nivel de confianza;
- `DATA-DOM-015` — Definir objetivos, líneas base, metas, drivers, guardrails y planes de medición;
- `DATA-DOM-016` — Definir acciones de mejora, experimentos, responsables, seguimiento y comprobación de resultados;
- `DATA-DOM-017` — Definir versionado de métricas, restatements, correcciones históricas y reproducibilidad.

##### Autorización

- `DATA-AUTH-001` — Proteger datos maestros, métricas, reportes y análisis por dominio, entidad, territorio y finalidad;
- `DATA-AUTH-002` — Proteger información sensible, poblaciones pequeñas, comparaciones, exportaciones y drill-down;
- `DATA-AUTH-003` — Separar definición, certificación, publicación, fijación de metas, anotación, exportación y administración;
- `DATA-AUTH-004` — Auditar consultas, descargas, suscripciones, alertas, modelos y recomendaciones.

##### Experiencia

- `DATA-UX-001` — Diseñar inicio ejecutivo simple y accionable por rol;
- `DATA-UX-002` — Diseñar catálogo de métricas y datos maestros con definición, dueño, fuente, calidad y linaje;
- `DATA-UX-003` — Diseñar tableros por dominio con filtros, comparación, drill-down y trazabilidad;
- `DATA-UX-004` — Diseñar centro de calidad, frescura, conciliaciones y certificación;
- `DATA-UX-005` — Diseñar espacio de investigación de variaciones, anomalías y causas;
- `DATA-UX-006` — Diseñar objetivos, metas, drivers, guardrails y acciones de mejora;
- `DATA-UX-007` — Diseñar reportes, exportaciones, suscripciones y snapshots versionados;
- `DATA-UX-008` — Validar comprensión, tiempos y decisiones con usuarios reales.

##### Integraciones

- `DATA-INT-001` — Definir contratos de eventos y lectura con todas las aplicaciones y fuentes externas;
- `DATA-INT-002` — Definir capa semántica, modelos analíticos, snapshots, caché, consultas y rendimiento;
- `DATA-INT-003` — Definir crosswalks, claves externas, identidad y reconciliación de datos maestros;
- `DATA-INT-004` — Definir integración controlada con BI, hojas de cálculo, modelos analíticos e inteligencia artificial.

---

#### 30. Ubicación exacta de tareas nuevas

Al aprobarse esta propuesta se creará:

```text
docs/plan-canonico/modular/bloques/
AB_ANALITICA_Y_DATOS_MAESTROS/
00_BLOQUE_AB.md
```

El bloque deberá ubicarse después de:

```text
AA_GOBIERNO_DE_INFORMACION
```

No deberá incorporarse todavía antes de la aprobación explícita.

Orden interno:

```text
DATA-DOM-001 a DATA-DOM-017
→ DATA-AUTH-001 a DATA-AUTH-004
→ DATA-UX-001 a DATA-UX-008
→ DATA-INT-001 a DATA-INT-004
```

Las tareas quedarán `NO INICIADAS`. La secuencia activa continuará en `CAP-SCOPE-018`.

---

#### 31. Requisitos de prueba generados

Se crean:

- `TREQ-DATA-001` — datos maestros y de referencia;
- `TREQ-DATA-002` — registro canónico de métricas;
- `TREQ-DATA-003` — recopilación, calidad, frescura, linaje y certificación;
- `TREQ-DATA-004` — tableros, reportes, snapshots, drill-down y simplicidad;
- `TREQ-DATA-005` — diagnóstico, acciones y comprobación de mejora;
- `TREQ-INTEGRATION-022` — integración analítica y maestra transversal.

El detalle completo se encuentra en el archivo `04A` regenerado.

---

#### 32. Dependencias principales

- `CAP-SCOPE-001` — empresas, sedes y organización;
- `CAP-SCOPE-002` — personas y estructura laboral;
- `CAP-SCOPE-004` — catálogo y productos;
- `CAP-SCOPE-005` a `CAP-SCOPE-014` — hechos operativos por dominio;
- `CAP-SCOPE-016` — privacidad, documentos y auditoría;
- E2 — procesos, actores, pantallas y experiencia;
- E3 — arquitectura Supabase, normalización, calidad y fuentes de verdad;
- E4 — eventos, notificaciones, archivos y evidencia;
- E5 — paquetes, readiness, piloto e hypercare;
- BLOQUE X — integraciones;
- BLOQUE T — CI, pruebas, versiones y despliegue;
- BLOQUE U — certificación integral.

---

#### 33. Criterios de aceptación

`CAP-SCOPE-017` podrá aprobarse cuando:

1. las doce subcapacidades estén evaluadas;
2. se apruebe la propiedad federada y no una base maestra monolítica;
3. se separen maestro, referencia, hecho, snapshot, métrica y KPI;
4. se exija registro versionado de métricas;
5. se definan granularidad, tiempo, dimensiones, unidades y fuentes;
6. se defina ciclo de calidad, certificación y degradación;
7. se distingan vista viva, snapshot y reporte oficial;
8. se defina analítica por dominio sin duplicar sus hechos;
9. se defina ciclo cerrado de mejora;
10. se protejan poblaciones pequeñas, exportaciones y detalle;
11. los 35 hallazgos tengan propietario y momento;
12. las 33 tareas nuevas estén explícitas;
13. los seis requisitos estén incorporados en el `04A` completo;
14. no se haya modificado código, datos, métricas ni metas reales.

---

#### 34. Lo que esta tarea no autoriza

Esta tarea no autoriza:

- crear tablas, vistas, pipelines o dashboards;
- modificar fórmulas actuales;
- publicar indicadores oficiales;
- fijar metas empresariales;
- fusionar datos maestros;
- corregir datos de producción;
- conectar herramientas BI o IA;
- enviar información a terceros;
- ejecutar recomendaciones automáticas;
- modificar permisos;
- implementar migraciones;
- declarar datos certificados sin pruebas.

---

#### 35. Resultado y continuidad

Al aprobarse:

- `CAP-SCOPE-017` quedará cerrada;
- el modelo de analítica y datos maestros quedará incorporado al alcance objetivo;
- las tareas `DATA-*` se crearán en el BLOQUE AB;
- el `04A` completo actualizado será la única fuente de los nuevos requisitos;
- la siguiente tarea será:

```text
CAP-SCOPE-018 — Evaluar continuidad, contingencia, incidentes y recuperación
```

---

#### 36. Estado de aprobación

**Estado actual:** APROBADA

No marcar como aprobada hasta recibir confirmación explícita del usuario.


PROPUESTA PARA APROBACIÓN

### ✅ CAP-SCOPE-018 — Evaluar continuidad operativa, contingencia, incidentes, respaldo y recuperación

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-017` aprobada  
**Tarea anterior:** `CAP-SCOPE-017`  
**Siguiente tarea reservada:** `CAP-SCOPE-019`  
**Familia evaluada:** `CAP-18 — Mantener continuidad y responder a incidentes`  
**Superficies objetivo:** todas las empresas, sedes, procesos, aplicaciones, datos, instalaciones, dispositivos, proveedores y canales críticos de Vento Group  
**Implementación técnica u operativa:** no autorizada  
**Pruebas de restauración, failover o interrupción real:** no autorizadas en esta tarea  
**Requisitos generados:** `TREQ-CONT-001` a `TREQ-CONT-006` y `TREQ-INTEGRATION-023`  
**Tareas nuevas derivadas:** `CONT-DOM-001` a `015`, `CONT-AUTH-001` a `004`, `CONT-UX-001` a `007`, `CONT-INT-001` a `004`  
**Actualización del registro de pruebas:** se entrega el archivo `04A` completo regenerado; quedan prohibidas las filas sueltas  

---

#### 1. Propósito

Definir el modelo empresarial objetivo mediante el cual Vento Group pueda continuar, degradar de forma segura o recuperar sus operaciones cuando una dependencia crítica falle.

La tarea deberá permitir responder:

```text
qué producto, servicio o proceso no puede detenerse
qué dependencias necesita para funcionar
cuánto tiempo puede permanecer interrumpido
cuánta información puede perderse como máximo
qué nivel mínimo debe conservarse
qué alternativa se activa
quién declara y dirige la respuesta
cómo se registra el trabajo realizado durante la falla
cómo se recupera la tecnología y la información
cómo se reincorpora y concilia lo ocurrido
cómo se confirma que no quedaron pendientes
qué se aprende y qué debe cambiar
```

Continuidad no significa que todo deba funcionar sin internet ni que cada aplicación necesite un modo offline completo. Significa que cada capacidad crítica debe tener una decisión explícita y probada.

---

#### 2. Decisión principal y propiedad

Se crea un gobierno transversal de continuidad sin convertirlo en propietario de todos los procesos.

```text
BLOQUE AC — CONTINUIDAD OPERATIVA Y RECUPERACIÓN
→ política y gobierno de continuidad
→ análisis de impacto empresarial
→ dependencias críticas y objetivos de recuperación
→ activación, comando y comunicación de crisis
→ operación mínima y alternativas
→ coordinación de recuperación y cierre
→ ejercicios, aprendizaje y mantenimiento del plan

CADA APLICACIÓN Y DOMINIO
→ conserva su proceso y su fuente de verdad
→ define el runbook específico de su capacidad
→ valida el resultado recuperado
→ reincorpora y concilia sus hechos

BLOQUE Z / TI
→ atiende incidentes tecnológicos
→ recupera red, dispositivos, aplicaciones e infraestructura
→ ejecuta respaldo, restauración y recuperación técnica

BLOQUE AA
→ protege documentos, evidencia, privacidad,
  cadena de custodia, retención y legal holds

BLOQUE AB
→ define métricas, análisis del incidente,
  acciones de mejora y comprobación de resultados

E4
→ colas, notificaciones, archivos y evidencia transversal

BLOQUE T
→ rollback de cambios y releases

E5
→ contingencia temporal de cutover, piloto e hypercare

VISO
→ superficie administrativa de mando y seguimiento

ANIMA
→ comunicación, instrucciones y checklists del trabajador
```

El BLOQUE AC coordina; no ejecuta ventas, movimientos, producción, pagos, asistencia ni correcciones de datos por cuenta propia.

---

#### 3. Evidencia y estado actual

La línea base contiene piezas útiles, pero fragmentadas:

- `support_tickets` y mensajes de soporte permiten registrar solicitudes y fallas básicas;
- BLOQUE Z ya reserva gestión de incidentes tecnológicos, observabilidad, respaldo y recuperación técnica;
- E4 ya reserva colas, reintentos, fallos, recuperación manual, notificaciones y contingencia de entrega;
- E5 ya exige convivencia temporal, conciliación, pausa, reversión, hypercare y retiro controlado de contingencias durante implementaciones;
- ANIMA contiene la única cola offline empresarial explícita y parcialmente robusta identificada;
- ORIGO conserva borradores de recepción, pero el efecto empresarial continúa dependiendo del envío online;
- NEXO posee colas y adaptadores locales de impresión, pero no un contrato general de continuidad;
- los procesos físicos actuales ya utilizan papel, WhatsApp, llamadas, proveedores y registros paralelos como contingencia informal;
- no se localizó un análisis de impacto empresarial consolidado, objetivos RTO/RPO aprobados, programa de restauraciones probadas ni mando empresarial integral de incidentes.

Estas piezas no demuestran que Vento Group pueda recuperar un proceso completo extremo a extremo.

---

#### 4. Alcance evaluado

- `CAP-18.01` — Identificar dependencias críticas;
- `CAP-18.02` — Preparar respuestas alternativas;
- `CAP-18.03` — Detectar y reportar incidentes;
- `CAP-18.04` — Evaluar impacto y prioridad;
- `CAP-18.05` — Mantener operación mínima;
- `CAP-18.06` — Recuperar equipos, servicios e información;
- `CAP-18.07` — Registrar trabajo realizado durante la falla;
- `CAP-18.08` — Incorporar posteriormente lo ocurrido;
- `CAP-18.09` — Confirmar que no quedaron pendientes;
- `CAP-18.10` — Aprender del incidente y mejorar la respuesta;
- `CAP-18.11` — Gestionar respaldos y recuperación;
- `CAP-18.12` — Coordinar comunicación durante incidentes.

---

#### 5. Clasificación de cobertura

| Subcapacidad | Nombre                                        | Tratamiento          | Propietaria objetivo                | Decisión                                                                                                                                            |
| ------------ | --------------------------------------------- | -------------------- | ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CAP-18.01`  | Identificar dependencias críticas             | `BUILD`              | BLOQUE AC + propietarios de dominio | Construir BIA, catálogo de servicios críticos, dependencias, single points of failure y prioridades de recuperación.                                |
| `CAP-18.02`  | Preparar respuestas alternativas              | `CONTROLLED_MANUAL`  | BLOQUE AC + cada dominio            | Diseñar procedimientos alternos, kits, contactos y recursos; Vento OS gobierna versión, activación y evidencia, pero la ejecución puede ser manual. |
| `CAP-18.03`  | Detectar y reportar incidentes                | `REUSE_OR_REFACTOR`  | VISO + BLOQUE Z + aplicaciones      | Reutilizar tickets, eventos y alertas, separando incidente tecnológico, laboral, de información y de continuidad.                                   |
| `CAP-18.04`  | Evaluar impacto y prioridad                   | `BUILD`              | BLOQUE AC + VISO                    | Construir clasificación empresarial por alcance, servicio, sede, duración, seguridad, dinero, datos, cliente y obligaciones.                        |
| `CAP-18.05`  | Mantener operación mínima                     | `CONTROLLED_MANUAL`  | propietarios de proceso + BLOQUE AC | Definir mínimos viables, límites, autoridad y procedimientos por proceso; no todo proceso debe continuar.                                           |
| `CAP-18.06`  | Recuperar equipos, servicios e información    | `REUSE_OR_REFACTOR`  | BLOQUE Z + aplicación propietaria   | Integrar recuperación técnica con validación funcional y orden empresarial de recuperación.                                                         |
| `CAP-18.07`  | Registrar trabajo realizado durante la falla  | `BUILD`              | cada dominio + BLOQUE AA/AC         | Construir un ledger o referencia de contingencia que preserve actor, tiempo, evidencia, folio, origen y estado pendiente.                           |
| `CAP-18.08`  | Incorporar posteriormente lo ocurrido         | `BUILD`              | cada dominio + BLOQUE AC            | Construir reincorporación idempotente, control de duplicados, conflictos, secuencia y reconciliación.                                               |
| `CAP-18.09`  | Confirmar que no quedaron pendientes          | `BUILD`              | BLOQUE AC + VISO + propietarios     | Construir checklist de cierre y conciliación de personas, dinero, inventario, producción, pedidos, documentos y colas.                              |
| `CAP-18.10`  | Aprender del incidente y mejorar la respuesta | `REUSE_OR_REFACTOR`  | BLOQUE AB + BLOQUE Z + BLOQUE AA    | Reutilizar problema, causa raíz, hallazgos, acciones y medición; mantener post-incidente separado de la restauración inmediata.                     |
| `CAP-18.11`  | Gestionar respaldos y recuperación            | `REUSE_OR_REFACTOR`  | BLOQUE Z + E3 + BLOQUE AA           | Consolidar inventario de respaldo, retención, seguridad, restauración aislada, RPO/RTO y evidencia.                                                 |
| `CAP-18.12`  | Coordinar comunicación durante incidentes     | `INTEGRATE_EXTERNAL` | BLOQUE AC + E4 + canales externos   | Integrar alertas internas, estado, contacto con trabajadores, clientes, proveedores y autoridades según responsabilidad y privacidad.               |

---

#### 6. Resumen de clasificación

| Tratamiento          | Cantidad |
| -------------------- | -------: |
| `BUILD`              |        5 |
| `REUSE_OR_REFACTOR`  |        4 |
| `CONTROLLED_MANUAL`  |        2 |
| `INTEGRATE_EXTERNAL` |        1 |
| **TOTAL**            |   **12** |

---

#### 7. Fronteras conceptuales obligatorias

```text
incidente laboral
≠ incidente tecnológico
≠ incidente de seguridad de información
≠ incidente de continuidad empresarial
```

Un mismo hecho puede originar expedientes relacionados. No se fusionarán en un registro ambiguo.

```text
alta disponibilidad
≠ respaldo
≠ réplica
≠ restauración
≠ recuperación
≠ continuidad
```

```text
rollback de release
≠ recuperación de servicio
≠ restauración de datos
≠ reincorporación operativa
```

```text
modo offline
≠ borrador local
≠ procedimiento manual
≠ ubicación alternativa
≠ operación mínima
```

```text
servicio técnicamente disponible
≠ proceso empresarial recuperado
```

```text
incidente resuelto
≠ causa eliminada
≠ efectos conciliados
≠ continuidad certificada
```

---

#### 8. Análisis de impacto empresarial

Cada servicio o resultado crítico deberá conservar:

- producto o servicio entregado;
- cliente interno o externo;
- proceso y subcapacidad;
- empresa, marca, sede, área, horario y temporada;
- propietario y sustituto;
- volumen normal y mínimo;
- impacto por duración;
- obligaciones legales, laborales, sanitarias, contractuales o financieras;
- dependencias;
- tolerancia de pérdida de datos;
- nivel mínimo aceptable;
- prioridad de recuperación;
- procedimiento alterno;
- último ejercicio y estado de readiness.

El impacto deberá evaluarse por ventanas, por ejemplo:

```text
0 a 15 minutos
15 a 60 minutos
1 a 4 horas
4 a 24 horas
más de 24 horas
```

Las ventanas definitivas se definirán por proceso, no se adoptan como umbrales universales en esta tarea.

---

#### 9. Dependencias críticas

El mapa relacionará, como mínimo:

```text
resultado empresarial
→ proceso
→ personas y roles
→ datos y documentos
→ aplicación y Supabase
→ dispositivo, impresora y red
→ energía e instalación
→ inventario, insumos y equipos
→ proveedor y canal externo
→ contacto, contrato y alternativa
```

Deberán identificarse:

- single points of failure;
- dependencias compartidas entre sedes;
- dependencias sin sustituto;
- credenciales o conocimiento concentrados en una persona;
- recursos con tiempo de reposición alto;
- proveedores con horario o soporte limitado;
- dependencias circulares;
- dependencias cuya falla produce efectos diferidos.

---

#### 10. Objetivos de continuidad y recuperación

Se distinguirán:

| Concepto  | Pregunta                                                             |
| --------- | -------------------------------------------------------------------- |
| `MTPD`    | ¿cuál es la interrupción máxima tolerable antes de daño inaceptable? |
| `RTO`     | ¿en cuánto tiempo debe recuperarse el servicio o proceso?            |
| `RPO`     | ¿cuánta información puede perderse como máximo?                      |
| `MBCO`    | ¿qué nivel mínimo de operación debe conservarse?                     |
| prioridad | ¿en qué orden se recupera frente a otros servicios?                  |

Reglas:

1. los objetivos serán empresariales antes de convertirse en objetivos técnicos;
2. el RTO de una base no equivale al RTO del proceso completo;
3. no se prometerá RPO cero sin arquitectura y evidencia;
4. la prioridad podrá variar por sede, horario, temporada o evento;
5. todo objetivo deberá tener capacidad, costo, responsable y prueba compatibles;
6. cuando el objetivo no sea alcanzable, se registrará brecha y aceptación de riesgo, no una cifra ficticia.

---

#### 11. Tipos y severidad de incidente

Categorías mínimas:

- personas y disponibilidad laboral;
- salud, seguridad o emergencia física;
- instalación, energía o servicios públicos;
- red, dispositivo, impresora o aplicación;
- datos, privacidad o ciberseguridad;
- inventario, producción o calidad;
- venta, pago o canal comercial;
- proveedor, transporte o abastecimiento;
- reputación y comunicación;
- evento múltiple o regional.

La severidad combinará:

```text
impacto actual
+ impacto potencial
+ urgencia
+ duración
+ alcance
+ reversibilidad
+ obligaciones
= prioridad de continuidad
```

No se copiará automáticamente la prioridad de la mesa de soporte. Un ticket técnico menor puede afectar un proceso crítico y una falla técnica grande puede no impedir la operación mínima.

---

#### 12. Activación, mando y desactivación

El ciclo será:

```text
señal o reporte
→ validación inicial
→ clasificación
→ incidente de continuidad relacionado
→ activación parcial o total
→ mando y responsables
→ operación mínima / contención
→ recuperación
→ reincorporación
→ conciliación
→ desactivación
→ revisión posterior
```

Roles conceptuales:

- director del incidente;
- responsable operativo por proceso o sede;
- responsable técnico;
- responsable de datos y evidencia;
- responsable de comunicación;
- enlace con proveedores;
- aprobador de decisiones excepcionales;
- sustitutos y escalamiento.

Un mismo actor podrá cumplir varios roles en un equipo pequeño, pero el sistema conservará la función ejercida y exigirá revisión posterior para decisiones sensibles.

---

#### 13. Operación mínima viable

Cada proceso definirá:

- qué resultado debe mantenerse;
- qué puede suspenderse;
- volumen máximo o mínimo;
- productos o servicios priorizados;
- sedes y canales habilitados;
- personal mínimo;
- recursos mínimos;
- controles que no pueden omitirse;
- duración máxima del modo degradado;
- criterio de escalamiento o cierre;
- comunicación requerida.

Ejemplos que deberán diseñarse posteriormente:

- venta con medio alterno cuando el POS no esté disponible;
- remisiones físicas controladas cuando NEXO no pueda confirmar movimientos;
- asistencia manual cuando ANIMA no pueda encolar de forma segura;
- producción limitada según recetas impresas vigentes y capacidad disponible;
- recepción retenida cuando no pueda confirmarse orden, calidad o inventario;
- suspensión de redenciones si no puede validarse saldo e idempotencia;
- impresión alternativa o documento manual cuando falle el adaptador.

La tarea no aprueba todavía ninguno de esos procedimientos concretos.

---

#### 14. Modalidades de contingencia por capacidad

Cada capacidad elegirá una modalidad explícita:

| Modalidad            | Comportamiento                                                    |
| -------------------- | ----------------------------------------------------------------- |
| `STOP_AND_PROTECT`   | suspende la operación para evitar daño o pérdida de integridad    |
| `READ_ONLY_SNAPSHOT` | permite consultar una copia fechada y claramente degradada        |
| `LOCAL_DRAFT`        | conserva preparación local, pero no afirma efecto empresarial     |
| `OFFLINE_QUEUED`     | conserva intención durable y sincroniza con idempotencia          |
| `CONTROLLED_MANUAL`  | usa formulario, folio o checklist controlado                      |
| `ALTERNATE_RESOURCE` | cambia a dispositivo, impresora, red, sede o proveedor autorizado |
| `REDUCED_SERVICE`    | mantiene solo productos, canales o volúmenes prioritarios         |

La modalidad pertenece a la capacidad, no a la aplicación completa.

---

#### 15. Registro durante la falla

Todo medio de contingencia deberá conservar:

- identificador o folio único;
- incidente relacionado;
- actor y función ejercida;
- sede, área y dispositivo o formato;
- hora ocurrida y hora registrada;
- recurso afectado;
- datos mínimos;
- evidencia;
- estado `PENDIENTE_DE_INCORPORACIÓN`;
- custodio;
- vencimiento o límite;
- secuencia con otros registros;
- firma o validación cuando corresponda;
- estado de reincorporación y conciliación.

Una hoja o mensaje sin folio, responsable y estado no será una contingencia controlada.

---

#### 16. Reincorporación y reconciliación

Flujo objetivo:

```text
registro de contingencia
→ validación de identidad, permiso y contexto
→ verificación del recurso actual
→ detección de duplicados
→ resolución de conflicto
→ aplicación idempotente
→ efectos derivados
→ conciliación
→ vínculo con el registro original
→ cierre o excepción propietaria
```

Reglas:

1. no se reescribirá la hora real como si hubiera ocurrido al reincorporar;
2. no se aplicará una operación vencida sin revisión;
3. una corrección creará referencia, no borrará la contingencia original;
4. el orden deberá respetar dependencias empresariales;
5. si el estado actual hace inválida la operación, se registrará conflicto;
6. ningún cierre global ocultará pendientes por dominio;
7. dinero, inventario, producción, asistencia y documentos tendrán conciliaciones propias.

---

#### 17. Respaldo y restauración

Inventario mínimo:

- bases y esquemas;
- Storage y archivos;
- configuración de aplicaciones;
- variables y secretos recuperables mediante custodia segura;
- repositorios y artefactos de despliegue;
- DNS, dominios y certificados;
- routers, switches, impresoras y configuraciones relevantes;
- colas, eventos pendientes y referencias externas;
- documentación, contactos y runbooks;
- datos de proveedores que deban poder reconstruirse.

Cada cobertura definirá:

- fuente;
- propietario;
- método;
- frecuencia;
- retención;
- cifrado;
- ubicación y dominio de falla;
- inmutabilidad;
- monitoreo;
- prueba de restauración;
- dependencias de versión;
- RPO y RTO;
- evidencia;
- eliminación segura.

```text
backup job succeeded
≠ backup complete
≠ backup restorable
≠ process recovered
```

---

#### 18. Recuperación y failover

La recuperación se ordenará por resultados empresariales, no solamente por servidores.

Cada runbook deberá indicar:

- prerrequisitos y autoridad;
- estado inicial seguro;
- fuente de respaldo o alternativa;
- versión compatible;
- pasos de restauración;
- credenciales y custodios;
- validación técnica;
- validación funcional;
- datos o trabajos pendientes;
- decisión de failover o retorno;
- rollback del procedimiento;
- comunicación;
- evidencia y tiempos.

El failover no será automático para operaciones sensibles si no existe evidencia de consistencia y autoridad para cambiar la fuente activa.

---

#### 19. Proveedores y recursos alternativos

Se evaluarán:

- Supabase y servicios cloud;
- Vercel, Expo/EAS y tiendas;
- internet, telefonía y energía;
- dominios, correo y mensajería;
- plataformas de pago;
- Makos u otros sistemas POS;
- Rappi, ManyChat y canales comerciales;
- mensajería y transporte;
- mantenimiento, impresoras y equipos;
- proveedores de alimentos, empaques o servicios críticos.

Cada dependencia externa conservará:

- servicio y alcance;
- contacto normal y de emergencia;
- horario y SLA;
- estado y canal oficial;
- alternativa;
- procedimiento de escalamiento;
- credenciales o contrato bajo custodia;
- datos que pueden recuperarse o exportarse;
- riesgo de concentración;
- última prueba.

---

#### 20. Comunicación durante incidentes

Se diferenciarán:

```text
alerta técnica
≠ instrucción operativa
≠ actualización ejecutiva
≠ comunicación al trabajador
≠ comunicación al cliente
≠ comunicación al proveedor
≠ notificación a autoridad
```

Cada mensaje deberá declarar:

- evento y severidad;
- audiencia;
- emisor autorizado;
- información mínima;
- datos que no deben divulgarse;
- canal principal y alterno;
- frecuencia de actualización;
- confirmación requerida;
- hora del próximo parte;
- cierre o corrección.

La ausencia de información confirmada se comunicará como tal; no se inventarán causas ni tiempos de recuperación.

---

#### 21. Seguridad y acceso de emergencia

El acceso de emergencia deberá:

- existir solo para escenarios definidos;
- requerir activación explícita;
- limitar alcance y duración;
- aplicar autenticación reforzada cuando sea posible;
- registrar actor, motivo, recurso y acciones;
- notificar a responsables;
- expirar o revocarse automáticamente;
- exigir revisión posterior;
- no eliminar RLS, trazabilidad ni segregaciones permanentes.

Los respaldos, listas de contacto, configuraciones, credenciales, reportes y comunicaciones del incidente tendrán clasificación y acceso restringido.

---

#### 22. Experiencia objetivo

Superficies principales:

```text
VISO — CENTRO DE CONTINUIDAD
→ estado general
→ servicios y sedes afectadas
→ impacto y prioridad
→ responsables
→ decisiones
→ operación mínima
→ recuperación
→ comunicaciones
→ pendientes de conciliación

ANIMA — INSTRUCCIONES DEL TRABAJADOR
→ qué ocurrió
→ qué debe hacer
→ qué no debe hacer
→ checklist por función
→ confirmación de lectura
→ canal alterno

APLICACIÓN DE DOMINIO
→ estado degradado
→ modalidad activa
→ datos permitidos
→ trabajos pendientes
→ recuperación y conciliación
```

La interfaz no deberá saturar a los trabajadores con topología, logs, RTO o detalles técnicos que no necesiten para actuar.

---

#### 23. Ejercicios y pruebas

Niveles:

1. revisión documental;
2. walkthrough con responsables;
3. tabletop de decisiones;
4. simulación técnica aislada;
5. restauración de datos;
6. ejercicio operativo parcial;
7. ejercicio integral controlado.

Cada prueba deberá definir antes:

- objetivo;
- escenario;
- alcance;
- límites de seguridad;
- datos y ambiente;
- observadores;
- criterios de éxito;
- stop conditions;
- rollback;
- evidencia;
- acciones posteriores.

No se realizarán pruebas destructivas en producción por esta tarea documental.

---

#### 24. Revisión posterior y mejora

La revisión separará:

```text
hechos confirmados
supuestos
línea de tiempo
impacto
decisiones
contención
recuperación
qué funcionó
qué falló
qué faltó
causas
acciones
responsables
verificación de eficacia
```

No se utilizará como mecanismo disciplinario automático. La investigación de conducta, seguridad, privacidad o cumplimiento seguirá sus procesos propios.

Cada acción deberá vincularse con una tarea existente o crear una tarea explícita con identificador, bloque y momento de resolución.

---

#### 25. Preguntas y decisiones pendientes

No se dejan preguntas narrativas sin propietario.

Se reutilizan `DIF-05` y `DIF-07` y se asignan las decisiones restantes:

| Decisión pendiente                            | Tarea propietaria               | Momento                                   |
| --------------------------------------------- | ------------------------------- | ----------------------------------------- |
| servicios y procesos críticos                 | `CONT-DOM-002`                  | antes de definir prioridades              |
| dependencias y single points of failure       | `CONT-DOM-003`                  | antes de aprobar alternativas             |
| MTPD, RTO, RPO y MBCO                         | `CONT-DOM-004`                  | antes de contratar o diseñar recuperación |
| clasificación y autoridad de activación       | `CONT-DOM-005`, `CONT-AUTH-001` | antes de operar el centro de continuidad  |
| responsables y sustitutos                     | `CONT-DOM-001`, `CONT-DOM-006`  | antes del primer ejercicio                |
| mínimos y procedimientos por proceso          | `CONT-DOM-007`, `CONT-DOM-008`  | antes de pilotos y operación real         |
| formularios, folios y datos de contingencia   | `CONT-DOM-009`, `CONT-AUTH-003` | antes de utilizar papel o captura offline |
| orden de reincorporación y conciliación       | `CONT-DOM-010`, `CONT-INT-004`  | antes de aprobar cada runbook             |
| cobertura, retención y ubicación de respaldos | `CONT-DOM-011`, `TI-DOM-011`    | antes de certificar protección            |
| runbooks y prioridad de recuperación          | `CONT-DOM-012`                  | antes de simulaciones técnicas            |
| alternativas de proveedores y recursos        | `CONT-DOM-013`, `CONT-INT-003`  | antes de aceptar dependencia crítica      |
| calendario y alcance de ejercicios            | `CONT-DOM-014`                  | antes de declarar readiness               |

---

#### 26. Hallazgos

| ID                    | Hallazgo                                                                            | Propietaria                      | Momento de resolución           |
| --------------------- | ----------------------------------------------------------------------------------- | -------------------------------- | ------------------------------- |
| `H-CAP-SCOPE-018-001` | No existe gobierno empresarial único de continuidad.                                | `CONT-DOM-001`                   | diseño del BLOQUE AC            |
| `H-CAP-SCOPE-018-002` | No existe BIA consolidado por servicio, proceso y sede.                             | `CONT-DOM-002`                   | antes de priorizar recuperación |
| `H-CAP-SCOPE-018-003` | Productos y servicios críticos no tienen nivel mínimo declarado.                    | `CONT-DOM-002`, `CONT-DOM-007`   | diseño de MBCO                  |
| `H-CAP-SCOPE-018-004` | Dependencias técnicas y operativas no están vinculadas extremo a extremo.           | `CONT-DOM-003`, `CONT-INT-001`   | mapa de dependencias            |
| `H-CAP-SCOPE-018-005` | Single points of failure no están consolidados.                                     | `CONT-DOM-003`                   | análisis de dependencias        |
| `H-CAP-SCOPE-018-006` | No existen MTPD, RTO y RPO aprobados por proceso.                                   | `CONT-DOM-004`                   | objetivos de continuidad        |
| `H-CAP-SCOPE-018-007` | Recuperar un componente puede no recuperar el resultado empresarial.                | `CONT-DOM-004`, `CONT-DOM-012`   | diseño de runbooks              |
| `H-CAP-SCOPE-018-008` | Incidentes laborales, tecnológicos, de información y continuidad pueden mezclarse.  | `CONT-DOM-005`, `CONT-INT-001`   | taxonomía de incidentes         |
| `H-CAP-SCOPE-018-009` | No existen criterios comunes de activación y desactivación.                         | `CONT-DOM-005`, `CONT-AUTH-001`  | diseño de mando                 |
| `H-CAP-SCOPE-018-010` | No existe matriz común de impacto, urgencia y severidad empresarial.                | `CONT-DOM-005`                   | clasificación de incidentes     |
| `H-CAP-SCOPE-018-011` | Roles de mando, comunicación y sustitución no están formalizados.                   | `CONT-DOM-006`, `CONT-AUTH-001`  | antes del primer ejercicio      |
| `H-CAP-SCOPE-018-012` | Las decisiones de crisis pueden depender de una sola persona.                       | `CONT-DOM-006`, `CONT-AUTH-001`  | delegación y suplencia          |
| `H-CAP-SCOPE-018-013` | No se define operación mínima por proceso y duración.                               | `CONT-DOM-007`                   | diseño por dominio              |
| `H-CAP-SCOPE-018-014` | No se ha elegido modalidad de contingencia por capacidad.                           | `CONT-DOM-008`                   | diseño de alternativas          |
| `H-CAP-SCOPE-018-015` | Un procedimiento manual podría convertirse en fuente paralela.                      | `CONT-DOM-008`, `CONT-DOM-009`   | contrato de contingencia        |
| `H-CAP-SCOPE-018-016` | Formularios o mensajes durante fallas pueden carecer de folio y custodio.           | `CONT-DOM-009`, `INFO-DOM-007`   | diseño de evidencia             |
| `H-CAP-SCOPE-018-017` | Trabajo realizado durante una falla puede perderse o no poder probarse.             | `CONT-DOM-009`, `CONT-UX-004`    | captura de contingencia         |
| `H-CAP-SCOPE-018-018` | La reincorporación puede duplicar ventas, movimientos, pagos o asistencia.          | `CONT-DOM-010`, `CONT-INT-004`   | contratos idempotentes          |
| `H-CAP-SCOPE-018-019` | El orden de reincorporación entre dominios no está definido.                        | `CONT-DOM-010`, `CONT-INT-004`   | diseño de reconciliación        |
| `H-CAP-SCOPE-018-020` | Un incidente puede cerrarse con trabajos o conciliaciones pendientes.               | `CONT-DOM-010`, `CONT-AUTH-004`  | checklist de cierre             |
| `H-CAP-SCOPE-018-021` | No existe inventario completo de información y configuración respaldada.            | `CONT-DOM-011`, `TI-DOM-011`     | arquitectura de respaldo        |
| `H-CAP-SCOPE-018-022` | Job exitoso, réplica y sincronización pueden confundirse con respaldo.              | `CONT-DOM-011`                   | política de respaldo            |
| `H-CAP-SCOPE-018-023` | No existe programa consolidado de restauraciones probadas.                          | `CONT-DOM-014`, `TI-DOM-011`     | calendario de pruebas           |
| `H-CAP-SCOPE-018-024` | Los tiempos reales de restauración no se comparan con RTO.                          | `CONT-DOM-004`, `CONT-DOM-014`   | ejercicios de recuperación      |
| `H-CAP-SCOPE-018-025` | Credenciales o conocimiento de recuperación pueden concentrarse en una persona.     | `CONT-AUTH-002`, `CONT-DOM-012`  | custodia y runbook              |
| `H-CAP-SCOPE-018-026` | Copias y fuente podrían compartir el mismo dominio de falla.                        | `CONT-DOM-011`, `CONT-INT-003`   | arquitectura de copias          |
| `H-CAP-SCOPE-018-027` | Compromisos de continuidad de proveedores no están consolidados.                    | `CONT-DOM-013`, `CONT-INT-003`   | evaluación de proveedores       |
| `H-CAP-SCOPE-018-028` | Alternativas para energía, red, pago, comunicación y transporte no están aprobadas. | `CONT-DOM-008`, `CONT-DOM-013`   | diseño de alternativas          |
| `H-CAP-SCOPE-018-029` | Dispositivos, impresoras, sedes o materiales alternos pueden no estar disponibles.  | `CONT-DOM-008`, `TI-DOM-002`     | readiness físico                |
| `H-CAP-SCOPE-018-030` | No existe árbol de comunicaciones de crisis versionado.                             | `CONT-DOM-006`, `CONT-UX-006`    | diseño de comunicación          |
| `H-CAP-SCOPE-018-031` | Mensajes no coordinados pueden prometer causas o tiempos no confirmados.            | `CONT-DOM-006`, `CONT-AUTH-001`  | plantillas y aprobación         |
| `H-CAP-SCOPE-018-032` | Información sensible del incidente puede divulgarse indebidamente.                  | `CONT-AUTH-003`, `INFO-AUTH-004` | autorización y privacidad       |
| `H-CAP-SCOPE-018-033` | Acceso de emergencia puede convertirse en bypass permanente.                        | `CONT-AUTH-002`, `AUTH-CTX-030`  | diseño break-glass              |
| `H-CAP-SCOPE-018-034` | Los planes no tienen programa recurrente de ejercicios.                             | `CONT-DOM-014`                   | calendario de continuidad       |
| `H-CAP-SCOPE-018-035` | Las pruebas pueden validar restauración técnica sin conciliación operativa.         | `CONT-DOM-014`, `CONT-INT-004`   | diseño de escenarios            |
| `H-CAP-SCOPE-018-036` | Las lecciones pueden quedar desconectadas de acciones propietarias.                 | `CONT-DOM-015`, `DATA-DOM-016`   | revisión posterior              |
| `H-CAP-SCOPE-018-037` | Contactos, dependencias y runbooks pueden quedar obsoletos tras cambios.            | `CONT-DOM-015`, `TI-DOM-009`     | mantenimiento del plan          |
| `H-CAP-SCOPE-018-038` | No existe vista consolidada de estado, impacto, decisiones y pendientes.            | `CONT-UX-001`, `CONT-UX-002`     | diseño de experiencia           |

Todos los hallazgos tienen propietario y momento de resolución.

---

#### 27. Tareas nuevas derivadas

##### Dominio

- `CONT-DOM-001` — Definir política, alcance, gobierno, roles y ciclo de mantenimiento de continuidad;
- `CONT-DOM-002` — Definir análisis de impacto empresarial, servicios críticos, procesos, sedes y niveles mínimos;
- `CONT-DOM-003` — Definir mapa de dependencias, recursos críticos, single points of failure y sustitutos;
- `CONT-DOM-004` — Definir MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo;
- `CONT-DOM-005` — Definir taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre de incidentes de continuidad;
- `CONT-DOM-006` — Definir mando, sustitución, bitácora de decisiones, comunicación de crisis y coordinación externa;
- `CONT-DOM-007` — Definir operación mínima viable por proceso, sede, horario, temporada y duración;
- `CONT-DOM-008` — Definir estrategias de contingencia, alternativas manuales, offline, físicas y de proveedor;
- `CONT-DOM-009` — Definir registro, folios, evidencia, custodia y trabajo ejecutado durante la falla;
- `CONT-DOM-010` — Definir reincorporación, idempotencia, conflictos, conciliación y confirmación de pendientes;
- `CONT-DOM-011` — Definir inventario, política, frecuencia, retención, seguridad y cobertura de respaldos;
- `CONT-DOM-012` — Definir runbooks, orden de recuperación, restauración, failover, retorno y validación funcional;
- `CONT-DOM-013` — Definir continuidad de proveedores, energía, red, pagos, transporte, canales y recursos alternativos;
- `CONT-DOM-014` — Definir programa de walkthroughs, tabletops, simulaciones, restauraciones y ejercicios operativos;
- `CONT-DOM-015` — Definir revisión posterior, lecciones, acciones, eficacia y actualización periódica del plan.

##### Autorización

- `CONT-AUTH-001` — Proteger declaración, activación, mando, decisiones excepcionales, comunicación y desactivación;
- `CONT-AUTH-002` — Proteger acceso de emergencia, credenciales de recuperación, break-glass, failover y revocación;
- `CONT-AUTH-003` — Proteger respaldos, runbooks, contactos, evidencia, formularios y datos de contingencia;
- `CONT-AUTH-004` — Separar ejecución, validación, reincorporación, conciliación, cierre y revisión posterior.

##### Experiencia

- `CONT-UX-001` — Diseñar inicio ejecutivo de continuidad con estado, impacto, prioridades, responsables y decisiones;
- `CONT-UX-002` — Diseñar centro de mando del incidente con línea de tiempo, servicios afectados y recuperación;
- `CONT-UX-003` — Diseñar runbooks y checklists simples por rol, proceso, sede y modalidad;
- `CONT-UX-004` — Diseñar captura controlada durante la falla y reincorporación posterior;
- `CONT-UX-005` — Diseñar seguimiento de respaldos, restauración, failover, validación y pendientes;
- `CONT-UX-006` — Diseñar comunicaciones internas y externas con plantillas, canales, confirmación y escalamiento;
- `CONT-UX-007` — Diseñar ejercicios, revisión posterior, acciones y comprobación de readiness.

##### Integraciones

- `CONT-INT-001` — Definir contratos de criticidad, dependencia, salud, estado degradado e incidente con todas las aplicaciones;
- `CONT-INT-002` — Definir contratos con SHELL, VISO, ANIMA, BLOQUE Z, AA, AB, E4, E5, T, U y X;
- `CONT-INT-003` — Definir contratos con Supabase, nube, energía, ISP, pagos, mensajería, transporte y proveedores críticos;
- `CONT-INT-004` — Definir contratos de captura, replay, idempotencia, reincorporación, conciliación y retorno al servicio normal.

Total: **30 tareas nuevas**.

---

#### 28. Ubicación exacta de tareas nuevas

Al aprobarse se creará:

```text
docs/plan-canonico/modular/bloques/
AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/
00_BLOQUE_AC.md
```

El bloque se ubicará después de:

```text
AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS
```

Orden interno:

```text
CONT-DOM-001 a CONT-DOM-015
→ CONT-AUTH-001 a CONT-AUTH-004
→ CONT-UX-001 a CONT-UX-007
→ CONT-INT-001 a CONT-INT-004
```

Las tareas quedarán `NO INICIADAS`. La secuencia activa continuará en `CAP-SCOPE-019` después de la aprobación.

---

#### 29. Requisitos de prueba derivados

Se crean:

- `TREQ-CONT-001` — análisis de impacto, dependencias y objetivos;
- `TREQ-CONT-002` — incidente, activación, mando y comunicación;
- `TREQ-CONT-003` — operación mínima y contingencia controlada;
- `TREQ-CONT-004` — respaldo, restauración y recuperación;
- `TREQ-CONT-005` — reincorporación, idempotencia y conciliación;
- `TREQ-CONT-006` — ejercicios, revisión y mejora;
- `TREQ-INTEGRATION-023` — continuidad transversal e integración de recuperación.

El detalle completo se encuentra en el archivo `04A` regenerado.

---

#### 30. Dependencias principales

- `CAP-SCOPE-001` — empresas, sedes y estructura;
- `CAP-SCOPE-002` — personas, funciones y disponibilidad;
- `CAP-SCOPE-003` — SST, emergencias y seguridad de vida;
- `CAP-SCOPE-004` a `CAP-SCOPE-014` — procesos y resultados por dominio;
- `CAP-SCOPE-015` — tecnología, redes, dispositivos y soporte;
- `CAP-SCOPE-016` — información, evidencia, privacidad y auditoría;
- `CAP-SCOPE-017` — indicadores, calidad y mejora;
- E2 — procesos, actores, estaciones y experiencia;
- E3 — arquitectura, datos, migración y fuentes de verdad;
- E4 — colas, notificaciones, archivos y evidencia;
- E5 — cutover, piloto, hypercare y reversión;
- BLOQUE T — releases, compatibilidad y rollback;
- BLOQUE U — pruebas integrales;
- BLOQUE X — integraciones;
- BLOQUE Z — tecnología y recuperación técnica;
- BLOQUE AA — gobierno de información;
- BLOQUE AB — analítica y mejora.

---

#### 31. Criterios de aceptación

`CAP-SCOPE-018` podrá aprobarse cuando:

1. las doce subcapacidades estén evaluadas;
2. se separe continuidad empresarial de incidentes técnicos, laborales y de información;
3. se apruebe gobierno transversal sin quitar propiedad a los dominios;
4. se exijan BIA, dependencias y single points of failure;
5. se definan MTPD, RTO, RPO, MBCO y prioridades como decisiones posteriores con propietario;
6. cada capacidad deba elegir una modalidad de contingencia;
7. se proteja el registro realizado durante la falla;
8. se defina reincorporación idempotente y conciliación;
9. respaldo, réplica, restauración y recuperación queden separados;
10. se exijan restauraciones y ejercicios probados;
11. se definan mando, comunicación, suplencia y acceso de emergencia;
12. los 38 hallazgos tengan propietario y momento;
13. las 30 tareas nuevas estén explícitas;
14. los siete requisitos estén incorporados en el `04A` completo;
15. no se haya ejecutado una prueba destructiva ni modificado producción.

---

#### 32. Lo que esta tarea no autoriza

Esta tarea no autoriza:

- apagar servicios o probar fallas en producción;
- restaurar bases o archivos reales;
- modificar políticas de backup;
- crear accesos de emergencia;
- activar procedimientos manuales;
- cambiar proveedores;
- comprar redundancia o equipos;
- definir RTO/RPO sin BIA;
- crear tablas, colas, dashboards o integraciones;
- modificar permisos;
- cambiar procesos operativos actuales;
- retirar papel, WhatsApp u otras contingencias existentes;
- declarar un plan certificado;
- iniciar código o migraciones.

---

#### 33. Resultado y continuidad

Al aprobarse:

- `CAP-SCOPE-018` quedará cerrada;
- la continuidad operativa quedará incorporada al alcance objetivo;
- las tareas `CONT-*` se crearán en el BLOQUE AC;
- el `04A` completo actualizado será la única fuente de los nuevos requisitos;
- `DIF-05` y `DIF-07` conservarán propietario y puerta de resolución;
- la siguiente tarea será:

```text
CAP-SCOPE-019 — Aprobar clasificación y propietario de cada dominio evaluado
```

---

#### 34. Estado de aprobación

**Estado actual:** PROPUESTA PARA APROBACIÓN — NO APROBADA


### ✅ CAP-SCOPE-019 — Aprobar clasificación y propietario de cada dominio evaluado

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `CAP-SCOPE-018` aprobada  
**Tarea anterior:** `CAP-SCOPE-018`  
**Siguiente tarea reservada:** `CAP-COVER-001`  
**Familias consolidadas:** `CAP-01` a `CAP-18`  
**Subcapacidades reconciliadas:** **217**  
**Naturaleza:** aprobación transversal de clasificación, propiedad funcional y fronteras entre dominios  
**Implementación técnica:** no autorizada  
**Migraciones o cambios en Supabase:** no autorizados  
**Cambios organizacionales, nombramientos o contrataciones:** no autorizados  
**Requisitos de prueba derivados:** **NO GENERA REQUISITOS DE PRUEBA NUEVOS**  
**Registro de consolidación:** `MAT-OWN-CAP-001 — Matriz canónica de clasificación y propiedad de dominios`

---

#### 1. Propósito

Consolidar y someter a aprobación, sin reabrir las decisiones sustantivas ya
adoptadas en `CAP-SCOPE-001` a `CAP-SCOPE-018`:

- la clasificación aprobada de las **217 subcapacidades** del mapa empresarial;
- la función empresarial responsable de cada dominio;
- la aplicación, servicio o medio que conservará cada expediente o fuente de verdad;
- las aplicaciones participantes y sus límites;
- las autoridades externas que seguirán siendo fuente profesional, fiscal,
  financiera, tecnológica o regulatoria;
- las fronteras entre propietario empresarial, propietario del proceso,
  propietario de datos, custodio técnico, operador y consumidor;
- las responsabilidades que una misma persona podrá ejercer temporalmente en
  una organización pequeña;
- las segregaciones que deberán preservarse aunque varias funciones estén
  concentradas en una sola persona;
- la entrada verificable para `CAP-COVER-001` a `CAP-COVER-012`.

La tarea crea una matriz de decisión, no una nueva capa de software ni una
estructura organizacional artificial.

---

#### 2. Pregunta de decisión

`CAP-SCOPE-019` responde:

```text
¿QUÉ TRATAMIENTO CONSERVA CADA UNA DE LAS 217 SUBCAPACIDADES,
QUÉ FUNCIÓN EMPRESARIAL RESPONDE POR SU RESULTADO,
QUÉ DOMINIO CONSERVA EL EXPEDIENTE O FUENTE DE VERDAD,
QUÉ APLICACIONES SOLO PARTICIPAN O CONSUMEN,
Y QUÉ FRONTERAS IMPIDEN QUE VISO, SHELL, SUPABASE
O CUALQUIER OTRA APLICACIÓN SE CONVIERTAN
EN PROPIETARIOS UNIVERSALES DE VENTO OS?
```

Quedan prohibidas simplificaciones como:

```text
APLICACIÓN QUE MUESTRA LA PANTALLA = PROPIETARIA DEL PROCESO
```

```text
REPOSITORIO QUE CONTIENE EL CÓDIGO = PROPIETARIO EMPRESARIAL
```

```text
SUPABASE = PROPIETARIO DE TODOS LOS DATOS
```

```text
VISO = PROPIETARIO DE TODO LO ADMINISTRATIVO
```

```text
SHELL = PROPIETARIO DE TODO LO COMPARTIDO
```

```text
DOS APLICACIONES PARTICIPAN = DOS FUENTES DE VERDAD
```

```text
REUSE_OR_REFACTOR = CAPACIDAD TERMINADA
```

```text
BUILD = AUTORIZACIÓN PARA IMPLEMENTAR AHORA
```

```text
UNA PERSONA EJERCE VARIAS FUNCIONES = LAS FUNCIONES SON EQUIVALENTES
```

---

#### 3. Fuentes consolidadas

Esta tarea consolida exclusivamente decisiones y artefactos ya existentes:

- `CAP-MAP-001` a `CAP-MAP-015`;
- `LB-CAP-VENTO-001 v1.0` y sus 217 subcapacidades;
- `MAP-IMPL-CAP-001`;
- `CAP-SCOPE-001` a `CAP-SCOPE-018`;
- `CODE-AUD-001` a `CODE-AUD-020`;
- `QA-GOV-001`, `QA-REG-001` y el registro `04A` vigente;
- `PROC-CAT-*`, `PROC-ACTOR-*` y las tareas de diseño E2;
- E3, E4 y E5;
- bloques funcionales de ANIMA, VISO, SHELL, NEXO, FOGO, ORIGO,
  PULSO, NUMERA, PASS, TALENTO y AURA;
- BLOQUES Z, AA, AB y AC;
- BLOQUE X, BLOQUE T y BLOQUE U;
- el registro vivo de preguntas y sus destinos ya aprobados.

No se vuelve a evaluar el alcance de cada subcapacidad. Se verifica que las
decisiones sean compatibles entre sí y se congela su propiedad objetivo para
la medición de cobertura.

---

#### 4. Resultado de la reconciliación

Se localizaron y reconciliaron exactamente:

| Elemento                                     | Resultado |
| -------------------------------------------- | --------: |
| Familias empresariales                       |    **18** |
| Subcapacidades                               |   **217** |
| Subcapacidades con clasificación primaria    |   **217** |
| Subcapacidades sin clasificación             |     **0** |
| Dominios sin función empresarial responsable |     **0** |
| Dominios con aplicación universal impuesta   |     **0** |
| Tratamientos primarios permitidos utilizados |     **5** |
| Requisitos de prueba nuevos                  |     **0** |
| Tareas nuevas                                |     **0** |

Distribución consolidada:

| Tratamiento primario | Cantidad | Interpretación                                                                                           |
| -------------------- | -------: | -------------------------------------------------------------------------------------------------------- |
| `REUSE_OR_REFACTOR`  |  **113** | existe una base aprovechable, pero requiere convergencia, contratos, autorización, experiencia y pruebas |
| `BUILD`              |   **86** | falta una capacidad empresarial o ciclo verificable y deberá diseñarse antes de implementarse            |
| `INTEGRATE_EXTERNAL` |   **10** | la autoridad o ejecución permanece en un proveedor o sistema externo mediante contrato controlado        |
| `CONTROLLED_MANUAL`  |    **7** | la operación seguirá siendo humana o física, pero con registro, responsable, evidencia y conciliación    |
| `DEFERRED`           |    **1** | la capacidad permanece pospuesta con dueño, control y puerta definidos                                   |
| `BUY`                |    **0** | no se ha aprobado comprar una capacidad completa como decisión definitiva                                |
| `OUT_OF_SCOPE`       |    **0** | ninguna subcapacidad del mapa obligatorio se excluye completamente                                       |
| `RETIRE`             |    **0** | no se retira una capacidad empresarial completa; sí podrán retirarse implementaciones o patrones legacy  |
| **Total**            |  **217** | —                                                                                                        |

La única subcapacidad `DEFERRED` es:

```text
CAP-02.10 — Acompañar desempeño y desarrollo
```

Su propiedad permanece en Gerencia y el responsable directo. La operación
continúa como `CONTROLLED_MANUAL` hasta que `PROC-CAT-002`, `PROC-CAT-018`,
`PROC-CAT-019`, `PROC-ACTOR-004`, `PROC-ACTOR-005` y `VISO-UX-002` definan un
proceso, tratamiento de información y uso legítimo suficientemente precisos.

---

#### 5. Reglas canónicas de clasificación

##### 5.1. Una subcapacidad conserva una clasificación primaria

Cada `CAP-xx.yy` mantendrá exactamente la clasificación primaria aprobada en su
`CAP-SCOPE-*`. Un tratamiento complementario podrá describir la transición,
pero no creará dos decisiones primarias simultáneas.

##### 5.2. Un dominio puede tener perfil mixto

Las familias `CAP-01` a `CAP-18` contienen subcapacidades con tratamientos
diferentes. Por tanto, el dominio no recibirá una etiqueta única que oculte la
composición real.

Ejemplo:

```text
CAP-09
→ 10 REUSE_OR_REFACTOR
→ 4 BUILD
→ 1 INTEGRATE_EXTERNAL
```

No se resumirá como simplemente “REUSE” o “BUILD”.

##### 5.3. Clasificación no equivale a cobertura técnica

```text
TRATAMIENTO OBJETIVO
≠ ESTADO DE IMPLEMENTACIÓN
≠ READINESS
≠ ADOPCIÓN
≠ CERTIFICACIÓN
```

`CAP-COVER-001` a `CAP-COVER-012` medirán posteriormente si cada capacidad se
encuentra en producción, parcial, solo infraestructura, solo interfaz,
prototipo, legacy, rota, ausente, bloqueada, diferida o fuera de alcance según
los criterios aprobados.

##### 5.4. Reutilizar no significa conservar sin cambios

`REUSE_OR_REFACTOR` obliga a:

- identificar la base existente;
- decidir qué contrato se conserva;
- eliminar fuentes competidoras;
- adaptar autorización, contexto y datos;
- migrar sin pérdida histórica;
- probar paridad, regresión y operación real;
- retirar la implementación anterior solo con evidencia.

##### 5.5. Construir no autoriza implementación inmediata

`BUILD` significa que la capacidad debe atravesar:

```text
E2 — proceso, actor y experiencia
→ E3/E4 — arquitectura y contratos
→ E5 — paquete, migración, readiness y piloto
→ T/U — pruebas y certificación
→ cutover controlado
```

##### 5.6. Integración externa no transfiere propiedad empresarial

Un banco, proveedor fiscal, plataforma de pagos, canal, ARL, laboratorio,
transportista, nube o proveedor tecnológico podrá ejecutar o certificar una
función. Vento Group conservará:

- el propietario empresarial;
- el contrato y finalidad;
- la referencia externa;
- el estado interno;
- la conciliación;
- la evidencia;
- la contingencia;
- la decisión de continuidad o retiro.

##### 5.7. Manual controlado no significa informal

Toda capacidad `CONTROLLED_MANUAL` deberá tener:

- procedimiento versionado;
- función responsable;
- evidencia mínima;
- estado y resultado;
- protección de información;
- conciliación posterior cuando produzca efectos;
- revisión periódica;
- tarea y puerta para cualquier automatización futura.

---

#### 6. Modelo canónico de propiedad

Se distinguen seis responsabilidades:

| Responsabilidad                         | Definición                                                                                                        |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **Propietario empresarial accountable** | responde por el resultado, reglas, riesgo, prioridad y aceptación del proceso                                     |
| **Propietario funcional o de proceso**  | diseña y mantiene el ciclo, estados, excepciones, controles y criterios de cierre                                 |
| **Propietario del dato o expediente**   | decide significado, calidad, vigencia y corrección del objeto empresarial                                         |
| **Steward o custodio funcional**        | vigila calidad, completitud, clasificación y cumplimiento cotidiano                                               |
| **Custodio técnico**                    | opera infraestructura, persistencia, despliegue, respaldo y seguridad técnica sin cambiar significado empresarial |
| **Operador o ejecutor**                 | realiza una tarea autorizada sin convertirse por ello en propietario del dominio                                  |

Regla obligatoria:

```text
UN MISMO OBJETO + UNA MISMA ETAPA + UN MISMO ATRIBUTO
→ UN ÚNICO PROPIETARIO DE FUENTE
```

Cuando varias aplicaciones participen, la propiedad se dividirá por objeto,
atributo o etapa. No se utilizará la expresión “propiedad compartida” para
ocultar precedencia indefinida.

Ejemplo aprobado:

```text
PRODUCTO Y PRESENTACIÓN
→ NEXO

RECETA, MÉTODO Y RENDIMIENTO
→ FOGO

MENÚ, OFERTA Y DISPONIBILIDAD COMERCIAL
→ PULSO
```

##### 6.1. Aplicación propietaria no equivale a interfaz exclusiva

Una aplicación podrá administrar o mostrar objetos de otro dominio mediante un
contrato autorizado. Eso no le permite:

- redefinir el objeto;
- mantener una copia editable competidora;
- ampliar permisos;
- corregir historia por su cuenta;
- asumir el cierre del proceso propietario.

##### 6.2. Persistencia y plataforma no son propietarios empresariales

Supabase, Storage, repositorios, servicios compartidos, SHELL y BLOQUE E4 son
infraestructura, contratos o custodios técnicos. Solo serán propietarios de
los objetos técnicos que les correspondan explícitamente.

##### 6.3. VISO es superficie administrativa, no dueño universal

VISO podrá presentar, supervisar, aprobar o administrar procesos según
contrato. Cada dominio conservará su expediente y fuente.

##### 6.4. Propiedad se asigna a funciones, no a nombres personales

El documento canónico registra roles y funciones estables. La persona concreta,
suplencia y vigencia se resolverán en asignaciones organizacionales y
`PROC-ACTOR-*`, sin incrustar nombres personales en la arquitectura.

---

#### 7. `MAT-OWN-CAP-001` — Matriz canónica consolidada

Los perfiles de tratamiento se expresan como conteos de subcapacidades y no
como una clasificación única del dominio.

| Familia  | Dominio                                              | Perfil aprobado                                                                 | Propietario empresarial accountable                                                      | Fuentes o aplicaciones propietarias                                                                                         | Participantes principales                                                        |
| -------- | ---------------------------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `CAP-01` | Dirigir y gobernar la organización                   | 3 `REUSE_OR_REFACTOR`; 4 `BUILD`; 3 `CONTROLLED_MANUAL`                         | Dirección / Gerencia General                                                             | VISO para estructura, decisiones y gobierno administrativo; dominios propietarios para sus políticas                        | SHELL, AA, AB, AC, NUMERA, asesores y autoridades                                |
| `CAP-02` | Gestionar personas y trabajo                         | 7 `REUSE_OR_REFACTOR`; 4 `BUILD`; 1 `INTEGRATE_EXTERNAL`; 1 `DEFERRED`          | Gerencia General / administración laboral                                                | TALENTO para proceso previo; VISO para vínculo, asignaciones, turnos y decisiones; ANIMA para experiencia y asistencia      | SHELL, NUMERA, proveedor laboral o nómina, responsables directos                 |
| `CAP-03` | Proteger salud, seguridad y cumplimiento             | 3 `REUSE_OR_REFACTOR`; 5 `BUILD`; 1 `INTEGRATE_EXTERNAL`; 1 `CONTROLLED_MANUAL` | Gerencia General                                                                         | VISO para sistema SST; Responsable SST habilitado para ejecución técnica                                                    | ANIMA, NEXO, FOGO, AA, AC, ARL, IPS, asesores y certificadores                   |
| `CAP-04` | Gestionar productos, preparaciones y conocimiento    | 8 `REUSE_OR_REFACTOR`; 2 `BUILD`                                                | Jefatura de Operaciones y propietarios de cada conocimiento                              | NEXO: producto, presentación y unidad; FOGO: receta, método y rendimiento; PULSO: menú, oferta y disponibilidad             | ORIGO, PASS, NUMERA, VISO y proveedores externos                                 |
| `CAP-05` | Abastecer la operación                               | 6 `REUSE_OR_REFACTOR`; 5 `BUILD`; 1 `CONTROLLED_MANUAL`                         | Jefatura de Operaciones / función de compras y abastecimiento                            | ORIGO para expediente de abastecimiento y proveedor                                                                         | NEXO para efecto físico; NUMERA para obligación y costo; VISO como supervisión   |
| `CAP-06` | Controlar inventario y almacenamiento                | 12 `REUSE_OR_REFACTOR`; 3 `BUILD`                                               | Jefatura de Operaciones / logística y bodega                                             | NEXO                                                                                                                        | ORIGO, FOGO, PULSO, NUMERA, E4 y proveedores de hardware                         |
| `CAP-07` | Gestionar activos, equipos y elementos reutilizables | 8 `REUSE_OR_REFACTOR`; 5 `BUILD`                                                | Jefatura de Operaciones / responsable de activos                                         | NEXO                                                                                                                        | ORIGO, NUMERA, BLOQUE Z, áreas custodias y proveedores especializados            |
| `CAP-08` | Planear y ejecutar producción                        | 6 `REUSE_OR_REFACTOR`; 8 `BUILD`                                                | Responsable de Producción / Jefatura de Operaciones                                      | FOGO para plan, orden, lote, ejecución, calidad productiva y conciliación                                                   | NEXO para materiales y producto físico; ORIGO, VISO, NUMERA, impresión y calidad |
| `CAP-09` | Vender, cobrar y atender pedidos                     | 10 `REUSE_OR_REFACTOR`; 4 `BUILD`; 1 `INTEGRATE_EXTERNAL`                       | Gerencia comercial-operativa / responsables de sede                                      | PULSO para pedido, mesa, comanda, venta, cobro, caja y cierre                                                               | PASS, NEXO, FOGO, NUMERA, POS externo, pagos y proveedor fiscal                  |
| `CAP-10` | Atender clientes y fortalecer relaciones             | 7 `REUSE_OR_REFACTOR`; 3 `BUILD`                                                | Gerencia comercial / servicio al cliente                                                 | PASS para experiencia, identidad y fidelización; VISO para casos e investigación; PULSO para hechos vinculados a venta      | NUMERA, NEXO, AURA, AA, proveedores de comunicación                              |
| `CAP-11` | Transportar, despachar y entregar                    | 8 `REUSE_OR_REFACTOR`; 4 `BUILD`                                                | Jefatura de Operaciones / logística                                                      | NEXO para logística interna, ruta, viaje, carga y custodia; PULSO para cumplimiento del pedido de cliente                   | PASS, FOGO, ORIGO, NUMERA, VISO/ANIMA y transportistas externos                  |
| `CAP-12` | Gestionar dinero, costos y obligaciones              | 5 `REUSE_OR_REFACTOR`; 8 `BUILD`; 2 `INTEGRATE_EXTERNAL`                        | Gerencia General / función financiera y contable                                         | NUMERA para hechos económicos, cartera, obligaciones, tesorería, costos, presupuestos y conciliación                        | PULSO, ORIGO, NEXO, FOGO, ANIMA, bancos, pagos, proveedor fiscal y contabilidad  |
| `CAP-13` | Mantener instalaciones y condiciones de operación    | 3 `REUSE_OR_REFACTOR`; 7 `BUILD`; 1 `INTEGRATE_EXTERNAL`                        | Jefatura de Operaciones / responsable de instalaciones                                   | NEXO                                                                                                                        | ORIGO, NUMERA, VISO/SST, áreas operativas, BLOQUE Z y proveedores especializados |
| `CAP-14` | Comunicar, promocionar y desarrollar ventas          | 2 `REUSE_OR_REFACTOR`; 6 `BUILD`; 3 `INTEGRATE_EXTERNAL`                        | Gerencia comercial / función de marketing y comunicaciones                               | AURA como propietaria objetivo del expediente de marketing, cuando se implemente                                            | PULSO, PASS, NUMERA, VISO, FOGO, NEXO, AA, AB y canales externos                 |
| `CAP-15` | Gestionar tecnología y soporte                       | 7 `REUSE_OR_REFACTOR`; 4 `BUILD`                                                | Gerencia General; Coordinación tecnológica como función responsable                      | Propiedad distribuida mediante BLOQUE Z: SHELL, NEXO, VISO, ANIMA, PRINT-ARC y propietarios de aplicaciones                 | ORIGO, NUMERA, BLOQUES T/U, ISP, nube, fabricantes y soporte externo             |
| `CAP-16` | Proteger información, documentos y evidencia         | 6 `REUSE_OR_REFACTOR`; 5 `BUILD`                                                | Gerencia General / función de gobierno de información                                    | Cada dominio conserva su expediente; BLOQUE AA gobierna reglas transversales; VISO administra solicitudes e investigaciones | SHELL, Supabase, Storage, EVID-ARC, ANIMA, PASS, asesores y autoridades          |
| `CAP-17` | Medir, analizar y mejorar                            | 8 `REUSE_OR_REFACTOR`; 4 `BUILD`                                                | Gerencia General para marco transversal; cada propietario de dominio para sus resultados | Cada dominio conserva maestros y hechos; BLOQUE AB gobierna métricas, calidad y mejora                                      | VISO para visión ejecutiva; NUMERA para análisis económico; BI e IA bajo control |
| `CAP-18` | Mantener continuidad y responder a incidentes        | 4 `REUSE_OR_REFACTOR`; 5 `BUILD`; 1 `INTEGRATE_EXTERNAL`; 2 `CONTROLLED_MANUAL` | Gerencia General / Dirección del incidente y propietarios de proceso                     | Cada dominio conserva su runbook; BLOQUE AC coordina continuidad; BLOQUE Z recupera tecnología                              | VISO, ANIMA, AA, AB, E4, E5, T, U, X y proveedores críticos                      |

---

#### 8. Fronteras aprobadas por dominio

##### 8.1. `CAP-01` — Gobierno

- Dirección y Gerencia General responden por objetivos, decisiones, riesgos y
  verificación.
- VISO podrá administrar el catálogo organizacional y expedientes de decisión.
- Contabilidad, asesores y autoridades conservan su autoridad externa.
- Un dato registral no se declarará verificado por aparecer en una pantalla.
- Un propietario de política no convierte a VISO en propietario del proceso que
  la política regula.

##### 8.2. `CAP-02` — Personas

```text
TALENTO
→ candidatura, selección y pre-vinculación

VISO
→ vínculo laboral, asignaciones, programación y decisiones administrativas

ANIMA
→ experiencia personal, asistencia, consulta, reportes y evidencia del trabajador
```

SHELL conserva identidad y acceso; NUMERA consume hechos económicos; el
proveedor laboral o de nómina conserva la autoridad externa aplicable.

##### 8.3. `CAP-03` — SST

Gerencia General queda como propietario empresarial accountable. La ejecución
técnica pertenece al rol `Responsable SST habilitado`, interno o externo. La
persona concreta deberá asignarse antes del diseño final, pero el dominio no
queda sin propietario por no existir hoy un nombre confirmado.

```text
VISO
→ riesgos, casos, inspecciones SST, acciones, requisitos y certificados

NEXO
→ EPP, activos y condición física

FOGO
→ higiene, inocuidad y hechos productivos

ANIMA
→ reporte, capacitación, alerta e información personal
```

##### 8.4. `CAP-04` — Catálogo, recetas y oferta

No existe copropiedad del mismo objeto:

```text
NEXO
→ identidad de producto, categoría, unidad y presentación

FOGO
→ receta, versión, método, rendimiento, porción y conocimiento productivo

PULSO
→ menú, oferta, precio publicado y disponibilidad comercial
```

PASS, ORIGO, NUMERA y VISO consumirán proyecciones o administrarán atributos
explícitamente delegados; no crearán catálogos paralelos.

##### 8.5. `CAP-05` — Abastecimiento

ORIGO conserva necesidad, solicitud, comparación, negociación, orden, relación
con proveedor, aceptación empresarial, diferencia, devolución y reclamación.

NEXO conserva la recepción física y el efecto de inventario. NUMERA conserva la
obligación, gasto, costo y pago. Los tres compartirán correlación, no un objeto
editable por todos.

##### 8.6. `CAP-06` — Inventario

NEXO será la única fuente del estado físico, existencia, ubicación, lote,
serial, LPN, reserva, tránsito, conteo y movimiento. Las aplicaciones de origen
emitirán hechos idempotentes; no escribirán stock directamente.

##### 8.7. `CAP-07` — Activos

NEXO conserva identidad, ubicación, custodia, condición, disponibilidad,
mantenimiento, repuesto, garantía, préstamo, pérdida y baja del activo.

La propiedad se separa de:

- compra en ORIGO;
- costo y depreciación o efecto económico en NUMERA;
- postura técnica del endpoint en BLOQUE Z;
- uso operativo por el área custodia.

##### 8.8. `CAP-08` — Producción

FOGO conserva plan, revisión, programación, orden, lote, ejecución, controles de
calidad, decisión productiva, reproceso y cierre. NEXO conserva material físico,
reservas, consumo aplicado, producto terminado y disponibilidad de inventario.

Una comanda de preparación inmediata de PULSO no se convertirá en orden de
producción por lote de FOGO.

##### 8.9. `CAP-09` — Venta y pedidos

PULSO será propietario de pedido, mesa, comanda, venta, pago operativo, caja y
cierre. PASS será canal y experiencia del cliente. NUMERA conserva el efecto
económico. NEXO aplica inventario. El proveedor fiscal conserva emisión oficial.

El POS externo será una fuente temporal mediante adaptador; no arquitectura
objetivo ni propietario de los demás dominios.

##### 8.10. `CAP-10` — Cliente y servicio

```text
PASS
→ experiencia personal, perfil, consentimiento visible,
  fidelización, beneficios y seguimiento

VISO
→ colas, caso, SLA, investigación, aprobación y cierre administrativo

PULSO
→ hechos de servicio relacionados con venta, pedido, mesa y devolución
```

La vista cliente 360 será una proyección y no una nueva fuente de verdad.

##### 8.11. `CAP-11` — Logística

NEXO conserva logística interna, necesidad, plan, ruta, viaje, vehículo
referenciado, carga, custodia, remisión, novedad, recepción y cierre. PULSO
conserva la promesa y el resultado de entrega del pedido. PASS presenta tracking
y confirmación al cliente. Los terceros ejecutan solo el servicio contratado.

##### 8.12. `CAP-12` — Dinero y costos

NUMERA será la capa económico-operativa y conservará hechos económicos,
cartera, obligaciones, bancos, tesorería, conciliaciones, costos, presupuestos,
cierres y rentabilidad.

Las aplicaciones operativas conservan sus hechos. Bancos, proveedores de pago,
proveedor fiscal y contabilidad externa mantienen la autoridad externa aplicable.
NUMERA no se declarará contabilidad formal completa hasta una decisión posterior
expresa.

##### 8.13. `CAP-13` — Instalaciones

NEXO conserva instalación, espacio, componente fijo, condición, disponibilidad,
plan y orden de mantenimiento, limpieza, saneamiento, plagas, servicios,
medidores, inspección física, calibración, llaves, obras y novedades.

Frontera con `CAP-07`:

```text
OBJETO MÓVIL, SERIALIZADO O TRASLADABLE
→ activo de CAP-07

ESPACIO O COMPONENTE INCORPORADO A LA INSTALACIÓN
→ instalación de CAP-13
```

La misma infraestructura de mantenimiento podrá atender ambos, pero el tipo de
objeto, plan, evidencia y liberación permanecerán explícitos.

Para calibración:

- NEXO conserva instrumento, programa, resultado y certificado;
- FOGO o el propietario del proceso evalúa impacto sobre lotes y decisiones;
- VISO/SST evalúa impacto regulatorio o laboral cuando corresponda.

##### 8.14. `CAP-14` — Marketing y desarrollo comercial

AURA será propietaria objetivo de identidad de marca, brief, campaña, contenido,
publicación, oportunidad, pipeline, reputación y atribución de marketing.

AURA permanece futura y su propiedad objetivo no equivale a cobertura actual.
PULSO ejecutará pedidos y promociones transaccionales; PASS identidad,
consentimiento y beneficios; NUMERA margen y presupuesto; VISO casos de servicio.

##### 8.15. `CAP-15` — Tecnología

No se crea obligatoriamente un área formal de TI para aprobar la propiedad.
Se define una **función de Coordinación Tecnológica**, que puede ejercerse de
forma interina dentro de Jefatura de Operaciones mientras el tamaño de la
organización lo justifique.

La propiedad continúa distribuida:

```text
SHELL
→ identidad, aplicaciones, contratos y política de acceso

NEXO
→ activo físico, ubicación, custodia, mantenimiento y retiro

VISO
→ mesa de servicio, incidentes, problemas, cambios y SLA

ANIMA
→ portal del trabajador, solicitud propia y capacitación

PRINT-ARC
→ colas, rutas, adaptadores y resultados de impresión

BLOQUE Z
→ modelo operativo transversal, configuración, red,
  observabilidad, soporte y coordinación
```

ORIGO conserva contratos y compras; NUMERA costos y obligaciones; propietarios
de aplicación conservan aceptación funcional.

##### 8.16. `CAP-16` — Información

Cada dominio conserva su expediente funcional. BLOQUE AA gobierna clasificación,
finalidad, versiones, retención, firma, compartición, derechos, custodia y
auditoría. VISO administra solicitudes e investigaciones; SHELL decide acceso;
Supabase y Storage son custodios técnicos.

##### 8.17. `CAP-17` — Analítica

Cada dominio conserva sus datos maestros y hechos. BLOQUE AB conserva el registro
de métricas, capa semántica, calidad, certificación, reportes, diagnóstico y
mejora. VISO presenta la visión ejecutiva; NUMERA la visión económica.

El propietario de una métrica será la función empresarial que toma la decisión,
no la persona que escribió la consulta.

##### 8.18. `CAP-18` — Continuidad

BLOQUE AC coordina análisis de impacto, prioridades, mando, operación mínima,
recuperación, conciliación y ejercicios. Cada dominio conserva su runbook y
valida su resultado. BLOQUE Z recupera tecnología. E4 recupera efectos
asíncronos. E5 gobierna la contingencia temporal de implementaciones.

---

#### 9. Modelo operativo para una organización pequeña

La ausencia actual de áreas formales de TI, datos, gobierno de información o
continuidad no impide aprobar una arquitectura responsable.

Se adopta el principio:

```text
FUNCIÓN OBLIGATORIA
≠ ÁREA ORGANIZACIONAL OBLIGATORIA
```

Una misma persona podrá ejercer temporalmente varias funciones, por ejemplo:

```text
JEFATURA DE OPERACIONES
+ DESARROLLO
+ COORDINACIÓN TECNOLÓGICA INTERINA
+ SOPORTE DE PRIMER NIVEL
```

La acumulación no fusiona las funciones ni elimina controles.

##### 9.1. Acciones que requieren revisión independiente

Aunque una persona ejecute varias funciones, no deberá autoaprobar sin revisión
posterior o segundo control, según riesgo:

- concesión o elevación de acceso privilegiado;
- cambio de permisos o RLS;
- despliegue productivo y aprobación de rollback;
- eliminación o disposición de información;
- certificación de un dato corregido por la misma persona;
- cierre financiero, castigo o reapertura;
- cierre de investigación en la que sea parte implicada;
- declaración de recuperación y cierre de un incidente crítico;
- baja de activos o diferencias relevantes de inventario;
- publicación de una política o decisión que requiera autoridad superior.

##### 9.2. Asignaciones interinas

Las asignaciones nominales y suplencias se resolverán mediante:

- `PROC-ACTOR-003` para supervisión, aprobación y soporte;
- `TI-DOM-001` y `TI-AUTH-001` para tecnología;
- `INFO-DOM-001` para gobierno de información;
- `DATA-DOM-001` y `DATA-AUTH-003` para datos y certificación;
- `CONT-DOM-001` y `CONT-DOM-006` para continuidad;
- los procesos de SST para responsable habilitado y sustitutos.

No se crea una tarea nueva porque todas las asignaciones tienen ya un destino y
momento de resolución.

##### 9.3. Apoyo de inteligencia artificial

La IA podrá asistir a las funciones responsables mediante:

- consolidación de registros;
- borradores de informes;
- detección de vencimientos y anomalías;
- preparación de minutas y acciones;
- explicación de variaciones;
- consulta de conocimiento aprobado;
- comprobación de evidencia pendiente.

La IA no adquirirá propiedad empresarial, autoridad de aprobación ni capacidad
para modificar fuentes de verdad sin un contrato y aprobación humana.

---

#### 10. Reglas de precedencia entre dominios

##### 10.1. Hecho operativo y efecto derivado

```text
DOMINIO DE ORIGEN
→ conserva el hecho que ocurrió

DOMINIO RECEPTOR
→ aplica su efecto exactamente una vez
```

Ejemplos:

- PULSO conserva venta; NEXO aplica salida; PASS aplica puntos; NUMERA registra
  efecto económico.
- ORIGO conserva compra y recepción empresarial; NEXO aplica entrada física;
  NUMERA registra obligación.
- FOGO conserva lote y resultado productivo; NEXO aplica consumos y salida;
  NUMERA calcula costo.

##### 10.2. Fuente maestra y proyección

Una aplicación consumidora podrá mantener caché, índice o proyección, pero no
editarla como fuente alternativa. Toda corrección regresará al propietario.

##### 10.3. Propiedad por atributo

Cuando un registro lógico combine atributos de varios dominios, cada atributo
deberá declarar precedencia.

Ejemplo:

```text
PRODUCTO.nombre
→ NEXO

PRODUCTO.costo_calculado
→ NUMERA

PRODUCTO.disponibilidad_comercial
→ PULSO

PRODUCTO.regla_de_producción
→ FOGO
```

##### 10.4. Cierre por dominio

Cerrar un proceso en una aplicación no cierra automáticamente los efectos en
otras. El cierre integral exigirá estados correlacionados y conciliación.

---

#### 11. Conflictos de propiedad resueltos

| Conflicto                                  | Resolución canónica                                                                        |
| ------------------------------------------ | ------------------------------------------------------------------------------------------ |
| VISO concentra pantallas administrativas   | VISO es superficie administrativa; la fuente permanece en el dominio propietario           |
| SHELL contiene contratos y migraciones     | SHELL es custodio de identidad, autorización y contratos; no propietario universal         |
| Supabase almacena múltiples dominios       | la ubicación física no transfiere propiedad empresarial                                    |
| producto, receta y menú aparecen juntos    | NEXO, FOGO y PULSO conservan objetos distintos con contratos explícitos                    |
| ORIGO y NEXO participan en recepción       | ORIGO conserva expediente de compra; NEXO conserva efecto físico                           |
| PULSO, PASS y VISO atienden clientes       | PULSO conserva operación; PASS autoservicio/fidelización; VISO caso administrativo         |
| NEXO y PULSO participan en entrega         | NEXO logística interna; PULSO cumplimiento del pedido; PASS visibilidad al cliente         |
| activo e instalación reciben mantenimiento | propiedad por tipo de objeto; motor compartido no fusiona expedientes                      |
| TI no tiene área formal                    | se aprueba función de Coordinación Tecnológica interina con propiedad distribuida          |
| datos y KPI no tienen equipo dedicado      | cada dominio conserva stewardship; BLOQUE AB gobierna definiciones y certificación         |
| continuidad parece responsabilidad técnica | Gerencia y propietarios de proceso responden por continuidad; BLOQUE Z recupera tecnología |
| proveedor externo ejecuta una capacidad    | conserva autoridad externa; Vento Group mantiene expediente, contrato y conciliación       |

---

#### 12. Decisiones pendientes con propietario y momento

No quedan pendientes narrativos sin destino.

| Decisión                                                           | Propietario documental                          | Momento de resolución                                                         |
| ------------------------------------------------------------------ | ----------------------------------------------- | ----------------------------------------------------------------------------- |
| persona que ejercerá el rol SST y sus suplentes                    | `PROC-ACTOR-003` y proceso SST                  | antes de aprobar diseño E2 y paquetes SST                                     |
| persona que ejercerá Coordinación Tecnológica interina             | `TI-DOM-001`, `TI-AUTH-001`, `PROC-ACTOR-003`   | antes de activar mesa de servicio, accesos privilegiados o piloto tecnológico |
| stewards concretos por familia de información                      | `INFO-DOM-001`                                  | antes de configurar clasificación, retención o disposición                    |
| propietarios y stewards de cada maestro                            | `DATA-DOM-001`, `DATA-DOM-002`                  | antes de crosswalks, fusiones o migraciones                                   |
| propietario y certificador de cada KPI                             | `DATA-DOM-004`, `DATA-AUTH-003`                 | antes de publicar tableros oficiales                                          |
| dirección de incidente y suplentes                                 | `CONT-DOM-001`, `CONT-DOM-006`                  | antes del primer ejercicio o activación real                                  |
| decisión de construir o integrar contabilidad formal               | `NUMERA-DOM-017`, `NUMERA-UX-027`               | antes de libros, asientos o reportes oficiales internos                       |
| fecha y alcance de implementación de TALENTO                       | `CAP-TAL-001` a `CAP-TAL-006`, E5               | antes de adoptar reclutamiento digital                                        |
| fecha y alcance de implementación de AURA                          | `AURA-*`, CAP-COVER y E5                        | antes de conectar canales o publicar contenido                                |
| proveedores concretos de BI, IA, firma, MDM, soporte o continuidad | tareas `*-INT-*` y `INT-EXT-*` correspondientes | antes de contratar, enviar datos o habilitar efectos                          |
| readiness real de cada dominio                                     | `CAP-COVER-001` a `CAP-COVER-012`               | inmediatamente después de aprobar `CAP-SCOPE-019`                             |

---

#### 13. Hallazgos de consolidación

| ID                    | Hallazgo                                                                                                | Severidad | Destino                                                                   | Momento                                      |
| --------------------- | ------------------------------------------------------------------------------------------------------- | --------- | ------------------------------------------------------------------------- | -------------------------------------------- |
| `H-CAP-SCOPE-019-001` | confundir interfaz administrativa con propiedad puede convertir VISO en dueño universal                 | crítica   | `CAP-COVER-003`, `CAP-COVER-008`, `GAP-CTRL-003`                          | matriz de cobertura y arquitectura E2/E3     |
| `H-CAP-SCOPE-019-002` | confundir persistencia con propiedad puede convertir Supabase o SHELL en fuente empresarial universal   | crítica   | `CAP-COVER-004`, `CAP-COVER-005`, `GAP-CTRL-003`                          | E3 antes del modelo físico objetivo          |
| `H-CAP-SCOPE-019-003` | asignar varios propietarios al mismo objeto y etapa deja precedencia indefinida                         | crítica   | `CAP-COVER-008`, `CAP-COVER-012`, `GAP-CTRL-004`                          | matriz capacidad × proceso × aplicación      |
| `H-CAP-SCOPE-019-004` | un perfil mixto de tratamientos puede resumirse incorrectamente como una sola clasificación             | alta      | `CAP-COVER-001`, `CAP-COVER-012`                                          | definición de criterios y matriz consolidada |
| `H-CAP-SCOPE-019-005` | `REUSE_OR_REFACTOR` puede interpretarse como capacidad terminada                                        | crítica   | `CAP-COVER-001` a `CAP-COVER-005`, `GAP-CTRL-001`                         | medición técnica de cobertura                |
| `H-CAP-SCOPE-019-006` | `BUILD` puede convertirse en implementación sin pasar por E2–E5                                         | crítica   | `CAP-COVER-010`, `GAP-CTRL-004`, `GAP-CTRL-008`                           | antes de crear paquetes o código             |
| `H-CAP-SCOPE-019-007` | una autoridad externa puede confundirse con propietario interno o eliminar la necesidad de conciliación | crítica   | `CAP-COVER-006`, `GAP-CTRL-005`, BLOQUE X                                 | diseño de integraciones externas             |
| `H-CAP-SCOPE-019-008` | la concentración de TI, desarrollo y operaciones en una persona puede eliminar segregación              | crítica   | `TI-AUTH-001`, `TI-AUTH-002`, `PROC-ACTOR-003`                            | antes de accesos privilegiados y producción  |
| `H-CAP-SCOPE-019-009` | la ausencia de persona SST nominal puede confundirse con ausencia de propietario del dominio            | alta      | `PROC-ACTOR-003`, `CAP-COVER-002`                                         | antes del diseño y piloto SST                |
| `H-CAP-SCOPE-019-010` | datos maestros y métricas pueden quedar sin steward aunque tengan aplicación fuente                     | alta      | `DATA-DOM-001`, `DATA-DOM-004`, `DATA-AUTH-003`                           | antes de certificación analítica             |
| `H-CAP-SCOPE-019-011` | documentos pueden quedar sin custodio aunque el proceso tenga propietario                               | crítica   | `INFO-DOM-001`, `INFO-DOM-003`, `INFO-AUTH-003`                           | antes de retención y disposición             |
| `H-CAP-SCOPE-019-012` | continuidad puede delegarse indebidamente a tecnología                                                  | crítica   | `CONT-DOM-001` a `CONT-DOM-004`, `CAP-COVER-012`                          | análisis de impacto y readiness              |
| `H-CAP-SCOPE-019-013` | AURA y TALENTO pueden aparecer como propietarios objetivo aunque no estén operativos                    | alta      | `CAP-COVER-002`, `CAP-COVER-003`, `GAP-CTRL-006`                          | medición de cobertura actual                 |
| `H-CAP-SCOPE-019-014` | un cambio de propietario puede reescribir historia o dejar consumidores antiguos                        | crítica   | `GAP-CTRL-003`, `GAP-CTRL-007`, `SUPA-TRANS-*`                            | migración y transición                       |
| `H-CAP-SCOPE-019-015` | un cierre local puede ocultar efectos pendientes en otros dominios                                      | crítica   | `CAP-COVER-008`, `GAP-CTRL-007`, requisitos `TREQ-INTEGRATION-*` vigentes | arquitectura E4 y paquetes E5                |
| `H-CAP-SCOPE-019-016` | la IA puede asumir autoridad implícita por preparar informes o recomendaciones                          | alta      | `DATA-AUTH-004`, `DATA-INT-004`, `INFO-AUTH-004`                          | antes de integrar modelos externos           |

Todos los hallazgos tienen tarea y momento. No se crea backlog narrativo adicional.

---

#### 14. Efecto sobre `CAP-COVER-*`

La aprobación de `MAT-OWN-CAP-001` habilitará la siguiente secuencia:

```text
CAP-COVER-001
→ definir criterios verificables de cada estado de cobertura

CAP-COVER-002
→ comprobar cobertura funcional por capacidad

CAP-COVER-003
→ comprobar cobertura de experiencia e interfaz

CAP-COVER-004
→ comprobar cobertura de backend y servidor

CAP-COVER-005
→ comprobar cobertura de datos y Supabase

CAP-COVER-006
→ comprobar cobertura de integraciones y proveedores

CAP-COVER-007
→ comprobar cobertura de pruebas y validación

CAP-COVER-008
→ comprobar cobertura de autorización y contexto

CAP-COVER-009
→ comprobar cobertura operativa por sede, área y rol

CAP-COVER-010
→ comprobar cobertura de migración, transición y rollback

CAP-COVER-011
→ comprobar cobertura de observabilidad, soporte y continuidad

CAP-COVER-012
→ aprobar matriz capacidad × proceso × aplicación × implementación
```

Cada evaluación deberá comparar:

```text
PROPIETARIO OBJETIVO APROBADO
vs
IMPLEMENTACIÓN ACTUAL LOCALIZADA
vs
ESTADO DE COBERTURA VERIFICADO
vs
BRECHA Y DESTINO
```

`CAP-COVER-*` no podrá cambiar silenciosamente el propietario aprobado. Una
evidencia material contradictoria deberá regresar mediante una decisión
canónica explícita.

---

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA NUEVOS.

**Justificación:** `CAP-SCOPE-019` consolida clasificación, propiedad y
precedencia documental de decisiones ya aprobadas. No introduce una nueva regla
ejecutable, transición de estado, cálculo, permiso, contrato de integración ni
comportamiento que requiera una fila adicional.

Permanecen vigentes los **146 requisitos** del registro `04A` actualizado hasta
`CAP-SCOPE-018`. Esta tarea no modifica su estado, texto, relación ni prioridad.

La propiedad aprobada servirá para asignar correctamente la tarea responsable,
paquete, repositorio y evidencia durante `CAP-COVER-*`, E2, E3, E4 y E5.

---

#### 16. Tareas nuevas derivadas

**Resultado:** NO CREA TAREAS NUEVAS.

Las responsabilidades que requieren definición nominal, stewardship,
segregación, integración, transición o readiness ya están cubiertas por tareas
materializadas, entre otras:

- `PROC-ACTOR-*`;
- `CAP-COVER-001` a `CAP-COVER-012`;
- `GAP-CTRL-001` a `GAP-CTRL-008`;
- `TI-*`, `INFO-*`, `DATA-*` y `CONT-*`;
- tareas de dominio, autorización, experiencia e integración de cada aplicación;
- E3, E4, E5, BLOQUE X, BLOQUE T y BLOQUE U.

---

#### 17. Decisiones canónicas propuestas

1. Se adopta `MAT-OWN-CAP-001` como matriz canónica de clasificación y propiedad.
2. Las 217 subcapacidades conservan exactamente su clasificación primaria aprobada.
3. La distribución consolidada será 113 `REUSE_OR_REFACTOR`, 86 `BUILD`, 10 `INTEGRATE_EXTERNAL`, 7 `CONTROLLED_MANUAL` y 1 `DEFERRED`.
4. No se asignan capacidades completas a `BUY`, `OUT_OF_SCOPE` ni `RETIRE`.
5. Cada dominio puede tener un perfil mixto; no se le impondrá una clasificación única falsa.
6. Clasificación objetivo y cobertura técnica permanecerán separadas.
7. Cada objeto, atributo y etapa tendrá una única fuente con precedencia explícita.
8. Propietario empresarial, propietario funcional, propietario de dato, steward, custodio técnico y operador serán responsabilidades distintas.
9. VISO no será propietario universal de los procesos administrativos.
10. SHELL no será propietario universal de los contratos ni datos compartidos.
11. Supabase y Storage no adquirirán propiedad empresarial por almacenar información.
12. Producto, receta y oferta permanecerán bajo NEXO, FOGO y PULSO respectivamente.
13. ORIGO conservará abastecimiento; NEXO el efecto físico; NUMERA el efecto económico.
14. PULSO conservará la operación comercial; PASS la experiencia del cliente; VISO los casos administrativos.
15. NEXO conservará logística interna e instalaciones; PULSO el cumplimiento del pedido de cliente.
16. NUMERA será la capa económico-operativa sin declararse todavía contabilidad formal completa.
17. AURA conservará propiedad objetivo diferida; TALENTO conservará dominio y canal futuro bajo propiedad funcional de VISO mientras no exista `app_code` canónico.
18. La propiedad tecnológica será distribuida bajo coordinación del BLOQUE Z.
19. No será obligatorio crear inmediatamente un área formal de TI, datos, información o continuidad; sí será obligatorio asignar las funciones.
20. Una persona podrá ejercer varias funciones temporalmente, pero no se fusionarán sus responsabilidades ni se eliminarán revisiones independientes.
21. Cada dominio conservará su expediente; BLOQUE AA gobernará información; BLOQUE AB analítica; BLOQUE AC continuidad.
22. Proveedores externos ejecutarán contratos limitados sin convertirse en fuentes internas universales.
23. Toda transferencia de propiedad futura será versionada, migrable, auditable y con adaptación de consumidores.
24. `CAP-COVER-001` será la única continuidad inmediata.
25. No se crea ninguna tarea ni requisito de prueba nuevo.
26. No se modifica código, Supabase, datos, permisos, proveedores ni organización real.

---

#### 18. Criterios de aceptación

`CAP-SCOPE-019` podrá aprobarse cuando:

1. las 18 familias estén presentes exactamente una vez;
2. las 217 subcapacidades estén reconciliadas;
3. la distribución de tratamientos sume exactamente 217;
4. se conserve la clasificación primaria aprobada de cada `CAP-xx.yy`;
5. ningún dominio quede sin propietario empresarial accountable;
6. los dominios federados definan propiedad por objeto, atributo o etapa;
7. VISO, SHELL y Supabase queden excluidos como propietarios universales;
8. se ratifique la separación producto–receta–oferta;
9. se ratifiquen las fronteras ORIGO–NEXO–NUMERA;
10. se ratifiquen las fronteras PULSO–PASS–VISO;
11. se ratifiquen las fronteras NEXO–PULSO en logística;
12. se resuelva la frontera entre activo e instalación;
13. se apruebe la propiedad funcional de SST aunque el nombramiento personal siga en `PROC-ACTOR-*`;
14. se apruebe la función tecnológica interina sin exigir crear un área formal;
15. las funciones de información, datos y continuidad tengan responsables documentales;
16. las segregaciones mínimas permanezcan incluso cuando una persona acumule funciones;
17. todos los hallazgos tengan tarea y momento de resolución;
18. se declare que no genera tareas nuevas;
19. se declare que no genera requisitos de prueba nuevos;
20. `CAP-COVER-001` permanezca como única continuidad inmediata;
21. no se modifique implementación, Supabase, datos ni estructura organizacional real.

---

#### 19. Lo que esta tarea no autoriza

Esta tarea no autoriza:

- crear o cerrar áreas organizacionales;
- nombrar, contratar o despedir personas;
- conceder cargos, permisos o accesos;
- cambiar propietarios en datos productivos;
- mover tablas o expedientes entre aplicaciones;
- fusionar catálogos;
- desplegar AURA, TALENTO, BLOQUE Z, AA, AB o AC;
- implementar una mesa de servicio;
- conectar BI o IA;
- contratar proveedores;
- crear flujos, pantallas, tablas, RPC, RLS, funciones o migraciones;
- modificar `04A`;
- declarar una capacidad implementada o lista para producción;
- iniciar E2, E3, E4 o E5 fuera del orden canónico;
- cerrar brechas de cobertura sin evidencia.

---

#### 20. Resultado y continuidad

Al aprobarse:

- quedará cerrada la evaluación de alcance `CAP-SCOPE-001` a `CAP-SCOPE-019`;
- quedarán congeladas clasificación y propiedad objetivo de los 18 dominios;
- `MAT-OWN-CAP-001` será la referencia para arquitectura, datos, interfaces,
  autorización, integraciones, paquetes y pruebas;
- las 217 subcapacidades estarán preparadas para medición verificable de cobertura;
- el registro `04A` permanecerá sin cambios;
- la siguiente tarea será exclusivamente:

```text
CAP-COVER-001
— Definir criterios verificables de cada estado de cobertura
```

---

#### 21. Estado de aprobación

**Estado actual:** PROPUESTA PARA APROBACIÓN — NO APROBADA.

No marcar como aprobada ni avanzar a `CAP-COVER-001` hasta recibir confirmación
explícita del usuario.


Las tareas `CAP-TAL-001` a `CAP-TAL-006` fueron reubicadas en BLOQUE E2 porque
definen procesos, estados, actores y experiencia TO-BE. Conservan sus
identificadores, dependencias y reglas aprobadas, pero no forman parte del
conteo ni de la secuencia de cierre de E1.
