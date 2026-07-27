REQUISITOS NO FUNCIONALES

### ✅ NFR-REQ-001 — Definir criticidad y disponibilidad por proceso

- **Estado:** APROBADA
- **Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal
- **Tarea anterior:** `UX-BASE-015 — Validar terminología con trabajadores reales` — APROBADA
- **Siguiente tarea reservada:** `NFR-REQ-002 — Definir volumen, concurrencia y crecimiento esperado` — NO INICIADA
- **Artefactos producidos:** `NFR-PROCESS-CRITICALITY-CONTRACT-001`; `NFR-PROCESS-AVAILABILITY-MATRIX-001`
- **Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`
- **Naturaleza:** clasificación no funcional de impacto y disponibilidad empresarial; no diseño de infraestructura ni implementación
**Cambios en código, migraciones, Supabase, aplicaciones, hardware o despliegues:** no autorizados

---

#### 1. Propósito

Definir una clasificación canónica, comparable y verificable de la criticidad y la disponibilidad requerida por cada proceso empresarial de Vento OS, de manera que la arquitectura, las contingencias, el soporte, las pruebas, los paquetes de implementación y la recuperación posterior se prioricen según impacto real y no según jerarquía, preferencia o nombre de la aplicación.

```text
CRITICIDAD DEL PROCESO
≠ PRIORIDAD DE UN TICKET
≠ IMPORTANCIA DEL ÁREA
≠ CANTIDAD DE USUARIOS
≠ UPTIME GLOBAL DE UNA APLICACIÓN
```

La disponibilidad se evaluará como capacidad de producir el resultado empresarial mínimo autorizado dentro de su ventana necesaria, incluso cuando el modo aprobado sea degradado o manual. Una pantalla abierta o un servidor respondiendo no demostrarán por sí solos que el proceso está disponible.

---

#### 2. Por qué esta tarea sigue a UX-BASE

Los principios UX ya fijaron qué debe entender, ver y poder hacer una persona en operación normal, degradada, excepcional, offline o reanudada. Antes de diseñar estaciones, pantallas definitivas, infraestructura o paquetes físicos, debe saberse qué procesos no pueden detenerse, en qué ventanas deben estar disponibles y qué resultado mínimo debe conservarse.

```text
PROCESO Y ACTORES APROBADOS
→ PRINCIPIOS DE EXPERIENCIA APROBADOS
→ CRITICIDAD Y DISPONIBILIDAD
→ VOLUMEN, CONCURRENCIA Y RESPUESTA
→ OFFLINE, HARDWARE, OBSERVABILIDAD Y RECUPERACIÓN
→ ESTACIONES Y PANTALLAS
```

---

#### 3. Distinciones canónicas

| Concepto                 | Definición                                                                                          |
| ------------------------ | --------------------------------------------------------------------------------------------------- |
| criticidad               | severidad del impacto empresarial si el proceso no puede producir su resultado mínimo               |
| disponibilidad requerida | ventana y condiciones en las que el resultado mínimo debe poder producirse                          |
| disponibilidad técnica   | estado de componentes, servicios, red y dependencias; no equivale al resultado empresarial          |
| degradación segura       | modo limitado que conserva controles, atribución, evidencia y posterior conciliación                |
| contingencia manual      | procedimiento aprobado que sustituye temporalmente una capacidad digital concreta                   |
| interrupción             | periodo en que el proceso no alcanza su resultado mínimo, aunque algunos componentes respondan      |
| prioridad de incidente   | orden de atención de un evento concreto; se deriva de impacto y urgencia actuales                   |
| recuperación             | restauración y conciliación después de una interrupción; se define con mayor detalle en continuidad |

---

#### 4. Unidad de clasificación

La unidad primaria será el `process_id` estable. No se clasificará una aplicación completa con un único nivel porque una misma aplicación contiene procesos, etapas y superficies con impactos distintos.

Cada perfil conservará como mínimo:

```text
process_id
process_version
functional_owner
organizational_scope
criticality_class
availability_window_class
critical_stage_overrides[]
minimum_business_outcome
approved_degradation_mode
impact_dimensions[]
upstream_dependencies[]
downstream_dependents[]
external_dependency_modifiers[]
evidence_refs[]
classification_status
review_triggers[]
```

La clasificación base utiliza el mayor impacto razonable dentro del alcance ordinario aprobado. Las diferencias por sede, área, canal o turno se expresarán como perfiles derivados y nunca como una reducción silenciosa del perfil canónico.

---

#### 5. Dimensiones de impacto

Cada proceso se evaluará, como mínimo, frente a:

1. vida, seguridad, salud e inocuidad;
2. acceso, fraude, privacidad y seguridad de información;
3. obligación legal, fiscal, laboral o contractual;
4. continuidad de servicio al cliente e ingresos;
5. producción, logística, abastecimiento y capacidad;
6. inventario, activos, frío, custodia y trazabilidad;
7. dinero, pagos, cartera, costos y conciliación;
8. integridad de datos, evidencia y auditabilidad;
9. propagación hacia otros procesos;
10. dificultad de reconstruir o compensar el hecho;
11. disponibilidad de una contingencia segura;
12. duración y momento de la interrupción.

No se promediarán dimensiones para ocultar un impacto grave. Una dimensión de seguridad, inocuidad, acceso o integridad que alcance umbral crítico elevará el proceso o la etapa correspondiente aunque las demás sean bajas.

---

#### 6. Clases de criticidad

| Clase | Nombre                                                | Regla                                                                                                                                                                                                                                       |
| ----- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `C0`  | Crítica de seguridad, inocuidad, acceso o continuidad | La indisponibilidad puede causar daño, pérdida de control de acceso, incumplimiento grave, producto inseguro o incapacidad de responder a una emergencia. Requiere contención inmediata y operación mínima independiente del canal digital. |
| `C1`  | Crítica para la misión operativa                      | La indisponibilidad detiene o compromete materialmente una operación activa, una custodia, una venta, una producción, una entrega o una obligación dentro de su ventana.                                                                    |
| `C2`  | Crítica para el negocio y sus compromisos             | La indisponibilidad no detiene de inmediato toda la operación, pero incumple compromisos, crea acumulación riesgosa o afecta resultados dentro del mismo ciclo empresarial.                                                                 |
| `C3`  | Importante y recuperable                              | La interrupción es recuperable mediante backlog o reprogramación y no crea daño inmediato si permanece dentro del SLA aprobado.                                                                                                             |
| `C4`  | Planificable o diferible con control                  | La actividad puede diferirse deliberadamente y reprogramarse sin afectar el resultado operativo inmediato, conservando propietario y fecha.                                                                                                 |

La clase no autoriza una solución técnica ni define por sí sola un porcentaje de uptime.

---

#### 7. Clases de ventana de disponibilidad

| Clase | Nombre                                              | Aplicación                                                                                                                                            |
| ----- | --------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `A0`  | Preparada para eventos en cualquier momento         | Debe poder activarse ante el evento en cualquier momento aplicable. El canal digital puede degradarse, pero debe existir respuesta y registro mínimo. |
| `A1`  | Continua durante la ventana operativa aplicable     | Debe producir el resultado mínimo durante los horarios, turnos o recorridos en que la operación está activa.                                          |
| `A2`  | Obligatoria en cortes, hitos o ciclos definidos     | Debe estar disponible en cortes, publicaciones, cierres, vencimientos o hitos predefinidos, con preparación previa y ventana de recuperación.         |
| `A3`  | Disponible en horario administrativo o SLA acordado | Debe atenderse dentro de horario administrativo o SLA explícito; permite acumulación controlada y priorizada.                                         |
| `A4`  | Disponible bajo programación o demanda planificada  | Puede activarse mediante programación formal y no exige disponibilidad permanente.                                                                    |

Las ventanas reales deberán declarar zona horaria, sede, calendario, turnos, temporada, picos, días de cierre y dependencias externas. No se asumirá `24×7` por defecto.

---

#### 8. Estados de disponibilidad empresarial

```text
AVAILABLE
DEGRADED_SAFE
UNAVAILABLE
UNKNOWN
RECOVERING
RECONCILIATION_REQUIRED
```

- `AVAILABLE`: produce el resultado ordinario con controles completos;
- `DEGRADED_SAFE`: produce el resultado mínimo autorizado con límites y evidencia;
- `UNAVAILABLE`: no puede producir el resultado mínimo;
- `UNKNOWN`: no puede demostrarse si el resultado ocurrió o si los controles siguen vigentes;
- `RECOVERING`: se restauran dependencias y se comprueba el resultado;
- `RECONCILIATION_REQUIRED`: el trabajo físico o local existe, pero todavía no se incorporó de forma autoritativa.

```text
DEGRADED_SAFE
≠ DISPONIBILIDAD PLENA
≠ AUTORIZACIÓN PARA OMITIR CONTROLES
```

---

#### 9. Modos de degradación iniciales

| Modo                         | Uso permitido                                                                                    |
| ---------------------------- | ------------------------------------------------------------------------------------------------ |
| `READ_ONLY_REFERENCE`        | consultar una versión vigente y verificable mientras las mutaciones permanecen bloqueadas        |
| `CONTROLLED_DEGRADED`        | ejecutar un subconjunto explícito con límites, atribución, idempotencia y posterior conciliación |
| `MANUAL_CONTINGENCY_ALLOWED` | aplicar un procedimiento físico aprobado, numerado, custodiado y reconciliable                   |
| `PAUSE_SAFELY`               | detener y conservar el caso sin perder contexto, vencimientos ni propietario                     |
| `NO_SAFE_DEGRADATION`        | bloquear el resultado hasta recuperar el control requerido                                       |

La modalidad final de cada capacidad se especificará en `NFR-REQ-004`, `UX-STATION-007`, `CONT-DOM-*`, `QUEUE-ARC-*` y los paquetes E5.

---

#### 10. Etapas críticas dentro de un proceso

Un proceso puede tener etapas con criticidad superior a su clase base. El perfil deberá registrar `critical_stage_overrides[]` sin partir artificialmente el proceso.

Ejemplos obligatorios:

- un reclamo ordinario puede ser `C2`, pero una denuncia de alérgeno o intoxicación escala a `C0`;
- mantenimiento ordinario puede ser `C1`, pero una falla de frío, gas, electricidad o seguridad física activa una etapa `C0`;
- administración de recetas puede operar en `A3`, pero la consulta de la receta aprobada durante producción requiere `A1`;
- fidelización puede degradarse, pero una redención ya aceptada no puede quedar con resultado desconocido;
- pago a proveedor puede ser `A2`, mientras una revocación de acceso o incidente de seguridad requiere `A0`.

---

#### 11. Dependencias y propagación

La criticidad no se heredará de forma automática por toda la cadena, pero deberá analizarse la propagación temporal:

```text
DEPENDENCIA INDISPONIBLE
→ RESULTADO MÍNIMO DEL PROCESO AFECTADO
→ PROCESOS DEPENDIENTES BLOQUEADOS O DEGRADADOS
```

Cada perfil identificará dependencias de personas, energía, red, frío, vehículos, proveedores, POS, bancos, sistemas fiscales, impresoras, escáneres, almacenamiento, Auth, datos maestros y aplicaciones propietarias.

Una dependencia externa no reduce la responsabilidad interna. Deberán existir estado visible, contingencia, reconciliación, evidencia del proveedor y criterio de retorno.

---

#### 12. Disponibilidad por sede, área y dispositivo

La clase canónica representa el máximo impacto ordinario del proceso. Un perfil local podrá precisar ventanas y contingencias, pero no disminuir la criticidad sin evidencia y aprobación del propietario funcional.

Para estaciones compartidas y multiárea:

- cada área conserva su proceso, cola, actor y contexto;
- la caída de un equipo no implica necesariamente caída del proceso si existe otra estación aprobada;
- una segunda estación no cuenta como redundancia hasta probar red, energía, identidad, periféricos y capacidad;
- una contingencia común no debe crear un punto único de falla oculto;
- el cambio de área no transfiere disponibilidad, permiso, borrador ni custodia.

---

#### 13. Mantenimiento y medición

La medición futura distinguirá:

```text
VENTANA REQUERIDA
TIEMPO DISPONIBLE
TIEMPO DEGRADADO SEGURO
TIEMPO NO DISPONIBLE
TIEMPO DESCONOCIDO
MANTENIMIENTO APROBADO FUERA DE VENTANA
DEPENDENCIA EXTERNA
```

El mantenimiento solo podrá excluirse del denominador cuando esté planificado, comunicado, autorizado y ocurra fuera de la ventana requerida o exista una alternativa equivalente probada. Una caída del proveedor seguirá registrándose como afectación del proceso aunque se reporte separadamente.

No se fijan todavía porcentajes uniformes. Los SLO cuantitativos dependen de `NFR-REQ-002`, `NFR-REQ-003`, `NFR-REQ-008`, `NFR-REQ-009`, `NFR-REQ-010` y del BIA de `CONT-DOM-002` a `CONT-DOM-004`.

---

#### 14. Gobierno de la clasificación

La clasificación requerirá:

- propuesta del propietario funcional del proceso;
- revisión de operación, seguridad, datos y tecnología según impacto;
- evidencia de horarios, incidentes, dependencias y contingencias;
- aprobación documental;
- fecha y versión;
- revalidación ante cambios materiales.

No podrá disminuirse una clase para reducir costos, simplificar un SLA o evitar controles. Tampoco se elevará todo a `C0` o `C1`, porque eso elimina capacidad real de priorización.

Disparadores de revisión: nueva sede o canal, cambio de horario, nuevo proveedor, cambio regulatorio, incidente, crecimiento, nueva integración, cambio de fuente de verdad, nueva contingencia o modificación del proceso.

---

#### 15. Matriz inicial de criticidad y disponibilidad

La matriz siguiente es la clasificación canónica inicial para diseño. Su estado es `BASELINE_APPROVED_WHEN_TASK_APPROVED`; los objetivos cuantitativos y perfiles locales se completarán en tareas posteriores sin reabrir la identidad del proceso.

| Proceso                                                                                                                                                                   | Familia                                                         | Criticidad | Ventana | Degradación inicial          | Justificación                                                                                                      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ---------- | ------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0001` — Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                            | Gobierno y estructura                                           | `C2`       | `A3`    | `CONTROLLED_DEGRADED`        | Decisiones ordinarias toleran espera breve; decisiones urgentes escalan a un caso crítico.                         |
| `VPROC-0002` — Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                          | Gobierno y estructura                                           | `C3`       | `A3`    | `READ_ONLY_REFERENCE`        | La estructura cambia poco, pero su versión vigente debe poder consultarse para resolver alcance y responsabilidad. |
| `VPROC-0003` — Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                      | Gobierno y estructura                                           | `C2`       | `A1`    | `READ_ONLY_REFERENCE`        | Políticas y delegaciones vigentes deben estar disponibles durante la operación; su edición puede esperar.          |
| `VPROC-0004` — Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                            | Gobierno y estructura                                           | `C2`       | `A1`    | `CONTROLLED_DEGRADED`        | Los compromisos y handoffs sostienen continuidad entre áreas y no deben perder propietario ni plazo.               |
| `VPROC-0005` — Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                         | Personas y trabajo                                              | `C4`       | `A3`    | `PAUSE_SAFELY`               | La selección puede pausarse dentro de plazos gobernados sin detener la operación actual.                           |
| `VPROC-0006` — Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                         | Personas y trabajo                                              | `C3`       | `A3`    | `CONTROLLED_DEGRADED`        | La vinculación debe cumplir fechas de ingreso; una caída breve no afecta la operación ya activa.                   |
| `VPROC-0007` — Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                            | Personas y trabajo                                              | `C2`       | `A2`    | `CONTROLLED_DEGRADED`        | La programación es crítica antes de publicación, cambios de turno y coberturas.                                    |
| `VPROC-0008` — Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                     | Personas y trabajo                                              | `C2`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | La asistencia debe capturarse en cada entrada y salida; admite contingencia atribuible y conciliable.              |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                       | Personas y trabajo                                              | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Ausencias y reemplazos pueden dejar áreas sin cobertura dentro del mismo turno.                                    |
| `VPROC-0010` — Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                             | Personas y trabajo                                              | `C2`       | `A2`    | `PAUSE_SAFELY`               | El paquete laboral es crítico en cortes de nómina y beneficios, no de forma continua.                              |
| `VPROC-0011` — Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                            | Personas y trabajo                                              | `C1`       | `A0`    | `CONTROLLED_DEGRADED`        | La revocación de accesos y devolución de activos no puede esperar cuando termina o cambia un vínculo.              |
| `VPROC-0012` — Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                              | Seguridad, higiene y cumplimiento                               | `C2`       | `A2`    | `MANUAL_CONTINGENCY_ALLOWED` | Inspecciones y acciones preventivas siguen una programación, con escalamiento inmediato ante hallazgos graves.     |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                              | Seguridad, higiene y cumplimiento                               | `C0`       | `A0`    | `MANUAL_CONTINGENCY_ALLOWED` | Incidentes y emergencias requieren respuesta inmediata aun sin sistemas digitales.                                 |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                | Seguridad, higiene y cumplimiento                               | `C0`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Higiene e inocuidad son condiciones para operar y no pueden omitirse por indisponibilidad tecnológica.             |
| `VPROC-0015` — Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                           | Productos, recetas y conocimiento                               | `C2`       | `A1`    | `READ_ONLY_REFERENCE`        | La operación necesita productos, unidades y presentaciones vigentes; la administración puede diferirse.            |
| `VPROC-0016` — Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                 | Productos, recetas y conocimiento                               | `C1`       | `A1`    | `READ_ONLY_REFERENCE`        | Producción requiere la receta aprobada y su versión durante toda ejecución.                                        |
| `VPROC-0017` — Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                    | Productos, recetas y conocimiento                               | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Ventas y producción dependen de oferta y disponibilidad coherentes durante la operación.                           |
| `VPROC-0018` — Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                    | Productos, recetas y conocimiento                               | `C0`       | `A1`    | `READ_ONLY_REFERENCE`        | Alérgenos, restricciones y calidad protegen salud e inocuidad en cada decisión de producto.                        |
| `VPROC-0019` — Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                           | Compras y proveedores                                           | `C2`       | `A2`    | `CONTROLLED_DEGRADED`        | Las necesidades deben capturarse antes de cortes para evitar quiebres, pero admiten cola controlada.               |
| `VPROC-0020` — Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                   | Compras y proveedores                                           | `C3`       | `A3`    | `PAUSE_SAFELY`               | La evaluación comparativa puede pausarse sin autorizar compras incompletas.                                        |
| `VPROC-0021` — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                   | Compras y proveedores                                           | `C2`       | `A2`    | `CONTROLLED_DEGRADED`        | La aprobación debe estar disponible en ventanas de compra, urgencias y reposición.                                 |
| `VPROC-0022` — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                         | Compras y proveedores                                           | `C1`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | La recepción física ocurre en una ventana concreta y debe conservar evidencia y diferencias.                       |
| `VPROC-0023` — Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                     | Inventario y almacenamiento                                     | `C1`       | `A1`    | `READ_ONLY_REFERENCE`        | Ubicaciones y condiciones de almacenamiento deben conocerse mientras se mueve o consulta inventario.               |
| `VPROC-0024` — Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                            | Inventario y almacenamiento                                     | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Ingresos y reubicaciones afectan existencia y custodia en tiempo operativo.                                        |
| `VPROC-0025` — Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                 | Inventario y almacenamiento                                     | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Retiros, consumos y traslados sostienen producción y servicio y no deben duplicarse.                               |
| `VPROC-0026` — Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                       | Inventario y almacenamiento                                     | `C2`       | `A2`    | `MANUAL_CONTINGENCY_ALLOWED` | Conteos pueden programarse; observaciones físicas requieren conservación y conciliación.                           |
| `VPROC-0027` — Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                           | Inventario y almacenamiento                                     | `C0`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Frío, vencimiento, cuarentena y disposición protegen inocuidad y patrimonio.                                       |
| `VPROC-0028` — Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                             | Inventario y almacenamiento                                     | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | El abastecimiento interno conecta solicitud, preparación, transporte y recepción durante la jornada.               |
| `VPROC-0029` — Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                              | Activos, vehículos, reutilizables y contenedores                | `C2`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Custodia y transferencia de activos deben mantenerse durante entregas y devoluciones.                              |
| `VPROC-0030` — Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                           | Activos, vehículos, reutilizables y contenedores                | `C1`       | `A0`    | `CONTROLLED_DEGRADED`        | Fallas de activos críticos pueden detener seguridad, producción, frío, ventas o logística.                         |
| `VPROC-0031` — Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                              | Activos, vehículos, reutilizables y contenedores                | `C1`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Vehículos sostienen rutas y entregas y requieren control durante su ventana de uso.                                |
| `VPROC-0032` — Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                | Activos, vehículos, reutilizables y contenedores                | `C2`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Reutilizables y contenedores afectan completitud y custodia, con contingencia física posible.                      |
| `VPROC-0033` — Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                       | Producción                                                      | `C1`       | `A2`    | `CONTROLLED_DEGRADED`        | La planificación debe estar disponible antes y durante ajustes de producción.                                      |
| `VPROC-0034` — Preparar materiales y ejecutar producción contra una versión aprobada                                                                                      | Producción                                                      | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | La ejecución productiva no puede perder receta, lote, cantidades, actor ni controles.                              |
| `VPROC-0035` — Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                             | Producción                                                      | `C0`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | La liberación o retención protege inocuidad y evita producto no conforme.                                          |
| `VPROC-0036` — Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                              | Producción                                                      | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Empaque, etiqueta y almacenamiento preservan trazabilidad y disponibilidad del producto terminado.                 |
| `VPROC-0037` — Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                               | Producción                                                      | `C2`       | `A1`    | `CONTROLLED_DEGRADED`        | Reproceso, merma y cierre deben registrarse durante el lote o en conciliación controlada.                          |
| `VPROC-0038` — Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                      | Pedidos, ventas, pagos y caja                                   | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | El servicio en mesa depende de pedido, preparación, entrega, pago y cierre durante atención.                       |
| `VPROC-0039` — Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                             | Pedidos, ventas, pagos y caja                                   | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | La venta de mostrador requiere continuidad durante el horario de servicio.                                         |
| `VPROC-0040` — Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                               | Pedidos, ventas, pagos y caja                                   | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Pedidos externos deben entrar y reconciliarse sin duplicados durante la operación.                                 |
| `VPROC-0041` — Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                     | Pedidos, ventas, pagos y caja                                   | `C2`       | `A2`    | `CONTROLLED_DEGRADED`        | B2B y catering tienen ventanas contractuales y productivas; no requieren disponibilidad continua universal.        |
| `VPROC-0042` — Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                         | Pedidos, ventas, pagos y caja                                   | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Cambios, anulaciones y devoluciones deben responder mientras el pedido o pago sigue activo.                        |
| `VPROC-0043` — Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                               | Pedidos, ventas, pagos y caja                                   | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Cobro y soporte fiscal sostienen la venta y deben impedir resultados ambiguos o duplicados.                        |
| `VPROC-0044` — Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                | Pedidos, ventas, pagos y caja                                   | `C1`       | `A2`    | `MANUAL_CONTINGENCY_ALLOWED` | El cierre de caja es crítico en cortes y cambios de responsable.                                                   |
| `VPROC-0045` — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                | Clientes, fidelización, reclamos y reservas                     | `C3`       | `A1`    | `CONTROLLED_DEGRADED`        | La venta puede continuar sin fidelización, pero saldo y redenciones no pueden inventarse ni duplicarse.            |
| `VPROC-0046` — Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                         | Clientes, fidelización, reclamos y reservas                     | `C2`       | `A3`    | `CONTROLLED_DEGRADED`        | Reclamos deben atenderse en plazo; alertas de inocuidad o seguridad elevan a C0.                                   |
| `VPROC-0047` — Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                     | Clientes, fidelización, reclamos y reservas                     | `C2`       | `A2`    | `CONTROLLED_DEGRADED`        | Reservas y eventos dependen de ventanas, capacidad y comunicación previa.                                          |
| `VPROC-0048` — Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                | Transporte y entregas                                           | `C1`       | `A2`    | `MANUAL_CONTINGENCY_ALLOWED` | La ruta debe estar definida antes de cargar y despachar.                                                           |
| `VPROC-0049` — Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                        | Transporte y entregas                                           | `C1`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | La ejecución de ruta y entrega requiere continuidad durante el recorrido y reconciliación posterior.               |
| `VPROC-0050` — Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                 | Transporte y entregas                                           | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | La entrega de terceros necesita seguimiento y conciliación en su ventana de servicio.                              |
| `VPROC-0051` — Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                            | Finanzas y obligaciones                                         | `C1`       | `A1`    | `CONTROLLED_DEGRADED`        | Los hechos económicos deben recibirse sin duplicados para no separar operación y finanzas.                         |
| `VPROC-0052` — Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                              | Finanzas y obligaciones                                         | `C2`       | `A2`    | `CONTROLLED_DEGRADED`        | Pagos a proveedores dependen de vencimientos, autorizaciones y conciliación bancaria.                              |
| `VPROC-0053` — Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                 | Finanzas y obligaciones                                         | `C2`       | `A3`    | `CONTROLLED_DEGRADED`        | Cartera y recaudo toleran espera breve, pero los pagos recibidos deben quedar protegidos.                          |
| `VPROC-0054` — Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas                                                                  | Finanzas y obligaciones                                         | `C3`       | `A2`    | `PAUSE_SAFELY`               | Costos, cierres y rentabilidad son críticos en sus ciclos, no durante cada operación física.                       |
| `VPROC-0055` — Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                    | Instalaciones, marketing, tecnología, información y continuidad | `C1`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Limpieza, plagas, servicios y mantenimiento pueden condicionar apertura y continuidad de la sede.                  |
| `VPROC-0056` — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                  | Instalaciones, marketing, tecnología, información y continuidad | `C3`       | `A3`    | `PAUSE_SAFELY`               | Contenido y promociones pueden pausarse o retirarse sin detener la operación principal.                            |
| `VPROC-0057` — Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                    | Instalaciones, marketing, tecnología, información y continuidad | `C3`       | `A1`    | `CONTROLLED_DEGRADED`        | Oportunidades digitales admiten cola y respuesta posterior dentro de SLA comercial.                                |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                      | Instalaciones, marketing, tecnología, información y continuidad | `C1`       | `A0`    | `CONTROLLED_DEGRADED`        | Soporte tecnológico debe responder a incidentes que pueden detener procesos críticos.                              |
| `VPROC-0059` — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                   | Instalaciones, marketing, tecnología, información y continuidad | `C0`       | `A0`    | `CONTROLLED_DEGRADED`        | Altas, cambios y revocaciones de acceso protegen seguridad y atribución.                                           |
| `VPROC-0060` — Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                 | Instalaciones, marketing, tecnología, información y continuidad | `C2`       | `A1`    | `CONTROLLED_DEGRADED`        | Documentos y evidencia deben poder consultarse o capturarse según el proceso que soportan.                         |
| `VPROC-0061` — Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                               | Instalaciones, marketing, tecnología, información y continuidad | `C4`       | `A3`    | `PAUSE_SAFELY`               | Medición y mejora pueden ejecutarse por ciclos sin afectar el resultado operativo inmediato.                       |
| `VPROC-0062` — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                   | Instalaciones, marketing, tecnología, información y continuidad | `C0`       | `A0`    | `MANUAL_CONTINGENCY_ALLOWED` | Continuidad coordina operación mínima, recuperación y reconciliación ante eventos graves.                          |
| `VPROC-0063` — Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento              | Capacidades sin precursor AS-IS explícito                       | `C2`       | `A3`    | `CONTROLLED_DEGRADED`        | El registro de riesgos requiere vigencia y seguimiento; riesgos materializados escalan al proceso afectado.        |
| `VPROC-0064` — Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado                   | Capacidades sin precursor AS-IS explícito                       | `C2`       | `A2`    | `CONTROLLED_DEGRADED`        | Requerimientos de autoridades y asesores dependen de plazos y evidencia formal.                                    |
| `VPROC-0065` — Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada                              | Capacidades sin precursor AS-IS explícito                       | `C4`       | `A3`    | `PAUSE_SAFELY`               | Desempeño y desarrollo son deliberados y sensibles, sin urgencia operativa ordinaria.                              |
| `VPROC-0066` — Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección                                              | Capacidades sin precursor AS-IS explícito                       | `C0`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Los elementos de protección son prerrequisito de seguridad para tareas aplicables.                                 |
| `VPROC-0067` — Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor | Capacidades sin precursor AS-IS explícito                       | `C2`       | `A1`    | `MANUAL_CONTINGENCY_ALLOWED` | Kits y conjuntos afectan completitud, custodia y disponibilidad durante entregas y devoluciones.                   |
| `VPROC-0068` — Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido                                  | Capacidades sin precursor AS-IS explícito                       | `C4`       | `A3`    | `PAUSE_SAFELY`               | La medición de satisfacción puede programarse y no debe confundirse con atención de reclamos.                      |
| `VPROC-0069` — Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable           | Capacidades sin precursor AS-IS explícito                       | `C3`       | `A2`    | `PAUSE_SAFELY`               | El presupuesto es crítico en ciclos de aprobación, control y proyección.                                           |

---

#### 16. Lectura de la matriz

La matriz no afirma que todos los componentes deban estar activos de forma permanente. Por ejemplo:

- `VPROC-0016` exige consulta de receta en operación, pero su edición administrativa puede limitarse a horario controlado;
- `VPROC-0044` exige disponibilidad en cierre y cambio de responsable, no durante todas las horas del día;
- `VPROC-0013` y `VPROC-0062` requieren respuesta ante eventos a cualquier hora, aunque el registro digital completo pueda completarse después de la contención;
- `VPROC-0045` puede degradarse sin detener ventas, pero no podrá confirmar puntos o redenciones con resultado incierto;
- `VPROC-0061` puede pausarse, mientras los procesos que proveen sus datos conservan sus propias clases.

---

#### 17. Relación con tareas posteriores

| Decisión posterior                  | Tarea propietaria                     |
| ----------------------------------- | ------------------------------------- |
| volumen, concurrencia y crecimiento | `NFR-REQ-002`                         |
| tiempo máximo de respuesta          | `NFR-REQ-003`                         |
| offline, cola y sincronización      | `NFR-REQ-004`                         |
| privacidad y sensibilidad           | `NFR-REQ-005`                         |
| trazabilidad y retención            | `NFR-REQ-006`                         |
| accesibilidad y ergonomía           | `NFR-REQ-007`                         |
| hardware, red y periféricos         | `NFR-REQ-008`                         |
| observabilidad, soporte y alertas   | `NFR-REQ-009`                         |
| respaldo, RTO y RPO técnicos        | `NFR-REQ-010`                         |
| compatibilidad por dispositivo      | `NFR-REQ-011`                         |
| MTPD, MBCO, RTO y RPO empresariales | `CONT-DOM-002` a `CONT-DOM-004`       |
| contingencia por estación           | `UX-STATION-007`                      |
| pantalla y etapa propietarias       | `PROC-SCREEN-001` a `PROC-SCREEN-028` |
| paquete, SLO, pruebas y rollout     | `DELIV-PKG-001` a `DELIV-PKG-025`     |

No queda ningún objetivo cuantitativo narrativo sin tarea propietaria.

---

#### 18. Requisitos de prueba derivados

Se crean:

```text
TREQ-PROC-227 a TREQ-PROC-246
```

Protegen clasificación por proceso, dimensiones de impacto, ventanas, estados, degradación, etapas críticas, dependencias, variantes territoriales, mantenimiento, seguridad, datos, observabilidad, gobierno, cobertura de los 69 procesos y certificación.

---

#### 19. Criterios de aceptación

- [ ] Existe una definición separada de criticidad, disponibilidad empresarial, disponibilidad técnica, degradación y prioridad de incidente.
- [ ] Las clases `C0` a `C4` tienen reglas verificables y no dependen de jerarquía o aplicación.
- [ ] Las ventanas `A0` a `A4` diferencian evento, operación, ciclo, horario y programación.
- [ ] Los estados de disponibilidad distinguen disponible, degradado, no disponible, desconocido, recuperación y conciliación.
- [ ] La degradación nunca autoriza omitir identidad, permiso, evidencia, idempotencia o conciliación.
- [ ] Cada uno de `VPROC-0001` a `VPROC-0069` tiene criticidad, ventana, modo inicial y justificación.
- [ ] Las etapas de mayor impacto pueden elevar la clase sin fragmentar indebidamente el proceso.
- [ ] Las dependencias internas y externas no se ocultan ni reducen responsabilidad.
- [ ] Los perfiles por sede, área, canal o turno no reducen el baseline sin evidencia.
- [ ] No se inventan porcentajes, RTO o RPO antes de sus tareas propietarias.
- [ ] Se crean `TREQ-PROC-227` a `TREQ-PROC-246` en el registro completo.
- [ ] No se modifica código, Supabase, migraciones, infraestructura ni operación.
- [ ] `NFR-REQ-002` permanece no iniciada.

---

#### 20. Estado y continuidad

```text
UX-BASE-015  APROBADA
NFR-REQ-001  APROBADA
NFR-REQ-002  NO INICIADA
```

La aprobación de esta tarea congela las clases y la matriz inicial para diseño. No marca como implementada, medida o verificada la disponibilidad de ningún proceso.


### ✅ NFR-REQ-002 — Definir volumen, concurrencia y crecimiento esperado

- **Estado:** APROBADA
- **Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal
- **Tarea anterior:** `NFR-REQ-001 — Definir criticidad y disponibilidad por proceso` — APROBADA
- **Siguiente tarea reservada:** `NFR-REQ-003 — Definir tiempos máximos de respuesta` — NO INICIADA
- **Artefactos producidos:** `NFR-WORKLOAD-CONTRACT-001`; `NFR-PROCESS-WORKLOAD-MATRIX-001`; `NFR-CAPACITY-EVIDENCE-REGISTER-001`
- **Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`
- **Naturaleza:** contrato de demanda, concurrencia, crecimiento, evidencia y capacidad; no dimensionamiento físico definitivo ni implementación
**Cambios en código, migraciones, Supabase, aplicaciones, infraestructura o despliegues:** no autorizados

---

#### 1. Propósito

Definir cómo Vento OS describirá, medirá y proyectará el volumen, la concurrencia y el crecimiento de cada proceso empresarial, de modo que las decisiones posteriores de arquitectura, índices, colas, almacenamiento, hardware, pruebas de carga y paquetes de implementación se basen en una envolvente verificable y no en el promedio actual, la cantidad total de usuarios o una estimación informal.

```text
VOLUMEN
≠ CANTIDAD DE FILAS

CONCURRENCIA
≠ CANTIDAD DE CUENTAS

CRECIMIENTO
≠ MULTIPLICAR TODO POR EL MISMO PORCENTAJE

