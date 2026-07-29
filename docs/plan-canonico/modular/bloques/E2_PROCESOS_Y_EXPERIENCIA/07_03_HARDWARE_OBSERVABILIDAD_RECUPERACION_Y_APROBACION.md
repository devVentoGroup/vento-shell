### MINI-BLOQUE — HARDWARE OBSERVABILIDAD RECUPERACION Y APROBACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **hardware observabilidad recuperacion y aprobación** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `NFR-REQ-008` a `NFR-REQ-012` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `NFR-REQ-008`: Definir hardware, red y periféricos requeridos
- `NFR-REQ-009`: Definir observabilidad, soporte y alertas
- `NFR-REQ-010`: Definir respaldo, RTO y RPO
- `NFR-REQ-011`: Definir compatibilidad mínima por dispositivo
- `NFR-REQ-012`: Aprobar requisitos no funcionales antes de E5
<!-- PLAN-SECTION-META:END -->

### ✅ NFR-REQ-008 — Definir hardware, red y periféricos requeridos

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-007 — Definir accesibilidad y ergonomía` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-009 — Definir observabilidad, soporte y alertas` — NO INICIADA  
**Artefactos aprobados:** `NFR-HARDWARE-NETWORK-PERIPHERAL-CONTRACT-001`; `NFR-STATION-CAPABILITY-PROFILE-001`; `NFR-NETWORK-SERVICE-PROFILE-001`; `NFR-PERIPHERAL-OPERATION-CONTRACT-001`; `NFR-PROCESS-TECHNICAL-DEPENDENCY-MATRIX-001`; `NFR-TECHNICAL-ACCEPTANCE-MATRIX-001`; `NFR-HARDWARE-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de capacidad física, dispositivo, energía, red, periféricos, instalación, ciclo de vida, mantenibilidad y aceptación técnica; no compra, homologación de marca, diseño eléctrico, certificación de red, selección final de modelos ni autorización de despliegue  
**Cambios en código, migraciones, Supabase, red, hardware, firmware, estaciones, compras o despliegues:** no autorizados

---

#### 1. Propósito

Definir el contrato verificable que deberá cumplir cualquier dispositivo, estación, enlace de red, fuente de energía o periférico utilizado por Vento OS para sostener el proceso empresarial en condiciones reales, sin depender de marcas, modelos, direcciones IP, configuraciones manuales o supuestos no comprobados.

```text
UNA APLICACIÓN ABRE EN UN EQUIPO
≠ EL EQUIPO SOPORTA EL PROCESO

UN DISPOSITIVO ESTÁ CONECTADO
≠ LA RED ES CONFIABLE
≠ EL PERIFÉRICO EJECUTÓ EL EFECTO

UN MODELO FUNCIONA EN UNA PRUEBA
≠ ESTÁ HOMOLOGADO
≠ ES MANTENIBLE
≠ PUEDE OPERAR EN TODAS LAS SEDES

COMPRAR HARDWARE MÁS POTENTE
≠ RESOLVER ERGONOMÍA
≠ RESOLVER RED
≠ RESOLVER CONTINUIDAD
```

La aprobación de esta tarea congela requisitos y perfiles iniciales. No declara adecuados los equipos actuales ni autoriza compras, instalaciones, cambios de red o sustitución de periféricos.

---

#### 2. Continuidad lógica

`NFR-REQ-001` a `NFR-REQ-004` definieron criticidad, capacidad, tiempo y operación degradada. `NFR-REQ-005` y `NFR-REQ-006` fijaron privacidad, trazabilidad y retención. `NFR-REQ-007` estableció accesibilidad y ergonomía. `NFR-REQ-008` convierte esas obligaciones en dependencias físicas y técnicas comprobables.

```text
PROCESO + PASO + ACTOR + ESTACIÓN
        ↓
CARGA + FRECUENCIA + AMBIENTE + RIESGO
        ↓
CAPACIDAD DE DISPOSITIVO + ENERGÍA + RED
        ↓
PERIFÉRICOS + MONTAJE + CONFIGURACIÓN
        ↓
CONTINGENCIA + MANTENIMIENTO + REPUESTOS
        ↓
PRUEBA FÍSICA + ACEPTACIÓN + EVIDENCIA
```

`NFR-REQ-009` definirá observabilidad, soporte y alertas. `NFR-REQ-010` detallará respaldo, RTO y RPO. `NFR-REQ-011` aprobará compatibilidad mínima por dispositivo. `UX-STATION-002` a `UX-STATION-009` seleccionarán y validarán la estación concreta. `PRINT-ARC-001` a `PRINT-ARC-020`, `QUEUE-ARC-001` a `QUEUE-ARC-012`, `AUTH-DEV-001` a `AUTH-DEV-016`, `TI-DOM-001` a `TI-DOM-003`, `TI-DOM-006`, `TI-DOM-009`, `TI-AUTH-001` a `TI-AUTH-004`, `TI-INT-002`, `TI-INT-003` y los paquetes E5 propietarios implementarán los contratos propietarios. Ninguna tarea posterior podrá reducir silenciosamente esta línea base.

---

#### 3. Alcance

El contrato cubre:

- computadores administrativos, portátiles, tablets, móviles, kioscos y POS;
- estaciones fijas, semifijas, móviles, personales y compartidas;
- pantallas, teclado, mouse, táctil, cámara, escáner y lectores especializados;
- impresoras térmicas de tickets, comandas, facturas y etiquetas;
- impresoras de oficina cuando participen en un proceso o evidencia;
- datáfonos, terminales de pago y adaptadores de proveedores;
- básculas, sensores, medidores y dispositivos de captura física;
- indicadores visuales, audio, campanas, señalización y respuesta háptica;
- cargadores, baterías, reguladores, UPS, protección y puesta en marcha;
- red cableada, Wi-Fi, Internet, segmentación, direccionamiento y resolución de nombres;
- montaje, ubicación, cableado, limpieza, protección ambiental y seguridad física;
- firmware, sistema operativo, drivers, aplicaciones base y configuración;
- almacenamiento local, reloj, caché, colas y capacidad offline;
- inventario, garantía, mantenimiento, repuestos, reemplazo y retiro;
- laboratorio, staging, piloto, aceptación, soporte remoto y diagnóstico.

No fija todavía una marca, modelo, proveedor, cantidad de compra, presupuesto, topología física definitiva, obra eléctrica, canalización, modelo de impresora por área ni diseño final de estación.

---

#### 4. Principios obligatorios

1. **Capacidad por proceso:** el equipo se dimensionará por pasos, carga, frecuencia, datos y periféricos; no por preferencia genérica.
2. **Perfil antes que modelo:** primero se aprueba la capacidad mínima; después se compara hardware real.
3. **No dependencia de una IP:** una dirección numérica no será identidad canónica del periférico ni configuración de negocio.
4. **Separación de estados:** dispositivo, red, backend, cola y efecto físico conservarán estados independientes.
5. **Conexión no equivale a ejecución:** aceptar un comando no prueba impresión, cobro, medición o lectura.
6. **Preferencia por simplicidad operable:** menos piezas, adaptadores y pasos manuales cuando no reduzcan control.
7. **Cableado cuando el riesgo lo exige:** una conexión inalámbrica no se elegirá por comodidad si el puesto es fijo y crítico.
8. **Movilidad cuando es necesaria:** un cable no inmovilizará un proceso que exige recorrido, captura o entrega móvil.
9. **Energía forma parte del proceso:** batería, carga, protección y reinicio serán requisitos, no accesorios.
10. **Ambiente real:** grasa, humedad, polvo, temperatura, frío, calor, vibración, ruido y limpieza condicionarán el perfil.
11. **Seguridad por diseño:** red, endpoint, soporte y periféricos no ampliarán autorización ni expondrán secretos.
12. **Accesibilidad física:** tamaño, brillo, montaje, alcance, tacto y señales cumplirán `NFR-REQ-007`.
13. **Operación degradada explícita:** cada dependencia declarará qué ocurre al fallar y cómo se reconcilia.
14. **Mantenibilidad:** toda solución tendrá diagnóstico, repuesto, reemplazo y responsable.
15. **Evidencia antes de homologación:** una referencia no se aprobará sin prueba reproducible en ambiente y estación representativos.
16. **Ciclo de vida completo:** alta, configuración, parche, soporte, traslado, sustitución y retiro quedarán gobernados.
17. **No configuración artesanal permanente:** una intervención manual repetida deberá convertirse en perfil, automatización o procedimiento controlado.
18. **Deuda con dueño:** incompatibilidad, excepción o dependencia legacy tendrá riesgo, alternativa, fecha y tarea de cierre.

---

#### 5. Separación de objetos técnicos

Los siguientes objetos son diferentes y no podrán fusionarse en un único registro ambiguo:

```text
ESTACIÓN
→ lugar y función operativa

DISPOSITIVO
→ endpoint que ejecuta aplicaciones

INSTANCIA DE DISPOSITIVO
→ activo físico concreto con identidad y ciclo de vida

PERFIL DE CAPACIDAD
→ mínimos técnicos requeridos por la estación o proceso

PERIFÉRICO
→ equipo que captura o produce un efecto físico

CONEXIÓN
→ vínculo físico o lógico entre componentes

SERVICIO DE RED
→ conectividad, resolución, tiempo, seguridad o salida requerida

CONFIGURACIÓN
→ versión aprobada de firmware, sistema, driver y parámetros

JOB O COMANDO
→ intención enviada al periférico

