### MINI-BLOQUE — DISPONIBILIDAD ESCALA RENDIMIENTO Y OFFLINE

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **disponibilidad escala rendimiento y offline** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `NFR-REQ-001` a `NFR-REQ-004` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `NFR-REQ-001`: Definir criticidad y disponibilidad por proceso
- `NFR-REQ-002`: Definir volumen, concurrencia y crecimiento esperado
- `NFR-REQ-003`: Definir tiempos máximos de respuesta
- `NFR-REQ-004`: Definir comportamiento offline y sincronización
<!-- PLAN-SECTION-META:END -->

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
**Artefactos aprobados:** `NFR-OFFLINE-SYNC-CONTRACT-001`; `NFR-PROCESS-OFFLINE-MATRIX-001`; `NFR-LOCAL-OPERATION-ENVELOPE-001`; `NFR-SYNC-RECONCILIATION-POLICY-001`
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

Esta tarea aprobada incorpora al registro canónico completo:

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

La evidencia de estas filas deberá indicar expresamente que proviene de `NFR-REQ-004` aprobada. Los identificadores no cambian.

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
- [ ] Se incorporan `TREQ-PROC-295` a `TREQ-PROC-324` al `04A` completo, con origen y evidencia de tarea aprobada.
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