PROMEDIO
≠ PICO
≠ RÁFAGA
≠ BACKLOG DE RECUPERACIÓN
```

La aprobación de esta tarea congela un contrato y una matriz inicial de diseño. No declara medidos ni certificados los valores reales de producción.

---

#### 2. Continuidad lógica

`NFR-REQ-001` ya definió qué procesos son críticos y en qué ventanas deben producir un resultado mínimo. Ahora debe establecerse cuánta demanda puede llegar, cuántos actores o sistemas pueden operar simultáneamente y cómo cambia esa demanda antes de fijar tiempos máximos de respuesta, operación offline, hardware, observabilidad o recuperación.

```text
CRITICIDAD Y DISPONIBILIDAD
→ VOLUMEN, CONCURRENCIA Y CRECIMIENTO
→ TIEMPOS DE RESPUESTA
→ OFFLINE Y SINCRONIZACIÓN
→ HARDWARE, OBSERVABILIDAD Y RECUPERACIÓN
→ ESTACIONES, PANTALLAS Y PAQUETES
```

---

#### 3. Distinciones canónicas

| Concepto                    | Definición                                                                                    |
| --------------------------- | --------------------------------------------------------------------------------------------- |
| unidad natural              | hecho empresarial contado: pedido, línea, movimiento, lote, marcación, archivo, evento o caso |
| volumen                     | cantidad de unidades naturales dentro de una ventana y un alcance explícitos                  |
| throughput                  | unidades completadas por intervalo, separado de unidades recibidas                            |
| concurrencia humana         | personas activas simultáneamente dentro del alcance                                           |
| concurrencia de dispositivo | estaciones, tablets, kioscos o terminales activas simultáneamente                             |
| concurrencia de escritura   | mutaciones simultáneas sobre el mismo recurso o conjunto contendido                           |
| concurrencia sistémica      | requests, jobs, webhooks, eventos o consumidores en vuelo                                     |
| backlog                     | trabajo recibido que todavía no alcanzó su resultado empresarial                              |
| ráfaga                      | incremento breve que no representa el promedio ordinario                                      |
| crecimiento                 | cambio de volumen, cardinalidad, fan-out, tamaño o retención dentro de un horizonte           |
| capacidad                   | carga que el sistema puede procesar conservando integridad, seguridad y objetivos aprobados   |

No se utilizará una sola métrica para todos los procesos.

---

#### 4. Contrato mínimo de perfil de carga

Cada proceso y cada variante material conservarán:

```text
process_id
process_version
workload_profile_version
scope_type
scope_id
natural_unit
natural_window
workload_shapes[]
volume_band
baseline_value
baseline_period
baseline_source
baseline_confidence
p50_volume
p95_volume
maximum_observed
peak_window
burst_duration
active_cases
backlog_size
concurrent_humans
concurrent_devices
concurrent_writers_same_resource
inflight_requests
inflight_jobs
event_fanout
payload_size
attachment_size
retention_growth
growth_profiles[]
scenario_current
scenario_12m
scenario_24m
scenario_stress
dependencies[]
measurement_owner
review_triggers[]
```

Un valor sin periodo, alcance, unidad, fuente y confianza será tratado como una opinión, no como baseline.

---

#### 5. Alcances y ventanas naturales

Todo volumen deberá declarar simultáneamente:

```text
EMPRESA O MARCA
SEDE
ÁREA
CANAL
PROCESO Y ETAPA
VENTANA TEMPORAL
UNIDAD NATURAL
```

La ventana podrá ser minuto, hora, turno, día operativo, semana, corte, campaña, evento, cierre o periodo presupuestal. No se compararán directamente “500 líneas por día” con “500 casos por mes”.

Los perfiles corporativos y multisede conservarán tanto el total como la distribución. El total agregado no podrá ocultar que una sola sede, área, terminal, producto o intervalo concentra la carga.

---

#### 6. Formas de carga

| Código           | Significado                                                            |
| ---------------- | ---------------------------------------------------------------------- |
| `WS-CASE`        | expediente o caso con estados, propietario, vencimientos y evidencia   |
| `WS-REFERENCE`   | lectura intensiva de una versión gobernada con pocas escrituras        |
| `WS-TRANSACTION` | hechos o líneas frecuentes que deben ser atómicos e idempotentes       |
| `WS-BATCH`       | carga concentrada en un corte, cierre, publicación o ciclo             |
| `WS-EVENT`       | emisión, consumo o fan-out de eventos empresariales                    |
| `WS-INTEGRATION` | entrada o salida con un sistema externo, reintentos y conciliación     |
| `WS-FILE`        | carga, consulta o retención relevante de documentos, fotos o evidencia |
| `WS-ANALYTICAL`  | agregación, comparación o lectura amplia sobre datos históricos        |
| `WS-EMERGENCY`   | volumen ordinario bajo con ráfagas no planificables durante incidentes |

Un proceso podrá tener varias formas. La forma principal orienta el diseño; las secundarias impiden que una tabla transaccional o un archivo pesado queden ocultos detrás de un conteo de casos.

---

#### 7. Bandas iniciales de volumen

| Banda | Envolvente inicial por ventana natural | Uso                                                                              |
| ----- | -------------------------------------: | -------------------------------------------------------------------------------- |
| `L0`  |                         0 a 5 unidades | evento excepcional o caso esporádico; no elimina la necesidad de soportar ráfaga |
| `L1`  |                        6 a 50 unidades | casos de baja frecuencia o ciclos pequeños                                       |
| `L2`  |                      51 a 500 unidades | carga operativa recurrente de escala moderada                                    |
| `L3`  |                   501 a 5.000 unidades | transacciones, líneas, lecturas o evidencias de alta frecuencia                  |
| `L4`  | más de 5.000 unidades o flujo continuo | telemetría, eventos o fan-out intensivo; requiere justificación explícita        |

Las bandas son **envolventes de diseño**, no afirmaciones de producción actual. El valor exacto deberá reemplazar la banda en el paquete aplicable antes de aprobar `DELIV-PKG-025` cuando el proceso sea `C0`, `C1`, de alta frecuencia o tenga riesgo de propagación.

La unidad y la ventana de cada fila gobiernan la interpretación de la banda.

---

#### 8. Clases iniciales de concurrencia

| Clase |                                             Envolvente inicial | Regla                                                        |
| ----- | -------------------------------------------------------------: | ------------------------------------------------------------ |
| `K0`  |                           un escritor autoritativo por recurso | exclusividad estricta; pueden existir lectores               |
| `K1`  |             hasta 5 actores o dispositivos activos por alcance | trabajo administrativo o de caso con baja simultaneidad      |
| `K2`  |              6 a 20 actores o dispositivos activos por alcance | coordinación multiárea o multisede moderada                  |
| `K3`  |             21 a 75 actores, dispositivos o estaciones activos | operación distribuida con picos de turno o servicio          |
| `K4`  | más de 75 operaciones en vuelo, consumidores o fan-out técnico | concurrencia principalmente sistémica, de integración o cola |

La clase describe el máximo simultáneo relevante para diseño, no la nómina completa. Un proceso con dos usuarios puede tener `K4` si emite eventos a muchos consumidores; uno con cien empleados puede ser `K0` sobre un cierre exclusivo.

---

#### 9. Perfiles de crecimiento

| Perfil | Impulsor                                                                                              |
| ------ | ----------------------------------------------------------------------------------------------------- |
| `G0`   | estable o excepcional; el volumen de casos no crece materialmente, aunque la historia sí puede crecer |
| `G1`   | crecimiento orgánico por personas, proveedores o actividad ordinaria                                  |
| `G2`   | crecimiento por nuevas sedes, áreas, productos, dispositivos, canales o empresas                      |
| `G3`   | estacionalidad, promociones, eventos, cierres o ráfagas operativas                                    |
| `G4`   | acumulación por retención de movimientos, archivos, versiones, auditoría o evidencia                  |

Cada proceso tendrá uno o varios perfiles. El crecimiento de archivos, auditoría y movimientos se tratará separadamente del crecimiento de actores o transacciones.

---

#### 10. Horizontes obligatorios

Todo perfil cuantitativo posterior deberá conservar cuatro escenarios:

```text
CURRENT_BASELINE
→ medición reproducible del estado actual

APPROVED_12M
→ sedes, productos, personas, canales y proyectos aprobados

PLAUSIBLE_24M
→ expansión razonable documentada, sin presentarla como compromiso

STRESS_SCENARIO
→ pico, reconexión, backlog, campaña, cierre o incidente adverso
```

No se extrapolará automáticamente el máximo histórico. El escenario de crecimiento deberá identificar el impulsor empresarial y la fecha en la que puede materializarse.

---

#### 11. Jerarquía de evidencia

La fuente preferida será, en orden:

1. hechos autoritativos del dominio y sus timestamps;
2. eventos o receipts correlacionados;
3. exportaciones verificables de sistemas externos;
4. logs técnicos vinculados con resultado empresarial;
5. registros físicos o manuales conciliados;
6. estimación estructurada de operación;
7. entrevista, únicamente como hipótesis.

Toda medición deberá corregir o declarar:

- duplicados y reintentos;
- operaciones anuladas o compensadas;
- timestamps tardíos;
- zona horaria;
- datos eliminados o no retenidos;
- periodos incompletos;
- sedes cerradas;
- pruebas y tráfico sintético;
- cambios de versión;
- eventos sin resultado confirmado.

---

#### 12. Estado de confianza

```text
MEASURED_REPRODUCIBLE
DERIVED_RECONCILED
ESTIMATED_WITH_EVIDENCE
CLASS_ONLY
UNKNOWN_BLOCKING
```

- `MEASURED_REPRODUCIBLE`: consulta y periodo repetibles;
- `DERIVED_RECONCILED`: cálculo desde hechos correlacionados y conciliados;
- `ESTIMATED_WITH_EVIDENCE`: estimación con fuente operativa y supuestos explícitos;
- `CLASS_ONLY`: solo existe banda cualitativa de esta tarea;
- `UNKNOWN_BLOCKING`: la ausencia de datos impide aprobar un paquete crítico.

La matriz de esta tarea inicia en `CLASS_ONLY`. No se fingirá precisión para cerrar documentalmente el bloque.

---

#### 13. Promedio, pico, ráfaga y backlog

Todo perfil distinguirá:

```text
PROMEDIO POR VENTANA
P50
P95
MÁXIMO OBSERVADO
PICO EMPRESARIAL ESPERADO
DURACIÓN DE RÁFAGA
BACKLOG NORMAL
BACKLOG DESPUÉS DE FALLA
TIEMPO PARA DRENAR BACKLOG
```

Los escenarios mínimos incluyen:

- apertura y cierre de turno;
- horas pico de venta;
- producción y despacho simultáneos;
- corte de compras, nómina, caja o presupuesto;
- promoción, evento o temporada;
- reconexión de dispositivos;
- reenvío de webhooks;
- recuperación después de indisponibilidad;
- importación o backfill;
- incidente de seguridad, inocuidad o continuidad.

---

#### 14. Concurrencia y contención

La medición separará:

```text
ACTORES SIMULTÁNEOS
DISPOSITIVOS SIMULTÁNEOS
SESIONES SIMULTÁNEAS
LECTORES DEL MISMO RECURSO
ESCRITORES DEL MISMO RECURSO
TRABAJOS ASÍNCRONOS EN VUELO
CONSUMIDORES DEL MISMO EVENTO
```

Los siguientes objetos exigirán análisis explícito de contención:

- caja y cierre;
- conteo y alcance contado;
- lote de producción;
- receta o versión publicada;
- LPN, LOC e inventario disponible;
- recepción y orden de compra;
- remisión y custodia;
- pago, devolución y ledger;
- turno y check-in;
- documento o evidencia en sustitución;
- presupuesto o cierre financiero.

La solución concreta —locking, versión optimista, lease, serialización, cola o partición— pertenece a E3, E4 y al paquete propietario. Esta tarea define qué debe medirse y probarse.

---

#### 15. Eventos, fan-out y trabajos asíncronos

Un hecho empresarial podrá generar múltiples consumidores. La carga deberá registrar:

```text
EVENTOS EMITIDOS
CONSUMIDORES ESPERADOS
CONSUMIDORES ACTIVOS
REINTENTOS
DUPLICADOS DETECTADOS
DEAD-LETTER
TIEMPO EN COLA
OPERACIONES EN VUELO
```

Un pedido con cinco consumidores no contará como una sola operación técnica. Tampoco se multiplicará como cinco hechos empresariales.

Los reintentos y la recuperación de backlog no podrán producir dobles movimientos, pagos, puntos, impresiones o notificaciones.

---

#### 16. Tamaño de payload, archivos y retención

El crecimiento deberá considerar:

- líneas por caso;
- pasos y mediciones por lote;
- movimientos por LPN o remisión;
- columnas y cardinalidad de maestros;
- eventos de auditoría;
- fotos, firmas, PDFs y adjuntos;
- payload original de integraciones;
- versiones de recetas, políticas y documentos;
- índices y proyecciones;
- retención online, archivo y disposición.

```text
MISMO NÚMERO DE CASOS
≠ MISMO COSTO DE DATOS
```

`NFR-REQ-006`, `EVID-ARC-*`, `SUPA-ARC-021` y `SUPA-ARC-022` definirán retención, arquitectura e índices aplicables.

---

#### 17. Consultas, reportes y análisis

La carga analítica se medirá separadamente de la carga operativa:

```text
FILAS LEÍDAS
PERIODO CONSULTADO
DIMENSIONES Y FILTROS
AGRUPACIONES
EXPORTACIÓN
USUARIOS SIMULTÁNEOS
FRECUENCIA DE REFRESCO
```

Un dashboard o cierre no podrá degradar la captura de ventas, producción, inventario, pagos o asistencia. Las proyecciones, vistas, réplicas o modelos de lectura se decidirán en la arquitectura posterior.

---

#### 18. Dependencias e integraciones externas

Cada dependencia externa declarará:

- rate limit;
- cuota;
- tamaño máximo;
- latencia y timeout;
- webhook, polling o batch;
- reintentos y backoff;
- ventana de mantenimiento;
- backlog máximo tolerable;
- tiempo de conciliación;
- comportamiento ante duplicado;
- crecimiento contractual esperado.

Una cuota del proveedor no se convertirá en capacidad interna sin medir mapeo, validación, persistencia, fan-out y conciliación.

---

#### 19. Tablets, kioscos y estaciones multiárea

Para los dos POS táctiles del Centro de Producción y cualquier estación multiárea:

- se medirán actores y dispositivos, no solo cuentas;
- cada área conservará su cola, tarea, receta, lote y contexto;
- se probará lectura simultánea de recetas y captura de producción;
- el cambio de trabajador y área no mezclará borradores;
- la reconexión podrá producir una ráfaga mayor que la actividad en línea;
- dos equipos no se declararán redundancia ni capacidad doble sin prueba física;
- una impresora, escáner o red compartida podrá ser el cuello de botella aunque la aplicación responda.

---

#### 20. Crecimiento de cardinalidad

Además del throughput, deberán proyectarse:

```text
EMPRESAS Y MARCAS
SEDES Y ÁREAS
TRABAJADORES Y DISPOSITIVOS
PRODUCTOS, PRESENTACIONES Y RECETAS
PROVEEDORES Y CLIENTES
LOC, LPN, ACTIVOS Y KITS
PEDIDOS, LÍNEAS Y MOVIMIENTOS
LOTES Y MEDICIONES
DOCUMENTOS, ARCHIVOS Y AUDITORÍA
INTEGRACIONES Y CONSUMIDORES
```

Una tabla que crece lentamente puede volverse crítica por consultas sin filtro, índices incorrectos, joins de alta cardinalidad o retención indefinida.

---

#### 21. Envolvente de diseño y margen

La envolvente de diseño se calculará posteriormente como:

```text
MAX(
  PICO MEDIDO Y RECONCILIADO,
  ESCENARIO EMPRESARIAL APROBADO,
  RÁFAGA ESPERADA,
  BACKLOG DE RECUPERACIÓN
)
+
MARGEN JUSTIFICADO
```

No se fija un multiplicador universal. El margen dependerá de criticidad, confianza, costo de escalar, elasticidad, tiempo de aprovisionamiento y consecuencias de saturación.

Saturar no podrá traducirse en pérdida silenciosa. El sistema deberá aplicar límites, backpressure, colas, degradación o rechazo explícito según el contrato posterior.

---

#### 22. Gobierno y revisión

Cada perfil tendrá propietario funcional y técnico, fuente, fecha, versión y nivel de confianza. Se revisará cuando ocurra:

- nueva sede, marca, área o canal;
- cambio de horario o turnos;
- campaña o evento relevante;
- nuevo POS, proveedor o integración;
- cambio de retención;
- crecimiento de catálogo;
- saturación, timeout o backlog;
- incidente o reconexión masiva;
- migración de dominio;
- cambio de hardware;
- desviación material entre forecast y carga real.

No podrá reducirse un perfil para evitar inversión sin evidencia y aprobación.

---

#### 23. Matriz inicial de carga esperada

La matriz siguiente clasifica los 69 procesos para diseño. Sus bandas son provisionales `CLASS_ONLY`; no sustituyen la medición y el forecast cuantitativo del paquete.

| Proceso                                                                                                                                                                   | Familia                                                         | Forma                                    | Volumen | Concurrencia | Crecimiento | Unidad y ventana natural                          | Principal pico                                          | Lectura de diseño                                                      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ---------------------------------------- | ------- | ------------ | ----------- | ------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------- |
| `VPROC-0001` — Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                            | Gobierno y estructura                                           | `WS-CASE`                                | `L1`    | `K1`         | `G1+G4`     | decisiones y compromisos / mes empresarial        | comités, incidentes y cierres estratégicos              | casos de baja frecuencia con historial y seguimiento acumulativo       |
| `VPROC-0002` — Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                          | Gobierno y estructura                                           | `WS-REFERENCE`                           | `L1`    | `K1`         | `G2+G4`     | entidades organizativas y cambios / mes           | apertura, cierre o reorganización de sedes              | pocas escrituras y muchas consultas de estructura vigente              |
| `VPROC-0003` — Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                      | Gobierno y estructura                                           | `WS-REFERENCE`                           | `L2`    | `K2`         | `G2+G4`     | consultas de política / día y versiones / mes     | cambios de delegación o política                        | lectura transversal con edición controlada y versionada                |
| `VPROC-0004` — Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                            | Gobierno y estructura                                           | `WS-CASE+WS-EVENT`                       | `L2`    | `K2`         | `G2+G3+G4`  | compromisos y handoffs / día                      | cambios de turno, cierres y contingencias               | trabajo compartido con eventos y vencimientos                          |
| `VPROC-0005` — Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                         | Personas y trabajo                                              | `WS-CASE+WS-FILE`                        | `L1`    | `K1`         | `G1+G3+G4`  | vacantes y candidatos / mes                       | aperturas de sede y temporadas de contratación          | casos humanos con documentos y campañas puntuales                      |
| `VPROC-0006` — Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                         | Personas y trabajo                                              | `WS-CASE+WS-FILE`                        | `L1`    | `K1`         | `G2+G4`     | vinculaciones e incorporaciones / mes             | ingresos masivos o apertura de sede                     | casos de ciclo largo con evidencia y retención                         |
| `VPROC-0007` — Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                            | Personas y trabajo                                              | `WS-BATCH+WS-CASE`                       | `L2`    | `K2`         | `G2+G3+G4`  | asignaciones y turnos / semana                    | publicación semanal, cambios y reemplazos               | carga cíclica con concurrencia de responsables y trabajadores          |
| `VPROC-0008` — Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                     | Personas y trabajo                                              | `WS-TRANSACTION`                         | `L2`    | `K3`         | `G2+G3+G4`  | marcaciones / día operativo                       | entradas, salidas y cambios de turno                    | picos sincronizados por reloj y múltiples dispositivos                 |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                       | Personas y trabajo                                              | `WS-CASE+WS-EVENT`                       | `L1`    | `K2`         | `G1+G3+G4`  | novedades laborales / día                         | ausencias simultáneas y contingencias                   | casos moderados que disparan cobertura y notificaciones                |
| `VPROC-0010` — Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                             | Personas y trabajo                                              | `WS-BATCH+WS-TRANSACTION`                | `L2`    | `K1`         | `G2+G4`     | líneas laborales / corte                          | cierre de nómina y beneficios                           | procesamiento por ciclos con exclusividad de cierre                    |
| `VPROC-0011` — Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                            | Personas y trabajo                                              | `WS-CASE+WS-EVENT`                       | `L1`    | `K1`         | `G1+G4`     | retiros y revocaciones / mes                      | retiro colectivo o incidente de seguridad               | bajo volumen con fan-out de revocación y evidencia                     |
| `VPROC-0012` — Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                              | Seguridad, higiene y cumplimiento                               | `WS-CASE+WS-FILE`                        | `L2`    | `K2`         | `G2+G4`     | inspecciones, hallazgos y acciones / semana       | auditorías, apertura de sede o incidente                | casos programados con fotografías y seguimiento                        |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                              | Seguridad, higiene y cumplimiento                               | `WS-EMERGENCY+WS-FILE`                   | `L0`    | `K2`         | `G0+G4`     | incidentes / evento                               | emergencia o accidente con múltiples reportes           | volumen ordinario bajo pero ráfaga impredecible y evidencia pesada     |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                | Seguridad, higiene y cumplimiento                               | `WS-TRANSACTION+WS-FILE`                 | `L2`    | `K2`         | `G2+G4`     | controles y observaciones / turno                 | apertura, cierre y producción intensiva                 | captura repetitiva por área con retención de evidencia                 |
| `VPROC-0015` — Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                           | Productos, recetas y conocimiento                               | `WS-REFERENCE`                           | `L2`    | `K2`         | `G2+G4`     | productos, presentaciones y equivalencias activas | carga de catálogo, nueva sede o canal                   | maestro versionado con lectura transversal y crecimiento por catálogo  |
| `VPROC-0016` — Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                 | Productos, recetas y conocimiento                               | `WS-REFERENCE+WS-FILE`                   | `L2`    | `K2`         | `G2+G4`     | recetas, versiones y consultas / turno            | publicación de menú y producción simultánea             | edición limitada y lectura operativa intensa en estaciones             |
| `VPROC-0017` — Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                    | Productos, recetas y conocimiento                               | `WS-REFERENCE+WS-EVENT`                  | `L2`    | `K3`         | `G2+G3`     | cambios de oferta y lecturas / canal-día          | horas de servicio, agotados y promociones               | actualizaciones con fan-out hacia canales y picos comerciales          |
| `VPROC-0018` — Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                    | Productos, recetas y conocimiento                               | `WS-REFERENCE`                           | `L2`    | `K2`         | `G2+G4`     | especificaciones y consultas / turno              | cambios de producto o incidente de alérgeno             | lectura crítica y versionada con crecimiento de catálogo               |
| `VPROC-0019` — Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                           | Compras y proveedores                                           | `WS-CASE`                                | `L2`    | `K2`         | `G2+G3+G4`  | necesidades y líneas solicitadas / día            | cortes de compra y quiebres de inventario               | entrada recurrente desde varias áreas con backlog controlado           |
| `VPROC-0020` — Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                   | Compras y proveedores                                           | `WS-CASE+WS-FILE`                        | `L1`    | `K1`         | `G1+G4`     | comparaciones y ofertas / semana                  | licitaciones, cambios de proveedor y compras relevantes | casos de baja frecuencia con archivos y análisis                       |
| `VPROC-0021` — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                   | Compras y proveedores                                           | `WS-CASE+WS-TRANSACTION`                 | `L2`    | `K2`         | `G2+G3+G4`  | órdenes y líneas aprobadas / día                  | cortes de abastecimiento y urgencias                    | transacciones moderadas con segregación y evidencia                    |
| `VPROC-0022` — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                         | Compras y proveedores                                           | `WS-TRANSACTION+WS-FILE`                 | `L2`    | `K2`         | `G2+G3+G4`  | recepciones y líneas / día                        | llegadas simultáneas y cierre de proveedores            | captura física por ventana con diferencias y anexos                    |
| `VPROC-0023` — Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                     | Inventario y almacenamiento                                     | `WS-REFERENCE`                           | `L2`    | `K2`         | `G2+G4`     | LOC, zonas y consultas / turno                    | reorganización, expansión o conteo                      | maestro espacial con lectura operativa y cambios controlados           |
| `VPROC-0024` — Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                            | Inventario y almacenamiento                                     | `WS-TRANSACTION+WS-EVENT`                | `L3`    | `K3`         | `G2+G3+G4`  | movimientos de ingreso y ubicación / día          | recepciones, producción y cierres de turno              | alto volumen transaccional y contención por ubicación o LPN            |
| `VPROC-0025` — Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                 | Inventario y almacenamiento                                     | `WS-TRANSACTION+WS-EVENT`                | `L3`    | `K3`         | `G2+G3+G4`  | retiros, consumos y traslados / día               | producción, servicio y abastecimiento interno           | movimientos frecuentes con concurrencia multiárea                      |
| `VPROC-0026` — Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                       | Inventario y almacenamiento                                     | `WS-BATCH+WS-TRANSACTION`                | `L3`    | `K2`         | `G2+G3+G4`  | líneas observadas / sesión de conteo              | inventario general, cierres y auditorías                | ráfagas de captura con exclusividad por alcance                        |
| `VPROC-0027` — Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                           | Inventario y almacenamiento                                     | `WS-TRANSACTION+WS-EVENT+WS-FILE`        | `L2`    | `K2`         | `G2+G4`     | eventos de condición y evidencia / día            | vencimientos, fallas de frío o cuarentenas              | eventos moderados con picos críticos y evidencia                       |
| `VPROC-0028` — Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                             | Inventario y almacenamiento                                     | `WS-CASE+WS-TRANSACTION+WS-EVENT`        | `L3`    | `K3`         | `G2+G3+G4`  | solicitudes, remisiones y líneas / día            | cortes, despacho y demanda de sedes                     | flujo multiárea con estados, líneas y handoffs concurrentes            |
| `VPROC-0029` — Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                              | Activos, vehículos, reutilizables y contenedores                | `WS-CASE+WS-TRANSACTION`                 | `L2`    | `K2`         | `G2+G4`     | activos, asignaciones y transferencias / mes      | inventarios, ingresos o retiros laborales               | casos de custodia con historial creciente                              |
| `VPROC-0030` — Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                           | Activos, vehículos, reutilizables y contenedores                | `WS-CASE+WS-FILE`                        | `L2`    | `K2`         | `G2+G4`     | órdenes de mantenimiento y evidencias / día       | fallas simultáneas o mantenimiento preventivo           | casos con archivos, repuestos y tiempos de espera                      |
| `VPROC-0031` — Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                              | Activos, vehículos, reutilizables y contenedores                | `WS-TRANSACTION+WS-CASE`                 | `L2`    | `K2`         | `G2+G4`     | viajes, cargas de combustible e incidencias / día | despachos, rutas y fallas de vehículo                   | carga moderada vinculada a disponibilidad logística                    |
| `VPROC-0032` — Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                | Activos, vehículos, reutilizables y contenedores                | `WS-TRANSACTION+WS-EVENT`                | `L3`    | `K3`         | `G2+G3+G4`  | entregas y retornos de reutilizables / día        | despachos, eventos y cierres                            | muchos objetos y handoffs distribuidos                                 |
| `VPROC-0033` — Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                       | Producción                                                      | `WS-BATCH+WS-CASE`                       | `L2`    | `K2`         | `G2+G3+G4`  | solicitudes y líneas planificadas / día           | cortes diarios, pedidos grandes y eventos               | planificación por lote con múltiples fuentes de demanda                |
| `VPROC-0034` — Preparar materiales y ejecutar producción contra una versión aprobada                                                                                      | Producción                                                      | `WS-TRANSACTION+WS-REFERENCE+WS-EVENT`   | `L3`    | `K3`         | `G2+G3+G4`  | pasos, consumos y mediciones / día                | producción simultánea por áreas y lotes                 | ejecución frecuente con lecturas de receta y escrituras concurrentes   |
| `VPROC-0035` — Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                             | Producción                                                      | `WS-CASE+WS-FILE`                        | `L2`    | `K2`         | `G2+G4`     | decisiones de calidad / lote                      | liberaciones acumuladas o hallazgos                     | casos por lote con evidencia y autoridad                               |
| `VPROC-0036` — Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                              | Producción                                                      | `WS-TRANSACTION+WS-EVENT`                | `L3`    | `K3`         | `G2+G3+G4`  | unidades empacadas y etiquetas / día              | picos de producción y despacho                          | alta frecuencia con periféricos y trazabilidad                         |
| `VPROC-0037` — Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                               | Producción                                                      | `WS-TRANSACTION+WS-BATCH`                | `L2`    | `K2`         | `G2+G4`     | rendimientos, mermas y cierres / lote             | cierres simultáneos y reprocesos                        | carga moderada con cálculos y conciliación                             |
| `VPROC-0038` — Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                      | Pedidos, ventas, pagos y caja                                   | `WS-TRANSACTION+WS-EVENT`                | `L3`    | `K3`         | `G2+G3+G4`  | pedidos, líneas y eventos / día                   | horas pico, fines de semana y promociones               | flujo de alta frecuencia y fan-out a preparación, pago e inventario    |
| `VPROC-0039` — Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                             | Pedidos, ventas, pagos y caja                                   | `WS-TRANSACTION+WS-EVENT`                | `L3`    | `K3`         | `G2+G3+G4`  | ventas, líneas y entregas / día                   | horas pico y promociones                                | transacciones rápidas con múltiples terminales                         |
| `VPROC-0040` — Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                               | Pedidos, ventas, pagos y caja                                   | `WS-INTEGRATION+WS-EVENT`                | `L3`    | `K4`         | `G2+G3+G4`  | pedidos y líneas externas / día                   | promociones del canal, reintentos y reconexión          | ingesta externa con fan-out, deduplicación y ráfagas                   |
| `VPROC-0041` — Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                     | Pedidos, ventas, pagos y caja                                   | `WS-CASE+WS-FILE+WS-BATCH`               | `L1`    | `K2`         | `G2+G3+G4`  | oportunidades, cotizaciones y órdenes B2B / mes   | eventos, temporadas y clientes grandes                  | pocos casos con muchas líneas, documentos y coordinación               |
| `VPROC-0042` — Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                         | Pedidos, ventas, pagos y caja                                   | `WS-CASE+WS-TRANSACTION+WS-EVENT`        | `L2`    | `K2`         | `G2+G3+G4`  | cambios, anulaciones y devoluciones / día         | fallas de servicio o campaña                            | casos excepcionales con efectos distribuidos                           |
| `VPROC-0043` — Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                               | Pedidos, ventas, pagos y caja                                   | `WS-TRANSACTION+WS-INTEGRATION+WS-EVENT` | `L3`    | `K4`         | `G2+G3+G4`  | intentos y confirmaciones de pago / día           | horas pico, reintentos y caída del proveedor            | transacción externa sensible con resultado incierto y fan-out fiscal   |
| `VPROC-0044` — Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                | Pedidos, ventas, pagos y caja                                   | `WS-BATCH+WS-TRANSACTION`                | `L2`    | `K1`         | `G2+G4`     | cierres, medios y líneas / turno                  | cambio de responsable y cierre de sede                  | lote exclusivo por caja con conciliación de múltiples fuentes          |
| `VPROC-0045` — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                | Clientes, fidelización, reclamos y reservas                     | `WS-TRANSACTION+WS-EVENT`                | `L3`    | `K4`         | `G2+G3+G4`  | identificaciones y asientos de loyalty / día      | horas pico y campañas                                   | ledger de alta frecuencia con consumidores múltiples                   |
| `VPROC-0046` — Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                         | Clientes, fidelización, reclamos y reservas                     | `WS-CASE+WS-FILE`                        | `L1`    | `K2`         | `G1+G3+G4`  | reclamos, evidencias y compensaciones / día       | incidente de producto o campaña                         | casos de baja frecuencia con picos reputacionales y archivos           |
| `VPROC-0047` — Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                     | Clientes, fidelización, reclamos y reservas                     | `WS-CASE+WS-EVENT`                       | `L2`    | `K2`         | `G2+G3+G4`  | reservas, asistentes y comunicaciones / día       | fines de semana, fechas especiales y eventos            | casos programados con picos estacionales y notificaciones              |
| `VPROC-0048` — Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                | Transporte y entregas                                           | `WS-BATCH+WS-CASE`                       | `L2`    | `K2`         | `G2+G3+G4`  | rutas, paradas y cargas / día                     | corte de despacho y eventos                             | planificación por ventana con restricciones y lotes                    |
| `VPROC-0049` — Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                        | Transporte y entregas                                           | `WS-TRANSACTION+WS-FILE+WS-EVENT`        | `L2`    | `K3`         | `G2+G3+G4`  | paradas, entregas y evidencias / día              | salidas simultáneas, tráfico y reconexión               | captura móvil distribuida con pruebas y estados                        |
| `VPROC-0050` — Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                 | Transporte y entregas                                           | `WS-INTEGRATION+WS-EVENT`                | `L2`    | `K4`         | `G2+G3+G4`  | entregas y eventos externos / día                 | picos del proveedor y reintentos                        | integración externa con polling, webhooks y conciliación               |
| `VPROC-0051` — Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                            | Finanzas y obligaciones                                         | `WS-EVENT+WS-TRANSACTION`                | `L3`    | `K4`         | `G2+G3+G4`  | hechos económicos y líneas / día                  | cierres, reintentos y backfill de eventos               | fan-out asíncrono y ledger acumulativo                                 |
| `VPROC-0052` — Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                              | Finanzas y obligaciones                                         | `WS-BATCH+WS-TRANSACTION+WS-INTEGRATION` | `L2`    | `K1`         | `G2+G4`     | obligaciones y pagos / corte                      | vencimientos y ventanas bancarias                       | procesamiento por lote con conciliación externa                        |
| `VPROC-0053` — Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                 | Finanzas y obligaciones                                         | `WS-CASE+WS-TRANSACTION+WS-INTEGRATION`  | `L2`    | `K2`         | `G2+G4`     | cobros, recaudos y aplicaciones / día             | vencimientos y pagos masivos                            | casos y transacciones con conciliación financiera                      |
| `VPROC-0054` — Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas                                                                  | Finanzas y obligaciones                                         | `WS-BATCH+WS-ANALYTICAL`                 | `L3`    | `K2`         | `G2+G4`     | líneas de costo, distribución y cierre / ciclo    | cierres mensuales y recalculo histórico                 | carga analítica y batch sobre historia creciente                       |
| `VPROC-0055` — Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                    | Instalaciones, marketing, tecnología, información y continuidad | `WS-CASE+WS-FILE`                        | `L2`    | `K2`         | `G2+G4`     | controles, novedades y órdenes / día              | apertura, cierre y fallas de servicios                  | casos recurrentes con evidencia y programación                         |
| `VPROC-0056` — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                  | Instalaciones, marketing, tecnología, información y continuidad | `WS-CASE+WS-FILE+WS-EVENT`               | `L2`    | `K4`         | `G2+G3+G4`  | contenidos, promociones y publicaciones / campaña | lanzamientos y temporadas                               | archivos con fan-out a múltiples canales                               |
| `VPROC-0057` — Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                    | Instalaciones, marketing, tecnología, información y continuidad | `WS-INTEGRATION+WS-CASE`                 | `L2`    | `K3`         | `G2+G3+G4`  | conversaciones y oportunidades / día              | campañas y publicaciones virales                        | entrada multicanal con casos y SLA comercial                           |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                      | Instalaciones, marketing, tecnología, información y continuidad | `WS-CASE+WS-FILE+WS-EMERGENCY`           | `L2`    | `K2`         | `G2+G3+G4`  | tickets, incidentes y evidencias / día            | caída transversal o despliegue                          | casos ordinarios con ráfagas de incidente                              |
| `VPROC-0059` — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                   | Instalaciones, marketing, tecnología, información y continuidad | `WS-CASE+WS-EVENT`                       | `L1`    | `K4`         | `G2+G4`     | altas, cambios y revocaciones / día               | incidente de seguridad o incorporación masiva           | bajo volumen humano con fan-out técnico de identidad                   |
| `VPROC-0060` — Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                 | Instalaciones, marketing, tecnología, información y continuidad | `WS-FILE+WS-EVENT`                       | `L3`    | `K4`         | `G2+G4`     | documentos, versiones y evidencias / día          | cargas masivas, cierres y procesos con fotografías      | crecimiento acumulativo de archivos, metadatos y eventos               |
| `VPROC-0061` — Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                               | Instalaciones, marketing, tecnología, información y continuidad | `WS-ANALYTICAL+WS-BATCH`                 | `L3`    | `K2`         | `G2+G4`     | hechos analizados y consultas / ciclo             | cierres, revisiones y análisis ad hoc                   | lecturas amplias sobre historia creciente                              |
| `VPROC-0062` — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                   | Instalaciones, marketing, tecnología, información y continuidad | `WS-EMERGENCY+WS-CASE+WS-FILE`           | `L0`    | `K3`         | `G0+G4`     | incidentes de continuidad / evento                | fallo general, ejercicio o recuperación masiva          | bajo volumen normal con ráfaga transversal y backlog de reconciliación |
| `VPROC-0063` — Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento              | Capacidades sin precursor AS-IS explícito                       | `WS-CASE+WS-ANALYTICAL`                  | `L1`    | `K1`         | `G1+G4`     | riesgos, tratamientos y revisiones / ciclo        | comités, incidentes y cambios estratégicos              | casos de gobierno con historial y análisis                             |
| `VPROC-0064` — Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado                   | Capacidades sin precursor AS-IS explícito                       | `WS-CASE+WS-FILE+WS-BATCH`               | `L1`    | `K2`         | `G1+G4`     | requerimientos y entregables / mes                | vencimientos regulatorios o auditorías                  | pocos casos documentales con picos por plazo                           |
| `VPROC-0065` — Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada                              | Capacidades sin precursor AS-IS explícito                       | `WS-CASE+WS-FILE`                        | `L1`    | `K1`         | `G1+G4`     | evaluaciones y decisiones / ciclo                 | ciclos de evaluación o cambios organizativos            | casos sensibles y programados con evidencia                            |
| `VPROC-0066` — Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección                                              | Capacidades sin precursor AS-IS explícito                       | `WS-TRANSACTION+WS-FILE`                 | `L2`    | `K2`         | `G2+G4`     | entregas, cambios y devoluciones de EPP / día     | ingresos, campañas de reposición o incidentes           | transacciones de seguridad con evidencia y vigencia                    |
| `VPROC-0067` — Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor | Capacidades sin precursor AS-IS explícito                       | `WS-TRANSACTION+WS-REFERENCE`            | `L2`    | `K2`         | `G2+G4`     | kits, componentes y movimientos / día             | despachos, ingresos y devoluciones masivas              | composición versionada y movimientos de custodia                       |
| `VPROC-0068` — Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido                                  | Capacidades sin precursor AS-IS explícito                       | `WS-BATCH+WS-ANALYTICAL+WS-INTEGRATION`  | `L2`    | `K4`         | `G2+G3+G4`  | respuestas y eventos / campaña                    | campaña, encuesta postventa o incidente reputacional    | ingesta por lotes con análisis y sesgo acumulado                       |
| `VPROC-0069` — Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable           | Capacidades sin precursor AS-IS explícito                       | `WS-BATCH+WS-ANALYTICAL`                 | `L3`    | `K2`         | `G2+G4`     | líneas, escenarios y desviaciones / ciclo         | presupuesto anual, reforecast y cierre                  | cálculo cíclico sobre historia y versiones crecientes                  |

---

#### 24. Resumen de la matriz

```text
VOLUMEN
L0    2 procesos
L1   13 procesos
L2   37 procesos
L3   17 procesos
L4    0 procesos
```

```text
CONCURRENCIA
K0    0 procesos
K1   11 procesos
K2   36 procesos
K3   13 procesos
K4    9 procesos
```

La ausencia de `L4` o `K0` como perfil primario no elimina esas clases. `L4` queda reservada para telemetría o volúmenes que la medición posterior demuestre; la exclusividad `K0` aparece como restricción interna de recursos en procesos clasificados `K1` o `K2`.

---

#### 25. Relación con tareas posteriores

| Decisión posterior                        | Tarea propietaria                                                  |
| ----------------------------------------- | ------------------------------------------------------------------ |
| latencias y tiempos máximos               | `NFR-REQ-003`                                                      |
| colas offline y sincronización            | `NFR-REQ-004`                                                      |
| sensibilidad de datos de carga            | `NFR-REQ-005`                                                      |
| retención y trazabilidad                  | `NFR-REQ-006`                                                      |
| hardware, red y periféricos               | `NFR-REQ-008`                                                      |
| métricas, dashboards y alertas            | `NFR-REQ-009`                                                      |
| recuperación, RTO y RPO                   | `NFR-REQ-010`; `CONT-DOM-002` a `CONT-DOM-004`                     |
| compatibilidad por dispositivo            | `NFR-REQ-011`                                                      |
| índices y crecimiento de base de datos    | `SUPA-AUD-020`; `SUPA-ARC-021`; `SUPA-ARC-022`                     |
| colas, backpressure y dead-letter         | `QUEUE-ARC-001` a `QUEUE-ARC-012`                                  |
| integraciones y rate limits               | `INT-APP-001` a `INT-APP-010`; `INT-EXT-001` a `INT-EXT-020`       |
| perfil cuantitativo y pruebas por paquete | `DELIV-PKG-013`; `DELIV-PKG-016`; `DELIV-PKG-017`; `DELIV-PKG-025` |
| ejecución de carga y certificación        | BLOQUES `T`, `R`, `U` y tareas `SHELL-CI-*` aplicables             |

Los valores exactos no quedan como pendientes narrativos: deben incorporarse al perfil del paquete antes de su aprobación física.

---

#### 26. Requisitos de prueba derivados

Se crean:

```text
TREQ-PROC-247 a TREQ-PROC-270
```

Protegen unidad natural, bandas, concurrencia, crecimiento, picos, backlog, contención, fan-out, archivos, cardinalidad, análisis, integraciones, estaciones multiárea, evidencia, gobierno, matriz completa y pruebas de capacidad.

---

#### 27. Criterios de aceptación

- [ ] Volumen, throughput, concurrencia, backlog y crecimiento están separados.
- [ ] Todo perfil exige unidad, ventana, alcance, fuente y confianza.
- [ ] Se definen formas de carga, bandas `L0` a `L4`, concurrencia `K0` a `K4` y perfiles `G0` a `G4`.
- [ ] Promedio, pico, ráfaga, backlog y recuperación se miden por separado.
- [ ] Concurrencia humana, de dispositivo, de escritura y sistémica no se confunden.
- [ ] Se identifican recursos con contención y trabajo exclusivo.
- [ ] Eventos, reintentos, fan-out y trabajos en cola forman parte de la carga.
- [ ] Archivos, auditoría, retención y cardinalidad forman parte del crecimiento.
- [ ] Reportes y análisis no se mezclan con carga transaccional.
- [ ] Las dependencias externas conservan cuotas, rate limits y conciliación.
- [ ] Las estaciones multiárea consideran cambio de actor, reconexión y periféricos.
- [ ] Cada uno de `VPROC-0001` a `VPROC-0069` tiene unidad, forma, banda, concurrencia, crecimiento y pico.
- [ ] La matriz no presenta clases como mediciones reales.
- [ ] Los perfiles críticos no podrán llegar a `DELIV-PKG-025` con `UNKNOWN_BLOCKING`.
- [ ] Se crean `TREQ-PROC-247` a `TREQ-PROC-270` en el registro completo.
- [ ] No se modifica código, Supabase, migraciones, infraestructura ni operación.
- [ ] `NFR-REQ-003` permanece no iniciada.

---

#### 28. Estado y continuidad

```text
NFR-REQ-001  APROBADA
NFR-REQ-002  APROBADA
NFR-REQ-003  NO INICIADA
```

La aprobación de esta tarea congela el contrato y la matriz inicial de carga. No certifica capacidad, escalabilidad ni rendimiento de ningún entorno.


### ✅ NFR-REQ-003 — Definir tiempos máximos de respuesta

**Estado:** APROBADA
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal
**Tarea anterior:** `NFR-REQ-002 — Definir volumen, concurrencia y crecimiento esperado` — APROBADA
**Siguiente tarea reservada:** `NFR-REQ-004 — Definir comportamiento offline y sincronización` — NO INICIADA
**Artefactos producidos:** `NFR-RESPONSE-TIME-CONTRACT-001`; `NFR-PROCESS-RESPONSE-MATRIX-001`; `NFR-TIMEOUT-AND-UNKNOWN-RESULT-POLICY-001`
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`
**Naturaleza:** contrato de latencia, acuse, finalización, timeout y transición asíncrona; no optimización física ni implementación
**Cambios en código, migraciones, Supabase, aplicaciones, infraestructura o despliegues:** no autorizados