RECEIPT FÍSICO
→ evidencia de ejecución o resultado conocido
```

Una estación podrá usar varios dispositivos. Un dispositivo podrá cambiar de estación solo mediante una asignación controlada. Un periférico podrá atender varias estaciones únicamente cuando la ruta, capacidad, cola y contingencia estén aprobadas.

---

#### 6. Contrato obligatorio de perfil

Cada perfil de `NFR-STATION-CAPABILITY-PROFILE-001` deberá declarar:

```text
profile_id
station_or_process_scope
criticality
actors_and_concurrency
applications_and_routes
interaction_modes
cpu_memory_storage_class
display_and_input_profile
operating_system_and_runtime
local_data_and_offline_budget
power_profile
network_profile
peripheral_dependencies
environmental_profile
mounting_and_cabling
security_posture
accessibility_profile
maintenance_and_spares
failure_modes
contingency
acceptance_scenarios
owner
version
status
```

Un campo desconocido será `UNRESOLVED` con tarea propietaria. No se completará con un modelo supuesto ni con el equipo disponible por defecto.

---

#### 7. Clases iniciales de estación y dispositivo

| Clase                     | Uso predominante                           | Obligaciones principales                                                                   |
| ------------------------- | ------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `HW-ADMIN`                | administración, análisis y configuración   | teclado y pantalla adecuados, multitarea, seguridad, respaldo de configuración y soporte   |
| `HW-PERSONAL-MOBILE`      | ANIMA, PASS y movilidad individual         | batería, conectividad variable, protección local, compatibilidad y recuperación            |
| `HW-SHARED-TABLET`        | servicio, recepción y operación compartida | cambio de actor, montaje o movilidad, carga continua, aislamiento y limpieza               |
| `HW-FIXED-POS`            | caja, mostrador, kiosco y punto fijo       | conexión estable, energía protegida, periféricos, arranque controlado y acceso restringido |
| `HW-PRODUCTION-STATION`   | cocina, panadería, repostería y despacho   | ambiente adverso, objetivos táctiles, limpieza, guantes, montaje y contingencia            |
| `HW-MOBILE-LOGISTICS`     | inventario, remisión, conteo y recorrido   | lectura, cámara o escáner, batería, resistencia física, roaming y captura offline          |
| `HW-PRINT-STATION`        | tickets, comandas, facturas y etiquetas    | colas, medios, resolución, corte, lenguaje, routing, receipts y repuestos                  |
| `HW-PAYMENT-ENDPOINT`     | cobro físico                               | contrato de proveedor, aislamiento, conciliación, recibo y contingencia                    |
| `HW-MEASUREMENT-ENDPOINT` | peso, temperatura u otra medición          | unidad, precisión, calibración, identificación, trazabilidad y revisión                    |

Las clases son acumulativas. `UX-STATION-003`, `UX-STATION-006` y `NFR-REQ-011` podrán especializarlas sin reemplazar el contrato común.

---

#### 8. Dimensionamiento de cómputo

El dimensionamiento deberá basarse en una carga reproducible que incluya:

- aplicaciones abiertas y cambio entre ellas;
- pestañas, vistas, tablas, imágenes y documentos máximos razonables;
- concurrencia de actores o procesos en la estación;
- caché, base local, outbox, adjuntos y almacenamiento temporal;
- cámara, escáner, impresión, audio u otros periféricos simultáneos;
- actualizaciones de datos y sincronización;
- operación sostenida durante el pico real;
- margen de crecimiento aprobado en `NFR-REQ-002`;
- presupuestos de respuesta de `NFR-REQ-003`;
- compatibilidad mínima de `NFR-REQ-011`.

No se homologará un equipo usando solo una pantalla vacía, un usuario técnico, datos mínimos o conexión ideal. CPU, memoria y almacenamiento deberán medirse bajo carga representativa y con reserva suficiente para recuperación, actualización y crecimiento.

---

#### 9. Pantalla y entrada

Cada perfil deberá declarar:

- tamaño físico, resolución, densidad y distancia de lectura;
- brillo, contraste, reflejo y ángulo de visión;
- orientación permitida y bloqueo cuando corresponda;
- táctil, teclado, mouse, lector o modalidad híbrida;
- tamaño de objetivos según `NFR-REQ-007`;
- operación con guantes, humedad o una mano cuando aplique;
- teclado virtual y captura de valores numéricos;
- método de limpieza sin activaciones accidentales;
- prevención de burn-in o imagen persistente cuando exista operación continua;
- protección contra acceso físico a puertos o configuraciones no autorizadas.

La resolución nominal no bastará. La interfaz deberá probarse en el tamaño, escala, orientación y distancia reales.

---

#### 10. Ambiente, protección y limpieza

`NFR-STATION-CAPABILITY-PROFILE-001` clasificará como mínimo:

| Dimensión              | Estados iniciales                                                              |
| ---------------------- | ------------------------------------------------------------------------------ |
| humedad y salpicadura  | ordinaria, ocasional, frecuente                                                |
| grasa o polvo          | bajo, medio, alto                                                              |
| temperatura            | ambiente, frío, calor o variación significativa                                |
| vibración y movimiento | estable, moderado, móvil                                                       |
| iluminación            | controlada, reflejo, baja luz o variación                                      |
| ruido                  | bajo, medio, alto                                                              |
| limpieza               | seca, húmeda, desinfección frecuente                                           |
| exposición física      | oficina, mostrador, cocina, producción, bodega, vehículo o exterior controlado |

La selección concreta deberá demostrar que carcasa, puertos, ventilación, pantalla, adhesivos, cables y montaje toleran el perfil sin crear riesgo sanitario, eléctrico o de lesión. Cuando se requiera protección adicional, se validará que no cause sobrecalentamiento, pérdida táctil, mala lectura o mantenimiento imposible.

---

#### 11. Montaje, postura y cableado

Toda estación fija o semifija deberá definir:

- altura, inclinación, distancia y alcance;
- soporte estable y método de fijación;
- retiro rápido autorizado cuando sea necesario;
- ruta de cables sin tensión, tropiezo, calor, humedad o interferencia;
- protección de conectores y adaptadores;
- acceso de mantenimiento sin desmontaje destructivo;
- espacio para papel, etiquetas, rollos, limpieza y ventilación;
- visibilidad para el actor y privacidad frente a terceros;
- recuperación después de movimiento o golpe accidental.

Una extensión temporal, adaptador suelto o cable atravesando una zona de paso no será instalación aceptada. Los hallazgos se resolverán en `UX-STATION-006`, `TI-DOM-001` a `TI-DOM-003`, `TI-DOM-006`, `TI-DOM-009` o el paquete E5 propietario.

---

#### 12. Energía y recuperación de encendido

Cada estación declarará:

```text
power_source
consumption_profile
surge_protection
ups_or_battery_requirement
minimum_autonomy_or_safe_shutdown
charging_method
startup_sequence
auto_recovery_policy
clock_dependency
power_failure_contingency
```

Reglas:

1. La autonomía se derivará de criticidad y tiempo de contingencia, no de un valor global.
2. El corte y retorno de energía no podrá duplicar trabajos, corromper colas ni dejar sesión de actor incorrecta.
3. UPS, batería y cargador deberán probarse bajo carga real y estado degradado.
4. Reinicio automático solo se permitirá cuando no omita identificación, integridad o verificación física.
5. Un equipo apagado o cargando no podrá bloquear el único camino operativo sin alternativa.
6. La pérdida de energía deberá producir evento o evidencia local cuando el hardware lo permita y alimentar `NFR-REQ-009`.

`NFR-REQ-010` definirá recuperación de servicios y datos; esta tarea define la dependencia física y la prueba del punto operativo.

---

#### 13. Batería y movilidad

Los perfiles móviles deberán declarar:

- duración durante jornada y pico real;
- degradación esperada de batería;
- tiempo y oportunidad de carga;
- cargador, base, cable y repuesto;
- comportamiento con batería baja;
- persistencia segura de operación pendiente;
- bloqueo y borrado ante pérdida o retiro;
- resistencia a caída, movimiento y transporte;
- conectividad y roaming entre zonas;
- procedimiento de sustitución sin perder actor, contexto o evidencia.

No se aceptará depender de carga improvisada en una zona húmeda, productiva o de atención. La batería baja no autorizará eliminar datos, desactivar controles o usar una cuenta compartida alternativa.

---

#### 14. Reloj y referencia temporal

Dispositivo, red y servicio deberán conservar una referencia temporal verificable. Se comprobarán:

- sincronización y fuente de tiempo;
- zona horaria y cambio de fecha;
- deriva durante desconexión;
- orden entre hora del hecho, registro, envío, recepción y confirmación;
- comportamiento cuando el reloj local sea incorrecto;
- reinicio, batería agotada y restauración de configuración;
- bloqueo de decisiones sensibles que dependan de vigencia.

El reloj local no podrá prolongar sesión, turno, autorización, receta, lease, ventana de pago ni validez de evidencia. Las tareas propietarias son `NFR-REQ-004`, `NFR-REQ-009`, `AUTH-CTX-030` y los paquetes correspondientes.

---

#### 15. Modelo de red

`NFR-NETWORK-SERVICE-PROFILE-001` deberá describir, por sede, zona y estación:

```text
network_profile_id
physical_medium
logical_segment
trust_boundary
address_assignment
name_resolution
time_service
internet_dependency
internal_service_dependency
bandwidth_and_latency_budget
loss_and_jitter_tolerance
roaming_requirement
redundancy_or_fallback
security_controls
observability
configuration_owner
change_and_rollback
contingency
```

Una aplicación o periférico no configurará la red como detalle oculto. Toda dependencia deberá ser visible en el perfil de proceso y en readiness.

---

#### 16. Segmentación y límites de confianza

La red separará de forma proporcional:

- administración tecnológica;
- endpoints corporativos gestionados;
- estaciones operativas compartidas;
- periféricos e IoT;
- invitados y dispositivos no gestionados;
- infraestructura, servidores o servicios internos;
- laboratorio, staging y diagnóstico;
- proveedores o soporte remoto temporal.

La segmentación no se basará solo en nombres de Wi-Fi. Cada flujo necesario deberá estar permitido explícitamente; el resto fallará cerrado. Un periférico comprometido no deberá convertirse en ruta lateral hacia datos, administración o credenciales. La segmentación final y los controles técnicos pertenecen a `TI-DOM-001` a `TI-DOM-003`, `TI-DOM-006`, `TI-DOM-009`, `TI-AUTH-001` a `TI-AUTH-004`, `AUTH-DEV-001` a `AUTH-DEV-016` y los paquetes E5 propietarios.

---

#### 17. Red cableada, Wi-Fi y movilidad

1. Puestos fijos críticos y periféricos estables evaluarán cableado como opción predeterminada.
2. Wi-Fi se aprobará cuando aporte movilidad o evite una instalación física desproporcionada y demuestre cobertura, capacidad y estabilidad.
3. La cobertura se medirá en puntos de trabajo, recorrido y horas de carga; no desde un único lugar vacío.
4. Se probarán interferencia, saturación, roaming, reconexión, pérdida parcial y cambio entre puntos de acceso.
5. Una señal visible no implica capacidad, salida a Internet, resolución, acceso al servicio ni autorización.
6. Cable y Wi-Fi podrán coexistir con prioridad y failover definidos, sin crear doble identidad ni rutas inconsistentes.
7. Dispositivos de invitados o personales no compartirán el mismo nivel de confianza que estaciones gestionadas.

---

#### 18. Direccionamiento, nombres y descubrimiento

- DHCP, reserva administrada u otro mecanismo aprobado asignará direcciones sin depender de edición manual en cada cliente.
- Una IP no será clave empresarial, nombre de impresora, identidad del activo ni destino persistido en un proceso.
- Los servicios y periféricos usarán identidad estable, nombre o registro resoluble cuando la tecnología lo permita.
- Cambiar equipo, puerto, dirección o punto de acceso no deberá exigir modificar código ni reglas de negocio.
- Descubrimiento automático deberá autenticarse o limitarse al segmento aprobado y no elegir el primer equipo encontrado.
- Toda caché de resolución tendrá expiración, actualización y diagnóstico.
- Conflictos de dirección, duplicidad de nombre y dispositivo no autorizado deberán detectarse antes de operación.

Las colas y rutas de impresión pertenecerán al contrato de impresión, no a una IP escrita en la tablet.

---

#### 19. Dependencia de Internet y operación local

Cada paso declarará si requiere:

- Internet público;
- servicio cloud específico;
- acceso a Supabase;
- servicio interno de sede;
- comunicación local con periférico;
- sincronización diferida;
- procedimiento manual controlado.

Se probarán por separado: Wi-Fi disponible sin Internet, Internet disponible sin backend, backend disponible sin periférico, red local aislada, DNS fallido, servicio degradado y retorno intermitente. `NFR-REQ-004` gobierna la semántica offline; esta tarea asegura que la topología y el hardware puedan sostenerla.

---

#### 20. Capacidad y presupuesto de red

Los presupuestos deberán derivarse de `NFR-REQ-002` y `NFR-REQ-003` y considerar:

- actores y dispositivos concurrentes;
- tamaño y frecuencia de consultas, eventos, imágenes y documentos;
- sincronización de backlog después de una caída;
- impresión, escaneo, streaming o soporte remoto;
- latencia, pérdida, jitter y reconexión tolerables;
- tráfico de actualización, observabilidad y mantenimiento;
- crecimiento y picos por sede;
- reserva para contingencia y recuperación.

Un speed test aislado no certificará la red. Se medirán experiencia del proceso, errores, tiempo de recuperación y comportamiento simultáneo de estaciones representativas.

---

#### 21. Seguridad de red y endpoint

Toda solución deberá definir:

- autenticación de dispositivo o usuario cuando aplique;
- cifrado de tránsito y almacenamiento local proporcional;
- bloqueo de puertos, interfaces y configuraciones no necesarias;
- separación de cuenta de soporte y cuenta operativa;
- mínimos de sistema, parches, firmware y navegador;
- bloqueo automático y reautenticación;
- gestión de secretos sin archivos ni etiquetas visibles;
- capacidad de revocación, borrado o aislamiento;
- soporte remoto temporal, autorizado y auditado;
- detección de postura incompatible antes de acciones sensibles.

Un administrador local permanente o contraseña compartida no será mecanismo de mantenimiento aceptado. `AUTH-DEV-001` a `AUTH-DEV-016`, `TI-AUTH-001` a `TI-AUTH-004`, `TI-DOM-001` a `TI-DOM-003`, `TI-DOM-006` y `TI-DOM-009` son propietarios de implementación.

---

#### 22. Configuración, firmware y ciclo de vida

Cada instancia deberá conservar:

```text
asset_id
model_and_revision
serial_or_hardware_identity
assigned_station
owner_and_custodian
firmware_version
os_and_patch_level
driver_and_runtime_versions
approved_configuration_profile
network_identity
warranty_and_support
last_validation
maintenance_status
replacement_status
retirement_evidence
```

Una actualización de firmware, sistema, navegador, driver o SDK deberá probar compatibilidad, rollback y efecto sobre colas, lectura, impresión, pantalla, accesibilidad y seguridad. Un equipo sin soporte o sin ruta de actualización tendrá plan de reemplazo y no se mantendrá indefinidamente por costumbre.

---

#### 23. Dispositivo compartido

Además de `AUTH-DEV-001` a `AUTH-DEV-016` y `NFR-REQ-007`, el hardware compartido deberá:

- permitir identificación y cambio de actor sin teclado o pasos impracticables;
- bloquear acceso a configuración, notificaciones y aplicaciones ajenas;
- retirar caché, archivos, portapapeles y preferencias del actor anterior;
- conservar batería y conexión durante el relevo;
- diferenciar dispositivo, principal técnico y actor humano;
- impedir que el administrador del equipo transfiera su autoridad;
- soportar limpieza, bloqueo, reinicio y recuperación sin romper trazabilidad;
- mostrar claramente sede, área, estación y estado de sincronización.

El modo kiosco o cierre de aplicación no sustituirá la autorización del servidor ni la sesión de actor.

---

#### 24. Contrato común de periférico

`NFR-PERIPHERAL-OPERATION-CONTRACT-001` adoptará estados separados:

```text
NOT_CONFIGURED
UNAVAILABLE
READY
COMMAND_CREATED
QUEUED
SENT
ACCEPTED_BY_ADAPTER
PHYSICAL_EXECUTION_PENDING
PHYSICAL_RESULT_CONFIRMED
RESULT_UNKNOWN
FAILED_RETRYABLE
FAILED_FINAL
CANCELLED_BEFORE_EFFECT
RECONCILIATION_REQUIRED
```

Cada comando deberá conservar:

- identificador e idempotency key;
- proceso, instancia, actor, sede, área y estación;
- periférico y perfil de configuración;
- payload mínimo y hash cuando aplique;
- timestamps de creación, envío, aceptación y resultado;
- intento, error, timeout y política de reintento;
- receipt físico o razón de resultado desconocido;
- conciliación y acción manual autorizada.

Un timeout no autorizará repetir ciegamente una acción física.

---

#### 25. Impresión de tickets, comandas y facturas

La impresión deberá resolver mediante contrato:

```text
process_event
→ print_intent
→ routing_policy
→ logical_queue
→ approved_device_profile
→ render_version
→ physical_job
→ receipt_or_unknown_result
```

Reglas:

1. La ruta se definirá por sede, área, estación, proceso, tipo de documento y contingencia; no por una IP escrita por el usuario.
2. Una impresora física podrá cambiar sin alterar el evento empresarial.
3. Reimpresión exigirá razón, actor y vínculo con el trabajo original.
4. Reintento automático deberá evitar duplicado o marcar claramente copia.
5. Papel agotado, tapa abierta, desconexión, buffer, corte, atasco y impresión en blanco serán estados diagnosticables.
6. Cola local y remota se conciliarán sin perder orden ni mezclar áreas.
7. Una vista previa o respuesta de adaptador no probará impresión física.
8. Contingencia manual conservará numeración, custodia y conciliación.

La arquitectura y selección definitiva pertenecen a `PRINT-ARC-001` a `PRINT-ARC-020`, `UX-STATION-006` y paquetes E5.

---

#### 26. Etiquetas y perfiles de medio

Cada perfil de etiqueta deberá versionar:

- propósito y recurso identificado;
- ancho, alto, orientación, margen y zona segura;
- material, adhesivo, temperatura y superficie;
- resolución y lenguaje de impresión;
- texto humano legible;
- simbología, densidad y nivel de corrección cuando aplique;
- identificador, checksum o verificación;
- plantilla y versión de datos;
- impresora compatible y configuración;
- prueba de lectura, adhesión, durabilidad y reimpresión.

Una plantilla no se aprobará solo porque se vea bien en pantalla. Deberá imprimirse y escanearse con equipos, medios, distancias y ambiente representativos. Medidas y simbologías actuales se tratarán como perfiles legacy hasta validación.

---

#### 27. Escáner, cámara y códigos

- el lector deberá identificar formato soportado, distancia, iluminación, orientación y tasa de lectura;
- lectura automática no confirmará por sí sola recurso, cantidad, actor o transición;
- el valor se validará contra el contrato canónico y el contexto;
- habrá entrada manual o búsqueda autorizada cuando sea operativamente viable;
- doble lectura deberá deduplicarse por intención y estado;
- cámara deberá declarar permisos, privacidad, almacenamiento temporal y calidad mínima;
- falla del lector no permitirá omitir validaciones ni inventar un código;
- hardware fijo, portátil y cámara se compararán por frecuencia, movilidad, higiene, precisión y mantenimiento.

`UX-STATION-002`, `UX-STATION-006`, `NFR-REQ-007` y paquetes de NEXO, FOGO, PULSO y ORIGO son propietarios de concreción.

---

#### 28. Terminales de pago

El terminal de pago se tratará como sistema externo y periférico con estado propio:

- identidad del comercio y punto;
- orden o intención correlacionada;
- monto, moneda y versión;
- envío, aceptación, aprobación, rechazo, cancelación y resultado desconocido;
- recibo o referencia del proveedor;
- conciliación y cierre de caja;
- timeout, reverso, reintento y duplicidad;
- conectividad y contingencia;
- límites de datos sensibles visibles para Vento OS.

Backend online, orden creada o pantalla de éxito no equivalen a cobro confirmado. Vento OS no almacenará secretos ni datos restringidos del medio de pago fuera del contrato permitido.

---

#### 29. Básculas, sensores y mediciones

Toda medición deberá declarar:

- dispositivo e identidad física;
- magnitud, unidad, resolución, rango y tolerancia;
- calibración, verificación y vencimiento;
- tara, cero, estabilidad y condición ambiental;
- timestamp y actor;
- captura manual o automática;
- valor original, transformación y redondeo;
- estado de conexión y calidad;
- tratamiento de lectura fuera de rango o inestable;
- evidencia y revisión cuando afecte inventario, receta, calidad o cumplimiento.

Una lectura no calibrada o con unidad ambigua no podrá aplicarse silenciosamente. El diseño específico pertenecerá al dominio propietario y al paquete E5 correspondiente.

---

#### 30. Señales, audio y dispositivos de aviso

Campana, sonido, luz, display o vibración serán ayudas, no la única fuente de verdad. Deberán:

- identificar prioridad y origen;
- tener alternativa perceptible según `NFR-REQ-007`;
- evitar confusión entre procesos o áreas;
- permitir prueba controlada;
- registrar fallo cuando el hardware lo permita;
- no exponer información sensible a audiencia no autorizada;
- conservar escalamiento cuando la señal no sea atendida;
- diferenciar notificación, acuse y efecto empresarial.

La selección y ubicación concreta se resolverán en `UX-STATION-006`, `NFR-REQ-009` y los paquetes E5 propietarios.

---

#### 31. Almacenamiento local y capacidad física

Cada dispositivo deberá tener presupuesto para:

- aplicación y actualizaciones;
- caché autorizada;
- base local, outbox e inbox;
- adjuntos, fotografías y documentos pendientes;
- logs y diagnóstico limitado;
- espacio de trabajo temporal;
- margen de recuperación y rollback.

Al acercarse al límite se aplicará backpressure, priorización, limpieza segura o contingencia. Nunca se eliminarán silenciosamente operaciones, evidencia o auditoría. Almacenamiento removible no se utilizará sin política explícita de cifrado, custodia, montaje y retiro.

---

#### 32. Inventario y configuración canónica

Cada activo, periférico, accesorio crítico y componente de red deberá existir en un inventario con:

- identidad, clase y propietario;
- sede, área, estación y custodio;
- estado operativo y criticidad;
- configuración aprobada;
- red, energía y periféricos asociados;
- garantía, proveedor y soporte;
- mantenimiento, incidentes y cambios;
- repuestos y reemplazo compatible;
- fecha de revisión y evidencia;
- baja, borrado, disposición y retiro de accesos.

Una hoja aislada podrá ser fuente transitoria, pero no certificará configuración ni estado actual. `TI-DOM-001` a `TI-DOM-003`, `TI-DOM-006`, `TI-DOM-009`, `TI-UX-003`, `TI-UX-005`, `TI-INT-002`, `TI-INT-003` y las tareas de activos de NEXO deberán converger posteriormente en un contrato propietario sin inventarios competidores.

---

#### 33. Mantenimiento, repuestos y sustitución

Toda dependencia crítica tendrá:

- propietario de soporte;
- procedimiento de diagnóstico;
- nivel de mantenimiento permitido en sede;
- repuesto, equipo sustituto o contingencia;
- configuración reproducible;
- medio, cable, cargador, batería o consumible crítico;
- criterio de reparación versus reemplazo;
- tiempo objetivo vinculado con `NFR-REQ-001` y `NFR-REQ-010`;
- prueba posterior a intervención;
- registro de cambio y cierre.

El repuesto deberá probarse antes de la emergencia. Cambiar un equipo no autorizará copiar credenciales, claves, sesiones o datos locales sin procedimiento.

---

#### 34. Soporte remoto y diagnóstico

El soporte remoto deberá ser:

- solicitado o autorizado;
- limitado a equipo, tiempo y finalidad;
- atribuible a técnico y aprobador;
- visible cuando sea viable;
- revocable;
- registrado sin capturar datos sensibles innecesarios;
- compatible con dispositivo compartido y privacidad;
- incapaz de conceder al técnico permisos empresariales no autorizados;
- cerrado con evidencia, cambio ejecutado y validación del proceso.

Capturas, logs y exportaciones de diagnóstico seguirán `NFR-REQ-005`, `NFR-REQ-006` y `NFR-REQ-009`.

---

#### 35. Compra, homologación y aceptación

Ningún equipo o periférico se comprará como estándar únicamente por precio, ficha técnica, recomendación comercial o prueba aislada. `NFR-TECHNICAL-ACCEPTANCE-MATRIX-001` exigirá:

1. perfil y proceso objetivo;
2. muestra o unidad de evaluación cuando el riesgo lo justifique;
3. compatibilidad de sistema, driver, navegador, SDK y red;
4. prueba de carga, ambiente, energía y conectividad;
5. prueba de periféricos y medios reales;
6. accesibilidad y ergonomía;
7. seguridad, administración y actualización;
8. mantenimiento, garantía, repuestos y vida útil;
9. contingencia y sustitución;
10. coste total de propiedad y no solo compra;
11. burn-in o periodo de observación proporcional;
12. resultado aprobado, condicionado o rechazado con evidencia.

Una referencia condicionada tendrá límite de alcance y tarea de cierre. Una compra no convierte automáticamente el modelo en canónico.

---

#### 36. Observabilidad técnica mínima

Aunque `NFR-REQ-009` detallará observabilidad, todo perfil deberá anticipar señales mínimas:

- disponibilidad y última conexión;
- batería, energía y reinicio;
- almacenamiento y memoria;
- versión y postura;
- calidad de red y resolución;
- estado de cola y periférico;
- consumible o fallo cuando sea detectable;
- reloj y sincronización;
- error clasificado y acción recomendada;
- estación, sede y responsable.

La ausencia de telemetría nativa deberá compensarse con verificación, procedimiento o dispositivo alterno. La observabilidad no contendrá secretos ni payloads sensibles completos.

---

#### 37. Accesibilidad, ergonomía y seguridad física

El hardware no podrá invalidar `NFR-REQ-007`. Se comprobarán:

- tamaño y legibilidad de pantalla;
- contraste y brillo en ambiente real;
- tacto, teclado, lector y alternativa;
- alcance, postura, fatiga y movimientos repetitivos;
- audio, señal visual y privacidad;
- montaje y estabilidad;
- operación con guantes, humedad o una mano;
- cables, bordes, calor, peso y riesgo de caída;
- limpieza y desinfección;
- acceso a puertos y controles físicos;
- uso por personas con necesidades permanentes, temporales o situacionales.

Una carcasa, montaje o protector que vuelva inaccesible la interfaz deberá rechazarse aunque proteja el equipo.

---

#### 38. Línea base tecnológica conocida

La siguiente evidencia orienta el inventario, pero no constituye aprobación objetivo:

| Familia observada                     | Uso o situación conocida                                        | Tratamiento obligatorio                                                                       |
| ------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| tablets Android compartidas           | servicio y operación en sedes comerciales                       | verificar modelo, batería, sesión, montaje, red y aislamiento por actor                       |
| POS o pantallas táctiles              | caja y áreas productivas                                        | verificar perfil de estación, multiárea, energía, conexión y mantenimiento                    |
| impresoras térmicas DIG E200i o E200L | tickets, facturas o comandas por LAN o USB                      | tratar como referencia legacy; validar protocolo, routing, buffer, corte, contenido y soporte |
| impresoras Zebra ZD220 o ZD230        | etiquetas Code128, DataMatrix y perfiles de empaque o ubicación | validar medio, resolución, plantilla, lectura, durabilidad y compatibilidad                   |
| cámaras y escáneres                   | QR, DataMatrix, Code128 e identificación de recursos            | comparar cámara, lector fijo y portátil por estación y frecuencia                             |
| datáfonos                             | cobro físico                                                    | separar conectividad, recibo del proveedor y confirmación empresarial                         |
| Epson L5590 y equipos de oficina      | impresión administrativa y mantenimiento                        | clasificar criticidad, cola, suministro y dependencia del proceso                             |
| redes Wi-Fi, LAN y subredes separadas | conexión de tablets, POS e impresoras                           | inventariar topología real, direccionamiento, cobertura, aislamiento y fallos de resolución   |

Toda diferencia entre esta línea base y la realidad vigente se vinculará con `UX-STATION-001`, `UX-STATION-006`, `TI-DOM-001` a `TI-DOM-003`, `TI-DOM-006`, `TI-DOM-009` o el paquete E5 propietario. No se inventará un activo ausente ni se mantendrá uno retirado por aparecer aquí.

---

#### 39. Perfil por proceso

`NFR-PROCESS-TECHNICAL-DEPENDENCY-MATRIX-001` tendrá exactamente una fila por `VPROC-0001` a `VPROC-0069` y declarará:

```text
process_id
critical_steps
actors
sites_areas_and_stations
hardware_classes
concurrency_and_load
display_and_input
network_services
internet_and_local_dependencies
power_and_autonomy
peripherals
media_and_consumables
environment
security_and_accessibility
offline_boundary
failure_modes
contingency
maintenance_and_spares
acceptance_tests
owners
unresolved_items
```

Un proceso sin dispositivo dedicado podrá declarar `NO_DEDICATED_HARDWARE`, pero deberá probar el dispositivo y canal que realmente utiliza. `NO_APLICA` exigirá justificación.

---

#### 40. Validación y escenarios mínimos

Cada perfil aplicable deberá probar al menos:

1. arranque en frío y reinicio inesperado;
2. carga ordinaria y pico sostenido;
3. almacenamiento cercano al límite;
4. batería baja y sustitución;
5. corte y retorno de energía;
6. Wi-Fi visible sin Internet;
7. Internet sin backend;
8. backend sin periférico;
9. cable desconectado y reconectado;
10. roaming y señal intermitente;
11. DNS o resolución fallida;
12. dirección modificada o periférico reemplazado;
13. reloj incorrecto;
14. driver o firmware incompatible;
15. papel, etiqueta o consumible agotado;
16. comando aceptado con resultado físico desconocido;
17. reintento y reimpresión;
18. escaneo doble, ilegible o equivocado;
19. lectura manual alternativa;
20. cambio de actor, área o estación;
21. limpieza, guantes, humedad, reflejo y ruido;
22. soporte remoto y cierre;
23. sustitución por repuesto;
24. retorno desde contingencia y conciliación.

La combinación exacta dependerá del perfil; omitir un escenario requerirá `NO_APLICA` justificado.

---

#### 41. Severidad y excepciones

| Nivel     | Ejemplo                                                                                               | Efecto                                      |
| --------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| `TECH-P0` | riesgo físico, pérdida de dinero, efecto duplicado o proceso crítico sin alternativa                  | bloquea piloto, cutover y operación         |
| `TECH-P1` | estación crítica inestable, red no reproducible, periférico sin conciliación o seguridad insuficiente | bloquea release o aceptación                |
| `TECH-P2` | degradación con alternativa controlada y riesgo limitado                                              | puede condicionarse con dueño y vencimiento |
| `TECH-P3` | mejora no crítica sin efecto en integridad, seguridad o continuidad                                   | planificable                                |

`NFR-HARDWARE-EXCEPTION-REGISTER-001` exigirá perfil, equipo, alcance, razón, riesgo, alternativa, propietario, fecha, tarea de cierre y evidencia. No habrá excepción permanente por disponibilidad histórica del equipo.

---

#### 42. Responsabilidad documental

| Decisión o implementación          | Tarea propietaria                                                                                                       |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| perfil y selección de estación     | `UX-STATION-002`, `UX-STATION-003`, `UX-STATION-006`                                                                    |
| operación degradada física         | `UX-STATION-007`; `NFR-REQ-004`                                                                                         |
| prototipo y aprobación física      | `UX-STATION-008`; `UX-STATION-009`                                                                                      |
| identidad y postura de dispositivo | `AUTH-DEV-001` a `AUTH-DEV-016`; `TI-DOM-001` a `TI-DOM-003`; `TI-DOM-006`; `TI-DOM-009`; `TI-AUTH-001` a `TI-AUTH-004` |
| impresión y colas                  | `PRINT-ARC-001` a `PRINT-ARC-020`; `QUEUE-ARC-001` a `QUEUE-ARC-012`                                                    |
| integraciones de periféricos       | `INT-EXT-001` a `INT-EXT-020`; paquetes E5 propietarios                                                                 |
| observabilidad y soporte           | `NFR-REQ-009`; `OBS-ARC-001` a `OBS-ARC-016`; `TI-UX-003`; `TI-UX-005`                                                  |
| respaldo y recuperación            | `NFR-REQ-010`; `CONT-DOM-001` a `CONT-DOM-015`                                                                          |
| compatibilidad mínima              | `NFR-REQ-011`                                                                                                           |
| compra, instalación y despliegue   | paquetes E5 y readiness aplicables                                                                                      |
| certificación integral             | `UX-QA-001` a `UX-QA-030`; BLOQUE U                                                                                     |

Todo hallazgo se vinculará de inmediato con una tarea de esta tabla o generará una nueva tarea explícita en el bloque propietario. No quedará pendiente narrativo sin dueño documental.

---

#### 43. Guardrails de cierre

Deberán fallar revisión, CI, readiness, piloto o certificación cuando exista:

- proceso crítico sin perfil de dispositivo, red, energía o contingencia;
- hardware aprobado solo por marca, modelo o ficha técnica;
- IP hardcodeada como identidad o ruta de negocio;
- periférico elegido automáticamente sin validación de destino;
- comando físico sin idempotencia, receipt o conciliación;
- impresora o datáfono online asumido desde el estado del backend;
- cola que mezcle sedes, áreas, actores o tipos de documento;
- dispositivo compartido sin cambio de actor y aislamiento;
- estación fija crítica dependiente de Wi-Fi no validado sin justificación;
- red sin segmentación o dispositivo no gestionado con acceso equivalente;
- batería, energía o almacenamiento sin presupuesto;
- reloj incorrecto capaz de ampliar vigencia;
- firmware, sistema o driver sin versión aprobada;
- soporte remoto permanente o no auditado;
- medición sin unidad, calibración o trazabilidad;
- etiqueta no probada físicamente;
- equipo sin mantenimiento, repuesto o reemplazo;
- excepción `TECH-P0` o `TECH-P1` abierta sin alternativa aprobada;
- perfil de proceso o evidencia física incompletos.

---

#### 44. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PROC-425 a TREQ-PROC-460
```

Cobertura:

1. perfiles antes que modelos;
2. inventario y configuración de activos;
3. dimensionamiento bajo carga;
4. pantalla y modalidades de entrada;
5. ambiente y protección;
6. montaje, postura y cableado;
7. energía, UPS y reinicio;
8. batería y movilidad;
9. reloj e integridad temporal;
10. contrato de red por estación;
11. segmentación y límites de confianza;
12. cableado, Wi-Fi, cobertura y roaming;
13. direccionamiento y resolución estable;
14. independencia de IP hardcodeada;
15. Internet, backend y red local separados;
16. capacidad, latencia, pérdida y recuperación;
17. seguridad y postura de endpoint;
18. firmware, sistema, driver y rollback;
19. dispositivo compartido;
20. máquina de estados de periférico;
21. routing lógico de impresión;
22. idempotencia, reimpresión y resultado desconocido;
23. perfiles de ticket, comanda y factura;
24. etiquetas, medios y lectura física;
25. escáner, cámara y alternativa manual;
26. datáfono y conciliación;
27. básculas, sensores y calibración;
28. avisos visuales, sonoros y hápticos;
29. almacenamiento local y backpressure;
30. mantenimiento, repuestos y sustitución;
31. soporte remoto auditado;
32. compra, homologación y burn-in;
33. observabilidad técnica mínima;
34. accesibilidad y seguridad física;
35. matriz de 69 procesos;
36. pruebas de fallo físico y gate de certificación.

La evidencia deberá indicar que proviene de `NFR-REQ-008` aprobada.

---

#### 45. Criterios de aceptación

- [ ] Se separan estación, dispositivo, activo físico, perfil, periférico, conexión, servicio, configuración, comando y receipt.
- [ ] Ninguna marca, modelo o dirección IP queda aprobada como solución canónica por esta tarea.
- [ ] Se definen clases iniciales de dispositivo y contrato completo de perfil.
- [ ] Cómputo, pantalla, entrada y almacenamiento se dimensionan con carga representativa.
- [ ] Ambiente, montaje, limpieza, cableado y seguridad física son verificables.
- [ ] Energía, batería, autonomía, reinicio y reloj tienen reglas explícitas.
- [ ] La red declara medio, segmento, confianza, nombres, tiempo, capacidad, fallback y propietario.
- [ ] Cableado y Wi-Fi se seleccionan por riesgo, movilidad y evidencia.
- [ ] Ningún proceso o cola depende de una IP hardcodeada como identidad.
- [ ] Internet, backend, red local y periférico conservan estados separados.
- [ ] Endpoint, firmware, sistema, driver, postura, soporte y retiro tienen ciclo de vida.
- [ ] Dispositivo compartido conserva identidad, aislamiento, carga y recuperación.
- [ ] Periféricos usan comando idempotente, estados, receipt y conciliación.
- [ ] Impresión usa routing lógico, cola, perfil y evidencia física.
- [ ] Tickets, etiquetas, códigos, escáneres y cámaras tienen perfiles y alternativas.
- [ ] Pagos y mediciones conservan contrato, unidad, estado y evidencia propios.
- [ ] Almacenamiento lleno no elimina silenciosamente trabajo o evidencia.
- [ ] Inventario, mantenimiento, repuestos, reemplazo y soporte tienen propietarios.
- [ ] Compra y homologación exigen prueba física, seguridad, mantenibilidad y coste total.
- [ ] La línea base conocida se trata como evidencia por verificar, no como estándar aprobado.
- [ ] Los 69 procesos tendrán perfil individual antes de implementación.
- [ ] Se definen severidad, guardrails y registro de excepciones.
- [ ] Se incorporan `TREQ-PROC-425` a `TREQ-PROC-460` al registro completo.
- [ ] No se implementan código, migraciones, Supabase, red, hardware, compras ni despliegues.
- [ ] `NFR-REQ-009` permanece no iniciada.

