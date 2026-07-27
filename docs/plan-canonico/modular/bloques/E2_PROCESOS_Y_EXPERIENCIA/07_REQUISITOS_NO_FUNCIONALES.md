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


### [ ] NFR-REQ-002 — Definir volumen, concurrencia y crecimiento esperado
### [ ] NFR-REQ-003 — Definir tiempos máximos de respuesta
### [ ] NFR-REQ-004 — Definir comportamiento offline y sincronización
### [ ] NFR-REQ-005 — Definir privacidad y sensibilidad
### [ ] NFR-REQ-006 — Definir trazabilidad y retención
### [ ] NFR-REQ-007 — Definir accesibilidad y ergonomía
### [ ] NFR-REQ-008 — Definir hardware, red y periféricos requeridos
### [ ] NFR-REQ-009 — Definir observabilidad, soporte y alertas
### [ ] NFR-REQ-010 — Definir respaldo, RTO y RPO
### [ ] NFR-REQ-011 — Definir compatibilidad mínima por dispositivo
### [ ] NFR-REQ-012 — Aprobar requisitos no funcionales antes de E5