---

#### 1. Propósito

Definir tiempos máximos de respuesta verificables para las interacciones, consultas, comandos, trabajos asíncronos, integraciones y periféricos que participan en los procesos de Vento OS, de modo que la experiencia, la seguridad operacional y la capacidad técnica se diseñen contra presupuestos explícitos y no contra expresiones ambiguas como “rápido”, “en tiempo real” o “casi inmediato”.

```text
TIEMPO DE RESPUESTA
≠ TIEMPO TOTAL DEL PROCESO
≠ DISPONIBILIDAD
≠ RTO
≠ TIEMPO DE ATENCIÓN HUMANA

ACUSE RECIBIDO
≠ RESULTADO AUTORITATIVO
≠ EFECTO FÍSICO COMPLETADO
```

La aprobación de esta tarea congela presupuestos iniciales de diseño. No declara que los entornos actuales ya los cumplan ni sustituye las mediciones y pruebas de carga requeridas por cada paquete.

---

#### 2. Continuidad lógica

`NFR-REQ-001` definió criticidad y ventanas de disponibilidad. `NFR-REQ-002` definió volumen, concurrencia, picos y crecimiento. Con esas dos entradas ya es posible fijar cuánto puede tardar cada clase de interacción bajo una carga declarada antes de degradarse, pasar a segundo plano, quedar pendiente o activar contingencia.

```text
CRITICIDAD Y DISPONIBILIDAD
+
CARGA, CONCURRENCIA Y CRECIMIENTO
        ↓
PRESUPUESTO DE RESPUESTA
        ↓
TIMEOUT, PENDIENTE, RESULTADO DESCONOCIDO O ASÍNCRONO
        ↓
OFFLINE, HARDWARE, OBSERVABILIDAD Y RECUPERACIÓN
```

---

#### 3. Distinciones canónicas

| Concepto               | Definición                                                                                |
| ---------------------- | ----------------------------------------------------------------------------------------- |
| feedback local         | reacción visual, háptica o sonora producida sin esperar al servidor                       |
| acuse de intención     | confirmación de que la aplicación recibió la acción y empezó a procesarla                 |
| acuse autoritativo     | receipt del servicio propietario que acepta o rechaza la intención                        |
| resultado autoritativo | estado empresarial persistido y consultable después de aplicar reglas                     |
| finalización física    | impresión, pago, lectura, entrega u otra consecuencia fuera del servidor                  |
| latencia end-to-end    | tiempo desde la intención humana o evento emisor hasta el resultado observable            |
| espera de cola         | tiempo antes de iniciar la ejecución de un trabajo aceptado                               |
| tiempo de servicio     | duración de la ejecución una vez iniciada                                                 |
| deadline empresarial   | instante máximo para producir un resultado, aunque sea mediante contingencia              |
| timeout técnico        | límite de espera de una llamada o capa; no demuestra por sí solo que la operación falló   |
| hard ceiling de UX     | límite antes de cambiar explícitamente a pendiente, asíncrono, desconocido o contingencia |

```text
TIMEOUT DEL CLIENTE
≠ OPERACIÓN NO EJECUTADA

SPINNER VISIBLE
≠ PROGRESO DEMOSTRADO
```

---

#### 4. Contrato mínimo de presupuesto de respuesta

Cada operación material deberá declarar:

```text
process_id
process_step_id
operation_id
operation_kind
actor_and_device_profile
workload_profile_version
response_class
async_class
measurement_start_event
ack_event
authoritative_end_event
physical_end_event
p50_target
p95_target
p99_target_when_required
hard_ceiling
timeout_behavior
unknown_result_behavior
cancel_behavior
retry_and_idempotency_policy
degraded_behavior
dependency_budget_refs[]
measurement_environment
evidence_source
owner
review_triggers[]
```

No se medirá una operación sin un evento inicial y un evento final inequívocos. “La pantalla se sintió lenta” será un hallazgo válido, pero no sustituirá una medición reproducible.

---

#### 5. Presupuestos universales de interacción

Estos límites se aplican a todas las superficies compatibles, incluso cuando la operación empresarial tarde más:

| Presupuesto                                     | Objetivo inicial | Hard ceiling | Regla                                                         |
| ----------------------------------------------- | ---------------: | -----------: | ------------------------------------------------------------- |
| reacción al toque, tecla o selección            |   `≤ 100 ms` p95 |     `200 ms` | el control debe responder visualmente sin esperar al servidor |
| mostrar acuse, carga, pendiente o bloqueo       |   `≤ 300 ms` p95 |     `500 ms` | ninguna acción queda silenciosa                               |
| mostrar progreso determinista                   |          `≤ 1 s` |        `2 s` | obligatorio cuando el resultado no será inmediato             |
| reanudación caliente de una superficie          |      `≤ 1 s` p95 |        `2 s` | conserva contexto y muestra frescura                          |
| arranque frío hasta shell utilizable            |      `≤ 3 s` p95 |        `5 s` | puede diferir datos secundarios, no identidad ni contexto     |
| navegación operativa hasta contenido utilizable |      `≤ 2 s` p95 |        `5 s` | no cuenta un skeleton vacío como contenido utilizable         |

Los presupuestos se validarán en dispositivos, red y perfiles aprobados. Un equipo fuera de compatibilidad no podrá utilizarse para rebajar silenciosamente el objetivo canónico.

---

#### 6. Clases de respuesta foreground

| Clase | Uso                                                                           | p95 inicial | p99 inicial | Hard ceiling | Comportamiento al superarlo                                                           |
| ----- | ----------------------------------------------------------------------------- | ----------: | ----------: | -----------: | ------------------------------------------------------------------------------------- |
| `R1`  | decisión crítica, seguridad, acceso, pago o control que habilita continuar    |       `1 s` |       `2 s` |        `3 s` | bloquear nueva intención, mostrar estado y activar consulta de receipt o contingencia |
| `R2`  | operación táctil ordinaria, escaneo, movimiento, pedido, producción o entrega |       `2 s` |       `4 s` |        `5 s` | conservar contexto y pasar a pendiente o reintento seguro                             |
| `R3`  | consulta o caso administrativo estándar                                       |       `3 s` |       `6 s` |        `8 s` | mostrar progreso y permitir cancelar o continuar en segundo plano                     |
| `R4`  | comparación, cálculo o consulta compleja todavía interactiva                  |       `5 s` |      `10 s` |       `15 s` | dejar de bloquear la pantalla y convertirse en trabajo asíncrono                      |

Los valores anteriores son presupuestos end-to-end para el resultado foreground bajo la envolvente aprobada. No son cuotas exclusivas de base de datos, red o frontend.

Para procesos `C0`, `C1`, `K3` o `K4`, el paquete deberá demostrar también p99 o un escenario equivalente de estrés. Para cargas `L0` y `L1`, donde un percentil alto puede carecer de estabilidad estadística, se utilizarán escenarios repetibles y el hard ceiling.

---

#### 7. Clases de trabajo asíncrono

| Clase | Acuse y job ID | Primera actualización |                     Finalización inicial |     Hard ceiling |
| ----- | -------------: | --------------------: | ---------------------------------------: | ---------------: |
| `A1`  |        `≤ 2 s` |               `≤ 5 s` |                             `≤ 30 s` p95 |           `60 s` |
| `A2`  |        `≤ 2 s` |               `≤ 5 s` |                            `≤ 2 min` p95 |          `5 min` |
| `A3`  |        `≤ 2 s` |              `≤ 10 s` | deadline explícito del proceso o paquete | nunca indefinido |

`A3` aplica a cierres, cálculos amplios, importaciones, conciliaciones, publicaciones o reportes cuyo límite correcto es un corte empresarial y no una espera de interfaz. Deberá declarar propietario, deadline, progreso, cancelación, reintento, resultado parcial y conciliación.

```text
TRABAJO ASÍNCRONO ACEPTADO
→ JOB ID O RECEIPT
→ ESTADO CONSULTABLE
→ RESULTADO, RECHAZO O CONCILIACIÓN
```

---

#### 8. Inicio y final de la medición

| Caso              | Inicio                    | Fin                                                                   |
| ----------------- | ------------------------- | --------------------------------------------------------------------- |
| toque o teclado   | evento de entrada         | primer cambio visual correspondiente                                  |
| navegación        | intención de navegar      | identidad, contexto, estado y acción principal utilizables            |
| consulta          | solicitud emitida         | datos autoritativos o stale claramente identificado                   |
| mutación          | confirmación humana       | receipt y estado autoritativo consultable                             |
| escaneo           | código decodificado       | recurso resuelto o razón de rechazo visible                           |
| archivo           | confirmación de carga     | receipt de archivo y metadatos; procesamiento se mide aparte          |
| impresión         | creación del print job    | aceptación de la cola; envío e impresión física se miden aparte       |
| integración       | evento recibido o emitido | acuse del contrato propietario; efectos downstream se miden separados |
| trabajo asíncrono | aceptación con job ID     | estado terminal o parcial explícito                                   |

No se detendrá el cronómetro al ocultar un modal, mostrar un toast o cambiar la URL si el resultado empresarial aún no está disponible.

---

#### 9. Lecturas, mutaciones y resultados desconocidos

Una consulta vencida podrá reintentarse cuando no produzca efectos. Una mutación vencida no se marcará automáticamente como fallida.

```text
MUTACIÓN ENVIADA
+ RESPUESTA NO RECIBIDA
        ↓
RESULT_UNKNOWN
        ↓
CONSULTAR IDEMPOTENCY KEY, RECEIPT Y RECURSO
        ↓
CONFIRMAR, REINTENTAR LA MISMA INTENCIÓN O CONCILIAR
```

Reglas:

- el timeout del navegador no creará una nueva intención;
- el reintento conservará la misma clave de idempotencia;
- el botón no volverá a habilitarse como si nada hubiera ocurrido;
- el usuario verá qué está confirmado, pendiente, rechazado o desconocido;
- pagos, inventario, producción, custodia y handoffs nunca utilizarán reintento ciego;
- la recuperación exacta se vincula con `UX-BASE-013`, `UX-BASE-014`, `NFR-REQ-004` y `QUEUE-ARC-*`.

---

#### 10. Progreso, cancelación y espera

Cuando una operación supere `1 s`, la interfaz mostrará estado comprensible. Cuando pueda superar el hard ceiling de `R4`, deberá convertirse en trabajo asíncrono antes de bloquear la superficie.

Un indicador de progreso deberá distinguir:

```text
PREPARANDO
EN COLA
PROCESANDO
ESPERANDO DEPENDENCIA
PARCIAL
COMPLETADO
RECHAZADO
CANCELANDO
REQUIERE CONCILIACIÓN
```

La cancelación solo se presentará cuando exista semántica real. Cerrar una ventana no cancelará automáticamente una operación ya aceptada.

---

#### 11. Arranque, navegación y reanudación

El arranque y la navegación deberán priorizar:

1. identidad del actor;
2. dispositivo y aplicación;
3. sede, área, turno y contexto activo;
4. estado de conectividad y frescura;
5. tarea y acción principal;
6. contenido secundario.

La aplicación no esperará a cargar dashboards, historiales o catálogos secundarios para mostrar una superficie operativa segura. La reanudación verificará checkpoint y contexto conforme a `UX-BASE-014`; una pantalla rápida con contexto obsoleto no cumple el presupuesto.

---

#### 12. Búsqueda, filtros y recetarios

- el feedback de escritura o selección será local y cumplirá `≤ 100 ms`;
- una búsqueda ordinaria deberá entregar resultados `R2` o explicar que continúa;
- un filtro administrativo complejo podrá usar `R3` o `R4`;
- cambiar de área en los POS multiárea deberá resolver contexto y bandeja en `R2`;
- abrir una receta vigente durante producción deberá cumplir `R1` cuando la versión ya está disponible localmente o `R2` cuando requiere consulta autoritativa;
- un recetario no ocultará que la versión está vencida, en caché o pendiente de validación para aparentar rapidez.

---

#### 13. Escáneres y captura táctil

Presupuestos iniciales:

| Etapa                                       |          Objetivo | Hard ceiling |
| ------------------------------------------- | ----------------: | -----------: |
| decodificar código recibido                 |    `≤ 300 ms` p95 |     `500 ms` |
| mostrar que el código fue leído             |    `≤ 100 ms` p95 |     `200 ms` |
| resolver producto, LOC, LPN, pedido o tarea | clase `R1` o `R2` |  según clase |
| registrar cantidad o evidencia local        |        `≤ 300 ms` |     `500 ms` |
| confirmar efecto autoritativo               |        clase `R2` |        `5 s` |

Un escaneo duplicado, fuera de contexto o no reconocido deberá responder dentro del mismo presupuesto y no quedar silenciosamente descartado.

---

#### 14. Impresión y otros periféricos

```text
PRINT JOB ACEPTADO
≠ ENVIADO A LA IMPRESORA
≠ IMPRESO
≠ ENTREGADO
```

Presupuestos iniciales:

- creación y receipt del print job: `≤ 2 s`;
- resolución de routing: `≤ 3 s`;
- aceptación o error del adaptador: `≤ 5 s`;
- confirmación física, cuando sea verificable: `≤ 10 s` o estado pendiente explícito;
- lectura de báscula, terminal de pago, cámara o lector: feedback local `≤ 300 ms`; resultado final según contrato del periférico.

La reimpresión será una intención nueva y auditable. Un timeout no repetirá automáticamente el documento, cobro o etiqueta.

---

#### 15. Integraciones y servicios externos

La interfaz interna no esperará indefinidamente a un proveedor. Cada contrato externo deberá declarar:

```text
CONNECT TIMEOUT
READ TIMEOUT
RETRY BUDGET
RATE LIMIT
BACKOFF
CIRCUIT BREAKER
IDEMPOTENCY
RECONCILIATION DEADLINE
```

El acuse interno de un trabajo con proveedor deberá cumplir `≤ 2 s` cuando pueda continuar asíncronamente. Pago, documento fiscal, pedido externo, banco o entrega de tercero conservarán un estado `PENDING_EXTERNAL`, `RESULT_UNKNOWN`, `REJECTED` o `CONFIRMED`; no se anunciarán como completados solo porque la solicitud salió de Vento OS.

---

#### 16. Operación offline y reconexión

Esta tarea solo fija la experiencia temporal; `NFR-REQ-004` definirá qué operaciones pueden existir offline y cómo sincronizan.

- una captura local permitida cumplirá feedback y acuse local inmediatos;
- “guardado en este equipo” no se presentará como resultado autoritativo;
- al reconectar, el usuario verá el tamaño de la cola y el progreso dentro de `1 s`;
- el drenaje de backlog será `A1`, `A2` o `A3` según volumen y dependencias;
- el procesamiento respetará backpressure para no degradar las interacciones foreground;
- una operación con resultado desconocido se resolverá antes de crear otra intención equivalente.

---

#### 17. Superficies administrativas, reportes y exportaciones

Las superficies densas podrán utilizar `R3` o `R4`, pero no bloquearán una sesión con cálculos largos.

- filtros y ordenamientos ordinarios: `R3`;
- comparación o agregación compleja: `R4`;
- exportación o cálculo pequeño: `A1`;
- conciliación, cierre o informe amplio: `A2` o `A3`;
- la solicitud devolverá job ID, parámetros, versión, propietario y deadline;
- la descarga no se habilitará antes de validar autorización y versión;
- resultados parciales no se presentarán como totales completos.

---

#### 18. Carga, percentiles y ambientes de prueba

Los presupuestos se evaluarán contra los perfiles de `NFR-REQ-002`:

```text
CURRENT_BASELINE
APPROVED_12M
PLAUSIBLE_24M
STRESS_SCENARIO
```

Cada resultado declarará:

- ambiente y versión;
- dispositivo y navegador;
- red y latencia introducida;
- volumen y concurrencia;
- datos y cardinalidad;
- caché fría o caliente;
- dependencia simulada o real;
- percentil;
- errores, timeouts y saturación;
- evidencia reproducible.

Un resultado de desarrollo local sin carga, datos o dependencias representativas no certificará el presupuesto de un paquete.

---

#### 19. Descomposición técnica posterior

El presupuesto end-to-end se distribuirá posteriormente entre:

```text
CLIENTE Y RENDER
RED
AUTH Y CONTEXTO
SERVICIO PROPIETARIO
BASE DE DATOS
COLA
DEPENDENCIA EXTERNA
PERIFÉRICO
```

Esta tarea no asigna todavía porcentajes fijos a cada capa. La descomposición dependerá de la arquitectura aprobada en E3, E4, X y del paquete concreto. Optimizar una capa sin medir el resultado end-to-end no demostrará cumplimiento.

---

#### 20. Saturación y backpressure

Cuando la carga supere la envolvente aprobada, la respuesta deberá degradarse de forma controlada:

```text
PRIORIZAR R1 Y R2
→ LIMITAR R4 Y TRABAJOS MASIVOS
→ APLICAR COLA Y BACKPRESSURE
→ MOSTRAR CAPACIDAD O ESPERA
→ NO PERDER NI DUPLICAR EFECTOS
```

La saturación no podrá producir confirmaciones falsas, pérdida silenciosa, timeout masivo sin estado, retries simultáneos o bloqueo de controles de seguridad e inocuidad.

---

#### 21. Observabilidad y alertas posteriores

`NFR-REQ-009` definirá dashboards y alertas, pero cada operación deberá quedar diseñada para medir:

- feedback local;
- tiempo a acuse;
- tiempo a resultado autoritativo;
- espera y servicio de cola;
- dependencia externa;
- tiempo de periférico;
- percentiles y hard ceiling;
- error, timeout, cancelación y resultado desconocido;
- correlación con proceso, etapa, actor, dispositivo, sede y área sin exponer datos sensibles.

---

#### 22. Matriz inicial de tiempos por proceso

La matriz asigna una clase foreground y una clase asíncrona inicial. Las clases son presupuestos de diseño y deberán medirse por paquete; no afirman cumplimiento actual.

| Proceso                                                                                                                                                                   | Criticidad / carga | Foreground | Asíncrono | Override obligatorio                                                                                |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------ | ---------- | --------- | --------------------------------------------------------------------------------------------------- |
| `VPROC-0001` — Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                            | `C2` / `L1` / `K1` | `R3`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0002` — Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                          | `C3` / `L1` / `K1` | `R3`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0003` — Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                      | `C2` / `L2` / `K2` | `R2`       | —         | consulta de política o delegación vigente → `R1` cuando habilita una decisión operativa             |
| `VPROC-0004` — Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                            | `C2` / `L2` / `K2` | `R2`       | `A1`      | aceptación de handoff o transferencia de custodia → `R2` con resultado autoritativo                 |
| `VPROC-0005` — Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                         | `C4` / `L1` / `K1` | `R4`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0006` — Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                         | `C3` / `L1` / `K1` | `R4`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0007` — Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                            | `C2` / `L2` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0008` — Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                     | `C2` / `L2` / `K3` | `R2`       | —         | marcación de entrada o salida → `R1` para acuse y `R2` para confirmación                            |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                       | `C1` / `L1` / `K2` | `R2`       | `A1`      | reemplazo que deja un área sin cobertura → `R1`                                                     |
| `VPROC-0010` — Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                             | `C2` / `L2` / `K1` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0011` — Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                            | `C1` / `L1` / `K1` | `R1`       | —         | revocación de acceso → `R1`; cierre documental puede continuar en `A2`                              |
| `VPROC-0012` — Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                              | `C2` / `L2` / `K2` | `R3`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                              | `C0` / `L0` / `K2` | `R1`       | —         | la respuesta física nunca espera al sistema; registro digital → `R1`                                |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                | `C0` / `L2` / `K2` | `R1`       | —         | control que habilita continuar producción o servicio → `R1`                                         |
| `VPROC-0015` — Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                           | `C2` / `L2` / `K2` | `R2`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0016` — Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                 | `C1` / `L2` / `K2` | `R2`       | `A2`      | consulta de receta publicada en producción → `R1`; edición y publicación → `R3`/`A2`                |
| `VPROC-0017` — Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                    | `C1` / `L2` / `K3` | `R2`       | `A1`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0018` — Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                    | `C0` / `L2` / `K2` | `R1`       | —         | alérgeno o restricción en decisión de producto → `R1`                                               |
| `VPROC-0019` — Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                           | `C2` / `L2` / `K2` | `R3`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0020` — Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                   | `C3` / `L1` / `K1` | `R4`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0021` — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                   | `C2` / `L2` / `K2` | `R3`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0022` — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                         | `C1` / `L2` / `K2` | `R2`       | `A1`      | aceptación o rechazo de recepción física → `R2`; archivos pueden continuar en `A1`                  |
| `VPROC-0023` — Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                     | `C1` / `L2` / `K2` | `R2`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0024` — Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                            | `C1` / `L3` / `K3` | `R2`       | `A1`      | movimiento con escaneo → `R2`; fan-out y proyecciones → `A1`                                        |
| `VPROC-0025` — Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                 | `C1` / `L3` / `K3` | `R2`       | `A1`      | retiro o traslado que afecta disponibilidad inmediata → `R2`                                        |
| `VPROC-0026` — Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                       | `C2` / `L3` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0027` — Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                           | `C0` / `L2` / `K2` | `R1`       | `A1`      | cuarentena, frío o disposición → `R1`                                                               |
| `VPROC-0028` — Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                             | `C1` / `L3` / `K3` | `R2`       | `A1`      | claim, despacho, entrega y recepción → `R2`; conciliación → `A1`                                    |
| `VPROC-0029` — Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                              | `C2` / `L2` / `K2` | `R2`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0030` — Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                           | `C1` / `L2` / `K2` | `R2`       | —         | falla de frío, gas, energía o seguridad → `R1`                                                      |
| `VPROC-0031` — Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                              | `C1` / `L2` / `K2` | `R2`       | —         | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0032` — Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                | `C2` / `L3` / `K3` | `R2`       | `A1`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0033` — Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                       | `C1` / `L2` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0034` — Preparar materiales y ejecutar producción contra una versión aprobada                                                                                      | `C1` / `L3` / `K3` | `R2`       | `A1`      | consulta de receta, lote y siguiente paso → `R1`; registro ordinario → `R2`                         |
| `VPROC-0035` — Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                             | `C0` / `L2` / `K2` | `R1`       | `A2`      | decisión de liberar o retener → `R1`                                                                |
| `VPROC-0036` — Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                              | `C1` / `L3` / `K3` | `R2`       | `A1`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0037` — Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                               | `C2` / `L2` / `K2` | `R2`       | `A1`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0038` — Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                      | `C1` / `L3` / `K3` | `R2`       | `A1`      | pedido, cambio de estado y cobro → `R2`; cierres y conciliación → `A1`/`A3`                         |
| `VPROC-0039` — Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                             | `C1` / `L3` / `K3` | `R2`       | `A1`      | cobro y entrega correlacionados → `R1`/`R2`                                                         |
| `VPROC-0040` — Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                               | `C1` / `L3` / `K4` | `R2`       | `A1`      | acuse del pedido externo → `R2`; normalización y conciliación → `A1`                                |
| `VPROC-0041` — Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                     | `C2` / `L1` / `K2` | `R4`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0042` — Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                         | `C1` / `L2` / `K2` | `R2`       | `A1`      | anulación, devolución o reversa → `R1`/`R2` con estado desconocido protegido                        |
| `VPROC-0043` — Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                               | `C1` / `L3` / `K4` | `R1`       | `A1`      | confirmación de pago → `R1`; proveedor externo nunca autoriza doble cobro                           |
| `VPROC-0044` — Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                | `C1` / `L2` / `K1` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0045` — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                | `C3` / `L3` / `K4` | `R2`       | `A1`      | identificación en caja → `R2`; acumulación o ledger secundario → `A1`                               |
| `VPROC-0046` — Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                         | `C2` / `L1` / `K2` | `R3`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0047` — Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                     | `C2` / `L2` / `K2` | `R3`       | `A1`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0048` — Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                | `C1` / `L2` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0049` — Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                        | `C1` / `L2` / `K3` | `R2`       | `A1`      | confirmación de entrega, rechazo o retorno → `R2`                                                   |
| `VPROC-0050` — Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                 | `C1` / `L2` / `K4` | `R2`       | `A1`      | estado del tercero → `R2`; conciliación → `A1`                                                      |
| `VPROC-0051` — Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                            | `C1` / `L3` / `K4` | `R2`       | `A1`      | evento económico aceptado → `R2`; proyecciones y conciliación → `A1`                                |
| `VPROC-0052` — Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                              | `C2` / `L2` / `K1` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0053` — Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                 | `C2` / `L2` / `K2` | `R3`       | `A1`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0054` — Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas                                                                  | `C3` / `L3` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0055` — Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                    | `C1` / `L2` / `K2` | `R2`       | `A1`      | hallazgo que impide operar → `R1`                                                                   |
| `VPROC-0056` — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                  | `C3` / `L2` / `K4` | `R4`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0057` — Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                    | `C3` / `L2` / `K3` | `R3`       | `A1`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                      | `C1` / `L2` / `K2` | `R1`       | `A2`      | incidente crítico → `R1`; diagnóstico o adjuntos → `A2`                                             |
| `VPROC-0059` — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                   | `C0` / `L1` / `K4` | `R1`       | `A1`      | revocación, bloqueo o cambio de acceso → `R1`                                                       |
| `VPROC-0060` — Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                 | `C2` / `L3` / `K4` | `R3`       | `A2`      | acuse de carga y metadatos → `R3`; análisis de archivo → `A2`                                       |
| `VPROC-0061` — Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                               | `C4` / `L3` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0062` — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                   | `C0` / `L0` / `K3` | `R1`       | `A1`      | activación de contingencia → `R1`; recuperación y conciliación → `A1`/`A2`                          |
| `VPROC-0063` — Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento              | `C2` / `L1` / `K1` | `R4`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0064` — Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado                   | `C2` / `L1` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0065` — Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada                              | `C4` / `L1` / `K1` | `R4`       | `A2`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0066` — Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección                                              | `C0` / `L2` / `K2` | `R1`       | `A1`      | validación de requisito de EPP antes de una tarea → `R1`                                            |
| `VPROC-0067` — Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor | `C2` / `L2` / `K2` | `R2`       | `A1`      | verificación de completitud del kit en entrega o devolución → `R2`                                  |
| `VPROC-0068` — Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido                                  | `C4` / `L2` / `K4` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |
| `VPROC-0069` — Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable           | `C3` / `L3` / `K2` | `R4`       | `A3`      | las etapas ordinarias conservan la clase principal; una excepción material deberá declarar override |