---

#### 46. Estado y continuidad

```text
NFR-REQ-006   APROBADA
NFR-REQ-007   APROBADA
NFR-REQ-008   APROBADA
NFR-REQ-009   NO INICIADA
```

La aprobación explícita de esta tarea congela el contrato no funcional inicial de hardware, red y periféricos. No homologa los activos actuales, no aprueba una compra y no certifica la infraestructura o las estaciones existentes.


### ✅ NFR-REQ-009 — Definir observabilidad, soporte y alertas

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-008 — Definir hardware, red y periféricos requeridos` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-010 — Definir respaldo, RTO y RPO` — NO INICIADA  
**Artefactos aprobados:** `NFR-OBSERVABILITY-SUPPORT-ALERTING-CONTRACT-001`; `NFR-SERVICE-OBSERVABILITY-PROFILE-001`; `NFR-PROCESS-OBSERVABILITY-MATRIX-001`; `NFR-SLI-SLO-REFERENCE-MATRIX-001`; `NFR-ALERT-CATALOG-001`; `NFR-SUPPORT-OPERATING-MODEL-001`; `NFR-RUNBOOK-CATALOG-001`; `NFR-OBSERVABILITY-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de señales, correlación, salud, indicadores, alertas, soporte, diagnóstico, incidentes, comunicación y evidencia; no selección de proveedor, implementación de plataforma, instalación de agentes, creación de guardias permanentes ni definición final de SLA  
**Cambios en código, migraciones, Supabase, infraestructura, herramientas, canales, turnos de soporte o despliegues:** no autorizados

---

#### 1. Propósito

Definir el contrato verificable mediante el cual Vento OS podrá conocer qué está ocurriendo en sus procesos, aplicaciones, integraciones, datos, dispositivos y periféricos; detectar degradaciones antes de que se conviertan en pérdida empresarial; distinguir síntomas de causas; y entregar a soporte contexto suficiente para diagnosticar, mitigar, comunicar y cerrar una afectación sin depender de memoria individual ni acceso irrestricto a producción.

```text
TENER LOGS
≠ SER OBSERVABLE

TENER UN DASHBOARD VERDE
≠ EL PROCESO FUNCIONA

RECIBIR UN 200 OK
≠ EL EFECTO EMPRESARIAL OCURRIÓ

EMITIR UNA ALERTA
≠ HABER NOTIFICADO A LA PERSONA CORRECTA
≠ HABER INICIADO UNA RESPUESTA

REINICIAR UN SERVICIO
≠ RESOLVER LA CAUSA
```

La aprobación de esta tarea congela requisitos iniciales. No certifica que las aplicaciones actuales sean observables, que exista soporte suficiente ni que las alertas vigentes sean correctas.

---

#### 2. Continuidad lógica

`NFR-REQ-001` definió criticidad y disponibilidad. `NFR-REQ-002` fijó carga y crecimiento. `NFR-REQ-003` estableció presupuestos temporales. `NFR-REQ-004` reguló operación degradada y sincronización. `NFR-REQ-005` y `NFR-REQ-006` fijaron privacidad, trazabilidad y retención. `NFR-REQ-007` y `NFR-REQ-008` trasladaron estas obligaciones a experiencia, estaciones, red y periféricos.

`NFR-REQ-009` define cómo comprobar continuamente esas obligaciones y cómo responder cuando dejan de cumplirse.

```text
PROCESO + SERVICIO + DEPENDENCIA + ESTACIÓN
        ↓
SEÑALES CORRELACIONADAS Y MÍNIMAS
        ↓
INDICADORES DE IMPACTO Y SALUD
        ↓
DASHBOARD, ALERTA O DIAGNÓSTICO
        ↓
RESPONSABLE + RUNBOOK + COMUNICACIÓN
        ↓
MITIGACIÓN + RECUPERACIÓN + EVIDENCIA
        ↓
PROBLEMA, PREVENCIÓN Y MEJORA
```

`NFR-REQ-010` definirá respaldo, RTO y RPO. `NFR-REQ-011` fijará compatibilidad mínima por dispositivo. `OBS-ARC-001` a `OBS-ARC-016`, `TI-DOM-001`, `TI-DOM-006` a `TI-DOM-010`, `TI-DOM-013`, `TI-AUTH-001` a `TI-AUTH-004`, `TI-UX-001` a `TI-UX-006`, `TI-INT-001` a `TI-INT-003` y los paquetes E5 materializarán este contrato.

---

#### 3. Alcance

El contrato cubre:

- aplicaciones web y móviles;
- Server Actions, API, RPC, funciones y jobs;
- Supabase, base de datos, autenticación, Storage y Realtime;
- colas, outbox, inbox, reintentos y dead-letter;
- integraciones internas y externas;
- procesos online, offline, diferidos, programados y manuales controlados;
- navegadores, móviles, tablets, POS, kioscos y estaciones compartidas;
- red, DNS, Internet, reloj, energía, batería y almacenamiento;
- impresoras, escáneres, cámaras, datáfonos, básculas y señales físicas;
- despliegues, versiones, configuraciones y cambios;
- indicadores técnicos, operativos y de impacto empresarial;
- dashboards, alertas, canales, escalamiento y silencios;
- solicitudes de soporte, incidentes, problemas, workarounds y runbooks;
- diagnóstico remoto, exportaciones y paquetes de evidencia;
- ambientes local, CI, staging, piloto y producción.

No selecciona una herramienta concreta, backend de telemetría, proveedor de guardia, sistema de tickets, canal de mensajería ni política definitiva de atención fuera de horario.

---

#### 4. Principios obligatorios

1. **Impacto antes que ruido:** se alertará primero sobre síntomas que afectan al usuario, proceso, integridad, dinero o continuidad.
2. **Causa para diagnosticar:** las señales internas ayudarán a explicar, pero no generarán interrupciones humanas redundantes cuando el efecto esté contenido.
3. **Correlación extremo a extremo:** toda señal relevante deberá poder vincularse con servicio, versión, proceso, instancia, comando, job, dispositivo o dependencia.
4. **Separación semántica:** telemetría, evento empresarial, auditoría, evidencia, alerta, incidente y ticket son objetos distintos.
5. **Accionabilidad:** toda alerta que interrumpa a una persona tendrá propietario, consecuencia, acción inicial y runbook.
6. **Bajo ruido:** duplicados, cascadas, flapping y alertas sin acción deberán deduplicarse, inhibirse, agruparse o retirarse.
7. **Observabilidad proporcional:** la profundidad dependerá de criticidad, riesgo, volumen, dependencia y capacidad de soporte.
8. **No exposición:** logs, trazas, métricas, dashboards y diagnósticos respetarán privacidad, minimización y secretos.
9. **No dependencia del dashboard:** un proceso crítico no requerirá que alguien observe una pantalla continuamente para detectar fallas.
10. **Salud empresarial:** infraestructura saludable no compensará pedidos, pagos, movimientos, producción o sincronizaciones fallidas.
11. **Salud de la observabilidad:** el propio pipeline de señales y alertas deberá supervisarse.
12. **Versión y cambio:** toda señal deberá identificar versión, ambiente y cambio relevante cuando aplique.
13. **Tiempo confiable:** ocurrido, observado, recibido, procesado, alertado y reconocido se conservarán por separado.
14. **Soporte reproducible:** el diagnóstico se basará en evidencia y procedimientos, no en acceso improvisado ni conocimiento tácito.
15. **Cierre verificable:** restaurar el servicio no equivale a cerrar el incidente ni la causa raíz.
16. **Costo gobernado:** cardinalidad, volumen, muestreo y retención tendrán presupuesto y propietario.
17. **Fallback explícito:** cuando una dependencia no emita telemetría habrá prueba externa o verificación manual controlada.
18. **Hallazgo con dueño:** toda brecha generará o actualizará una tarea concreta; no quedará como nota narrativa.

---

#### 5. Objetos que deberán permanecer separados

```text
MÉTRICA
→ medida agregable en el tiempo

LOG
→ registro estructurado de una ocurrencia técnica o funcional

TRAZA
→ recorrido correlacionado de una operación entre componentes

EVENTO EMPRESARIAL
→ hecho material publicado por la fuente propietaria

AUDITORÍA
→ evidencia protegida de actor, decisión y cambio

HEALTH CHECK
→ comprobación puntual de una capacidad o dependencia

SLI
→ indicador medido de comportamiento o resultado

SLO
→ objetivo aprobado para un SLI y una ventana

ALERTA
→ condición evaluada que requiere una ruta de atención

INCIDENTE
→ interrupción o degradación que exige restauración coordinada

PROBLEMA
→ causa o patrón cuya eliminación previene recurrencia

SOLICITUD DE SERVICIO
→ petición ordinaria que no implica por sí misma incidente

RUNBOOK
→ procedimiento versionado de diagnóstico y respuesta
```

Un log no sustituirá auditoría. Una alerta no creará un hecho empresarial. Un ticket no probará que el servicio fue restaurado. Un health check técnico no demostrará que el proceso extremo a extremo funciona.

---

#### 6. Contrato obligatorio de observabilidad

Cada servicio, proceso, integración o dependencia aplicable deberá declarar en `NFR-SERVICE-OBSERVABILITY-PROFILE-001`:

```text
profile_id
owner
service_or_process_scope
criticality
users_and_business_effect
repositories_and_components
environments
versions_and_release_markers
dependencies
entry_points
critical_paths
signals
semantic_schema_versions
correlation_fields
slis_and_slo_references
health_checks
black_box_checks
dashboards
alerts
routing_and_support_window
runbooks
privacy_and_redaction
cardinality_budget
sampling_policy
retention_references
known_gaps
fallback_verification
acceptance_scenarios
status
```

Un campo desconocido será `UNRESOLVED` con tarea, responsable y puerta de resolución. No se completará con un dashboard supuesto ni con una alerta genérica.

---

#### 7. Modelo de señales

La línea base vendor-neutral usará como mínimo:

| Señal                 | Uso                                                      | Regla                                               |
| --------------------- | -------------------------------------------------------- | --------------------------------------------------- |
| métricas              | tendencias, tasas, percentiles, capacidad y alertas      | unidades, dimensiones y cardinalidad controladas    |
| logs estructurados    | detalle de eventos, errores y decisiones técnicas        | esquema estable, nivel, contexto y redacción segura |
| trazas                | recorrido de solicitudes, comandos, jobs e integraciones | contexto propagado y spans con límites claros       |
| health checks         | disponibilidad de capacidades concretas                  | no mezclar liveness, readiness y salud empresarial  |
| pruebas black-box     | comportamiento visible desde fuera                       | validar camino real, no solo proceso interno        |
| eventos empresariales | hechos materiales de dominio                             | propiedad y contrato de `PROC-CAT-017`              |
| auditoría             | actor, autorización, cambio y evidencia                  | propiedad de `NFR-REQ-006` y contratos de auditoría |

Perfiles y volcados profundos se usarán solo bajo diagnóstico controlado; no formarán la línea base ordinaria ni se capturarán indefinidamente.

---

#### 8. Identidad, correlación y causalidad

Cuando aplique, las señales deberán poder conservar o derivar de forma segura:

```text
service_name
service_instance
application_code
environment
version
release_id
trace_id
span_id
correlation_id
causation_id
request_or_command_id
idempotency_key
process_id
process_instance_id
aggregate_id_and_version
job_or_queue_item_id
integration_message_id
site_area_station
technical_device_id
actor_reference_if_allowed
occurred_at
observed_at
received_at
```

No se exigirá incluir todos los campos en toda señal. Cada perfil definirá el mínimo. Identificadores personales, documentos, tokens, payloads y nombres no se usarán como etiquetas de alta cardinalidad ni contexto de libre acceso.

---

#### 9. Convenciones semánticas y versionado

Nombre, unidad, tipo, descripción, dimensiones, severidad y significado de cada señal deberán estar versionados. Queda prohibido:

- reutilizar una métrica con significado distinto;
- cambiar unidad sin versión o migración;
- convertir un contador en valor instantáneo conservando el nombre;
- usar mensajes libres como contrato de integración;
- depender de texto humano para agrupar errores;
- mezclar códigos técnicos y resultados empresariales;
- eliminar una señal usada por alerta o SLI sin transición;
- mantener etiquetas ilimitadas por usuario, recurso, URL cruda o mensaje.

Todo cambio incompatible tendrá consumidores, ventana, comparación, rollback y retiro.

---

#### 10. Métricas mínimas

Los servicios de cara a usuario o proceso deberán cubrir, cuando apliquen:

- demanda o tráfico;
- latencia de éxito y de error por separado;
- tasa y clase de errores;
- saturación de recursos y límites;
- disponibilidad observable;
- backlog, edad del elemento más antiguo y tiempo de drenaje;
- reintentos, deduplicaciones y resultados desconocidos;
- frescura, atraso y última ejecución exitosa;
- sincronización pendiente, conflicto y conciliación;
- disponibilidad de dependencias;
- resultados empresariales críticos y abandonos;
- capacidad de dispositivo, red o periférico relevante.

Una métrica técnica sin relación con una decisión, dashboard, SLI, alerta o diagnóstico será candidata a retiro.

---

#### 11. Cardinalidad, agregación y etiquetas

Cada métrica tendrá presupuesto de cardinalidad. No se utilizarán como dimensiones ordinarias:

- identificadores de usuario o cliente;
- documentos, correos, teléfonos o nombres;
- IDs de instancia sin agregación aprobada;
- URLs completas con parámetros;
- mensajes de error libres;
- trazas, tokens o idempotency keys;
- nombres de archivos o payloads;
- valores que crezcan sin límite conocido.

El detalle individual pertenecerá a logs o trazas protegidos, no a etiquetas de métricas. Los desbordamientos deberán detectarse y no causar crecimiento ilimitado de memoria o costo.

---

#### 12. Logs estructurados

Todo log relevante deberá declarar como mínimo:

```text
timestamp
severity
service
component
environment
version
event_or_error_code
message_template
correlation_context
outcome
```

Cuando aplique incluirá duración, dependencia, estado previo, reintento, cola, sitio, estación o dispositivo técnico. Los mensajes deberán ser comprensibles sin depender exclusivamente de stack trace.

Queda prohibido registrar secretos, tokens, PIN, credenciales, payloads completos, datos médicos, documentos personales o información clasificada sin una excepción aprobada y controles específicos.

---

#### 13. Severidad técnica de logs

| Nivel   | Uso permitido                                                                         |
| ------- | ------------------------------------------------------------------------------------- |
| `TRACE` | diagnóstico temporal y muestreado en ambientes autorizados                            |
| `DEBUG` | detalle de desarrollo o diagnóstico controlado, desactivado por defecto en producción |
| `INFO`  | hitos técnicos esperados y de volumen razonable                                       |
| `WARN`  | degradación, fallback, reintento o condición recuperable                              |
| `ERROR` | operación fallida o resultado no obtenido que exige análisis                          |
| `FATAL` | componente incapaz de continuar de forma segura                                       |

La severidad del log no determinará automáticamente la prioridad de una alerta. Miles de errores contenidos pueden requerir análisis, mientras una sola pérdida financiera puede exigir respuesta crítica.

---

#### 14. Trazas distribuidas

Las trazas cubrirán caminos críticos entre navegador o dispositivo, aplicación, servidor, Supabase, cola, integración y efecto físico cuando la tecnología lo permita. Deberán:

- propagar contexto sin elevar autorización;
- distinguir solicitud, comando, reintento y resultado;
- representar operaciones síncronas y asíncronas;
- conservar enlaces cuando no exista relación padre-hijo directa;
- identificar dependencia y duración;
- marcar errores sin ocultar spans exitosos parciales;
- no adjuntar payloads sensibles completos;
- aplicar muestreo que preserve errores y casos críticos;
- enlazar con logs sin duplicar toda la información.

Una operación offline deberá crear contexto local y vincularlo con la sincronización posterior sin fingir continuidad temporal inexistente.

---

#### 15. Telemetría, eventos empresariales y auditoría

```text
TELEMETRÍA
→ explica salud y comportamiento

EVENTO EMPRESARIAL
→ comunica un hecho material confirmado