La distribución inicial es:

```text
FOREGROUND
R1   11 procesos
R2   29 procesos
R3   10 procesos
R4   19 procesos

ASÍNCRONO PRINCIPAL PERMITIDO
A1   29 procesos
A2   13 procesos
A3   12 procesos
—    15 procesos
```

La ausencia de una clase asíncrona en la matriz no prohíbe evidencia o telemetría posterior; indica que el resultado principal del proceso no debe diferirse ordinariamente a un job.

---

#### 23. Pruebas obligatorias por clase

| Clase | Prueba mínima                                                                                                              |
| ----- | -------------------------------------------------------------------------------------------------------------------------- |
| `R1`  | carga nominal, p95, p99 o escenario equivalente, dependencia lenta, timeout después de enviar, idempotencia y contingencia |
| `R2`  | carga nominal y pico, concurrencia de escritura, doble toque, red degradada y reanudación                                  |
| `R3`  | cardinalidad creciente, filtros, permisos, caché fría y cancelación                                                        |
| `R4`  | agregación, dataset amplio, progreso, conversión a asíncrono y protección del foreground                                   |
| `A1`  | acuse, job ID, reintento, cancelación, resultado terminal y expiración                                                     |
| `A2`  | backlog, prioridad, recuperación, resultado parcial, dead-letter y conciliación                                            |
| `A3`  | deadline, corte, dependencia externa, reanudación, rollback y evidencia de cierre                                          |

Las pruebas deberán fallar cuando solo el promedio cumple, cuando el hard ceiling deja la pantalla bloqueada o cuando una mutación vencida puede repetirse con un efecto nuevo.

---

#### 24. Requisitos de prueba derivados

Se incorporan al registro canónico completo los siguientes requisitos derivados de `NFR-REQ-003`:

| ID              | Regla protegida                                                                                 |
| --------------- | ----------------------------------------------------------------------------------------------- |
| `TREQ-PROC-271` | separar feedback local, acuse, resultado autoritativo, finalización física y tiempo empresarial |
| `TREQ-PROC-272` | exigir eventos de inicio y fin inequívocos para toda medición                                   |
| `TREQ-PROC-273` | evaluar p50, p95, p99 cuando aplique y hard ceiling; prohibir aprobación por promedio           |
| `TREQ-PROC-274` | cumplir presupuestos universales de toque, acuse, progreso, arranque y navegación               |
| `TREQ-PROC-275` | aplicar clases `R1` a `R4` bajo carga y ambiente declarados                                     |
| `TREQ-PROC-276` | convertir esperas largas en `A1`, `A2` o `A3` con receipt y estado consultable                  |
| `TREQ-PROC-277` | impedir acciones silenciosas, spinners indefinidos y progreso ficticio                          |
| `TREQ-PROC-278` | tratar timeout de mutación como resultado desconocido hasta consultar receipt                   |
| `TREQ-PROC-279` | conservar idempotency key y evitar reintentos que creen una intención nueva                     |
| `TREQ-PROC-280` | diferenciar lectura, mutación, trabajo asíncrono, integración y efecto físico                   |
| `TREQ-PROC-281` | cumplir tiempos de arranque, navegación, reanudación y contexto visible                         |
| `TREQ-PROC-282` | cumplir respuesta de búsqueda, filtros, cambio de área y consulta de receta                     |
| `TREQ-PROC-283` | cumplir feedback, decodificación y resolución de escáneres sin descartar errores                |
| `TREQ-PROC-284` | separar receipt, routing, adaptador e impresión física; impedir duplicados                      |
| `TREQ-PROC-285` | gobernar timeout, retry, rate limit y conciliación de integraciones externas                    |
| `TREQ-PROC-286` | distinguir captura local, sincronización y drenaje de backlog al reconectar                     |
| `TREQ-PROC-287` | convertir reportes, exportaciones y conciliaciones largas en jobs auditables                    |
| `TREQ-PROC-288` | probar presupuestos con perfiles actuales, 12 meses, 24 meses y estrés                          |
| `TREQ-PROC-289` | medir dispositivo, red, datos, caché, dependencia y versión del ambiente                        |
| `TREQ-PROC-290` | aplicar backpressure priorizando `R1` y `R2` sin pérdida ni confirmación falsa                  |
| `TREQ-PROC-291` | instrumentar tiempos por capa y correlación end-to-end sin exponer datos sensibles              |
| `TREQ-PROC-292` | probar cancelación, expiración, resultado parcial y recuperación de jobs                        |
| `TREQ-PROC-293` | validar overrides críticos y modalidades multiárea, periféricos y red degradada                 |
| `TREQ-PROC-294` | cubrir los 69 procesos con clase, override, prueba y evidencia por paquete                      |

```text
NFR-REQ-003 APROBADA
→ 04A REGENERADO COMPLETO
→ TREQ-PROC-271 A TREQ-PROC-294 INCORPORADOS
→ ÚLTIMA TAREA INCORPORADA = NFR-REQ-003
```

---

#### 25. Relación con tareas posteriores

| Decisión posterior                                | Tarea propietaria                                                  |
| ------------------------------------------------- | ------------------------------------------------------------------ |
| operación offline, sincronización y cola local    | `NFR-REQ-004`                                                      |
| privacidad de métricas, payloads y trazas         | `NFR-REQ-005`                                                      |
| retención de mediciones y evidencia               | `NFR-REQ-006`                                                      |
| accesibilidad del feedback y progreso             | `NFR-REQ-007`                                                      |
| dispositivo, red, escáner, impresora y periférico | `NFR-REQ-008`                                                      |
| instrumentación, SLI, SLO, alertas y soporte      | `NFR-REQ-009`                                                      |
| recuperación, RTO y RPO                           | `NFR-REQ-010`; `CONT-DOM-002` a `CONT-DOM-004`                     |
| compatibilidad de navegadores y dispositivos      | `NFR-REQ-011`                                                      |
| índices, planes y rendimiento de datos            | `SUPA-AUD-020`; `SUPA-ARC-021`                                     |
| colas, prioridad, backpressure y dead-letter      | `QUEUE-ARC-001` a `QUEUE-ARC-012`                                  |
| contratos y timeouts externos                     | `INT-APP-*`; `INT-EXT-*`; `INT-POS-*`                              |
| impresión y adaptadores                           | `PRINT-ARC-001` a `PRINT-ARC-020`                                  |
| pruebas, archivos exactos y aceptación            | `DELIV-PKG-013`; `DELIV-PKG-016`; `DELIV-PKG-017`; `DELIV-PKG-025` |

No queda ningún presupuesto técnico específico de una capa como pendiente narrativo; se resolverá en la arquitectura o paquete propietario correspondiente.

---

#### 26. Criterios de aceptación

- [ ] Feedback, acuse, resultado autoritativo, efecto físico y deadline empresarial están separados.
- [ ] Cada medición tiene evento inicial, evento final, alcance, carga, ambiente y versión.
- [ ] Se definen presupuestos universales y clases `R1` a `R4`.
- [ ] Se definen trabajos `A1` a `A3` con receipt, estado, cancelación y deadline.
- [ ] Un timeout de mutación no se presenta automáticamente como fallo ni habilita reintento ciego.
- [ ] Ninguna operación queda silenciosa o en spinner indefinido.
- [ ] Arranque, navegación, reanudación, búsqueda y cambio de área tienen límites explícitos.
- [ ] Escáneres, impresión, pagos e integraciones separan sus etapas y estados.
- [ ] Offline local y sincronización autoritativa no se confunden.
- [ ] Reportes y trabajos largos dejan de bloquear el foreground.
- [ ] Los presupuestos se prueban bajo carga, concurrencia, crecimiento y estrés definidos en `NFR-REQ-002`.
- [ ] Saturación y backpressure priorizan operaciones críticas sin perder ni duplicar efectos.
- [ ] Cada uno de `VPROC-0001` a `VPROC-0069` tiene clase foreground, clase asíncrona y override cuando corresponde.
- [ ] Los identificadores `TREQ-PROC-271` a `TREQ-PROC-294` están incorporados en el registro canónico completo.
- [ ] No se modifica código, Supabase, migraciones, infraestructura ni operación.
- [ ] `NFR-REQ-004` permanece no iniciada.

---

#### 27. Estado y continuidad

```text
NFR-REQ-001  APROBADA
NFR-REQ-002  APROBADA
NFR-REQ-003  APROBADA
NFR-REQ-004  NO INICIADA
```

La aprobación de esta tarea congela los presupuestos iniciales e incorpora sus requisitos al registro canónico completo. No certifica que ninguna aplicación, consulta, integración o periférico ya cumpla dichos tiempos.


### ✅ NFR-REQ-004 — Definir comportamiento offline y sincronización

**Estado:** APROBADA
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal
**Tarea anterior:** `NFR-REQ-003 — Definir tiempos máximos de respuesta` — APROBADA
**Siguiente tarea reservada:** `NFR-REQ-005 — Definir privacidad y sensibilidad` — NO INICIADA
**Artefactos propuestos:** `NFR-OFFLINE-SYNC-CONTRACT-001`; `NFR-PROCESS-OFFLINE-MATRIX-001`; `NFR-LOCAL-OPERATION-ENVELOPE-001`; `NFR-SYNC-RECONCILIATION-POLICY-001`
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`
**Naturaleza:** contrato no funcional de conectividad parcial, trabajo local, outbox, sincronización, idempotencia, conflicto y conciliación; no implementación de Service Workers, bases locales, colas ni infraestructura
**Cambios en código, migraciones, Supabase, aplicaciones, dispositivos, red o despliegues:** no autorizados

---

#### 1. Propósito

Convertir los principios aprobados en `UX-BASE-013` y `UX-BASE-014` en un contrato no funcional verificable por proceso, operación y estación, definiendo qué puede consultarse, redactarse, observarse, capturarse o ejecutarse cuando la conectividad o un servicio requerido no están plenamente disponibles, y cómo debe sincronizarse posteriormente sin duplicar efectos, perder atribución, ampliar autoridad ni ocultar conflictos.

```text
OFFLINE
≠ COPIA LOCAL DE TODA LA APLICACIÓN

SINCRONIZAR
≠ REPRODUCIR CIEGAMENTE UNA LISTA DE REQUESTS

CONECTIVIDAD RECUPERADA
≠ SISTEMA LISTO PARA ENVIAR

CAPTURA LOCAL
≠ RESULTADO EMPRESARIAL CONFIRMADO

REINTENTO
≠ NUEVA OPERACIÓN
```

La aprobación de esta tarea congelará políticas y envolventes iniciales de diseño. No declarará que ninguna aplicación actual sea offline-capable ni autorizará persistencia local o ejecución diferida antes de implementar y probar los controles correspondientes.

---

#### 2. Continuidad lógica

```text
CRITICIDAD Y DISPONIBILIDAD
NFR-REQ-001
        +
VOLUMEN, CONCURRENCIA Y CRECIMIENTO
NFR-REQ-002
        +
RESPUESTA, TIMEOUT Y RESULTADO DESCONOCIDO
NFR-REQ-003
        +
COMPORTAMIENTO HUMANO ANTE CONECTIVIDAD E INTERRUPCIÓN
UX-BASE-013 Y UX-BASE-014
        ↓
POLÍTICA OFFLINE Y SINCRONIZACIÓN POR OPERACIÓN
NFR-REQ-004
        ↓
PRIVACIDAD, RETENCIÓN, HARDWARE, OBSERVABILIDAD Y RECUPERACIÓN
NFR-REQ-005 A NFR-REQ-011
```

`UX-BASE-013` ya establece estados visibles, frescura, autorización offline, orden causal, conflictos, contingencia y reconexión. `UX-BASE-014` establece checkpoints, reanudación y resultados desconocidos. Esta tarea no reabre esas decisiones: las traduce en perfiles obligatorios, límites medibles, prioridades de sincronización y una matriz de cobertura para los 69 procesos.

---

#### 3. Unidad de decisión

La política offline pertenecerá a la operación y a su etapa, no a la aplicación completa.

```text
PROCESS_ID
+
PROCESS_STEP
+
OPERATION_ID
+
BUSINESS_EFFECT
+
ACTOR Y DISPOSITIVO
+
RECURSO Y VERSIÓN
+
FRESCURA REQUERIDA
+
DEPENDENCIAS
+
SENSIBILIDAD
=
PERFIL OFFLINE
```

Por tanto:

```text
NEXO ES OFFLINE
FOGO ES OFFLINE
PULSO ES OFFLINE
```

son afirmaciones inválidas. Una misma pantalla puede permitir consulta cacheada, captura local y una acción obligatoriamente en línea, cada una con estados y límites distintos.

---

#### 4. Vector de disponibilidad requerido

La conectividad no se reducirá a `navigator.onLine` ni a la existencia de Wi-Fi. Cada operación declarará cuáles componentes necesita:

```text
TRANSPORTE DE RED
SERVICIO DE IDENTIDAD Y SESIÓN
RESOLUCIÓN DE ACCESS CONTEXT
SERVICIO PROPIETARIO DEL DOMINIO
SERVICIO DE SINCRONIZACIÓN
RELOJ CONFIABLE
ALMACENAMIENTO LOCAL SEGURO
DEPENDENCIA EXTERNA
PERIFÉRICO
```

Estados iniciales:

```text
ONLINE_STABLE
ONLINE_DEGRADED
PARTIAL_SERVICE
OFFLINE_CONFIRMED
CONNECTIVITY_UNKNOWN
RECOVERING_SYNC
SYNC_BLOCKED
```

Una operación solo se considerará disponible cuando todos sus componentes obligatorios estén utilizables o exista un perfil degradado aprobado. Wi-Fi conectado con Auth, Supabase, proveedor, datáfono o impresora indisponibles no será `ONLINE_STABLE`.

---

#### 5. Clases canónicas de capacidad offline

| Clase                    | Nombre                          | Permite                                                                 | No permite por sí sola                                               |
| ------------------------ | ------------------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `OF0_ONLINE_ONLY`        | únicamente en línea             | preparar información no persistente y explicar el bloqueo               | crear una intención durable ni afirmar efecto                        |
| `OF1_CACHED_REFERENCE`   | referencia cacheada             | consultar una versión identificada con frescura visible                 | editar, publicar o tratar la caché como verdad vigente               |
| `OF2_LOCAL_DRAFT`        | borrador local                  | redactar o preparar trabajo todavía no enviado                          | reservar recursos, cambiar estado ni producir efecto                 |
| `OF3_LOCAL_CAPTURE`      | captura local revalidable       | registrar observaciones, evidencia o hechos físicos para revisión       | asumir aceptación, autorización o impacto empresarial                |
| `OF4_LEASED_EXECUTION`   | ejecución offline bajo envelope | ejecutar un conjunto finito de operaciones previamente autorizadas      | ampliar alcance, extender vigencia o encadenar trabajo no autorizado |
| `OF5_MANUAL_CONTINGENCY` | contingencia física gobernada   | mantener resultado mínimo mediante procedimiento numerado y conciliable | convertirse en canal digital alterno permanente                      |

Una operación podrá combinar clases, pero deberá declarar cuál es aplicable a cada acción. `OF4` exige un envelope emitido previamente; `OF5` no equivale a una cola digital.

---

#### 6. Contrato mínimo de operación local

Toda intención durable creada en el dispositivo deberá conservar, como mínimo:

```text
local_operation_id
idempotency_key
process_id
process_step
operation_kind
business_effect_requested
principal_id
actor_id
device_id
context_id_observed
site_id
area_id
shift_id
checkin_id
resource_refs[]
observed_resource_versions[]
authorization_envelope_ref
schema_version
payload_hash
payload_minimized
observed_at
created_local_at
queued_at
dependency_operation_ids[]
expires_at
freshness_requirements[]
sensitivity_class
evidence_refs[]
retry_count
sync_priority
sync_state
last_sync_attempt_at
last_error_class
receipt_refs[]
```

La forma es documental. No autoriza una tabla, IndexedDB, SQLite, Service Worker, caché o proveedor concreto.

---

#### 7. Estados de una operación local

```text
DRAFT_LOCAL
CAPTURED_LOCAL
QUEUED
WAITING_DEPENDENCY
VALIDATING
SYNCING
ACCEPTED_PENDING_EFFECT
CONFIRMED
REJECTED
CONFLICT
RESULT_UNKNOWN
EXPIRED
SUPERSEDED
QUARANTINED
RECONCILIATION_REQUIRED
DISCARDED_WITH_REASON
```

Reglas:

- `CAPTURED_LOCAL` no se mostrará como guardado en servidor;
- `QUEUED` no significa aceptado;
- `ACCEPTED_PENDING_EFFECT` no significa terminado;
- `CONFIRMED` exige receipt o estado autoritativo verificable;
- `RESULT_UNKNOWN` bloquea un nuevo intento independiente;
- `QUARANTINED` conserva el dato sin ejecutarlo cuando esquema, actor, autorización o versión no son compatibles;
- ningún estado terminal se inferirá por ocultar una pantalla o reiniciar el dispositivo.

---

#### 8. Prioridades y deadlines de sincronización

| Clase                | Regla                                                                                |            Objetivo inicial después de conectividad estable |
| -------------------- | ------------------------------------------------------------------------------------ | ----------------------------------------------------------: |
| `SYNC-0_BLOCKING`    | debe reconciliarse antes de cualquier acción dependiente                             |          sin operación dependiente hasta resultado terminal |
| `SYNC-1_URGENT`      | seguridad, acceso, dinero, custodia, inventario o continuidad                        | inicio `≤ 15 s`; resultado o conflicto visible `≤ 60 s` p95 |
| `SYNC-2_OPERATIONAL` | trabajo ordinario del turno que afecta colas o handoffs                              |        inicio `≤ 60 s`; resultado o conflicto `≤ 5 min` p95 |
| `SYNC-3_CYCLE`       | debe quedar reconciliado antes de cierre, corte, publicación o cambio de responsable |                                deadline explícito del ciclo |
| `SYNC-4_DEFERRED`    | borrador o actividad planificable sin efecto inmediato                               |         deadline explícito; nunca almacenamiento indefinido |

El tiempo empieza después de confirmar conectividad estable, hora válida, sesión, dispositivo, contexto, esquema y servicios requeridos. No incluye el tiempo durante el cual una dependencia obligatoria sigue indisponible, pero ese periodo deberá permanecer visible y medirse por separado.

---

#### 9. Frescura y caché

Se preservan las clases aprobadas:

```text
REAL_TIME_REQUIRED
SHORT_LIVED
SHIFT_SCOPED
DAY_SCOPED
VERSION_SCOPED
REFERENCE_LONG_LIVED
```

Toda entrada cacheada declarará:

```text
source
source_version
fetched_at
valid_until
freshness_class
scope
sensitivity
stale_behavior
```

Una versión expirada podrá permitir lectura histórica o referencia controlada, pero no habilitará una nueva mutación que requiera estado vigente. Permisos, claims, saldos, disponibilidad para prometer, custodia y estados transaccionales no se convertirán en autoridad por estar cacheados.

---

#### 10. Autorización offline

`OF4_LEASED_EXECUTION` solo será admisible con un envelope verificable y finito que declare:

```text
actor
dispositivo
sitio y área
capacidad exacta
recurso o conjunto finito
secuencia permitida
límites cuantitativos
emitido_en
vence_en
versión de política
condiciones de revocación
condiciones de revalidación
```

```text
PERMISO CONOCIDO ANTES
≠ PERMISO VÁLIDO AHORA

ENVELOPE VENCIDO
→ NO CREA NUEVAS MUTACIONES
→ PUEDE CONSERVAR EVIDENCIA YA OBSERVADA
```

Al sincronizar se revalidarán identidad, vínculo, turno, check-in, contexto, dispositivo, permiso, denegaciones, recurso, versión y vigencia. Un rechazo de autorización no borrará una observación física; la enviará al estado de evidencia o conciliación que corresponda.

---

#### 11. Orden causal y dependencias

La outbox no será una lista FIFO global. Cada operación declarará dependencias y partición lógica.

```text
SOLICITUD
→ PREPARACIÓN
→ CARGA
→ ENTREGA
→ RECEPCIÓN
```

Reglas:

1. una operación dependiente no se sincroniza antes de su prerequisito;
2. un rechazo terminal bloquea o reclasifica dependientes;
3. operaciones independientes pueden avanzar;
4. actores, áreas y contextos distintos no comparten una secuencia implícita;
5. prioridad no altera causalidad;
6. una operación `SUPERSEDED` nunca se ejecuta después;
7. la cola conserva una secuencia estable por recurso cuando existe contención;
8. el detalle físico de retry, backoff, dead-letter y workers pertenece a `QUEUE-ARC-001` a `QUEUE-ARC-012`.

---

#### 12. Secuencia canónica de reconexión

```text
1. ESTABILIZAR CONECTIVIDAD
2. VERIFICAR HORA, DNS Y SERVICIOS REQUERIDOS
3. REVALIDAR SESIÓN Y DISPOSITIVO
4. RESOLVER ACCESS CONTEXT NUEVO
5. DESCARGAR REVOCACIONES, VERSIONES Y POLÍTICAS
6. VALIDAR ESQUEMA DE OPERACIONES LOCALES
7. CONSULTAR RECEIPTS E IDEMPOTENCY KEYS
8. CLASIFICAR PENDIENTES, EXPIRADOS Y CONFLICTOS
9. ORDENAR POR DEPENDENCIA Y PRIORIDAD
10. SINCRONIZAR SIN BLOQUEAR TRABAJO FOREGROUND
11. DETENER LA RAMA AFECTADA ANTE CONFLICTO
12. ACTUALIZAR PROYECCIONES
13. MOSTRAR RESUMEN HUMANO Y PENDIENTES RESTANTES
```

Recuperar acceso a internet no enviará automáticamente toda la cola. La recuperación parcial de un servicio no habilitará operaciones que dependan de otro servicio todavía indisponible.

---

#### 13. Idempotencia, timeout y resultado desconocido

Toda mutación durable tendrá una idempotency key estable desde antes del primer envío.

```text
TIMEOUT
→ CONSULTAR RECEIPT
→ CONSULTAR RECURSO
→ REUTILIZAR LA MISMA INTENCIÓN
→ NUNCA CREAR OTRA PARA “PROBAR”
```

Para pagos, inventario, producción, puntos, impresión, facturación, custodia, claims y handoffs:

- un timeout produce `RESULT_UNKNOWN`;
- un reintento conserva intención, actor, contexto, payload hash e idempotency key;
- una respuesta tardía deberá reconciliarse con el estado visible;
- el usuario no verá un CTA limpio que permita duplicar el efecto;
- si no existe evidencia suficiente, la operación pasa a revisión o contingencia, no a éxito ni fallo inventados.

---

#### 14. Conflictos

Clases mínimas:

```text
RESOURCE_VERSION_CONFLICT
CONTEXT_CHANGED
AUTHORIZATION_CHANGED
DUPLICATE_OPERATION
DEPENDENCY_REJECTED
SCHEMA_INCOMPATIBLE
BUSINESS_STATE_CHANGED
QUANTITY_CONFLICT
CUSTODY_CONFLICT
TIME_WINDOW_EXPIRED
CLOCK_INVALID
LOCAL_STORAGE_CORRUPTED
```

Queda prohibido `last write wins` para efectos empresariales. Resoluciones permitidas, según proceso:

```text
ACCEPT_SERVER_STATE
REAPPLY_ALLOWED_FIELDS
CREATE_CORRECTION
SPLIT_OPERATION
ESCALATE
DISCARD_LOCAL_DRAFT
MANUAL_RECONCILIATION
```

El sistema explicará qué cambió, qué se conserva, qué no se ejecutó, si el hecho físico ocurrió, quién puede resolver y cuál es la siguiente acción segura.

---

#### 15. Capacidad, antigüedad y backpressure local

Cada cola o almacén local declarará:

```text
max_operations
max_bytes
max_attachment_bytes
max_age_by_operation
warning_threshold
hard_threshold
eviction_policy
quarantine_policy
manual_contingency_trigger
```

Reglas:

- no se descartará silenciosamente la operación más antigua;
- no se reemplazará una operación por otra sin relación explícita de supersession;
- al llegar al umbral de advertencia se mostrará riesgo y antigüedad;
- al llegar al hard threshold se aplicará backpressure, solo lectura, pausa segura o contingencia;
- evidencia obligatoria no se elimina para liberar espacio;
- la capacidad se validará contra las bandas `L0` a `L4`, ráfagas y backlog de `NFR-REQ-002`.

---

#### 16. Aplicación, esquema y ciclo de vida

Las operaciones deberán sobrevivir, según política, a recarga, suspensión, cierre accidental, reinicio y pérdida breve de energía. No se ejecutarán en segundo plano sin revalidar actor, envelope, dispositivo, esquema, red, cancelación y dependencias.

Ante una actualización:

```text
ESQUEMA COMPATIBLE
→ migrar y validar

ESQUEMA TRANSFORMABLE
→ transformar con versión y prueba

ESQUEMA INCOMPATIBLE
→ QUARANTINED
→ conservar evidencia
→ revisión o conciliación
```

Desinstalar, limpiar almacenamiento, cambiar de navegador o restablecer el dispositivo deberá tener una política explícita de advertencia, custodia y recuperación. `NFR-REQ-011` definirá compatibilidad mínima por dispositivo; `NFR-REQ-005` y `NFR-REQ-006` definirán sensibilidad y retención.

---

#### 17. Tiempo y orden de los hechos

Se distinguirán:

```text
observed_at
created_local_at
first_send_at
accepted_at
business_effect_at
confirmed_at
reconciled_at
```

La hora de sincronización no reemplazará la hora de observación. Un reloj local fuera de tolerancia deberá marcar el dato, impedir operaciones sensibles dependientes del tiempo y usar orden de servidor o secuencia lógica cuando corresponda.

---

#### 18. Dispositivos compartidos y multiárea

Toda partición local incluirá:

```text
DEVICE_ID
+
ACTOR_ID
+
CONTEXT_ID
+
SITE_ID
+
AREA_ID
```

Al cambiar de actor o área:

- se detienen nuevas mutaciones de la partición anterior;
- no se transfieren borradores, cola, claims ni custodia;
- se protege la visibilidad de pendientes del actor anterior;
- se resuelve una sesión y contexto nuevos;
- las operaciones pendientes conservan atribución original;
- sin mecanismo de identidad offline aprobado, la estación pasa a consulta o contingencia.

En los POS táctiles de Repostería y Pastelería y Tortas, cada operación conservará área exacta, receta versionada, lote, actor y cola separados. Un selector local nunca amplía permiso ni convierte las áreas en una sola.

---

#### 19. Archivos y evidencia

Estados mínimos:

```text
LOCAL_ONLY
QUEUED
UPLOADING
UPLOADED_UNLINKED
LINKED_AND_CONFIRMED
FAILED_RETRYABLE
FAILED_TERMINAL
QUARANTINED
```

- un archivo subido parcialmente no es evidencia confirmada;
- hash, operation ID o clave estable evitan duplicados;
- el recurso no se cierra si falta evidencia obligatoria;
- tamaño, tipo, sensibilidad y retención se validan antes y después de subir;
- la evidencia se vincula al hecho observado, no solo a la hora de upload;
- la eliminación local posterior exige confirmación y política aprobada.

---

#### 20. Periféricos e integraciones parciales

Backend, impresora, escáner, datáfono, cámara, balanza y proveedor externo tendrán estados independientes.

```text
BACKEND OFFLINE + IMPRESORA LOCAL DISPONIBLE
≠ IMPRESIÓN EMPRESARIAL CONFIRMADA