AUDITORÍA
→ demuestra actor, decisión y cambio
```

Una señal podrá referenciar otro objeto, pero no reemplazarlo. La eliminación, muestreo o expiración de telemetría no podrá borrar auditoría ni eventos sujetos a retención. Una alerta basada en ausencia de evento deberá comprobar primero que el canal de observación está funcionando.

---

#### 16. Health checks y estados de salud

Se separarán como mínimo:

| Estado                   | Pregunta                                                    |
| ------------------------ | ----------------------------------------------------------- |
| liveness                 | ¿el componente puede seguir ejecutándose?                   |
| readiness                | ¿puede aceptar trabajo de forma segura?                     |
| dependency health        | ¿las dependencias necesarias responden dentro del contrato? |
| degraded                 | ¿opera con limitaciones explícitas y controladas?           |
| business health          | ¿el efecto empresarial extremo a extremo está ocurriendo?   |
| data health              | ¿los datos están frescos, completos y conciliados?          |
| device/peripheral health | ¿la estación puede ejecutar el paso físico requerido?       |

Un componente vivo pero incapaz de completar el proceso no estará `HEALTHY`. Un health check no ejecutará mutaciones empresariales irreversibles.

---

#### 17. Monitoreo black-box y white-box

Los caminos críticos combinarán:

- **white-box:** señales internas de aplicaciones, base, colas y dependencias;
- **black-box:** comprobaciones desde el punto de vista del consumidor o estación;
- **synthetic controlado:** recorrido seguro que no contamine datos reales;
- **verificación manual:** cuando el efecto físico o tercero no permita automatización confiable.

La prueba externa deberá validar resolución, autenticación técnica, disponibilidad y respuesta esperada sin exponer credenciales ni generar ventas, movimientos, pagos o comunicaciones reales no deseadas.

---

#### 18. Cliente web, móvil y dispositivo

La observabilidad del cliente deberá cubrir:

- versión instalada y compatibilidad;
- errores no controlados y fallos de renderizado;
- navegación o acción crítica fallida;
- conectividad, latencia y timeout percibido;
- memoria, almacenamiento y cierre inesperado cuando sea accesible;
- cola local, conflictos y sincronización;
- batería, reloj y estado de periférico cuando sean parte del proceso;
- estación y dispositivo técnico sin identificar innecesariamente al trabajador;
- adopción de actualización obligatoria;
- tasa de sesiones o dispositivos afectados.

No se capturarán teclas, pantallas completas, formularios, fotos o contenido sensible como telemetría ordinaria.

---

#### 19. Operación offline y sincronización

Se observarán separadamente:

```text
intención creada localmente
pendiente de envío
bloqueada por dependencia
expirada
sincronizando
aceptada técnicamente
confirmada empresarialmente
conflictiva
rechazada
conciliada
```

Los indicadores mínimos incluirán backlog, edad, fallos, reintentos, conflictos, tiempo de sincronización, resultado desconocido y elementos no conciliados. Una alerta no pedirá reintento manual si el sistema aún tiene una estrategia automática segura activa.

---

#### 20. Integraciones externas e internas

Cada integración deberá exponer:

- solicitudes o mensajes emitidos y recibidos;
- éxito, rechazo, timeout y resultado desconocido;
- duración y disponibilidad del proveedor;
- reintentos, deduplicación y circuit breaker cuando aplique;
- backlog, edad y dead-letter;
- versión contractual;
- autenticación técnica fallida sin revelar secretos;
- conciliación entre acuse y efecto empresarial;
- dependencia propietaria y responsable interno;
- ventana o soporte del tercero.

La indisponibilidad del proveedor deberá distinguirse de error de configuración, autorización, red, contrato o dato.

---

#### 21. Base de datos, Supabase y datos

La observabilidad deberá cubrir de forma proporcional:

- disponibilidad y latencia de operaciones críticas;
- errores por clase y operación;
- conexiones, saturación y bloqueos;
- consultas lentas y planes degradados;
- fallos RLS, RPC y autenticación distinguidos;
- Storage, Realtime y funciones utilizadas;
- crecimiento y capacidad;
- migración, versión de esquema y compatibilidad;
- replicación o retraso cuando aplique;
- frescura, completitud y reconciliación de datos;
- jobs de mantenimiento y respaldo sin asumir su éxito.

No se enviarán consultas completas con datos sensibles ni parámetros secretos a canales de soporte abiertos.

---

#### 22. Colas, outbox, inbox y jobs

Cada cola o trabajo diferido deberá exponer:

- trabajo recibido, pendiente, activo, completado, fallido y descartado;
- edad del más antiguo y tiempo de procesamiento;
- reintentos y siguiente intento;
- deduplicación e idempotencia;
- dependencias y partición;
- elementos en dead-letter o cuarentena;
- capacidad y backpressure;
- resultado empresarial pendiente;
- última ejecución exitosa de jobs programados;
- ausencia de ejecuciones esperadas;
- drenaje, pausa, reanudación y recuperación.

Una cola vacía no será saludable si dejó de recibir trabajo esperado.

---

#### 23. Red, estaciones y periféricos

La observabilidad técnica definida por `NFR-REQ-008` deberá integrarse con este contrato para cubrir:

- energía, batería, almacenamiento, memoria y reloj;
- enlace, señal, pérdida, latencia, DNS e Internet;
- versión, configuración y postura del endpoint;
- impresora, escáner, cámara, datáfono, báscula o sensor;
- papel, etiqueta, consumible y atasco;
- comando enviado, receipt, resultado desconocido y conciliación;
- estación, sede, área y responsable técnico;
- reemplazo, mantenimiento y excepción vigente.

Un periférico online no probará que produjo un resultado correcto y legible.

---

#### 24. Frescura, batch y procesos programados

Para datasets, reportes, cierres, pronósticos, sincronizaciones y jobs se declararán:

```text
expected_schedule
last_started_at
last_completed_at
last_success_at
data_cutoff
freshness_sli
maximum_acceptable_delay
records_expected_and_processed
partial_result_policy
owner
```

No se alertará por un único fallo tolerable si el contrato permite reintento y todavía no existe impacto. Sí se alertará cuando la siguiente oportunidad segura no evite incumplir la frescura o el efecto empresarial.

---

#### 25. Releases, configuración y cambios

Dashboard, log, métrica y traza deberán permitir correlacionar degradaciones con:

- versión de aplicación;
- commit o artefacto desplegado;
- migración y versión de esquema;
- feature flag y configuración;
- cambio de infraestructura, red o periférico;
- proveedor o dependencia modificada;
- ventana y responsable del cambio;
- inicio, finalización y rollback;
- resultado de smoke tests y observación posterior.

Toda alerta crítica iniciada después de un cambio deberá mostrar el cambio reciente aplicable sin asumir causalidad automática.

---

#### 26. SLI, SLO y presupuesto de error

`NFR-SLI-SLO-REFERENCE-MATRIX-001` enlazará indicadores con los objetivos aprobados en `NFR-REQ-001`, `NFR-REQ-002` y `NFR-REQ-003`. Esta tarea no inventa porcentajes ni ventanas nuevas.

Cada referencia deberá declarar:

```text
sli_id
definition
population
success_criteria
measurement_point
unit
window
exclusions
slo_reference
error_budget_policy_reference
owner
dashboards
alerts
evidence
```

La ausencia de un SLO final no impedirá medir, pero bloqueará declarar cumplimiento. Las exclusiones deberán ser explícitas, limitadas y auditables.

---

#### 27. Dashboards

Los dashboards deberán responder preguntas concretas:

1. ¿hay impacto empresarial ahora?
2. ¿qué procesos, sedes, aplicaciones o estaciones están afectados?
3. ¿desde cuándo y después de qué cambio?
4. ¿qué dependencia o etapa concentra la degradación?
5. ¿qué backlog, edad o pérdida permanece?
6. ¿quién es responsable y cuál es el runbook?
7. ¿la recuperación está confirmada y conciliada?

Se separarán vistas ejecutivas, operativas, de soporte y de diagnóstico. Una vista no expondrá información sensible por conveniencia técnica ni usará el color como único significado.

---

#### 28. Catálogo de alertas

Cada alerta de `NFR-ALERT-CATALOG-001` deberá declarar:

```text
alert_id
name
owner
service_process_and_scope
symptom
business_impact
signal_and_query
threshold_or_condition
window_and_persistence
severity
routing
support_window
deduplication_key
inhibition_rules
recovery_condition
runbook
safe_first_action
required_context
privacy_class
slo_reference
last_validation
status
```

No se aprobará una alerta sin propietario, acción o runbook. Una alerta informativa no se enviará como interrupción urgente.

---

#### 29. Diseño de alertas

Las alertas deberán:

- priorizar dolor visible, pérdida, incumplimiento o riesgo inminente;
- usar persistencia suficiente para evitar blips irrelevantes;
- distinguir error rápido de operación lenta;
- agrupar síntomas equivalentes;
- inhibir cascadas causadas por una dependencia superior conocida;
- deduplicar réplicas y reintentos;
- aplicar histéresis o condición de recuperación;
- incluir contexto y enlace al dashboard o runbook;
- evitar pedir una acción que el sistema ya ejecuta automáticamente;
- probar periódicamente canal y regla;
- retirarse cuando no sea accionable o nunca se use.

Las alertas de causa podrán crear ticket o enriquecer diagnóstico; no deberán despertar a otra persona si una alerta de síntoma ya tiene dueño suficiente.

---

#### 30. Severidad de alerta e incidente

| Nivel    | Condición inicial                                                                                           | Respuesta esperada                                                  |
| -------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `OBS-P0` | riesgo inmediato para personas, seguridad, dinero, integridad crítica o interrupción amplia sin alternativa | atención inmediata, coordinación y comunicación ejecutiva aplicable |
| `OBS-P1` | proceso crítico degradado o interrumpido, efecto creciente o alternativa insuficiente                       | atención prioritaria dentro de la ventana definida y escalamiento   |
| `OBS-P2` | degradación limitada, capacidad cercana al límite o workaround controlado                                   | ticket priorizado, análisis y fecha de resolución                   |
| `OBS-P3` | tendencia, deuda o mejora sin impacto actual material                                                       | backlog gobernado y revisión periódica                              |

La severidad se basará en impacto y urgencia, no en el nombre del componente ni en el nivel de un log. Los contratos posteriores podrán refinar tiempos, pero no reducir una condición crítica sin evidencia.

---

#### 31. Routing, escalamiento y ventanas

Cada servicio tendrá:

- propietario funcional y técnico;
- contacto primario y alterno;
- ventana de soporte;
- criterio para atención fuera de horario;
- canal primario y fallback;
- escalamiento por falta de reconocimiento;
- dependencia de proveedor;
- autoridad para mitigación, rollback o contingencia;
- comunicación a sedes y áreas afectadas;
- criterio de transferencia y cierre.

Esta tarea no obliga a una guardia 24/7 para todo servicio. La cobertura deberá ser proporcional a criticidad y a la capacidad real de actuar.

---

#### 32. Ciclo de vida de alerta

```text
NORMAL
→ PENDING
→ FIRING
→ ACKNOWLEDGED
→ MITIGATING
→ RECOVERING
→ RESOLVED
→ REVIEWED
```

Silenciar, reconocer o cerrar no eliminará la condición subyacente. Todo silencio tendrá motivo, alcance, actor, inicio, vencimiento y revisión. Una alerta que se resuelve sola conservará evidencia suficiente para determinar si requiere problema o ajuste de regla.

---

#### 33. Modelo operativo de soporte

`NFR-SUPPORT-OPERATING-MODEL-001` distinguirá:

- consulta o ayuda;
- solicitud de servicio;
- incidente;
- problema;
- error conocido;
- cambio;
- mantenimiento;
- evento de seguridad;
- continuidad o desastre;
- solicitud a proveedor.

La entrada podrá originarse en trabajador, administrador, cliente, monitor, integración o proveedor. Todo caso deberá conservar solicitante o fuente, servicio, proceso, sede, impacto, urgencia, prioridad, evidencia mínima, asignación, comunicaciones, resolución y validación.

---

#### 34. Diagnóstico y paquete de evidencia

El soporte deberá poder reunir un paquete mínimo sin pedir al usuario que copie secretos o datos innecesarios:

```text
case_id
service_process_and_station
application_and_version
environment
timestamps_and_timezone
correlation_ids
symptom_and_expected_result
scope_and_affected_population
recent_changes
health_summary
selected_logs_metrics_and_traces
queue_or_dependency_state
device_and_network_profile_if_applicable
steps_already_attempted
privacy_class
collector_and_access_record
```

El paquete será reproducible, limitado, protegido y sujeto a retención. Capturas, exportaciones y acceso remoto requerirán autorización proporcional.

---

#### 35. Runbooks y base de conocimiento

Cada alerta `OBS-P0` o `OBS-P1` tendrá runbook aprobado con:

1. propósito y alcance;
2. señales de entrada y falsos positivos conocidos;
3. verificaciones seguras;
4. acciones iniciales reversibles;
5. criterios de contingencia, rollback o escalamiento;
6. datos que no deben recopilarse;
7. comunicación requerida;
8. prueba de recuperación;
9. conciliación y pendientes;
10. cuándo crear problema o cambio;
11. propietario, versión y última práctica.

Un runbook no incluirá secretos estáticos ni comandos destructivos sin guardrails y aprobación.

---

#### 36. Comunicación durante incidentes

La comunicación deberá distinguir:

- hecho confirmado;
- impacto conocido;
- alcance todavía no confirmado;
- mitigación en curso;
- workaround aprobado;
- próxima actualización;
- recuperación técnica;
- recuperación empresarial y conciliación;
- cierre y seguimiento.

No se publicarán causas especulativas como definitivas. Los mensajes a trabajadores o clientes usarán lenguaje operativo comprensible y no expondrán datos internos, vulnerabilidades o información de terceros.

---

#### 37. Problemas, causa raíz y recurrencia

Un incidente recurrente, de alto impacto, sin causa conocida o resuelto solo mediante intervención manual deberá generar `TI-DOM-008` o tarea propietaria equivalente. El análisis conservará:

- cronología;
- impacto;
- factores técnicos y operativos;
- detección y respuesta;
- por qué las barreras no evitaron el efecto;
- acciones correctivas y preventivas;
- responsables y fechas;
- evidencia de eficacia;
- actualizaciones de prueba, alerta y runbook.

La causa raíz no se limitará automáticamente al último componente que falló.

---

#### 38. Seguridad y privacidad de observabilidad y soporte

Se aplicarán `NFR-REQ-005` y `NFR-REQ-006` a:

- logs, trazas, métricas y dashboards;
- errores de cliente y sesiones;
- paquetes de diagnóstico;
- capturas, adjuntos y exportaciones;
- herramientas de soporte remoto;
- canales de alertas y tickets;
- datos de proveedores;
- información de seguridad;
- muestras de payload;
- almacenamiento temporal y backups de telemetría.

Consulta, exportación, cambio de regla, silencio, acceso remoto y borrado tendrán permisos separados y auditoría. Los técnicos no heredarán autoridad empresarial por tener acceso de soporte.

---

#### 39. Volumen, muestreo, retención y costo

Cada perfil deberá declarar:

- volumen esperado y pico;
- cardinalidad máxima;
- muestreo por señal y criticidad;
- preservación de errores y casos críticos;
- agregación y reducción;
- retención caliente, consultable y archivada mediante referencia a `NFR-REQ-006`;
- límites de almacenamiento y transferencia;
- alertas por pérdida o descarte;
- responsable de costo;
- criterio para retirar señales sin uso.

El muestreo no podrá eliminar toda evidencia de un error crítico. La retención de telemetría no se extenderá indefinidamente por defecto.

---

#### 40. Separación de ambientes

Local, CI, staging, piloto y producción deberán identificarse sin ambigüedad. Queda prohibido:

- mezclar señales de ambientes sin dimensión y filtros seguros;
- enviar alertas de prueba a canales productivos sin etiqueta y control;
- copiar datos productivos sensibles para depurar;
- usar credenciales productivas en pruebas;
- aceptar silencios de staging como silencios de producción;
- calcular SLI productivo con tráfico sintético no clasificado;
- conservar debug intensivo tras finalizar el diagnóstico.

Los ejercicios y simulacros deberán ser reconocibles y no ocultar incidentes reales.

---

#### 41. Observabilidad de la observabilidad

El pipeline deberá comprobar:

- agentes, SDK, collectors y exportadores aplicables;
- recepción y atraso de señales;
- pérdida, descarte y error de procesamiento;
- disponibilidad de consultas y dashboards;
- evaluación de reglas;
- routing, canal y recepción de alertas;
- sincronización de reloj;
- capacidad y costo;
- permisos y certificados;
- black-box extremo a extremo del camino de alerta.

Una ausencia de alertas no será evidencia de salud si no se ha comprobado el sistema de monitoreo.

---

#### 42. Perfil por proceso

`NFR-PROCESS-OBSERVABILITY-MATRIX-001` tendrá exactamente una fila por `VPROC-0001` a `VPROC-0069` y declarará:

```text
process_id
owner_and_consumers
critical_steps
business_outcomes
failure_symptoms
slis_and_slo_references
technical_signals
business_events_and_audit_links
external_dependencies
queues_jobs_and_freshness
stations_and_peripherals
dashboards
alerts_and_severity
support_window
runbooks
fallback_detection
privacy_and_retention
validation_scenarios
unresolved_items
```

Un proceso manual podrá usar evidencia y controles manuales, pero no quedar sin mecanismo de detección, soporte y escalamiento.

---

#### 43. Escenarios mínimos de validación

Deberán probarse, cuando apliquen:

1. aplicación caída con infraestructura parcialmente disponible;
2. dependencia lenta sin error explícito;
3. error rápido y error lento;
4. pérdida parcial de logs, métricas o trazas;
5. propagación de correlación entre aplicaciones;
6. evento empresarial ausente con telemetría saludable;
7. health check verde con proceso fallido;
8. cola creciendo y elemento antiguo;
9. job omitido o ejecución parcial;
10. sincronización offline atrasada o conflictiva;
11. base saturada, bloqueada o con consulta lenta;
12. proveedor en timeout, rechazo o resultado desconocido;
13. impresora online sin resultado físico;
14. dispositivo con reloj, almacenamiento o batería degradados;
15. despliegue que aumenta error o latencia;
16. alerta duplicada, flapping o cascada;
17. canal de alerta no disponible;
18. silencio vencido o excesivo;
19. ticket sin contexto o asignación;
20. runbook incompleto o acción insegura;
21. recuperación técnica sin conciliación empresarial;
22. acceso de soporte sin autorización;
23. telemetría con dato sensible;
24. cardinalidad o volumen fuera de presupuesto;
25. monitoreo completamente indisponible.

Omitir un escenario exigirá `NO_APLICA` justificado.

---

#### 44. Excepciones y severidad de brechas

| Nivel        | Ejemplo                                                                             | Efecto                              |
| ------------ | ----------------------------------------------------------------------------------- | ----------------------------------- |
| `OBS-GAP-P0` | proceso crítico sin detección, alerta no entregada o telemetría que expone secretos | bloquea piloto, cutover u operación |
| `OBS-GAP-P1` | alerta crítica sin runbook, correlación rota o salud empresarial no observable      | bloquea release o aceptación        |
| `OBS-GAP-P2` | diagnóstico parcial con control compensatorio y plazo                               | aceptación condicionada             |
| `OBS-GAP-P3` | mejora de detalle o eficiencia sin riesgo material actual                           | planificable                        |

`NFR-OBSERVABILITY-EXCEPTION-REGISTER-001` exigirá alcance, riesgo, señal faltante, control compensatorio, propietario, vencimiento, tarea de cierre y evidencia. No habrá excepciones permanentes por limitación histórica de la herramienta.

---

#### 45. Responsabilidad documental

| Decisión o implementación                    | Tarea propietaria                                                    |
| -------------------------------------------- | -------------------------------------------------------------------- |
| arquitectura de señales y correlación        | `OBS-ARC-001` a `OBS-ARC-016`                                        |
| operación de monitoreo y salud               | `TI-DOM-010`; `TI-INT-001`                                           |
| incidentes, prioridades y soporte            | `TI-DOM-001`; `TI-DOM-007`; `TI-UX-001`; `TI-UX-002`; `TI-UX-004`    |
| problemas y causa raíz                       | `TI-DOM-008`; `TI-UX-004`                                            |
| cambios y correlación de releases            | `TI-DOM-009`; BLOQUE T                                               |
| seguridad de soporte y diagnóstico           | `TI-AUTH-001` a `TI-AUTH-004`                                        |
| mapa de salud técnica                        | `TI-UX-003`; `TI-UX-006`                                             |
| integraciones con herramientas y proveedores | `TI-INT-001` a `TI-INT-003`                                          |
| colas y eventos                              | `QUEUE-ARC-001` a `QUEUE-ARC-012`; contratos E3/E4                   |
| impresión y periféricos                      | `PRINT-ARC-001` a `PRINT-ARC-020`; `NFR-REQ-008`                     |
| privacidad y retención                       | `NFR-REQ-005`; `NFR-REQ-006`; `INFO-DOM-*`                           |
| respaldo y recuperación                      | `NFR-REQ-010`; `CONT-DOM-001` a `CONT-DOM-015`                       |
| implementación por repositorio               | paquetes E5 propietarios                                             |
| pruebas y certificación                      | `SHELL-CI-020` a `SHELL-CI-024`; `UX-QA-001` a `UX-QA-030`; BLOQUE U |

Toda brecha detectada quedará vinculada de inmediato con una tarea de esta tabla o generará una nueva tarea explícita en el bloque propietario.

---

#### 46. Guardrails de cierre

Deberán fallar revisión, CI, readiness, piloto o certificación cuando exista:

- proceso crítico sin perfil de observabilidad;
- ausencia de propietario técnico o funcional;
- logs usados como sustituto de auditoría;
- alerta crítica sin acción, runbook o ruta;
- alerta basada solo en causa técnica cuando el impacto real no está medido;
- dashboard verde con efecto empresarial fallido conocido;
- correlación rota entre comando, cola, integración y resultado;
- señales sin versión, unidad o semántica estable;
- etiquetas de cardinalidad ilimitada;
- secretos o datos sensibles en telemetría ordinaria;
- health check que ejecuta una mutación irreversible;
- cola, job o sincronización sin edad, frescura o resultado;
- despliegue sin marcador de versión y cambio;
- silencio sin vencimiento o responsable;
- canal de alertas no probado;
- monitoreo sin metamonitoreo;
- soporte remoto no autorizado o no auditado;
- incidente cerrado sin recuperación y conciliación;
- alerta `OBS-P0` o `OBS-P1` sin práctica vigente;
- brecha `OBS-GAP-P0` o `OBS-GAP-P1` abierta sin control aprobado.

---

#### 47. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PROC-461 a TREQ-PROC-500
```

Cobertura:

1. perfil de observabilidad por servicio y proceso;
2. separación de señales y objetos operativos;
3. correlación y causalidad extremo a extremo;
4. semántica, unidades y versionado;
5. métricas de demanda, latencia, errores y saturación;
6. cardinalidad y dimensiones seguras;
7. logs estructurados;
8. privacidad y redacción de telemetría;
9. trazas síncronas, asíncronas y offline;
10. separación de telemetría, evento y auditoría;
11. health checks por capa;
12. black-box y white-box;
13. telemetría de cliente y versión;
14. dispositivo, red y estación;
15. offline y sincronización;
16. integraciones externas e internas;
17. base de datos y Supabase;
18. colas, outbox, inbox y dead-letter;
19. impresión y periféricos;
20. batch, jobs y frescura;
21. release, configuración y cambio;
22. SLI, SLO y presupuesto de error;
23. dashboards por audiencia;
24. catálogo accionable de alertas;
25. deduplicación, inhibición e histéresis;
26. severidad y routing;
27. ciclo de vida, silencios y recuperación;
28. metamonitoreo;
29. modelo de soporte y clasificación;
30. diagnóstico y paquete mínimo;
31. incidentes y prioridad;
32. runbooks y acciones seguras;
33. comunicación de incidentes;
34. problemas, causa raíz y recurrencia;
35. soporte remoto protegido;
36. volumen, muestreo, retención y costo;
37. separación de ambientes;
38. matriz de los 69 procesos;
39. escenarios de fallo y ejercicios;
40. guardrails y certificación.

La evidencia deberá indicar que proviene de `NFR-REQ-009` aprobada.

---

#### 48. Criterios de aceptación

- [ ] Se separan métricas, logs, trazas, health checks, eventos, auditoría, alertas, incidentes, problemas, solicitudes y runbooks.
- [ ] Todo perfil declara propietario, alcance, criticidad, señales, indicadores, alertas, soporte, privacidad y pruebas.
- [ ] La correlación cubre aplicaciones, procesos, colas, integraciones, dispositivos y resultados.
- [ ] Semántica, nombre, unidad, dimensiones y versiones están gobernados.
- [ ] Métricas cubren demanda, latencia, errores, saturación y resultado empresarial.
- [ ] Cardinalidad y etiquetas sensibles tienen límites explícitos.
- [ ] Logs son estructurados, seguros y no sustituyen auditoría.
- [ ] Trazas cubren caminos síncronos, asíncronos y offline con muestreo gobernado.
- [ ] Liveness, readiness, dependencia, degradación, datos y salud empresarial son distintos.
- [ ] Los caminos críticos combinan white-box y black-box o control compensatorio.
- [ ] Cliente, dispositivo, red y periféricos tienen señales proporcionales.
- [ ] Offline, sincronización, colas, jobs y frescura conservan edad y resultado.
- [ ] Integraciones separan acuse técnico de efecto empresarial.
- [ ] Base de datos, Supabase y cambios de esquema tienen observabilidad proporcional.
- [ ] Release, configuración, migración y rollback se correlacionan con degradaciones.
- [ ] Los SLI remiten a objetivos aprobados sin inventar nuevos SLO.
- [ ] Los dashboards responden impacto, alcance, tiempo, causa probable, dueño y recuperación.
- [ ] Toda alerta humana es accionable, deduplicable, enrutable y tiene condición de recuperación.
- [ ] Severidad se basa en impacto y urgencia, no en el nivel del log.
- [ ] No se impone guardia 24/7 sin criticidad y capacidad real de actuar.
- [ ] Silencios, reconocimientos y cierres conservan actor, motivo y vencimiento.
- [ ] Soporte distingue consulta, solicitud, incidente, problema, cambio y continuidad.
- [ ] Paquetes de diagnóstico minimizan y protegen datos.
- [ ] Alertas críticas tienen runbooks versionados y practicados.
- [ ] Comunicación separa hechos, hipótesis, mitigación y recuperación.
- [ ] Recurrencias generan problema y acciones preventivas con dueño.
- [ ] Observabilidad y soporte aplican privacidad, autorización y auditoría.
- [ ] Volumen, muestreo, retención y costo están gobernados.
- [ ] El pipeline de monitoreo y alertas se supervisa extremo a extremo.
- [ ] Los 69 procesos tendrán perfil individual antes de implementación.
- [ ] Se definen escenarios mínimos, severidad de brechas y guardrails.
- [ ] Se incorporan `TREQ-PROC-461` a `TREQ-PROC-500` al registro completo.
- [ ] No se implementan herramientas, agentes, código, migraciones, Supabase, canales ni guardias.
- [ ] `NFR-REQ-010` permanece no iniciada.

---

#### 49. Estado y continuidad

```text
NFR-REQ-007   APROBADA
NFR-REQ-008   APROBADA
NFR-REQ-009   APROBADA
NFR-REQ-010   NO INICIADA
```

La aprobación explícita de esta tarea congela el contrato no funcional inicial de observabilidad, soporte y alertas. No certifica la cobertura actual, no selecciona herramientas y no demuestra que los equipos o procesos vigentes puedan detectar y responder correctamente a una afectación.


### ✅ NFR-REQ-010 — Definir respaldo, RTO y RPO

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-009 — Definir observabilidad, soporte y alertas` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-011 — Definir compatibilidad mínima por dispositivo` — NO INICIADA  
**Artefactos aprobados:** `NFR-BACKUP-RECOVERY-CONTRACT-001`; `NFR-RECOVERY-OBJECT-INVENTORY-001`; `NFR-PROCESS-RECOVERY-PROFILE-001`; `NFR-RTO-RPO-MATRIX-001`; `NFR-BACKUP-POLICY-MATRIX-001`; `NFR-RESTORE-RUNBOOK-CATALOG-001`; `NFR-RECOVERY-EXERCISE-MATRIX-001`; `NFR-RECOVERY-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de recuperabilidad, respaldo, restauración, objetivos de tiempo y pérdida, consistencia, validación, conciliación y ejercicios; no selección de proveedor, compra de almacenamiento, activación de failover, ejecución de restauraciones ni aprobación de objetivos numéricos sin análisis de impacto  
**Cambios en código, migraciones, Supabase, infraestructura, respaldos, datos, proveedores, llaves, configuraciones o despliegues:** no autorizados

---

#### 1. Propósito

Definir el contrato verificable mediante el cual Vento OS deberá proteger y recuperar información, configuraciones, documentos, colas, artefactos y capacidades empresariales después de eliminación accidental, corrupción, error de despliegue, falla técnica, pérdida de proveedor, ataque, indisponibilidad prolongada o desastre.

```text
TENER UNA RÉPLICA
≠ TENER UN RESPALDO

TENER UN RESPALDO COMPLETADO
≠ PODER RESTAURAR

RESTAURAR UNA BASE DE DATOS
≠ RECUPERAR EL PROCESO EMPRESARIAL

ROLLBACK DE CÓDIGO
≠ RESTAURACIÓN DE DATOS

RTO
≠ TIEMPO HASTA NORMALIDAD TOTAL

RPO
≠ FRECUENCIA NOMINAL DEL JOB DE BACKUP
```

La aprobación de esta tarea congela semántica, gobierno, perfiles, controles y escenarios mínimos. No certifica que exista respaldo suficiente, que una copia sea recuperable ni que los sistemas actuales cumplan objetivos de recuperación.

---

#### 2. Continuidad lógica

`NFR-REQ-001` definió criticidad y disponibilidad. `NFR-REQ-002` fijó carga y crecimiento. `NFR-REQ-003` estableció presupuestos temporales. `NFR-REQ-004` reguló operación degradada y sincronización. `NFR-REQ-005` y `NFR-REQ-006` fijaron privacidad, trazabilidad, retención y disposición. `NFR-REQ-008` definió capacidades físicas y de red. `NFR-REQ-009` estableció señales, soporte e incidentes.

`NFR-REQ-010` determina qué debe poder recuperarse, con qué punto de recuperación, en qué orden, dentro de qué objetivo, con qué validación y cómo se reincorpora el trabajo pendiente.

```text
IMPACTO EMPRESARIAL Y DEPENDENCIAS
        ↓
OBJETIVO MÍNIMO DE CONTINUIDAD
        ↓
MTPD + RTO + RPO + WRT
        ↓
INVENTARIO DE OBJETOS RECUPERABLES
        ↓
POLÍTICA DE COPIAS Y AISLAMIENTO
        ↓
RESTAURACIÓN TÉCNICA ORDENADA
        ↓
VALIDACIÓN EMPRESARIAL Y CONCILIACIÓN
        ↓
RETORNO CONTROLADO Y EVIDENCIA
```

`CONT-DOM-002` a `CONT-DOM-004` aprobarán análisis de impacto y objetivos numéricos. `CONT-DOM-011` y `CONT-DOM-012` materializarán política y runbooks. `CONT-DOM-014` gobernará ejercicios. `TI-DOM-011`, arquitectura E3/E4, BLOQUE R, paquetes E5, readiness y BLOQUE U implementarán y certificarán este contrato.

---

#### 3. Alcance

El contrato cubre:

- datos transaccionales y maestros;
- ledgers, saldos, movimientos, estados y secuencias;
- identidades, vínculos, permisos, RLS, RPC y configuración de autorización;
- documentos, imágenes, firmas, evidencia y objetos de Storage;
- eventos, outbox, inbox, colas, dead-letter y jobs;
- datos locales u offline pendientes de sincronización;
- esquemas, migraciones, funciones, triggers y configuración de base de datos;
- código fuente, dependencias bloqueadas, artefactos de build y releases;
- configuración de aplicaciones, ambientes, redes, dispositivos e impresión;
- secretos, llaves y credenciales mediante mecanismos especializados de recuperación;
- telemetría, auditoría y registros sujetos a retención;
- proveedores SaaS, pasarelas, mensajería y servicios externos;
- procedimientos manuales, folios y evidencia generados durante contingencia;
- ambientes local, CI, staging, recuperación aislada, piloto y producción.

No obliga a respaldar todo de la misma forma. Un objeto reconstruible podrá tener una estrategia diferente, pero esa condición deberá demostrarse y mantenerse vigente.

---

#### 4. Principios obligatorios

1. **Recuperación empresarial:** el objetivo final es recuperar resultados y obligaciones, no solo encender componentes.
2. **Objetivos derivados del impacto:** RTO y RPO no se copiarán de una plantilla ni de la capacidad del proveedor.
3. **Sin valor universal:** una aplicación, proceso o tabla no tendrá un RTO o RPO único cuando sus capacidades y datos tengan criticidades distintas.
4. **Consistencia antes que velocidad aparente:** una restauración rápida pero incoherente no cumple.
5. **Independencia de fallas:** al menos una copia crítica deberá sobrevivir al fallo o compromiso del sistema primario y sus credenciales ordinarias.
6. **Restaurabilidad probada:** éxito del job, existencia del archivo o réplica saludable no prueban recuperación.
7. **Mínimo privilegio:** crear, consultar, restaurar, validar y eliminar copias serán capacidades separadas.
8. **Privacidad y retención:** respaldo no crea excepción permanente a minimización, retención, hold o disposición.
9. **Punto explícito:** toda recuperación identificará el punto elegido, lo potencialmente perdido y los hechos posteriores que deben reconciliarse.
10. **Orden por dependencia:** identidad, esquema, datos, archivos, eventos, aplicaciones y periféricos se recuperarán según grafo aprobado.
11. **No efectos externos accidentales:** un ambiente de restauración no enviará pagos, mensajes, impresiones, webhooks ni movimientos reales.
12. **Compatibilidad verificable:** copia, esquema, versión, llaves y runbook deberán ser compatibles o tener transición aprobada.
13. **Evidencia reproducible:** toda prueba conservará inicio, punto, duración, resultado, fallas, validadores y pendientes.
14. **Recuperación segura:** una copia contaminada, cifrada, manipulada o con vulnerabilidad conocida no se promoverá sin evaluación.
15. **Conciliación obligatoria:** trabajo offline, eventos tardíos, proveedores y documentos manuales se reincorporarán de forma idempotente.
16. **No borrado silencioso:** expiración o eliminación de copias tendrá política, autoridad, auditoría y hold aplicable.
17. **Proveedor no equivale a garantía:** una promesa comercial deberá traducirse a cobertura, evidencia, portabilidad y pruebas propias.
18. **Hallazgo con dueño:** toda brecha deberá vincularse a una tarea concreta y una puerta de resolución.

---

#### 5. Conceptos que deberán permanecer separados

| Concepto            | Significado canónico                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------- |
| alta disponibilidad | capacidad de mantener o reanudar servicio mediante redundancia sin restaurar una copia histórica  |
| réplica             | copia operativa sincronizada que puede propagar corrupción, eliminación o cifrado                 |
| snapshot            | captura puntual cuya consistencia y dependencia deberán comprobarse                               |
| backup              | copia administrada para recuperación, con catálogo, política, integridad, retención y aislamiento |
| archive             | conservación de largo plazo o evidencia; no presume recuperación operativa rápida                 |
| export              | extracción portátil que puede ser incompleta, no consistente o no restaurable                     |
| rollback            | retorno de código, configuración o migración; no sustituye recuperación de datos                  |
| failover            | traslado del servicio a una capacidad alterna; puede conservar el mismo estado corrupto           |
| restore             | reconstrucción técnica desde una copia o cadena de recuperación                                   |
| recovery            | retorno verificado del servicio mínimo empresarial y posterior conciliación                       |
| reconciliation      | comparación y resolución de hechos faltantes, duplicados, tardíos o conflictivos                  |

Ninguno de estos objetos se presentará como equivalente por comodidad de interfaz o proveedor.

---

#### 6. Definiciones temporales obligatorias

```text
MTPD
→ periodo máximo tolerable de interrupción antes de daño inaceptable

MBCO
→ nivel mínimo de producto o servicio que deberá sostenerse o recuperarse

RTO
→ objetivo máximo para verificar el MBCO después del inicio del impacto

RPO
→ máxima pérdida temporal tolerable entre el punto de impacto y el último estado empresarial consistente recuperable

WRT
→ tiempo posterior a la restauración técnica requerido para validar, reconciliar y reanudar el trabajo

RECUPERACIÓN TOTAL
→ restauración del servicio normal, backlog, integraciones, conciliación y controles ordinarios
```

La relación objetivo será:

```text
RTO + WRT <= MTPD
```

cuando los términos resulten aplicables y hayan sido aprobados mediante análisis de impacto.

---

#### 7. Relojes y puntos de medición

Cada incidente o ejercicio deberá poder conservar:

```text
impact_started_at
impact_detection_at
continuity_declared_at
recovery_authorized_at
restore_started_at
technical_service_restored_at
minimum_business_service_verified_at
reconciliation_completed_at
normal_operation_restored_at
```

El reloj de RTO comenzará en `impact_started_at` cuando pueda determinarse de forma confiable. Si el inicio real es incierto, se usará la primera evidencia verificable y se conservará el rango de incertidumbre; no se moverá el inicio hasta la declaración para ocultar demora de detección.

El cumplimiento técnico y el empresarial se medirán por separado:

```text
ACTUAL TECHNICAL RESTORE DURATION
ACTUAL BUSINESS RECOVERY DURATION
ACTUAL WORK RECOVERY DURATION
ACTUAL DATA LOSS WINDOW
```

---

#### 8. Gobierno de objetivos

Todo objetivo tendrá:

- proceso, capacidad o grupo de consistencia;
- propietario empresarial y técnico;
- servicio mínimo esperado;
- escenario de interrupción;
- ventana operativa, sede, temporada y duración relevante;
- dependencias y recursos alternativos;
- impacto y fundamento;
- RTO, RPO, MTPD y WRT cuando apliquen;
- estado `APPROVED`, `PROVISIONAL_WITH_BASIS` o `UNRESOLVED_BLOCKING`;
- autoridad de aprobación;
- fecha y versión;
- próxima revisión;
- evidencia de ejercicio;
- excepciones y riesgo aceptado.

`UNRESOLVED_BLOCKING` impedirá declarar readiness para una capacidad crítica. No se sustituirá por cero, “lo antes posible”, “diario” o el valor predeterminado del proveedor.

---

#### 9. Perfiles de prioridad de recuperación

Se adoptan perfiles cualitativos iniciales sin tiempos implícitos:

| Perfil                    | Criterio                                                                                     |
| ------------------------- | -------------------------------------------------------------------------------------------- |
| `RC0_SAFETY_INTEGRITY`    | seguridad humana, acceso crítico, dinero, integridad o efecto irreversible                   |
| `RC1_CRITICAL_OPERATION`  | operación principal sin alternativa sostenible o con acumulación rápida de daño              |
| `RC2_IMPORTANT_OPERATION` | interrupción material con alternativa temporal limitada                                      |
| `RC3_SUPPORTING`          | capacidad necesaria para normalización, análisis o eficiencia, con workaround viable         |
| `RC4_RECONSTRUCTIBLE`     | objeto o capacidad demostrablemente regenerable sin pérdida material ni dependencia circular |

El perfil orienta prioridad y profundidad; no asigna automáticamente un número. Un mismo proceso podrá contener varios grupos con perfiles distintos.

---

#### 10. Perfil obligatorio de recuperación

Cada proceso, servicio o conjunto aplicable deberá declarar en `NFR-PROCESS-RECOVERY-PROFILE-001`:

```text
profile_id
process_or_service
business_owner
technical_owner
recovery_priority
minimum_business_service
operating_windows
impact_scenarios
mtpd_reference
rto_reference
rpo_references
work_recovery_reference
recovery_objects
consistency_groups
sources_of_truth
reconstructible_objects
dependencies
backup_policies
restore_methods
restore_order
credentials_and_keys
external_providers
offline_and_pending_work
manual_contingency
validation_checks
reconciliation_rules
failover_and_return
runbooks
exercise_requirements
observability_and_alerts
privacy_retention_and_holds
known_gaps
status
```

Campos desconocidos serán `UNRESOLVED` con tarea, responsable y puerta; no se completarán mediante supuestos.

---

#### 11. Inventario de objetos recuperables

`NFR-RECOVERY-OBJECT-INVENTORY-001` distinguirá, como mínimo:

- fuente de verdad canónica;
- copia o proyección regenerable;
- caché descartable;
- estado transaccional;
- ledger o secuencia;
- documento y evidencia;
- configuración;
- secreto o llave;
- artefacto de software;
- estado de integración;
- cola o trabajo pendiente;
- dato local u offline;
- telemetría y auditoría;
- activo físico o configuración de periférico;
- registro de proveedor externo.

Cada objeto declarará propietario, sistema, ubicación, sensibilidad, tamaño, crecimiento, dependencias, método de protección, retención, punto de recuperación, método de restauración, validación y estado.

---

#### 12. Fuente de verdad y reconstruibilidad

Un objeto solo será `RECONSTRUCTIBLE` cuando exista:

- fuente íntegra y disponible;
- algoritmo o procedimiento versionado;
- dependencias también recuperables;
- tiempo de reconstrucción compatible con el RTO;
- costo y capacidad suficientes;
- prueba reproducible;
- ausencia de pérdida de decisiones, evidencia o secuencia.

Una vista, índice, caché o proyección no requerirá necesariamente backup propio, pero su reconstrucción deberá probarse. Un dato derivado no será reconstruible si la versión de regla o la fuente histórica ya no existe.

---

#### 13. Política de respaldo por objeto

`NFR-BACKUP-POLICY-MATRIX-001` declarará:

```text
backup_policy_id
recovery_object_or_group
owner
recovery_priority
rpo_reference
capture_method
schedule_or_trigger
consistency_method
full_and_incremental_chain
point_in_time_capability
copy_locations_and_fault_domains
immutability_or_deletion_protection
encryption_and_key_reference
access_policy
retention_and_expiration
legal_hold_behavior
integrity_checks
monitoring_and_alerts
restore_method
last_verified_restore
provider_dependency
cost_and_capacity
exception
status
```

La ausencia de política para una fuente de verdad crítica será brecha bloqueante.

---

#### 14. Frecuencia y RPO

La frecuencia nominal se derivará del RPO y del mecanismo real, no al contrario.

```text
BACKUP CADA 24 HORAS
NO DEMUESTRA
RPO DE 24 HORAS
```

También deberán considerarse:

- duración y fallas del job;
- ventanas sin captura;
- retraso de logs o replicación;
- consistencia entre objetos;
- cambios pendientes en dispositivo, cola o proveedor;
- capacidad de restaurar toda la cadena;
- momento real del último punto verificado.

Un RPO igual a cero solo podrá declararse cuando la arquitectura y las pruebas demuestren persistencia durable, coherente y recuperable para todo el grupo aplicable. La réplica síncrona por sí sola no protege frente a corrupción lógica o eliminación autorizada.

---

#### 15. Métodos de protección

Podrán combinarse:

- backup completo;
- incremental o diferencial;
- logs de transacciones o point-in-time recovery;
- snapshots consistentes;
- versionado de objetos;
- copias inmutables;
- exportaciones portables verificadas;
- repositorios de código y artefactos firmados;
- configuración declarativa;
- escrow o recuperación especializada de llaves;
- captura manual controlada durante contingencia.

Cada mecanismo indicará qué riesgos cubre y cuáles no. No se presentará una función del proveedor como protección integral sin prueba de restauración.

---

#### 16. Grupos de consistencia

Los datos que deban representar el mismo hecho se restaurarán como grupo o se reconciliarán explícitamente. Se evaluarán, entre otros:

- estado del proceso y eventos;
- movimiento y saldo;
- orden, pago y devolución;
- remisión, cantidades y recepción;
- receta, versión y producción;
- usuario, vínculo, rol y permisos;
- documento, metadatos y firma;
- archivo y referencia de base de datos;
- outbox, inbox, deduplicación y consumidor;
- job, checkpoint y resultado.

Una restauración parcial no podrá crear una combinación histórica imposible.

---

#### 17. Base de datos y Supabase

La estrategia deberá cubrir, según aplique:

- esquema y extensiones;
- tablas, secuencias, constraints e índices;
- funciones, triggers, vistas y materializaciones;
- RLS, grants, roles y RPC;
- Auth, vínculos e identidades requeridas;
- Storage, buckets, políticas y metadatos;
- Realtime y consumidores;
- secretos y configuración mediante canales separados;
- migraciones aplicadas y versión de contrato;
- point-in-time recovery o cadena equivalente;
- restauración en proyecto o instancia aislada;
- comparación de drift antes de promoción.

No se asumirá que respaldar tablas recupera autorización, archivos, funciones o configuración.

---

#### 18. Documentos, archivos y evidencia

La recuperación de objetos deberá conservar:

- contenido y hash;
- metadatos y clasificación;
- vínculo con proceso y recurso;
- versión y supersesión;
- firma o evidencia de integridad;
- retención, hold y disposición;
- permisos y alcance;
- ausencia o cuarentena de malware;
- estado de carga incompleta;
- relación entre objeto y registro de base de datos.

Un archivo restaurado sin referencia, o una referencia restaurada sin archivo, se tratará como recuperación incompleta.

---

#### 19. Identidad, configuración, secretos y llaves

Credenciales y llaves no se copiarán en texto plano dentro de respaldos ordinarios. El contrato exigirá:

- mecanismo de recuperación o rotación;
- custodia separada;
- múltiples responsables cuando corresponda;
- acceso temporal y auditado;
- prueba de descifrado en ambiente controlado;
- revocación posterior al ejercicio;
- respuesta ante llave perdida o comprometida;
- compatibilidad entre copia cifrada y material criptográfico.

Restaurar una identidad no restaurará automáticamente sesiones, dispositivos, excepciones o privilegios revocados.

---

#### 20. Código, artefactos y configuración técnica

La recuperación deberá poder reconstruir una versión desplegable desde:

- repositorio y commit identificados;
- dependencias bloqueadas;
- scripts de build reproducibles;
- artefactos y checksums;
- variables y configuración no secreta versionada;
- migraciones y contratos;
- imágenes o paquetes aprobados;
- configuración de infraestructura y red cuando aplique;
- plantillas de impresión y firmware autorizado;
- manifiesto de release y rollback.

Una copia de datos sin aplicación compatible no cumple el objetivo de recuperación.

---

#### 21. Colas, trabajos y estado offline

Se deberá decidir por cada clase de pendiente si se:

- recupera desde almacenamiento durable;
- reconstruye desde fuente canónica;
- reemite con idempotencia;
- concilia con proveedor o consumidor;
- cancela con evidencia;
- cuarentena para revisión.

No se reejecutarán ciegamente outbox, webhooks, pagos, impresiones, notificaciones o movimientos después de restaurar. El estado local de dispositivos deberá compararse con el estado recuperado antes de sincronizar.

---

#### 22. Proveedores e integraciones externas

Cada dependencia crítica declarará:

- datos y configuración bajo control del proveedor;
- capacidad de exportación y formato;
- retención y recuperación ofrecidas;
- evidencia y límites contractuales;
- credenciales de recuperación;
- punto de conciliación;
- alternativa o procedimiento degradado;
- salida del proveedor y portabilidad;
- contactos y escalamiento;
- pruebas permitidas.

Un dashboard del proveedor no sustituirá evidencia de recuperación empresarial propia.

---

#### 23. Aislamiento y dominios de falla

Las copias críticas deberán evitar una dependencia única de:

- cuenta administrativa ordinaria;
- proyecto o tenant primario;
- región o ubicación única cuando el riesgo lo exija;
- mismo dispositivo o volumen;
- mismas credenciales;
- misma política de eliminación;
- mismo proveedor sin salida verificable.

La estrategia definirá copias operativas, de recuperación, aisladas, inmutables o archivadas según riesgo. No se impone una cantidad universal de copias sin análisis, pero toda fuente crítica deberá sobrevivir a los escenarios aprobados.

---

#### 24. Seguridad y segregación

Se separarán las capacidades de:

- configurar política;
- ejecutar respaldo;
- consultar catálogo;
- leer contenido;
- seleccionar punto;
- autorizar restauración;
- ejecutar restauración;
- validar técnicamente;
- validar empresarialmente;
- promover al servicio;
- eliminar copia;
- liberar hold;
- administrar llaves.

Break-glass y cuentas de recuperación tendrán vigencia, motivo, aprobación, monitoreo, rotación y revocación. Toda acción sensible quedará auditada.

---

#### 25. Retención, privacidad y disposición

Backup y retención empresarial permanecerán relacionados pero separados:

- una copia no será archivo permanente por defecto;
- retención se definirá por objeto, política y riesgo;
- legal hold prevalecerá sobre expiración ordinaria;
- eliminación del sistema primario no exigirá edición destructiva insegura de cada backup;
- el dato deberá dejar de reaparecer cuando las copias expiren según política;
- una restauración no resucitará cuentas, permisos, consentimientos o datos ya retirados sin proceso de reconciliación;
- ambientes de prueba no recibirán datos productivos sin minimización y autorización;
- la disposición de copias conservará evidencia sin contenido innecesario.

`INFO-DOM-006` y `NFR-REQ-006` gobernarán periodos y reglas definitivas.

---

#### 26. Catálogo, integridad y salud de respaldos

Cada ejecución deberá producir un manifiesto con:

```text
backup_id
policy_id
source
scope
start_and_end
recovery_point
method
chain_and_parent
object_count_or_size
schema_and_version
encryption_and_key_reference
integrity_result
storage_location
immutability_until
expiration
status
error_code
```

Estados mínimos:

```text
SCHEDULED
RUNNING
COMPLETED_UNVERIFIED
VERIFIED
FAILED
DEGRADED
QUARANTINED
EXPIRED
DELETED
```

`COMPLETED_UNVERIFIED` no se presentará como restaurable.

---

#### 27. Observabilidad y alertas

Se observarán como mínimo:

- job omitido, tardío o fallido;
- último punto recuperable real;
- edad frente a RPO;
- cadena incompleta;
- copia corrupta o no verificable;
- capacidad y crecimiento;
- expiración o hold conflictivo;
- eliminación o cambio de política;
- llave o credencial no disponible;
- restauración fallida o excedida;
- ejercicio vencido;
- proveedor sin evidencia;
- copia inmutable no creada;
- divergencia entre inventario y cobertura.

Las alertas seguirán `NFR-REQ-009` y tendrán propietario y runbook.

---

#### 28. Solicitud y autorización de restauración

Toda restauración declarará:

- incidente, ejercicio o motivo;
- alcance y objeto;
- punto solicitado;
- daño que se pretende corregir;
- riesgo de sobrescritura;
- datos posteriores potencialmente afectados;
- ambiente destino;
- autoridad y segregación;
- snapshot o protección previa cuando corresponda;
- plan de validación;
- suppressions de efectos externos;
- rollback de la propia restauración;
- comunicación y responsables.

No se restaurará directamente sobre producción como primera prueba.

---

#### 29. Selección del punto de recuperación

El punto elegido deberá equilibrar:

- integridad conocida;
- proximidad al impacto;
- contaminación o corrupción;
- compatibilidad de esquema;
- consistencia del grupo;
- disponibilidad de llaves;
- hechos posteriores recuperables por replay o conciliación;
- riesgo de duplicación;
- obligaciones legales y evidencia.

Se conservará qué intervalo podría perderse y cómo se tratará cada clase de hecho posterior.

---

#### 30. Recuperación aislada y clean room

Las restauraciones de prueba o investigación utilizarán un ambiente aislado que:

- no tenga rutas productivas por defecto;
- use credenciales separadas;
- bloquee webhooks, pagos, correo, mensajería e impresión real;
- identifique datos restaurados;
- aplique acceso mínimo;
- permita escaneo y revisión de integridad;
- conserve logs y evidencia del ejercicio;
- tenga destrucción segura y plazo definido;
- impida promoción accidental.

Una copia sospechosa se restaurará primero en cuarentena.

---

#### 31. Orden de recuperación y dependencias

Cada runbook declarará un grafo y checkpoints. La secuencia podrá incluir:

1. mando, autorización y comunicaciones;
2. identidad técnica, llaves y acceso de recuperación;
3. infraestructura, red, DNS y reloj;
4. base de datos, esquema y configuración;
5. Storage y evidencia;
6. colas, eventos, jobs y deduplicación;
7. aplicaciones propietarias;
8. aplicaciones consumidoras;
9. integraciones y proveedores;
10. dispositivos y periféricos;
11. validación empresarial;
12. reincorporación y conciliación;
13. retorno a operación normal.

La secuencia real dependerá del perfil; no se aplicará ciegamente una lista universal.

---

#### 32. Compatibilidad, migraciones y drift

Antes de promover una restauración se verificará:

- versión de esquema;
- migraciones requeridas y reversibilidad;
- compatibilidad de código;
- contratos y SDK;
- RLS, grants y funciones;
- configuración y secretos;
- formato de objetos;
- versiones de eventos;
- checksums y conteos;
- drift contra el manifiesto;
- capacidad de consumidores y proveedores.

Las migraciones sobre datos restaurados serán idempotentes o tendrán checkpoint y rollback. No se saltarán versiones sin contrato.

---

#### 33. Supresión de efectos durante restauración

Por defecto, el ambiente restaurado no:

- enviará notificaciones;
- capturará o reembolsará pagos;
- publicará eventos externos;
- ejecutará webhooks;
- imprimirá;
- descontará o agregará inventario real;
- rotará credenciales productivas;
- enviará pedidos o compras;
- sincronizará dispositivos;
- ejecutará jobs programados destructivos.

Cada efecto se habilitará solo después de validación, autorización y punto de retorno definido.

---

#### 34. Validación técnica

La validación técnica cubrirá, según aplique:

- integridad de archivos y manifiestos;
- apertura y lectura;
- constraints, secuencias e índices;
- conteos y checksums;
- consistencia referencial;
- esquema y migraciones;
- RLS, RPC y permisos;
- autenticación controlada;
- Storage y referencias;
- colas y deduplicación;
- health checks y observabilidad;
- latencia y capacidad mínima;
- ausencia de conexiones productivas no autorizadas.

Superar esta etapa no cierra la recuperación empresarial.

---

#### 35. Validación empresarial y conciliación

El propietario del proceso deberá comprobar:

- estado y obligaciones abiertas;
- saldos, cantidades y secuencias;
- documentos y evidencia;
- pedidos, pagos, producción, remisiones o entregas aplicables;
- permisos y actores vigentes;
- hechos manuales u offline;
- eventos posteriores al punto restaurado;
- duplicados, faltantes y conflictos;
- aceptación de consumidores;
- capacidad de operar el MBCO;
- backlog y plan de normalización.

El servicio solo se declarará recuperado cuando el resultado empresarial mínimo sea verificable.

---

#### 36. Failover, retorno y normalización

Failover y restauración tendrán decisiones separadas. El contrato deberá definir:

- condición de activación;
- autoridad;
- estado de datos y RPO alcanzable;
- limitaciones del entorno alterno;
- split-brain y fuente activa;
- sincronización o reintegración;
- condición de retorno;
- rollback del failback;
- validación posterior;
- retiro de accesos y capacidades temporales.

No se retornará al primario solo porque vuelva a responder.

---

#### 37. Restauración granular

Cuando sea viable, podrán restaurarse:

- una fila o agregado;
- un documento u objeto;
- un esquema o tabla;
- una configuración;
- una cuenta técnica;
- una versión de archivo;
- un conjunto de eventos;
- una sede o periodo lógico.

La recuperación granular deberá preservar relaciones, auditoría y efectos derivados. Si no puede garantizarse consistencia, se usará un grupo mayor y conciliación.

---

#### 38. Corrupción, ransomware y pérdida de llaves

Los escenarios mínimos incluirán:

- eliminación accidental;
- actualización masiva incorrecta;
- migración defectuosa;
- corrupción silenciosa detectada tarde;
- cifrado o ransomware;
- compromiso de cuenta administrativa;
- eliminación de backups ordinarios;
- copia contaminada;
- pérdida o revocación de llave;
- proveedor indisponible o cierre de cuenta;
- región o ubicación inaccesible;
- datos restaurados con vulnerabilidad conocida.

La estrategia deberá permitir identificar un punto limpio y evitar reintroducir la causa.

---

#### 39. Matriz de los 69 procesos

`NFR-RTO-RPO-MATRIX-001` cubrirá exactamente `VPROC-0001` a `VPROC-0069` con:

- proceso y propietaria;
- resultado mínimo;
- sedes, horarios y temporadas;
- impacto y perfil `RC*`;
- MTPD, RTO, RPO y WRT o estado bloqueante;
- grupos de consistencia;
- objetos y fuentes de verdad;
- dependencias y proveedor;
- alternativa manual u offline;
- política de respaldo;
- orden y runbook;
- validación técnica y empresarial;
- conciliación y retorno;
- último ejercicio;
- brechas, controles y tarea responsable.

Una sola cifra por aplicación no reemplazará esta matriz.

---

#### 40. Ejercicios y evidencia

`NFR-RECOVERY-EXERCISE-MATRIX-001` combinará según riesgo:

- revisión documental;
- walkthrough de runbook;
- restauración de muestra;
- restauración completa aislada;
- recuperación de grupo de consistencia;
- point-in-time recovery;
- recuperación de Storage;
- reconstrucción desde código y configuración;
- pérdida de llave o credencial;
- failover y failback controlados;
- pérdida de proveedor;
- ransomware y punto limpio;
- reincorporación de trabajo offline o manual;
- validación empresarial con usuarios responsables.

La periodicidad final dependerá de criticidad, cambios, incidentes, expiración de evidencia y `CONT-DOM-014`. Todo cambio material podrá exigir un nuevo ejercicio antes del calendario ordinario.

---

#### 41. Excepciones y severidad de brechas

| Clase        | Ejemplos                                                                                                   | Tratamiento                                               |
| ------------ | ---------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| `REC-GAP-P0` | fuente crítica sin copia aislada; llave irrecuperable; restauración imposible; RTO o RPO crítico sin dueño | bloquea piloto o producción aplicable                     |
| `REC-GAP-P1` | restauración no probada; cadena incompleta; grupo inconsistente; runbook crítico vencido                   | resolución antes de readiness o control temporal aprobado |
| `REC-GAP-P2` | cobertura parcial, automatización insuficiente o evidencia antigua con alternativa viable                  | tarea y fecha obligatorias                                |
| `REC-GAP-P3` | mejora de eficiencia o documentación sin riesgo inmediato                                                  | backlog priorizado                                        |

Toda excepción tendrá alcance, causa, riesgo, control, responsable, vencimiento, criterio de salida y autoridad de aceptación.

---

#### 42. Responsabilidad documental

| Decisión o implementación                  | Tarea propietaria                                                |
| ------------------------------------------ | ---------------------------------------------------------------- |
| análisis de impacto y objetivos numéricos  | `CONT-DOM-002` a `CONT-DOM-004`                                  |
| política e inventario de respaldos         | `CONT-DOM-011`; `TI-DOM-011`                                     |
| runbooks, restauración, failover y retorno | `CONT-DOM-012`; `CONT-UX-005`                                    |
| proveedores y recursos alternativos        | `CONT-DOM-013`; `CONT-INT-003`                                   |
| ejercicios                                 | `CONT-DOM-014`; `CONT-UX-007`                                    |
| lecciones y mantenimiento                  | `CONT-DOM-015`                                                   |
| autorización de recuperación               | `CONT-AUTH-001` a `CONT-AUTH-004`; `TI-AUTH-001` a `TI-AUTH-004` |
| arquitectura de Supabase y Storage         | tareas `SUPA-ARC-*`, `SUPA-TRANS-*` y BLOQUE R aplicables        |
| colas, replay y conciliación               | `QUEUE-ARC-*`; `CONT-INT-004`                                    |
| observabilidad y soporte                   | `NFR-REQ-009`; `OBS-ARC-*`; BLOQUE Z                             |
| implementación por dominio                 | paquetes E5 propietarios                                         |
| certificación transversal                  | readiness, BLOQUE T y BLOQUE U                                   |

Un hallazgo no podrá cerrarse con “se verá en continuidad”; deberá quedar enlazado a una tarea concreta de esta tabla o generar una nueva.

---

#### 43. Guardrails de cierre

No podrá certificarse una capacidad cuando exista:

- fuente de verdad crítica fuera del inventario;
- RTO, RPO o MTPD crítico `UNRESOLVED_BLOCKING`;
- respaldo sin propietario o política;
- copia dependiente del mismo dominio de falla sin control;
- cadena incompleta o punto no verificable;
- llave o credencial no recuperable;
- restauración crítica nunca probada;
- runbook sin orden, validación o rollback;
- grupo de consistencia sin estrategia;
- restauración que pueda emitir efectos externos reales;
- validación exclusivamente técnica;
- backlog o trabajo manual sin conciliación;
- ejercicio fallido sin tarea y control;
- brecha `REC-GAP-P0` o `REC-GAP-P1` abierta sin aceptación válida.

---

#### 44. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PROC-501 a TREQ-PROC-540
```