BACKEND ONLINE + DATÁFONO SIN RESPUESTA
≠ PAGO FALLIDO
```

Cada interacción declarará comando, receipt, ejecución física, resultado conocido o desconocido, posibilidad de reintento y conciliación. Los límites físicos y de red corresponden a `NFR-REQ-008`; contratos de integración a `INT-APP-*` e `INT-EXT-*`.

---

#### 21. Contingencia manual

Toda contingencia deberá definir:

```text
condición de activación
responsable
formato o identificador
numeración
datos mínimos
control de duplicados
custodia
momento y actor del hecho
momento de digitalización
responsable de conciliación
criterio de cierre
```

La digitalización posterior no copiará ciegamente: consultará si el efecto ya existe, relacionará el soporte, preservará actor original, distinguirá observación, transcripción y aprobación, y cerrará la contingencia solo después de reconciliar.

---

#### 22. Matriz inicial por proceso

La matriz clasifica la envolvente de diseño. No afirma que el flujo actual esté implementado, cifrado, probado o certificado para operar offline.

| Proceso                                                                                                                                         | Perfil offline inicial                                                                     | Prioridad de sincronización | Frontera obligatoriamente en línea                                                                            |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | --------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` — Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                  | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-3_CYCLE`              | La aprobación, asignación definitiva y cierre requieren confirmación en línea.                                |
| `VPROC-0002` — Mantener estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                    | `OF1_CACHED_REFERENCE`                                                                     | `SYNC-4_DEFERRED`           | Las modificaciones maestras y su publicación son únicamente en línea.                                         |
| `VPROC-0003` — Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                            | `OF1_CACHED_REFERENCE`                                                                     | `SYNC-1_URGENT`             | La edición, delegación y revocación requieren confirmación autoritativa en línea.                             |
| `VPROC-0004` — Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                  | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-2_OPERATIONAL`        | El handoff, la aceptación y el cambio de responsable son en línea o quedan en conciliación.                   |
| `VPROC-0005` — Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                               | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-4_DEFERRED`           | Publicación, decisión y creación de vínculo requieren estado autoritativo en línea.                           |
| `VPROC-0006` — Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                               | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                                                      | `SYNC-3_CYCLE`              | Habilitación, identidad laboral y accesos solo se confirman en línea.                                         |
| `VPROC-0007` — Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                  | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-3_CYCLE`              | Publicar, cambiar cobertura o sustituir un turno exige confirmación en línea.                                 |
| `VPROC-0008` — Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                           | `OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                                               | `SYNC-2_OPERATIONAL`        | La captura local conserva actor, dispositivo y hora; la corrección y aprobación son en línea.                 |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                             | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                                                      | `SYNC-2_OPERATIONAL`        | La aprobación y reasignación efectiva de cobertura requieren servicio autoritativo.                           |
| `VPROC-0010` — Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                   | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-3_CYCLE`              | Cálculo final, aprobación, emisión y conciliación permanecen en línea.                                        |
| `VPROC-0011` — Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                  | `OF1_CACHED_REFERENCE + OF5_MANUAL_CONTINGENCY`                                            | `SYNC-1_URGENT`             | La revocación digital no puede simularse offline; la contención manual se reconcilia de inmediato.            |
| `VPROC-0012` — Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                    | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-2_OPERATIONAL`        | Hallazgos críticos activan contención; el cierre y aceptación del riesgo son en línea.                        |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                    | `OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                                               | `SYNC-1_URGENT`             | La respuesta física no depende del sistema; el expediente se reconcilia sin perder hora ni actor.             |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                      | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | La versión aplicable debe ser verificable; bloqueos y desviaciones críticas se reconcilian primero.           |
| `VPROC-0015` — Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                 | `OF1_CACHED_REFERENCE`                                                                     | `SYNC-3_CYCLE`              | Crear, modificar o publicar maestros y equivalencias exige conexión.                                          |
| `VPROC-0016` — Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                       | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-1_URGENT`             | La receta aprobada puede consultarse por versión; aprobación y publicación son en línea.                      |
| `VPROC-0017` — Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                          | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE`                                                 | `SYNC-1_URGENT`             | Publicar disponibilidad, precio u oferta exige confirmación y propagación en línea.                           |
| `VPROC-0018` — Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                          | `OF1_CACHED_REFERENCE`                                                                     | `SYNC-1_URGENT`             | La consulta offline solo usa versión vigente conocida; cambios y publicación son en línea.                    |
| `VPROC-0019` — Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                 | `OF3_LOCAL_CAPTURE`                                                                        | `SYNC-3_CYCLE`              | La consolidación y priorización autoritativa se realizan al sincronizar.                                      |
| `VPROC-0020` — Comparar proveedores y condiciones con evidencia suficiente para decidir                                                         | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-4_DEFERRED`           | La selección, aprobación y compromiso económico requieren información vigente en línea.                       |
| `VPROC-0021` — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                         | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-0_BLOCKING`           | Aprobar, emitir o modificar una orden de compra es únicamente en línea.                                       |
| `VPROC-0022` — Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica               | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | La observación física puede capturarse; la recepción definitiva y efecto económico requieren conciliación.    |
| `VPROC-0023` — Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                           | `OF1_CACHED_REFERENCE`                                                                     | `SYNC-1_URGENT`             | Los cambios de topología, estado o disponibilidad de ubicación son en línea.                                  |
| `VPROC-0024` — Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                  | `OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION`                                                 | `SYNC-0_BLOCKING`           | Solo un envelope finito permite ejecución offline; el siguiente movimiento depende de reconciliación.         |
| `VPROC-0025` — Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                       | `OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION + OF5_MANUAL_CONTINGENCY`                        | `SYNC-0_BLOCKING`           | No se promete stock ni se encadenan consumos sobre existencias no reconciliadas.                              |
| `VPROC-0026` — Contar como observación, investigar diferencias y ajustar mediante decisión separada                                             | `OF3_LOCAL_CAPTURE`                                                                        | `SYNC-2_OPERATIONAL`        | El conteo se captura offline; investigar, aprobar y ajustar permanecen separados y en línea.                  |
| `VPROC-0027` — Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                 | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | La contención física es inmediata; liberar, disponer o ajustar exige autoridad y conciliación.                |
| `VPROC-0028` — Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                   | `OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION`                                                 | `SYNC-1_URGENT`             | Cada etapa conserva operación propia; handoff y recepción digital requieren confirmación o conciliación.      |
| `VPROC-0029` — Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                    | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION`                          | `SYNC-1_URGENT`             | La transferencia de custodia no se confirma localmente sin lease y aceptación posterior.                      |
| `VPROC-0030` — Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                 | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | La inmovilización física puede ser inmediata; cierre, disposición y garantía se confirman en línea.           |
| `VPROC-0031` — Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                    | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-2_OPERATIONAL`        | Kilometraje e incidencias pueden capturarse; habilitación y asignación vigente deben reconciliarse.           |
| `VPROC-0032` — Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                      | `OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION + OF5_MANUAL_CONTINGENCY`                        | `SYNC-2_OPERATIONAL`        | Entrega y retorno físicos se observan; custodia digital se confirma después de reconciliar.                   |
| `VPROC-0033` — Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                             | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-3_CYCLE`              | Publicar o reprogramar producción requiere demanda e inventario vigentes.                                     |
| `VPROC-0034` — Preparar materiales y ejecutar producción contra una versión aprobada                                                            | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION`                          | `SYNC-1_URGENT`             | La receta versionada y el lote delimitan el envelope; consumos y resultados se reconcilian causalmente.       |
| `VPROC-0035` — Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                   | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-0_BLOCKING`           | La retención física puede aplicarse offline; liberar o rechazar definitivamente exige confirmación.           |
| `VPROC-0036` — Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                    | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION`                          | `SYNC-1_URGENT`             | Etiqueta y ubicación deben vincularse al lote; impresión local no equivale a registro confirmado.             |
| `VPROC-0037` — Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                     | `OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION`                                                 | `SYNC-2_OPERATIONAL`        | La captura puede continuar; el cierre del lote y los efectos de inventario esperan conciliación.              |
| `VPROC-0038` — Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                            | `OF1_CACHED_REFERENCE + OF4_LEASED_EXECUTION + OF5_MANUAL_CONTINGENCY`                     | `SYNC-0_BLOCKING`           | Pedidos pueden operar bajo envelope; pago, cierre y resultado fiscal no admiten confirmación local ficticia.  |
| `VPROC-0039` — Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                   | `OF1_CACHED_REFERENCE + OF4_LEASED_EXECUTION + OF5_MANUAL_CONTINGENCY`                     | `SYNC-0_BLOCKING`           | La entrega y el cobro deben quedar correlacionados; un datáfono sin respuesta produce resultado desconocido.  |
| `VPROC-0040` — Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                     | `OF1_CACHED_REFERENCE`                                                                     | `SYNC-1_URGENT`             | La aceptación, deduplicación y transferencia de pedidos externos requieren conectividad con el canal.         |
| `VPROC-0041` — Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                           | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-3_CYCLE`              | Aprobación de capacidad, facturación y compromiso contractual son en línea.                                   |
| `VPROC-0042` — Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                               | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-0_BLOCKING`           | Modificar, anular, devolver o compensar efectos confirmados es únicamente en línea.                           |
| `VPROC-0043` — Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                     | `OF5_MANUAL_CONTINGENCY`                                                                   | `SYNC-0_BLOCKING`           | Pago y soporte fiscal son online por defecto; todo timeout queda como resultado desconocido.                  |
| `VPROC-0044` — Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                      | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                             | `SYNC-0_BLOCKING`           | El conteo puede capturarse; el cierre y cambio de responsable requieren confirmación autoritativa.            |
| `VPROC-0045` — Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                      | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-0_BLOCKING`           | Saldo, acumulación y redención nunca se confirman desde caché ni se duplican por reintento.                   |
| `VPROC-0046` — Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                               | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                                                      | `SYNC-3_CYCLE`              | La compensación y devolución son en línea; alertas de seguridad escalan a SYNC-1.                             |
| `VPROC-0047` — Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                           | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-3_CYCLE`              | La reserva solo queda confirmada con capacidad autoritativa y receipt.                                        |
| `VPROC-0048` — Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                      | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-3_CYCLE`              | Publicar ruta, asignar vehículo y liberar despacho requieren estado vigente.                                  |
| `VPROC-0049` — Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                              | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION + OF5_MANUAL_CONTINGENCY` | `SYNC-1_URGENT`             | Prueba de entrega puede capturarse localmente; custodia y cierre se reconcilian sin duplicar.                 |
| `VPROC-0050` — Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                       | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-2_OPERATIONAL`        | Eventos del tercero son online; una observación manual no sustituye el estado del proveedor.                  |
| `VPROC-0051` — Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                  | `OF3_LOCAL_CAPTURE`                                                                        | `SYNC-1_URGENT`             | Los eventos pueden quedar en outbox; contabilización y efecto financiero son autoritativos en línea.          |
| `VPROC-0052` — Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                    | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-0_BLOCKING`           | Aprobación, pago, cancelación y conciliación bancaria son únicamente en línea.                                |
| `VPROC-0053` — Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                       | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                                                      | `SYNC-1_URGENT`             | La evidencia puede capturarse; aplicar recaudo o compensar diferencias requiere confirmación.                 |
| `VPROC-0054` — Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas                                        | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-3_CYCLE`              | Cálculo final, publicación, cierre y versión presupuestal requieren procesamiento autoritativo.               |
| `VPROC-0055` — Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                          | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | Controles físicos continúan; hallazgos que condicionan apertura se reconcilian prioritariamente.              |
| `VPROC-0056` — Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                        | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-4_DEFERRED`           | Aprobar, publicar o retirar contenido y promociones es en línea.                                              |
| `VPROC-0057` — Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                          | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                                                      | `SYNC-3_CYCLE`              | La entrada automática depende del canal; la captura manual se deduplica al sincronizar.                       |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                            | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | La contención puede ser manual; asignación, cierre y conocimiento se reconcilian con evidencia.               |
| `VPROC-0059` — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                         | `OF1_CACHED_REFERENCE + OF5_MANUAL_CONTINGENCY`                                            | `SYNC-0_BLOCKING`           | Conceder, cambiar o revocar acceso es online; la contención manual no simula revocación completada.           |
| `VPROC-0060` — Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                       | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                                                      | `SYNC-2_OPERATIONAL`        | Archivos usan estados propios; carga parcial o archivo local no equivale a evidencia vinculada.               |
| `VPROC-0061` — Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                     | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-4_DEFERRED`           | Agregaciones, publicación de resultados y decisiones se calculan con datos reconciliados.                     |
| `VPROC-0062` — Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                         | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | La operación mínima puede ser manual; la recuperación digital no se declara completa antes de conciliar.      |
| `VPROC-0063` — Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado                         | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                               | `SYNC-3_CYCLE`              | Aceptar riesgo, cambiar tratamiento o cerrar acción requiere versión autoritativa.                            |
| `VPROC-0064` — Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar propiedad interna          | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                               | `SYNC-3_CYCLE`              | La presentación formal y sus acuses dependen del canal o autoridad en línea.                                  |
| `VPROC-0065` — Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con privacidad aprobada                    | `OF2_LOCAL_DRAFT`                                                                          | `SYNC-4_DEFERRED`           | Datos sensibles no persisten localmente salvo política cifrada; decisiones y publicación son en línea.        |
| `VPROC-0066` — Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección                    | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF5_MANUAL_CONTINGENCY`                        | `SYNC-1_URGENT`             | La entrega física puede capturarse; habilitación de trabajo depende de evidencia reconciliada o contingencia. |
| `VPROC-0067` — Definir kit, instancia, componentes, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor | `OF1_CACHED_REFERENCE + OF3_LOCAL_CAPTURE + OF4_LEASED_EXECUTION + OF5_MANUAL_CONTINGENCY` | `SYNC-2_OPERATIONAL`        | Completitud y custodia se capturan; préstamo, devolución y sustitución se reconcilian causalmente.            |
| `VPROC-0068` — Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido        | `OF2_LOCAL_DRAFT + OF3_LOCAL_CAPTURE`                                                      | `SYNC-4_DEFERRED`           | Compensaciones y cambios de consentimiento son autoritativos en línea.                                        |
| `VPROC-0069` — Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación                                | `OF1_CACHED_REFERENCE + OF2_LOCAL_DRAFT`                                                   | `SYNC-3_CYCLE`              | Aprobación, vigencia, consumo reservado y cierre de versión son en línea.                                     |

---

#### 23. Lectura de la matriz

La columna de perfil es una clasificación inicial por proceso. Cada etapa deberá descomponerse antes de implementación. En particular:

- `OF1` no permite mutar usando datos stale;
- `OF2` no reserva ni bloquea recursos;
- `OF3` captura hechos y evidencia, no decisiones finales;
- `OF4` requiere envelope, límites, expiración e idempotencia;
- `OF5` mantiene el resultado mínimo por un procedimiento físico gobernado;
- `SYNC-0` bloquea trabajo dependiente hasta resolver;
- una misma operación puede escalar de `SYNC-3` a `SYNC-1` por seguridad, inocuidad, acceso, dinero o custodia.

---

#### 24. Observabilidad mínima

Sin definir todavía la plataforma física, deberán poder medirse:

```text
time_offline
queue_depth
queue_bytes
oldest_pending_age
sync_attempts
sync_latency
conflicts_by_class
unknown_results
duplicates_prevented
operations_expired
operations_quarantined
manual_contingencies
reconciliation_duration
local_storage_pressure
schema_migration_failures
```

Guardrails:

```text
EFECTO DUPLICADO POR REINTENTO = 0
OPERACIÓN LOCAL MOSTRADA COMO CONFIRMADA = 0
BORRADOR O COLA TRANSFERIDOS ENTRE ACTORES = 0
MUTACIÓN CON ENVELOPE VENCIDO = 0
CONFLICTO EMPRESARIAL RESUELTO POR LAST WRITE WINS = 0
EVIDENCIA O PENDIENTE ELIMINADOS SILENCIOSAMENTE = 0
```

La instrumentación detallada, dashboards y alertas pertenecen a `NFR-REQ-009`, `OBS-ARC-*` y `QUEUE-ARC-011`. Las métricas no se utilizarán para atribuir al trabajador fallas de red o infraestructura.

---

#### 25. Pruebas obligatorias

Cada capacidad aplicable deberá probar:

1. red lenta y pérdida antes de enviar;
2. pérdida durante envío;
3. ejecución del servidor seguida de pérdida de respuesta;
4. reconexión breve y nueva caída;
5. servicio parcial;
6. sesión expirada;
7. permiso o dispositivo revocado;
8. cambio de actor, área, turno y check-in;
9. dos dispositivos sobre el mismo recurso;
10. operación duplicada;
11. dependencia rechazada;
12. operación expirada;
13. esquema antiguo y actualización con pendientes;
14. almacenamiento cerca del límite, lleno y corrupto;
15. reloj local incorrecto;
16. reinicio y pérdida de energía;
17. archivo parcialmente cargado;
18. backend y periférico con disponibilidad divergente;
19. backlog de reconexión bajo carga foreground;
20. contingencia manual y reconciliación;
21. cola multiárea en los POS del Centro de Producción;
22. recuperación del checkpoint sin heredar autoridad.

Las pruebas de implementación corresponden a los paquetes E5, `QUEUE-ARC-*`, `SHELL-CI-*`, bloques `R`, `T`, `U`, `UX-QA-*` y tareas por aplicación. Esta tarea solo congela el contrato.

---

#### 26. Propiedad de decisiones posteriores

| Decisión                                        | Tarea propietaria                                                  |
| ----------------------------------------------- | ------------------------------------------------------------------ |
| sensibilidad, cifrado y minimización local      | `NFR-REQ-005`                                                      |
| trazabilidad, retención y eliminación           | `NFR-REQ-006`                                                      |
| accesibilidad de estados y conflictos           | `NFR-REQ-007`; `UX-QA-001` a `UX-QA-030`                           |
| hardware, red, almacenamiento y periféricos     | `NFR-REQ-008`                                                      |
| métricas, soporte y alertas                     | `NFR-REQ-009`; `OBS-ARC-*`                                         |
| respaldo, RTO y RPO                             | `NFR-REQ-010`; `CONT-DOM-002` a `CONT-DOM-004`                     |
| compatibilidad de dispositivo, navegador y SO   | `NFR-REQ-011`                                                      |
| checkpoints y reanudación                       | `UX-BASE-014` y tareas de materialización por aplicación           |
| identidad y límites del dispositivo             | `AUTH-DEV-001` a `AUTH-DEV-016`                                    |
| contrato físico de colas, retries y dead-letter | `QUEUE-ARC-001` a `QUEUE-ARC-012`                                  |
| integración entre aplicaciones y proveedores    | `INT-APP-001` a `INT-APP-010`; `INT-EXT-001` a `INT-EXT-020`       |
| protección autoritativa de comandos             | `AUTH-SRV-*`; `AUTH-DB-*`; `SUPA-ARC-*`                            |
| contingencia por estación                       | `UX-STATION-007`                                                   |
| prototipo y prueba física                       | `UX-STATION-008`; tareas `*-UX-*`; `UX-QA-*`                       |
| perfiles, capacidad y certificación por paquete | `DELIV-PKG-013`; `DELIV-PKG-016`; `DELIV-PKG-017`; `DELIV-PKG-025` |

No queda una decisión diferida sin tarea o familia propietaria.

---

#### 27. Requisitos de prueba derivados

Esta propuesta incorpora al registro canónico completo:

```text
TREQ-PROC-295 a TREQ-PROC-324
```

Cobertura:

1. política por operación y no por aplicación;
2. vector real de conectividad;
3. clases `OF0` a `OF5`;
4. estados visibles de operación local;
5. envelope mínimo;
6. idempotencia estable;
7. orden causal y dependencias;
8. frescura y caché;
9. autorización offline finita;
10. aislamiento por actor, dispositivo y área;
11. privacidad de caché y almacenamiento;
12. hora de observación y secuencia temporal;
13. claims, custodia y handoffs online por defecto;
14. acciones sensibles obligatoriamente online;
15. resultado desconocido;
16. conflictos sin `last write wins`;
17. reconexión ordenada;
18. ciclo de vida y reinicio;
19. archivos y evidencia;
20. periféricos e integraciones parciales;
21. contingencia manual;
22. capacidad local y backpressure;
23. compatibilidad de esquema;
24. integridad de reloj;
25. servicios parcialmente disponibles;
26. deadlines y prioridad de sincronización;
27. prioridad del trabajo foreground frente al backlog;
28. POS compartidos multiárea;
29. matriz de `VPROC-0001` a `VPROC-0069`;
30. pruebas de fallo, observabilidad, gobierno y certificación.

Mientras la tarea permanezca en propuesta, la evidencia de estas filas deberá indicar expresamente que proviene de `NFR-REQ-004` en propuesta. Al aprobarse, la evidencia se actualizará a tarea aprobada sin cambiar los identificadores.

---

#### 28. Criterios de aceptación

- [ ] La política offline pertenece a operación, etapa, actor, dispositivo y efecto, no a la aplicación completa.
- [ ] Se distingue conectividad, servicio, sesión, contexto, frescura, periférico y confirmación.
- [ ] Las clases `OF0` a `OF5` tienen límites inequívocos.
- [ ] El contrato local conserva identidad, idempotencia, contexto, versiones, dependencias, expiración y sensibilidad.
- [ ] Los estados locales no se presentan como estados autoritativos.
- [ ] Se definen prioridades `SYNC-0` a `SYNC-4` y deadlines verificables.
- [ ] La caché conserva versión y frescura y nunca amplía autorización.
- [ ] `OF4` exige envelope previamente emitido, finito y revalidable.
- [ ] La outbox respeta dependencias, particiones y orden causal.
- [ ] La reconexión revalida sesión, dispositivo, contexto, políticas, esquema y receipts antes de enviar.
- [ ] Timeout y reintento no crean una segunda intención.
- [ ] Los conflictos empresariales nunca usan `last write wins`.
- [ ] No se eliminan silenciosamente pendientes, borradores ni evidencia por capacidad local.
- [ ] Las operaciones sobreviven al ciclo de vida solo bajo política y compatibilidad verificadas.
- [ ] Se preservan hora de observación, sincronización y confirmación por separado.
- [ ] Dispositivos compartidos aíslan actor, contexto y área.
- [ ] Archivos y periféricos conservan estados y receipts propios.
- [ ] Toda contingencia manual tiene activación, numeración, custodia y conciliación.
- [ ] Los 69 procesos tienen perfil, prioridad y frontera online iniciales.
- [ ] Se incorporan `TREQ-PROC-295` a `TREQ-PROC-324` al `04A` completo, con origen y evidencia de propuesta.
- [ ] No se implementan colas, Service Workers, almacenamiento, código, migraciones ni cambios en Supabase.
- [ ] `NFR-REQ-005` permanece no iniciada.

---

#### 29. Estado y continuidad

```text
NFR-REQ-002   APROBADA
NFR-REQ-003   APROBADA
NFR-REQ-004   APROBADA
NFR-REQ-005   NO INICIADA
```

La aprobación de esta tarea congelará el contrato y la matriz inicial. No certificará que una aplicación, dispositivo o proceso actual pueda funcionar offline.


### ✅ NFR-REQ-005 — Definir privacidad y sensibilidad

**Estado:** APROBADA
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal
**Tarea anterior:** `NFR-REQ-004 — Definir comportamiento offline y sincronización` — APROBADA
**Siguiente tarea reservada:** `NFR-REQ-006 — Definir trazabilidad y retención` — NO INICIADA
**Artefactos propuestos:** `NFR-PRIVACY-SENSITIVITY-CONTRACT-001`; `NFR-INFORMATION-HANDLING-MATRIX-001`; `NFR-PROCESS-PRIVACY-PROFILE-001`; `NFR-DATA-EXPOSURE-BOUNDARY-001`
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`
**Naturaleza:** contrato no funcional de privacidad, clasificación, sensibilidad, minimización, exposición y manejo; no dictamen jurídico, implementación criptográfica, política de retención ni certificación
**Cambios en código, migraciones, Supabase, aplicaciones, infraestructura o despliegues:** no autorizados

---

#### 1. Propósito

Definir un contrato verificable para clasificar y manejar la información de Vento OS según su sensibilidad, finalidad, identificabilidad, daño potencial, contexto, actor y canal. El objetivo es impedir que una autorización funcional correcta termine exponiendo más información de la necesaria mediante pantallas, payloads, archivos, cachés, logs, exportaciones, integraciones o ambientes no productivos.

```text
AUTORIZACIÓN PARA EJECUTAR UNA ACCIÓN
≠ AUTORIZACIÓN PARA VER TODOS SUS DATOS

ACCESO A UN PROCESO
≠ ACCESO A TODO EL EXPEDIENTE

CIFRADO
≠ MINIMIZACIÓN
≠ AUTORIZACIÓN
≠ ANONIMIZACIÓN

DATO SIN NOMBRE DIRECTO
≠ DATO ANÓNIMO
```

La aprobación de esta tarea congelará criterios iniciales de diseño. No declarará cumplimiento legal, certificación de seguridad ni adecuación de los sistemas actuales.

---

#### 2. Continuidad lógica

`NFR-REQ-001` definió criticidad y disponibilidad. `NFR-REQ-002` fijó carga y crecimiento. `NFR-REQ-003` estableció presupuestos temporales. `NFR-REQ-004` determinó qué puede existir localmente y cómo se sincroniza. Antes de definir retención en `NFR-REQ-006`, debe establecerse qué información existe, qué tan sensible es, para qué se usa y bajo qué límites puede mostrarse, copiarse, transmitirse o persistirse.

```text
PROCESO, ACTOR Y FINALIDAD
        ↓
INFORMACIÓN MÍNIMA NECESARIA
        ↓
CLASIFICACIÓN Y SENSIBILIDAD
        ↓
REGLAS DE MANEJO Y EXPOSICIÓN
        ↓
RETENCIÓN, TRAZABILIDAD Y DISPOSICIÓN
```

---

#### 3. Alcance

El contrato aplica a:

- datos estructurados y no estructurados;
- documentos, imágenes, audio, video y evidencia;
- identificadores, metadatos, relaciones y timestamps;
- datos calculados, inferidos, agregados y perfiles;
- payloads, eventos, receipts, colas y cachés;
- logs, trazas, métricas, alertas y volcados de diagnóstico;
- archivos descargados, impresos, exportados o compartidos;
- datos en producción, staging, desarrollo, pruebas y soporte;
- información alojada por aplicaciones propias o terceros;
- datos observados, capturados offline o pendientes de sincronización.

No se limita a datos personales. Recetas, precios, costos, credenciales, configuraciones, investigaciones, hallazgos de seguridad y decisiones empresariales también pueden requerir manejo restringido.

---

#### 4. Principios obligatorios

1. **Finalidad explícita:** todo uso deberá responder a una finalidad empresarial identificable.
2. **Minimización:** cada consumidor recibirá solo campos, precisión, periodo y población necesarios.
3. **Necesidad de conocer:** pertenecer a un área o tener acceso a una pantalla no concede acceso total.
4. **Separación de deberes:** consulta, modificación, aprobación, exportación y administración tendrán permisos diferenciados.
5. **Protección por defecto:** una categoría desconocida no se tratará como pública ni de bajo riesgo.
6. **Contexto efectivo:** actor, sede, área, turno, dispositivo, relación con el caso y estado condicionarán la exposición.
7. **Propagación de sensibilidad:** copias, derivados, joins, cachés y exportaciones heredarán o elevarán la clasificación.
8. **No exposición indirecta:** conteos pequeños, nombres de archivo, URLs, errores, logs y metadatos no podrán eludir el control principal.
9. **Reversibilidad controlada:** enmascarar o seudonimizar no equivale a anonimizar.
10. **Evidencia proporcional:** la prueba del control no deberá reproducir innecesariamente el dato protegido.

---

#### 5. Modelo de clasificación

Se adopta la siguiente escala inicial:

| Clase                  | Nombre                | Descripción                                                                            | Ejemplos orientativos                                                                |
| ---------------------- | --------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `S0_PUBLIC`            | pública               | divulgación aprobada para audiencia abierta                                            | menús publicados, horarios públicos, contenido comercial aprobado                    |
| `S1_INTERNAL`          | interna               | operación ordinaria sin divulgación externa                                            | instrucciones generales, catálogos internos, estados operativos no sensibles         |
| `S2_CONFIDENTIAL`      | confidencial          | acceso limitado por función, sede, relación o finalidad                                | datos de proveedores, precios acordados, casos de cliente, rutas internas            |
| `S3_RESTRICTED`        | restringida           | daño alto por exposición, alteración o correlación                                     | información laboral, financiera, disciplinaria, investigación, ubicación individual  |
| `S4_HIGHLY_RESTRICTED` | altamente restringida | secretos, salud, credenciales o información cuyo compromiso exige contención inmediata | credenciales, secretos, tokens, PIN, datos médicos, evidencia especialmente sensible |

La clase se asignará al nivel más específico útil: campo, atributo, documento, evento, expediente, agregado, archivo o conjunto. Una tabla o aplicación no tendrá necesariamente una sola sensibilidad.

---

#### 6. Dimensiones de evaluación

La clasificación deberá considerar conjuntamente:

- identificabilidad directa e indirecta;
- población afectada y posibilidad de reidentificación;
- naturaleza laboral, médica, financiera, comercial, técnica o de seguridad;
- daño físico, económico, reputacional, laboral u operacional;
- obligación contractual, regulatoria o de confidencialidad aplicable;
- precisión, granularidad, vigencia y contexto temporal;
- facilidad de copia, agregación, cruce o difusión;
- relación entre actor, titular, caso, sede y finalidad;
- exposición a terceros, dispositivos compartidos y canales externos;
- sensibilidad adquirida por inferencia o combinación.

La clasificación más restrictiva aplicable prevalecerá hasta que exista una reclasificación explícita y aprobada.

---

#### 7. Categorías mínimas de información

| Categoría                                                | Clase inicial mínima           | Regla principal                                             |
| -------------------------------------------------------- | ------------------------------ | ----------------------------------------------------------- |
| contenido público aprobado                               | `S0_PUBLIC`                    | solo la versión publicada y vigente es pública              |
| operación interna ordinaria                              | `S1_INTERNAL`                  | no divulgar externamente por defecto                        |
| clientes, contactos y consentimientos                    | `S2_CONFIDENTIAL`              | finalidad, relación y canal autorizados                     |
| proveedores, contratos y condiciones                     | `S2_CONFIDENTIAL`              | proyección mínima según compra, pago o evaluación           |
| trabajadores, turnos, asistencia y expedientes           | `S3_RESTRICTED`                | acceso propio o funcional estrictamente delimitado          |
| nómina, pagos, cuentas y decisiones financieras          | `S3_RESTRICTED`                | segregación, enmascaramiento y exportación controlada       |
| SST, salud, investigaciones y declaraciones              | `S4_HIGHLY_RESTRICTED`         | aislamiento por caso, participación y finalidad             |
| credenciales, secretos, tokens, PIN y llaves             | `S4_HIGHLY_RESTRICTED`         | nunca exponer en UI, logs, analytics ni archivos ordinarios |
| recetas, fórmulas, costos y conocimiento propietario     | `S2_CONFIDENTIAL`              | acceso por función, versión y necesidad productiva          |
| vulnerabilidades, incidentes y configuraciones sensibles | `S3_RESTRICTED`                | divulgación mínima y coordinación de contención             |
| telemetría y auditoría identificable                     | `S2_CONFIDENTIAL`              | minimizar payload y restringir drill-down                   |
| evidencia, firmas y documentos                           | clase del contenido o superior | metadatos y copias heredan sensibilidad                     |

La clasificación definitiva corresponde a `INFO-DOM-001`, `INFO-DOM-002`, `INFO-DOM-008` y contratos posteriores. Esta tarea fija el mínimo no funcional que esos contratos no podrán degradar.

---

#### 8. Sobre obligatorio de manejo

Cada categoría o proyección sensible deberá poder declarar:

```text
classification
information_owner
custodian
purpose
allowed_actor_and_context
allowed_fields
masking_rule
allowed_channels
local_storage_policy
offline_policy
export_policy
third_party_policy
logging_policy
retention_policy_reference
disposal_policy_reference
incident_route
classification_version
```

La ausencia del sobre o de una referencia resoluble bloqueará la exposición o utilizará la política más restrictiva; nunca habilitará un fallback amplio.

---

#### 9. Minimización por proyección

Las aplicaciones consumidoras no recibirán modelos completos para ocultar campos únicamente en la interfaz. Cada consulta, RPC, evento, exportación y payload deberá usar una proyección adecuada a la acción.

```text
SELECT * + OCULTAR EN UI
= CONTROL INVÁLIDO

PROYECCIÓN MÍNIMA
+ AUTORIZACIÓN EN SERVIDOR
+ PRESENTACIÓN SEGURA
= FRONTERA ACEPTABLE
```

Se minimizarán también:

- longitud y precisión;
- rango temporal;
- número de registros;
- población y granularidad geográfica;
- adjuntos y metadatos;
- identificadores correlacionables;
- campos utilizados solo para depuración.

---

#### 10. Identificadores, seudonimización y anonimización

Eliminar nombre, correo o documento no será suficiente si sede, turno, rol, timestamps, trayectoria, caso o combinación de atributos permiten reconocer a una persona.

- **enmascaramiento:** reduce exposición visual, pero conserva el dato original;
- **tokenización:** sustituye un valor mediante referencia controlada;
- **seudonimización:** reduce asociación directa, pero puede ser reversible bajo control;
- **anonimización:** exige riesgo de reidentificación suficientemente reducido y evaluación documentada;
- **agregación:** no será segura si grupos pequeños o filtros permiten inferencia.

Ninguna interfaz o reporte podrá denominar “anónimo” a un conjunto únicamente porque omitió un identificador directo.

---

#### 11. Exposición en interfaz

La interfaz deberá:

- mostrar únicamente campos necesarios para la tarea activa;
- enmascarar valores cuando la función no requiera el dato completo;
- impedir revelado por hover, HTML, atributos accesibles, autocomplete o código fuente;
- ocultar contenido durante cambio de actor, bloqueo o expiración;
- evitar información sensible en títulos, URLs, notificaciones y vistas previas;
- distinguir ausencia de permiso de ausencia del dato sin filtrar su existencia;
- aplicar protección equivalente en escritorio, móvil, kiosco, impresión y accesibilidad.

Ocultar visualmente no sustituirá autorización de servidor, RLS, RPC ni política de almacenamiento.

---

#### 12. Dispositivos compartidos y trabajo offline

`NFR-REQ-004` queda restringida por estas reglas:

- `S4_HIGHLY_RESTRICTED` será online por defecto y no persistirá localmente salvo excepción explícita;
- `S3_RESTRICTED` exigirá cifrado, aislamiento por actor, expiración y borrado verificable;
- ninguna cola transferirá información entre actores, áreas o sesiones;
- logout, cambio de turno, revocación y pérdida de contexto bloquearán visualización y sincronización;
- notificaciones locales no expondrán contenido sensible;
- thumbnails, cachés del sistema, archivos temporales y portapapeles respetarán la misma clasificación;
- una copia offline conservará finalidad, clasificación y versión de política.

El detalle físico de cifrado y almacenamiento se materializará en arquitectura y paquetes E5; esta tarea define el resultado obligatorio.

---

#### 13. Logs, métricas, trazas y soporte

No deberán aparecer secretos, tokens, PIN, credenciales, payloads completos ni documentos en logs. Para información sensible se aplicarán allowlists de campos, redacción y correlación mediante identificadores no reveladores.

Los sistemas de observabilidad deberán:

- separar correlación técnica de identidad visible;
- limitar búsqueda y drill-down;
- evitar cardinalidad basada en datos personales;
- impedir que mensajes de error reproduzcan entradas sensibles;
- registrar accesos administrativos a evidencia de diagnóstico;
- aplicar sensibilidad y retención también a dumps, screenshots y sesiones de soporte.

`NFR-REQ-009` definirá métricas y alertas; no podrá ampliar el contenido permitido por esta tarea.

---

#### 14. Exportaciones, reportes e impresión

Toda exportación deberá declarar finalidad, actor, alcance, filtros, columnas, clasificación, destino, vigencia y evidencia. El permiso de consulta ordinaria no concederá automáticamente permiso de exportación masiva.

Guardrails:

- límites de volumen y población;
- supresión o agrupación de celdas pequeñas;
- enmascaramiento de columnas no necesarias;
- marca de clasificación y contexto cuando aplique;
- descarga mediante enlace temporal y no adivinable;
- prohibición de índices públicos y URLs persistentes;
- control de copias impresas y archivos temporales;
- revocación del acceso futuro sin prometer borrar copias legítimamente custodiadas.

---

#### 15. Integraciones y terceros

Antes de transmitir información a otra aplicación o tercero se verificará:

1. finalidad y autoridad de la transferencia;
2. campos mínimos y clasificación;
3. identidad del receptor y ambiente;
4. canal y protección requeridos;
5. restricciones de reutilización;
6. tratamiento de errores, reintentos y dead-letter;
7. subencargados o destinos adicionales;
8. retorno, revocación, expiración y evidencia.

Una integración no recibirá secretos internos ni payloads completos por comodidad técnica. Webhooks, correo, mensajería, analytics y herramientas de soporte se consideran canales externos hasta que exista contrato aprobado.

---

#### 16. Datos de prueba y ambientes no productivos

Producción no se copiará íntegramente a desarrollo, demos, CI o pruebas. Se preferirán datos sintéticos. Cuando un escenario exija información representativa:

- se minimizará y transformará antes de salir del entorno autorizado;
- se documentará la necesidad;
- se limitarán usuarios y duración;
- se impedirá envío de mensajes o acciones reales;
- se verificará eliminación según `NFR-REQ-006`;
- las evidencias de prueba no incluirán secretos ni datos innecesarios.

Capturas de pantalla, grabaciones y archivos usados para soporte conservarán la clasificación del contenido.

---

#### 17. Secretos y credenciales

Contraseñas, tokens, refresh tokens, API keys, llaves privadas, PIN, códigos de recuperación y secretos de firma:

- no se almacenarán en texto claro;
- no se mostrarán nuevamente después de su creación salvo contrato específico;
- no viajarán en URLs, analytics, logs ni mensajes ordinarios;
- no se compartirán entre ambientes;
- tendrán propietario, alcance, rotación y revocación;
- no se incluirán en datos de negocio, evidencia o exportaciones;
- utilizarán mecanismos de custodia especializados definidos en arquitectura.

La presencia de un secreto en una fuente no reclasificará esa fuente como almacenamiento aceptable; obligará a retirar y contener.

---

#### 18. Datos derivados, analítica e inferencias

Un resultado agregado o calculado podrá ser más sensible que sus entradas. Segmentos pequeños, desempeño individual, fraude, salud, productividad, comportamiento, ubicación y combinaciones entre aplicaciones exigirán evaluación de inferencia.

Se prohíbe:

- crear perfiles nuevos sin finalidad y propietario;
- usar telemetría operativa para disciplina individual sin contrato aprobado;
- atribuir fallas de red o dispositivo al trabajador;
- permitir drill-down hasta personas cuando solo se autorizó análisis agregado;
- tratar una predicción como hecho confirmado;
- reutilizar datos recolectados para una finalidad incompatible por conveniencia analítica.

---

#### 19. Consentimiento, avisos y derechos

Cuando una finalidad dependa de consentimiento o autorización revocable:

- el sistema distinguirá aceptación, rechazo, retiro, expiración y versión;
- retirar consentimiento bloqueará usos futuros aplicables;
- la evidencia histórica no se sobrescribirá;
- no se agruparán finalidades independientes en una única aceptación;
- la denegación no degradará servicios que no requieran legítimamente ese uso.

El fundamento, los avisos, las solicitudes de acceso, rectificación, revocación o supresión y los requerimientos de autoridad serán definidos por `INFO-DOM-008` a `INFO-DOM-010`. Esta tarea no inventa obligaciones jurídicas.

---

#### 20. Cambio de clasificación

Toda reclasificación deberá conservar:

- clase anterior y nueva;
- motivo y alcance;
- actor autorizador;
- fecha efectiva;
- versión de política;
- copias, derivados y consumidores afectados;
- medidas de migración;
- evidencia de que no quedaron proyecciones incompatibles.

La publicación de un documento no convierte en públicos sus borradores, comentarios, metadatos, fuentes o historial. El vencimiento de una finalidad no equivale automáticamente a eliminación; `NFR-REQ-006` resolverá retención y disposición.

---

#### 21. Frontera con autorización

`AUTH-*` decide quién puede ejecutar una acción bajo un contexto. `NFR-REQ-005` limita qué información necesita esa acción y cómo puede exponerse.

```text
DECISIÓN DE AUTORIZACIÓN
        ↓
PROYECCIÓN MÍNIMA
        ↓
REGLAS DE MANEJO
        ↓