Cobertura:

1. perfil de recuperación por proceso y servicio;
2. separación de backup, réplica, snapshot, archive, export, rollback y failover;
3. definiciones y relojes de MTPD, MBCO, RTO, RPO y WRT;
4. gobierno de objetivos y estados bloqueantes;
5. criticidad y análisis de impacto;
6. medición real de RTO;
7. medición real de RPO y pérdida;
8. relación entre MTPD, RTO y WRT;
9. restauración técnica frente a recuperación empresarial;
10. inventario de objetos recuperables;
11. fuentes de verdad y reconstruibilidad;
12. política de respaldo por objeto;
13. frecuencia derivada del RPO;
14. mecanismos y cadenas de recuperación;
15. grupos de consistencia;
16. transacciones, eventos y colas;
17. estado offline y local;
18. Storage, documentos y evidencia;
19. identidad, configuración, secretos y llaves;
20. código, builds e infraestructura declarativa;
21. proveedores y portabilidad;
22. aislamiento, inmutabilidad y dominios de falla;
23. cifrado y gestión de llaves;
24. autorización, segregación y break-glass;
25. observabilidad y alertas de backup;
26. retención, expiración y hold;
27. privacidad, disposición y no resurrección;
28. catálogo, manifiesto e integridad;
29. selección del punto de recuperación;
30. restauración aislada y clean room;
31. compatibilidad, esquema y migraciones;
32. orden de dependencias;
33. supresión de efectos externos;
34. validación técnica;
35. validación empresarial y conciliación;
36. failover, failback y retorno;
37. restauración granular;
38. corrupción, ransomware y pérdida de llaves;
39. matriz de los 69 procesos;
40. ejercicios, guardrails y certificación.

La evidencia deberá indicar que proviene de `NFR-REQ-010` aprobada.

---

#### 45. Criterios de aceptación

- [ ] Se separan alta disponibilidad, réplica, snapshot, backup, archive, export, rollback, failover, restore y recovery.
- [ ] MTPD, MBCO, RTO, RPO y WRT tienen semántica y relojes inequívocos.
- [ ] El inicio del impacto no se desplaza para ocultar demora de detección.
- [ ] Los objetivos se asignan por proceso, capacidad o grupo, no por aplicación completa.
- [ ] No se inventan tiempos sin análisis de impacto y autoridad.
- [ ] `RTO + WRT <= MTPD` se valida cuando aplique.
- [ ] Un RPO cero exige arquitectura y prueba de consistencia durable.
- [ ] Cada fuente de verdad crítica aparece en el inventario.
- [ ] La reconstruibilidad se demuestra y no se presume.
- [ ] Cada objeto tiene política, punto, retención, integridad y restauración.
- [ ] Frecuencia nominal y RPO real no se confunden.
- [ ] Grupos de consistencia impiden combinaciones históricas imposibles.
- [ ] Base de datos, Auth, RLS, RPC, Storage, configuración y llaves están cubiertos según aplique.
- [ ] Colas, eventos y estado offline tienen estrategia de replay o conciliación.
- [ ] Código, artefactos y configuración permiten reconstrucción reproducible.
- [ ] Proveedores críticos tienen evidencia, exportación y alternativa.
- [ ] Copias críticas resisten los dominios de falla aprobados.
- [ ] Crear, restaurar, validar y eliminar copias están segregados.
- [ ] Backup, retención, hold, privacidad y disposición permanecen coherentes.
- [ ] Todo backup tiene manifiesto y estado verificable.
- [ ] El último punto recuperable y la edad frente a RPO se observan.
- [ ] Toda restauración tiene motivo, autorización, destino, punto y rollback.
- [ ] Las pruebas se realizan primero en ambiente aislado.
- [ ] El orden de recuperación responde a dependencias reales.
- [ ] Esquema, migraciones, contratos y drift se validan.
- [ ] El ambiente restaurado no emite efectos externos por defecto.
- [ ] Validación técnica y empresarial son hitos distintos.
- [ ] La recuperación incluye reconciliación y backlog.
- [ ] Failover y retorno tienen fuente activa y controles de split-brain.
- [ ] Los escenarios incluyen corrupción tardía, ransomware, credenciales y proveedor.
- [ ] Los 69 procesos tendrán perfil y matriz individual antes de implementación.
- [ ] Se incorporan `TREQ-PROC-501` a `TREQ-PROC-540` al registro completo.
- [ ] No se ejecutan respaldos, restauraciones, failover, cambios de proveedor, código, migraciones ni Supabase.
- [ ] `NFR-REQ-011` permanece no iniciada.

---

#### 46. Estado y continuidad

```text
NFR-REQ-008   APROBADA
NFR-REQ-009   APROBADA
NFR-REQ-010   APROBADA
NFR-REQ-011   NO INICIADA
```

La aprobación explícita de esta tarea congela el contrato inicial de respaldo y recuperación. No demuestra cumplimiento de RTO o RPO ni autoriza una restauración sobre datos reales.


### ✅ NFR-REQ-011 — Definir compatibilidad mínima por dispositivo

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-010 — Definir respaldo, RTO y RPO` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-012 — Aprobar requisitos no funcionales antes de E5` — NO INICIADA  
**Artefactos aprobados:** `NFR-DEVICE-COMPATIBILITY-CONTRACT-001`; `NFR-DEVICE-PROFILE-CATALOG-001`; `NFR-APPLICATION-DEVICE-SUPPORT-MATRIX-001`; `NFR-PROCESS-DEVICE-COMPATIBILITY-MATRIX-001`; `NFR-RUNTIME-SUPPORT-POLICY-001`; `NFR-CAPABILITY-DETECTION-CONTRACT-001`; `NFR-REAL-DEVICE-TEST-MATRIX-001`; `NFR-COMPATIBILITY-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de compatibilidad por perfil de dispositivo, sistema operativo, runtime, viewport, modalidad de entrada, capacidades, recursos, conectividad, periféricos, seguridad, accesibilidad, actualización y soporte; no compra de equipos, homologación de modelos, bloqueo productivo, retiro de dispositivos ni implementación de detección técnica  
**Cambios en código, dependencias, configuración, navegadores, sistemas operativos, dispositivos, Supabase, infraestructura, políticas MDM, despliegues o compras:** no autorizados

---

#### 1. Propósito

Definir el contrato verificable mediante el cual Vento OS determinará si una aplicación, proceso y paso pueden utilizarse de forma segura, completa y soportable desde un dispositivo concreto.

```text
QUE LA PANTALLA ABRA
≠ QUE EL DISPOSITIVO SEA COMPATIBLE

QUE EL DISEÑO SEA RESPONSIVE
≠ QUE EL PROCESO PUEDA COMPLETARSE

QUE EL NAVEGADOR SOPORTE JAVASCRIPT
≠ QUE SOPORTE CÁMARA, IMPRESIÓN, OFFLINE O SESIÓN COMPARTIDA

QUE FUNCIONE EN UN MODELO
≠ QUE FUNCIONE EN TODA LA FAMILIA

QUE FUNCIONE HOY
≠ QUE TENGA CICLO DE SOPORTE
```

La aprobación de esta tarea congela perfiles, estados, dimensiones, criterios y pruebas mínimas. No certifica ningún equipo actual, no aprueba versiones concretas y no autoriza la compra o retiro de dispositivos.

---

#### 2. Continuidad lógica

`NFR-REQ-007` fijó accesibilidad y ergonomía. `NFR-REQ-008` definió capacidades de hardware, red y periféricos. `NFR-REQ-009` estableció observabilidad y soporte. `NFR-REQ-010` determinó recuperación y continuidad.

`NFR-REQ-011` convierte esas obligaciones en una política de compatibilidad por dispositivo:

```text
PROCESO Y PASO OPERATIVO
        ↓
PERFIL DE ESTACIÓN Y MODALIDAD
        ↓
CAPACIDADES MÍNIMAS DEL DISPOSITIVO
        ↓
RUNTIME, RECURSOS, RED Y PERIFÉRICOS
        ↓
PRUEBA EN DISPOSITIVO REAL
        ↓
ESTADO DE SOPORTE Y LIMITACIONES
        ↓
MONITOREO, ACTUALIZACIÓN Y RETIRO
```

`UX-STATION-002` a `UX-STATION-012` materializarán estaciones e interacción. `TI-DOM-002` a `TI-DOM-006` gobernarán configuración y ciclo tecnológico. Los paquetes E5 implementarán la compatibilidad por aplicación. Readiness, BLOQUE T y BLOQUE U la certificarán.

---

#### 3. Alcance

El contrato aplica a:

- computadores de escritorio y portátiles;
- tabletas personales o compartidas;
- teléfonos personales, corporativos o dedicados;
- kioscos, terminales POS y estaciones cerradas;
- navegadores web, aplicaciones instaladas, PWA y WebView;
- sistemas operativos, runtime, motor y políticas de actualización;
- pantallas, viewport, densidad, orientación y zoom;
- teclado, mouse, táctil, stylus, cámara, escáner y lector físico;
- impresoras, datáfonos, básculas, sensores y periféricos;
- almacenamiento local, caché, outbox y operación offline;
- conectividad, DNS, certificados, TLS, Wi-Fi y red cableada;
- memoria, CPU, batería, energía, temperatura y almacenamiento;
- accesibilidad y tecnologías de asistencia;
- dispositivos administrados, compartidos, personales y de proveedor;
- entornos local, CI, laboratorio, staging, piloto y producción.

La matriz podrá declarar que una aplicación no es compatible con una familia. Esa exclusión deberá ser explícita, justificada y visible; nunca se inferirá desde un fallo tardío.

---

#### 4. Principios obligatorios

1. **Compatibilidad orientada al resultado:** se evalúa completar el proceso, no solo renderizar una ruta.
2. **Perfil antes que marca:** la regla primaria será la capacidad requerida; marca y modelo serán evidencia de una instancia probada.
3. **Matriz versionada:** toda combinación soportada tendrá versión, evidencia, responsable y fecha de revisión.
4. **Fallo cerrado:** ausencia de una capacidad crítica bloqueará el paso antes de producir efectos parciales.
5. **Detección efectiva:** se comprobarán capacidades cuando sea posible; el user agent no será la única fuente.
6. **Degradación explícita:** una modalidad degradada deberá conservar seguridad, autorización, evidencia y resultado.
7. **Equivalencia funcional:** el fallback no podrá omitir controles ni convertir una acción crítica en manual informal.
8. **Dispositivo real:** emulación y responsive tests no sustituyen prueba física cuando intervienen tacto, cámara, batería, permisos o periféricos.
9. **Actualización gobernada:** una versión nueva no se asume compatible hasta superar smoke y regresión proporcional.
10. **Retiro controlado:** una versión o perfil dejará de soportarse mediante aviso, alternativa, fecha, inventario y verificación.
11. **Accesibilidad integrada:** compatibilidad incluye acceso mediante la modalidad aprobada y no solo capacidad técnica.
12. **Seguridad mínima:** un runtime sin soporte, contexto inseguro o dispositivo comprometido no será compatible para acciones protegidas.
13. **Recursos medibles:** memoria, almacenamiento, red y batería deberán soportar la carga aprobada.
14. **Soporte reproducible:** cada fallo conservará perfil, versión, capacidades, estado y diagnóstico seguro.
15. **Sin lista eterna:** la matriz no prometerá soporte indefinido a una versión, modelo o WebView.
16. **No bypass por urgencia:** un dispositivo no soportado no se habilitará ocultando el aviso o forzando la ruta.
17. **Hallazgo con dueño:** toda incompatibilidad o excepción tendrá tarea, control, vencimiento y puerta de cierre.

---

#### 5. Definición canónica de dispositivo compatible

Una combinación será compatible únicamente cuando demuestre simultáneamente:

```text
APLICACIÓN Y RELEASE
+ PROCESO Y PASO
+ PERFIL DE DISPOSITIVO
+ SISTEMA OPERATIVO Y RUNTIME
+ VIEWPORT Y ENTRADA
+ CAPACIDADES Y PERIFÉRICOS
+ RECURSOS Y CONECTIVIDAD
+ SEGURIDAD Y AUTORIZACIÓN
+ ACCESIBILIDAD Y ERGONOMÍA
+ PRUEBAS Y SOPORTE VIGENTES
= COMBINACIÓN COMPATIBLE
```

La compatibilidad de lectura no concede compatibilidad de escritura. La compatibilidad de una pantalla no concede compatibilidad del proceso completo. La compatibilidad de una aplicación no concede compatibilidad de todas sus capacidades.

---

#### 6. Unidad mínima de decisión

Cada fila de `NFR-APPLICATION-DEVICE-SUPPORT-MATRIX-001` representará:

```text
APPLICATION_RELEASE
+ CAPABILITY_OR_PROCESS_STEP
+ DEVICE_PROFILE
+ OS_FAMILY_AND_SUPPORT_BAND
+ RUNTIME_FAMILY_AND_SUPPORT_BAND
+ INPUT_AND_VIEWPORT_CLASS
+ REQUIRED_CAPABILITIES
+ SUPPORT_STATUS
```

No se usarán filas genéricas como “Android”, “tablet” o “Chrome” sin contexto suficiente.

---

#### 7. Estados de soporte

| Estado                      | Significado                                                                                 |
| --------------------------- | ------------------------------------------------------------------------------------------- |
| `SUPPORTED`                 | combinación verificada, soportada y sin limitaciones materiales no declaradas               |
| `SUPPORTED_WITH_CONDITIONS` | compatible bajo condiciones explícitas de orientación, periférico, política o configuración |
| `DEGRADED_SUPPORTED`        | conserva resultado y controles mediante una modalidad degradada aprobada                    |
| `TEMPORARILY_BLOCKED`       | combinación antes soportada bloqueada por incidente, regresión o riesgo vigente             |
| `UNSUPPORTED`               | no se diseñó, no se verificó o no puede cumplir el contrato                                 |
| `UNKNOWN_BLOCKED`           | no existe evidencia suficiente; no se habilita una acción crítica                           |
| `RETIRED`                   | soporte finalizado mediante transición aprobada                                             |

`UNKNOWN_BLOCKED` no se transformará automáticamente en `SUPPORTED` porque un usuario haya completado una vez el flujo.

---

#### 8. Perfiles mínimos de dispositivo

Se adoptan perfiles funcionales iniciales:

| Perfil                   | Uso objetivo                                                           | Condiciones mínimas                                                                           |
| ------------------------ | ---------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `DP1_ADMIN_DESKTOP`      | administración, análisis, configuración y trabajo documental           | teclado y puntero; viewport amplio; multitarea; descarga y carga controladas                  |
| `DP2_OPERATIVE_TABLET`   | ejecución operativa táctil en estación o movilidad corta               | tacto, orientación aprobada, cámara opcional, bloqueo, batería y montaje según estación       |
| `DP3_PERSONAL_MOBILE`    | autoservicio de cliente o trabajador y acciones personales             | identidad individual, pantalla pequeña, conectividad variable y permisos del sistema          |
| `DP4_SHARED_KIOSK_POS`   | estación compartida, POS, kiosco o punto dedicado                      | actor efectivo, cambio de usuario, pantalla fijada, periféricos, bloqueo y limpieza de sesión |
| `DP5_MOBILE_FIELD`       | recorrido, logística, conteo o captura en movimiento                   | cámara o escáner, batería, protección, offline y red intermitente                             |
| `DP6_PERIPHERAL_HOST`    | estación que coordina impresión, medición, escaneo o integración local | drivers o adaptadores aprobados, puertos, red, spool, diagnóstico y sustitución               |
| `DP7_READ_ONLY_FALLBACK` | consulta mínima durante degradación o contingencia                     | datos marcados con frescura, sin mutaciones no autorizadas y salida clara                     |

Un equipo podrá cumplir varios perfiles, pero deberá certificarse por separado para cada uno.

---

#### 9. Campos obligatorios de cada perfil

`NFR-DEVICE-PROFILE-CATALOG-001` conservará:

```text
profile_id
purpose
allowed_applications
allowed_process_steps
ownership_and_management
shared_or_personal
minimum_os_support_band
minimum_runtime_support_band
viewport_classes
orientation_policy
input_modalities
accessibility_modalities
required_capabilities
optional_capabilities
forbidden_dependencies
minimum_resources
storage_and_offline_policy
network_and_secure_context
peripheral_contracts
session_and_lock_policy
update_policy
diagnostic_requirements
fallback_and_contingency
validation_matrix
support_owner
review_date
```

---

#### 10. Compatibilidad por aplicación

Cada aplicación deberá declarar los perfiles que soporta y rechaza. La matriz inicial no asumirá que todas las aplicaciones deben ejecutarse en todos los dispositivos.

| Aplicación o familia | Orientación inicial de compatibilidad                                                                                                     |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| SHELL                | escritorio administrativo y superficies de contexto autorizadas; componentes compartidos deberán preservar compatibilidad de consumidoras |
| ANIMA                | móvil personal prioritario y escritorio o tablet como alternativa cuando el proceso lo permita                                            |
| PASS                 | móvil personal prioritario; cámara, enlaces, notificaciones y almacenamiento se validarán por plataforma                                  |
| VISO                 | escritorio prioritario; tablet únicamente para capacidades declaradas                                                                     |
| NEXO                 | tablet, móvil de campo, kiosco y escritorio según paso, estación y periférico                                                             |
| FOGO                 | tablet o estación compartida según área; interacción compatible con ambiente productivo                                                   |
| ORIGO                | escritorio y tablet según recepción, compra, documento o periférico                                                                       |
| PULSO                | POS, tablet o estación dedicada; pagos e impresión requieren perfil físico específico                                                     |
| NUMERA               | escritorio prioritario; acceso móvil limitado a capacidades declaradas                                                                    |
| AURA                 | no adquiere soporte por figurar en la matriz; dependerá de continuidad aprobada y paquete propio                                          |

Esta orientación deberá concretarse mediante `NFR-APPLICATION-DEVICE-SUPPORT-MATRIX-001`; no habilita rutas todavía.

---

#### 11. Política de sistema operativo y runtime

`NFR-RUNTIME-SUPPORT-POLICY-001` deberá:

- usar bandas versionadas y fechas, no expresiones ambiguas como “moderno”;
- distinguir sistema operativo, navegador, motor, WebView, runtime nativo y modo instalado;
- excluir versiones sin soporte de seguridad salvo excepción temporal aprobada;
- declarar una ventana primaria y, cuando corresponda, una banda de transición;
- verificar versiones nuevas antes de marcarlas soportadas;
- bloquear versiones con regresión crítica aunque pertenezcan a la banda nominal;
- conservar fecha de retiro, aviso y alternativa;
- identificar quién mantiene navegadores y WebView en dispositivos administrados;
- evitar que la aplicación dependa de una versión congelada sin estrategia de actualización.

Los números exactos deberán materializarse en la matriz vigente de cada release y no en este texto canónico.

---

#### 12. Navegador, motor y WebView

Una misma etiqueta comercial no garantiza el mismo motor o comportamiento. Se validarán:

- motor y versión efectiva;
- modo normal, instalado, pantalla completa o WebView;
- políticas empresariales y extensiones que alteren el comportamiento;
- cookies, almacenamiento, service worker y permisos;
- navegación, apertura de enlaces y retorno entre aplicaciones;
- descarga, carga, cámara, impresión y portapapeles;
- suspensión, actualización y restauración de estado;
- comportamiento privado o restringido cuando pudiera usarse accidentalmente.

Un navegador embebido de correo, mensajería o proveedor no se considerará compatible por defecto para autenticación o acciones críticas.

---

#### 13. Detección de capacidades

`NFR-CAPABILITY-DETECTION-CONTRACT-001` clasificará cada dependencia como:

```text
REQUIRED
OPTIONAL_WITH_FALLBACK
OPTIONAL_ENHANCEMENT
FORBIDDEN
```

La aplicación deberá comprobar, según aplique:

- API disponible;
- permiso concedido;
- dispositivo o periférico presente;
- contexto seguro;
- conectividad y servicio;
- almacenamiento y cuota;
- identidad y contexto vigentes;
- precisión o calidad suficiente;
- compatibilidad del formato;
- resultado real de la operación.

No se inferirá cámara utilizable solo porque exista la API ni impresión correcta solo porque el navegador abra un diálogo.

---

#### 14. Responsive, viewport y densidad

Cada perfil tendrá clases de viewport y no una lista de resoluciones nominales. Las pruebas cubrirán:

- ancho y alto efectivos después de barras del sistema;
- zoom, tamaño de fuente y escalado;
- densidad y tamaño físico aproximado;
- orientación permitida y cambio de orientación;
- teclado virtual, notch, áreas seguras y overlays;
- panel dividido o multitarea cuando esté permitido;
- scroll, tablas, modales, overlays y acciones persistentes;
- ausencia de contenido u objetivos ocultos.

Reducir controles o texto para “hacerlo caber” no demostrará compatibilidad.

---

#### 15. Modalidades de entrada

Cada paso declarará entradas permitidas:

- táctil;
- mouse o trackpad;
- teclado;
- lector o escáner;
- cámara;
- stylus cuando esté aprobado;
- captura automática desde contexto;
- voz o asistencia únicamente cuando tenga contrato;
- alternativa manual controlada.

No existirán funciones exclusivas por hover, gesto complejo, click derecho o combinación física sin alternativa aprobada.

---

#### 16. Tacto, guantes y ambiente

Los perfiles táctiles heredarán `NFR-REQ-007` y deberán comprobar:

- tamaño físico y separación de objetivos;
- precisión con dedo, guante y humedad cuando apliquen;
- reflejo, brillo y legibilidad;
- postura, alcance, montaje y vibración;
- prevención de toque accidental;
- respuesta visible sin depender de sonido;
- limpieza y protección sin pérdida de sensibilidad;
- comportamiento durante conexión y desconexión del cargador.

La prueba en emulador no sustituirá esta validación.

---

#### 17. Teclado y tecnologías de asistencia

Cuando el perfil permita teclado o tecnología de asistencia, se verificará:

- orden de foco y visibilidad;
- operación completa sin puntero;
- semántica y anuncios;
- zoom, reflow y tamaño de texto;
- contraste y preferencias del sistema;
- lector de pantalla o equivalente de la plataforma;
- cambio entre teclado físico y virtual;
- ausencia de atajos que interfieran con navegador, sistema o asistencia.

Una combinación podrá ser visualmente compatible y resultar incompatible para la modalidad accesible requerida.

---

#### 18. Cámara, escáner y captura

Toda capacidad de captura deberá validar:

- disponibilidad y permiso;
- selección de cámara correcta;
- enfoque, iluminación, resolución y orientación;
- formatos y tamaño de archivo;
- doble lectura, lectura parcial y valor inválido;
- suspensión, rotación y retorno desde el permiso;
- consumo de batería y almacenamiento;
- alternativa manual autorizada;
- eliminación segura de temporales;
- asociación con actor, recurso y proceso correctos.

El rechazo de permiso no podrá dejar una instancia parcialmente creada sin explicación.

---

#### 19. Impresión y periféricos

Un perfil con impresión, pago, medición o escaneo físico deberá declarar:

- periférico y método de descubrimiento;
- driver, adaptador o protocolo;
- conectividad y direccionamiento;
- tamaño, unidad, lenguaje y configuración;
- cola, spool, timeout, retry y receipt;
- permisos y servicio local cuando aplique;
- sustitutos homologados;
- diagnóstico seguro;
- comportamiento cuando el periférico no responde;
- diferencia entre acuse técnico y efecto empresarial.

La compatibilidad del navegador no sustituirá la compatibilidad del periférico completo.

---

#### 20. Almacenamiento local y offline

Todo perfil que admita estado local deberá verificar:

- API y cuota disponibles;
- persistencia real frente a cierre, actualización y reinicio;
- comportamiento ante eviction, almacenamiento lleno y limpieza del sistema;
- cifrado o protección aplicable;
- aislamiento por actor en dispositivo compartido;
- compatibilidad de esquema y migración local;
- outbox, dependencias e idempotencia;
- expiración, frescura y revocación;
- sincronización y conciliación posterior;
- no pérdida silenciosa durante upgrade o rollback.

Modo privado, navegador embebido o política de limpieza podrán convertir una combinación en `UNSUPPORTED`.

---

#### 21. Ciclo de vida, suspensión y segundo plano

En móviles, tabletas, PWA y WebView se probarán:

- background y foreground;
- suspensión por sistema;
- cierre forzado;
- recuperación de memoria;
- reinicio del sistema;
- actualización de aplicación o runtime;
- cambio de red;
- bloqueo y desbloqueo;
- pérdida de permiso;
- retorno desde cámara, archivo, pago o aplicación externa.

La aplicación deberá revalidar sesión, contexto, versión y estado antes de continuar una acción sensible.

---

#### 22. Red y contexto seguro

La compatibilidad exigirá, según perfil:

- DNS y resolución coherentes;
- certificados y reloj válidos;
- TLS y contexto seguro para APIs protegidas;
- proxy, captive portal o filtrado conocidos;
- red cableada o Wi-Fi aprobadas;
- latencia, pérdida y reconexión dentro del contrato;
- descubrimiento de periféricos sin IP hardcodeada cuando corresponda;
- separación de redes y alcance permitido;
- alternativa o bloqueo claro cuando Internet, backend o servicio local fallen.

Un dispositivo conectado a Wi-Fi no se considerará compatible si no alcanza las dependencias reales del proceso.

---

#### 23. Identidad, sesión y dispositivo compartido

Los perfiles compartidos deberán integrar `AUTH-DEV-001` a `AUTH-DEV-016` y demostrar:

- dispositivo registrado y vigente;
- principal técnico separado del actor humano;
- identificación, cambio y cierre del actor;
- bloqueo por inactividad;
- limpieza de datos y secretos entre actores;
- no persistencia de privilegios administrativos;
- revalidación tras suspensión, reinicio o cambio de red;
- modo kiosco o pantalla fijada cuando aplique;
- recuperación y revocación remota;
- auditoría de dispositivo, sesión, actor y contexto.

Una cuenta conjunta o sesión perpetua hará incompatible la estación para mutaciones protegidas.

---

#### 24. Seguridad y postura mínima

La matriz podrá exigir:

- sistema y runtime dentro de soporte;
- bloqueo de pantalla;
- almacenamiento protegido;
- integridad o administración del dispositivo;
- ausencia de root, jailbreak o alteración incompatible;
- instalación desde canal aprobado;
- certificados y hora confiables;
- actualización mínima aplicada;
- restricciones de depuración y herramientas remotas;
- revocación cuando el dispositivo se pierda o retire.

Las señales de postura no reemplazan autorización por acción y contexto.

---

#### 25. Presupuesto de recursos y rendimiento

Cada perfil tendrá presupuestos medibles para:

- memoria y presión de memoria;
- CPU y bloqueo de interfaz;
- tiempo de arranque y recuperación;
- tamaño de bundle y actualización;
- almacenamiento persistente y temporal;
- consumo de red;
- batería y temperatura;
- carga de imágenes, documentos y listas;
- trabajo en segundo plano;
- concurrencia y periféricos.

Los objetivos de `NFR-REQ-002` y `NFR-REQ-003` se medirán sobre equipos representativos del mínimo soportado, no solo sobre el equipo más potente.

---

#### 26. Idioma, región, fecha y reloj

Toda combinación deberá conservar:

- español como idioma funcional aprobado;
- locale y formatos explícitos;
- zona horaria y fecha del hecho separadas de recepción;
- moneda, separadores, unidades y precisión;
- teclado y entrada de caracteres;
- reloj confiable o detección de drift;
- cambio de zona u horario sin reinterpretar hechos históricos;
- nombres de archivo y texto Unicode.

El formato visual del dispositivo no podrá alterar el valor canónico enviado o persistido.

---

#### 27. Archivos, medios y canales del sistema

Carga, descarga, compartir, imprimir, abrir y guardar deberán probarse por perfil. Se validarán:

- tipos y extensiones;
- tamaño y límites;
- selector de archivos o fotos;
- nombres y caracteres;
- permisos y ubicación;
- escaneo de seguridad;
- progreso, cancelación y reintento;
- apertura en aplicación externa;
- retorno y revalidación;
- limpieza y retención.

Portapapeles, share sheet o descarga no serán el único mecanismo para una acción empresarial crítica.

---

#### 28. Instalación, PWA y actualizaciones

Cuando se permita modo instalado o PWA se declarará:

- origen y canal de instalación;
- versión visible;
- política de actualización;
- compatibilidad entre cliente, esquema local y servidor;
- activación del service worker;
- recuperación de actualización interrumpida;
- rollback o bloqueo seguro;
- limpieza de versiones obsoletas;
- comportamiento con múltiples pestañas o instancias;
- aviso cuando sea obligatorio recargar o actualizar.

No se permitirá que una versión antigua continúe mutando contra contratos incompatibles.

---

#### 29. Manejo de combinación desconocida o no soportada

Antes de iniciar una capacidad crítica, la aplicación deberá poder determinar el estado y:

| Estado                      | Comportamiento mínimo                                         |
| --------------------------- | ------------------------------------------------------------- |
| `SUPPORTED`                 | permitir según autorización y contexto                        |
| `SUPPORTED_WITH_CONDITIONS` | comprobar y mostrar las condiciones aplicables                |
| `DEGRADED_SUPPORTED`        | activar la modalidad declarada y marcar sus límites           |
| `TEMPORARILY_BLOCKED`       | bloquear el paso, preservar trabajo y mostrar ruta de soporte |
| `UNSUPPORTED`               | impedir la capacidad incompatible sin simular error genérico  |
| `UNKNOWN_BLOCKED`           | recopilar diagnóstico mínimo y no ejecutar efecto crítico     |
| `RETIRED`                   | mostrar fecha, alternativa y procedimiento de transición      |

El mensaje deberá indicar qué falta, qué puede conservarse y cómo continuar.

---

#### 30. Observabilidad de compatibilidad

Sin exponer datos sensibles, se podrán observar:

- aplicación y release;
- perfil y estado de soporte;
- familia de OS y runtime;
- clase de viewport e input;
- capacidades disponibles y faltantes;
- permisos relevantes;
- almacenamiento, memoria y red por rangos;
- periférico y estado;
- errores de compatibilidad;
- actualización y retiro;
- resultado del smoke test.

La telemetría deberá limitar cardinalidad y no usar fingerprinting innecesario.

---

#### 31. Soporte y diagnóstico

Un paquete de diagnóstico de compatibilidad deberá incluir únicamente información necesaria y segura:

```text
diagnostic_id
application_release
device_profile
support_status
os_and_runtime_band
viewport_and_input_class
capability_results
permission_results
storage_and_network_state
peripheral_state
session_and_context_age
last_update_result
compatibility_error_codes
correlation_id
```

No incluirá tokens, PIN, payloads completos, documentos, datos de salud ni información personal innecesaria.

---

#### 32. Política de actualización y retiro

Toda combinación soportada tendrá:

- propietario;
- canal y método de actualización;
- inventario de dispositivos afectados;
- smoke test previo y posterior;
- ventana de adopción;
- fecha de fin de soporte;
- avisos y escalamiento;
- alternativa o reemplazo;
- criterio de bloqueo;
- rollback o contingencia;
- evidencia de retiro.

Una actualización automática del navegador o sistema se tratará como cambio potencial y no como hecho irrelevante.

---

#### 33. Matriz de los 69 procesos

`NFR-PROCESS-DEVICE-COMPATIBILITY-MATRIX-001` cubrirá exactamente `VPROC-0001` a `VPROC-0069` con:

- proceso, propietaria y pasos;
- actor, sede, área y estación;
- criticidad y modalidad;
- perfiles compatibles;
- capacidades y periféricos;
- viewport, orientación e input;
- runtime y sistema operativo;
- red, offline y recursos;
- accesibilidad y ergonomía;
- estado de soporte;
- fallback y contingencia;
- pruebas requeridas;
- último dispositivo real validado;
- brechas y tarea responsable.

Una sola declaración “responsive” por aplicación no reemplazará esta matriz.

---

#### 34. Laboratorio y conjunto representativo

`NFR-REAL-DEVICE-TEST-MATRIX-001` deberá incluir:

- un representante cercano al mínimo de cada perfil soportado;
- un representante ordinario de operación;
- dispositivos compartidos y personales cuando ambos se soporten;
- variantes relevantes de OS, runtime y WebView;
- pantalla pequeña, grande, orientación y densidad;
- teclado, táctil y asistencia cuando apliquen;
- cámara, escáner, impresión, pago y medición según proceso;
- red estable, degradada y reconexión;
- batería baja, almacenamiento limitado y presión de memoria;
- actualización, suspensión, reinicio y retorno de aplicación externa.

La matriz deberá identificar equipo real, configuración, fecha, release y evidencia sin convertir el número de serie en dato de exposición general.

---

#### 35. Niveles de prueba

La certificación combinará:

1. validación estática de la matriz;
2. pruebas unitarias de adaptación y capability gates;
3. pruebas responsive y de componentes;
4. contract tests de runtime y APIs;
5. emulación para cobertura rápida;
6. pruebas físicas por perfil;
7. pruebas de periféricos;
8. pruebas offline y de ciclo de vida;
9. pruebas de accesibilidad;
10. pruebas de seguridad y postura;
11. E2E del proceso completo;
12. piloto con trabajadores o clientes reales cuando corresponda.

Emulación podrá ampliar cobertura, no reemplazar el nivel físico aplicable.

---

#### 36. Severidad de incompatibilidades

| Clase       | Ejemplos                                                                                                           | Tratamiento                                             |
| ----------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------- |
| `COMPAT-P0` | acción crítica ejecutable parcialmente; autorización o actor incorrectos; corrupción; pago o movimiento duplicable | bloquea piloto o producción aplicable                   |
| `COMPAT-P1` | flujo principal imposible; cámara, impresión u offline críticos sin fallback; versión vulnerable                   | resolver antes de readiness o control temporal aprobado |
| `COMPAT-P2` | degradación material, rendimiento insuficiente o limitación de modalidad con alternativa viable                    | tarea, fecha y condición obligatorias                   |
| `COMPAT-P3` | defecto cosmético o mejora sin impacto en resultado, acceso o seguridad                                            | backlog priorizado                                      |

Todo defecto conservará combinación exacta, paso, evidencia, reproducibilidad y alcance.

---

#### 37. Excepciones

`NFR-COMPATIBILITY-EXCEPTION-REGISTER-001` exigirá:

- combinación y alcance exactos;
- motivo empresarial;
- riesgo y clasificación;
- control compensatorio;
- población y sedes;
- propietario;
- fecha de inicio y expiración;
- plan de corrección o retiro;
- validación de seguridad y accesibilidad;
- criterio de salida;
- autoridad de aceptación.

No se aprobarán excepciones indefinidas para versiones sin soporte, sesiones compartidas inseguras o fallos críticos de integridad.

---

#### 38. Responsabilidad documental

| Decisión o implementación             | Tarea propietaria                                                          |
| ------------------------------------- | -------------------------------------------------------------------------- |
| perfiles y matriz inicial             | `NFR-REQ-011`                                                              |
| estaciones, interacción y periféricos | `UX-STATION-002` a `UX-STATION-012`                                        |
| accesibilidad y ergonomía             | `NFR-REQ-007`; `UX-BASE-001` a `UX-BASE-015`                               |
| hardware, red y periféricos           | `NFR-REQ-008`; `TI-DOM-002` a `TI-DOM-005`                                 |
| observabilidad y soporte              | `NFR-REQ-009`; `TI-DOM-007` a `TI-DOM-010`                                 |
| recuperación y continuidad            | `NFR-REQ-010`; `CONT-DOM-001` a `CONT-DOM-015`                             |
| identidad de dispositivo compartido   | `AUTH-DEV-001` a `AUTH-DEV-016`                                            |
| pantallas y procesos                  | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `PROC-COVER-001` a `PROC-COVER-010` |
| implementación por aplicación         | paquetes E5 propietarios                                                   |
| releases, despliegues y rollback      | BLOQUE T                                                                   |
| certificación transversal y pilotos   | BLOQUE U; `UX-QA-001` a `UX-QA-030`                                        |

Un hallazgo no podrá quedar como “probar en otros dispositivos”; deberá vincularse a una tarea concreta o generar una nueva.

---

#### 39. Guardrails de cierre

No podrá certificarse una capacidad cuando exista:

- perfil requerido sin matriz;
- combinación crítica `UNKNOWN_BLOCKED`;
- runtime o sistema operativo sin soporte de seguridad;
- acción crítica que comienza antes de verificar capacidades;
- fallback que omite autorización, evidencia o efecto;
- layout que oculta controles, estado o errores;
- modalidad táctil no probada físicamente;
- sesión compartida sin actor efectivo y limpieza;
- cámara, escáner, impresión, pago o medición críticos sin prueba real;
- almacenamiento local sin comportamiento ante eviction o upgrade;
- actualización que deja contratos incompatibles;
- recursos mínimos no medidos sobre equipo representativo;
- combinación retirada aún activa;
- incompatibilidad `COMPAT-P0` o `COMPAT-P1` sin resolución válida;
- proceso crítico sin ruta soportada y contingencia.

---

#### 40. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PROC-541 a TREQ-PROC-580
```

Cobertura:

1. compatibilidad orientada a resultado;
2. unidad mínima de combinación;
3. estados de soporte;
4. catálogo de perfiles;
5. matriz por aplicación;
6. política de OS y runtime;
7. navegador, motor y WebView;
8. detección de capacidades;
9. required, optional y forbidden;
10. viewport, densidad y orientación;
11. zoom, fuente y áreas seguras;
12. modalidades de entrada;
13. tacto, guantes y ambiente;
14. teclado y tecnología de asistencia;
15. cámara y permisos;
16. escáner y captura;
17. impresión y periféricos;
18. pagos y medición;
19. almacenamiento local y quota;
20. eviction, upgrade y esquema local;
21. ciclo de vida y suspensión;
22. retorno desde aplicaciones externas;
23. red, TLS y contexto seguro;
24. identidad y estación compartida;
25. postura y versiones soportadas;
26. recursos y rendimiento mínimo;
27. locale, fecha, moneda y reloj;
28. archivos, medios y canales del sistema;
29. PWA, instalación y service worker;
30. cliente obsoleto y contratos incompatibles;
31. manejo de unsupported y unknown;
32. telemetría de compatibilidad;
33. diagnóstico seguro;
34. actualización y retiro;
35. matriz de los 69 procesos;
36. conjunto representativo real;
37. emulación frente a prueba física;
38. fallos y regresión por perfil;
39. excepciones y guardrails;
40. readiness, piloto y certificación.

La evidencia deberá indicar que proviene de `NFR-REQ-011` aprobada.

---

#### 41. Criterios de aceptación

- [ ] Compatibilidad significa completar el resultado empresarial con controles y evidencia.
- [ ] Lectura, escritura, pantalla, capacidad y proceso se evalúan por separado.
- [ ] Cada combinación tiene aplicación, release, paso, perfil, OS, runtime, input y capacidades.
- [ ] Se usan estados `SUPPORTED`, condicional, degradado, bloqueado, no soportado, desconocido y retirado.
- [ ] Existen perfiles iniciales para escritorio, tablet, móvil, kiosco, campo, host de periférico y fallback.
- [ ] La matriz declara explícitamente qué aplicaciones soportan cada perfil.
- [ ] Las versiones exactas se materializan en una política versionada por release.
- [ ] Versiones sin soporte no se consideran compatibles por defecto.
- [ ] Se distingue navegador, motor, WebView, PWA y modo instalado.
- [ ] Las capacidades críticas se detectan antes de iniciar efectos.
- [ ] User agent no es la única fuente de decisión.
- [ ] Viewport, zoom, fuente, orientación, densidad y teclado virtual se prueban.
- [ ] Las modalidades de entrada tienen equivalencia aprobada.
- [ ] Tacto, guantes, reflejo, postura y montaje se validan físicamente.
- [ ] Teclado y tecnología de asistencia se prueban cuando el perfil los requiere.
- [ ] Cámara, escáner, impresión, pago y medición tienen contratos de compatibilidad propios.
- [ ] Almacenamiento local cubre quota, eviction, reinicio, upgrade y sincronización.
- [ ] Suspensión y retorno revalidan sesión, contexto, estado y versión.
- [ ] Red y contexto seguro se validan contra dependencias reales.
- [ ] Dispositivo compartido identifica al actor y limpia datos entre usuarios.
- [ ] Postura y administración no reemplazan autorización por acción.
- [ ] Rendimiento se mide sobre un representante cercano al mínimo soportado.
- [ ] Locale, fecha, moneda, unidad y reloj no alteran valores canónicos.
- [ ] Archivos y canales del sistema conservan progreso, retorno y seguridad.
- [ ] PWA y actualizaciones impiden clientes incompatibles.
- [ ] Una combinación desconocida bloquea acciones críticas de forma comprensible.
- [ ] La telemetría evita fingerprinting y datos sensibles innecesarios.
- [ ] El diagnóstico permite reproducir sin exponer secretos.
- [ ] Toda combinación tiene ciclo de actualización y retiro.
- [ ] Los 69 procesos tendrán matriz individual antes de implementación.
- [ ] Emulación no sustituye pruebas físicas aplicables.
- [ ] `COMPAT-P0` y `COMPAT-P1` bloquean cierre sin tratamiento válido.
- [ ] Se incorporan `TREQ-PROC-541` a `TREQ-PROC-580` al registro completo.
- [ ] No se compran, actualizan, bloquean, retiran ni reconfiguran dispositivos.
- [ ] `NFR-REQ-012` permanece no iniciada.