PRESENTACIÓN, TRANSMISIÓN O PERSISTENCIA
```

URL directa, manipulación de cliente, RPC, RLS, exportación, caché, búsqueda, autocomplete y soporte deberán producir el mismo límite de información.

---

#### 22. Perfil inicial por familias de proceso

| Familia                             | Procesos                                                              | Sensibilidad dominante         | Restricción inicial                                        |
| ----------------------------------- | --------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------- |
| gobierno, riesgo y autoridades      | `VPROC-0001` a `VPROC-0004`; `VPROC-0063`; `VPROC-0064`; `VPROC-0069` | `S2` a `S3`                    | acceso por expediente, finalidad y segregación             |
| talento y ciclo laboral             | `VPROC-0005` a `VPROC-0011`; `VPROC-0065`; `VPROC-0066`               | `S3` a `S4`                    | proyección individual, aislamiento y no exposición masiva  |
| SST, salud y emergencias            | `VPROC-0012` a `VPROC-0014`                                           | `S4`                           | acceso por participación y mínima información médica       |
| maestros, recetas y producto        | `VPROC-0015` a `VPROC-0018`                                           | `S1` a `S3`                    | separar publicación de conocimiento propietario            |
| proveedores y compras               | `VPROC-0019` a `VPROC-0022`                                           | `S2` a `S3`                    | condiciones, cuentas y evaluaciones restringidas           |
| inventario, activos y custodia      | `VPROC-0023` a `VPROC-0032`; `VPROC-0067`                             | `S1` a `S3`                    | ubicación, responsable y diferencias por necesidad         |
| producción y calidad                | `VPROC-0033` a `VPROC-0037`                                           | `S1` a `S3`                    | fórmulas, lotes, hallazgos y evidencia delimitados         |
| venta, caja y clientes              | `VPROC-0038` a `VPROC-0047`; `VPROC-0068`                             | `S2` a `S4`                    | separar identidad, pago, fidelización y reclamo            |
| logística y terceros                | `VPROC-0048` a `VPROC-0050`                                           | `S2` a `S3`                    | ubicación y prueba de entrega mínimas                      |
| finanzas y costos                   | `VPROC-0051` a `VPROC-0054`                                           | `S3`                           | segregación, enmascaramiento y exportación reforzada       |
| instalaciones y marketing           | `VPROC-0055` a `VPROC-0057`                                           | `S1` a `S3`                    | separar contenido público de contratos, incidentes y leads |
| tecnología y accesos                | `VPROC-0058`; `VPROC-0059`                                            | `S3` a `S4`                    | secretos fuera de tickets y diagnóstico mínimo             |
| documentos, analítica y continuidad | `VPROC-0060` a `VPROC-0062`                                           | clase del contenido o superior | herencia, agregación segura y acceso excepcional auditado  |

Cada uno de los 69 procesos deberá materializar una fila individual antes de su paquete E5. La agrupación anterior no autoriza una clase uniforme cuando una etapa o campo requiera mayor protección.

---

#### 23. Matriz obligatoria por proceso

`NFR-PROCESS-PRIVACY-PROFILE-001` deberá cubrir exactamente `VPROC-0001` a `VPROC-0069` con:

- categorías de información;
- clase mínima y posibles elevaciones;
- finalidad;
- titulares o sujetos relacionados;
- propietario y custodio;
- actores y contextos autorizados;
- campos y granularidad mínima;
- reglas de enmascaramiento;
- exposición en UI;
- caché y offline;
- logs y observabilidad;
- exportación e impresión;
- integración o tercero;
- retención referenciada;
- riesgo de agregación e inferencia;
- prueba y evidencia propietarias.

No se certificará un proceso con una celda “no aplica” sin justificación verificable.

---

#### 24. Pruebas obligatorias

Cada capacidad aplicable deberá probar:

1. actor autorizado para acción pero no para campo sensible;
2. acceso entre sedes, áreas, casos y titulares;
3. URL, formulario, RPC y payload manipulados;
4. búsqueda y autocomplete sin filtración;
5. lista, detalle, conteo, exportación e impresión;
6. cambio de actor en dispositivo compartido;
7. bloqueo, background, screenshot y notificación;
8. caché, borrador, outbox y reconexión;
9. revocación con datos pendientes;
10. logs, trazas, errores y analytics;
11. archivos, thumbnails, nombres y metadatos;
12. agregados pequeños y reidentificación;
13. ambientes no productivos y datos sintéticos;
14. integración, webhook y tercero;
15. secreto introducido accidentalmente;
16. reclasificación y propagación a derivados;
17. consentimiento retirado o finalidad expirada;
18. soporte técnico y acceso administrativo;
19. accesibilidad sin revelar información adicional;
20. concurrencia entre versiones de política.

Las pruebas físicas pertenecen a paquetes E5, `AUTH-QA-*`, `UX-QA-*`, `SHELL-CI-*`, `INFO-DOM-*`, `EVID-ARC-*`, `OBS-ARC-*`, `QUEUE-ARC-*` y tareas por aplicación.

---

#### 25. Guardrails

```text
SECRETOS EN LOGS, ANALYTICS O URL = 0
S4 PERSISTIDO LOCALMENTE SIN EXCEPCIÓN = 0
EXPORTACIÓN MASIVA POR PERMISO DE CONSULTA = 0
DATOS PRODUCTIVOS ÍNTEGROS EN CI O DEMO = 0
CAMBIO DE ACTOR CON DATOS DEL ACTOR ANTERIOR VISIBLES = 0
PROYECCIÓN COMPLETA OCULTADA SOLO EN UI = 0
CLASIFICACIÓN DESCONOCIDA TRATADA COMO PÚBLICA = 0
ANONIMIZACIÓN DECLARADA SIN EVALUAR REIDENTIFICACIÓN = 0
```

Los umbrales de monitoreo se definirán en `NFR-REQ-009`; estos valores expresan prohibiciones de diseño.

---

#### 26. Propiedad de decisiones posteriores

| Decisión                                                       | Tarea propietaria                                             |
| -------------------------------------------------------------- | ------------------------------------------------------------- |
| inventario, propietarios, custodios y clasificación definitiva | `INFO-DOM-001`; `INFO-DOM-002`                                |
| documentos, autenticidad, firmas y evidencia                   | `INFO-DOM-003` a `INFO-DOM-007`; `INFO-DOM-011`; `EVID-ARC-*` |
| avisos, consentimiento y derechos                              | `INFO-DOM-008` a `INFO-DOM-010`                               |
| retención, hold, anonimización y eliminación                   | `NFR-REQ-006`; `INFO-DOM-006`                                 |
| autorización de servidor, RLS y RPC                            | `AUTH-SRV-*`; `AUTH-DB-*`; `SUPA-ARC-*`                       |
| dispositivos y credenciales                                    | `AUTH-DEV-*`; `NFR-REQ-008`; `NFR-REQ-011`                    |
| offline, colas y sincronización                                | `NFR-REQ-004`; `QUEUE-ARC-*`                                  |
| observabilidad, soporte y alertas                              | `NFR-REQ-009`; `OBS-ARC-*`                                    |
| cifrado, secretos y arquitectura física                        | bloques E3/E4; `SUPA-ARC-*`; paquetes E5                      |
| experiencia, masking y accesibilidad                           | `NFR-REQ-007`; `UX-BASE-*`; `UX-QA-*`                         |
| integraciones y terceros                                       | `INT-APP-*`; `INT-EXT-*`; BLOQUE X                            |
| certificación por aplicación                                   | `DELIV-PKG-*`; tareas `*-AUTH-*`; BLOQUE U                    |

No se declara una tecnología, proveedor, algoritmo, plazo de retención ni fundamento jurídico sin su tarea propietaria.

---

#### 27. Requisitos de prueba derivados

Esta propuesta incorpora al registro canónico completo:

```text
TREQ-PROC-325 a TREQ-PROC-354
```

Cobertura:

1. finalidad y minimización;
2. clasificación `S0` a `S4`;
3. sensibilidad por campo y no por aplicación;
4. herencia y elevación;
5. sobre de manejo;
6. proyecciones mínimas;
7. enmascaramiento y no filtración indirecta;
8. seudonimización, anonimización y reidentificación;
9. UI y accesibilidad;
10. dispositivos compartidos;
11. offline y almacenamiento local;
12. logs, trazas y errores;
13. exportaciones e impresión;
14. archivos y metadatos;
15. integraciones y terceros;
16. datos de prueba;
17. secretos y credenciales;
18. datos derivados e inferencias;
19. consentimiento y finalidad;
20. reclasificación;
21. autorización más proyección;
22. SST y salud;
23. talento y desempeño;
24. clientes y fidelización;
25. pagos y finanzas;
26. recetas y conocimiento propietario;
27. observabilidad y soporte;
28. clasificación por 69 procesos;
29. guardrails y regresión;
30. gobierno, evidencia y certificación.

Mientras la tarea permanezca en propuesta, la evidencia de estas filas deberá indicar expresamente que proviene de `NFR-REQ-005` en propuesta. Al aprobarse, la evidencia se actualizará a tarea aprobada sin cambiar los identificadores.

---

#### 28. Criterios de aceptación

- [ ] Se distinguen privacidad, confidencialidad, autorización, cifrado, minimización y anonimización.
- [ ] Las clases `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED` tienen límites inequívocos.
- [ ] La clasificación puede aplicarse a campo, documento, evento, metadato, agregado y derivado.
- [ ] Una clasificación desconocida usa política restrictiva.
- [ ] Copias, joins, exportaciones y derivados heredan o elevan sensibilidad.
- [ ] Cada consumidor recibe una proyección mínima autorizada.
- [ ] Se cubren UI, caché, offline, logs, métricas, exportaciones, archivos, integraciones y soporte.
- [ ] Los secretos quedan fuera de datos empresariales, URLs, logs y analytics.
- [ ] Se distinguen masking, tokenización, seudonimización, anonimización y agregación.
- [ ] Dispositivos compartidos aíslan actor, contexto y datos locales.
- [ ] Producción no se replica íntegramente a ambientes no productivos.
- [ ] Consentimiento, finalidad y revocación no se confunden con retención o eliminación.
- [ ] Los 69 procesos deberán tener perfil individual antes de implementación.
- [ ] Se incorporan `TREQ-PROC-325` a `TREQ-PROC-354` al `04A` completo con evidencia de propuesta.
- [ ] No se implementan código, cifrado, migraciones, Supabase, políticas físicas ni despliegues.
- [ ] `NFR-REQ-006` permanece no iniciada.

---

#### 29. Estado y continuidad

```text
NFR-REQ-003   APROBADA
NFR-REQ-004   APROBADA
NFR-REQ-005   APROBADA
NFR-REQ-006   NO INICIADA
```

La aprobación explícita de esta tarea congelará el contrato inicial de privacidad y sensibilidad. No certificará cumplimiento jurídico ni seguridad efectiva de ninguna implementación.

### ✅ NFR-REQ-006 — Definir trazabilidad y retención

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-005 — Definir privacidad y sensibilidad` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-007 — Definir accesibilidad y ergonomía` — NO INICIADA  
**Artefactos propuestos:** `NFR-TRACEABILITY-RETENTION-CONTRACT-001`; `NFR-AUDIT-EVENT-ENVELOPE-001`; `NFR-RETENTION-POLICY-MATRIX-001`; `NFR-DISPOSITION-CONTROL-001`; `NFR-PROCESS-TRACEABILITY-PROFILE-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de trazabilidad, historial, conservación, archivo, suspensión de disposición, anonimización y eliminación controlada; no dictamen jurídico, tabla legal definitiva, implementación física de auditoría, diseño de respaldos ni certificación  
**Cambios en código, migraciones, Supabase, aplicaciones, Storage, infraestructura o despliegues:** no autorizados

---

#### 1. Propósito

Definir un contrato verificable para reconstruir qué ocurrió en cada proceso de Vento OS, quién o qué intervino, bajo cuál contexto, sobre qué recurso, con qué decisión, resultado, evidencia y política vigente; y establecer cómo cada dato, documento, evento, log, evidencia, copia o derivado deberá conservarse, archivarse, suspenderse, anonimizarse o eliminarse de manera controlada.

```text
ESTADO ACTUAL
≠ HISTORIAL SUFICIENTE

LOG TÉCNICO
≠ AUDITORÍA EMPRESARIAL

BACKUP
≠ ARCHIVO
≠ RETENCIÓN
≠ LEGAL HOLD

BORRADO DE UNA FILA
≠ DISPOSICIÓN COMPLETA

CONSERVAR TODO PARA SIEMPRE
≠ TRAZABILIDAD
≠ CUMPLIMIENTO
```

La aprobación de esta tarea congelará el contrato no funcional inicial. No declarará que los sistemas actuales ya son trazables, que los plazos jurídicos están definidos ni que la eliminación física es completa.

---

#### 2. Continuidad lógica

`NFR-REQ-001` clasificó criticidad y disponibilidad. `NFR-REQ-002` definió carga y crecimiento. `NFR-REQ-003` estableció presupuestos temporales. `NFR-REQ-004` fijó comportamiento offline y sincronización. `NFR-REQ-005` clasificó sensibilidad, finalidad y manejo.

`NFR-REQ-006` convierte esas decisiones en obligaciones de reconstrucción y ciclo de vida:

```text
HECHO EMPRESARIAL
        ↓
ACTOR + CONTEXTO + RECURSO + DECISIÓN
        ↓
EVENTO, HISTORIAL Y EVIDENCIA
        ↓
POLÍTICA DE RETENCIÓN VERSIONADA
        ↓
ARCHIVO / HOLD / ANONIMIZACIÓN / DISPOSICIÓN
        ↓
EVIDENCIA DE EJECUCIÓN Y NO RESURRECCIÓN
```

La accesibilidad de estados, historial y evidencia será detallada por `NFR-REQ-007`. La observabilidad técnica y las alertas serán definidas por `NFR-REQ-009`. Los respaldos, RTO y RPO pertenecerán a `NFR-REQ-010`. Ninguna de esas tareas podrá degradar la trazabilidad, sensibilidad o retención aprobadas aquí.

---

#### 3. Alcance

El contrato aplica a:

- hechos, decisiones y transiciones de los `VPROC-0001` a `VPROC-0069`;
- entidades, expedientes, documentos, archivos, evidencias y firmas;
- accesos, consultas, revelados, exportaciones, impresiones y comparticiones sensibles;
- aprobaciones, rechazos, excepciones, correcciones, cancelaciones, reversos y anulaciones;
- eventos empresariales, outbox, inbox, webhooks, integraciones y callbacks;
- operaciones offline, reintentos, conflictos, cuarentenas y conciliaciones;
- cambios de configuración, permisos, matrices, políticas, maestros y parámetros;
- logs de auditoría, seguridad, soporte y administración privilegiada;
- métricas, trazas y diagnósticos cuando sean necesarios para demostrar un hecho;
- copias, cachés, exportaciones, archivos temporales, datasets y derivados;
- producción, staging, desarrollo, pruebas, soporte y recuperación;
- datos activos, inactivos, archivados, suspendidos, anonimizados y dispuestos;
- bases de datos, Storage, dispositivos, colas, terceros y respaldos.

La trazabilidad no se limitará a acciones de interfaz. RPC, RLS, procesos automáticos, trabajos programados, integraciones y operaciones administrativas deberán producir evidencia equivalente cuando generen un efecto empresarial.

---

#### 4. Distinciones canónicas

| Concepto             | Definición                                                                     | No equivale a                           |
| -------------------- | ------------------------------------------------------------------------------ | --------------------------------------- |
| hecho empresarial    | cambio o decisión con significado para un proceso                              | clic, request o línea de log aislada    |
| evento empresarial   | representación versionada de un hecho consumado o rechazado                    | estado mutable sin historial            |
| historial de recurso | secuencia reconstruible de estados y correcciones                              | copia actual de la fila                 |
| auditoría            | evidencia de quién o qué hizo, intentó, consultó, decidió o cambió algo        | observabilidad general                  |
| observabilidad       | señales para comprender salud y comportamiento técnico                         | prueba completa de un hecho empresarial |
| evidencia            | objeto o referencia que sustenta un hecho, decisión o cumplimiento             | adjunto sin procedencia                 |
| procedencia          | origen, transformaciones y custodios de un dato o evidencia                    | ubicación actual únicamente             |
| retención            | regla que determina cuánto y desde qué evento se conserva algo                 | almacenamiento indefinido               |
| archivo              | conservación controlada fuera del uso operativo ordinario                      | backup o papelera                       |
| legal hold           | suspensión autorizada de disposición sobre un alcance concreto                 | retención permanente general            |
| disposición          | ejecución gobernada de eliminación, anonimización, destrucción o transferencia | `DELETE` sin verificación               |
| anonimización        | transformación que reduce suficientemente la posibilidad de identificar        | ocultamiento visual o seudonimización   |
| tombstone            | registro mínimo que impide recreación o demuestra disposición                  | copia completa del contenido eliminado  |
| backup               | copia de recuperación ante pérdida o corrupción                                | repositorio de consulta histórica       |

Estas distinciones serán obligatorias en nombres, interfaces, reportes, contratos, pruebas y procedimientos.

---

#### 5. Principios obligatorios

1. **Trazabilidad por diseño:** todo efecto material deberá producir evidencia suficiente durante la misma operación o mediante un mecanismo transaccionalmente vinculado.
2. **Proporcionalidad:** se registrará lo necesario para reconstruir y controlar el hecho, sin duplicar secretos, documentos ni payloads completos.
3. **Atribución verificable:** actor, servicio, dispositivo, sesión y contexto efectivo se distinguirán sin confiar solo en texto libre.
4. **Historia no destructiva:** una corrección no reescribirá silenciosamente el hecho anterior.
5. **Tiempo explícito:** ocurrencia, recepción, persistencia y sincronización no se confundirán.
6. **Correlación extremo a extremo:** procesos, recursos, eventos, comandos, reintentos e integraciones conservarán vínculos resolubles.
7. **Política versionada:** toda retención, hold y disposición usará una política identificable y vigente para el hecho.
8. **Finalidad y minimización:** retener para auditoría no autoriza conservar cualquier dato ni usarlo para otra finalidad.
9. **No permanencia por defecto:** ninguna categoría se conservará indefinidamente por ausencia de decisión.
10. **No eliminación por defecto:** una categoría sin política resoluble no se eliminará automáticamente; quedará bloqueada y escalada.
11. **Hold prevalente:** una suspensión válida bloquea disposición, pero no amplía acceso ni finalidad.
12. **Disposición demostrable:** la eliminación deberá producir evidencia, tratar copias y evitar resurrección posterior.
13. **Restauración segura:** recuperar un backup no podrá reactivar datos ya dispuestos, accesos revocados o políticas obsoletas.
14. **Separación de deberes:** creación de política, aprobación, hold, liberación, ejecución y certificación se segregarán cuando el riesgo lo exija.
15. **Acceso a auditoría auditado:** consultar, exportar o alterar evidencia de auditoría será también un hecho auditable.

---

#### 6. Unidad de trazabilidad

La unidad primaria será el `process_instance_id` vinculado con un `process_id` estable y su versión. Cada proceso podrá contener múltiples recursos y eventos, pero deberá poder reconstruirse como una secuencia causal.

```text
process_id
process_version
process_instance_id
        ↓
resource_type + resource_id + resource_version
        ↓
event_id + event_type + event_version
        ↓
correlation_id + causation_id
        ↓
evidence_refs[]
```

No se aceptará como trazabilidad completa una colección de timestamps y usuarios sin vínculo con proceso, recurso, transición, resultado y motivo.

---

#### 7. Sobre canónico de evento auditable

`NFR-AUDIT-EVENT-ENVELOPE-001` deberá permitir, según aplicabilidad, los siguientes campos:

```text
event_id
event_type
event_version
event_class
occurred_at
occurred_timezone
recorded_at
received_at
committed_at
synchronized_at
clock_source
clock_skew_status
process_id
process_version
process_instance_id
resource_type
resource_id
resource_version
parent_resource_ref
command_id
request_id
correlation_id
causation_id
idempotency_key
attempt_number
action
outcome
previous_state
new_state
reason_code
reason_detail_ref
actor_type
authenticated_subject_ref
effective_actor_ref
service_actor_ref
simulated_actor_ref
effective_role_ref
site_id
area_id
shift_id
checkin_ref
device_id
session_id
application_id
service_id
channel
network_mode
offline_sequence
policy_versions
classification
retention_policy_id
retention_policy_version
hold_status
evidence_refs[]
integrity_reference
corrects_event_id
supersedes_event_id
external_system_ref
external_event_ref
ingestion_status
```

Reglas:

- los identificadores deberán ser estables y no depender del nombre visible;
- los campos no aplicables se omitirán o marcarán con una razón tipada, no con datos inventados;
- `reason_detail_ref` evitará introducir texto sensible completo dentro del evento;
- el sobre podrá materializarse en distintas estructuras físicas, pero su semántica será común;
- secretos, tokens, PIN, credenciales y payloads completos no se incorporarán al evento;
- la ausencia de actor humano deberá declarar actor de servicio, sistema, tercero o procedimiento manual;
- las versiones de contrato y política deberán permitir interpretar eventos históricos después de cambios del sistema.

---

#### 8. Clases de trazabilidad

| Clase                     | Nombre                       | Cobertura mínima                                                                                           |
| ------------------------- | ---------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `T0_CONTROL_CRITICAL`     | control crítico              | seguridad, acceso, inocuidad, salud, dinero, custodia, permisos, configuración crítica, hold y disposición |
| `T1_BUSINESS_STATE`       | estado empresarial           | creación, transición, aprobación, rechazo, entrega, recepción, pago, producción, inventario y cierre       |
| `T2_DECISION_EXCEPTION`   | decisión o excepción         | override, corrección, reverso, cancelación, excepción, autorización especial y motivo                      |
| `T3_ACCESS_DISCLOSURE`    | acceso o divulgación         | consulta sensible, revelado, descarga, exportación, impresión, compartición y acceso administrativo        |
| `T4_INTEGRATION_SYNC`     | integración y sincronización | emisión, recepción, reintento, deduplicación, conflicto, dead-letter, conciliación y resultado externo     |
| `T5_EVIDENCE_DOCUMENT`    | evidencia y documento        | carga, versión, firma, sustitución, anulación, vínculo, consulta y preservación                            |
| `T6_TECHNICAL_SUPPORT`    | soporte técnico              | diagnóstico mínimo, incidente, cambio operativo, ejecución privilegiada y recuperación                     |
| `T7_AGGREGATED_REFERENCE` | referencia agregada          | métricas o señales sin detalle individual cuando el hecho completo reside en otra fuente autorizada        |

`T7_AGGREGATED_REFERENCE` no podrá reemplazar las clases `T0` a `T5` cuando se requiera reconstruir un hecho individual.

---

#### 9. Acciones obligatoriamente auditables

Como mínimo deberán auditarse:

1. autenticación, cierre, bloqueo, recuperación y revocación relevantes;
2. decisiones de autorización sensibles, denegaciones y uso de excepción;
3. cambios de rol, permiso, alcance, matriz, contexto, política o configuración;
4. altas, bajas, activaciones, suspensiones y cierres de identidades empresariales;
5. creación, transición, aprobación, rechazo y cierre de procesos;
6. cambios de inventario, ubicación, lote, custodia, cantidad y disposición física;
7. movimientos de dinero, pagos, devoluciones, caja, cartera y conciliaciones;
8. emisión, sustitución, anulación y firma de documentos o evidencia;
9. creación, modificación y publicación de maestros, productos, recetas y costos;
10. acceso, revelado, descarga, exportación, impresión y compartición de `S3` o `S4`;
11. operaciones masivas y acciones administrativas privilegiadas;
12. correcciones, reversos, cancelaciones, anulaciones y reaperturas;
13. cambios de retención, hold, liberación, archivo, anonimización y disposición;
14. eventos offline, reintentos, conflictos, cuarentenas y conciliaciones;
15. integraciones, webhooks, callbacks, deduplicaciones y fallas externas;
16. acceso de soporte a datos, evidencia, backups o ambientes no productivos;
17. restauraciones, migraciones y reprocesamientos que alteren historia o estado;
18. fallas de auditoría, pérdida de correlación o imposibilidad de determinar resultado.

---

#### 10. Historial, corrección y verdad vigente

Cada dominio distinguirá:

```text
ESTADO VIGENTE AUTORITATIVO
+
HISTORIAL DE EVENTOS
+
EVIDENCIA DE SOPORTE
+
RELACIÓN DE CORRECCIÓN O SUSTITUCIÓN
```

Una corrección deberá conservar:

- valor o estado anterior cuando sea legítimo y necesario;
- valor o estado nuevo;
- motivo tipado;
- actor y autoridad;
- fecha de ocurrencia y fecha de registro;
- relación con el evento corregido;
- efecto sobre procesos dependientes;
- evidencia y aprobación cuando aplique;
- versión de la regla utilizada.

Se prohíbe:

- sobrescribir historial para “dejarlo limpio”;
- eliminar un hecho válido porque fue revertido;
- modificar timestamps originales durante conciliación;
- reutilizar el mismo identificador para un hecho distinto;
- representar una anulación como si el hecho nunca hubiera ocurrido.

---

#### 11. Modelo temporal

Todo hecho relevante deberá distinguir, según aplicabilidad:

| Tiempo            | Significado                                                  |
| ----------------- | ------------------------------------------------------------ |
| `occurred_at`     | momento declarado en que ocurrió el hecho empresarial        |
| `recorded_at`     | momento en que el actor o dispositivo lo registró            |
| `received_at`     | momento en que el servicio lo recibió                        |
| `committed_at`    | momento en que quedó persistido autoritativamente            |
| `synchronized_at` | momento en que una operación offline fue conciliada          |
| `effective_at`    | momento desde el cual una decisión o política produce efecto |
| `expired_at`      | momento en que deja de estar vigente                         |

Reglas:

- se almacenará una referencia temporal inequívoca y la zona horaria aplicable;
- UTC podrá usarse para persistencia, conservando la interpretación local de negocio;
- el reloj del dispositivo será evidencia declarada, no autoridad absoluta;
- desviaciones relevantes deberán marcarse y no corregirse silenciosamente;
- ordenar por `created_at` únicamente no será suficiente para reconstruir una operación offline;
- la retención se computará desde el evento definido por la política, no necesariamente desde la creación técnica.

---

#### 12. Actor, identidad y contexto

La auditoría distinguirá:

- sujeto autenticado;
- identidad empresarial vinculada;
- actor efectivo;
- rol base y rol operativo efectivo;
- simulación o actuación por delegación;
- servicio, job o integración técnica;
- dispositivo, sesión y canal;
- sede, área, turno y check-in aplicables;
- tercero o procedimiento manual que originó el hecho.

En dispositivos compartidos:

```text
MISMO DISPOSITIVO
≠ MISMO ACTOR
≠ MISMO TURNO
≠ MISMA ÁREA
≠ MISMA SESIÓN
```

Un cambio de actor deberá cerrar o aislar el contexto anterior. La atribución no podrá basarse en la última persona que usó el equipo.

---

#### 13. Decisiones automáticas, asistentes y acciones de sistema

Cuando un proceso automático produzca un efecto empresarial deberá registrarse:

- regla, versión o job que actuó;
- iniciador humano o evento causal, si existe;
- datos de entrada referenciados y minimizados;
- decisión producida;
- límites, umbrales o configuración vigente;
- resultado y fallas;
- posibilidad y autoridad de revisión humana;
- corrección posterior y su relación causal.

Una predicción, recomendación o sugerencia no se registrará como decisión final hasta que el proceso correspondiente la acepte o ejecute.

---

#### 14. Correlación entre aplicaciones, servicios e integraciones

Cada traspaso conservará una cadena resoluble:

```text
COMANDO ORIGEN
→ EVENTO EMPRESARIAL
→ OUTBOX
→ ENTREGA / REINTENTO
→ INBOX / DEDUPLICACIÓN
→ EFECTO DESTINO
→ RESPUESTA O CONCILIACIÓN
```

Se conservarán:

- identificadores internos y externos;
- versión de contrato;
- correlación y causalidad;
- idempotencia;
- intento y resultado;
- timestamps de emisión y recepción;
- transformación aplicada;
- campos descartados por minimización;
- error tipado y ruta de reparación;
- evidencia de deduplicación o compensación.

El identificador de un tercero no reemplazará el identificador canónico de Vento ni se reutilizará entre ambientes.

---

#### 15. Trazabilidad offline y sincronización

`NFR-REQ-004` queda complementada por estas reglas:

- cada dispositivo mantendrá una secuencia local por actor y contexto cuando la operación lo requiera;
- la reconexión no reemplazará el tiempo original por el tiempo de sincronización;
- un reintento conservará el mismo `idempotency_key` y aumentará `attempt_number`;
- un conflicto generará evento de detección, decisión y resolución;
- una operación `UNKNOWN`, `QUARANTINED` o `RECONCILIATION_REQUIRED` no se presentará como completada;
- la conciliación conservará versiones local, remota y decisión final;
- cambiar actor, área, sesión o dispositivo no transferirá outbox ni evidencia;
- desinstalar, limpiar almacenamiento o restablecer el dispositivo seguirá una política de custodia y pérdida declarada;
- una cola local sensible heredará la política de retención y borrado de su contenido;
- la falta de espacio, reloj inválido o versión de esquema deberá quedar trazada.

---

#### 16. Evidencia, documentos y cadena de custodia

Todo objeto de evidencia deberá poder declarar:

```text
evidence_id
evidence_type
source
creator_or_collector
collected_at
received_at
resource_ref
process_instance_id
classification
content_hash
metadata_hash
version
custodian
storage_ref
access_history_ref
integrity_status
retention_policy_id
hold_status
supersedes_evidence_id
disposition_status
```

La arquitectura física, validación de archivos, malware, URLs firmadas y preservación pertenecerán a `EVID-ARC-001` a `EVID-ARC-010`. La taxonomía documental, autenticidad, hash, firma y cadena de custodia se completarán en `INFO-DOM-003` a `INFO-DOM-007`.

Esta tarea fija que:

- un adjunto sin procedencia no demostrará un hecho;
- reemplazar un archivo no eliminará la versión anterior cuando deba preservarse;
- la consulta o descarga de evidencia sensible será auditable;
- hash e integridad no sustituyen autorización, contexto ni cadena de custodia;
- capturas, fotos, audio y video conservarán clasificación, finalidad y política.

---

#### 17. Contrato de política de retención

Cada categoría retenible deberá resolver una política versionada con:

```text
retention_policy_id
retention_policy_version
information_category
record_or_event_scope
process_scope
classification
information_owner
custodian
purpose
obligation_refs[]
retention_trigger
active_retention_rule
inactive_retention_rule
archive_rule
minimum_period
maximum_period
review_frequency
disposition_method
anonymization_rule
hold_eligibility
backup_treatment
copy_and_derivative_treatment
third_party_treatment
jurisdiction_or_territory
exception_route
effective_at
superseded_at
approval_refs[]
```

Reglas:

- toda duración deberá expresar unidad, evento inicial y condición de cierre;
- no se aceptará “X años” sin indicar desde cuándo se cuentan;
- el mínimo protege obligaciones; el máximo limita conservación excesiva;
- una política nueva no alterará retroactivamente hechos sin regla de transición;
- el acceso frecuente no reiniciará automáticamente el cómputo;
- copiar o exportar no creará un plazo independiente por defecto;
- la política deberá considerar metadatos, adjuntos, índices, cachés y derivados;
- la ausencia de obligación jurídica confirmada no autoriza inventar un plazo;
- `INFO-DOM-006` materializará tablas de retención y plazos definitivos con sus fundamentos.

---

#### 18. Clases iniciales de ciclo de retención

Estas clases describen comportamiento, no duración jurídica:

| Clase                     | Uso                                                                | Regla                                                                          |
| ------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `RET_TRANSIENT`           | datos técnicos o temporales                                        | eliminar al cumplir finalidad y ventana operativa aprobada                     |
| `RET_ACTIVE_CASE`         | expediente o proceso activo                                        | conservar mientras el caso permanezca abierto y durante su transición aprobada |
| `RET_BUSINESS_CYCLE`      | ciclo operativo, contable, laboral o logístico                     | computar desde cierre, conciliación, vencimiento o hito definido               |
| `RET_RELATIONSHIP`        | relación con trabajador, cliente, proveedor o tercero              | computar desde terminación, última obligación o cierre aplicable               |
| `RET_OBLIGATION`          | conservación contractual, fiscal, laboral, sanitaria o regulatoria | duración y evento fijados por tabla aprobada y fundamento verificable          |
| `RET_ARCHIVAL`            | evidencia histórica con valor aprobado                             | acceso restringido, integridad, revisión periódica y disposición definida      |
| `RET_HOLD`                | suspensión temporal de disposición                                 | prevalece mientras el hold esté vigente; no es una política permanente         |
| `RET_PERMANENT_EXCEPTION` | conservación permanente excepcional                                | exige justificación, propietario, aprobación y revisión periódica              |
| `RET_UNRESOLVED`          | política faltante o contradictoria                                 | bloquea disposición automática y genera brecha con destino `INFO-DOM-006`      |

`RET_UNRESOLVED` no será un estado aceptable para certificar un paquete E5.

---

#### 19. Eventos que inician el cómputo

La política deberá elegir un trigger tipado, por ejemplo:

- creación o recepción;
- fecha efectiva;
- publicación o sustitución;
- cierre del proceso o expediente;
- conciliación final;
- pago o liquidación completa;
- entrega o recepción confirmada;
- vencimiento o consumo;
- terminación de relación;
- cierre de incidente o investigación;
- retiro de consentimiento cuando aplique;
- liberación de hold;
- última obligación pendiente;
- disposición física del activo, lote o producto.

Si existen múltiples triggers, la política deberá declarar precedencia y regla de cómputo. No se elegirá automáticamente el timestamp más reciente para prolongar retención.

---

#### 20. Estados del ciclo de vida

```text
ACTIVE
→ INACTIVE
→ ARCHIVE_PENDING
→ ARCHIVED
→ ELIGIBLE_FOR_DISPOSITION
→ DISPOSITION_PENDING
→ DISPOSED | ANONYMIZED | TRANSFERRED
```

Estados transversales:

```text
HOLD_ACTIVE
PRESERVATION_REQUIRED
DISPOSITION_BLOCKED
DISPOSITION_FAILED
POLICY_UNRESOLVED
```

Toda transición deberá registrar política, versión, actor o job, motivo, fecha, alcance y resultado. `HOLD_ACTIVE` podrá aplicarse desde cualquier estado previo a la disposición efectiva.

---

#### 21. Legal hold y preservación excepcional

Un hold deberá declarar:

```text
hold_id
hold_type
scope_query_or_manifest
reason_code
authority_ref
requested_by
approved_by
issued_at
effective_at
review_at
release_condition
released_at
custodian
notification_status
preservation_actions[]
exceptions[]
```

Reglas:

- el alcance será explícito por recursos, expedientes, personas, periodos o categorías;
- un hold bloqueará eliminación, anonimización destructiva y rotación incompatible;
- no concederá acceso adicional ni cambiará clasificación;
- se propagará a copias y derivados gobernados que formen parte del alcance;
- se revisará periódicamente y no permanecerá abierto sin propietario;
- la liberación será una acción separada, aprobada y auditable;
- las políticas normales se recalcularán desde el trigger que corresponda después de la liberación;
- una solicitud informal por chat no constituirá hold vigente sin materialización controlada.

La autoridad, fundamento y procedimiento definitivo pertenecen a `INFO-DOM-006`, `INFO-DOM-010`, `INFO-DOM-012` e `INFO-DOM-013`.

---

#### 22. Archivo

Archivar significará trasladar un registro fuera del uso operativo ordinario conservando:

- identificador estable;
- contexto y metadatos suficientes;
- clasificación y acceso;
- integridad y legibilidad;
- política y trigger;
- búsqueda autorizada;
- relación con el recurso original;
- formato y versión interpretables;
- migraciones de formato o almacenamiento auditadas;
- disposición futura.

Se prohíbe usar como archivo:

- un backup no indexado;
- una carpeta personal;
- un bucket sin política;
- una exportación manual sin custodio;
- una tabla legacy abandonada;
- un dispositivo o correo individual.

---

#### 23. Disposición, eliminación y anonimización

Toda disposición deberá seguir:

```text
ELEGIBILIDAD CALCULADA
→ VERIFICACIÓN DE HOLD Y EXCEPCIONES
→ MANIFIESTO DE ALCANCE
→ APROBACIÓN SEGÚN RIESGO
→ EJECUCIÓN IDEMPOTENTE
→ VERIFICACIÓN DE COPIAS Y DERIVADOS
→ CERTIFICADO O EVIDENCIA
→ PROTECCIÓN CONTRA RESURRECCIÓN
```

El manifiesto deberá incluir:

- política y versión;
- trigger y fecha de elegibilidad;
- recursos afectados;
- copias, adjuntos, índices y derivados conocidos;
- terceros afectados;
- método de disposición;
- excepciones y fallas;
- ejecutor y aprobador;
- conteos antes y después;
- evidencia de verificación;
- referencia al tombstone mínimo cuando aplique.

Reglas:

- eliminación lógica no será disposición final si el contenido sigue accesible;
- anonimización deberá impedir razonablemente reidentificación bajo el contrato aprobado;
- fallas parciales producirán `DISPOSITION_FAILED`, nunca éxito silencioso;
- reintentos serán idempotentes;
- una disposición no borrará la evidencia mínima necesaria para demostrar que ocurrió;
- la evidencia de disposición no conservará el contenido eliminado;
- la eliminación de un recurso no romperá integridad referencial sin tratamiento aprobado;
- las disposiciones masivas o `S3`/`S4` exigirán segregación reforzada.

---

#### 24. Copias, cachés, búsquedas y derivados

La política deberá identificar, como mínimo:

- fuente autoritativa;
- réplicas y vistas;
- índices de búsqueda;
- cachés de servidor y cliente;
- almacenamiento offline;
- thumbnails y previsualizaciones;
- exportaciones y archivos temporales;
- eventos y colas;
- data warehouse, métricas y datasets;
- adjuntos y copias transformadas;
- ambientes no productivos;
- terceros y subencargados;
- backups.

Una eliminación del origen no se considerará completa hasta que exista tratamiento definido para cada copia gobernada. Cuando una copia no pueda eliminarse inmediatamente, deberá quedar inaccesible, expirar según política y no reutilizarse.

---

#### 25. Backups, restauración y no resurrección

`NFR-REQ-010` definirá RTO, RPO y arquitectura de respaldo. Quedará restringida por estas reglas:

- los backups tendrán política propia y acceso excepcional;
- no se usarán para consulta ordinaria ni archivo histórico;
- datos dispuestos podrán persistir cifrados hasta la expiración técnica aprobada del backup;
- durante ese periodo no podrán restaurarse para uso ordinario;
- toda restauración ejecutará un ledger de disposiciones, holds, revocaciones y políticas posteriores al punto restaurado;
- una restauración deberá volver a aplicar eliminaciones y anonimización antes de abrir acceso;
- probar recuperación no autoriza conservar backups indefinidamente;
- exportaciones de respaldo manuales deberán quedar inventariadas o prohibidas.

```text
RESTAURAR BACKUP ANTIGUO
+
NO REAPLICAR DISPOSICIONES
=
RESURRECCIÓN DE DATOS
=
CONTROL INVÁLIDO
```

---

#### 26. Auditoría frente a logs y observabilidad

La auditoría empresarial deberá estar separada lógicamente de logs de aplicación y diagnósticos volátiles.

| Señal                    | Retención y uso                                         |
| ------------------------ | ------------------------------------------------------- |
| evento empresarial       | según proceso, obligación y política de evidencia       |
| evento de auditoría      | según riesgo, investigación y política aprobada         |
| log técnico              | ventana mínima necesaria para soporte y seguridad       |
| trace distribuida        | muestreo y duración limitados; sin payload sensible     |
| métrica agregada         | retención por utilidad analítica y riesgo de inferencia |
| dump o sesión de soporte | excepcional, altamente restringida y con expiración     |

`NFR-REQ-009` definirá instrumentación, búsqueda y alertas, pero no podrá ampliar payload, acceso o duración sin política aprobada.

---

#### 27. Consultas, exportaciones y acceso a auditoría

Toda consulta de auditoría deberá aplicar:

- autorización de servidor;
- finalidad y caso;
- rango temporal y población mínimos;
- filtros y paginación;
- enmascaramiento;
- límites de exportación;
- marca de clasificación;
- registro de quién consultó o exportó;
- expiración de archivos generados;
- protección frente a búsquedas exploratorias masivas.

Una persona autorizada para operar un proceso no estará autorizada automáticamente para consultar su historial completo, eventos de seguridad o datos de otros actores.

---

#### 28. Terceros e integraciones externas

Antes de transferir información deberá declararse:

- política de retención del receptor;
- devolución o eliminación al terminar la finalidad;
- subencargados y ubicaciones;
- evidencia de disposición o imposibilidad;
- tratamiento de backups;
- hold o requerimiento de autoridad;
- incidentes y acceso excepcional;
- exportaciones posteriores;
- terminación contractual.

La eliminación interna no podrá presentarse como eliminación global si permanecen copias legítimas o no controladas en terceros. El estado deberá distinguir `DISPOSED_INTERNAL`, `THIRD_PARTY_PENDING` y `DISPOSED_VERIFIED` cuando aplique.

---

#### 29. Datos no productivos, soporte y pruebas

Datos productivos transformados para staging, soporte o pruebas deberán tener:

- finalidad y propietario;
- alcance mínimo;
- transformación aplicada;
- fecha de expiración;
- política de retención propia;
- bloqueo de mensajes y efectos reales;
- evidencia de eliminación;
- trazabilidad de copias y accesos.

Una copia temporal para resolver un incidente no heredará automáticamente el plazo completo del origen. Deberá eliminarse al cerrar la finalidad, salvo hold o obligación documentada.

---

#### 30. Perfil inicial por familias de proceso

| Familia                             | Procesos                                                              | Trazabilidad mínima                                                        | Trigger de retención orientativo                               |
| ----------------------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------- |
| gobierno, riesgo y autoridades      | `VPROC-0001` a `VPROC-0004`; `VPROC-0063`; `VPROC-0064`; `VPROC-0069` | decisión, aprobación, versión, evidencia, acceso y divulgación             | cierre de decisión, obligación, investigación o requerimiento  |
| talento y ciclo laboral             | `VPROC-0005` a `VPROC-0011`; `VPROC-0065`; `VPROC-0066`               | actor, relación laboral, cambios, aprobaciones, acceso y expediente        | terminación de relación y cierre de obligaciones aplicables    |
| SST, salud y emergencias            | `VPROC-0012` a `VPROC-0014`                                           | reporte, atención, evidencia, custodia, acceso y corrección                | cierre del caso o evento definido por tabla obligatoria        |
| maestros, recetas y producto        | `VPROC-0015` a `VPROC-0018`                                           | versión, aprobación, vigencia, sustitución y publicación                   | sustitución, retiro o fin de vigencia                          |
| proveedores y compras               | `VPROC-0019` a `VPROC-0022`                                           | solicitud, comparación, aprobación, recepción, diferencia y pago           | cierre de compra, contrato u obligación                        |
| inventario, activos y custodia      | `VPROC-0023` a `VPROC-0032`; `VPROC-0067`                             | movimiento, ubicación, cantidad, lote, custodio, ajuste y baja             | cierre de ciclo, disposición física o fin de custodia          |
| producción y calidad                | `VPROC-0033` a `VPROC-0037`                                           | orden, receta, lote, consumo, resultado, control y liberación              | cierre de lote, vencimiento o ventana de trazabilidad aprobada |
| venta, caja y clientes              | `VPROC-0038` a `VPROC-0047`; `VPROC-0068`                             | venta, pago, devolución, fidelización, consentimiento y reclamo            | cierre de transacción, relación o caso                         |
| logística y terceros                | `VPROC-0048` a `VPROC-0050`                                           | custodia, salida, recorrido, entrega, recepción y evidencia                | recepción final, cierre de diferencia o contrato               |
| finanzas y costos                   | `VPROC-0051` a `VPROC-0054`                                           | origen, cálculo, aprobación, asiento, pago y conciliación                  | cierre contable, fiscal o contractual aplicable                |
| instalaciones y marketing           | `VPROC-0055` a `VPROC-0057`                                           | orden, intervención, publicación, consentimiento y resultado               | cierre de trabajo, campaña o finalidad                         |
| tecnología y accesos                | `VPROC-0058`; `VPROC-0059`                                            | solicitud, aprobación, privilegio, cambio, incidente y revocación          | revocación, cierre de incidente o política de seguridad        |
| documentos, analítica y continuidad | `VPROC-0060` a `VPROC-0062`                                           | procedencia, versión, transformación, consulta, restauración y disposición | trigger de la fuente o política específica aprobada            |

Los triggers son orientativos y no sustituyen las tablas definitivas de `INFO-DOM-006`. Cada proceso deberá materializar una fila individual antes de su paquete E5.

---

#### 31. Matriz obligatoria por proceso

`NFR-PROCESS-TRACEABILITY-PROFILE-001` deberá cubrir exactamente `VPROC-0001` a `VPROC-0069` con:

- proceso, versión y propietario funcional;
- recursos y expedientes involucrados;
- hechos y transiciones auditables;
- clase de trazabilidad;
- actor y contexto requeridos;
- estados anterior y posterior;
- motivos y excepciones;
- correlación y causalidad;
- evidencias y documentos;
- accesos y divulgaciones auditables;
- integraciones y referencias externas;
- comportamiento offline;
- sensibilidad y minimización del evento;
- política de retención y trigger;
- archivo y búsqueda autorizada;
- elegibilidad de hold;
- disposición y anonimización;
- tratamiento de copias, terceros y backups;
- requisitos de integridad;
- pruebas y evidencia de certificación.

No se aceptará `no aplica` sin justificación, propietario y evidencia.

---

#### 32. Pruebas obligatorias

Cada capacidad aplicable deberá probar:

1. reconstrucción completa de una instancia de proceso;
2. actor, rol, sede, área, turno, dispositivo y sesión correctos;
3. acción automática con actor de servicio y causa;
4. transición ordinaria y transición rechazada;
5. corrección sin pérdida del hecho anterior;
6. cancelación, reverso, anulación y reapertura;
7. correlación entre aplicaciones;
8. reintento idempotente y deduplicación;
9. operación offline y timestamps múltiples;
10. conflicto y conciliación;
11. acceso sensible y exportación auditados;
12. consulta de auditoría también auditada;
13. evento sin secreto ni payload completo;
14. política versionada y trigger correcto;
15. cambio de política sin reinterpretación silenciosa;
16. cálculo de elegibilidad;
17. hold que bloquea disposición;
18. liberación de hold autorizada;
19. disposición parcial fallida;
20. reintento idempotente de disposición;
21. anonimización y evaluación de reidentificación;
22. eliminación de caché, índice, adjunto y derivado;
23. tercero pendiente y evidencia de eliminación;
24. backup que no se usa como archivo;
25. restauración con reaplicación de disposiciones;
26. tombstone sin conservar contenido eliminado;
27. datos de prueba con expiración;
28. migración que conserva historial e identificadores;
29. acceso privilegiado y soporte;
30. pérdida o corrupción de eventos;
31. reloj de dispositivo desviado;
32. versiones antiguas del sobre;
33. matriz completa de 69 procesos;
34. segregación en hold y disposición;
35. imposibilidad de certificar con política `RET_UNRESOLVED`.

Las pruebas se implementarán en los paquetes propietarios de E5, BLOQUE R, `EVID-ARC-*`, `INFO-DOM-*`, `OBS-ARC-*`, `QUEUE-ARC-*`, `AUTH-QA-*`, `UX-QA-*` y tareas por aplicación.

---

#### 33. Guardrails

```text
HECHO CRÍTICO SIN EVENTO AUDITABLE = 0
CORRECCIÓN QUE DESTRUYE HISTORIAL = 0
EVENTO CON SECRETO O TOKEN = 0
EVENTO SIN PROCESS_INSTANCE_ID CUANDO APLICA = 0
REINTENTO QUE DUPLICA EFECTO EMPRESARIAL = 0
DISPOSICIÓN CON HOLD ACTIVO = 0
RETENCIÓN INDEFINIDA POR AUSENCIA DE POLÍTICA = 0
ELIMINACIÓN AUTOMÁTICA CON POLÍTICA NO RESUELTA = 0
BACKUP USADO COMO ARCHIVO ORDINARIO = 0
RESTAURACIÓN QUE RESUCITA DATOS DISPUESTOS = 0
ACCESO A AUDITORÍA SIN AUDITORÍA = 0
PAQUETE E5 CERTIFICADO CON RET_UNRESOLVED = 0
```

Los umbrales operativos y alertas serán definidos por `NFR-REQ-009`. Estos valores representan prohibiciones de diseño.

---

#### 34. Propiedad de decisiones posteriores

| Decisión                                                             | Tarea propietaria                                            |
| -------------------------------------------------------------------- | ------------------------------------------------------------ |
| inventario y clasificación definitiva de información                 | `INFO-DOM-001`; `INFO-DOM-002`                               |
| taxonomía documental, versiones y metadatos                          | `INFO-DOM-003` a `INFO-DOM-005`                              |
| tablas, plazos, triggers, archivo, hold, anonimización y disposición | `INFO-DOM-006`                                               |
| autenticidad, hash, procedencia y cadena de custodia                 | `INFO-DOM-007`; `INFO-DOM-011`; `EVID-ARC-*`                 |
| avisos, derechos, requerimientos y terceros                          | `INFO-DOM-008` a `INFO-DOM-010`                              |
| obligaciones, investigaciones y auditoría de cumplimiento            | `INFO-DOM-012`; `INFO-DOM-013`                               |
| arquitectura de archivos y evidencia                                 | `EVID-ARC-001` a `EVID-ARC-010`                              |
| auditoría física en Supabase, índices, partición y crecimiento       | `SUPA-AUD-020`; `SUPA-ARC-021`; `SUPA-ARC-022`; BLOQUE R     |
| colas, outbox, inbox, reintentos y dead-letter                       | `QUEUE-ARC-*`; BLOQUE E4                                     |
| observabilidad, métricas, soporte y alertas                          | `NFR-REQ-009`; `OBS-ARC-*`                                   |
| backups, restauración, RTO y RPO                                     | `NFR-REQ-010`; `CONT-DOM-002` a `CONT-DOM-004`               |
| autorización de auditoría y evidencia                                | `AUTH-SRV-*`; `AUTH-DB-*`; `INFO-AUTH-001` a `INFO-AUTH-004` |
| experiencia de historial, archivo, hold y disposición                | `NFR-REQ-007`; `INFO-UX-002`; `INFO-UX-005`; `INFO-UX-006`   |
| paquetes y pruebas físicas                                           | `DELIV-PKG-*`; tareas por aplicación; BLOQUES T, R y U       |

No queda un pendiente narrativo sin destino. Esta tarea no fija plazos legales ni estructuras físicas fuera de sus tareas propietarias.

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Esta propuesta incorpora al registro canónico completo:

```text
TREQ-PROC-355 a TREQ-PROC-389
```

Cobertura:

1. sobre auditable y versionado;
2. instancia de proceso y recurso;
3. atribución de actor y contexto;
4. decisiones automáticas;
5. tiempo de ocurrencia, recepción y sincronización;
6. historial no destructivo;
7. corrección, reverso y anulación;
8. correlación y causalidad;
9. idempotencia y deduplicación;
10. integraciones extremo a extremo;
11. offline y conciliación;
12. acceso y divulgación sensibles;
13. auditoría de la propia auditoría;
14. minimización de eventos;
15. evidencia y procedencia;
16. política de retención versionada;
17. triggers de cómputo;
18. mínimo y máximo de retención;
19. estados del ciclo de vida;
20. legal hold;
21. liberación de hold;
22. archivo y legibilidad;
23. elegibilidad de disposición;
24. segregación y aprobación;
25. eliminación y fallas parciales;
26. anonimización y reidentificación;
27. copias, cachés, índices y derivados;
28. terceros;
29. backups;
30. restauración y no resurrección;
31. datos no productivos;
32. migración de historial;
33. matriz de 69 procesos;
34. guardrails;
35. gobierno y certificación.

Mientras la tarea permanezca en propuesta, la evidencia de estas filas deberá indicar expresamente que proviene de `NFR-REQ-006` en propuesta. Al aprobarse, la evidencia se actualizará a tarea aprobada sin cambiar los identificadores.

---

#### 36. Criterios de aceptación

- [ ] Se distinguen hecho, evento, historial, auditoría, observabilidad, evidencia y procedencia.
- [ ] Se distinguen retención, archivo, hold, anonimización, disposición y backup.
- [ ] Todo efecto material puede vincularse con proceso, instancia, recurso, actor, contexto, resultado y política.
- [ ] El sobre de evento admite versiones, correlación, causalidad, idempotencia y tiempos múltiples.
- [ ] Las correcciones no destruyen historial.
- [ ] Las acciones automáticas y de terceros conservan atribución y causa.
- [ ] Offline y sincronización conservan orden, tiempo original, conflicto y conciliación.
- [ ] La auditoría minimiza datos y excluye secretos.
- [ ] Cada categoría retenible exige política versionada, trigger, mínimo, máximo y método de disposición.
- [ ] No existe retención indefinida ni eliminación automática por ausencia de política.
- [ ] Hold bloquea disposición sin ampliar acceso.
- [ ] Archivo conserva integridad, contexto, legibilidad y disposición futura.
- [ ] Disposición trata copias, derivados, terceros y fallas parciales.
- [ ] Restaurar backups reaplica disposiciones y evita resurrección.
- [ ] Consultar o exportar auditoría queda auditado.
- [ ] Cada uno de los 69 procesos tendrá perfil individual antes de implementación.
- [ ] Se incorporan `TREQ-PROC-355` a `TREQ-PROC-389` al registro completo con evidencia de propuesta.
- [ ] Todos los pendientes se vinculan con tareas existentes y exactas.
- [ ] No se implementan código, migraciones, Supabase, Storage, jobs, políticas físicas ni despliegues.
- [ ] `NFR-REQ-007` permanece no iniciada.

---

#### 37. Estado y continuidad

```text
NFR-REQ-004   APROBADA
NFR-REQ-005   APROBADA
NFR-REQ-006   APROBADA
NFR-REQ-007   NO INICIADA
```

La aprobación explícita de esta tarea congelará el contrato no funcional inicial de trazabilidad y retención. No certificará que la implementación actual conserve todos los hechos, que los plazos jurídicos estén validados ni que existan mecanismos físicos de archivo, hold o disposición.


### ✅ NFR-REQ-007 — Definir accesibilidad y ergonomía

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-006 — Definir trazabilidad y retención` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-008 — Definir hardware, red y periféricos requeridos` — NO INICIADA  
**Artefactos aprobados:** `NFR-ACCESSIBILITY-ERGONOMICS-CONTRACT-001`; `NFR-INTERACTION-TARGET-PROFILE-001`; `NFR-PROCESS-ACCESSIBILITY-PROFILE-001`; `NFR-ACCESSIBILITY-TEST-MATRIX-001`; `NFR-ACCESSIBILITY-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de accesibilidad digital, ergonomía física y cognitiva, interacción multimodal, compatibilidad asistiva, prevención y recuperación de errores y validación con personas reales; no certificación jurídica, médica, laboral, de hardware ni de conformidad externa  
**Cambios en código, migraciones, Supabase, aplicaciones, componentes, hardware, estaciones o despliegues:** no autorizados

---

#### 1. Propósito

Definir un contrato verificable para que cada proceso, pantalla, documento, estación, mensaje, formulario, control y resultado de Vento OS pueda ser percibido, comprendido y operado por las personas que realmente lo utilizan, bajo sus condiciones físicas, cognitivas, sensoriales, ambientales y tecnológicas.

```text
UNA FUNCIÓN EXISTE TÉCNICAMENTE
≠ UNA PERSONA PUEDE ENCONTRARLA
≠ PUEDE COMPRENDERLA
≠ PUEDE OPERARLA
≠ PUEDE RECUPERARSE DE UN ERROR

CUMPLIR UN CHECKLIST AUTOMÁTICO
≠ SER ACCESIBLE
≠ SER ERGONÓMICO
≠ SER SEGURO EN OPERACIÓN REAL

INTERFAZ MÁS SIMPLE
≠ MENOS CONTROL
≠ MENOS TRAZABILIDAD
≠ OCULTAR INFORMACIÓN NECESARIA
```

La aprobación de esta tarea congela la línea base no funcional. No declara que las aplicaciones actuales sean accesibles, que una estación física sea ergonómica ni que exista certificación frente a una norma externa.

---

#### 2. Continuidad lógica

`NFR-REQ-001` a `NFR-REQ-006` definieron criticidad, capacidad, tiempo, operación offline, privacidad, trazabilidad y retención. `NFR-REQ-007` determina cómo esas obligaciones deberán llegar a una persona sin crear barreras, confusión, fatiga, errores evitables ni dependencia de una única capacidad sensorial o motriz.

```text
PROCESO + ACTOR + CONTEXTO
        ↓
INFORMACIÓN Y ACCIÓN NECESARIAS
        ↓
MODALIDAD PERCEPTIBLE Y OPERABLE
        ↓
INTERACCIÓN COMPRENSIBLE Y ERGONÓMICA
        ↓
PREVENCIÓN + RECUPERACIÓN DE ERROR
        ↓