---

#### 42. Estado y continuidad

```text
NFR-REQ-009   APROBADA
NFR-REQ-010   APROBADA
NFR-REQ-011   APROBADA
NFR-REQ-012   NO INICIADA
```

La aprobación explícita de esta tarea congela el contrato inicial de compatibilidad mínima por dispositivo. No certifica ningún modelo, sistema operativo, navegador, WebView, periférico o estación existente.


### ✅ NFR-REQ-012 — Aprobar requisitos no funcionales antes de E5

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] NFR-REQ-012 — Aprobar requisitos no funcionales antes de E5`

**Tarea anterior:** `PROC-COVER-010 — Registrar nuevas brechas y devolverlas al registro canónico de E1` — APROBADA

**Siguiente tarea reservada:** `NINGUNA — CIERRE DOCUMENTAL DEL BLOQUE E2`

**Artefactos lógicos contenidos en esta tarea:**

- `NFR-APPROVAL-GATE-CONTRACT-001`;
- `NFR-BASELINE-MANIFEST-001`;
- `NFR-PROCESS-FAMILY-COVERAGE-CHECK-001`;
- `NFR-E5-PACKAGE-OBLIGATION-MATRIX-001`;
- `NFR-LIFECYCLE-GATE-MATRIX-001`;
- `NFR-BLOCKING-SEVERITY-PRECEDENCE-001`;
- `NFR-EXCEPTION-CARRYOVER-CONTRACT-001`;
- `NFR-CERTIFICATION-BOUNDARY-001`;
- `NFR-E2-CLOSURE-MANIFEST-001`;

**Naturaleza:** puerta documental final de BLOQUE E2 que consolida y aprueba la línea base no funcional definida por `NFR-REQ-001` a `NFR-REQ-011`, comprueba su cobertura sobre los 69 procesos y establece las obligaciones que deberán materializar los paquetes E5. No certifica implementaciones, dispositivos, tiempos, infraestructura, recuperación, accesibilidad ni producción.

**Cambios en código, migraciones, Supabase, aplicaciones, infraestructura, hardware, red, proveedores, despliegues, pilotos, cutover o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Cerrar BLOQUE E2 con una línea base no funcional única y utilizable por arquitectura, servicios y planificación de implementación, evitando dos errores opuestos: iniciar E5 sin obligaciones no funcionales o interpretar una definición documental como evidencia de cumplimiento real.

```text
CONTRATOS NFR APROBADOS
        +
COBERTURA DE 69 PROCESOS
        +
TRAZABILIDAD HACIA PANTALLAS, ESTACIONES, DATOS Y DEPENDENCIAS
        =
BASELINE APROBADA PARA ARQUITECTURA Y PLANIFICACIÓN E5
        ≠
IMPLEMENTACIÓN CERTIFICADA, PILOTO AUTORIZADO O PRODUCCIÓN APROBADA
```

---

#### 2. Fuentes y línea base verificada

- `NFR-REQ-001` a `NFR-REQ-011` — APROBADAS;
- `VPROC-0001` a `VPROC-0069` — 69 procesos canónicos;
- 177 pantallas, 449 vínculos proceso-pantalla y contratos de aceptación aprobados;
- 820 brechas E1 abiertas y encaminadas, 22 referencias de control y 207 paquetes de brecha;
- 3.228 requisitos de prueba vigentes antes de esta tarea;
- 354 requisitos NFR históricos consecutivos, `TREQ-PROC-227` a `TREQ-PROC-580`;
- clasificación vigente: 39 `PARTIAL`, 23 `MANUAL`, 6 `ABSENT`, 1 `DEFERRED`, 0 `COMPLETE`.

```text
header_git_blob: 80d86733ac6d1b21158a7df9dc9b31548bae1e62
nfr_owner_git_blob: 42cfa7640335ef6cc0e0e49fcb144a4229565ac9
base_04A_git_blob: c00c9e9a0d6bb6558a6fbd1330a6360ec3d06e75
gap_register_git_blob: 5836d3f14dc8857258475210ef47b062c4e66963
```

---

#### 3. Distinciones obligatorias

| Concepto                | Significado permitido                                             | No significa                                      |
| ----------------------- | ----------------------------------------------------------------- | ------------------------------------------------- |
| `BASELINE_NFR_APPROVED` | contratos, perfiles, matrices y guardrails documentales aprobados | comportamiento implementado o probado             |
| `PASS_FOR_E5_PLANNING`  | arquitectura y paquetes pueden consumir la línea base             | autorización de implementar, pilotear o desplegar |
| perfil cualitativo      | envolvente inicial para diseñar medición y capacidad              | valor medido, SLO o certificación                 |
| contingencia definida   | modalidad y límites documentados                                  | contingencia practicada o sostenible              |
| perfil de dispositivo   | combinación y capacidades requeridas                              | modelo, versión o estación homologados            |
| requisito identificado  | obligación trazable en `04A`                                      | prueba implementada o verificada                  |
| excepción registrada    | desviación temporal gobernada                                     | renuncia permanente a la obligación               |

---

#### 4. NFR-BASELINE-MANIFEST-001

| Fuente        | Dimensión                             | Artefactos principales                                                                                                                                                                                                                                                                                          | Procesos | TREQ históricos                      | Estado de implementación |
| ------------- | ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------: | ------------------------------------ | ------------------------ |
| `NFR-REQ-001` | Criticidad y disponibilidad           | NFR-PROCESS-CRITICALITY-CONTRACT-001; NFR-PROCESS-AVAILABILITY-MATRIX-001                                                                                                                                                                                                                                       |       69 | `TREQ-PROC-227 a TREQ-PROC-246` (20) | `NOT_EVALUATED`          |
| `NFR-REQ-002` | Volumen, concurrencia y crecimiento   | NFR-WORKLOAD-CONTRACT-001; NFR-PROCESS-WORKLOAD-MATRIX-001; NFR-CAPACITY-EVIDENCE-REGISTER-001                                                                                                                                                                                                                  |       69 | `TREQ-PROC-247 a TREQ-PROC-270` (24) | `NOT_EVALUATED`          |
| `NFR-REQ-003` | Tiempos máximos de respuesta          | NFR-RESPONSE-TIME-CONTRACT-001; NFR-PROCESS-RESPONSE-MATRIX-001; NFR-TIMEOUT-AND-UNKNOWN-RESULT-POLICY-001                                                                                                                                                                                                      |       69 | `TREQ-PROC-271 a TREQ-PROC-294` (24) | `NOT_EVALUATED`          |
| `NFR-REQ-004` | Offline y sincronización              | NFR-OFFLINE-SYNC-CONTRACT-001; NFR-PROCESS-OFFLINE-MATRIX-001; NFR-LOCAL-OPERATION-ENVELOPE-001; NFR-SYNC-RECONCILIATION-POLICY-001                                                                                                                                                                             |       69 | `TREQ-PROC-295 a TREQ-PROC-324` (30) | `NOT_EVALUATED`          |
| `NFR-REQ-005` | Privacidad y sensibilidad             | NFR-PRIVACY-SENSITIVITY-CONTRACT-001; NFR-INFORMATION-HANDLING-MATRIX-001; NFR-PROCESS-PRIVACY-PROFILE-001; NFR-DATA-EXPOSURE-BOUNDARY-001                                                                                                                                                                      |       69 | `TREQ-PROC-325 a TREQ-PROC-354` (30) | `NOT_EVALUATED`          |
| `NFR-REQ-006` | Trazabilidad y retención              | NFR-TRACEABILITY-RETENTION-CONTRACT-001; NFR-AUDIT-EVENT-ENVELOPE-001; NFR-RETENTION-POLICY-MATRIX-001; NFR-DISPOSITION-CONTROL-001; NFR-PROCESS-TRACEABILITY-PROFILE-001                                                                                                                                       |       69 | `TREQ-PROC-355 a TREQ-PROC-389` (35) | `NOT_EVALUATED`          |
| `NFR-REQ-007` | Accesibilidad y ergonomía             | NFR-ACCESSIBILITY-ERGONOMICS-CONTRACT-001; NFR-INTERACTION-TARGET-PROFILE-001; NFR-PROCESS-ACCESSIBILITY-PROFILE-001; NFR-ACCESSIBILITY-TEST-MATRIX-001; NFR-ACCESSIBILITY-EXCEPTION-REGISTER-001                                                                                                               |       69 | `TREQ-PROC-390 a TREQ-PROC-424` (35) | `NOT_EVALUATED`          |
| `NFR-REQ-008` | Hardware, red y periféricos           | NFR-HARDWARE-NETWORK-PERIPHERAL-CONTRACT-001; NFR-STATION-CAPABILITY-PROFILE-001; NFR-NETWORK-SERVICE-PROFILE-001; NFR-PERIPHERAL-OPERATION-CONTRACT-001; NFR-PROCESS-TECHNICAL-DEPENDENCY-MATRIX-001; NFR-TECHNICAL-ACCEPTANCE-MATRIX-001; NFR-HARDWARE-EXCEPTION-REGISTER-001                                 |       69 | `TREQ-PROC-425 a TREQ-PROC-460` (36) | `NOT_EVALUATED`          |
| `NFR-REQ-009` | Observabilidad, soporte y alertas     | NFR-OBSERVABILITY-SUPPORT-ALERTING-CONTRACT-001; NFR-SERVICE-OBSERVABILITY-PROFILE-001; NFR-PROCESS-OBSERVABILITY-MATRIX-001; NFR-SLI-SLO-REFERENCE-MATRIX-001; NFR-ALERT-CATALOG-001; NFR-SUPPORT-OPERATING-MODEL-001; NFR-RUNBOOK-CATALOG-001; NFR-OBSERVABILITY-EXCEPTION-REGISTER-001                       |       69 | `TREQ-PROC-461 a TREQ-PROC-500` (40) | `NOT_EVALUATED`          |
| `NFR-REQ-010` | Respaldo, RTO y RPO                   | NFR-BACKUP-RECOVERY-CONTRACT-001; NFR-RECOVERY-OBJECT-INVENTORY-001; NFR-PROCESS-RECOVERY-PROFILE-001; NFR-RTO-RPO-MATRIX-001; NFR-BACKUP-POLICY-MATRIX-001; NFR-RESTORE-RUNBOOK-CATALOG-001; NFR-RECOVERY-EXERCISE-MATRIX-001; NFR-RECOVERY-EXCEPTION-REGISTER-001                                             |       69 | `TREQ-PROC-501 a TREQ-PROC-540` (40) | `NOT_EVALUATED`          |
| `NFR-REQ-011` | Compatibilidad mínima por dispositivo | NFR-DEVICE-COMPATIBILITY-CONTRACT-001; NFR-DEVICE-PROFILE-CATALOG-001; NFR-APPLICATION-DEVICE-SUPPORT-MATRIX-001; NFR-PROCESS-DEVICE-COMPATIBILITY-MATRIX-001; NFR-RUNTIME-SUPPORT-POLICY-001; NFR-CAPABILITY-DETECTION-CONTRACT-001; NFR-REAL-DEVICE-TEST-MATRIX-001; NFR-COMPATIBILITY-EXCEPTION-REGISTER-001 |       69 | `TREQ-PROC-541 a TREQ-PROC-580` (40) | `NOT_EVALUATED`          |

```text
11 FAMILIAS APROBADAS
× 69 PROCESOS
= 759 INTERSECCIONES PROCESO-FAMILIA REQUERIDAS

TREQ-PROC-227 A TREQ-PROC-580
= 354 REQUISITOS NFR HISTÓRICOS PRESERVADOS
```

---

#### 5. Resultado de la puerta

| Campo                            | Resultado                                   |
| -------------------------------- | ------------------------------------------- |
| `nfr_gate_status`                | `PASS_FOR_E5_PLANNING`                      |
| `baseline_status`                | `APPROVED_AND_FROZEN_FOR_DOWNSTREAM_DESIGN` |
| `implementation_conformance`     | `NOT_EVALUATED`                             |
| `pilot_authorization`            | `NOT_GRANTED_BY_THIS_TASK`                  |
| `cutover_authorization`          | `NOT_GRANTED_BY_THIS_TASK`                  |
| `production_authorization`       | `NOT_GRANTED_BY_THIS_TASK`                  |
| `new_unrouted_gaps`              | `0`                                         |
| `process_classification_changes` | `0`                                         |
| `E2_closure`                     | `DOCUMENTALLY_CLOSED`                       |

La puerta pasa porque las once dimensiones tienen contrato aprobado, cobertura declarada, requisitos de prueba y tareas posteriores. No pasa porque la infraestructura actual haya demostrado cumplimiento.

---

#### 6. Estados permitidos de evaluación posterior

| Estado                    | Uso                                                         |
| ------------------------- | ----------------------------------------------------------- |
| `DEFINED_QUALITATIVE`     | perfil documental suficiente para arquitectura inicial      |
| `MEASUREMENT_PLANNED`     | método, ambiente, responsable y fecha definidos             |
| `MEASURED`                | valor obtenido con contexto y evidencia reproducible        |
| `VERIFIED`                | valor y comportamiento aceptados por revisor independiente  |
| `UNKNOWN_BLOCKING`        | falta un dato o prueba crítica; bloquea la puerta aplicable |
| `NOT_APPLICABLE_APPROVED` | no aplica con justificación, propietario y revisión         |
| `EXCEPTION_ACTIVE`        | desviación temporal aprobada, controlada y no vencida       |

Un valor cualitativo puede habilitar diseño. No puede habilitar por sí solo piloto, cutover o producción.

---

#### 7. NFR-E5-PACKAGE-OBLIGATION-MATRIX-001

Todo paquete E5 deberá contener un manifiesto no funcional con, como mínimo:

```text
package_id
process_ids[]
process_versions[]
minimum_scope_refs[]
target_scope_refs[]
screen_ids[]
station_ids[]
application_and_repository_refs[]
data_and_integration_refs[]
nfr_profile_refs[11]
critical_stage_overrides[]
quantitative_targets[]
measurement_sources[]
supported_device_combinations[]
test_requirement_ids[]
gap_ids[]
evidence_plan[]
exceptions[]
rollback_and_recovery_plan
observability_and_support_plan
owner
independent_reviewer
gate_status
```

La ausencia de una dimensión se expresará como `NOT_APPLICABLE_APPROVED`; nunca mediante celda vacía, “pendiente” narrativo o eliminación del campo.

---

#### 8. NFR-LIFECYCLE-GATE-MATRIX-001

| Puerta                   | Evidencia mínima                                                             | Bloqueo obligatorio                                        | Resultado de esta tarea          |
| ------------------------ | ---------------------------------------------------------------------------- | ---------------------------------------------------------- | -------------------------------- |
| arquitectura E3/E4       | baseline cualitativa, dependencias y riesgos                                 | familia NFR ausente o propietario inexistente              | `AUTHORIZED_TO_CONSUME_BASELINE` |
| definición de paquete E5 | manifiesto completo, medición planificada, TREQ y brechas                    | `UNKNOWN_BLOCKING` sin ruta o dimensión omitida            | `AUTHORIZED_TO_PLAN`             |
| inicio de implementación | objetivos, pruebas, ambientes, responsables y excepciones                    | severidad crítica sin tratamiento                          | `NOT_AUTHORIZED_BY_THIS_TASK`    |
| piloto                   | evidencia integrada, personas y dispositivos reales, contingencia practicada | P0/P1, incompatibilidad crítica o privacidad insegura      | `NOT_AUTHORIZED_BY_THIS_TASK`    |
| cutover                  | paridad, rollback, recuperación, observabilidad y reconciliación             | retorno no probado o fuente competidora no gobernada       | `NOT_AUTHORIZED_BY_THIS_TASK`    |
| producción               | aceptación independiente, monitoreo post-release y soporte                   | defecto crítico, evidencia vencida o ausencia de respuesta | `NOT_AUTHORIZED_BY_THIS_TASK`    |

---

#### 9. Precedencia y conflictos entre dimensiones

1. Una prohibición de seguridad, privacidad, inocuidad, integridad, retención o recuperación prevalece sobre una mejora de velocidad o conveniencia.
2. Un override de etapa crítica prevalece sobre el perfil general del proceso.
3. `UNKNOWN_BLOCKING` prevalece sobre una estimación no demostrada.
4. El perfil soportado más restrictivo prevalece para la combinación real de dispositivo y runtime.
5. Una contingencia manual no puede reducir autorización, evidencia, accesibilidad o reconciliación.
6. Un proveedor externo no puede reducir la responsabilidad ni el criterio de aceptación interno.
7. Ningún promedio compensará un hard ceiling, un P0/P1, una pérdida de datos o un resultado empresarial desconocido.

---

#### 10. NFR-BLOCKING-SEVERITY-PRECEDENCE-001

| Clase normalizada | Fuentes equivalentes                                                                          | Tratamiento                                                     |
| ----------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `NFR-B0`          | `A11Y-P0`, `TECH-P0`, `OBS-GAP-P0`, `REC-GAP-P0`, `COMPAT-P0` y condición crítica equivalente | bloquea piloto, cutover o producción afectada                   |
| `NFR-B1`          | clases P1 y falla material sin alternativa segura                                             | resolver antes de readiness o aprobar control temporal estricto |
| `NFR-C2`          | clases P2 con alternativa viable                                                              | aceptación condicionada con dueño, vencimiento y monitoreo      |
| `NFR-P3`          | clases P3 sin efecto material                                                                 | backlog priorizado                                              |

La normalización no elimina la severidad original ni cambia su criterio específico; únicamente permite consolidar gates entre familias.

---

#### 11. NFR-EXCEPTION-CARRYOVER-CONTRACT-001

Toda excepción deberá conservar:

```text
exception_id
source_nfr_family
exact_scope
reason
risk_and_severity
compensating_control
affected_population_and_sites
owner
approver
starts_at
expires_at
closure_task
monitoring
exit_criterion
evidence_refs[]
```

No se permite excepción indefinida, heredada por costumbre, sustentada solo en “siempre se ha hecho así” ni aplicada a una versión, sede o combinación distinta de la aprobada.

---

#### 12. Tratamiento de modalidades especiales

| Modalidad               | Obligación                                                                                                                        |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| proceso manual          | aplicar autoridad, privacidad, evidencia, accesibilidad, continuidad, recuperación y aceptación mediante procedimiento controlado |
| proveedor externo       | conservar contrato, límites, observabilidad, reconciliación, contingencia, evidencia y salida                                     |
| infraestructura parcial | no declarar cumplimiento del proceso; medir únicamente la capacidad realmente demostrada                                          |
| proceso diferido        | mantener controles mínimos de inactividad y exigir puerta formal de reactivación                                                  |
| dispositivo compartido  | aislar actor, contexto, datos locales, colas, periféricos y cambio de área                                                        |
| operación offline       | mantener resultado local separado del autoritativo y revalidar antes de sincronizar                                               |

`VPROC-0065` continúa diferido. Esta puerta no autoriza su activación, captura de desempeño ni tratamiento de datos sensibles.

---

#### 13. NFR-CERTIFICATION-BOUNDARY-001

La evidencia de cumplimiento deberá identificar versión, ambiente, carga, dispositivo, datos, actor, escenario, resultado, defectos y aprobadores. Se rechazará:

- certificación basada únicamente en documento, captura, demo o build exitoso;
- prueba ejecutada en otra versión, sede, perfil, dataset o runtime no equivalente;
- implementador como único aprobador;
- promedio que oculta p95, p99, hard ceiling, backlog o fallo crítico;
- prueba emulada cuando la capacidad física o periférica exige dispositivo real;
- evidencia sin privacidad, retención, integridad o ubicación reproducible;
- aceptación heredada después de un cambio material;
- cierre de paquete con brecha crítica o excepción vencida.

---

#### 14. Brechas y realimentación

Esta tarea no crea brechas nuevas. Las 820 brechas del registro E1 continúan abiertas y encaminadas. Todo hallazgo nuevo durante E3, E4, E5, piloto, cutover o producción deberá incorporarse al registro canónico E1 en el mismo cambio documental, con propietario, momento, tarea, paquete y evidencia de cierre.

```text
PENDIENTE NARRATIVO = PROHIBIDO
HALLAZGO NUEVO = GAP E1 O VÍNCULO EXPLÍCITO EN EL MISMO CAMBIO
```

---

#### 15. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PROC-1511 a TREQ-PROC-1560
```

Protegen la integridad de la baseline, la cobertura de 759 intersecciones, la frontera de certificación, el manifiesto E5, los gates por ciclo de vida, las once dimensiones NFR, la precedencia, las excepciones, los procesos manuales y externos, la realimentación de brechas y la actualización segura del `04A`.

---

#### 16. Validaciones documentales obligatorias

- exactamente 11 tareas NFR fuente aprobadas;
- exactamente 69 procesos por familia;
- exactamente 759 intersecciones proceso-familia requeridas;
- exactamente 354 TREQ NFR históricos entre `227` y `580`;
- exactamente 50 TREQ nuevos entre `1511` y `1560`;
- 3.228 filas históricas preservadas;
- 3.278 filas finales con catorce columnas;
- cero IDs duplicados;
- cero relaciones no resolubles;
- cero autorreferencias;
- cero gaps nuevos sin ruta;
- cero cambios de clasificación de procesos;
- UTF-8, LF, newline final y ausencia de espacios finales.

---

#### 17. Criterios de aceptación

- [ ] Los once contratos NFR aprobados aparecen en el manifiesto con artefactos y rangos TREQ.
- [ ] Los 69 procesos quedan cubiertos por las once familias sin omisiones.
- [ ] La puerta distingue baseline aprobada, planificación E5, implementación, piloto, cutover y producción.
- [ ] El resultado de esta tarea no certifica ninguna implementación o dispositivo.
- [ ] El manifiesto obligatorio de paquete E5 contiene alcance, perfiles, valores, pruebas, brechas, evidencia, excepciones, recuperación y responsables.
- [ ] Las bandas cualitativas no se presentan como mediciones reales.
- [ ] Los valores críticos desconocidos bloquean la puerta aplicable.
- [ ] La precedencia impide degradar seguridad, privacidad, integridad, evidencia o continuidad para cumplir rendimiento o conveniencia.
- [ ] Las excepciones tienen propietario, control, vencimiento, tarea y criterio de salida.
- [ ] Los procesos manuales, externos, offline y compartidos conservan requisitos equivalentes.
- [ ] VPROC-0065 permanece diferido e inactivo.
- [ ] No se crean brechas nuevas y toda futura brecha tiene ruta de retorno a E1.
- [ ] Se incorporan TREQ-PROC-1511 a TREQ-PROC-1560 al 04A completo.
- [ ] No se modifica código, Supabase, infraestructura, hardware, proveedores ni producción.
- [ ] BLOQUE E2 queda cerrado documentalmente y no existe siguiente tarea interna reservada.

---

#### 18. NFR-E2-CLOSURE-MANIFEST-001

```text
NFR-REQ-001 A NFR-REQ-011 = APROBADAS
NFR-REQ-012 = APROBADA
NFR_GATE_STATUS = PASS_FOR_E5_PLANNING
IMPLEMENTATION_CONFORMANCE = NOT_EVALUATED
PILOT_AUTHORIZATION = NOT_GRANTED
CUTOVER_AUTHORIZATION = NOT_GRANTED
PRODUCTION_AUTHORIZATION = NOT_GRANTED
BLOQUE E2 = CERRADO DOCUMENTALMENTE
SIGUIENTE TAREA INTERNA = NINGUNA
```

La continuidad posterior deberá seguir el orden canónico de arquitectura, servicios, paquetes, pruebas, readiness y certificación. Esta tarea no adelanta ninguna de esas ejecuciones.