VALIDACIÓN CON PERSONAS Y ESTACIÓN REAL
```

`NFR-REQ-008` detallará hardware, red y periféricos. `NFR-REQ-011` definirá compatibilidad mínima por dispositivo. `UX-STATION-002` a `UX-STATION-012` diseñarán la estación e interacción concreta. `PROC-SCREEN-001` a `PROC-SCREEN-028` diseñarán las pantallas. `UX-QA-001` a `UX-QA-030` y los paquetes correspondientes implementarán y certificarán escenarios. Ninguna de esas tareas podrá reducir la línea base aprobada aquí.

---

#### 3. Alcance

El contrato aplica a:

- aplicaciones web, móviles, tablet, kiosco, POS y superficies de escritorio;
- software con funcionalidad cerrada o dependiente de una estación específica;
- pantallas administrativas, operativas, públicas y de cliente;
- autenticación, PIN, cambio de actor, simulación y dispositivo compartido;
- navegación, formularios, tablas, filtros, búsquedas, gráficos y reportes;
- estados, alertas, errores, bloqueos, confirmaciones, tiempos y recuperación;
- lectura, tacto, teclado, mouse, escáner, cámara, voz, audio y respuesta háptica;
- documentos, archivos, exportaciones, impresiones, etiquetas, códigos y evidencias;
- operación online, offline, degradada, en sincronización, con error y en contingencia;
- trabajo de pie, sentado, móvil, con una mano, manos ocupadas, guantes o restricciones temporales;
- ruido, baja iluminación, reflejos, humedad, grasa, vibración, frío, calor y distancia de lectura;
- necesidades visuales, auditivas, motrices, cognitivas, neurológicas, del habla y asociadas al envejecimiento;
- limitaciones permanentes, temporales o situacionales, sin exigir que una persona revele un diagnóstico.

La accesibilidad no se limitará al frontend. Contratos, orden semántico, mensajes, estados, documentos, periféricos, autenticación y procedimientos de contingencia deberán conservar alternativas equivalentes.

---

#### 4. Referencia normativa y alcance de conformidad

La línea base digital será:

1. `WCAG 2.2` niveles `A` y `AA` para contenido y aplicaciones web, cuando el criterio sea aplicable.
2. `WCAG2ICT 2.2` como guía informativa para interpretar los criterios en software no web, documentos y aplicaciones móviles o nativas.
3. Reglas internas adicionales de Vento OS cuando la operación real exija objetivos táctiles mayores, menor carga cognitiva, más tolerancia al error, interacción con guantes, manos ocupadas, ruido, movimiento o funcionalidad cerrada.

```text
LÍNEA BASE EXTERNA
+ PERFIL OPERATIVO INTERNO
+ PRUEBA EN DISPOSITIVO Y ESTACIÓN REAL
+ VALIDACIÓN CON PERSONAS
= CRITERIO DE ACEPTACIÓN DE VENTO OS
```

Una tarea podrá declarar un criterio externo `NO_APLICA` únicamente con análisis documentado. `NO_APLICA` no equivale a `NO IMPLEMENTADO`. La aprobación documental no autoriza publicar una declaración de conformidad externa.

---

#### 5. Principios obligatorios

1. **Perceptible:** la información no dependerá de una sola modalidad sensorial.
2. **Operable:** toda función tendrá una forma de entrada compatible con el perfil aprobado.
3. **Comprensible:** lenguaje, estructura, estados y consecuencias serán predecibles.
4. **Robusto:** nombre, rol, valor, estado y cambios serán interoperables con tecnologías de asistencia cuando la plataforma lo permita.
5. **Equivalencia funcional:** una alternativa accesible deberá permitir completar el mismo resultado empresarial, no una versión incompleta.
6. **Accesibilidad por defecto:** el camino ordinario será accesible; no se relegará a una pantalla paralela desactualizada.
7. **Ergonomía contextual:** frecuencia, alcance, postura, ambiente, manos y riesgo determinarán la interacción.
8. **Prevención antes que corrección:** el diseño reducirá errores previsibles sin impedir la recuperación cuando ocurran.
9. **No dependencia de memoria:** la interfaz conservará contexto, instrucciones y datos ya conocidos.
10. **No penalización:** una necesidad de apoyo, mayor tiempo o modalidad alternativa no se tratará como bajo desempeño del trabajador.
11. **Privacidad equivalente:** tecnologías de asistencia y alternativas no expondrán datos adicionales.
12. **Seguridad proporcional:** accesibilidad no eliminará autorización, segregación, confirmación ni trazabilidad.
13. **Continuidad accesible:** carga, error, offline, sincronización y recuperación deberán ser accesibles, no solo el camino feliz.
14. **Validación humana:** automatización y checklist no sustituirán pruebas manuales ni uso real.
15. **Deuda con vencimiento:** toda excepción tendrá propietario, alternativa, riesgo, fecha y tarea de cierre.

---

#### 6. Modelo de necesidades

El diseño no dependerá de categorías médicas. Cada perfil se evaluará por capacidades y condiciones observables:

| Dimensión   | Preguntas mínimas                                                                           |
| ----------- | ------------------------------------------------------------------------------------------- |
| visión      | ¿requiere zoom, texto grande, contraste, lector de pantalla o reducción de reflejo?         |
| audición    | ¿la señal sonora tiene equivalente visual o háptico y puede distinguirse del ruido?         |
| motricidad  | ¿puede operarse sin precisión fina, arrastre obligatorio, multitacto o alcance excesivo?    |
| cognición   | ¿la acción, el estado, el lenguaje y la recuperación se comprenden sin memoria innecesaria? |
| habla       | ¿existe alternativa cuando una función use voz o comunicación oral?                         |
| temporal    | ¿el tiempo disponible admite extensión, pausa o recuperación sin pérdida?                   |
| situacional | ¿funciona con guantes, una mano, manos húmedas, ruido, movimiento o luz adversa?            |
| tecnológica | ¿funciona con teclado, tacto, mouse, accesibilidad de plataforma y dispositivo objetivo?    |

No se recopilarán diagnósticos para justificar una mejora de interfaz. Cuando sea necesario gestionar una adaptación individual, su información pertenecerá a TALENTO y privacidad, no a telemetría ordinaria de producto.

---

#### 7. Perfiles de interacción

`NFR-INTERACTION-TARGET-PROFILE-001` define perfiles iniciales acumulativos:

| Perfil            | Uso                                                 | Reglas mínimas                                                                      |
| ----------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `A11Y-WEB-AA`     | web y backoffice                                    | WCAG 2.2 A/AA aplicable, teclado, foco, semántica, reflow y errores                 |
| `A11Y-MOBILE-AA`  | móvil y tablet personal                             | línea base anterior adaptada a plataforma, orientación y texto del sistema          |
| `A11Y-CLOSED`     | kiosco, POS o estación cerrada                      | equivalentes integrados cuando no pueda instalarse tecnología de asistencia externa |
| `ERGO-TOUCH`      | operación táctil frecuente                          | objetivos táctiles ampliados, separación y prevención de pulsación accidental       |
| `ERGO-GLOVED`     | guantes, humedad o precisión reducida               | controles mayores, menor densidad, confirmación y alternativa a teclado fino        |
| `ERGO-HANDS-BUSY` | una mano o manos ocupadas                           | captura contextual, escáner o secuencia breve sin perder trazabilidad               |
| `ERGO-NOISY`      | cocina, barra, producción o despacho                | ninguna alerta depende solo de audio; prioridad visible y distinguible              |
| `ERGO-LOW-LIGHT`  | reflejo, baja luz o distancia                       | contraste, tamaño, brillo y ubicación validados físicamente                         |
| `ERGO-HIGH-RISK`  | dinero, inventario, acceso, seguridad o disposición | confirmación contextual, separación de acciones, resumen y recuperación segura      |

Cada proceso podrá combinar perfiles. Una aplicación no tendrá un único perfil global.

---

#### 8. Semántica y estructura programática

Todo componente deberá exponer, cuando la plataforma lo permita:

- nombre accesible único y comprensible;
- rol correcto;
- valor, estado, selección, expansión y disponibilidad;
- relaciones entre etiqueta, instrucción, error y control;
- agrupación, encabezados, regiones y orden de lectura;
- acción disponible y resultado del cambio;
- mensajes de estado sin obligar a mover el foco;
- idioma principal y cambios de idioma relevantes.

Un `div`, ícono, color o texto visual no sustituirá un control semántico. Un componente personalizado no se aprobará hasta demostrar equivalencia con el componente nativo o estándar que reemplaza.

---

#### 9. Navegación, teclado y foco

1. Toda función web o administrativa deberá poder ejecutarse con teclado cuando la plataforma lo admita.
2. No existirá trampa de teclado ni foco inaccesible.
3. El orden de foco seguirá el orden lógico de trabajo, no la posición accidental del DOM.
4. El foco será visible, no quedará completamente oculto por encabezados, pies, modales o paneles.
5. Al abrir o cerrar un modal, cambiar de aplicación, actualizar una lista o resolver un error, el foco regresará a un punto lógico.
6. Atajos no serán la única vía, se documentarán y no interferirán con tecnologías de asistencia.
7. Una acción destructiva no se ejecutará por una sola tecla no modificada ni por foco accidental.
8. Saltos de navegación y regiones permitirán evitar bloques repetidos cuando sean aplicables.

---

#### 10. Objetivos táctiles y precisión

Se establecen tres clases internas, medidas en unidades lógicas equivalentes y verificadas en el dispositivo real:

| Clase          |                    Mínimo de diseño | Uso                                                                |
| -------------- | ----------------------------------: | ------------------------------------------------------------------ |
| `TARGET-MIN`   | `24 × 24` con separación suficiente | controles ordinarios no críticos y no frecuentes                   |
| `TARGET-TOUCH` |                           `44 × 44` | valor predeterminado para tablet, móvil, POS y kiosco táctil       |
| `TARGET-GLOVE` |                           `56 × 56` | guantes, humedad, vibración, movimiento o acción crítica frecuente |

Reglas:

- el área activable completa coincidirá con la representación visible o será mayor;
- controles vecinos con efectos opuestos tendrán separación y jerarquía inequívocas;
- el responsive no reducirá silenciosamente la clase aprobada;
- una fila completa podrá ser activable si nombre, foco y acciones secundarias permanecen claros;
- se medirá tasa de pulsación errónea en dispositivo real;
- `UX-STATION-002`, `UX-STATION-006`, `UX-STATION-008` y `NFR-REQ-011` podrán elevar el tamaño, nunca reducirlo sin excepción aprobada.

---

#### 11. Gestos, arrastre y mecanismos alternativos

- toda acción basada en arrastre tendrá alternativa de un solo puntero sin arrastre, salvo que el movimiento sea esencial;
- no se exigirá multitacto, presión, trayectoria precisa, sacudida o inclinación como única vía;
- swipe, long press y hover serán atajos, no funciones exclusivas;
- los gestos deberán poder cancelarse o revertirse antes de confirmar el efecto;
- escáner, cámara o lectura automática tendrán captura manual o procedimiento alterno controlado;
- una alternativa no podrá omitir identificación, autorización, cantidades, confirmación o evidencia.

---

#### 12. Texto, lenguaje e instrucciones

1. El idioma ordinario será español claro y operativo.
2. Términos técnicos, códigos y abreviaturas se explicarán cuando el actor no deba conocerlos.
3. La etiqueta describirá la acción o dato, no su posición visual.
4. Placeholder no sustituirá etiqueta persistente.
5. Instrucciones aparecerán antes de la decisión o dato al que aplican.
6. Fecha, hora, unidad, moneda, cantidad y precisión serán explícitas.
7. Mensajes evitarán culpa, ambigüedad y códigos técnicos sin traducción.
8. La acción principal y el siguiente paso serán identificables sin capacitación especializada.
9. Una interfaz no dependerá de recordar información mostrada en otra pantalla o aplicación.

---

#### 13. Presentación visual

La línea base exigirá:

- contraste mínimo `4.5:1` para texto ordinario;
- contraste mínimo `3:1` para texto grande y componentes o estados visuales esenciales;
- ningún significado transmitido solo por color, posición, forma, sonido o animación;
- texto redimensionable hasta `200 %` sin pérdida de contenido ni función;
- reflow hasta el ancho equivalente a `320 CSS px` cuando aplique, sin scroll en dos dimensiones salvo contenido esencial;
- compatibilidad con orientación vertical y horizontal salvo restricción operativa esencial documentada;
- ausencia de texto importante incrustado únicamente en imágenes;
- iconos acompañados por etiqueta o nombre accesible cuando su significado no sea universal;
- modo de alto contraste y preferencias de plataforma sin ocultar estados o foco.

Tablas o superficies densas podrán requerir una vista especializada, pero no reducirán tipografía, objetivos o contexto hasta hacerlos ilegibles.

---

#### 14. Movimiento, parpadeo y actualización automática

- no se usarán destellos por encima de límites seguros ni animaciones que impidan operar;
- movimiento, parpadeo, carrusel o actualización automática no esencial podrá pausarse, detenerse u ocultarse;
- animación por interacción respetará la preferencia de reducción de movimiento;
- progreso, sincronización y carga se informarán sin bucles visuales invasivos;
- una actualización de lista no robará foco, cambiará selección ni desplazará la acción que se está ejecutando;
- alertas repetidas se agruparán y conservarán prioridad sin fatiga de notificación.

---

#### 15. Audio, háptica y señales sensoriales

Toda señal material tendrá al menos dos modalidades cuando el contexto lo exija:

```text
SONIDO
+ ESTADO VISUAL
+ OPCIONALMENTE HÁPTICA
```

- campanas, alarmas y confirmaciones tendrán significado visual persistente;
- información hablada tendrá equivalente textual;
- audio no iniciará automáticamente de forma intrusiva;
- volumen y vibración respetarán la plataforma cuando no comprometan seguridad;
- color o vibración no serán la única diferencia entre prioridades;
- una impresora, escáner o datáfono no se considerará exitoso solo por sonido o luz física.

---

#### 16. Formularios, captura y entrada redundante

1. Los campos conocidos se conservarán o precargarán desde la fuente autorizada.
2. No se solicitará de nuevo información disponible en la misma instancia salvo confirmación, seguridad o cambio explícito.
3. Agrupación, formato y unidad serán visibles antes de escribir.
4. Autocompletado y teclado adecuado se usarán cuando no comprometan privacidad.
5. El sistema conservará datos válidos después de un error.
6. Los formatos tolerarán variaciones razonables y normalizarán de forma explícita.
7. Lectura por escáner o cámara mostrará el valor interpretado antes del efecto cuando exista riesgo.
8. La entrada por voz no será obligatoria.
9. Copiar y pegar no se bloqueará salvo riesgo documentado y alternativa accesible.

---

#### 17. Errores y recuperación

Todo error deberá indicar:

```text
QUÉ OCURRIÓ
+ QUÉ CAMPO, RECURSO O PASO AFECTA
+ POR QUÉ NO PUEDE CONTINUAR
+ QUÉ DEBE HACER LA PERSONA
+ QUÉ INFORMACIÓN SE CONSERVÓ
+ DÓNDE OBTENER AYUDA
```

Reglas:

- el error se asociará programáticamente al control o región;
- se mostrará resumen cuando existan múltiples errores;
- el foco irá al primer problema lógico sin perder contexto;
- no se borrarán entradas válidas;
- errores de autorización, conectividad, validación y conflicto se distinguirán;
- códigos técnicos podrán conservarse como referencia secundaria, no como explicación principal;
- una persona podrá salir y volver sin crear una segunda intención ni perder evidencia.

---

#### 18. Prevención de errores críticos

Para dinero, inventario, producción, acceso, datos sensibles, publicación, disposición o acciones irreversibles se exigirá, según riesgo:

- resumen previo de recurso, cantidad, unidad, sede, área, actor y consecuencia;
- confirmación contextual, no un diálogo genérico;
- separación física y visual entre acción principal y destructiva;
- autorización y segregación independientes de la interfaz;
- posibilidad de cancelar antes del commit;
- deshacer, corregir, compensar o escalar después, según contrato;
- detección de duplicado, valor atípico, unidad incompatible o recurso incorrecto;
- evidencia de quién confirmó y con cuál contexto.

No se usará fricción indiscriminada para operaciones frecuentes de bajo riesgo.

---

#### 19. Tiempo, sesión y autenticación

- una tarea no perderá datos por timeout sin advertencia previa y recuperación;
- cuando sea seguro, la persona podrá extender o reanudar el tiempo;
- seguridad de dispositivo compartido podrá exigir cierre breve, pero conservará borrador protegido o mecanismo de recuperación;
- cuenta regresiva será perceptible y no dependerá solo de color;
- autenticación no exigirá recordar, transcribir o resolver una prueba cognitiva sin alternativa permitida;
- PIN, OTP, biometría, enlace o credencial tendrán instrucciones, errores y recuperación accesibles;
- pegar códigos y usar gestores de contraseñas se permitirá cuando la plataforma y política lo admitan;
- el cambio de actor no heredará foco, datos visibles ni borrador sensible de la persona anterior.

---

#### 20. Estado, carga, offline y sincronización

La persona deberá poder distinguir:

- estado empresarial actual;
- estado local o borrador;
- conectividad con backend;
- disponibilidad de periférico;
- acción en progreso;
- resultado confirmado;
- resultado desconocido;
- pendiente de sincronización;
- conflicto o revisión requerida.

Cada cambio material tendrá texto y anuncio programático cuando corresponda. Spinner, color verde o desaparición del botón no serán evidencia suficiente. La interfaz bloqueará doble activación sin ocultar el estado ni atrapar el foco.

---

#### 21. Carga cognitiva y jerarquía de tarea

1. Cada superficie operativa tendrá una acción principal inequívoca por contexto.
2. Se mostrará primero lo necesario para decidir y actuar.
3. Información secundaria usará divulgación progresiva sin quedar inaccesible.
4. Estado, pendiente, excepción y siguiente paso estarán juntos cuando sea posible.
5. No se mezclarán administración, configuración y operación ordinaria.
6. Las opciones irrelevantes por rol, proceso o estado no se presentarán como disponibles.
7. Una secuencia larga se dividirá en pasos con progreso y posibilidad de revisión.
8. Nombres, iconos, ubicación y comportamiento serán consistentes entre aplicaciones.
9. Se evitarán interrupciones, modales y confirmaciones innecesarias.
10. El diseño no dependerá de capacitación para descubrir controles básicos.

---

#### 22. Ergonomía física y estación

Cada paso deberá evaluar:

- altura, postura, ángulo y distancia de lectura;
- alcance cómodo y repetición;
- uso sentado, de pie o en movimiento;
- una mano, dos manos, manos ocupadas o guantes;
- fuerza, precisión y duración de interacción;
- ubicación de escáner, cámara, impresora, báscula o datáfono;
- cables, energía, montaje, limpieza y protección;
- visibilidad para la persona autorizada y privacidad frente a terceros;
- riesgo de contacto con alimentos, humedad, grasa, calor o frío;
- fatiga acumulada durante picos y tareas repetitivas.

`NFR-REQ-007` no selecciona hardware. Los mínimos físicos se concretarán en `UX-STATION-002` a `UX-STATION-009`, `NFR-REQ-008` y `NFR-REQ-011` mediante prototipos y medición real.

---

#### 23. Entorno adverso

| Condición              | Respuesta mínima                                                            |
| ---------------------- | --------------------------------------------------------------------------- |
| ruido                  | alertas visuales persistentes y prioridad legible                           |
| reflejo o baja luz     | contraste y brillo validados en ubicación real                              |
| humedad o grasa        | objetivos grandes, menor precisión y limpieza segura                        |
| guantes                | `TARGET-GLOVE`, alternativa a teclado fino y escáner evaluado               |
| movimiento o vibración | estabilizar selección, ampliar controles y evitar arrastre                  |
| distancia              | tipografía, estado y siguiente acción legibles desde la posición de trabajo |
| manos ocupadas         | captura contextual o periférico sin omitir confirmación crítica             |
| interrupciones         | reanudación con contexto y estado de la intención                           |

No se aprobará una modalidad solo porque funcione en un escritorio de desarrollo.

---

#### 24. Tablas, gráficos y datos densos

- tablas tendrán encabezados y relaciones semánticas;
- orden, filtro, selección y expansión serán anunciables;
- foco y selección sobrevivirán actualizaciones previsibles;
- gráficos tendrán título, resumen, valores o tabla equivalente;
- color no será la única codificación;
- zoom y texto grande no ocultarán filtros activos ni unidad;
- operaciones masivas mostrarán alcance, excepciones y consecuencia;
- móvil o tablet reordenará contenido, usará tarjetas o limitará de forma explícita la operación incompatible;
- exportar no será el único camino accesible para comprender el dato.

---

#### 25. Documentos, impresiones, etiquetas y códigos

1. Documentos generados conservarán estructura, idioma, títulos, encabezados, orden de lectura, texto alternativo y tablas cuando el formato lo permita.
2. Un PDF escaneado sin texto no será la única copia operativa.
3. La impresión conservará contenido esencial sin depender de color.
4. Etiquetas y códigos tendrán texto humano mínimo que permita identificar y recuperar la operación.
5. QR, DataMatrix, Code128 o lectura por cámara tendrán alternativa manual autorizada.
6. Un código ilegible no obligará a crear un recurso duplicado.
7. Evidencia visual tendrá descripción o metadatos suficientes según finalidad.
8. Documentos sensibles conservarán la protección de `NFR-REQ-005` y la trazabilidad de `NFR-REQ-006` también en su representación accesible.

---

#### 26. Privacidad, seguridad y accesibilidad

- nombres accesibles, labels, tooltips, anuncios y notificaciones no revelarán secretos o datos ocultos visualmente;
- masking visual deberá coincidir con el contenido expuesto a tecnologías de asistencia;
- lectores de pantalla no recibirán columnas o acciones fuera del permiso;
- una alternativa accesible no eludirá autorización ni segregación;
- capturas, grabaciones y pruebas no recopilarán datos personales innecesarios;
- preferencias de accesibilidad se tratarán como configuración mínima, no como diagnóstico;
- mensajes de privacidad, consentimiento y autorización serán comprensibles y operables;
- el modo de alto contraste o texto grande no expondrá contenido superpuesto de otro actor.

---

#### 27. Personalización y preferencias

Cuando la plataforma lo permita, se respetarán:

- tamaño de texto;
- zoom;
- alto contraste y colores del sistema;
- reducción de movimiento;
- lector de pantalla y navegación por interruptor;
- teclado externo;
- orientación;
- subtítulos y volumen;
- idioma y formatos regionales aprobados.

Una preferencia podrá persistirse por persona en dispositivo personal. En estación compartida deberá aplicarse después de identificar al actor, evitar exponer información personal y restablecerse al cerrar la sesión.

---

#### 28. Prohibición de sustitutos falsos

No se aceptará como solución suficiente:

- overlay o widget de accesibilidad que intente corregir una interfaz inaccesible;
- ruta paralela incompleta o desactualizada;
- ocultar controles a tecnologías de asistencia sin alternativa;
- texto alternativo genérico generado sin revisión;
- declaración de cumplimiento basada solo en Lighthouse u otra herramienta automática;
- exigir que la persona cambie de dispositivo para completar una tarea ordinaria sin análisis y alternativa;
- soporte humano como única forma de operar una función que debería ser autónoma;
- capacitar para memorizar una interfaz inconsistente en lugar de corregirla.

---

#### 29. Perfil por proceso

`NFR-PROCESS-ACCESSIBILITY-PROFILE-001` deberá contener exactamente una fila por `VPROC-0001` a `VPROC-0069` con:

```text
process_id
process_version
actor_and_context
critical_steps
station_and_device
frequency_and_duration
risk_class
sensory_demands
motor_demands
cognitive_demands
environmental_conditions
input_modalities
output_modalities
assistive_technology_expectations
target_profile
text_and_contrast_profile
timeout_policy
error_prevention
error_recovery
accessible_alternative
document_and_print_requirements
privacy_constraints
required_test_scenarios
responsible_tasks
status_and_evidence
```

Una fila global por aplicación no sustituirá el perfil del proceso. Un proceso con etapas materialmente diferentes podrá declarar subperfiles sin duplicar su identidad.

---

#### 30. Estrategia de pruebas

Cada paquete deberá combinar, según aplicabilidad:

1. validación estática de semántica y contratos;
2. pruebas automatizadas de regresión accesible;
3. navegación completa con teclado;
4. lector de pantalla en combinaciones objetivo;
5. zoom, reflow, texto grande, alto contraste y reducción de movimiento;
6. tacto en hardware real, incluyendo tasa de pulsación errónea;
7. condiciones de ruido, iluminación, guantes, movilidad y manos ocupadas;
8. error, timeout, offline, sincronización y recuperación;
9. documentos, impresión, escáner y periféricos;
10. validación con trabajadores reales y, cuando sea posible, personas con necesidades representativas.

La automatización detectará parte de los defectos, pero no certificará comprensibilidad, orden de trabajo, ergonomía ni equivalencia funcional.

---

#### 31. Métricas y guardrails

Se medirán por escenario:

- tasa de finalización;
- tiempo de tarea sin usarlo de forma punitiva;
- errores, pulsaciones incorrectas y reintentos;
- abandono y solicitud de ayuda;
- pérdida de foco o contexto;
- recuperación exitosa;
- lectura o interpretación incorrecta;
- fatiga, dolor o incomodidad reportada;
- diferencias entre dispositivo de laboratorio y estación real;
- defectos por severidad y tiempo de cierre.

Un diseño no se aprobará por reducir tiempo si aumenta error, fatiga, exclusión, riesgo o necesidad de asistencia.

---

#### 32. Severidad de defectos

| Severidad | Definición                                                                                           | Regla de salida                                  |
| --------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| `A11Y-P0` | impide una acción crítica, crea riesgo físico, financiero, de acceso o datos, sin alternativa segura | bloquea paquete y despliegue                     |
| `A11Y-P1` | impide completar una función principal a una población o modalidad soportada                         | bloquea certificación y piloto ampliado          |
| `A11Y-P2` | genera dificultad material, error recurrente o dependencia de ayuda con alternativa parcial          | exige tarea, responsable y fecha antes de cierre |
| `A11Y-P3` | mejora de calidad sin bloqueo material inmediato                                                     | puede planificarse con evidencia y prioridad     |

La severidad considerará impacto, frecuencia, población, riesgo y existencia real de alternativa, no solo número de usuarios observados.

---

#### 33. Excepciones

Toda excepción deberá registrar:

```text
exception_id
criterion_or_rule
process_and_step
users_and_modalities_affected
reason
risk
accessible_alternative
owner
approval
created_at
expires_at
closure_task
validation_evidence
```

No se aprobará una excepción indefinida. La incompatibilidad de un proveedor, periférico o sistema legacy generará una tarea de resolución y un procedimiento alterno verificable. Una barrera crítica sin alternativa bloqueará el proceso o la funcionalidad afectada.

---

#### 34. Propiedad de decisiones posteriores

| Decisión                             | Tarea propietaria                                 |
| ------------------------------------ | ------------------------------------------------- |
| modalidad por paso                   | `UX-STATION-002`                                  |
| perfil de estación                   | `UX-STATION-003`                                  |
| cambio de actor compartido           | `UX-STATION-004`; `AUTH-DEV-001` a `AUTH-DEV-016` |
| superficie contextual                | `UX-STATION-005`                                  |
| periféricos y montaje                | `UX-STATION-006`; `NFR-REQ-008`                   |
| contingencia y recuperación          | `UX-STATION-007`; `NFR-REQ-004`; `NFR-REQ-010`    |
| prototipo con trabajadores           | `UX-STATION-008`                                  |
| matriz final de estación             | `UX-STATION-009`                                  |
| gramática y lectura mínima           | `UX-STATION-010` a `UX-STATION-012`               |
| pantallas por proceso                | `PROC-SCREEN-001` a `PROC-SCREEN-028`             |
| compatibilidad por dispositivo       | `NFR-REQ-011`                                     |
| implementación y pruebas por paquete | `SHELL-CI-020` a `SHELL-CI-024`; paquetes E5      |
| certificación transversal            | `UX-QA-001` a `UX-QA-030`; BLOQUE U               |

Todo hallazgo deberá vincularse de inmediato con una de estas tareas o crear una nueva tarea explícita en el bloque correspondiente.

---

#### 35. Guardrails de cierre

Deberán fallar CI, revisión, readiness, piloto o certificación cuando aplique cualquiera de estas condiciones:

- control sin nombre, rol, estado o etiqueta resoluble;
- función principal inaccesible por teclado o modalidad aprobada;
- foco invisible, perdido o completamente oculto;
- significado transmitido solo por color, sonido o posición;
- objetivo táctil inferior al perfil aprobado;
- arrastre o gesto complejo sin alternativa;
- texto o interfaz inutilizable con zoom, reflow o texto grande;
- error sin identificación, preservación o recuperación;
- timeout que elimina trabajo sin advertencia;
- acción crítica sin resumen, separación o confirmación proporcional;
- estado offline, pendiente o desconocido no perceptible;
- alternativa accesible que reduce autorización, privacidad o trazabilidad;
- documento esencial sin estructura o alternativa;
- barrera `A11Y-P0` o `A11Y-P1` abierta sin alternativa aprobada;
- paquete sin perfil de proceso, matriz de pruebas y evidencia en dispositivo real.

---

#### 36. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PROC-390 a TREQ-PROC-424
```

Cobertura:

1. línea base y aplicabilidad de WCAG;
2. principios y equivalencia funcional;
3. semántica de componentes;
4. estructura y orden de lectura;
5. teclado y ausencia de trampas;
6. foco visible y no oculto;
7. objetivos táctiles por perfil;
8. alternativas a gestos y arrastre;
9. contraste y señales no dependientes de color;
10. zoom, texto grande, reflow y orientación;
11. lenguaje, etiquetas e instrucciones;
12. identificación y recuperación de errores;
13. prevención de errores críticos;
14. mensajes de estado y actualización;
15. tiempos, sesión y autenticación;
16. movimiento, parpadeo y reducción de movimiento;
17. audio, háptica y alternativas sensoriales;
18. carga cognitiva y acción principal;
19. entrada redundante y preservación de contexto;
20. postura, alcance y fatiga;
21. ruido, luz, humedad, guantes y movimiento;
22. frecuencia y clase de objetivo;
23. estación compartida y cambio de actor;
24. offline, sincronización y resultado desconocido;
25. autenticación accesible;
26. responsive y preferencias de plataforma;
27. tablas, gráficos y datos densos;
28. documentos, impresiones y etiquetas;
29. códigos, escáner y alternativa manual;
30. seguridad y privacidad equivalentes;
31. personalización sin exposición;
32. compatibilidad con dispositivos y tecnologías de asistencia;
33. pruebas con trabajadores y necesidades representativas;
34. evidencia, severidad y excepciones;
35. perfiles de 69 procesos y certificación.

La evidencia deberá indicar que proviene de `NFR-REQ-007` aprobada.

---

#### 37. Criterios de aceptación

- [ ] Se adopta WCAG 2.2 A/AA aplicable y WCAG2ICT como guía, sin declarar certificación externa.
- [ ] Se cubren necesidades visuales, auditivas, motrices, cognitivas, temporales, situacionales y tecnológicas.
- [ ] Se definen perfiles digitales, táctiles, cerrados y de entorno adverso.
- [ ] Nombre, rol, valor, estado, relaciones y mensajes son programáticamente determinables cuando aplica.
- [ ] Teclado, foco, gestos, objetivos táctiles y alternativas tienen reglas verificables.
- [ ] Contraste, color, zoom, reflow, orientación y reducción de movimiento tienen mínimos explícitos.
- [ ] Formularios preservan contexto y evitan entrada redundante.
- [ ] Errores indican cómo continuar y no destruyen trabajo válido.
- [ ] Acciones críticas aplican prevención proporcional y recuperación segura.
- [ ] Timeout, autenticación y cambio de actor son accesibles sin degradar seguridad.
- [ ] Offline, periféricos y resultado desconocido conservan estados perceptibles.
- [ ] La ergonomía considera postura, alcance, frecuencia, fatiga y ambiente real.
- [ ] Tablas, gráficos, documentos, impresiones y códigos tienen alternativas equivalentes.
- [ ] Accesibilidad no expone datos ni evade autorización o trazabilidad.
- [ ] Overlays, rutas paralelas incompletas y automatización aislada no se aceptan como conformidad.
- [ ] Los 69 procesos tendrán perfil individual antes de implementación.
- [ ] Las pruebas combinan automatización, revisión manual, tecnologías de asistencia, hardware y personas reales.
- [ ] Defectos `A11Y-P0` y `A11Y-P1` bloquean cierre según la regla aprobada.
- [ ] Toda excepción tiene propietario, alternativa, vencimiento y tarea de cierre.
- [ ] Se incorporan `TREQ-PROC-390` a `TREQ-PROC-424` al registro completo.
- [ ] No se implementan código, migraciones, Supabase, componentes, hardware ni despliegues.
- [ ] `NFR-REQ-008` permanece no iniciada.

---

#### 38. Estado y continuidad

```text
NFR-REQ-005   APROBADA
NFR-REQ-006   APROBADA
NFR-REQ-007   APROBADA
NFR-REQ-008   NO INICIADA
```

La aprobación explícita de esta tarea congela el contrato no funcional inicial de accesibilidad y ergonomía. No certifica las aplicaciones actuales, los dispositivos, las estaciones ni la conformidad frente a normas o legislación externa.


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

| Señal | Uso | Regla |
| --- | --- | --- |
| métricas | tendencias, tasas, percentiles, capacidad y alertas | unidades, dimensiones y cardinalidad controladas |
| logs estructurados | detalle de eventos, errores y decisiones técnicas | esquema estable, nivel, contexto y redacción segura |
| trazas | recorrido de solicitudes, comandos, jobs e integraciones | contexto propagado y spans con límites claros |
| health checks | disponibilidad de capacidades concretas | no mezclar liveness, readiness y salud empresarial |
| pruebas black-box | comportamiento visible desde fuera | validar camino real, no solo proceso interno |
| eventos empresariales | hechos materiales de dominio | propiedad y contrato de `PROC-CAT-017` |
| auditoría | actor, autorización, cambio y evidencia | propiedad de `NFR-REQ-006` y contratos de auditoría |

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

| Nivel | Uso permitido |
| --- | --- |
| `TRACE` | diagnóstico temporal y muestreado en ambientes autorizados |
| `DEBUG` | detalle de desarrollo o diagnóstico controlado, desactivado por defecto en producción |
| `INFO` | hitos técnicos esperados y de volumen razonable |
| `WARN` | degradación, fallback, reintento o condición recuperable |
| `ERROR` | operación fallida o resultado no obtenido que exige análisis |
| `FATAL` | componente incapaz de continuar de forma segura |

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

| Estado | Pregunta |
| --- | --- |
| liveness | ¿el componente puede seguir ejecutándose? |
| readiness | ¿puede aceptar trabajo de forma segura? |
| dependency health | ¿las dependencias necesarias responden dentro del contrato? |
| degraded | ¿opera con limitaciones explícitas y controladas? |
| business health | ¿el efecto empresarial extremo a extremo está ocurriendo? |
| data health | ¿los datos están frescos, completos y conciliados? |
| device/peripheral health | ¿la estación puede ejecutar el paso físico requerido? |

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

| Nivel | Condición inicial | Respuesta esperada |
| --- | --- | --- |
| `OBS-P0` | riesgo inmediato para personas, seguridad, dinero, integridad crítica o interrupción amplia sin alternativa | atención inmediata, coordinación y comunicación ejecutiva aplicable |
| `OBS-P1` | proceso crítico degradado o interrumpido, efecto creciente o alternativa insuficiente | atención prioritaria dentro de la ventana definida y escalamiento |
| `OBS-P2` | degradación limitada, capacidad cercana al límite o workaround controlado | ticket priorizado, análisis y fecha de resolución |
| `OBS-P3` | tendencia, deuda o mejora sin impacto actual material | backlog gobernado y revisión periódica |

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

| Nivel | Ejemplo | Efecto |
| --- | --- | --- |
| `OBS-GAP-P0` | proceso crítico sin detección, alerta no entregada o telemetría que expone secretos | bloquea piloto, cutover u operación |
| `OBS-GAP-P1` | alerta crítica sin runbook, correlación rota o salud empresarial no observable | bloquea release o aceptación |
| `OBS-GAP-P2` | diagnóstico parcial con control compensatorio y plazo | aceptación condicionada |
| `OBS-GAP-P3` | mejora de detalle o eficiencia sin riesgo material actual | planificable |

`NFR-OBSERVABILITY-EXCEPTION-REGISTER-001` exigirá alcance, riesgo, señal faltante, control compensatorio, propietario, vencimiento, tarea de cierre y evidencia. No habrá excepciones permanentes por limitación histórica de la herramienta.

---

#### 45. Responsabilidad documental

| Decisión o implementación | Tarea propietaria |
| --- | --- |
| arquitectura de señales y correlación | `OBS-ARC-001` a `OBS-ARC-016` |
| operación de monitoreo y salud | `TI-DOM-010`; `TI-INT-001` |
| incidentes, prioridades y soporte | `TI-DOM-001`; `TI-DOM-007`; `TI-UX-001`; `TI-UX-002`; `TI-UX-004` |
| problemas y causa raíz | `TI-DOM-008`; `TI-UX-004` |
| cambios y correlación de releases | `TI-DOM-009`; BLOQUE T |
| seguridad de soporte y diagnóstico | `TI-AUTH-001` a `TI-AUTH-004` |
| mapa de salud técnica | `TI-UX-003`; `TI-UX-006` |
| integraciones con herramientas y proveedores | `TI-INT-001` a `TI-INT-003` |
| colas y eventos | `QUEUE-ARC-001` a `QUEUE-ARC-012`; contratos E3/E4 |
| impresión y periféricos | `PRINT-ARC-001` a `PRINT-ARC-020`; `NFR-REQ-008` |
| privacidad y retención | `NFR-REQ-005`; `NFR-REQ-006`; `INFO-DOM-*` |
| respaldo y recuperación | `NFR-REQ-010`; `CONT-DOM-001` a `CONT-DOM-015` |
| implementación por repositorio | paquetes E5 propietarios |
| pruebas y certificación | `SHELL-CI-020` a `SHELL-CI-024`; `UX-QA-001` a `UX-QA-030`; BLOQUE U |

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

| Concepto | Significado canónico |
| --- | --- |
| alta disponibilidad | capacidad de mantener o reanudar servicio mediante redundancia sin restaurar una copia histórica |
| réplica | copia operativa sincronizada que puede propagar corrupción, eliminación o cifrado |
| snapshot | captura puntual cuya consistencia y dependencia deberán comprobarse |
| backup | copia administrada para recuperación, con catálogo, política, integridad, retención y aislamiento |
| archive | conservación de largo plazo o evidencia; no presume recuperación operativa rápida |
| export | extracción portátil que puede ser incompleta, no consistente o no restaurable |
| rollback | retorno de código, configuración o migración; no sustituye recuperación de datos |
| failover | traslado del servicio a una capacidad alterna; puede conservar el mismo estado corrupto |
| restore | reconstrucción técnica desde una copia o cadena de recuperación |
| recovery | retorno verificado del servicio mínimo empresarial y posterior conciliación |
| reconciliation | comparación y resolución de hechos faltantes, duplicados, tardíos o conflictivos |

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

| Perfil | Criterio |
| --- | --- |
| `RC0_SAFETY_INTEGRITY` | seguridad humana, acceso crítico, dinero, integridad o efecto irreversible |
| `RC1_CRITICAL_OPERATION` | operación principal sin alternativa sostenible o con acumulación rápida de daño |
| `RC2_IMPORTANT_OPERATION` | interrupción material con alternativa temporal limitada |
| `RC3_SUPPORTING` | capacidad necesaria para normalización, análisis o eficiencia, con workaround viable |
| `RC4_RECONSTRUCTIBLE` | objeto o capacidad demostrablemente regenerable sin pérdida material ni dependencia circular |

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

| Clase | Ejemplos | Tratamiento |
| --- | --- | --- |
| `REC-GAP-P0` | fuente crítica sin copia aislada; llave irrecuperable; restauración imposible; RTO o RPO crítico sin dueño | bloquea piloto o producción aplicable |
| `REC-GAP-P1` | restauración no probada; cadena incompleta; grupo inconsistente; runbook crítico vencido | resolución antes de readiness o control temporal aprobado |
| `REC-GAP-P2` | cobertura parcial, automatización insuficiente o evidencia antigua con alternativa viable | tarea y fecha obligatorias |
| `REC-GAP-P3` | mejora de eficiencia o documentación sin riesgo inmediato | backlog priorizado |

Toda excepción tendrá alcance, causa, riesgo, control, responsable, vencimiento, criterio de salida y autoridad de aceptación.

---

#### 42. Responsabilidad documental

| Decisión o implementación | Tarea propietaria |
| --- | --- |
| análisis de impacto y objetivos numéricos | `CONT-DOM-002` a `CONT-DOM-004` |
| política e inventario de respaldos | `CONT-DOM-011`; `TI-DOM-011` |
| runbooks, restauración, failover y retorno | `CONT-DOM-012`; `CONT-UX-005` |
| proveedores y recursos alternativos | `CONT-DOM-013`; `CONT-INT-003` |
| ejercicios | `CONT-DOM-014`; `CONT-UX-007` |
| lecciones y mantenimiento | `CONT-DOM-015` |
| autorización de recuperación | `CONT-AUTH-001` a `CONT-AUTH-004`; `TI-AUTH-001` a `TI-AUTH-004` |
| arquitectura de Supabase y Storage | tareas `SUPA-ARC-*`, `SUPA-TRANS-*` y BLOQUE R aplicables |
| colas, replay y conciliación | `QUEUE-ARC-*`; `CONT-INT-004` |
| observabilidad y soporte | `NFR-REQ-009`; `OBS-ARC-*`; BLOQUE Z |
| implementación por dominio | paquetes E5 propietarios |
| certificación transversal | readiness, BLOQUE T y BLOQUE U |

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

| Estado | Significado |
| --- | --- |
| `SUPPORTED` | combinación verificada, soportada y sin limitaciones materiales no declaradas |
| `SUPPORTED_WITH_CONDITIONS` | compatible bajo condiciones explícitas de orientación, periférico, política o configuración |
| `DEGRADED_SUPPORTED` | conserva resultado y controles mediante una modalidad degradada aprobada |
| `TEMPORARILY_BLOCKED` | combinación antes soportada bloqueada por incidente, regresión o riesgo vigente |
| `UNSUPPORTED` | no se diseñó, no se verificó o no puede cumplir el contrato |
| `UNKNOWN_BLOCKED` | no existe evidencia suficiente; no se habilita una acción crítica |
| `RETIRED` | soporte finalizado mediante transición aprobada |

`UNKNOWN_BLOCKED` no se transformará automáticamente en `SUPPORTED` porque un usuario haya completado una vez el flujo.

---

#### 8. Perfiles mínimos de dispositivo

Se adoptan perfiles funcionales iniciales:

| Perfil | Uso objetivo | Condiciones mínimas |
| --- | --- | --- |
| `DP1_ADMIN_DESKTOP` | administración, análisis, configuración y trabajo documental | teclado y puntero; viewport amplio; multitarea; descarga y carga controladas |
| `DP2_OPERATIVE_TABLET` | ejecución operativa táctil en estación o movilidad corta | tacto, orientación aprobada, cámara opcional, bloqueo, batería y montaje según estación |
| `DP3_PERSONAL_MOBILE` | autoservicio de cliente o trabajador y acciones personales | identidad individual, pantalla pequeña, conectividad variable y permisos del sistema |
| `DP4_SHARED_KIOSK_POS` | estación compartida, POS, kiosco o punto dedicado | actor efectivo, cambio de usuario, pantalla fijada, periféricos, bloqueo y limpieza de sesión |
| `DP5_MOBILE_FIELD` | recorrido, logística, conteo o captura en movimiento | cámara o escáner, batería, protección, offline y red intermitente |
| `DP6_PERIPHERAL_HOST` | estación que coordina impresión, medición, escaneo o integración local | drivers o adaptadores aprobados, puertos, red, spool, diagnóstico y sustitución |
| `DP7_READ_ONLY_FALLBACK` | consulta mínima durante degradación o contingencia | datos marcados con frescura, sin mutaciones no autorizadas y salida clara |

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

| Aplicación o familia | Orientación inicial de compatibilidad |
| --- | --- |
| SHELL | escritorio administrativo y superficies de contexto autorizadas; componentes compartidos deberán preservar compatibilidad de consumidoras |
| ANIMA | móvil personal prioritario y escritorio o tablet como alternativa cuando el proceso lo permita |
| PASS | móvil personal prioritario; cámara, enlaces, notificaciones y almacenamiento se validarán por plataforma |
| VISO | escritorio prioritario; tablet únicamente para capacidades declaradas |
| NEXO | tablet, móvil de campo, kiosco y escritorio según paso, estación y periférico |
| FOGO | tablet o estación compartida según área; interacción compatible con ambiente productivo |
| ORIGO | escritorio y tablet según recepción, compra, documento o periférico |
| PULSO | POS, tablet o estación dedicada; pagos e impresión requieren perfil físico específico |
| NUMERA | escritorio prioritario; acceso móvil limitado a capacidades declaradas |
| AURA | no adquiere soporte por figurar en la matriz; dependerá de continuidad aprobada y paquete propio |

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

| Estado | Comportamiento mínimo |
| --- | --- |
| `SUPPORTED` | permitir según autorización y contexto |
| `SUPPORTED_WITH_CONDITIONS` | comprobar y mostrar las condiciones aplicables |
| `DEGRADED_SUPPORTED` | activar la modalidad declarada y marcar sus límites |
| `TEMPORARILY_BLOCKED` | bloquear el paso, preservar trabajo y mostrar ruta de soporte |
| `UNSUPPORTED` | impedir la capacidad incompatible sin simular error genérico |
| `UNKNOWN_BLOCKED` | recopilar diagnóstico mínimo y no ejecutar efecto crítico |
| `RETIRED` | mostrar fecha, alternativa y procedimiento de transición |

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

| Clase | Ejemplos | Tratamiento |
| --- | --- | --- |
| `COMPAT-P0` | acción crítica ejecutable parcialmente; autorización o actor incorrectos; corrupción; pago o movimiento duplicable | bloquea piloto o producción aplicable |
| `COMPAT-P1` | flujo principal imposible; cámara, impresión u offline críticos sin fallback; versión vulnerable | resolver antes de readiness o control temporal aprobado |
| `COMPAT-P2` | degradación material, rendimiento insuficiente o limitación de modalidad con alternativa viable | tarea, fecha y condición obligatorias |
| `COMPAT-P3` | defecto cosmético o mejora sin impacto en resultado, acceso o seguridad | backlog priorizado |

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

| Decisión o implementación | Tarea propietaria |
| --- | --- |
| perfiles y matriz inicial | `NFR-REQ-011` |
| estaciones, interacción y periféricos | `UX-STATION-002` a `UX-STATION-012` |
| accesibilidad y ergonomía | `NFR-REQ-007`; `UX-BASE-001` a `UX-BASE-015` |
| hardware, red y periféricos | `NFR-REQ-008`; `TI-DOM-002` a `TI-DOM-005` |
| observabilidad y soporte | `NFR-REQ-009`; `TI-DOM-007` a `TI-DOM-010` |
| recuperación y continuidad | `NFR-REQ-010`; `CONT-DOM-001` a `CONT-DOM-015` |
| identidad de dispositivo compartido | `AUTH-DEV-001` a `AUTH-DEV-016` |
| pantallas y procesos | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `PROC-COVER-001` a `PROC-COVER-010` |
| implementación por aplicación | paquetes E5 propietarios |
| releases, despliegues y rollback | BLOQUE T |
| certificación transversal y pilotos | BLOQUE U; `UX-QA-001` a `UX-QA-030` |

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


### [ ] NFR-REQ-012 — Aprobar requisitos no funcionales antes de E5

