### MINI-BLOQUE — PROPÓSITO PROPIEDAD CONSUMIDORES Y ACTORES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **propósito propiedad consumidores y actores** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `PROC-CAT-004` a `PROC-CAT-008` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `PROC-CAT-004`: Definir propósito empresarial de cada proceso
- `PROC-CAT-005`: Definir aplicación propietaria de cada proceso
- `PROC-CAT-006`: Definir aplicaciones consumidoras de cada proceso
- `PROC-CAT-007`: Definir actor que inicia cada proceso
- `PROC-CAT-008`: Definir actores que continúan cada proceso
<!-- PLAN-SECTION-META:END -->

### ✅ PROC-CAT-004 — Definir propósito empresarial de cada proceso

**Estado:** APROBADO  
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Dependencias obligatorias:** `E1-GATE-001` — APROBADA; `PROC-CAT-001` — APROBADA; `PROC-CAT-002` — APROBADA; `PROC-CAT-003` — APROBADA  
**Línea base recibida:** `PROC-ASIS-CATALOG-001`, `PROC-TOBE-DESIGN-001` y `PROC-CANONICAL-ID-REGISTRY-001`  
**Naturaleza:** definición funcional del resultado empresarial protegido por cada proceso, sin implementación  
**Artefacto producido:** `PROC-BUSINESS-PURPOSE-REGISTRY-001`  
**Procesos cubiertos:** **69**  
**Rango cubierto:** `VPROC-0001` a `VPROC-0069`  
**Cambios en código, migraciones o Supabase:** no autorizados  
**Siguiente tarea reservada:** `PROC-CAT-005 — Definir aplicación propietaria de cada proceso`

---

#### 1. Propósito

Definir para cada proceso canónico una razón empresarial explícita, estable y verificable que responda por qué el proceso debe existir y qué resultado protege para Vento Group.

```text
IDENTIDAD CANÓNICA
VPROC-####
        +
DISEÑO TO-BE APROBADO
        ↓
PROPÓSITO EMPRESARIAL CANÓNICO
        ↓
BASE PARA PROPIEDAD, ACTORES, ESTADOS, DATOS,
EVENTOS, AUDITORÍA, MÉTRICAS Y EXPERIENCIA
```

El propósito no describe una pantalla, aplicación, tabla, permiso, documento, actor, secuencia de estados ni solución técnica. Tampoco demuestra que el proceso esté implementado o listo para operar.

---

#### 2. Resultado obligatorio

La tarea produce:

```text
PROC-BUSINESS-PURPOSE-REGISTRY-001
```

El registro deberá:

1. asignar exactamente un propósito empresarial canónico a cada `VPROC-0001` a `VPROC-0069`;
2. expresar el resultado que justifica la existencia del proceso;
3. permanecer válido aunque cambien aplicación, propietario, actores, pantallas, datos o implementación;
4. distinguir procesos cercanos mediante resultados empresariales diferentes;
5. prohibir propósitos genéricos que solo digan administrar, gestionar, soportar o digitalizar sin declarar el resultado protegido;
6. servir como restricción para las decisiones posteriores de `PROC-CAT-005` a `PROC-CAT-020`;
7. permitir detectar solapamientos que deban resolverse en `PROC-CAT-020`;
8. conservar trazabilidad hacia el alias de origen sin usarlo como identidad primaria.

---

#### 3. Definición normativa de propósito empresarial

El propósito empresarial de un proceso es la declaración estable del resultado que la organización necesita obtener o proteger mediante ese proceso.

Debe responder simultáneamente:

```text
¿PARA QUÉ EXISTE EL PROCESO?
¿QUÉ RESULTADO EMPRESARIAL DEBE PRODUCIR O PROTEGER?
¿QUÉ INTEGRIDAD NO DEBE PERDERSE AL CAMBIAR SU IMPLEMENTACIÓN?
```

No deberá responder todavía:

- qué aplicación es propietaria;
- quién inicia, ejecuta, supervisa o aprueba;
- cuáles son sus estados o transiciones;
- qué datos entran o salen;
- qué evento emite;
- qué evidencia o auditoría conserva;
- qué indicador mide su desempeño;
- qué pantalla o dispositivo utiliza.

Esas decisiones permanecen reservadas para sus tareas propietarias.

---

#### 4. Regla de redacción canónica

Cada propósito deberá:

1. comenzar con un verbo en infinitivo;
2. declarar un resultado empresarial observable o protegible;
3. incluir la condición de integridad que evita que el proceso se reduzca a una actividad aislada;
4. caber en una sola declaración principal;
5. ser comprensible sin conocer la arquitectura técnica;
6. evitar nombres de aplicaciones, repositorios, esquemas, tablas, rutas, componentes o proveedores concretos;
7. evitar asignar actores, autoridad o propiedad antes de `PROC-CAT-005` a `PROC-CAT-008`;
8. evitar convertir fases funcionales en estados antes de `PROC-CAT-009` a `PROC-CAT-012`;
9. evitar incorporar métricas o metas antes de `PROC-CAT-019`;
10. conservar su significado aunque el proceso pase de manual a digital, de interno a integrado o de una herramienta a otra.

Forma recomendada:

```text
<VERBO EN INFINITIVO> + <RESULTADO EMPRESARIAL>
+ <CONDICIÓN DE INTEGRIDAD O PROTECCIÓN>
```

Ejemplo válido:

```text
Conservar evidencia confiable de la asistencia realmente ocurrida y permitir
correcciones sin borrar ni reescribir los hechos originales.
```

Ejemplos inválidos:

```text
Administrar asistencia.
Crear pantalla de marcación.
Guardar check-ins en Supabase.
Permitir que ANIMA registre turnos.
Medir 99 % de asistencia correcta.
```

---

#### 5. Contrato mínimo del registro

| Campo              | Regla                                                                                   |
| ------------------ | --------------------------------------------------------------------------------------- |
| `process_id`       | Identificador estable `VPROC-*` aprobado en `PROC-CAT-003`.                             |
| `source_alias`     | Alias histórico de origen, solo para trazabilidad.                                      |
| `business_purpose` | Declaración canónica aprobada en esta tarea.                                            |
| `purpose_status`   | `DEFINED` durante la construcción de E2; no convierte el proceso en implementado.       |
| `origin_task`      | `PROC-CAT-004`.                                                                         |
| `decision_ref`     | Decisión posterior que modifique el propósito sin cambiar silenciosamente la identidad. |

Los 69 procesos conservarán `registry_status = UNDER_DEFINITION` hasta completar el contrato y superar la puerta correspondiente. Definir el propósito no los convierte automáticamente en `CANONICAL` ni en `OPERATIONAL`.

---

#### 6. Registro canónico de propósitos empresariales

Las agrupaciones siguientes son únicamente de lectura. No codifican propiedad, aplicación, orden de implementación ni jerarquía entre procesos.

##### 6.1. Gobierno y estructura

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                                                                |
| ------------ | --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | `ASIS-SRC-001`  | Asegurar que las decisiones empresariales relevantes se adopten con contexto suficiente, autoridad definida y seguimiento hasta su cumplimiento, sustitución o cierre.                        |
| `VPROC-0002` | `ASIS-SRC-002`  | Mantener una representación confiable de la estructura jurídica y operativa de Vento Group para que responsabilidades, relaciones y alcances territoriales se interpreten de forma coherente. |
| `VPROC-0003` | `ASIS-SRC-003`  | Asegurar que políticas, delegaciones y límites de decisión permanezcan vigentes, sean comprensibles y puedan aplicarse de forma consistente.                                                  |
| `VPROC-0004` | `ASIS-SRC-004`  | Coordinar compromisos y transferencias de trabajo entre unidades para que cada resultado conserve responsable, plazo y continuidad hasta su cierre.                                           |

##### 6.2. Personas y trabajo

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                                           |
| ------------ | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0005` | `ASIS-SRC-005`  | Cubrir necesidades de personal con personas idóneas y decisiones de selección trazables, sin confundir candidaturas con vínculos laborales activos.                      |
| `VPROC-0006` | `ASIS-SRC-006`  | Lograr que cada persona vinculada ingrese con documentación, contexto, preparación y habilitaciones suficientes para desempeñar su trabajo de forma segura y controlada. |
| `VPROC-0007` | `ASIS-SRC-007`  | Asegurar que la organización disponga de asignaciones laborales y horarios publicados, coherentes y revisables que permitan planear y ejecutar el trabajo.               |
| `VPROC-0008` | `ASIS-SRC-008`  | Conservar evidencia confiable de la asistencia realmente ocurrida y permitir correcciones sin borrar ni reescribir los hechos originales.                                |
| `VPROC-0009` | `ASIS-SRC-009`  | Resolver ausencias, permisos, cambios y reemplazos sin dejar turnos, responsabilidades o contextos operativos inconsistentes.                                            |
| `VPROC-0010` | `ASIS-SRC-010`  | Producir un paquete laboral autorizado, completo y conciliable que permita liquidar pagos y beneficios mediante la autoridad correspondiente.                            |
| `VPROC-0011` | `ASIS-SRC-011`  | Cerrar cada relación laboral de forma integral, verificando obligaciones, devoluciones, accesos, documentación y riesgos residuales.                                     |

##### 6.3. Seguridad, higiene y cumplimiento

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                                            |
| ------------ | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0012` | `ASIS-SRC-012`  | Reducir riesgos de seguridad, salud e inocuidad mediante identificación, evaluación, control, inspección y seguimiento verificable de acciones preventivas y correctivas. |
| `VPROC-0013` | `ASIS-SRC-013`  | Proteger a las personas y a la operación mediante respuesta oportuna a incidentes, accidentes y emergencias, preservando investigación, decisiones y aprendizaje.         |
| `VPROC-0014` | `ASIS-SRC-014`  | Mantener condiciones verificables de higiene, inocuidad y cumplimiento durante la operación mediante controles repetibles y evidencia suficiente.                         |

##### 6.4. Productos, recetas y conocimiento

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                                           |
| ------------ | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0015` | `ASIS-SRC-015`  | Conservar un catálogo de productos, presentaciones, unidades y equivalencias coherente para que todas las operaciones interpreten el mismo objeto comercial y logístico. |
| `VPROC-0016` | `ASIS-SRC-016`  | Convertir una formulación en una receta aprobada, reproducible y versionada que pueda utilizarse sin perder trazabilidad de cambios y validaciones.                      |
| `VPROC-0017` | `ASIS-SRC-017`  | Asegurar que la oferta publicada en cada canal corresponda con definiciones vigentes y disponibilidad realmente comprometible.                                           |
| `VPROC-0018` | `ASIS-SRC-018`  | Preservar requisitos de calidad, composición, alérgenos y restricciones de cada producto para prevenir producción, comercialización o consumo no conformes.              |

##### 6.5. Compras y proveedores

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                     |
| ------------ | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0019` | `ASIS-SRC-019`  | Convertir necesidades de abastecimiento en requerimientos priorizados, justificables y trazables antes de comprometer una compra.                  |
| `VPROC-0020` | `ASIS-SRC-020`  | Permitir una decisión de abastecimiento informada comparando proveedores, condiciones, riesgos y evidencia relevante.                              |
| `VPROC-0021` | `ASIS-SRC-021`  | Autorizar y formalizar compras con el nivel de control adecuado, diferenciando operación ordinaria, urgencia y excepción.                          |
| `VPROC-0022` | `ASIS-SRC-022`  | Confirmar que lo recibido física, documental y económicamente corresponde con lo solicitado y resolver diferencias antes de aceptar la obligación. |

##### 6.6. Inventario y almacenamiento

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                                    |
| ------------ | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0023` | `ASIS-SRC-023`  | Mantener una estructura confiable de ubicaciones y condiciones de almacenamiento para saber dónde puede custodiarse cada objeto y bajo qué restricciones.         |
| `VPROC-0024` | `ASIS-SRC-024`  | Asegurar que cada ingreso o cambio de ubicación modifique la custodia y disponibilidad de inventario de forma correlacionada y trazable.                          |
| `VPROC-0025` | `ASIS-SRC-025`  | Permitir el retiro, consumo o traslado de existencias sin perder la relación entre cantidad, unidad, conversión, origen, destino y responsable.                   |
| `VPROC-0026` | `ASIS-SRC-026`  | Establecer la existencia real mediante conteos independientes y convertir las diferencias en decisiones de ajuste justificadas, no en sobrescrituras automáticas. |
| `VPROC-0027` | `ASIS-SRC-027`  | Proteger la aptitud y el valor del inventario gestionando vencimientos, condiciones, cuarentenas, pérdidas, mermas, frío y disposición final.                     |
| `VPROC-0028` | `ASIS-SRC-028`  | Satisfacer necesidades internas de abastecimiento conservando cantidades y responsabilidades conciliables desde la solicitud hasta la recepción.                  |

##### 6.7. Activos, vehículos, reutilizables y contenedores

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                         |
| ------------ | --------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0029` | `ASIS-SRC-029`  | Conservar identidad, ubicación, condición y custodia de los activos durante su uso, préstamo y transferencia.                          |
| `VPROC-0030` | `ASIS-SRC-030`  | Restablecer o decidir el destino de un activo mediante mantenimiento, reparación, garantía, repuestos y baja controlados.              |
| `VPROC-0031` | `ASIS-SRC-031`  | Mantener vehículos disponibles y seguros para la operación mediante control de condición, uso, combustible, kilometraje e incidencias. |
| `VPROC-0032` | `ASIS-SRC-032`  | Asegurar la disponibilidad y retorno de reutilizables y contenedores, atribuyendo tenencia, faltantes, daños y completitud.            |

##### 6.8. Producción

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                           |
| ------------ | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0033` | `ASIS-SRC-033`  | Transformar demanda y necesidades operativas en un plan de producción factible, priorizado y oportuno.                                   |
| `VPROC-0034` | `ASIS-SRC-034`  | Producir de manera reproducible utilizando materiales, cantidades y versiones aprobadas, conservando trazabilidad de la ejecución.       |
| `VPROC-0035` | `ASIS-SRC-035`  | Evitar liberar producto no conforme mediante una decisión independiente y verificable sobre aceptación, retención, corrección o rechazo. |
| `VPROC-0036` | `ASIS-SRC-036`  | Preservar identidad, condición y trazabilidad del producto terminado durante empaque, etiquetado y almacenamiento.                       |
| `VPROC-0037` | `ASIS-SRC-037`  | Cerrar la ejecución productiva explicando rendimiento, merma, aprovechamiento y reproceso sin ocultar desviaciones.                      |

##### 6.9. Pedidos, ventas, pagos y caja

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                                              |
| ------------ | --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0038` | `ASIS-SRC-038`  | Completar el servicio en mesa desde la atención inicial hasta la entrega y liquidación, manteniendo coherencia entre pedido, preparación, consumo, pago y mesa.             |
| `VPROC-0039` | `ASIS-SRC-039`  | Completar una venta de mostrador o para llevar asegurando que pedido, preparación, entrega y cobro correspondan al mismo compromiso.                                        |
| `VPROC-0040` | `ASIS-SRC-040`  | Incorporar pedidos originados en terceros al flujo interno sin duplicar solicitudes ni perder estados, condiciones, cobros o conciliación.                                  |
| `VPROC-0041` | `ASIS-SRC-041`  | Cumplir compromisos de catering o venta entre empresas validando viabilidad, condiciones comerciales, producción, entrega y facturación.                                    |
| `VPROC-0042` | `ASIS-SRC-042`  | Corregir o terminar compromisos comerciales de manera controlada, distinguiendo modificaciones, sustituciones, cancelaciones, anulaciones y devoluciones según sus efectos. |
| `VPROC-0043` | `ASIS-SRC-043`  | Confirmar y respaldar el pago de una obligación comercial, conservando correspondencia entre venta, medio, valor, resultado y soporte fiscal.                               |
| `VPROC-0044` | `ASIS-SRC-044`  | Demostrar el resultado real de una jornada de caja conciliando ventas, pagos, efectivo, diferencias y responsabilidades.                                                    |

##### 6.10. Clientes, fidelización, reclamos y reservas

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                          |
| ------------ | --------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0045` | `ASIS-SRC-045`  | Reconocer al cliente y administrar beneficios de fidelización con saldos, movimientos y consentimientos verificables.                   |
| `VPROC-0046` | `ASIS-SRC-046`  | Restituir al cliente y corregir la causa de una inconformidad mediante tratamiento trazable de reclamos, devoluciones y compensaciones. |
| `VPROC-0047` | `ASIS-SRC-047`  | Comprometer capacidad para reservas y eventos de forma realista y mantener comunicaciones oportunas y consentidas con el cliente.       |

##### 6.11. Transporte y entregas

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                               |
| ------------ | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0048` | `ASIS-SRC-048`  | Preparar un despacho ejecutable asignando ruta, vehículo, carga, secuencia y restricciones antes de iniciar el transporte.                   |
| `VPROC-0049` | `ASIS-SRC-049`  | Completar una entrega con evidencia suficiente del resultado y tratamiento controlado de rechazos, novedades y retornos.                     |
| `VPROC-0050` | `ASIS-SRC-050`  | Obtener y conciliar el resultado de una entrega realizada por terceros sin perder control interno sobre compromiso, seguimiento y evidencia. |

##### 6.12. Finanzas y obligaciones

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                             |
| ------------ | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0051` | `ASIS-SRC-051`  | Representar hechos económicos a partir de eventos y soportes verificables para evitar registros aislados o sin origen operacional.                         |
| `VPROC-0052` | `ASIS-SRC-052`  | Cumplir obligaciones con proveedores mediante aprobación, pago y conciliación que demuestren qué se debía, qué se pagó y qué permanece pendiente.          |
| `VPROC-0053` | `ASIS-SRC-053`  | Recuperar y aplicar valores por cobrar manteniendo claridad sobre obligación, recaudo, saldo y diferencias.                                                |
| `VPROC-0054` | `ASIS-SRC-054`  | Producir información confiable sobre costos, asignaciones, cierres y rentabilidad para apoyar decisiones sin confundir estimaciones con hechos realizados. |

##### 6.13. Instalaciones, contenido, tecnología, información y continuidad

| Proceso      | Alias de origen | Propósito empresarial canónico                                                                                                                       |
| ------------ | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0055` | `ASIS-SRC-055`  | Mantener instalaciones aptas, seguras y operativas mediante limpieza, inspección, mantenimiento, control de plagas, servicios y cierre de novedades. |
| `VPROC-0056` | `ASIS-SRC-056`  | Publicar contenido y promociones autorizados, vigentes y retirables de forma coordinada en los canales correspondientes.                             |
| `VPROC-0057` | `ASIS-SRC-057`  | Convertir interacciones digitales con intención comercial en oportunidades o casos trazables hasta su atención, descarte o conversión.               |
| `VPROC-0058` | `ASIS-SRC-058`  | Restablecer servicios tecnológicos y reducir recurrencia mediante gestión de solicitudes, incidentes, diagnóstico, resolución y conocimiento.        |
| `VPROC-0059` | `ASIS-SRC-059`  | Conceder, modificar y revocar acceso tecnológico conforme a una necesidad autorizada, verificando que no permanezcan privilegios residuales.         |
| `VPROC-0060` | `ASIS-SRC-060`  | Conservar documentos y evidencia confiables durante su ciclo de vida, con contexto, custodia, acceso y disposición controlados.                      |
| `VPROC-0061` | `ASIS-SRC-061`  | Convertir mediciones y hallazgos en decisiones de mejora verificables y comprobar si produjeron el resultado esperado.                               |
| `VPROC-0062` | `ASIS-SRC-062`  | Mantener la operación esencial frente a interrupciones y recuperar el servicio con reconciliación, evidencia y aprendizaje posterior.                |

##### 6.14. Procesos adicionales sin precursor AS-IS explícito

| Proceso      | Alias de origen           | Propósito empresarial canónico                                                                                                                                               |
| ------------ | ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0063` | `ADICIONAL-PROVISIONAL-A` | Mantener visibles y tratados los riesgos empresariales relevantes para apoyar decisiones y evitar exposición residual aceptada sin seguimiento.                              |
| `VPROC-0064` | `ADICIONAL-PROVISIONAL-B` | Cumplir requerimientos y compromisos con asesores y autoridades conservando responsabilidad interna, vencimientos, evidencia y trazabilidad.                                 |
| `VPROC-0065` | `ADICIONAL-PROVISIONAL-C` | Orientar el desempeño y desarrollo de las personas mediante objetivos y retroalimentación con propósito legítimo, privacidad y decisiones controladas.                       |
| `VPROC-0066` | `ADICIONAL-PROVISIONAL-D` | Proteger a las personas mediante entrega, vigencia, cambio, devolución y evidencia de los elementos de protección requeridos.                                                |
| `VPROC-0067` | `ADICIONAL-PROVISIONAL-E` | Asegurar que kits y conjuntos se definan, armen, entreguen, utilicen y devuelvan con completitud conocida y componentes trazables.                                           |
| `VPROC-0068` | `ADICIONAL-PROVISIONAL-F` | Conocer la experiencia del cliente mediante mediciones interpretables y separadas de incentivos, reclamos y compensaciones.                                                  |
| `VPROC-0069` | `ADICIONAL-PROVISIONAL-G` | Planear y controlar el uso de recursos financieros mediante presupuestos versionados, aprobados y comparables con consumo y proyección, sin tratarlos como hechos contables. |


---

#### 7. Distinciones obligatorias entre procesos cercanos

Las siguientes fronteras de propósito deberán conservarse durante las tareas posteriores:

| Procesos                                                                           | Distinción obligatoria                                                                                                                                     |
| ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001`, `VPROC-0003`, `VPROC-0004`                                           | decisión empresarial, gobierno de políticas y coordinación de compromisos son resultados distintos.                                                        |
| `VPROC-0005`, `VPROC-0006`, `VPROC-0011`                                           | selección, incorporación y retiro pertenecen a momentos y resultados laborales diferentes.                                                                 |
| `VPROC-0012`, `VPROC-0013`, `VPROC-0014`, `VPROC-0063`, `VPROC-0066`               | prevención SST, respuesta a incidentes, higiene operativa, riesgo empresarial y entrega de protección no se fusionan por compartir controles de seguridad. |
| `VPROC-0015`, `VPROC-0016`, `VPROC-0017`, `VPROC-0018`                             | maestro de producto, receta, oferta comercial y especificación de calidad conservan propósitos separados.                                                  |
| `VPROC-0019`, `VPROC-0020`, `VPROC-0021`, `VPROC-0022`                             | necesidad, evaluación, autorización de compra y recepción no son una sola acción.                                                                          |
| `VPROC-0023`, `VPROC-0024`, `VPROC-0025`, `VPROC-0026`, `VPROC-0027`, `VPROC-0028` | estructura de almacenamiento, movimientos, salidas, conteos, condición y abastecimiento interno producen resultados distintos.                             |
| `VPROC-0029`, `VPROC-0030`, `VPROC-0032`, `VPROC-0067`                             | custodia de activos, mantenimiento, control de reutilizables y composición de kits no son equivalentes.                                                    |
| `VPROC-0033` a `VPROC-0037`                                                        | planificación, ejecución, liberación, empaque y cierre productivo deben conservar propósitos independientes.                                               |
| `VPROC-0038`, `VPROC-0039`, `VPROC-0040`, `VPROC-0041`                             | servicio en mesa, venta directa, pedido externo y venta entre empresas son compromisos comerciales distintos.                                              |
| `VPROC-0043`, `VPROC-0044`, `VPROC-0052`, `VPROC-0053`                             | confirmación de pago, cierre de caja, pago a proveedor y recaudo de cartera no comparten el mismo resultado.                                               |
| `VPROC-0046`, `VPROC-0068`                                                         | resolver una inconformidad no equivale a medir satisfacción.                                                                                               |
| `VPROC-0054`, `VPROC-0069`                                                         | análisis de costos y rentabilidad no sustituye el gobierno presupuestal.                                                                                   |
| `VPROC-0058`, `VPROC-0062`                                                         | resolver un incidente tecnológico no equivale a asegurar continuidad empresarial integral.                                                                 |

Estas distinciones no impiden que `PROC-CAT-020` determine posteriormente una fusión, división o relación de subproceso con evidencia suficiente. Sí impiden fusionar por similitud nominal antes de ese análisis.

---

#### 8. Reglas de estabilidad y modificación

##### 8.1. Cambios que no alteran el propósito

El propósito deberá mantenerse cuando cambien:

- aplicación propietaria o consumidora;
- actor o rol;
- sede, área, canal o dispositivo;
- modalidad manual, híbrida, digital o integrada;
- pantalla, documento, tabla, esquema o API;
- proveedor externo;
- detalle de estados, entradas, salidas, eventos o métricas;
- orden técnico de implementación.

##### 8.2. Refinamiento permitido

Una versión posterior podrá aclarar redacción sin cambiar el resultado empresarial. El cambio deberá conservar historial y referencia de decisión.

##### 8.3. Cambio material de propósito

Cuando el resultado empresarial cambie materialmente deberá evaluarse si:

1. existe un refinamiento válido del mismo proceso;
2. corresponde una división con nuevos identificadores;
3. corresponde una fusión;
4. el proceso debe retirarse y crearse otro.

La decisión se resolverá mediante `PROC-CAT-020` y las reglas de linaje de `PROC-CAT-003`. No se reescribirá silenciosamente el significado de un `VPROC-*`.

---

#### 9. Uso obligatorio en tareas posteriores

A partir de la aprobación de esta tarea:

- `PROC-CAT-005` deberá asignar propiedad compatible con el propósito, no con la ubicación actual del código;
- `PROC-CAT-006` deberá justificar cada aplicación consumidora por su participación en el resultado;
- `PROC-CAT-007` y `PROC-CAT-008` deberán asignar actores sin ampliar el propósito;
- `PROC-CAT-009` a `PROC-CAT-012` deberán definir estados y transiciones que conduzcan al resultado declarado;
- `PROC-CAT-015` y `PROC-CAT-016` deberán definir entradas y salidas suficientes para lograrlo;
- `PROC-CAT-017` y `PROC-CAT-018` deberán emitir y conservar evidencia proporcional al propósito;
- `PROC-CAT-019` deberá medir logro, calidad o riesgo sin sustituir el propósito por una meta;
- `PROC-CAT-020` deberá señalar cualquier propósito equivalente, superpuesto o demasiado amplio;
- pantallas, permisos, recursos y paquetes futuros deberán citar el `VPROC-*` y su propósito aprobado.

Ninguna aplicación, tabla o servicio podrá declararse propietario empresarial únicamente porque actualmente persista datos o contenga una pantalla relacionada. Esta regla atiende expresamente la brecha `H-CAP-SCOPE-019-002`.

---

#### 10. Decisiones reservadas

| Decisión                             | Tarea propietaria                                |
| ------------------------------------ | ------------------------------------------------ |
| aplicación propietaria               | `PROC-CAT-005`                                   |
| aplicaciones consumidoras            | `PROC-CAT-006`                                   |
| actor iniciador                      | `PROC-CAT-007`                                   |
| actores continuadores                | `PROC-CAT-008`                                   |
| estado inicial, intermedios y final  | `PROC-CAT-009` a `PROC-CAT-011`                  |
| transiciones                         | `PROC-CAT-012`                                   |
| excepciones, cancelación y reversión | `PROC-CAT-013`; `PROC-CAT-014`                   |
| entradas y salidas                   | `PROC-CAT-015`; `PROC-CAT-016`                   |
| eventos y auditoría                  | `PROC-CAT-017`; `PROC-CAT-018`                   |
| métricas                             | `PROC-CAT-019`                                   |
| duplicidades, fusiones y divisiones  | `PROC-CAT-020`                                   |
| actores detallados                   | `PROC-ACTOR-001` a `PROC-ACTOR-010`              |
| persistencia física                  | BLOQUE E3                                        |
| implementación                       | paquetes E5 y bloque propietario correspondiente |

Esta tarea no anticipa ninguna de esas decisiones.

---

#### 11. Reconciliación y pendientes

| Elemento                                               | Resolución                                                                                                             |
| ------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` a `VPROC-0069`                            | Todos reciben exactamente un propósito empresarial.                                                                    |
| aliases `ASIS-SRC-*`                                   | Se conservan exclusivamente como trazabilidad histórica.                                                               |
| aliases `ADICIONAL-PROVISIONAL-*`                      | Se conservan hasta que una tarea posterior apruebe referencias humanas más estables; no sustituyen `VPROC-*`.          |
| posibles solapamientos                                 | Se documentan en la sección 7 y permanecen bajo responsabilidad de `PROC-CAT-020`.                                     |
| estado del registro                                    | Permanece `UNDER_DEFINITION`; el contrato aún no está completo.                                                        |
| modelo físico                                          | Reservado para BLOQUE E3 y migraciones posteriores documentadas en `vento-shell`.                                      |
| requisitos de prueba `TREQ-PROC-001` a `TREQ-PROC-013` | Permanecen vigentes y deberán materializarse en el Registro Canónico de Requisitos de Prueba durante la consolidación. |

**Resultado:** no se detecta una brecha nueva sin destino documental.

---

#### 12. Impacto contractual

| Dimensión                              | Resultado                                                                          |
| -------------------------------------- | ---------------------------------------------------------------------------------- |
| permisos                               | No se crean ni modifican permisos.                                                 |
| modalidad y alcance                    | No se modifican.                                                                   |
| turno, check-in y área activa          | No se modifican.                                                                   |
| dispositivo compartido                 | No se modifica.                                                                    |
| simulación                             | No se modifica.                                                                    |
| recursos                               | No se crean contratos de recurso.                                                  |
| matrices                               | No se regeneran.                                                                   |
| Supabase, RLS, RPC, Storage y Realtime | No se modifican.                                                                   |
| aplicaciones                           | No se asigna propiedad ni consumo.                                                 |
| experiencia y navegación               | No se diseñan pantallas, rutas o flujos visuales.                                  |
| datos                                  | Se define únicamente el registro documental de propósitos.                         |
| migraciones                            | No se crean. Toda migración futura deberá crearse y documentarse en `vento-shell`. |

---

#### 13. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                                    | Riesgo evitado                                                                          | Tipo                               | Prioridad | Momento de implementación                                                    | Destino                                                                      |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | ---------------------------------- | --------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `TREQ-PROC-014` | Cada `VPROC-0001` a `VPROC-0069` deberá resolver exactamente a un propósito empresarial no vacío y no podrá tener más de un propósito vigente.                                     | procesos sin razón aprobada o múltiples definiciones competidoras                       | contrato + CI                      | crítica   | consolidación documental y materialización física del registro               | Registro Canónico de Requisitos de Prueba; compilador/verificador; BLOQUE E3 |
| `TREQ-PROC-015` | El propósito deberá permanecer independiente de aplicación, repositorio, tabla, pantalla, actor, proveedor o modalidad técnica.                                                    | propiedad inferida desde implementación y mutación del significado al migrar tecnología | arquitectura + regresión           | crítica   | revisión de `PROC-CAT-005` a `PROC-CAT-020` y cada paquete de implementación | Registro Canónico de Requisitos de Prueba; E2, E3, E5 y T                    |
| `TREQ-PROC-016` | Dos procesos activos no podrán conservar propósitos materialmente equivalentes sin una clasificación explícita de duplicidad, variante, subproceso o frontera en `PROC-CAT-020`.   | doble fuente de verdad, procesos competidores o implementación duplicada                | contrato + reconciliación          | alta      | al ejecutar `PROC-CAT-020` y en cada alta o modificación posterior           | Registro Canónico de Requisitos de Prueba; `PROC-CAT-020`; BLOQUES E3 y U    |
| `TREQ-PROC-017` | Estados, transiciones, entradas, salidas, eventos y métricas posteriores deberán ser trazables al propósito aprobado y no podrán ampliar silenciosamente su resultado empresarial. | contratos incoherentes o alcance funcional introducido por tareas posteriores           | contrato + trazabilidad + revisión | crítica   | durante `PROC-CAT-009` a `PROC-CAT-019` y validación de paquetes E5          | Registro Canónico de Requisitos de Prueba; E2, E5, T y U                     |

Los requisitos `TREQ-PROC-014` a `TREQ-PROC-017` deberán incorporarse junto con `TREQ-PROC-001` a `TREQ-PROC-013` al Registro Canónico de Requisitos de Prueba durante la próxima consolidación documental aplicable.

---

#### 14. Criterios de aceptación

- [ ] `E1-GATE-001` y `PROC-CAT-001` a `PROC-CAT-003` figuran aprobadas.
- [ ] Existe un único artefacto `PROC-BUSINESS-PURPOSE-REGISTRY-001`.
- [ ] Se definieron exactamente 69 propósitos para `VPROC-0001` a `VPROC-0069`.
- [ ] Cada identificador aparece una sola vez dentro del registro de propósitos.
- [ ] Cada alias de origen se conserva sin sustituir la identidad canónica.
- [ ] Cada propósito comienza con un verbo en infinitivo y declara un resultado empresarial.
- [ ] Ningún propósito depende de una aplicación, repositorio, tabla, pantalla, permiso o proveedor concreto.
- [ ] Ningún propósito asigna propietario, actor, estado, transición, entrada, salida, evento, auditoría o métrica antes de su tarea propietaria.
- [ ] Las distinciones de la sección 7 evitan fusionar prematuramente procesos cercanos.
- [ ] `VPROC-0054` y `VPROC-0069` distinguen análisis de costos y rentabilidad frente a gobierno presupuestal.
- [ ] `VPROC-0046` y `VPROC-0068` distinguen resolución de inconformidades frente a medición de satisfacción.
- [ ] `VPROC-0012` y `VPROC-0063` distinguen riesgo preventivo de SST frente a riesgo empresarial transversal.
- [ ] El estado de registro permanece `UNDER_DEFINITION`.
- [ ] Se generaron y vincularon `TREQ-PROC-014` a `TREQ-PROC-017`.
- [ ] No se modificó código, Supabase, RLS, RPC, Storage, Realtime, migraciones ni operación.
- [ ] Toda futura migración de Supabase queda reservada para `vento-shell`.
- [ ] El marcador de `PROC-CAT-005` permanece sin iniciar.

---

#### 15. Estado

```text
APROBADO
```

No se inicia `PROC-CAT-005` hasta la aprobación expresa de `PROC-CAT-004`.


### ✅ PROC-CAT-005 — Definir aplicación propietaria de cada proceso

**Estado:** APROBADA
**Tarea anterior:** `PROC-CAT-004 — Definir propósito empresarial de cada proceso`
**Tarea siguiente:** `PROC-CAT-006 — Definir aplicaciones consumidoras de cada proceso`
**Tipo de tarea:** Documental
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal
**Dependencias obligatorias:** `E1-GATE-001` — APROBADA; `PROC-CAT-001` — APROBADA; `PROC-CAT-002` — APROBADA; `PROC-CAT-003` — APROBADA; `PROC-CAT-004` — APROBADA
**Línea base recibida:** `PROC-ASIS-CATALOG-001`, `PROC-TOBE-DESIGN-001`, `PROC-CANONICAL-ID-REGISTRY-001` y `PROC-BUSINESS-PURPOSE-REGISTRY-001`
**Naturaleza:** decisión funcional de propiedad empresarial por proceso, sin implementación
**Artefacto producido:** `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`
**Procesos cubiertos:** **69**
**Rango cubierto:** `VPROC-0001` a `VPROC-0069`
**Aplicaciones canónicas del catálogo:** **10**
**Aplicaciones efectivamente utilizadas como propietarias:** **9**
**Cambios en código, migraciones o Supabase:** no autorizados
**Siguiente tarea reservada:** `PROC-CAT-006 — Definir aplicaciones consumidoras de cada proceso`

---

#### 1. Propósito

Asignar exactamente una aplicación propietaria canónica a cada proceso `VPROC-*`, de modo que exista una autoridad funcional inequívoca sobre el registro principal, las reglas, el estado, la corrección y la explicación del resultado empresarial.

```text
PROCESO + PROPÓSITO EMPRESARIAL
        ↓
UNA APLICACIÓN PROPIETARIA
        ↓
FUENTE DE VERDAD FUNCIONAL ÚNICA
        ↓
APLICACIONES CONSUMIDORAS MEDIANTE CONTRATOS
```

La propiedad se decide por el resultado empresarial aprobado, no por la ubicación actual de una pantalla, tabla, repositorio, integración, documento o soporte manual.

---

#### 2. Resultado obligatorio

La tarea produce:

```text
PROC-APPLICATION-OWNERSHIP-REGISTRY-001
```

El registro deberá:

1. asignar exactamente un `owner_app_code` a cada `VPROC-0001` a `VPROC-0069`;
2. utilizar únicamente aplicaciones canónicas vigentes;
3. explicar por qué la aplicación puede gobernar el resultado principal;
4. declarar la frontera que impide apropiarse de resultados de otras aplicaciones;
5. separar propiedad de participación, consumo, ejecución técnica, persistencia y visualización;
6. conservar la propiedad aunque varias aplicaciones intervengan en el proceso;
7. identificar aplicaciones diferidas sin presentar el proceso como implementado;
8. cerrar las brechas `GAP-OWN-001` a `GAP-OWN-006` mediante fronteras contractuales explícitas;
9. servir como entrada obligatoria para `PROC-CAT-006` a `PROC-CAT-020`, BLOQUE E3 y paquetes E5.

---

#### 3. Definición normativa de aplicación propietaria

La aplicación propietaria de un proceso es la aplicación empresarial responsable de gobernar el resultado principal del proceso.

Deberá poder:

- crear o aceptar el registro principal;
- aplicar las reglas empresariales del proceso;
- conservar su estado vigente e histórico;
- validar o autorizar sus correcciones;
- explicar por qué el proceso está pendiente, completado, cancelado, fallido o corregido;
- emitir los eventos canónicos del resultado;
- impedir que otra aplicación mantenga una fuente de verdad competidora.

No es necesariamente:

- la aplicación donde comienza la interacción;
- la aplicación con más pantallas;
- la aplicación que persiste físicamente una tabla;
- la aplicación que imprime o notifica;
- la aplicación consumida por más usuarios;
- el repositorio donde reside un paquete compartido;
- el proveedor externo que ejecuta una parte;
- SHELL por presentar acceso al ecosistema;
- Supabase por almacenar información.

---

#### 4. Prueba obligatoria de propiedad

Una aplicación se considera propietaria cuando satisface conjuntamente:

| Criterio           | Pregunta obligatoria                                                                    |
| ------------------ | --------------------------------------------------------------------------------------- |
| propósito          | ¿Su propósito canónico coincide con el resultado protegido por el `VPROC-*`?            |
| registro principal | ¿Debe crear o aceptar la autoridad funcional del proceso?                               |
| reglas             | ¿Debe aplicar las reglas que determinan validez, estado y cierre?                       |
| corrección         | ¿Es el lugar lógico para corregir el resultado con autorización y auditoría?            |
| explicación        | ¿Puede explicar el estado completo del proceso sin consultar una copia competidora?     |
| frontera           | ¿Puede gobernar el resultado sin apropiarse de hechos pertenecientes a otra aplicación? |

Una respuesta negativa material obliga a elegir otra propietaria o a revisar la frontera en `PROC-CAT-020`; no autoriza propiedad compartida.

---

#### 5. Catálogo permitido

| Código   | Aplicación | Responsabilidad relevante                                                                                                                  |
| -------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `shell`  | SHELL      | Entrada, navegación y coordinación del ecosistema; no hereda la propiedad de procesos de otras aplicaciones.                               |
| `anima`  | ANIMA      | Experiencia del trabajador, asistencia, marcación e interacción personal operativa.                                                        |
| `viso`   | VISO       | Gobierno administrativo de organización, trabajadores, seguridad, cumplimiento, soporte y casos transversales.                             |
| `nexo`   | NEXO       | Inventario, ubicaciones, movimientos, activos, instalaciones, custodia y logística interna.                                                |
| `fogo`   | FOGO       | Recetas, planificación, órdenes, lotes, ejecución, calidad y cierre productivo.                                                            |
| `origo`  | ORIGO      | Necesidad de compra, proveedores, evaluación, orden y aceptación comercial de recepción.                                                   |
| `pulso`  | PULSO      | Oferta vendible, pedidos, servicio, ventas, pagos, caja y entrega al cliente.                                                              |
| `numera` | NUMERA     | Obligaciones, presupuesto, registros económicos, conciliación, costos y análisis financiero.                                               |
| `aura`   | AURA       | Contenido, campañas, audiencias, oportunidades, reputación y análisis de mercadeo; implementación diferida.                                |
| `pass`   | PASS       | Identidad, fidelización y autoservicio personal del cliente; puede iniciar y presentar pedidos sin apropiarse de la transacción comercial. |

No se asignan como propietarias:

- `talento`, porque identifica un esquema y producto futuro sin `app_code` canónico; VISO gobierna la selección y cualquier portal futuro actúa como canal;
- `vento-shell`, porque es un repositorio técnico;
- Supabase, porque es plataforma de datos y ejecución;
- Rappi, Shopify, ManyChat, WhatsApp, bancos, proveedores o autoridades, porque son sistemas o actores externos;
- papel, Excel, documentos o chats, porque son soportes;
- una sede, área, rol o dispositivo, porque son contexto y no aplicaciones.

El catálogo contiene diez `AppCode` canónicos. Esa cardinalidad no implica que los diez deban aparecer con al menos un proceso asignado en el registro vigente.

---

#### 6. Estados de asignación

| Estado                            | Significado                                                                                                                      |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `ASIGNADA`                        | La aplicación coincide directamente con el resultado principal.                                                                  |
| `ASIGNADA_CON_FRONTERA`           | La propiedad es definitiva, pero requiere respetar una separación contractual con otras aplicaciones.                            |
| `ASIGNADA_EN_APLICACION_DIFERIDA` | La propiedad objetivo es definitiva, pero la aplicación o su cobertura permanece diferida y no puede presentarse como operativa. |

Ningún estado representa implementación, disponibilidad, permiso, despliegue o readiness.

---

#### 7. Reglas canónicas de propiedad

1. Cada proceso activo tendrá exactamente una propietaria.
2. No se permiten propietarios conjuntos, listas de propietarios ni expresiones como `NEXO/PULSO`.
3. Varias aplicaciones podrán participar; se registrarán como consumidoras en `PROC-CAT-006`.
4. Una aplicación consumidora no podrá crear, corregir o cerrar una copia independiente del resultado principal.
5. La persistencia física podrá residir en dominios y esquemas compartidos sin transferir propiedad funcional.
6. Un servicio transversal de impresión, colas, notificaciones, auditoría o documentos no adquiere propiedad del proceso que atiende.
7. La aplicación externa no adquiere propiedad interna; su resultado se valida y reconcilia mediante adaptador.
8. Una aplicación diferida puede ser propietaria objetivo, pero el proceso permanecerá no disponible hasta superar cobertura, readiness e implementación.
9. SHELL no heredará propiedad por enlazar, autenticar, mostrar disponibilidad o coordinar navegación.
10. VISO no heredará automáticamente todos los procesos administrativos; solo los resultados expresamente asignados.
11. NUMERA no recreará ventas, compras, inventario o producción; gobernará el efecto económico, presupuesto o análisis correspondiente.
12. Todo cambio de propietaria requerirá decisión documental, análisis de consumidores, transición, compatibilidad, migración, pruebas, rollback y conservación del mismo `VPROC-*`.

---

#### 8. Registro canónico de propiedad por proceso

##### 8.1. Gobierno y estructura

| Proceso      | Alias          | Proceso TO-BE                                                                                                     | Propietaria | Estado                  | Razón de propiedad                                                                                                | Frontera obligatoria                                                                                                     |
| ------------ | -------------- | ----------------------------------------------------------------------------------------------------------------- | ----------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0001` | `ASIS-SRC-001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                   | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal. | La decisión sigue siendo humana; VISO conserva contexto, autoridad, compromisos y seguimiento, no sustituye a Dirección. |
| `VPROC-0002` | `ASIS-SRC-002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas | `viso`      | `ASIGNADA`              | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal. | No convierte marcas, sedes o áreas en entidades jurídicas por inferencia ni concede acceso por la sola estructura.       |
| `VPROC-0003` | `ASIS-SRC-003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes             | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal. | No sustituye la decisión normativa humana ni la ejecución de controles dentro de cada aplicación.                        |
| `VPROC-0004` | `ASIS-SRC-004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                   | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal. | No absorbe el trabajo de las aplicaciones participantes; conserva compromiso, responsable, plazo y cierre transversal.   |

##### 8.2. Personas y trabajo

| Proceso      | Alias          | Proceso TO-BE                                                                                      | Propietaria | Estado                  | Razón de propiedad                                                                                                                         | Frontera obligatoria                                                                                                                |
| ------------ | -------------- | -------------------------------------------------------------------------------------------------- | ----------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0005` | `ASIS-SRC-005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna necesidad, vacante, evaluación, decisión y traspaso; un portal futuro de TALENTO solo podrá actuar como canal del candidato. | El canal candidato no crea vínculo laboral, no concede permisos y no mantiene un expediente canónico competidor.                    |
| `VPROC-0006` | `ASIS-SRC-006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                          | Recibe el traspaso aprobado de `VPROC-0005`, incluso si un canal candidato futuro participó; ANIMA no gobierna el alta laboral.     |
| `VPROC-0007` | `ASIS-SRC-007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada    | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                          | VISO publica asignaciones y turnos; ANIMA los presenta y registra la ejecución, sin mantener una programación paralela.             |
| `VPROC-0008` | `ASIS-SRC-008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables             | `anima`     | `ASIGNADA`              | ANIMA gobierna el hecho personal y operativo de asistencia realizado por el trabajador.                                                    | VISO puede corregir o supervisar con autoridad; no mantiene una asistencia competidora.                                             |
| `VPROC-0009` | `ASIS-SRC-009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos               | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                          | ANIMA puede iniciar solicitudes personales; VISO gobierna aprobación, reemplazo y efecto sobre la programación.                     |
| `VPROC-0010` | `ASIS-SRC-010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                     | `numera`    | `ASIGNADA_CON_FRONTERA` | NUMERA gobierna el registro, conciliación, planificación o análisis económico sin recrear el hecho operativo de origen.                    | VISO aporta vínculo, tiempo y novedades; bancos o terceros ejecutan pagos, pero NUMERA conserva paquete, obligación y conciliación. |
| `VPROC-0011` | `ASIS-SRC-011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                    | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                          | Cada aplicación revoca sus accesos por contrato; VISO gobierna el caso laboral y verifica el cierre integral.                       |

##### 8.3. Seguridad, higiene y cumplimiento

| Proceso      | Alias          | Proceso TO-BE                                                                                 | Propietaria | Estado                  | Razón de propiedad                                                                                                | Frontera obligatoria                                                                                                                 |
| ------------ | -------------- | --------------------------------------------------------------------------------------------- | ----------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0012` | `ASIS-SRC-012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                 | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal. | Las inspecciones físicas pueden ejecutarse en NEXO o FOGO; VISO conserva el caso SST, el riesgo y el plan de acción.                 |
| `VPROC-0013` | `ASIS-SRC-013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal. | La respuesta operativa puede involucrar múltiples aplicaciones y autoridades; VISO conserva expediente, investigación y seguimiento. |
| `VPROC-0014` | `ASIS-SRC-014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados   | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal. | FOGO, NEXO y PULSO aplican controles en su operación; VISO gobierna obligaciones, hallazgos y acciones de cumplimiento.              |

##### 8.4. Productos, recetas y conocimiento

| Proceso      | Alias          | Proceso TO-BE                                                                           | Propietaria | Estado                  | Razón de propiedad                                                                                               | Frontera obligatoria                                                                                                                      |
| ------------ | -------------- | --------------------------------------------------------------------------------------- | ----------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0015` | `ASIS-SRC-015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias        | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | No gobierna receta, oferta comercial ni ejecución productiva; conserva el maestro de producto y sus equivalencias.                        |
| `VPROC-0016` | `ASIS-SRC-016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas              | `fogo`      | `ASIGNADA_CON_FRONTERA` | FOGO gobierna receta, planificación, ejecución, lote, calidad y cierre del resultado productivo.                 | NEXO conserva ingredientes y productos maestros; PULSO solo consume una proyección operativa. FOGO es la única propietaria del recetario. |
| `VPROC-0017` | `ASIS-SRC-017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente.     | AURA puede originar campañas y NEXO informar disponibilidad; PULSO decide la oferta vendible y su vigencia comercial.                     |
| `VPROC-0018` | `ASIS-SRC-018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto | `nexo`      | `ASIGNADA_CON_FRONTERA` | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | FOGO aplica controles por lote; NEXO conserva la especificación maestra y sus vigencias, sin decidir la liberación productiva.            |

##### 8.5. Compras y proveedores

| Proceso      | Alias          | Proceso TO-BE                                                                                                      | Propietaria | Estado                  | Razón de propiedad                                                                                         | Frontera obligatoria                                                                                                      |
| ------------ | -------------- | ------------------------------------------------------------------------------------------------------------------ | ----------- | ----------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0019` | `ASIS-SRC-019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                   | `origo`     | `ASIGNADA`              | ORIGO gobierna necesidad de compra, proveedor, autorización, orden y aceptación comercial de la recepción. | No constituye todavía una orden de compra ni un movimiento de inventario.                                                 |
| `VPROC-0020` | `ASIS-SRC-020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                           | `origo`     | `ASIGNADA`              | ORIGO gobierna necesidad de compra, proveedor, autorización, orden y aceptación comercial de la recepción. | No convierte cotización o proveedor seleccionado en compra autorizada.                                                    |
| `VPROC-0021` | `ASIS-SRC-021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                           | `origo`     | `ASIGNADA`              | ORIGO gobierna necesidad de compra, proveedor, autorización, orden y aceptación comercial de la recepción. | No acepta físicamente existencias ni registra el hecho económico definitivo sin las confirmaciones posteriores.           |
| `VPROC-0022` | `ASIS-SRC-022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `origo`     | `ASIGNADA_CON_FRONTERA` | ORIGO gobierna necesidad de compra, proveedor, autorización, orden y aceptación comercial de la recepción. | ORIGO acepta o rechaza la recepción comercial; NEXO registra entrada, ubicación y custodia solo después de la aceptación. |

##### 8.6. Inventario y almacenamiento

| Proceso      | Alias          | Proceso TO-BE                                                                                  | Propietaria | Estado                  | Razón de propiedad                                                                                               | Frontera obligatoria                                                                                                               |
| ------------ | -------------- | ---------------------------------------------------------------------------------------------- | ----------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0023` | `ASIS-SRC-023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                         | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | No convierte una ubicación lógica en existencia ni gobierna la estructura organizacional.                                          |
| `VPROC-0024` | `ASIS-SRC-024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | No reemplaza la aceptación comercial de ORIGO ni la producción de FOGO; registra el efecto físico sobre inventario.                |
| `VPROC-0025` | `ASIS-SRC-025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino     | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | La aplicación que consume o produce solicita el efecto; NEXO gobierna cantidades, unidades, origen, destino y movimiento.          |
| `VPROC-0026` | `ASIS-SRC-026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada           | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | El conteo es observación; el ajuste requiere decisión autorizada y no sobrescribe el ledger.                                       |
| `VPROC-0027` | `ASIS-SRC-027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición               | `nexo`      | `ASIGNADA_CON_FRONTERA` | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | FOGO y VISO pueden originar controles; NEXO gobierna condición de existencia, cuarentena, vencimiento, merma y disposición física. |
| `VPROC-0028` | `ASIS-SRC-028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | `nexo`      | `ASIGNADA_CON_FRONTERA` | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | FOGO, ORIGO y PULSO originan necesidades; NEXO gobierna solicitud interna, preparación, custodia, tránsito y recepción.            |

##### 8.7. Activos, vehículos, reutilizables y contenedores

| Proceso      | Alias          | Proceso TO-BE                                                                               | Propietaria | Estado                  | Razón de propiedad                                                                                               | Frontera obligatoria                                                                                                              |
| ------------ | -------------- | ------------------------------------------------------------------------------------------- | ----------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0029` | `ASIS-SRC-029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos               | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | No confunde activo individual, reutilizable, inventario, LPN ni kit.                                                              |
| `VPROC-0030` | `ASIS-SRC-030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos            | `nexo`      | `ASIGNADA_CON_FRONTERA` | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | ORIGO puede contratar y NUMERA registrar costos; NEXO conserva activo, orden de mantenimiento, condición y liberación.            |
| `VPROC-0031` | `ASIS-SRC-031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias               | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | La planificación de rutas pertenece al proceso logístico; NEXO conserva vehículo, disponibilidad, uso, combustible e incidencias. |
| `VPROC-0032` | `ASIS-SRC-032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | No confunde contenedor físico, LPN, activo individual y stock; conserva custodia y retorno.                                       |

##### 8.8. Producción

| Proceso      | Alias          | Proceso TO-BE                                                                        | Propietaria | Estado                  | Razón de propiedad                                                                               | Frontera obligatoria                                                                                                      |
| ------------ | -------------- | ------------------------------------------------------------------------------------ | ----------- | ----------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0033` | `ASIS-SRC-033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida | `fogo`      | `ASIGNADA_CON_FRONTERA` | FOGO gobierna receta, planificación, ejecución, lote, calidad y cierre del resultado productivo. | Consume señales de PULSO, NEXO u ORIGO; ninguna señal crea automáticamente un plan aprobado.                              |
| `VPROC-0034` | `ASIS-SRC-034` | Preparar materiales y ejecutar producción contra una versión aprobada                | `fogo`      | `ASIGNADA_CON_FRONTERA` | FOGO gobierna receta, planificación, ejecución, lote, calidad y cierre del resultado productivo. | NEXO publica materiales y recibe terminados; FOGO conserva orden, receta, lote, consumo y ejecución.                      |
| `VPROC-0035` | `ASIS-SRC-035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto       | `fogo`      | `ASIGNADA_CON_FRONTERA` | FOGO gobierna receta, planificación, ejecución, lote, calidad y cierre del resultado productivo. | La disposición de calidad es independiente de la existencia; NEXO solo publica stock cuando recibe un resultado liberado. |
| `VPROC-0036` | `ASIS-SRC-036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada        | `fogo`      | `ASIGNADA_CON_FRONTERA` | FOGO gobierna receta, planificación, ejecución, lote, calidad y cierre del resultado productivo. | NEXO recibe la existencia resultante; FOGO conserva lote, presentación, empaque y etiqueta aprobados.                     |
| `VPROC-0037` | `ASIS-SRC-037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo         | `fogo`      | `ASIGNADA_CON_FRONTERA` | FOGO gobierna receta, planificación, ejecución, lote, calidad y cierre del resultado productivo. | NUMERA consume costos y NEXO movimientos; FOGO conserva rendimiento, merma, reproceso y cierre productivo.                |

##### 8.9. Pedidos, ventas, pagos y caja

| Proceso      | Alias          | Proceso TO-BE                                                                                          | Propietaria | Estado                  | Razón de propiedad                                                                                           | Frontera obligatoria                                                                                                                     |
| ------------ | -------------- | ------------------------------------------------------------------------------------------------------ | ----------- | ----------------------- | ------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0038` | `ASIS-SRC-038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación  | `pulso`     | `ASIGNADA`              | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente. | NEXO y FOGO participan en disponibilidad y preparación; PULSO conserva pedido, mesa, entrega y liquidación.                              |
| `VPROC-0039` | `ASIS-SRC-039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                         | `pulso`     | `ASIGNADA`              | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente. | La preparación puede ocurrir en cocina o barra; PULSO conserva el compromiso, su cobro y la entrega al cliente.                          |
| `VPROC-0040` | `ASIS-SRC-040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación           | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente. | Rappi, Shopify, ManyChat u otro tercero son canales; PULSO valida, deduplica y gobierna el pedido interno.                               |
| `VPROC-0041` | `ASIS-SRC-041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente. | AURA puede originar la oportunidad y FOGO/NEXO ejecutar; PULSO conserva propuesta, pedido, condiciones, entrega y facturación comercial. |
| `VPROC-0042` | `ASIS-SRC-042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos     | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente. | Cada efecto derivado se ejecuta por contrato en NEXO, NUMERA, PASS u otra propietaria; PULSO conserva la decisión comercial.             |
| `VPROC-0043` | `ASIS-SRC-043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                           | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente. | El proveedor de pagos confirma técnicamente y NUMERA consume el hecho económico; PULSO conserva el pago asociado a la venta.             |
| `VPROC-0044` | `ASIS-SRC-044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                            | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente. | NUMERA consume el resultado; PULSO conserva apertura, movimientos, arqueo, diferencias y cierre de caja.                                 |

##### 8.10. Clientes, fidelización, reclamos y reservas

| Proceso      | Alias          | Proceso TO-BE                                                                               | Propietaria | Estado                  | Razón de propiedad                                                                                                  | Frontera obligatoria                                                                                                                             |
| ------------ | -------------- | ------------------------------------------------------------------------------------------- | ----------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0045` | `ASIS-SRC-045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados | `pass`      | `ASIGNADA_CON_FRONTERA` | PASS gobierna la identidad y relación de fidelización del cliente, incluidos consentimientos, saldos y movimientos. | PULSO ejecuta acumulación o redención durante la venta mediante contrato; no mantiene saldo ni identidad de fidelización paralelos.              |
| `VPROC-0046` | `ASIS-SRC-046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                          | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente.        | PASS puede presentar el caso al cliente y NUMERA registrar compensaciones; PULSO conserva reclamo comercial, resolución y efecto sobre la venta. |
| `VPROC-0047` | `ASIS-SRC-047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento      | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente.        | AURA puede comunicar campañas; PULSO conserva capacidad comprometida, reserva, condiciones y relación con el pedido.                             |

##### 8.11. Transporte y entregas

| Proceso      | Alias          | Proceso TO-BE                                                                       | Propietaria | Estado                  | Razón de propiedad                                                                                               | Frontera obligatoria                                                                                                             |
| ------------ | -------------- | ----------------------------------------------------------------------------------- | ----------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0048` | `ASIS-SRC-048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho         | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | No crea un pedido de cliente ni decide su entrega comercial; prepara el transporte y la custodia logística.                      |
| `VPROC-0049` | `ASIS-SRC-049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente | `nexo`      | `ASIGNADA_CON_FRONTERA` | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas. | Aplica a rutas internas y transferencias físicas; la entrega de pedido al cliente permanece en PULSO.                            |
| `VPROC-0050` | `ASIS-SRC-050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna          | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente.     | El tercero ejecuta el recorrido; PULSO conserva pedido, promesa, seguimiento, resultado y conciliación de la entrega al cliente. |

##### 8.12. Finanzas y obligaciones

| Proceso      | Alias          | Proceso TO-BE                                                                             | Propietaria | Estado                  | Razón de propiedad                                                                                                      | Frontera obligatoria                                                                                                 |
| ------------ | -------------- | ----------------------------------------------------------------------------------------- | ----------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0051` | `ASIS-SRC-051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados           | `numera`    | `ASIGNADA_CON_FRONTERA` | NUMERA gobierna el registro, conciliación, planificación o análisis económico sin recrear el hecho operativo de origen. | Cada aplicación propietaria emite el hecho; NUMERA lo clasifica y concilia sin crear una versión operativa paralela. |
| `VPROC-0052` | `ASIS-SRC-052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria             | `numera`    | `ASIGNADA_CON_FRONTERA` | NUMERA gobierna el registro, conciliación, planificación o análisis económico sin recrear el hecho operativo de origen. | ORIGO conserva compra y recepción; NUMERA gobierna obligación, aprobación financiera, pago y conciliación.           |
| `VPROC-0053` | `ASIS-SRC-053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                | `numera`    | `ASIGNADA_CON_FRONTERA` | NUMERA gobierna el registro, conciliación, planificación o análisis económico sin recrear el hecho operativo de origen. | PULSO u otra propietaria conserva la venta o cuenta origen; NUMERA gobierna cartera, recaudo, aplicación y saldo.    |
| `VPROC-0054` | `ASIS-SRC-054` | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas | `numera`    | `ASIGNADA_CON_FRONTERA` | NUMERA gobierna el registro, conciliación, planificación o análisis económico sin recrear el hecho operativo de origen. | Los hechos permanecen en sus aplicaciones; NUMERA conserva asignación, cálculo, cierre y análisis económico.         |

##### 8.13. Instalaciones, mercadeo, tecnología, información y continuidad

| Proceso      | Alias          | Proceso TO-BE                                                                                            | Propietaria | Estado                            | Razón de propiedad                                                                                                                   | Frontera obligatoria                                                                                                                                                          |
| ------------ | -------------- | -------------------------------------------------------------------------------------------------------- | ----------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0055` | `ASIS-SRC-055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones  | `nexo`      | `ASIGNADA_CON_FRONTERA`           | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas.                     | Los activos específicos permanecen en NEXO y las obligaciones SST en VISO; este proceso gobierna la condición de la instalación y su cierre.                                  |
| `VPROC-0056` | `ASIS-SRC-056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                | `aura`      | `ASIGNADA_EN_APLICACION_DIFERIDA` | AURA gobierna campañas, contenido, audiencias, oportunidades y resultados de mercadeo, aunque su implementación permanezca diferida. | PULSO aplica promociones en la venta y PASS expone beneficios al cliente; AURA conserva intención, pieza, calendario, aprobación y publicación.                               |
| `VPROC-0057` | `ASIS-SRC-057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                  | `aura`      | `ASIGNADA_EN_APLICACION_DIFERIDA` | AURA gobierna campañas, contenido, audiencias, oportunidades y resultados de mercadeo, aunque su implementación permanezca diferida. | PULSO conserva pedidos y clientes operativos; AURA conserva interacción, oportunidad, etapa de seguimiento y atribución comercial.                                            |
| `VPROC-0058` | `ASIS-SRC-058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento    | `viso`      | `ASIGNADA_CON_FRONTERA`           | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                    | ANIMA puede reportar y consultar; NEXO aporta el elemento físico. VISO conserva solicitud, incidente, problema, cambio, SLA y cierre.                                         |
| `VPROC-0059` | `ASIS-SRC-059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                 | `viso`      | `ASIGNADA_CON_FRONTERA`           | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                    | SHELL aplica navegación y cada aplicación sus controles; VISO conserva solicitud, aprobación, vigencia y revocación de autoridad laboral.                                     |
| `VPROC-0060` | `ASIS-SRC-060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia               | `viso`      | `ASIGNADA_CON_FRONTERA`           | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                    | Cada aplicación conserva el hecho respaldado; VISO gobierna clasificación, retención, acceso, legal hold, disposición y caso transversal.                                     |
| `VPROC-0061` | `ASIS-SRC-061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                             | `numera`    | `ASIGNADA_CON_FRONTERA`           | NUMERA gobierna el registro, conciliación, planificación o análisis económico sin recrear el hecho operativo de origen.              | Las aplicaciones conservan sus hechos y métricas primarias; NUMERA consolida, interpreta y vincula acciones de mejora sin reescribirlas.                                      |
| `VPROC-0062` | `ASIS-SRC-062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje | `viso`      | `ASIGNADA_CON_FRONTERA`           | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.                    | Cada aplicación recupera y reconcilia su proceso y datos; VISO gobierna criticidad, plan, incidente empresarial, coordinación y cierre. SHELL solo informa o coordina acceso. |

##### 8.14. Procesos adicionales

| Proceso      | Alias                     | Proceso TO-BE                                                                                                                                                                                            | Propietaria | Estado                  | Razón de propiedad                                                                                                      | Frontera obligatoria                                                                                                                                                |
| ------------ | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0063` | `ADICIONAL-PROVISIONAL-A` | `CAP-01.07` — Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.       | Los riesgos operativos especializados permanecen en sus dominios; VISO conserva el registro empresarial, tratamiento, aceptación y seguimiento.                     |
| `VPROC-0064` | `ADICIONAL-PROVISIONAL-B` | `CAP-01.09` — Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.       | La autoridad o asesor externo no se vuelve propietario; VISO conserva obligación, vencimiento, responsable, entrega y evidencia interna.                            |
| `VPROC-0065` | `ADICIONAL-PROVISIONAL-C` | `CAP-02.10` — Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.       | La selección previa y el desarrollo del trabajador son procesos distintos, ambos gobernados por VISO con experiencias y datos separados.                            |
| `VPROC-0066` | `ADICIONAL-PROVISIONAL-D` | `CAP-03.03` — Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `viso`      | `ASIGNADA_CON_FRONTERA` | VISO gobierna el registro administrativo, la autoridad, el seguimiento y la corrección del resultado transversal.       | NEXO conserva existencias y movimientos de EPP; VISO gobierna necesidad, asignación a persona, vigencia, devolución y cumplimiento SST.                             |
| `VPROC-0067` | `ADICIONAL-PROVISIONAL-E` | `CAP-07.11` — Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `nexo`      | `ASIGNADA`              | NEXO gobierna identidad física, existencias, ubicaciones, custodia, activos, logística y condiciones operativas.        | No confunde kit con activo, LPN o stock; NEXO conserva definición, componentes, armado, custodia y completitud.                                                     |
| `VPROC-0068` | `ADICIONAL-PROVISIONAL-F` | `CAP-10.06` — Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `pulso`     | `ASIGNADA_CON_FRONTERA` | PULSO gobierna oferta vendible, pedido, servicio, venta, pago, caja y resultado comercial frente al cliente.            | PASS puede capturar respuesta del cliente y AURA consumir tendencias; PULSO gobierna la medición vinculada al servicio y evita mezclarla con reclamos o incentivos. |
| `VPROC-0069` | `ADICIONAL-PROVISIONAL-G` | `CAP-12.11` — Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `numera`    | `ASIGNADA_CON_FRONTERA` | NUMERA gobierna el registro, conciliación, planificación o análisis económico sin recrear el hecho operativo de origen. | Los hechos y compromisos provienen de NUMERA y aplicaciones operativas; el presupuesto no crea gasto ni asiento por sí solo.                                        |

---

#### 9. Decisiones contractuales que cierran brechas de propiedad

| Brecha                                                         | Decisión aprobable en esta tarea                                                                                                                                                                                                | Consecuencia para tareas posteriores                                                                              |
| -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `GAP-OWN-001` — recetario operativo de barra y cocina satélite | `VPROC-0016` pertenece a `fogo`. NEXO conserva producto e ingrediente maestro; PULSO consume la proyección publicada para preparación asociada a ventas.                                                                        | Ninguna receta se duplicará dentro de PULSO ni se inferirá acceso desde `pulso.access`.                           |
| `GAP-OWN-002` — impresión y reimpresión empresarial            | No existe un propietario universal de la intención de imprimir. La aplicación propietaria del proceso o documento autoriza y conserva la intención; el servicio técnico de E4 ejecuta cola, dispositivo, reintento y resultado. | `PROC-CAT-006`, `PRINT-ARC-*` y E4 deberán separar decisión empresarial de ejecución técnica.                     |
| `GAP-OWN-003` — incidente operativo transversal                | La desviación pertenece al proceso afectado. `viso` gobierna únicamente el caso transversal de soporte, riesgo, continuidad o escalamiento representado por `VPROC-0058`, `VPROC-0062` o `VPROC-0063`.                          | No se creará un registro universal que sustituya ajustes, cancelaciones o novedades de la aplicación propietaria. |
| `GAP-OWN-004` — ORIGO frente a NEXO en recepción               | `VPROC-0022` pertenece a `origo`: aceptación comercial y documental. `VPROC-0024` pertenece a `nexo`: entrada, ubicación y custodia física después de aceptación.                                                               | La integración deberá ser idempotente y cada aplicación conservará su autorización y estado.                      |
| `GAP-OWN-005` — PULSO frente a NEXO en entrega                 | `VPROC-0048` y `VPROC-0049` pertenecen a `nexo` para transporte interno. `VPROC-0050` pertenece a `pulso` para entrega asociada a pedido de cliente mediante tercero.                                                           | Entrega comercial y transferencia logística no se fusionarán por compartir vehículo, conductor o evidencia.       |
| `GAP-OWN-006` — fidelización laboral frente a PASS             | `VPROC-0045` pertenece a `pass`. PULSO ejecuta acumulación y redención dentro de la venta mediante contrato autorizado, pero no mantiene saldo, consentimiento ni identidad paralelos.                                          | PASS permanece separado del RBAC laboral; PULSO requiere permisos laborales atómicos para las acciones de caja.   |

**Resultado:** las seis brechas quedan con decisión funcional y frontera. Su cierre físico dependerá de contratos, implementación y pruebas en sus tareas propietarias.

---

#### 10. Distribución de propiedad

| Aplicación | Procesos asignados | Observación                                                                                               |
| ---------- | -----------------: | --------------------------------------------------------------------------------------------------------- |
| `shell`    |              **0** | No recibe procesos de este catálogo; conserva hub, acceso y coordinación.                                 |
| `anima`    |              **1** | Asistencia y tiempo trabajado.                                                                            |
| `viso`     |             **20** | Gobierno, selección, personas vinculadas, SST, soporte, información, continuidad y riesgos transversales. |
| `nexo`     |             **16** | Producto maestro, inventario, activos, instalaciones y logística interna.                                 |
| `fogo`     |              **6** | Recetas y ciclo productivo.                                                                               |
| `origo`    |              **4** | Ciclo de abastecimiento y recepción comercial.                                                            |
| `pulso`    |             **12** | Oferta, ventas, servicio, pagos, caja, reclamos, reservas y entrega al cliente.                           |
| `numera`   |              **7** | Pagos laborales, hechos económicos, obligaciones, cartera, costos, mejora y presupuesto.                  |
| `aura`     |              **2** | Contenido y oportunidades; aplicación diferida.                                                           |
| `pass`     |              **1** | Identidad y fidelización del cliente.                                                                     |

**Total reconciliado:** **69 de 69 procesos**.

```text
UNIVERSO CANÓNICO DE AppCode                  10
APLICACIONES EFECTIVAMENTE USADAS COMO OWNER   9
PROCESOS CON UNA PROPIETARIA                  69
PROCESOS SIN PROPIETARIA                       0
PROPIEDADES MÚLTIPLES                          0
PROPIETARIAS EXTERNAS                          0
PROCESOS ASIGNADOS A SHELL                     0
```

Que SHELL tenga cero procesos no significa que carezca de responsabilidades. Su responsabilidad canónica permanece en autenticación, entrada, navegación, selección contextual, disponibilidad y coordinación entre aplicaciones, sin apropiarse de los procesos empresariales enumerados.

La reconciliación distingue expresamente el catálogo de identidad de aplicaciones del subconjunto efectivamente utilizado como propietaria: los 10 `AppCode` siguen vigentes, pero únicamente 9 aparecen con al menos un proceso asignado en `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`.

---

#### 11. Efectos obligatorios sobre tareas posteriores

- `PROC-CAT-006` deberá registrar consumidoras sin cambiar la propietaria.
- `PROC-CAT-007` y `PROC-CAT-008` deberán asignar actores dentro de la autoridad de la propietaria.
- `PROC-CAT-009` a `PROC-CAT-014` deberán definir estados y acciones que la propietaria pueda gobernar.
- `PROC-CAT-015` y `PROC-CAT-016` deberán distinguir información principal de proyecciones consumidoras.
- `PROC-CAT-017` deberá hacer que la propietaria emita eventos canónicos; una consumidora no recreará el hecho.
- `PROC-CAT-018` deberá conservar principal, actor, propietaria, consumidores y contratos en la auditoría.
- `PROC-CAT-019` deberá diferenciar métricas del proceso frente a análisis consolidado de NUMERA.
- `PROC-CAT-020` deberá revisar solapamientos sin introducir propiedad compartida.
- BLOQUE E3 deberá materializar fuentes de verdad por dominio, no por aplicación o pantalla.
- E4 deberá ejecutar servicios transversales sin convertirse en propietaria empresarial.
- E5 deberá asignar cada paquete al repositorio de la propietaria y declarar consumidores, contratos y rollback.

---

#### 12. Cambio de aplicación propietaria

Una propietaria no cambiará porque:

- otra aplicación muestre una pantalla;
- un equipo copie temporalmente datos;
- una integración externa reciba primero el evento;
- un servicio compartido persista, imprima o notifique;
- se mueva una tabla de esquema;
- cambie el repositorio o framework;
- una aplicación consumidora tenga más usuarios.

Un cambio material requerirá:

1. decisión documental aprobada;
2. motivo empresarial;
3. inventario de consumidores;
4. contrato de transición y compatibilidad;
5. migración versionada en `vento-shell` cuando afecte Supabase;
6. reconciliación de estados y datos;
7. pruebas de paridad e idempotencia;
8. rollback;
9. conservación del `VPROC-*` y del historial de propiedad;
10. actualización del registro canónico.

---

#### 13. Reconciliación y pendientes

| Elemento                              | Resolución                                                                                                                  |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` a `VPROC-0069`           | Todos reciben exactamente una aplicación propietaria.                                                                       |
| universo de `AppCode`                 | Se conservan exactamente 10 identidades canónicas.                                                                          |
| propietarias efectivamente utilizadas | Se utilizan exactamente 9 `AppCode`; `shell` conserva 0 procesos asignados.                                                 |
| `aura`                                | Conserva propiedad objetivo de dos procesos, pero permanece diferida; no habilita implementación ni navegación.             |
| producto futuro `vento-talento`       | Se trata como canal candidato futuro de `VPROC-0005`; no es aplicación propietaria ni consumidora hasta aprobar `app_code`. |
| `shell`                               | Permanece como hub y coordinador, sin procesos asignados en este catálogo.                                                  |
| servicios compartidos                 | Impresión, notificaciones, colas, auditoría y almacenamiento no adquieren propiedad del proceso.                            |
| aplicaciones externas                 | Se mantienen como canales o ejecutores externos mediante adaptadores.                                                       |
| aplicaciones consumidoras             | Reservadas para `PROC-CAT-006`.                                                                                             |
| propiedad física de tablas y esquemas | Reservada para BLOQUE E3; no cambia la propiedad funcional.                                                                 |
| cierre de brechas `GAP-OWN-*`         | Decisión funcional definida; implementación y evidencia quedan vinculadas a E3, E4, E5 y tareas de integración aplicables.  |

**Resultado:** no se deja una decisión de propiedad sin aplicación ni destino documental.

---

#### 14. Impacto contractual

| Dimensión                              | Resultado                                                                                                                    |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| permisos                               | No se crean ni modifican permisos. La propiedad no concede acceso.                                                           |
| modalidad y alcance                    | No se modifican.                                                                                                             |
| turno, check-in y área activa          | No se modifican.                                                                                                             |
| dispositivo compartido                 | No se modifica.                                                                                                              |
| simulación                             | No se modifica.                                                                                                              |
| recursos                               | No se crean contratos físicos de recurso.                                                                                    |
| matrices                               | No se regeneran.                                                                                                             |
| Supabase, RLS, RPC, Storage y Realtime | No se modifican.                                                                                                             |
| aplicaciones                           | Se asigna propiedad funcional; no se declara implementación ni disponibilidad.                                               |
| experiencia y navegación               | No se diseñan pantallas ni rutas.                                                                                            |
| datos                                  | Se define autoridad funcional; persistencia física permanece reservada para E3.                                              |
| integraciones                          | Se establecen fronteras, pero contratos detallados permanecen en `PROC-CAT-006`, `PROC-CAT-015` a `PROC-CAT-018` y BLOQUE X. |
| migraciones                            | No se crean. Toda futura migración deberá crearse y documentarse en `vento-shell`.                                           |

---

#### 15. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                                                | Riesgo evitado                                                                       | Tipo                                     | Prioridad | Momento de implementación                                                | Destino                                                                       |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------- | --------- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| `TREQ-PROC-018` | Cada proceso activo deberá resolver exactamente a una propietaria del catálogo canónico; no se admitirán valores nulos, listas, propietarios externos, repositorios, plataformas o soportes.   | procesos sin autoridad, propiedad múltiple y fuentes de verdad competidoras          | contrato + CI                            | crítica   | consolidación documental y materialización física del registro           | Registro Canónico; `SHELL-CI-017`; BLOQUE E3                                  |
| `TREQ-PROC-019` | La propietaria deberá gobernar registro principal, reglas, estado, corrección y cierre; una consumidora no podrá mantener una copia mutable e independiente del resultado.                     | divergencia entre aplicaciones, doble cierre y correcciones incompatibles            | contrato + integración + regresión       | crítica   | `PROC-CAT-006` a `PROC-CAT-018` y paquetes E5                            | Registro Canónico; E2, E3, E5, T y U                                          |
| `TREQ-PROC-020` | Un cambio de propietaria deberá conservar `VPROC-*`, historial, consumidores, compatibilidad, datos, eventos, pruebas y rollback mediante una transición versionada.                           | pérdida de linaje, migración destructiva y consumidores huérfanos                    | migración + contrato + regresión         | crítica   | toda transferencia futura de propiedad                                   | Registro Canónico; `PROC-CAT-020`; BLOQUES E3, R y T                          |
| `TREQ-PROC-021` | Las fronteras de `GAP-OWN-001` a `GAP-OWN-006` deberán impedir duplicar recetario, impresión, incidentes, recepción, entrega y fidelización entre sus aplicaciones participantes.              | propiedad ambigua, autorización incorrecta y efectos duplicados entre dominios       | contractual + integración + E2E          | crítica   | contratos detallados, implementación y pilotos de los procesos afectados | Registro Canónico; `PROC-CAT-006`; `PROC-CAT-017`; `PROC-CAT-018`; E4, E5 y U |
| `TREQ-PROC-022` | Una propietaria asignada en aplicación diferida o un canal futuro no podrá convertir el proceso en disponible, navegable u operativo sin cobertura, readiness, despliegue y pruebas aprobadas. | falsa disponibilidad y activación prematura de AURA, TALENTO u otros módulos futuros | contrato + interfaz + regresión negativa | alta      | navegación, paquetes E5 y puertas de readiness                           | Registro Canónico; `PROC-COVER-007`; `READY-GATE-005`; BLOQUES I, T y U       |

Los requisitos `TREQ-PROC-018` a `TREQ-PROC-022` deberán incorporarse al Registro Canónico de Requisitos de Prueba mediante regeneración completa del archivo.

La presente corrección no crea ni modifica esos requisitos: corrige únicamente la cardinalidad descriptiva de aplicaciones efectivamente utilizadas como propietarias, manteniendo intactas las 69 asignaciones y todas las reglas protegidas.

---

#### 16. Criterios de aceptación

- [ ] `PROC-CAT-004` figura aprobada.
- [ ] Existe un único `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`.
- [ ] Se asignaron exactamente 69 propietarias para `VPROC-0001` a `VPROC-0069`.
- [ ] Cada proceso aparece una sola vez.
- [ ] Todas las propietarias pertenecen al catálogo canónico de 10 `AppCode`.
- [ ] Exactamente 9 `AppCode` aparecen con al menos un proceso asignado; `shell` conserva 0 procesos.
- [ ] No existen valores nulos, propietarios conjuntos ni aplicaciones externas propietarias.
- [ ] La propiedad corresponde al propósito empresarial y no a la implementación actual.
- [ ] `VPROC-0005` pertenece a VISO; un portal futuro de TALENTO solo podrá actuar como canal candidato sin crear vínculo ni permisos.
- [ ] `VPROC-0008` pertenece a ANIMA.
- [ ] `VPROC-0016` pertenece a FOGO y no se duplica en PULSO.
- [ ] `VPROC-0022` pertenece a ORIGO y la entrada física posterior pertenece a NEXO.
- [ ] `VPROC-0045` pertenece a PASS y PULSO actúa mediante contrato laboral.
- [ ] `VPROC-0048` y `VPROC-0049` pertenecen a NEXO; `VPROC-0050` pertenece a PULSO.
- [ ] AURA y TALENTO permanecen diferidas sin presentarse como cobertura operativa.
- [ ] SHELL no recibe propiedad falsa sobre procesos empresariales.
- [ ] Impresión, colas, notificaciones, documentos y Supabase no adquieren propiedad por ser servicios técnicos.
- [ ] Las brechas `GAP-OWN-001` a `GAP-OWN-006` tienen decisión y frontera explícitas.
- [ ] Se conservan `TREQ-PROC-018` a `TREQ-PROC-022` sin modificación por esta corrección.
- [ ] No se modificó código, Supabase, RLS, RPC, Storage, Realtime, migraciones ni operación.
- [ ] Toda futura migración de Supabase queda reservada para `vento-shell`.
- [ ] El marcador de `PROC-CAT-006` permanece sin iniciar.

---

#### 17. Estado

```text
APROBADA
```

No se inicia `PROC-CAT-006` hasta la aprobación expresa de `PROC-CAT-005`.

#### 18. Continuidad

##### ÚLTIMA TAREA APROBADA

PROC-CAT-004 — Definir propósito empresarial de cada proceso

##### TAREA ACTUAL APROBADA

PROC-CAT-005 — Definir aplicación propietaria de cada proceso

##### SIGUIENTE TAREA RESERVADA

PROC-CAT-006 — Definir aplicaciones consumidoras de cada proceso


### ✅ PROC-CAT-006 — Definir aplicaciones consumidoras de cada proceso

**Estado:** APROBADA
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Dependencias obligatorias:** `E1-GATE-001` — APROBADA; `PROC-CAT-001` a `PROC-CAT-005` — APROBADAS  
**Línea base recibida:** `PROC-ASIS-CATALOG-001`, `PROC-TOBE-DESIGN-001`, `PROC-CANONICAL-ID-REGISTRY-001`, `PROC-BUSINESS-PURPOSE-REGISTRY-001` y `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`  
**Naturaleza:** decisión funcional de consumo interaplicación, sin implementación  
**Artefacto producido:** `PROC-APPLICATION-CONSUMER-REGISTRY-001`  
**Procesos cubiertos:** **69**  
**Rango cubierto:** `VPROC-0001` a `VPROC-0069`  
**Relaciones directas de consumo:** **278**
**Relaciones condicionales de consumo:** **77**
**Cambios en código, migraciones o Supabase:** no autorizados  
**Siguiente tarea reservada:** `PROC-CAT-007 — Definir actor iniciador de cada proceso`

---

#### 1. Propósito

Definir qué aplicaciones necesitan consumir el resultado de cada proceso canónico, con qué carácter y bajo qué límite, sin transferirles la propiedad funcional ni permitir fuentes de verdad competidoras.

```text
PROCESO VPROC-*
        ↓
APLICACIÓN PROPIETARIA
        ↓ contrato, proyección o evento autorizado
APLICACIONES CONSUMIDORAS DECLARADAS
        ↓
LECTURA, SOLICITUD, EFECTO PROPIO, PRESENTACIÓN, CONCILIACIÓN O ANÁLISIS
```

Una aplicación consumidora participa porque necesita una proyección, referencia, decisión, evento o solicitud del proceso. Esa participación no la autoriza a recrear, corregir o cerrar el registro principal de la propietaria.

---

#### 2. Resultado obligatorio

La tarea produce `PROC-APPLICATION-CONSUMER-REGISTRY-001`, que deberá:

1. cubrir exactamente `VPROC-0001` a `VPROC-0069`;
2. conservar la propietaria aprobada en `PROC-CAT-005`;
3. declarar consumidoras directas y condicionales mediante códigos canónicos de aplicación;
4. excluir a la propietaria de su propia lista de consumidoras;
5. impedir aplicaciones duplicadas dentro del mismo proceso;
6. diferenciar consumo de propiedad, persistencia, autorización, actor y servicio técnico;
7. declarar una modalidad funcional dominante sin diseñar todavía endpoints, tablas, eventos o pantallas;
8. conservar las fronteras aprobadas en `PROC-CAT-005`;
9. servir como entrada para `PROC-CAT-007` a `PROC-CAT-020`, bloques X/E3/E4 y paquetes E5;
10. permitir validar que ninguna aplicación acceda directamente a un proceso no declarado.

---

#### 3. Definiciones normativas

| Concepto                | Definición                                                                                                                                               |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| consumidora directa     | Aplicación que necesita el resultado o referencia del proceso en toda ejecución aplicable del alcance definido.                                          |
| consumidora condicional | Aplicación que consume únicamente cuando una variante, canal, sede, tipo de recurso, efecto o decisión específica la involucra.                          |
| propietaria             | Aplicación que gobierna el registro principal, reglas, estado, corrección y cierre. No se repite como consumidora.                                       |
| proveedor externo       | Sistema técnico o contraparte que participa mediante adaptador. No se registra como aplicación consumidora de Vento OS.                                  |
| servicio transversal    | Impresión, colas, notificaciones, documentos, auditoría o integración. Facilita el consumo, pero no se convierte en aplicación consumidora por sí mismo. |

Una consumidora no obtiene automáticamente:

- acceso a todos los campos;
- permiso de escritura;
- autoridad para aprobar o cerrar;
- acceso a todas las sedes o áreas;
- disponibilidad de pantalla;
- derecho a conservar una copia mutable;
- facultad para consumir datos sensibles no necesarios.

---

#### 4. Modalidades funcionales de consumo

| Código                             | Uso permitido                                                                                    |
| ---------------------------------- | ------------------------------------------------------------------------------------------------ |
| `REFERENCIA_CANONICA`              | Consultar una identidad, versión, estructura o regla vigente gobernada por la propietaria.       |
| `PROYECCION_Y_EVENTO`              | Recibir una proyección mínima y cambios de estado relevantes.                                    |
| `SOLICITUD_HANDOFF_Y_EVENTO`       | Iniciar una solicitud o transferencia controlada y recibir su resultado.                         |
| `HECHO_Y_PROYECCION`               | Consumir un hecho inmutable o una proyección derivada sin reescribirlo.                          |
| `REFERENCIA_Y_EVENTO`              | Consumir una referencia versionada y eventos de publicación o retiro.                            |
| `SOLICITUD_EFECTO_Y_EVENTO`        | Solicitar un efecto al propietario, ejecutar únicamente el efecto propio y recibir confirmación. |
| `SEÑAL_EFECTO_Y_EVENTO`            | Entregar señales o restricciones, ejecutar efectos propios y recibir el resultado del proceso.   |
| `EVENTO_CONCILIACION_Y_PROYECCION` | Recibir hechos, conciliarlos y publicar una proyección autorizada sin recrear el origen.         |
| `PROYECCION_EVENTO_Y_ANALISIS`     | Presentar o analizar resultados derivados sin modificar el proceso fuente.                       |
| `PROYECCION_Y_ANALISIS`            | Consumir resultados consolidados para decisión, seguimiento o planeación.                        |

Estas modalidades son funcionales. `PROC-CAT-015` a `PROC-CAT-017` y los bloques X/E3/E4 definirán después entradas, salidas, eventos y transporte técnico.

---

#### 5. Reglas canónicas

1. Solo podrán consumir un proceso las aplicaciones declaradas en este registro o incorporadas mediante una revisión aprobada.
2. La propietaria no se repetirá como consumidora de su propio proceso.
3. Una consumidora directa o condicional deberá utilizar una proyección, comando, evento o referencia contractual; no podrá escribir directamente el estado privado de la propietaria.
4. Las consumidoras recibirán únicamente los campos, territorios, estados y acciones necesarios para su finalidad.
5. El consumo condicional deberá resolverse mediante reglas explícitas; no mediante nombres de rol, rutas, tablas o coincidencias textuales.
6. La aplicación consumidora podrá ejecutar un efecto perteneciente a su propio dominio, pero deberá devolver un resultado correlacionado a la propietaria.
7. NUMERA consumirá hechos económicos sin reconstruir ventas, compras, inventario, producción o trabajo.
8. VISO consumirá resultados administrativos, laborales, de riesgo o cumplimiento sin apropiarse del hecho operativo de origen.
9. SHELL solo figura como consumidora cuando necesita disponibilidad, contexto, acceso o continuidad; no por presentar enlaces al ecosistema.
10. PASS, AURA y TALENTO podrán figurar como consumidoras aunque su cobertura esté parcial o diferida; ello no habilita navegación ni operación.
11. Supabase, `vento-shell`, proveedores externos, papel, Excel, WhatsApp, dispositivos, sedes y áreas no son aplicaciones consumidoras.
12. El retiro de una consumidora requerirá comprobar que no existen pantallas, jobs, integraciones, reportes, cachés, colas, exports ni procesos operativos dependientes.
13. Toda incorporación o retiro deberá conservar compatibilidad, pruebas, rollback y trazabilidad del mismo `VPROC-*`.
14. Las consumidoras declaradas no sustituyen el mapa de actores que inicia en `PROC-CAT-007`.

---

#### 6. Catálogo permitido de aplicaciones consumidoras

| Código   | Alcance de consumo                                                                                                            |
| -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `shell`  | Disponibilidad, contexto, acceso y continuidad del ecosistema.                                                                |
| `anima`  | Presentación al trabajador, solicitudes personales, asistencia y confirmaciones.                                              |
| `viso`   | Gobierno administrativo, laboral, seguridad, riesgo, cumplimiento y soporte.                                                  |
| `nexo`   | Producto maestro, inventario, ubicación, custodia, activos, logística y efectos físicos.                                      |
| `fogo`   | Receta, planificación, ejecución, lote, calidad y efectos productivos.                                                        |
| `origo`  | Necesidad, proveedor, compra y aceptación comercial de recepción.                                                             |
| `pulso`  | Oferta, pedido, servicio, venta, pago, caja y entrega comercial.                                                              |
| `numera` | Hecho económico, conciliación, presupuesto, costo y análisis.                                                                 |
| `aura`   | Campaña, audiencia, oportunidad, reputación y atribución de mercadeo.                                                         |
| `pass`   | Identidad, consentimiento, fidelización y autoservicio del cliente mediante comandos y proyecciones de procesos propietarios. |

---

#### 7. Interpretación de las listas

```text
CONSUMIDORA DIRECTA
→ el contrato del proceso deberá contemplarla siempre que el proceso sea aplicable

CONSUMIDORA CONDICIONAL
→ el contrato la incluirá solo cuando se cumpla la condición de negocio aprobada

NO DECLARADA
→ no podrá leer, mutar, suscribirse, exportar ni conservar una copia del proceso
```

La condición específica se cerrará mediante estados, actores, entradas, salidas, eventos, fronteras y contratos de integración posteriores. Esta tarea no inventa una condición técnica ni autoriza acceso mientras esa condición no exista.

---

#### 8. Registro canónico de aplicaciones consumidoras

##### 8.1. Gobierno y estructura

| Proceso      | Propietaria | Consumidoras directas                                                        | Consumidoras condicionales                                          | Modalidad dominante   | Frontera conservada                                                                                                      |
| ------------ | ----------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0001` | `viso`      | —                                                                            | `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | `PROYECCION_Y_EVENTO` | La decisión sigue siendo humana; VISO conserva contexto, autoridad, compromisos y seguimiento, no sustituye a Dirección. |
| `VPROC-0002` | `viso`      | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                                                                   | `REFERENCIA_CANONICA` | No convierte marcas, sedes o áreas en entidades jurídicas por inferencia ni concede acceso por la sola estructura.       |
| `VPROC-0003` | `viso`      | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                                                                   | `REFERENCIA_CANONICA` | No sustituye la decisión normativa humana ni la ejecución de controles dentro de cada aplicación.                        |
| `VPROC-0004` | `viso`      | —                                                                            | `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | `PROYECCION_Y_EVENTO` | No absorbe el trabajo de las aplicaciones participantes; conserva compromiso, responsable, plazo y cierre transversal.   |

##### 8.2. Personas y trabajo

| Proceso      | Propietaria | Consumidoras directas                                                | Consumidoras condicionales                         | Modalidad dominante          | Frontera conservada                                                                                                                  |
| ------------ | ----------- | -------------------------------------------------------------------- | -------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0005` | `viso`      | —                                                                    | `anima`, `numera`                                  | `SOLICITUD_HANDOFF_Y_EVENTO` | VISO gobierna selección y traspaso; el portal candidato futuro será canal externo controlado hasta obtener `app_code`.               |
| `VPROC-0006` | `viso`      | `anima`, `shell`                                                     | `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura` | `SOLICITUD_HANDOFF_Y_EVENTO` | Recibe el traspaso aprobado de `VPROC-0005`; ANIMA presenta información al trabajador, pero no gobierna el alta laboral.             |
| `VPROC-0007` | `viso`      | `anima`, `shell`                                                     | `nexo`, `fogo`, `origo`, `pulso`, `numera`         | `SOLICITUD_HANDOFF_Y_EVENTO` | VISO publica asignaciones y turnos; ANIMA los presenta y registra la ejecución, sin mantener una programación paralela.              |
| `VPROC-0008` | `anima`     | `viso`, `numera`, `shell`                                            | `nexo`, `fogo`, `origo`, `pulso`                   | `HECHO_Y_PROYECCION`         | VISO puede corregir o supervisar con autoridad; no mantiene una asistencia competidora.                                              |
| `VPROC-0009` | `viso`      | `anima`, `shell`                                                     | `nexo`, `fogo`, `origo`, `pulso`, `numera`         | `SOLICITUD_HANDOFF_Y_EVENTO` | ANIMA puede iniciar solicitudes personales; VISO gobierna aprobación, reemplazo y efecto sobre la programación.                      |
| `VPROC-0010` | `numera`    | `viso`, `anima`                                                      | —                                                  | `HECHO_Y_PROYECCION`         | VISO aporta vínculo, tiempo y novedades; bancos o terceros ejecutan pagos, pero NUMERA conserva paquete, obligación y conciliación.  |
| `VPROC-0011` | `viso`      | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura` | —                                                  | `SOLICITUD_HANDOFF_Y_EVENTO` | Cada aplicación revoca sus accesos por contrato; VISO gobierna el caso laboral y verifica el cierre integral.                        |
| `VPROC-0012` | `viso`      | `anima`, `nexo`, `fogo`, `origo`, `pulso`                            | `numera`                                           | `PROYECCION_Y_EVENTO`        | Las inspecciones físicas pueden ejecutarse en NEXO o FOGO; VISO conserva el caso SST, el riesgo y el plan de acción.                 |
| `VPROC-0013` | `viso`      | `anima`, `nexo`, `fogo`, `origo`, `pulso`                            | `numera`                                           | `PROYECCION_Y_EVENTO`        | La respuesta operativa puede involucrar múltiples aplicaciones y autoridades; VISO conserva expediente, investigación y seguimiento. |
| `VPROC-0014` | `viso`      | `nexo`, `fogo`, `origo`, `pulso`, `anima`                            | —                                                  | `PROYECCION_Y_EVENTO`        | FOGO, NEXO y PULSO aplican controles en su operación; VISO gobierna obligaciones, hallazgos y acciones de cumplimiento.              |

##### 8.3. Producto, receta y oferta

| Proceso      | Propietaria | Consumidoras directas                                      | Consumidoras condicionales | Modalidad dominante   | Frontera conservada                                                                                                                       |
| ------------ | ----------- | ---------------------------------------------------------- | -------------------------- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0015` | `nexo`      | `fogo`, `origo`, `pulso`, `numera`, `pass`, `aura`, `viso` | —                          | `REFERENCIA_CANONICA` | No gobierna receta, oferta comercial ni ejecución productiva; conserva el maestro de producto y sus equivalencias.                        |
| `VPROC-0016` | `fogo`      | `nexo`, `pulso`, `numera`                                  | `origo`                    | `REFERENCIA_Y_EVENTO` | NEXO conserva ingredientes y productos maestros; PULSO solo consume una proyección operativa. FOGO es la única propietaria del recetario. |
| `VPROC-0017` | `pulso`     | `pass`, `aura`, `nexo`, `fogo`, `numera`                   | —                          | `REFERENCIA_Y_EVENTO` | AURA puede originar campañas y NEXO informar disponibilidad; PULSO decide la oferta vendible y su vigencia comercial.                     |
| `VPROC-0018` | `nexo`      | `fogo`, `origo`, `pulso`, `pass`, `aura`, `viso`           | —                          | `REFERENCIA_CANONICA` | FOGO aplica controles por lote; NEXO conserva la especificación maestra y sus vigencias, sin decidir la liberación productiva.            |

##### 8.4. Abastecimiento y compras

| Proceso      | Propietaria | Consumidoras directas | Consumidoras condicionales | Modalidad dominante         | Frontera conservada                                                                                                       |
| ------------ | ----------- | --------------------- | -------------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0019` | `origo`     | `numera`              | `nexo`, `fogo`, `pulso`    | `SOLICITUD_EFECTO_Y_EVENTO` | No constituye todavía una orden de compra ni un movimiento de inventario.                                                 |
| `VPROC-0020` | `origo`     | `numera`, `viso`      | `nexo`, `fogo`             | `SOLICITUD_EFECTO_Y_EVENTO` | No convierte cotización o proveedor seleccionado en compra autorizada.                                                    |
| `VPROC-0021` | `origo`     | `nexo`, `numera`      | `fogo`                     | `SOLICITUD_EFECTO_Y_EVENTO` | No acepta físicamente existencias ni registra el hecho económico definitivo sin las confirmaciones posteriores.           |
| `VPROC-0022` | `origo`     | `nexo`, `numera`      | `fogo`, `pulso`            | `SOLICITUD_EFECTO_Y_EVENTO` | ORIGO acepta o rechaza la recepción comercial; NEXO registra entrada, ubicación y custodia solo después de la aceptación. |

##### 8.5. Inventario, ubicaciones y abastecimiento interno

| Proceso      | Propietaria | Consumidoras directas                      | Consumidoras condicionales | Modalidad dominante         | Frontera conservada                                                                                                                |
| ------------ | ----------- | ------------------------------------------ | -------------------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0023` | `nexo`      | `fogo`, `origo`, `pulso`, `viso`           | —                          | `REFERENCIA_CANONICA`       | No convierte una ubicación lógica en existencia ni gobierna la estructura organizacional.                                          |
| `VPROC-0024` | `nexo`      | `origo`, `fogo`, `pulso`, `numera`         | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | No reemplaza la aceptación comercial de ORIGO ni la producción de FOGO; registra el efecto físico sobre inventario.                |
| `VPROC-0025` | `nexo`      | `fogo`, `pulso`, `origo`, `numera`         | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | La aplicación que consume o produce solicita el efecto; NEXO gobierna cantidades, unidades, origen, destino y movimiento.          |
| `VPROC-0026` | `nexo`      | `numera`, `viso`                           | `fogo`, `pulso`, `origo`   | `SOLICITUD_EFECTO_Y_EVENTO` | El conteo es observación; el ajuste requiere decisión autorizada y no sobrescribe el ledger.                                       |
| `VPROC-0027` | `nexo`      | `fogo`, `pulso`, `origo`, `viso`, `numera` | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | FOGO y VISO pueden originar controles; NEXO gobierna condición de existencia, cuarentena, vencimiento, merma y disposición física. |
| `VPROC-0028` | `nexo`      | `fogo`, `origo`, `pulso`, `numera`         | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | FOGO, ORIGO y PULSO originan necesidades; NEXO gobierna solicitud interna, preparación, custodia, tránsito y recepción.            |

##### 8.6. Activos, vehículos, reutilizables y contenedores

| Proceso      | Propietaria | Consumidoras directas              | Consumidoras condicionales | Modalidad dominante         | Frontera conservada                                                                                                               |
| ------------ | ----------- | ---------------------------------- | -------------------------- | --------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0029` | `nexo`      | `viso`, `numera`, `anima`, `origo` | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | No confunde activo individual, reutilizable, inventario, LPN ni kit.                                                              |
| `VPROC-0030` | `nexo`      | `origo`, `numera`, `viso`          | `anima`                    | `SOLICITUD_EFECTO_Y_EVENTO` | ORIGO puede contratar y NUMERA registrar costos; NEXO conserva activo, orden de mantenimiento, condición y liberación.            |
| `VPROC-0031` | `nexo`      | `viso`, `numera`, `anima`, `origo` | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | La planificación de rutas pertenece al proceso logístico; NEXO conserva vehículo, disponibilidad, uso, combustible e incidencias. |
| `VPROC-0032` | `nexo`      | `fogo`, `pulso`, `numera`          | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | No confunde contenedor físico, LPN, activo individual y stock; conserva custodia y retorno.                                       |

##### 8.7. Producción

| Proceso      | Propietaria | Consumidoras directas                      | Consumidoras condicionales | Modalidad dominante     | Frontera conservada                                                                                                       |
| ------------ | ----------- | ------------------------------------------ | -------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0033` | `fogo`      | `nexo`, `origo`, `pulso`, `numera`, `viso` | —                          | `SEÑAL_EFECTO_Y_EVENTO` | Consume señales de PULSO, NEXO u ORIGO; ninguna señal crea automáticamente un plan aprobado.                              |
| `VPROC-0034` | `fogo`      | `nexo`, `numera`, `pulso`                  | —                          | `SEÑAL_EFECTO_Y_EVENTO` | NEXO publica materiales y recibe terminados; FOGO conserva orden, receta, lote, consumo y ejecución.                      |
| `VPROC-0035` | `fogo`      | `nexo`, `pulso`, `viso`                    | `numera`                   | `SEÑAL_EFECTO_Y_EVENTO` | La disposición de calidad es independiente de la existencia; NEXO solo publica stock cuando recibe un resultado liberado. |
| `VPROC-0036` | `fogo`      | `nexo`, `pulso`, `numera`                  | —                          | `SEÑAL_EFECTO_Y_EVENTO` | NEXO recibe la existencia resultante; FOGO conserva lote, presentación, empaque y etiqueta aprobados.                     |
| `VPROC-0037` | `fogo`      | `nexo`, `numera`, `viso`                   | —                          | `SEÑAL_EFECTO_Y_EVENTO` | NUMERA consume costos y NEXO movimientos; FOGO conserva rendimiento, merma, reproceso y cierre productivo.                |

##### 8.8. Pedidos, ventas, pagos y caja

| Proceso      | Propietaria | Consumidoras directas                     | Consumidoras condicionales | Modalidad dominante         | Frontera conservada                                                                                                                      |
| ------------ | ----------- | ----------------------------------------- | -------------------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0038` | `pulso`     | `fogo`, `nexo`, `numera`, `pass`          | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | NEXO y FOGO participan en disponibilidad y preparación; PULSO conserva pedido, mesa, entrega y liquidación.                              |
| `VPROC-0039` | `pulso`     | `fogo`, `nexo`, `numera`, `pass`          | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | La preparación puede ocurrir en cocina o barra; PULSO conserva el compromiso, su cobro y la entrega al cliente.                          |
| `VPROC-0040` | `pulso`     | `fogo`, `nexo`, `numera`                  | `pass`, `aura`             | `SOLICITUD_EFECTO_Y_EVENTO` | Rappi, Shopify, ManyChat u otro tercero son canales; PULSO valida, deduplica y gobierna el pedido interno.                               |
| `VPROC-0041` | `pulso`     | `aura`, `fogo`, `nexo`, `origo`, `numera` | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | AURA puede originar la oportunidad y FOGO/NEXO ejecutar; PULSO conserva propuesta, pedido, condiciones, entrega y facturación comercial. |
| `VPROC-0042` | `pulso`     | `fogo`, `nexo`, `numera`, `pass`          | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | Cada efecto derivado se ejecuta por contrato en NEXO, NUMERA, PASS u otra propietaria; PULSO conserva la decisión comercial.             |
| `VPROC-0043` | `pulso`     | `numera`, `pass`                          | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | El proveedor de pagos confirma técnicamente y NUMERA consume el hecho económico; PULSO conserva el pago asociado a la venta.             |
| `VPROC-0044` | `pulso`     | `numera`, `viso`                          | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | NUMERA consume el resultado; PULSO conserva apertura, movimientos, arqueo, diferencias y cierre de caja.                                 |

##### 8.9. Clientes, fidelización, reclamos y reservas

| Proceso      | Propietaria | Consumidoras directas             | Consumidoras condicionales | Modalidad dominante         | Frontera conservada                                                                                                                              |
| ------------ | ----------- | --------------------------------- | -------------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0045` | `pass`      | `pulso`, `aura`, `viso`, `numera` | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | PULSO ejecuta acumulación o redención durante la venta mediante contrato; no mantiene saldo ni identidad de fidelización paralelos.              |
| `VPROC-0046` | `pulso`     | `pass`, `numera`, `viso`, `aura`  | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | PASS puede presentar el caso al cliente y NUMERA registrar compensaciones; PULSO conserva reclamo comercial, resolución y efecto sobre la venta. |
| `VPROC-0047` | `pulso`     | `pass`, `aura`                    | `fogo`, `nexo`             | `SOLICITUD_EFECTO_Y_EVENTO` | AURA puede comunicar campañas; PULSO conserva capacidad comprometida, reserva, condiciones y relación con el pedido.                             |

##### 8.10. Transporte y entregas

| Proceso      | Propietaria | Consumidoras directas                      | Consumidoras condicionales | Modalidad dominante         | Frontera conservada                                                                                                              |
| ------------ | ----------- | ------------------------------------------ | -------------------------- | --------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0048` | `nexo`      | `pulso`, `fogo`, `origo`, `viso`, `numera` | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | No crea un pedido de cliente ni decide su entrega comercial; prepara el transporte y la custodia logística.                      |
| `VPROC-0049` | `nexo`      | `pulso`, `fogo`, `origo`, `numera`, `viso` | —                          | `SOLICITUD_EFECTO_Y_EVENTO` | Aplica a rutas internas y transferencias físicas; la entrega de pedido al cliente permanece en PULSO.                            |
| `VPROC-0050` | `pulso`     | `pass`, `numera`, `nexo`                   | `aura`                     | `SOLICITUD_EFECTO_Y_EVENTO` | El tercero ejecuta el recorrido; PULSO conserva pedido, promesa, seguimiento, resultado y conciliación de la entrega al cliente. |

##### 8.11. Finanzas y análisis

| Proceso      | Propietaria | Consumidoras directas                            | Consumidoras condicionales | Modalidad dominante                | Frontera conservada                                                                                                  |
| ------------ | ----------- | ------------------------------------------------ | -------------------------- | ---------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0051` | `numera`    | `viso`, `nexo`, `fogo`, `origo`, `pulso`         | `anima`, `aura`, `pass`    | `EVENTO_CONCILIACION_Y_PROYECCION` | Cada aplicación propietaria emite el hecho; NUMERA lo clasifica y concilia sin crear una versión operativa paralela. |
| `VPROC-0052` | `numera`    | `origo`                                          | `viso`                     | `EVENTO_CONCILIACION_Y_PROYECCION` | ORIGO conserva compra y recepción; NUMERA gobierna obligación, aprobación financiera, pago y conciliación.           |
| `VPROC-0053` | `numera`    | `pulso`                                          | `viso`, `aura`             | `EVENTO_CONCILIACION_Y_PROYECCION` | PULSO u otra propietaria conserva la venta o cuenta origen; NUMERA gobierna cartera, recaudo, aplicación y saldo.    |
| `VPROC-0054` | `numera`    | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `aura` | —                          | `EVENTO_CONCILIACION_Y_PROYECCION` | Los hechos permanecen en sus aplicaciones; NUMERA conserva asignación, cálculo, cierre y análisis económico.         |

##### 8.12. Instalaciones, mercadeo, tecnología y continuidad

| Proceso      | Propietaria | Consumidoras directas                                                        | Consumidoras condicionales | Modalidad dominante            | Frontera conservada                                                                                                                                                           |
| ------------ | ----------- | ---------------------------------------------------------------------------- | -------------------------- | ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0055` | `nexo`      | `viso`, `anima`, `fogo`, `origo`, `pulso`, `numera`                          | —                          | `SOLICITUD_EFECTO_Y_EVENTO`    | Los activos específicos permanecen en NEXO y las obligaciones SST en VISO; este proceso gobierna la condición de la instalación y su cierre.                                  |
| `VPROC-0056` | `aura`      | `pulso`, `pass`, `viso`, `numera`                                            | —                          | `PROYECCION_EVENTO_Y_ANALISIS` | PULSO aplica promociones en la venta y PASS expone beneficios al cliente; AURA conserva intención, pieza, calendario, aprobación y publicación.                               |
| `VPROC-0057` | `aura`      | `pulso`, `pass`, `viso`, `numera`                                            | —                          | `PROYECCION_EVENTO_Y_ANALISIS` | PULSO conserva pedidos y clientes operativos; AURA conserva interacción, oportunidad, etapa de seguimiento y atribución comercial.                                            |
| `VPROC-0058` | `viso`      | `anima`, `shell`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                          | `PROYECCION_Y_EVENTO`          | ANIMA puede reportar y consultar; NEXO aporta el elemento físico. VISO conserva solicitud, incidente, problema, cambio, SLA y cierre.                                         |
| `VPROC-0059` | `viso`      | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                          | `SOLICITUD_HANDOFF_Y_EVENTO`   | SHELL aplica navegación y cada aplicación sus controles; VISO conserva solicitud, aprobación, vigencia y revocación de autoridad laboral.                                     |
| `VPROC-0060` | `viso`      | `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass`          | —                          | `PROYECCION_Y_EVENTO`          | Cada aplicación conserva el hecho respaldado; VISO gobierna clasificación, retención, acceso, legal hold, disposición y caso transversal.                                     |
| `VPROC-0061` | `numera`    | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `aura`, `pass`, `anima`            | —                          | `PROYECCION_Y_ANALISIS`        | Las aplicaciones conservan sus hechos y métricas primarias; NUMERA consolida, interpreta y vincula acciones de mejora sin reescribirlas.                                      |
| `VPROC-0062` | `viso`      | `shell`, `anima`, `nexo`, `fogo`, `origo`, `pulso`, `numera`, `aura`, `pass` | —                          | `PROYECCION_Y_EVENTO`          | Cada aplicación recupera y reconcilia su proceso y datos; VISO gobierna criticidad, plan, incidente empresarial, coordinación y cierre. SHELL solo informa o coordina acceso. |

##### 8.13. Procesos adicionales

| Proceso      | Propietaria | Consumidoras directas                                               | Consumidoras condicionales                                          | Modalidad dominante            | Frontera conservada                                                                                                                                                 |
| ------------ | ----------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0063` | `viso`      | `numera`, `nexo`, `fogo`, `origo`, `pulso`, `aura`, `pass`, `anima` | —                                                                   | `PROYECCION_Y_EVENTO`          | Los riesgos operativos especializados permanecen en sus dominios; VISO conserva el registro empresarial, tratamiento, aceptación y seguimiento.                     |
| `VPROC-0064` | `viso`      | —                                                                   | `numera`, `nexo`, `fogo`, `origo`, `pulso`, `aura`, `pass`, `anima` | `PROYECCION_Y_EVENTO`          | La autoridad o asesor externo no se vuelve propietario; VISO conserva obligación, vencimiento, responsable, entrega y evidencia interna.                            |
| `VPROC-0065` | `viso`      | `anima`, `numera`                                                   | —                                                                   | `SOLICITUD_HANDOFF_Y_EVENTO`   | VISO separa selección previa, objetivos, evaluación y desarrollo; ANIMA solo presenta la experiencia personal autorizada.                                           |
| `VPROC-0066` | `viso`      | `anima`, `nexo`                                                     | `fogo`, `origo`, `pulso`, `shell`                                   | `SOLICITUD_HANDOFF_Y_EVENTO`   | NEXO conserva existencias y movimientos de EPP; VISO gobierna necesidad, asignación a persona, vigencia, devolución y cumplimiento SST.                             |
| `VPROC-0067` | `nexo`      | `fogo`, `pulso`, `origo`, `numera`, `viso`                          | —                                                                   | `SOLICITUD_EFECTO_Y_EVENTO`    | No confunde kit con activo, LPN o stock; NEXO conserva definición, componentes, armado, custodia y completitud.                                                     |
| `VPROC-0068` | `pulso`     | `pass`, `aura`, `viso`, `numera`                                    | —                                                                   | `PROYECCION_EVENTO_Y_ANALISIS` | PASS puede capturar respuesta del cliente y AURA consumir tendencias; PULSO gobierna la medición vinculada al servicio y evita mezclarla con reclamos o incentivos. |
| `VPROC-0069` | `numera`    | `viso`, `nexo`, `fogo`, `origo`, `pulso`, `aura`                    | —                                                                   | `PROYECCION_Y_ANALISIS`        | Los hechos y compromisos provienen de NUMERA y aplicaciones operativas; el presupuesto no crea gasto ni asiento por sí solo.                                        |

---

#### 9. Distribución de consumo por aplicación

| Aplicación | Procesos como propietaria | Consumos directos | Consumos condicionales | Total de procesos consumidos |
| ---------- | ------------------------: | ----------------: | ---------------------: | ---------------------------: |
| `shell`    |                         0 |                10 |                      1 |                           11 |
| `anima`    |                         1 |                21 |                      6 |                           27 |
| `viso`     |                        20 |                28 |                      2 |                           30 |
| `nexo`     |                        16 |                31 |                     10 |                           41 |
| `fogo`     |                         6 |                33 |                     14 |                           47 |
| `origo`    |                         4 |                32 |                     10 |                           42 |
| `pulso`    |                        12 |                36 |                     11 |                           47 |
| `numera`   |                         7 |                47 |                     10 |                           57 |
| `aura`     |                         2 |                19 |                      8 |                           27 |
| `pass`     |                         1 |                21 |                      5 |                           26 |

La cantidad de consumos no representa prioridad, volumen de datos, número de pantallas, permisos ni complejidad técnica. Solo expresa relaciones funcionales declaradas.

---

#### 10. Fronteras interaplicación críticas

##### 10.1. VISO ↔ ANIMA

- VISO gobierna vínculo, programación, novedades, retiro y decisiones administrativas.
- ANIMA presenta información al trabajador, captura hechos personales y origina solicitudes autorizadas.
- ANIMA no mantendrá turnos, novedades o expedientes competidores.

##### 10.2. NEXO ↔ FOGO

- FOGO gobierna receta, plan, orden, lote, ejecución, calidad y cierre productivo.
- NEXO gobierna productos maestros, existencias, ubicaciones, movimientos y custodia.
- Consumo de materiales y publicación de terminados serán efectos correlacionados, no escrituras cruzadas.

##### 10.3. ORIGO ↔ NEXO ↔ NUMERA

- ORIGO gobierna compra y aceptación comercial de recepción.
- NEXO gobierna ingreso, ubicación y custodia física.
- NUMERA gobierna obligación, pago y conciliación económica.
- Ninguna confirmación individual equivale por sí sola a las otras dos.

##### 10.4. PULSO ↔ NEXO ↔ FOGO

- PULSO gobierna pedido, servicio, venta, pago y entrega comercial.
- FOGO ejecuta producción cuando corresponda.
- NEXO confirma disponibilidad, movimiento, custodia o transporte físico.
- El pedido no modificará directamente lotes, stock o ejecución productiva.

##### 10.5. PASS ↔ PULSO ↔ AURA

- PASS gobierna identidad, consentimiento y ledger de fidelización.
- PULSO ejecuta la operación comercial y solicita acumulación o redención.
- AURA gobierna campañas, audiencias y atribución, sin administrar saldo ni venta.

##### 10.6. NUMERA frente a aplicaciones operativas

- NUMERA consume hechos aprobados y devuelve conciliación, costo, presupuesto o análisis.
- No se convierte en fuente de verdad de asistencia, compra, inventario, producción, venta o fidelización.

##### 10.7. SHELL

- SHELL consume estructura, acceso, contexto, disponibilidad y continuidad únicamente donde figura declarado.
- No consume automáticamente el contenido empresarial de todos los procesos por presentarlos en el hub.

---

#### 11. Impacto sobre tareas posteriores

| Tarea                           | Uso del registro                                                                           |
| ------------------------------- | ------------------------------------------------------------------------------------------ |
| `PROC-CAT-007` y `PROC-CAT-008` | Diferenciar actor humano de aplicación consumidora.                                        |
| `PROC-CAT-009` a `PROC-CAT-014` | Definir qué estados o transiciones deben ser visibles o solicitables por cada consumidora. |
| `PROC-CAT-015` y `PROC-CAT-016` | Definir entradas y salidas mínimas por propietaria y consumidora.                          |
| `PROC-CAT-017`                  | Definir eventos empresariales y destinatarios autorizados.                                 |
| `PROC-CAT-018`                  | Definir evidencia y trazabilidad de cada intercambio.                                      |
| `PROC-CAT-020`                  | Resolver duplicidades, variantes y cambios de frontera.                                    |
| BLOQUE X                        | Diseñar contratos interaplicación y adaptadores.                                           |
| BLOQUE E3                       | Materializar relaciones, proyecciones y controles de datos.                                |
| BLOQUE E4                       | Implementar transporte, colas, notificaciones, impresión y evidencia.                      |
| BLOQUE E5                       | Agrupar propietaria y consumidoras en paquetes desplegables y reversibles.                 |

---

#### 12. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                                        | Tipo                                     | Prioridad | Momento de implementación                     | Destino                                       |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- | --------- | --------------------------------------------- | --------------------------------------------- |
| `TREQ-PROC-023` | Cada `VPROC-*` deberá resolver una propietaria y listas válidas, únicas y disjuntas de consumidoras directas y condicionales; la propietaria no podrá aparecer como consumidora.       | contractual + regresión                  | crítica   | materialización del registro y CI             | `SHELL-CI-017`, E3 y registro canónico        |
| `TREQ-PROC-024` | Una consumidora no podrá crear, corregir o cerrar una copia mutable del resultado propietario ni escribir directamente su estado privado.                                              | integración + seguridad + E2E            | crítica   | contrato e implementación de cada intercambio | BLOQUE X, E3 y paquetes E5                    |
| `TREQ-PROC-025` | Toda lectura, comando, evento, exportación, job o suscripción interaplicación deberá corresponder a una consumidora declarada y limitarse a su finalidad, alcance y proyección mínima. | contractual + autorización + integración | crítica   | CI y paquete que introduzca consumo           | `SHELL-CI-017`, AUTH, BLOQUE X y E5           |
| `TREQ-PROC-026` | Una aplicación diferida declarada como consumidora no podrá habilitar proceso, pantalla o integración antes de superar cobertura, readiness, despliegue y pruebas.                     | interfaz + regresión negativa            | alta      | navegación y readiness                        | `PROC-COVER-007`, `READY-GATE-005` y BLOQUE I |
| `TREQ-PROC-027` | Incorporar, cambiar o retirar una consumidora deberá preservar compatibilidad, historial, eventos pendientes, cachés, colas y rollback, sin dejar consumidores huérfanos.              | migración + integración + regresión      | crítica   | evolución del contrato o retiro               | `PROC-CAT-020`, BLOQUE X, E3/R y paquetes E5  |

Los detalles completos de estos requisitos deberán incorporarse al Registro Canónico de Requisitos de Prueba mediante la versión completa regenerada entregada junto con esta propuesta.

---

#### 13. Criterios de aceptación

- [ ] `PROC-CAT-001` a `PROC-CAT-005` figuran aprobadas.
- [ ] Existen exactamente 69 filas `VPROC-*`.
- [ ] Cada fila conserva la propietaria aprobada en `PROC-CAT-005`.
- [ ] Todas las consumidoras pertenecen al catálogo permitido.
- [ ] La propietaria no aparece en sus listas de consumidoras.
- [ ] No existen consumidoras repetidas ni simultáneamente directas y condicionales.
- [ ] Las listas diferencian consumo directo y condicional.
- [ ] Las fronteras de propiedad permanecen intactas.
- [ ] SHELL solo aparece donde consume contexto, acceso, disponibilidad o continuidad.
- [ ] Los sistemas externos y servicios transversales no aparecen como aplicaciones consumidoras.
- [ ] Las aplicaciones diferidas no se presentan como operativas.
- [ ] Se generaron y registraron `TREQ-PROC-023` a `TREQ-PROC-027`.
- [ ] No se definieron todavía actores, estados, entradas, salidas, eventos técnicos, tablas, endpoints o pantallas.
- [ ] `PROC-CAT-007` permanece reservada y no iniciada.
- [ ] No se realizaron cambios de código, migraciones ni Supabase.

---

#### 14. Decisión solicitada

Aprobar `PROC-APPLICATION-CONSUMER-REGISTRY-001` como registro canónico de aplicaciones consumidoras para `VPROC-0001` a `VPROC-0069`.

La aprobación habilitará exclusivamente el inicio de:

`PROC-CAT-007 — Definir actor iniciador de cada proceso`

No habilita implementación, navegación, integración, migración, cambios en Supabase ni avance automático a tareas posteriores.


### ✅ PROC-CAT-007 — Definir actor que inicia cada proceso

**Estado:** APROBADA
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Dependencias obligatorias:** `E1-GATE-001` — APROBADA; `PROC-CAT-001` a `PROC-CAT-006` — APROBADAS  
**Línea base recibida:** `PROC-CANONICAL-ID-REGISTRY-001`, `PROC-BUSINESS-PURPOSE-REGISTRY-001`, `PROC-APPLICATION-OWNERSHIP-REGISTRY-001` y `PROC-APPLICATION-CONSUMER-REGISTRY-001`  
**Naturaleza:** decisión funcional sobre origen e inicio de procesos, sin implementación  
**Artefacto producido:** `PROC-PROCESS-INITIATOR-REGISTRY-001`  
**Procesos cubiertos:** **69**  
**Rango cubierto:** `VPROC-0001` a `VPROC-0069`  
**Cambios en código, migraciones o Supabase:** no autorizados  
**Siguiente tarea reservada:** `PROC-CAT-008 — Definir actores que continúan cada proceso`

---

#### 1. Propósito

Definir quién o qué puede originar válidamente cada proceso canónico y qué condición mínima permite crear una instancia, sin confundir inicio con ejecución, aprobación, supervisión, corrección, propiedad o autorización técnica.

```text
NECESIDAD, HECHO, SOLICITUD, ALERTA O EVENTO
        ↓
ACTOR INICIADOR IDENTIFICABLE
        ↓
CONDICIÓN CANÓNICA DE INICIO
        ↓
INSTANCIA VPROC-* CREADA POR LA APLICACIÓN PROPIETARIA
```

El iniciador puede ser una función interna, una persona externa, una autoridad, una plataforma, un evento de otro proceso, una regla programada o una alerta. La responsabilidad empresarial permanece en la aplicación propietaria y en los actores que se definan después.

---

#### 2. Resultado obligatorio

La tarea produce `PROC-PROCESS-INITIATOR-REGISTRY-001`, que deberá:

1. cubrir exactamente `VPROC-0001` a `VPROC-0069`;
2. conservar propósito, propietaria y consumidoras ya aprobados;
3. declarar un iniciador primario para cada proceso;
4. declarar alternativas únicamente cuando exista una vía legítima diferente de origen;
5. clasificar el inicio como humano interno, humano externo, evento interno, evento externo, programado, alerta o mixto;
6. definir la condición mínima que habilita crear una instancia;
7. definir cómo la aplicación propietaria formaliza el inicio sin transferir propiedad al iniciador;
8. impedir que iniciar implique automáticamente ejecutar, aprobar, corregir, cerrar o acceder;
9. conservar identidad, contexto, territorio, canal y correlación cuando el inicio sea externo o automático;
10. servir como entrada para `PROC-CAT-008` a `PROC-CAT-018`, autorización, UX, contratos E3/E4 y paquetes E5.

---

#### 3. Definiciones normativas

| Concepto                     | Definición                                                                                                                      |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| iniciador primario           | Función, tercero o mecanismo que normalmente origina la necesidad o hecho que hace comenzar el proceso.                         |
| iniciador alterno            | Origen válido bajo una variante explícita; no es una lista abierta de cualquier actor relacionado.                              |
| actor de registro            | Identidad humana o técnica que materializa el inicio en la aplicación propietaria cuando el originador no escribe directamente. |
| condición canónica de inicio | Hecho mínimo verificable que debe existir antes de crear una instancia del proceso.                                             |
| inicio automático            | Creación solicitada por evento, programación o alerta; no elimina responsabilidad humana ni controles posteriores.              |
| formalización                | Conversión del origen en una instancia trazable, deduplicada y vinculada al `VPROC-*` correcto.                                 |

El iniciador no equivale a:

- aplicación propietaria;
- ejecutor o continuador;
- supervisor o aprobador;
- titular del permiso;
- usuario autenticado del dispositivo;
- persona nombrada individualmente;
- sistema externo con autoridad sobre el proceso interno.

---

#### 4. Tipos permitidos de inicio

| Tipo             | Uso                                                                         |
| ---------------- | --------------------------------------------------------------------------- |
| `HUMANO_INTERNO` | Una función laboral interna origina la necesidad.                           |
| `HUMANO_EXTERNO` | Cliente, candidato, empresa u otra persona externa origina la solicitud.    |
| `EVENTO_INTERNO` | Un hecho canónico de otro proceso inicia la instancia.                      |
| `EVENTO_EXTERNO` | Un proveedor, plataforma, autoridad o adaptador entrega un hecho iniciador. |
| `PROGRAMADO`     | Una regla de tiempo o calendario genera el inicio.                          |
| `ALERTA`         | Un umbral, sensor, desviación o condición detectada genera el inicio.       |
| `MIXTO`          | Existen dos o más vías legítimas de clases diferentes, todas declaradas.    |

---

#### 5. Catálogo de funciones y mecanismos iniciadores

**Dirección y gobierno**

`GOBIERNO_Y_PROPIEDAD`, `GERENCIA_GENERAL`, `GERENCIA_O_SUPERVISION_DE_SEDE`, `COORDINACION_DE_OPERACIONES`, `RESPONSABLE_DE_RIESGO_EMPRESARIAL`, `RESPONSABLE_DE_CONTINUIDAD`.

**Personas y operación**

`RESPONSABLE_DE_PERSONAS`, `TRABAJADOR`, `AREA_SOLICITANTE`, `BODEGA_Y_ABASTECIMIENTO`, `RECEPCION_EN_SEDE`, `LOGISTICA_Y_TRANSPORTE`, `CUSTODIO_O_USUARIO_DE_ACTIVO`, `RESPONSABLE_DE_INSTALACIONES`.

**Especialistas internos**

`RESPONSABLE_SST_Y_CUMPLIMIENTO`, `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`, `RESPONSABLE_DE_CATALOGO`, `RESPONSABLE_PRODUCTIVO`, `RESPONSABLE_COMERCIAL`, `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`, `RESPONSABLE_DE_COMPRAS`, `RESPONSABLE_FINANCIERO`, `RESPONSABLE_DE_MARCA`, `RESPONSABLE_TECNOLOGICO`, `CUSTODIO_DOCUMENTAL`, `RESPONSABLE_ANALITICO`, `CAJA_MOSTRADOR_O_SERVICIO`, `SERVICIO_DE_SALON`, `ACTOR_PRODUCTOR_DEL_HECHO_O_EVIDENCIA`.

**Actores externos**

`CANDIDATO`, `CLIENTE`, `PROSPECTO_O_CLIENTE`, `EMPRESA_CLIENTE`, `PROVEEDOR`, `TECNICO_O_PRESTADOR_EXTERNO`, `ASESOR_O_AUTORIDAD`, `PLATAFORMA_O_CANAL_EXTERNO`.

**Iniciadores no humanos**

`EVENTO_CANONICO_DE_PROCESO`, `EVENTO_EXTERNO_DE_ENTREGA`, `SISTEMA_DE_ORIGEN`, `REGLA_PROGRAMADA`, `UMBRAL_O_ALERTA`.

Los valores describen funciones y orígenes. No crean cargos, permisos, cuentas, roles operativos ni identidades permanentes. La correspondencia con roles y autorización se resolverá en las tareas contractuales y de implementación correspondientes.

---

#### 6. Reglas canónicas de inicio

1. Cada proceso tendrá exactamente un iniciador primario y cero o más iniciadores alternos explícitos.
2. Una persona concreta podrá actuar únicamente mediante una función válida y una identidad verificable.
3. La aplicación propietaria materializará la instancia; el iniciador externo o automático no escribirá directamente su estado privado.
4. Iniciar no concede permiso para ejecutar, aprobar, corregir, cancelar, revertir ni cerrar.
5. Todo inicio deberá conservar `process_id`, actor u origen, fecha, canal, sede o territorio aplicable, correlación e idempotency key cuando corresponda.
6. Un mensaje, archivo, llamada, correo o conversación podrá ser evidencia del origen, pero no será la instancia canónica.
7. Un evento interno deberá referenciar el proceso y recurso de origen; no se admitirán inferencias por texto o nombres aproximados.
8. Un evento externo deberá ingresar por adaptador autenticado, validado, deduplicado y auditable.
9. Una regla programada deberá declarar zona horaria, calendario, versión, alcance y comportamiento ante reintento o ejecución tardía.
10. Una alerta deberá conservar fuente, lectura o condición, umbral, calidad y momento; no podrá ejecutar por sí sola una decisión sensible.
11. Cuando el iniciador sea cliente, candidato, proveedor, técnico, autoridad o plataforma, la aplicación propietaria conservará la responsabilidad interna y el actor de registro o adaptador.
12. Una solicitud incompleta podrá quedar como borrador o rechazada, pero no avanzar como instancia válida sin la condición mínima.
13. Los procesos diferidos podrán tener iniciador objetivo definido sin habilitar pantallas, rutas ni integraciones.
14. `PROC-CAT-008` definirá quién continúa el proceso; esta tarea no asigna ejecutores, supervisores ni aprobadores.

---

#### 7. Criterio de lectura del registro

```text
INICIADOR PRIMARIO
→ origen ordinario del proceso

INICIADOR ALTERNO
→ origen válido bajo una variante declarada

CONDICIÓN MÍNIMA
→ requisito para crear una instancia

FORMALIZACIÓN
→ forma en que la propietaria conserva identidad, límite y trazabilidad
```

---

#### 8. Registro canónico de iniciadores

##### 8.1. Gobierno y estructura

| Proceso      | Propietaria | Nombre objetivo                                                                                                   | Iniciador primario            | Iniciadores alternos                                                               | Tipo             | Condición canónica de inicio                                                                                                              | Regla de formalización                                                                                                              |
| ------------ | ----------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------- | ---------------------------------------------------------------------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | `viso`      | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                   | `GOBIERNO_Y_PROPIEDAD`        | `GERENCIA_GENERAL`                                                                 | `HUMANO_INTERNO` | Existe una decisión empresarial material que requiere autoridad, alcance, responsable o seguimiento.                                      | VISO abre el registro con el actor real, la autoridad invocada y el asunto; una reunión o mensaje no basta como instancia canónica. |
| `VPROC-0002` | `viso`      | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas | `GERENCIA_GENERAL`            | `GOBIERNO_Y_PROPIEDAD`; `ASESOR_O_AUTORIDAD`                                       | `MIXTO`          | Existe una creación, cambio, cierre o regularización aprobada de una entidad, marca, establecimiento, sede, área o relación organizativa. | VISO formaliza la solicitud y conserva el documento o decisión fuente; el tercero no modifica directamente la estructura interna.   |
| `VPROC-0003` | `viso`      | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes             | `GOBIERNO_Y_PROPIEDAD`        | `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`                            | `HUMANO_INTERNO` | Existe una necesidad de crear, revisar, delegar, limitar, sustituir o retirar una política o responsabilidad.                             | VISO registra propuesta, alcance y autoridad; iniciar revisión no equivale a aprobar ni publicar la política.                       |
| `VPROC-0004` | `viso`      | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                   | `COORDINACION_DE_OPERACIONES` | `GERENCIA_GENERAL`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `EVENTO_CANONICO_DE_PROCESO` | `MIXTO`          | Existe un compromiso o transferencia entre unidades que no puede cerrarse dentro de un único proceso propietario.                         | VISO crea el compromiso correlacionado con el proceso de origen, sin apropiarse de su ejecución.                                    |

##### 8.2. Personas y trabajo

| Proceso      | Propietaria | Nombre objetivo                                                                                    | Iniciador primario               | Iniciadores alternos                                           | Tipo             | Condición canónica de inicio                                                                                       | Regla de formalización                                                                                                        |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------- | -------------------------------- | -------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0005` | `viso`      | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `GERENCIA_O_SUPERVISION_DE_SEDE` | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`; `CANDIDATO` | `MIXTO`          | Existe una necesidad de dotación autorizada o una candidatura admitida a un banco de talento vigente.              | VISO distingue necesidad, vacante y candidatura; el canal de postulación no crea vínculo ni obliga a contratar.               |
| `VPROC-0006` | `viso`      | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona | `RESPONSABLE_DE_PERSONAS`        | `GERENCIA_GENERAL`; `EVENTO_CANONICO_DE_PROCESO`               | `MIXTO`          | Existe una decisión de vinculación aprobada y una identidad candidata validada para iniciar el expediente laboral. | VISO recibe un traspaso correlacionado desde TALENTO o una decisión autorizada; no acepta altas por datos libres del cliente. |
| `VPROC-0007` | `viso`      | Administrar asignaciones laborales y programación publicada con historial y revisión controlada    | `GERENCIA_O_SUPERVISION_DE_SEDE` | `COORDINACION_DE_OPERACIONES`; `GERENCIA_GENERAL`              | `HUMANO_INTERNO` | Existe una necesidad válida de asignar o modificar sede, área, función o programación de una persona vinculada.    | VISO abre una propuesta de asignación o turno; el cambio solo entra en vigor mediante publicación o aprobación posterior.     |
| `VPROC-0008` | `anima`     | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables             | `TRABAJADOR`                     | `SISTEMA_DE_ORIGEN`                                            | `MIXTO`          | El trabajador ejecuta una marcación válida o un sistema autorizado captura un hecho de asistencia verificable.     | ANIMA conserva actor, dispositivo, sede, tiempo y evento idempotente; una corrección no reemplaza el hecho original.          |
| `VPROC-0009` | `viso`      | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos               | `TRABAJADOR`                     | `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_PERSONAS`    | `HUMANO_INTERNO` | Existe una novedad, ausencia, permiso, incapacidad, cambio o necesidad de reemplazo identificable.                 | VISO crea un caso vinculado a la persona y periodo; el reporte no modifica por sí mismo turnos, pagos ni permisos.            |
| `VPROC-0010` | `numera`    | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                     | `REGLA_PROGRAMADA`               | `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_PERSONAS`            | `PROGRAMADO`     | Se alcanza el corte de liquidación o se autoriza una liquidación extraordinaria con población y periodo definidos. | NUMERA genera un paquete correlacionado con vínculos, asistencia y novedades; el inicio no ejecuta el pago bancario.          |
| `VPROC-0011` | `viso`      | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                    | `RESPONSABLE_DE_PERSONAS`        | `GERENCIA_GENERAL`; `TRABAJADOR`                               | `HUMANO_INTERNO` | Existe renuncia, terminación, cancelación, suspensión definitiva o decisión autorizada de retiro.                  | VISO abre un caso de cierre con fecha efectiva y causa; una comunicación informal no revoca accesos ni cierra obligaciones.   |

##### 8.3. Seguridad, higiene y cumplimiento

| Proceso      | Propietaria | Nombre objetivo                                                                               | Iniciador primario               | Iniciadores alternos                                                                                     | Tipo    | Condición canónica de inicio                                                                                            | Regla de formalización                                                                                                      |
| ------------ | ----------- | --------------------------------------------------------------------------------------------- | -------------------------------- | -------------------------------------------------------------------------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0012` | `viso`      | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                 | `RESPONSABLE_SST_Y_CUMPLIMIENTO` | `TRABAJADOR`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`                                        | `MIXTO` | Existe una inspección planificada, reporte de peligro, cambio de condición o alerta que requiere evaluación preventiva. | VISO registra riesgo o inspección con lugar, fuente y alcance; la alerta no implica aceptación del riesgo.                  |
| `VPROC-0013` | `viso`      | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior | `TRABAJADOR`                     | `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`; `TECNICO_O_PRESTADOR_EXTERNO`                       | `MIXTO` | Ocurre o se reporta un accidente, incidente, emergencia o condición de respuesta inmediata.                             | VISO abre el expediente después de activar la respuesta; el registro no debe retrasar atención ni notificación obligatoria. |
| `VPROC-0014` | `viso`      | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados   | `REGLA_PROGRAMADA`               | `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | `MIXTO` | Vence o se programa un control obligatorio, o se detecta una condición que exige verificación de higiene o inocuidad.   | VISO formaliza el control aplicable y su versión; la ejecución operativa posterior pertenece al actor correspondiente.      |

##### 8.4. Productos, recetas y conocimiento

| Proceso      | Propietaria | Nombre objetivo                                                                         | Iniciador primario                   | Iniciadores alternos                                                                | Tipo             | Condición canónica de inicio                                                                                              | Regla de formalización                                                                                                      |
| ------------ | ----------- | --------------------------------------------------------------------------------------- | ------------------------------------ | ----------------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0015` | `nexo`      | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias        | `RESPONSABLE_DE_CATALOGO`            | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_COMPRAS`         | `HUMANO_INTERNO` | Existe una solicitud justificada de crear, modificar, retirar o relacionar producto, presentación, unidad o equivalencia. | NEXO crea una propuesta de maestro; la solicitud no publica el producto ni altera referencias históricas.                   |
| `VPROC-0016` | `fogo`      | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas              | `RESPONSABLE_PRODUCTIVO`             | `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_DE_CATALOGO`; `GERENCIA_GENERAL` | `HUMANO_INTERNO` | Existe una necesidad aprobable de desarrollar, ajustar, validar o retirar una formulación.                                | FOGO abre una versión de trabajo vinculada a productos canónicos; iniciar desarrollo no autoriza producción ni publicación. |
| `VPROC-0017` | `pulso`     | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales | `RESPONSABLE_COMERCIAL`              | `RESPONSABLE_DE_MARCA`; `EVENTO_CANONICO_DE_PROCESO`; `GERENCIA_GENERAL`            | `MIXTO`          | Existe una propuesta de alta, cambio, suspensión o retiro de oferta en un canal, marca o sede.                            | PULSO registra la propuesta y consume disponibilidad o campañas como señales; ninguna señal publica por sí sola.            |
| `VPROC-0018` | `nexo`      | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto | `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_PRODUCTIVO`; `ASESOR_O_AUTORIDAD`           | `MIXTO`          | Existe un requisito, hallazgo o cambio que afecta composición, alérgenos, restricción, calidad o especificación.          | NEXO abre una versión de especificación con fuente y vigencia; el tercero aporta evidencia sin gobernar el maestro interno. |

##### 8.5. Abastecimiento y compras

| Proceso      | Propietaria | Nombre objetivo                                                                                                    | Iniciador primario       | Iniciadores alternos                                                                                     | Tipo             | Condición canónica de inicio                                                                                | Regla de formalización                                                                                                                |
| ------------ | ----------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------ | -------------------------------------------------------------------------------------------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0019` | `origo`     | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                   | `AREA_SOLICITANTE`       | `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_PRODUCTIVO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA` | `MIXTO`          | Existe una necesidad de abastecimiento no cubierta por disponibilidad interna o una política de reposición. | ORIGO registra la necesidad con justificación, cantidad, fecha y alcance; no crea todavía orden ni compromiso con proveedor.          |
| `VPROC-0020` | `origo`     | Comparar proveedores y condiciones con evidencia suficiente para decidir                                           | `RESPONSABLE_DE_COMPRAS` | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`                                                        | `HUMANO_INTERNO` | Existe una necesidad de compra admitida que requiere búsqueda, comparación o negociación.                   | ORIGO abre la evaluación vinculada a la necesidad; una cotización recibida no selecciona ni aprueba automáticamente.                  |
| `VPROC-0021` | `origo`     | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                           | `RESPONSABLE_DE_COMPRAS` | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`                                                        | `HUMANO_INTERNO` | Existe una recomendación de compra completa para someter a aprobación o emisión según el flujo aplicable.   | ORIGO inicia la decisión con evidencia y clasificación ordinaria, urgente o excepcional; iniciar no equivale a aprobar.               |
| `VPROC-0022` | `origo`     | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `RECEPCION_EN_SEDE`      | `PROVEEDOR`; `EVENTO_EXTERNO_DE_ENTREGA`                                                                 | `MIXTO`          | Una entrega física o documental asociable a una compra llega al punto autorizado de recepción.              | ORIGO abre la recepción contra una orden o excepción válida y registra al receptor; el proveedor no acepta la recepción por sí mismo. |

##### 8.6. Inventario, ubicaciones y abastecimiento interno

| Proceso      | Propietaria | Nombre objetivo                                                                                | Iniciador primario        | Iniciadores alternos                                                                                       | Tipo             | Condición canónica de inicio                                                                                        | Regla de formalización                                                                                                          |
| ------------ | ----------- | ---------------------------------------------------------------------------------------------- | ------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0023` | `nexo`      | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                         | `BODEGA_Y_ABASTECIMIENTO` | `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_DE_INSTALACIONES`                                              | `HUMANO_INTERNO` | Existe una necesidad aprobable de crear, modificar, bloquear o retirar una ubicación o condición de almacenamiento. | NEXO crea una propuesta de estructura física; el cambio no mueve existencias ni altera la estructura organizacional.            |
| `VPROC-0024` | `nexo`      | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                | `RECEPCION_EN_SEDE`       | `BODEGA_Y_ABASTECIMIENTO`; `EVENTO_CANONICO_DE_PROCESO`; `LOGISTICA_Y_TRANSPORTE`                          | `MIXTO`          | Existe una entrada aceptada, producción liberada, devolución o traslado que requiere ingreso o ubicación física.    | NEXO inicia un movimiento correlacionado con el hecho origen; no admite ingreso sin referencia o causa autorizada.              |
| `VPROC-0025` | `nexo`      | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino     | `AREA_SOLICITANTE`        | `RESPONSABLE_PRODUCTIVO`; `CAJA_MOSTRADOR_O_SERVICIO`; `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE` | `HUMANO_INTERNO` | Existe una necesidad válida de retirar, consumir, transferir o trasladar una cantidad identificable.                | NEXO crea la intención de movimiento con origen, destino y unidad; el inicio no descuenta hasta validar existencia y autoridad. |
| `VPROC-0026` | `nexo`      | Contar como observación, investigar diferencias y ajustar mediante decisión separada           | `REGLA_PROGRAMADA`        | `BODEGA_Y_ABASTECIMIENTO`; `COORDINACION_DE_OPERACIONES`; `UMBRAL_O_ALERTA`                                | `MIXTO`          | Se cumple un calendario de conteo o existe una discrepancia, incidente o necesidad de verificación extraordinaria.  | NEXO abre una sesión de conteo con alcance congelado; el inicio no modifica el saldo ni autoriza ajustes.                       |
| `VPROC-0027` | `nexo`      | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición               | `UMBRAL_O_ALERTA`         | `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `TRABAJADOR`                              | `ALERTA`         | Se detecta vencimiento próximo, excursión, daño, pérdida, merma, condición anómala o necesidad de disposición.      | NEXO abre un caso sobre existencia identificada; la alerta no libera, rechaza ni dispone automáticamente.                       |
| `VPROC-0028` | `nexo`      | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | `AREA_SOLICITANTE`        | `UMBRAL_O_ALERTA`; `RESPONSABLE_PRODUCTIVO`; `CAJA_MOSTRADOR_O_SERVICIO`; `GERENCIA_O_SUPERVISION_DE_SEDE` | `MIXTO`          | Existe una necesidad interna de abastecimiento con producto, cantidad, destino y fecha requeridos.                  | NEXO crea una solicitud interna; no reserva, prepara ni despacha hasta validar políticas y disponibilidad.                      |

##### 8.7. Activos, vehículos, reutilizables y contenedores

| Proceso      | Propietaria | Nombre objetivo                                                                             | Iniciador primario             | Iniciadores alternos                                                                                 | Tipo             | Condición canónica de inicio                                                                                        | Regla de formalización                                                                                                          |
| ------------ | ----------- | ------------------------------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0029` | `nexo`      | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos               | `CUSTODIO_O_USUARIO_DE_ACTIVO` | `COORDINACION_DE_OPERACIONES`; `RECEPCION_EN_SEDE`; `RESPONSABLE_DE_INSTALACIONES`                   | `HUMANO_INTERNO` | Existe un alta, asignación, préstamo, transferencia, devolución, pérdida o cambio de custodia de un activo.         | NEXO abre el evento sobre una identidad de activo existente o una propuesta de alta; iniciar no cambia custodia sin aceptación. |
| `VPROC-0030` | `nexo`      | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos            | `CUSTODIO_O_USUARIO_DE_ACTIVO` | `REGLA_PROGRAMADA`; `UMBRAL_O_ALERTA`; `TECNICO_O_PRESTADOR_EXTERNO`; `RESPONSABLE_DE_INSTALACIONES` | `MIXTO`          | Existe una falla, vencimiento preventivo, inspección, garantía, necesidad de reparación o propuesta de disposición. | NEXO crea una solicitud u orden vinculada al activo; el tercero no modifica condición ni libera el activo directamente.         |
| `VPROC-0031` | `nexo`      | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias               | `LOGISTICA_Y_TRANSPORTE`       | `REGLA_PROGRAMADA`; `UMBRAL_O_ALERTA`; `CUSTODIO_O_USUARIO_DE_ACTIVO`                                | `MIXTO`          | Existe una asignación de uso, inspección, carga de combustible, lectura, mantenimiento o incidencia del vehículo.   | NEXO inicia el expediente operativo del vehículo con actor y lectura; el evento no declara disponibilidad sin validación.       |
| `VPROC-0032` | `nexo`      | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores | `AREA_SOLICITANTE`             | `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE`; `CUSTODIO_O_USUARIO_DE_ACTIVO`                  | `HUMANO_INTERNO` | Existe una necesidad de entregar, trasladar, recuperar, contar o sustituir reutilizables o contenedores.            | NEXO crea una obligación de tenencia o retorno con cantidades e identidad; no mezcla el objeto con stock o LPN.                 |

##### 8.8. Producción

| Proceso      | Propietaria | Nombre objetivo                                                                      | Iniciador primario                   | Iniciadores alternos                                                              | Tipo    | Condición canónica de inicio                                                                                           | Regla de formalización                                                                                                            |
| ------------ | ----------- | ------------------------------------------------------------------------------------ | ------------------------------------ | --------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0033` | `fogo`      | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida | `RESPONSABLE_PRODUCTIVO`             | `EVENTO_CANONICO_DE_PROCESO`; `UMBRAL_O_ALERTA`; `GERENCIA_O_SUPERVISION_DE_SEDE` | `MIXTO` | Existe demanda, nivel de inventario, compromiso o prioridad que requiere evaluar un plan productivo.                   | FOGO abre una propuesta de plan con horizonte y señales; ninguna señal crea automáticamente producción aprobada.                  |
| `VPROC-0034` | `fogo`      | Preparar materiales y ejecutar producción contra una versión aprobada                | `RESPONSABLE_PRODUCTIVO`             | `EVENTO_CANONICO_DE_PROCESO`; `GERENCIA_O_SUPERVISION_DE_SEDE`                    | `MIXTO` | Existe una orden o plan publicado, receta vigente y contexto de ejecución habilitado.                                  | FOGO inicia la ejecución con lote, versión y actor; el inicio no consume ni produce inventario sin transacciones correlacionadas. |
| `VPROC-0035` | `fogo`      | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto       | `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | `EVENTO_CANONICO_DE_PROCESO`; `RESPONSABLE_PRODUCTIVO`                            | `MIXTO` | Existe un lote o resultado que alcanzó el punto de control y requiere disposición de calidad.                          | FOGO abre la evaluación independiente; terminar producción no equivale a liberar producto.                                        |
| `VPROC-0036` | `fogo`      | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada        | `RESPONSABLE_PRODUCTIVO`             | `EVENTO_CANONICO_DE_PROCESO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                | `MIXTO` | Existe producto liberado o autorizado para empaque, etiquetado y almacenamiento bajo una presentación vigente.         | FOGO crea la ejecución de empaque vinculada al lote; una reimpresión no crea lote ni presentación nuevos.                         |
| `VPROC-0037` | `fogo`      | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo         | `RESPONSABLE_PRODUCTIVO`             | `EVENTO_CANONICO_DE_PROCESO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                | `MIXTO` | La ejecución productiva alcanzó un punto de cierre, desviación, aprovechamiento o reproceso que requiere conciliación. | FOGO abre el cierre sobre el lote original; no sobrescribe consumos, rendimiento ni decisiones de calidad.                        |

##### 8.9. Pedidos, ventas, pagos y caja

| Proceso      | Propietaria | Nombre objetivo                                                                                        | Iniciador primario           | Iniciadores alternos                                                                        | Tipo    | Condición canónica de inicio                                                                                        | Regla de formalización                                                                                                             |
| ------------ | ----------- | ------------------------------------------------------------------------------------------------------ | ---------------------------- | ------------------------------------------------------------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0038` | `pulso`     | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación  | `CLIENTE`                    | `SERVICIO_DE_SALON`; `CAJA_MOSTRADOR_O_SERVICIO`                                            | `MIXTO` | Existe una solicitud de atención en mesa aceptada para una sede y servicio disponibles.                             | PULSO formaliza la instancia al abrir mesa o pedido con actor de registro; la presencia del cliente sin aceptación no crea pedido. |
| `VPROC-0039` | `pulso`     | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                         | `CLIENTE`                    | `CAJA_MOSTRADOR_O_SERVICIO`                                                                 | `MIXTO` | Existe una solicitud de compra de mostrador o para llevar aceptada por el punto de venta.                           | PULSO crea un pedido correlacionado con canal y vendedor; una consulta de precio no inicia una venta.                              |
| `VPROC-0040` | `pulso`     | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación           | `PLATAFORMA_O_CANAL_EXTERNO` | `PROSPECTO_O_CLIENTE`; `RESPONSABLE_COMERCIAL`                                              | `MIXTO` | Se recibe un pedido externo autenticado, deduplicable y mapeable a una oferta vigente.                              | PULSO valida y crea una instancia interna mediante adaptador; el mensaje externo no escribe estados internos.                      |
| `VPROC-0041` | `pulso`     | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B | `EMPRESA_CLIENTE`            | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`                                             | `MIXTO` | Existe una solicitud B2B o de catering con contraparte identificable y alcance suficiente para evaluación.          | PULSO abre una oportunidad o cotización; iniciar no reserva capacidad, aprueba precio ni crea pedido definitivo.                   |
| `VPROC-0042` | `pulso`     | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos     | `CLIENTE`                    | `CAJA_MOSTRADOR_O_SERVICIO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `EVENTO_CANONICO_DE_PROCESO` | `MIXTO` | Existe una solicitud o causa válida para modificar, sustituir, cancelar, anular o devolver un compromiso comercial. | PULSO crea un caso sobre el pedido o venta original; no aplica efectos antes de clasificar la acción y su autoridad.               |
| `VPROC-0043` | `pulso`     | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                           | `CAJA_MOSTRADOR_O_SERVICIO`  | `CLIENTE`; `PLATAFORMA_O_CANAL_EXTERNO`; `EVENTO_CANONICO_DE_PROCESO`                       | `MIXTO` | Existe una obligación comercial cobrable y un intento de pago con medio y valor identificables.                     | PULSO crea la intención de pago y correlación externa; un intento no se considera pagado hasta confirmación válida.                |
| `VPROC-0044` | `pulso`     | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                            | `CAJA_MOSTRADOR_O_SERVICIO`  | `REGLA_PROGRAMADA`; `GERENCIA_O_SUPERVISION_DE_SEDE`                                        | `MIXTO` | Finaliza una jornada, turno o periodo de caja, o se ordena un cierre extraordinario controlado.                     | PULSO abre el cierre con alcance bloqueado; el inicio no acepta diferencias ni cierra financieramente por sí mismo.                |

##### 8.10. Clientes, fidelización, reclamos y reservas

| Proceso      | Propietaria | Nombre objetivo                                                                             | Iniciador primario | Iniciadores alternos                                                                                | Tipo    | Condición canónica de inicio                                                                                        | Regla de formalización                                                                                               |
| ------------ | ----------- | ------------------------------------------------------------------------------------------- | ------------------ | --------------------------------------------------------------------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0045` | `pass`      | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados | `CLIENTE`          | `EVENTO_CANONICO_DE_PROCESO`; `CAJA_MOSTRADOR_O_SERVICIO`                                           | `MIXTO` | Existe una solicitud de identificación, consentimiento, acumulación, redención o ajuste autorizado de fidelización. | PASS crea o referencia la identidad y el ledger; una venta solo propone el movimiento y no mantiene saldo paralelo.  |
| `VPROC-0046` | `pulso`     | Gestionar reclamo, devolución, compensación y aprendizaje de causa                          | `CLIENTE`          | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `PLATAFORMA_O_CANAL_EXTERNO`; `GERENCIA_O_SUPERVISION_DE_SEDE` | `MIXTO` | Existe una inconformidad, devolución, solicitud de compensación o evidencia de falla de servicio.                   | PULSO abre un caso vinculado a cliente, pedido o venta cuando exista; el reporte no concede compensación automática. |
| `VPROC-0047` | `pulso`     | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento      | `CLIENTE`          | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`; `PLATAFORMA_O_CANAL_EXTERNO`                       | `MIXTO` | Existe una solicitud de reserva, evento o contacto consentido con fecha, capacidad o finalidad identificables.      | PULSO crea una solicitud; iniciar no compromete cupo ni habilita comunicaciones sin validación y consentimiento.     |

##### 8.11. Transporte y entregas

| Proceso      | Propietaria | Nombre objetivo                                                                     | Iniciador primario           | Iniciadores alternos                                                                   | Tipo    | Condición canónica de inicio                                                                               | Regla de formalización                                                                                                  |
| ------------ | ----------- | ----------------------------------------------------------------------------------- | ---------------------------- | -------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0048` | `nexo`      | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho         | `LOGISTICA_Y_TRANSPORTE`     | `EVENTO_CANONICO_DE_PROCESO`; `BODEGA_Y_ABASTECIMIENTO`; `COORDINACION_DE_OPERACIONES` | `MIXTO` | Existen uno o más compromisos de traslado listos para planificación y recursos potencialmente disponibles. | NEXO abre un plan de despacho; una remisión o pedido no asigna automáticamente ruta, vehículo ni conductor.             |
| `VPROC-0049` | `nexo`      | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente | `LOGISTICA_Y_TRANSPORTE`     | `EVENTO_CANONICO_DE_PROCESO`; `BODEGA_Y_ABASTECIMIENTO`                                | `MIXTO` | Existe un plan publicado, carga validada, vehículo y conductor habilitados para iniciar recorrido.         | NEXO crea el viaje y transfiere custodia conforme al contrato; iniciar ruta no confirma entrega.                        |
| `VPROC-0050` | `pulso`     | Integrar entrega de tercero con seguimiento, prueba y conciliación interna          | `EVENTO_CANONICO_DE_PROCESO` | `PLATAFORMA_O_CANAL_EXTERNO`; `RESPONSABLE_COMERCIAL`                                  | `MIXTO` | Un pedido listo se entrega a un proveedor externo o se recibe un evento de seguimiento correlacionable.    | PULSO abre la integración de entrega con idempotencia; el tercero no gobierna el pedido interno ni su cierre comercial. |

##### 8.12. Finanzas y análisis

| Proceso      | Propietaria | Nombre objetivo                                                                           | Iniciador primario           | Iniciadores alternos                                                  | Tipo             | Condición canónica de inicio                                                                                   | Regla de formalización                                                                                     |
| ------------ | ----------- | ----------------------------------------------------------------------------------------- | ---------------------------- | --------------------------------------------------------------------- | ---------------- | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `VPROC-0051` | `numera`    | Registrar hechos económicos desde eventos operativos y soportes correlacionados           | `EVENTO_CANONICO_DE_PROCESO` | `RESPONSABLE_FINANCIERO`                                              | `EVENTO_INTERNO` | Una aplicación propietaria emite un hecho económico válido o se autoriza una incorporación manual con soporte. | NUMERA registra el hecho correlacionado con su origen; no infiere ni recrea operaciones faltantes.         |
| `VPROC-0052` | `numera`    | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria             | `EVENTO_CANONICO_DE_PROCESO` | `RESPONSABLE_FINANCIERO`; `REGLA_PROGRAMADA`                          | `MIXTO`          | Existe una obligación válida, aceptada y exigible o se alcanza su fecha programada de gestión.                 | NUMERA abre la obligación o ciclo de pago; el inicio no aprueba ni ejecuta transferencia bancaria.         |
| `VPROC-0053` | `numera`    | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                | `EVENTO_CANONICO_DE_PROCESO` | `RESPONSABLE_FINANCIERO`; `REGLA_PROGRAMADA`                          | `MIXTO`          | Existe una cuenta por cobrar válida, vencimiento, pago recibido o diferencia que requiere gestión.             | NUMERA crea o actualiza el caso de cartera mediante evento correlacionado; no modifica la venta de origen. |
| `VPROC-0054` | `numera`    | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas | `REGLA_PROGRAMADA`           | `RESPONSABLE_FINANCIERO`; `GERENCIA_GENERAL`; `RESPONSABLE_ANALITICO` | `MIXTO`          | Se alcanza un periodo de cálculo o existe una solicitud autorizada de cierre, costo, asignación o análisis.    | NUMERA crea una corrida versionada con fecha de corte; el inicio no altera hechos operativos.              |

##### 8.13. Instalaciones, mercadeo, tecnología, información y continuidad

| Proceso      | Propietaria | Nombre objetivo                                                                                          | Iniciador primario                      | Iniciadores alternos                                                                                        | Tipo    | Condición canónica de inicio                                                                                                 | Regla de formalización                                                                                                                      |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0055` | `nexo`      | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones  | `TRABAJADOR`                            | `REGLA_PROGRAMADA`; `RESPONSABLE_DE_INSTALACIONES`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`     | `MIXTO` | Existe una novedad locativa, control periódico, servicio vencido o condición que afecta aptitud de una instalación.          | NEXO abre una solicitud, inspección u orden sobre un espacio identificado; el reporte no declara indisponibilidad ni cierre sin evaluación. |
| `VPROC-0056` | `aura`      | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                | `RESPONSABLE_DE_MARCA`                  | `RESPONSABLE_COMERCIAL`; `GERENCIA_GENERAL`; `EVENTO_CANONICO_DE_PROCESO`                                   | `MIXTO` | Existe una necesidad de contenido, promoción, campaña, actualización o retiro con objetivo y canal definidos.                | AURA crea un brief o solicitud; iniciar no aprueba, programa ni publica contenido.                                                          |
| `VPROC-0057` | `aura`      | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                  | `PROSPECTO_O_CLIENTE`                   | `PLATAFORMA_O_CANAL_EXTERNO`; `RESPONSABLE_COMERCIAL`                                                       | `MIXTO` | Se recibe una interacción digital con intención comercial o necesidad de atención identificable.                             | AURA crea un caso u oportunidad mediante adaptador y deduplicación; una interacción no crea pedido ni cliente maestro automáticamente.      |
| `VPROC-0058` | `viso`      | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento    | `TRABAJADOR`                            | `UMBRAL_O_ALERTA`; `RESPONSABLE_TECNOLOGICO`; `GERENCIA_O_SUPERVISION_DE_SEDE`                              | `MIXTO` | Existe una solicitud, falla, degradación, alerta o necesidad de cambio tecnológico.                                          | VISO abre un caso con servicio y elemento afectados; el reporte no concede acceso privilegiado ni autoriza el cambio.                       |
| `VPROC-0059` | `viso`      | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                 | `RESPONSABLE_DE_PERSONAS`               | `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`; `EVENTO_CANONICO_DE_PROCESO`                                | `MIXTO` | Existe una alta, cambio, recuperación, suspensión o baja de acceso asociada a una necesidad laboral válida.                  | VISO abre la solicitud con persona, recurso, alcance y vigencia; el solicitante no se autoaprueba ni modifica permisos directamente.        |
| `VPROC-0060` | `viso`      | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia               | `ACTOR_PRODUCTOR_DEL_HECHO_O_EVIDENCIA` | `CUSTODIO_DOCUMENTAL`; `REGLA_PROGRAMADA`; `ASESOR_O_AUTORIDAD`                                             | `MIXTO` | Se crea, recibe, versiona, preserva, solicita o dispone un documento o evidencia con propietario y finalidad identificables. | VISO registra metadatos y vínculo al hecho propietario; el archivo por sí solo no inicia ni sustituye el proceso respaldado.                |
| `VPROC-0061` | `numera`    | Gestionar medición, análisis, decisión de mejora y verificación de resultado                             | `RESPONSABLE_ANALITICO`                 | `GERENCIA_GENERAL`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`; `EVENTO_CANONICO_DE_PROCESO`       | `MIXTO` | Existe una pregunta de gestión, desviación, hallazgo o hipótesis de mejora con alcance y resultado esperado.                 | NUMERA abre un análisis o acción de mejora con fuente y corte; el indicador no modifica el proceso de origen.                               |
| `VPROC-0062` | `viso`      | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje | `UMBRAL_O_ALERTA`                       | `TRABAJADOR`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_CONTINUIDAD`; `TECNICO_O_PRESTADOR_EXTERNO` | `MIXTO` | Se detecta una interrupción o amenaza que supera el umbral de continuidad de un proceso o servicio crítico.                  | VISO abre el incidente de continuidad y correlaciona incidentes locales; la alerta no activa una alternativa de alto impacto sin autoridad. |

##### 8.14. Procesos adicionales obligatorios

| Proceso      | Propietaria | Nombre objetivo                                                                                                                                                                                          | Iniciador primario                  | Iniciadores alternos                                                                 | Tipo             | Condición canónica de inicio                                                                                               | Regla de formalización                                                                                                          |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------ | ---------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0063` | `viso`      | `CAP-01.07` — Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `RESPONSABLE_DE_RIESGO_EMPRESARIAL` | `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD`; `UMBRAL_O_ALERTA`                        | `MIXTO`          | Existe un riesgo nuevo, cambio material, revisión periódica o desviación que requiere tratamiento empresarial.             | VISO crea o revisa el registro de riesgo con fuente y propietario; iniciar no acepta riesgo residual ni aprueba tratamiento.    |
| `VPROC-0064` | `viso`      | `CAP-01.09` — Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `ASESOR_O_AUTORIDAD`                | `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; `CUSTODIO_DOCUMENTAL`       | `MIXTO`          | Se recibe un requerimiento, concepto, vencimiento o compromiso externo, o se decide solicitarlo formalmente.               | VISO abre el expediente y asigna responsabilidad interna; el tercero no gobierna el estado ni el cierre interno.                |
| `VPROC-0065` | `viso`      | `CAP-02.10` — Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `GERENCIA_O_SUPERVISION_DE_SEDE`    | `RESPONSABLE_DE_PERSONAS`; `TRABAJADOR`; `REGLA_PROGRAMADA`                          | `MIXTO`          | Se inicia un ciclo de objetivos, retroalimentación, desarrollo o revisión para una persona vinculada y finalidad legítima. | VISO crea el ciclo con visibilidad y finalidad controladas; iniciar no equivale a calificar ni decidir consecuencias laborales. |
| `VPROC-0066` | `viso`      | `CAP-03.03` — Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `RESPONSABLE_SST_Y_CUMPLIMIENTO`    | `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`; `UMBRAL_O_ALERTA`                    | `MIXTO`          | Existe un requisito de EPP por cargo, riesgo, vencimiento, deterioro, pérdida o cambio de condición.                       | VISO crea la necesidad individual; NEXO solo ejecuta el efecto de inventario después de la asignación válida.                   |
| `VPROC-0067` | `nexo`      | `CAP-07.11` — Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `AREA_SOLICITANTE`                  | `BODEGA_Y_ABASTECIMIENTO`; `CUSTODIO_O_USUARIO_DE_ACTIVO`; `RESPONSABLE_DE_CATALOGO` | `HUMANO_INTERNO` | Existe una necesidad de definir, armar, entregar, recuperar, sustituir o verificar un kit o conjunto.                      | NEXO crea la instancia o solicitud de kit con definición vigente; iniciar no consume componentes ni cambia custodia.            |
| `VPROC-0068` | `pulso`     | `CAP-10.06` — Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `EVENTO_CANONICO_DE_PROCESO`        | `CLIENTE`; `REGLA_PROGRAMADA`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                   | `MIXTO`          | Finaliza o alcanza un punto elegible una interacción de servicio y existe base legítima para solicitar medición.           | PULSO crea una invitación o medición separada del reclamo y del incentivo; la ausencia de respuesta no altera el servicio.      |
| `VPROC-0069` | `numera`    | `CAP-12.11` — Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `RESPONSABLE_FINANCIERO`            | `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD`; `REGLA_PROGRAMADA`                       | `MIXTO`          | Se abre un ciclo presupuestal, revisión, escenario o reforecast con horizonte y supuestos definidos.                       | NUMERA crea una versión de presupuesto; el inicio no autoriza gasto ni genera asiento contable.                                 |

---

#### 9. Fronteras críticas de iniciación

| Frontera                          | Decisión                                                                                                                    |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| candidato → vinculación           | Una candidatura o selección inicia `VPROC-0005`; `VPROC-0006` solo inicia con decisión de vinculación aprobada.             |
| señal → producción                | Demanda, stock o pedido pueden iniciar evaluación de `VPROC-0033`; no crean automáticamente una ejecución `VPROC-0034`.     |
| pedido externo → pedido interno   | La plataforma inicia `VPROC-0040`, pero PULSO debe validar, deduplicar y crear la instancia interna.                        |
| pago intentado → pago confirmado  | El inicio de `VPROC-0043` crea una intención; el estado pagado depende de confirmación posterior.                           |
| hecho operativo → hecho económico | Un evento válido inicia `VPROC-0051`; NUMERA no inventa operaciones faltantes ni corrige el origen.                         |
| alerta → decisión                 | Alertas pueden iniciar riesgo, condición, mantenimiento o continuidad; no aprueban liberación, disposición, gasto o bypass. |
| documento → proceso respaldado    | Un archivo puede iniciar `VPROC-0060`, pero no sustituye ni crea automáticamente el proceso empresarial que documenta.      |
| solicitud de acceso → autoridad   | `VPROC-0059` inicia con necesidad laboral válida; el solicitante no se autoaprueba ni recibe acceso por crear la solicitud. |

---

#### 10. Compatibilidad con autorización y dispositivos

1. La función iniciadora deberá resolverse contra identidad, vínculo, contexto y alcance cuando el iniciador sea interno.
2. En dispositivos compartidos se registrarán principal técnico, actor humano efectivo y función iniciadora; el dispositivo nunca será el iniciador empresarial.
3. Un actor externo no recibe una cuenta laboral por iniciar un proceso.
4. La aplicación propietaria deberá fallar de forma cerrada cuando el origen no pueda autenticarse, correlacionarse o autorizarse.
5. Las reglas de permisos exactos, modalidad, territorio, turno y check-in se cerrarán durante autorización e implementación, no mediante esta tabla.

---

#### 11. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                           | Tipo                                      | Prioridad | Momento de implementación                | Destino                               |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | --------- | ---------------------------------------- | ------------------------------------- |
| `TREQ-PROC-028` | Cada `VPROC-*` resuelve un iniciador primario, alternativas válidas, tipo y condición de inicio sin valores huérfanos o no permitidos.                                    | contractual + regresión                   | crítica   | materialización del registro y CI        | `SHELL-CI-017`; E3                    |
| `TREQ-PROC-029` | Toda instancia conserva identidad u origen iniciador, función, canal, territorio, correlación y actor de registro cuando aplique.                                         | integración + auditoría + E2E             | crítica   | paquete que implemente cada proceso      | E3/E4/E5 y `PROC-CAT-018`             |
| `TREQ-PROC-030` | Iniciar un proceso no concede ejecución, aprobación, corrección, cancelación, reversión, cierre ni propiedad.                                                             | autorización + seguridad + regresión      | crítica   | implementación de acciones y permisos    | AUTH, servidor, RLS/RPC y paquetes E5 |
| `TREQ-PROC-031` | Eventos externos, internos, programados y alertas se validan, deduplican, correlacionan y reintentan sin crear instancias duplicadas ni decisiones sensibles automáticas. | integración + idempotencia + concurrencia | crítica   | adaptadores, jobs, colas y eventos       | BLOQUE X, E3, E4 y E5                 |
| `TREQ-PROC-032` | Ninguna instancia válida avanza si falta la condición mínima de inicio; borradores o rechazos permanecen diferenciados y auditables.                                      | contractual + E2E + regresión             | alta      | implementación de estados iniciales y UX | `PROC-CAT-009`; UX; paquetes E5       |

El detalle completo deberá incorporarse al Registro Canónico de Requisitos de Prueba mediante regeneración integral del archivo.

---

#### 12. Decisiones reservadas

| Decisión                                           | Tarea                           |
| -------------------------------------------------- | ------------------------------- |
| actores que ejecutan, revisan, reciben o continúan | `PROC-CAT-008`                  |
| estado inicial y tratamiento de borradores         | `PROC-CAT-009`                  |
| estados intermedios y finales                      | `PROC-CAT-010` y `PROC-CAT-011` |
| transiciones y acciones excepcionales              | `PROC-CAT-012` a `PROC-CAT-014` |
| datos de entrada y salida                          | `PROC-CAT-015` y `PROC-CAT-016` |
| eventos empresariales                              | `PROC-CAT-017`                  |
| auditoría detallada                                | `PROC-CAT-018`                  |
| métricas                                           | `PROC-CAT-019`                  |
| duplicidades                                       | `PROC-CAT-020`                  |

---

#### 13. Criterios de aceptación

- [ ] Están cubiertos exactamente `VPROC-0001` a `VPROC-0069`.
- [ ] Cada proceso conserva la propietaria aprobada en `PROC-CAT-005`.
- [ ] Cada proceso tiene exactamente un iniciador primario.
- [ ] Los iniciadores alternos son explícitos y no duplican el primario.
- [ ] Todos los tipos pertenecen al catálogo permitido.
- [ ] Cada proceso declara una condición mínima y una regla de formalización.
- [ ] Los actores externos y mecanismos automáticos no reciben propiedad ni autoridad implícita.
- [ ] Se distingue origen, actor de registro, autorización, ejecución y aprobación.
- [ ] No se definieron todavía actores continuadores, estados, transiciones, datos, eventos ni métricas fuera de su tarea.
- [ ] Se generaron y registraron `TREQ-PROC-028` a `TREQ-PROC-032`.
- [ ] No se modificó código, Supabase, migraciones ni operación.
- [ ] `PROC-CAT-008` permanece como única continuidad inmediata.

---

#### 14. Estado

```text
APROBADA
```

No se inicia `PROC-CAT-008` hasta la aprobación expresa de `PROC-CAT-007`.


### ✅ PROC-CAT-008 — Definir actores que continúan cada proceso

**Estado:** APROBADA  
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Dependencias obligatorias:** `E1-GATE-001` — APROBADA; `PROC-CAT-001` a `PROC-CAT-007` — APROBADAS  
**Línea base recibida:** `PROC-CANONICAL-ID-REGISTRY-001`, `PROC-BUSINESS-PURPOSE-REGISTRY-001`, `PROC-APPLICATION-OWNERSHIP-REGISTRY-001`, `PROC-APPLICATION-CONSUMER-REGISTRY-001` y `PROC-PROCESS-INITIATOR-REGISTRY-001`  
**Naturaleza:** decisión funcional sobre participación y continuidad humana, externa y técnica, sin implementación  
**Artefacto producido:** `PROC-PROCESS-CONTINUATOR-REGISTRY-001`  
**Procesos cubiertos:** **69**  
**Rango cubierto:** `VPROC-0001` a `VPROC-0069`  
**Cambios en código, migraciones o Supabase:** no autorizados  
**Siguiente tarea reservada:** `PROC-CAT-009 — Definir estado inicial de cada proceso`

---

#### 1. Propósito

Definir qué funciones humanas, terceros y mecanismos técnicos pueden tomar trabajo, aportar evidencia, revisar, aceptar o controlar una instancia después de su inicio, sin convertir esta matriz en una asignación de permisos, una secuencia de estados o una lista de cargos nominales.

```text
INSTANCIA VPROC-* VÁLIDAMENTE INICIADA
        ↓
CONTINUADOR PRINCIPAL ASUME TRABAJO
        ↓
APOYOS APORTAN RESULTADOS PARCIALES
        ↓
CONTROL O ACEPTACIÓN INDEPENDIENTE CUANDO APLICA
        ↓
TRASPASO TRAZABLE SIN CAMBIAR LA IDENTIDAD DEL PROCESO
```

La continuidad se define por función empresarial. Una persona concreta solo podrá actuar cuando su identidad, vínculo, autorización, contexto, territorio y estado de la instancia permitan la acción específica.

---

#### 2. Resultado obligatorio

La tarea produce `PROC-PROCESS-CONTINUATOR-REGISTRY-001`, que deberá:

1. cubrir exactamente `VPROC-0001` a `VPROC-0069`;
2. conservar propósito, propietaria, consumidoras e iniciadores aprobados;
3. declarar al menos un continuador principal interno para cada proceso;
4. declarar apoyos únicamente cuando aporten trabajo o evidencia al mismo proceso;
5. declarar actores de control o aceptación cuando exista revisión, aprobación, liberación, conciliación o cierre independiente;
6. declarar terceros y mecanismos técnicos sin tratarlos como propietarios ni autoridades internas;
7. definir una frontera de continuidad y segregación para cada proceso;
8. impedir que iniciar o continuar implique automáticamente aprobar, revertir, cerrar o ampliar alcance;
9. impedir que un traspaso cree una instancia paralela o pierda actor, contexto, territorio, tiempos o pendientes;
10. servir como entrada para estados, transiciones, autorización, UX, auditoría, contratos E3/E4 y paquetes E5.

---

#### 3. Definiciones normativas

| Concepto                      | Definición                                                                                                                                          |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| continuador principal         | Función interna que asume una parte sustantiva del trabajo y puede mover la instancia hacia un resultado posterior, sujeto a autorización y estado. |
| continuador de apoyo          | Función interna que aporta información, ejecución parcial, evidencia o capacidad especializada sin gobernar por sí sola el proceso completo.        |
| actor de control o aceptación | Función independiente que revisa, aprueba, libera, acepta, concilia o confirma un resultado cuando el proceso lo requiere.                          |
| participante externo          | Cliente, candidato, proveedor, autoridad o tercero que aporta solicitud, información, ejecución o aceptación mediante un contrato delimitado.       |
| participante técnico          | Adaptador, automatización o fuente canónica que transporta, calcula, valida, notifica o correlaciona, sin autoridad empresarial propia.             |
| traspaso                      | Cambio explícito de responsabilidad o custodia sobre la misma instancia, conservando identidad, historial, pendientes y actor emisor y receptor.    |

Continuar no equivale a:

- ser propietario de la aplicación;
- recibir acceso general a todos los datos del proceso;
- aprobar, liberar, pagar, publicar, disponer o cerrar;
- convertirse en dueño del dato maestro;
- actuar fuera de sede, área, turno, vínculo o alcance;
- ejecutar mediante dispositivo compartido sin actor humano efectivo.

---

#### 4. Clases de participación

| Clase                | Uso permitido                                                                     |
| -------------------- | --------------------------------------------------------------------------------- |
| `PRINCIPAL`          | Ejecuta o coordina una responsabilidad sustantiva del proceso.                    |
| `APOYO`              | Aporta un resultado parcial, evidencia o especialidad.                            |
| `CONTROL_ACEPTACION` | Revisa, aprueba, libera, acepta, concilia o valida de manera diferenciada.        |
| `EXTERNO_TECNICO`    | Participa mediante contrato externo o mecanismo técnico, sin autoridad implícita. |

Una misma función podrá pertenecer a clases distintas en procesos diferentes. Dentro de una misma fila no se repetirá en dos clases, para evitar ambigüedad de responsabilidad.

---

#### 5. Catálogo de funciones continuadoras

**Dirección, gobierno y coordinación**

`GOBIERNO_Y_PROPIEDAD`, `GERENCIA_GENERAL`, `GERENCIA_O_SUPERVISION_DE_SEDE`, `COORDINACION_DE_OPERACIONES`, `RESPONSABLE_DEL_PROCESO`, `RESPONSABLE_DE_RIESGO_EMPRESARIAL`, `RESPONSABLE_DE_CONTINUIDAD`.

**Personas y relación laboral**

`RESPONSABLE_DE_PERSONAS`, `RESPONSABLE_DE_SELECCION_Y_VINCULACION`, `RESPONSABLE_DE_PROGRAMACION_LABORAL`, `RESPONSABLE_DE_NOMINA_Y_BENEFICIOS`, `TRABAJADOR`.

**SST, calidad y respuesta**

`RESPONSABLE_SST_Y_CUMPLIMIENTO`, `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`, `EQUIPO_DE_RESPUESTA_Y_EMERGENCIA`.

**Catálogo, producción, comercial y servicio**

`RESPONSABLE_DE_CATALOGO`, `RESPONSABLE_PRODUCTIVO`, `EQUIPO_PRODUCTIVO`, `RESPONSABLE_COMERCIAL`, `RESPONSABLE_DE_MARCA`, `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`, `CAJA_MOSTRADOR_O_SERVICIO`, `SERVICIO_DE_SALON`.

**Operación física, inventario, logística y activos**

`AREA_SOLICITANTE`, `EQUIPO_OPERATIVO_DEL_AREA`, `BODEGA_Y_ABASTECIMIENTO`, `RECEPCION_EN_SEDE`, `LOGISTICA_Y_TRANSPORTE`, `CONDUCTOR_O_RESPONSABLE_DE_RUTA`, `RECEPTOR_O_DESTINATARIO`, `CUSTODIO_O_USUARIO_DE_ACTIVO`, `RESPONSABLE_DE_MANTENIMIENTO`, `RESPONSABLE_DE_INSTALACIONES`.

**Compras, finanzas, tecnología, información y análisis**

`RESPONSABLE_DE_COMPRAS`, `RESPONSABLE_FINANCIERO`, `RESPONSABLE_ANALITICO`, `RESPONSABLE_TECNOLOGICO`, `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`, `CUSTODIO_DOCUMENTAL`, `ACTOR_PRODUCTOR_DEL_HECHO_O_EVIDENCIA`.

**Participantes externos**

`CANDIDATO`, `CLIENTE`, `CLIENTE_O_PROSPECTO`, `EMPRESA_CLIENTE`, `PROVEEDOR`, `PROVEEDOR_LOGISTICO_EXTERNO`, `TECNICO_O_PRESTADOR_EXTERNO`, `ASESOR_O_AUTORIDAD`, `PLATAFORMA_O_CANAL_EXTERNO`, `ENTIDAD_FINANCIERA_O_PROVEEDOR_DE_PAGO`.

**Participantes técnicos**

`AUTOMATIZACION_ASISTIVA`, `ADAPTADOR_DE_INTEGRACION`, `FUENTE_DE_DATOS_CANONICA`.

Los valores son responsabilidades funcionales. No crean cargos, roles RBAC, perfiles operativos, permisos, cuentas ni plazas. La correspondencia exacta se resolverá en autorización, diseño de pantallas y paquetes de implementación.

---

#### 6. Reglas canónicas de continuidad

1. Cada proceso tendrá uno o más continuadores principales internos.
2. Un tercero o mecanismo técnico nunca será el único continuador principal de un proceso empresarial interno.
3. Los actores de una fila serán disjuntos entre `PRINCIPAL`, `APOYO`, `CONTROL_ACEPTACION` y `EXTERNO_TECNICO`.
4. El traspaso conservará `process_id`, instancia, recurso, actor emisor, actor receptor, momento, contexto, territorio, pendientes y evidencia.
5. Una asignación no se considerará aceptada hasta que el receptor confirme o el contrato aprobado defina aceptación automática segura.
6. Quien prepara o ejecuta una acción crítica no podrá autoaprobarla cuando exista segregación obligatoria.
7. Un actor de apoyo no podrá modificar la fuente de verdad fuera del comando o proyección que le corresponda.
8. Un participante externo actuará mediante portal, adaptador, canal o actor interno de registro; no escribirá directamente estados privados.
9. Una automatización podrá enrutar, calcular, validar, notificar o sugerir; no podrá aprobar, liberar, pagar, disponer, publicar, conceder acceso o cerrar salvo contrato explícito posterior y controlado.
10. La ausencia, retiro o sustitución de una persona no cambiará el identificador de función; la reasignación deberá conservar historial.
11. En dispositivos compartidos, la estación no será actor empresarial; se registrarán principal técnico, actor humano efectivo y función ejercida.
12. `PROC-CAT-009` a `PROC-CAT-014` definirán estados y acciones; esta tarea no asigna todavía permisos exactos por transición.

---

#### 7. Criterio de lectura del registro

```text
CONTINUADORES PRINCIPALES
→ asumen trabajo sustantivo

APOYOS
→ aportan especialidad, evidencia o ejecución parcial

CONTROL / ACEPTACIÓN
→ revisa, aprueba, libera, acepta o concilia cuando corresponde

EXTERNOS / TÉCNICOS
→ participan sin convertirse en autoridad interna
```

---

#### 8. Registro canónico de actores continuadores

##### 8.1. Gobierno y estructura

| Proceso      | Propietaria | Nombre objetivo                                                                                                   | Continuadores principales                                | Apoyos                                                                                                | Control o aceptación   | Externos o técnicos       | Frontera de continuidad                                                                                                                     |
| ------------ | ----------- | ----------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | `viso`      | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                   | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`        | `RESPONSABLE_DEL_PROCESO`; `CUSTODIO_DOCUMENTAL`                                                      | `GOBIERNO_Y_PROPIEDAD` | —                         | La gestión puede preparar compromisos y evidencia; la decisión reservada solo queda vigente cuando la autoridad competente la acepta.       |
| `VPROC-0002` | `viso`      | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas | `GERENCIA_GENERAL`                                       | `RESPONSABLE_DE_PERSONAS`; `RESPONSABLE_FINANCIERO`; `CUSTODIO_DOCUMENTAL`; `RESPONSABLE_TECNOLOGICO` | `GOBIERNO_Y_PROPIEDAD` | `ASESOR_O_AUTORIDAD`      | Cada especialista aporta su dominio; ninguna actualización parcial puede cambiar por sí sola la estructura jurídica u organizativa vigente. |
| `VPROC-0003` | `viso`      | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes             | `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`  | `RESPONSABLE_DEL_PROCESO`; `CUSTODIO_DOCUMENTAL`                                                      | `GOBIERNO_Y_PROPIEDAD` | `ASESOR_O_AUTORIDAD`      | La redacción, revisión y evaluación de impacto permanecen separadas de la aprobación, publicación y retiro de una política.                 |
| `VPROC-0004` | `viso`      | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                   | `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_DEL_PROCESO` | `GERENCIA_O_SUPERVISION_DE_SEDE`; `EQUIPO_OPERATIVO_DEL_AREA`                                         | `GERENCIA_GENERAL`     | `AUTOMATIZACION_ASISTIVA` | Cada transferencia conserva un responsable emisor y uno receptor; reasignar trabajo no equivale a cerrar el compromiso.                     |

##### 8.2. Personas y relación laboral

| Proceso      | Propietaria | Nombre objetivo                                                                                    | Continuadores principales                                                  | Apoyos                                                                                                                   | Control o aceptación                  | Externos o técnicos                                                 | Frontera de continuidad                                                                                                                                      |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0005` | `viso`      | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `RESPONSABLE_DE_SELECCION_Y_VINCULACION`; `GERENCIA_O_SUPERVISION_DE_SEDE` | `RESPONSABLE_DE_PERSONAS`                                                                                                | `GERENCIA_GENERAL`                    | `CANDIDATO`                                                         | El candidato aporta información y participa en evaluaciones, pero la comparación, decisión y cierre pertenecen a actores internos autorizados.               |
| `VPROC-0006` | `viso`      | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona | `RESPONSABLE_DE_PERSONAS`; `RESPONSABLE_DE_SELECCION_Y_VINCULACION`        | `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_TECNOLOGICO`; `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `BODEGA_Y_ABASTECIMIENTO` | `GERENCIA_GENERAL`                    | `TRABAJADOR`                                                        | Cada dominio completa su habilitación sin asumir que la creación de identidad, entrega de elementos o acceso tecnológico equivale a incorporación terminada. |
| `VPROC-0007` | `viso`      | Administrar asignaciones laborales y programación publicada con historial y revisión controlada    | `RESPONSABLE_DE_PROGRAMACION_LABORAL`; `GERENCIA_O_SUPERVISION_DE_SEDE`    | `RESPONSABLE_DE_PERSONAS`; `TRABAJADOR`                                                                                  | `COORDINACION_DE_OPERACIONES`         | `AUTOMATIZACION_ASISTIVA`                                           | Proponer, publicar, aceptar, cambiar y cubrir un turno son acciones distintas; la automatización solo asiste validaciones y avisos.                          |
| `VPROC-0008` | `anima`     | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables             | `TRABAJADOR`; `GERENCIA_O_SUPERVISION_DE_SEDE`                             | `RESPONSABLE_DE_PERSONAS`                                                                                                | `RESPONSABLE_DE_PROGRAMACION_LABORAL` | `AUTOMATIZACION_ASISTIVA`                                           | El trabajador registra hechos y la supervisión gestiona excepciones; ninguna corrección sobrescribe la marcación original.                                   |
| `VPROC-0009` | `viso`      | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos               | `RESPONSABLE_DE_PERSONAS`; `GERENCIA_O_SUPERVISION_DE_SEDE`                | `TRABAJADOR`; `RESPONSABLE_DE_PROGRAMACION_LABORAL`; `RESPONSABLE_DE_NOMINA_Y_BENEFICIOS`                                | `GERENCIA_GENERAL`                    | —                                                                   | La novedad laboral, su aprobación, la cobertura operativa y su efecto de nómina se mantienen correlacionados pero separados.                                 |
| `VPROC-0010` | `numera`    | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                     | `RESPONSABLE_DE_NOMINA_Y_BENEFICIOS`; `RESPONSABLE_FINANCIERO`             | `RESPONSABLE_DE_PERSONAS`; `GERENCIA_O_SUPERVISION_DE_SEDE`                                                              | `GERENCIA_GENERAL`                    | `ENTIDAD_FINANCIERA_O_PROVEEDOR_DE_PAGO`; `AUTOMATIZACION_ASISTIVA` | Preparación, revisión, aprobación, envío y conciliación no pueden quedar bajo una única acción ni depender solo de un archivo externo.                       |
| `VPROC-0011` | `viso`      | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                    | `RESPONSABLE_DE_PERSONAS`; `GERENCIA_O_SUPERVISION_DE_SEDE`                | `RESPONSABLE_TECNOLOGICO`; `BODEGA_Y_ABASTECIMIENTO`; `CUSTODIO_DOCUMENTAL`; `RESPONSABLE_FINANCIERO`                    | `GERENCIA_GENERAL`                    | `TRABAJADOR`                                                        | La terminación laboral coordina devoluciones, revocaciones y cierres; ningún dominio puede declarar cierre total mientras conserve obligaciones abiertas.    |

##### 8.3. SST, emergencias e inocuidad

| Proceso      | Propietaria | Nombre objetivo                                                                               | Continuadores principales                                              | Apoyos                                                                                | Control o aceptación                                    | Externos o técnicos                                 | Frontera de continuidad                                                                                                                                  |
| ------------ | ----------- | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------- | --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0012` | `viso`      | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                 | `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `GERENCIA_O_SUPERVISION_DE_SEDE`     | `TRABAJADOR`; `RESPONSABLE_DE_INSTALACIONES`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`    | `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL` | `ASESOR_O_AUTORIDAD`                                | Identificación, tratamiento, ejecución y verificación del control se separan; el responsable del riesgo no puede cerrar solo con una acción declarativa. |
| `VPROC-0013` | `viso`      | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior | `EQUIPO_DE_RESPUESTA_Y_EMERGENCIA`; `RESPONSABLE_SST_Y_CUMPLIMIENTO`   | `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`; `RESPONSABLE_DE_PERSONAS`             | `GERENCIA_GENERAL`                                      | `TECNICO_O_PRESTADOR_EXTERNO`; `ASESOR_O_AUTORIDAD` | La respuesta inmediata prevalece, pero investigación, evidencia, notificación y cierre posterior requieren funciones diferenciadas.                      |
| `VPROC-0014` | `viso`      | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados   | `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_SST_Y_CUMPLIMIENTO` | `EQUIPO_OPERATIVO_DEL_AREA`; `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_INSTALACIONES` | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `ASESOR_O_AUTORIDAD`                                | Ejecutar un control no equivale a verificarlo ni liberar el área, producto o condición observada.                                                        |

##### 8.4. Producto, recetas, oferta y especificaciones

| Proceso      | Propietaria | Nombre objetivo                                                                         | Continuadores principales                                       | Apoyos                                                                                                            | Control o aceptación          | Externos o técnicos                                     | Frontera de continuidad                                                                                                               |
| ------------ | ----------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0015` | `nexo`      | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias        | `RESPONSABLE_DE_CATALOGO`                                       | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | `COORDINACION_DE_OPERACIONES` | `PROVEEDOR`                                             | Cada dominio propone atributos de su competencia; solo el gobierno del catálogo consolida una identidad y versión canónicas.          |
| `VPROC-0016` | `fogo`      | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas              | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`  | `EQUIPO_PRODUCTIVO`; `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_ANALITICO`                                           | `GERENCIA_GENERAL`            | `ASESOR_O_AUTORIDAD`                                    | Desarrollar, probar, revisar, aprobar y publicar una receta son responsabilidades distintas; una prueba no altera la versión vigente. |
| `VPROC-0017` | `pulso`     | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`                 | `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_PRODUCTIVO`; `GERENCIA_O_SUPERVISION_DE_SEDE`                             | `GERENCIA_GENERAL`            | `PLATAFORMA_O_CANAL_EXTERNO`; `AUTOMATIZACION_ASISTIVA` | La publicación consume producto, precio, capacidad y vigencia aprobados; ningún canal externo se convierte en maestro de la oferta.   |
| `VPROC-0018` | `nexo`      | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto | `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_DE_CATALOGO` | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_COMPRAS`                                                                | `GERENCIA_GENERAL`            | `ASESOR_O_AUTORIDAD`; `PROVEEDOR`                       | El proveedor o asesor aporta evidencia; calidad y catálogo determinan su adopción interna sin sobrescribir historia.                  |

##### 8.5. Compras y recepción

| Proceso      | Propietaria | Nombre objetivo                                                                                                    | Continuadores principales                      | Apoyos                                                                                                       | Control o aceptación                              | Externos o técnicos                     | Frontera de continuidad                                                                                                                         |
| ------------ | ----------- | ------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0019` | `origo`     | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                   | `RESPONSABLE_DE_COMPRAS`                       | `AREA_SOLICITANTE`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_PRODUCTIVO`            | `GERENCIA_O_SUPERVISION_DE_SEDE`                  | `AUTOMATIZACION_ASISTIVA`               | El área conserva justificación y especificación; compras consolida la necesidad sin convertir una alerta o solicitud en orden aprobada.         |
| `VPROC-0020` | `origo`     | Comparar proveedores y condiciones con evidencia suficiente para decidir                                           | `RESPONSABLE_DE_COMPRAS`                       | `AREA_SOLICITANTE`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                           | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES` | `PROVEEDOR`                             | Quien solicita o cotiza no decide por sí solo; comparación, recomendación y selección deben conservar evidencia y conflicto de interés.         |
| `VPROC-0021` | `origo`     | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                           | `RESPONSABLE_DE_COMPRAS`                       | `RESPONSABLE_FINANCIERO`; `AREA_SOLICITANTE`                                                                 | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES` | `PROVEEDOR`                             | Emitir la orden solo ocurre después de la autoridad aplicable; el proveedor no cambia alcance, precio o condiciones internas directamente.      |
| `VPROC-0022` | `origo`     | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica | `RECEPCION_EN_SEDE`; `BODEGA_Y_ABASTECIMIENTO` | `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `AREA_SOLICITANTE`; `RESPONSABLE_FINANCIERO` | `GERENCIA_O_SUPERVISION_DE_SEDE`                  | `PROVEEDOR`; `ADAPTADOR_DE_INTEGRACION` | Recepción física, conformidad, discrepancia documental y efecto económico se continúan de forma correlacionada, nunca como un único “recibido”. |

##### 8.6. Ubicaciones, inventario y abastecimiento interno

| Proceso      | Propietaria | Nombre objetivo                                                                                | Continuadores principales                                                | Apoyos                                                                                | Control o aceptación             | Externos o técnicos                                      | Frontera de continuidad                                                                                                                   |
| ------------ | ----------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------- | -------------------------------- | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0023` | `nexo`      | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                         | `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_CATALOGO`                     | `RESPONSABLE_DE_INSTALACIONES`; `COORDINACION_DE_OPERACIONES`                         | `GERENCIA_GENERAL`               | `AUTOMATIZACION_ASISTIVA`                                | Crear o modificar una ubicación exige validación física y de uso; una etiqueta o código no habilita por sí solo almacenamiento.           |
| `VPROC-0024` | `nexo`      | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                | `RECEPCION_EN_SEDE`; `BODEGA_Y_ABASTECIMIENTO`                           | `LOGISTICA_Y_TRANSPORTE`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                        | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`                                | Ingreso, validación, ubicación y reubicación conservan movimientos separados y no pueden duplicar la misma existencia.                    |
| `VPROC-0025` | `nexo`      | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino     | `EQUIPO_OPERATIVO_DEL_AREA`; `BODEGA_Y_ABASTECIMIENTO`                   | `RESPONSABLE_PRODUCTIVO`; `LOGISTICA_Y_TRANSPORTE`; `CAJA_MOSTRADOR_O_SERVICIO`       | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`                                | Solicitud, preparación, entrega y consumo se atribuyen a actores distintos cuando corresponda; ninguna pantalla descuenta por inferencia. |
| `VPROC-0026` | `nexo`      | Contar como observación, investigar diferencias y ajustar mediante decisión separada           | `BODEGA_Y_ABASTECIMIENTO`; `EQUIPO_OPERATIVO_DEL_AREA`                   | `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_ANALITICO`                                | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`                                | Contar registra una observación; investigar, aprobar diferencia y publicar ajuste requieren responsabilidades separadas.                  |
| `VPROC-0027` | `nexo`      | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición               | `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `BODEGA_Y_ABASTECIMIENTO`          | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_INSTALACIONES`; `EQUIPO_OPERATIVO_DEL_AREA` | `GERENCIA_O_SUPERVISION_DE_SEDE` | `TECNICO_O_PRESTADOR_EXTERNO`; `AUTOMATIZACION_ASISTIVA` | Detectar una condición no libera ni dispone existencia; cuarentena, evaluación, decisión y ejecución mantienen segregación.               |
| `VPROC-0028` | `nexo`      | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa | `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE`; `RECEPCION_EN_SEDE` | `AREA_SOLICITANTE`; `RESPONSABLE_PRODUCTIVO`; `CAJA_MOSTRADOR_O_SERVICIO`             | `COORDINACION_DE_OPERACIONES`    | `AUTOMATIZACION_ASISTIVA`                                | Solicitante, preparador, transportador y receptor conservan cantidades y aceptación propias; una etapa no confirma la siguiente.          |

##### 8.7. Activos, mantenimiento, vehículos y reutilizables

| Proceso      | Propietaria | Nombre objetivo                                                                             | Continuadores principales                                                           | Apoyos                                                                                                        | Control o aceptación             | Externos o técnicos                                      | Frontera de continuidad                                                                                                                           |
| ------------ | ----------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0029` | `nexo`      | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos               | `CUSTODIO_O_USUARIO_DE_ACTIVO`; `BODEGA_Y_ABASTECIMIENTO`                           | `RECEPCION_EN_SEDE`; `RESPONSABLE_DE_INSTALACIONES`; `COORDINACION_DE_OPERACIONES`                            | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`                                | Asignación, entrega, aceptación de custodia, transferencia y devolución son hechos diferenciados y no sobrescriben el historial.                  |
| `VPROC-0030` | `nexo`      | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos            | `RESPONSABLE_DE_MANTENIMIENTO`; `RESPONSABLE_DE_INSTALACIONES`                      | `CUSTODIO_O_USUARIO_DE_ACTIVO`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_FINANCIERO` | `GERENCIA_O_SUPERVISION_DE_SEDE` | `TECNICO_O_PRESTADOR_EXTERNO`; `PROVEEDOR`               | Diagnóstico, autorización, ejecución, consumo de repuestos, prueba y liberación permanecen separados.                                             |
| `VPROC-0031` | `nexo`      | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias               | `LOGISTICA_Y_TRANSPORTE`; `CONDUCTOR_O_RESPONSABLE_DE_RUTA`                         | `RESPONSABLE_DE_MANTENIMIENTO`; `RESPONSABLE_FINANCIERO`; `BODEGA_Y_ABASTECIMIENTO`                           | `COORDINACION_DE_OPERACIONES`    | `TECNICO_O_PRESTADOR_EXTERNO`; `AUTOMATIZACION_ASISTIVA` | Conductor registra uso e incidencia; logística y mantenimiento determinan disponibilidad sin convertir una lectura en autorización.               |
| `VPROC-0032` | `nexo`      | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores | `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE`; `CUSTODIO_O_USUARIO_DE_ACTIVO` | `AREA_SOLICITANTE`; `RECEPCION_EN_SEDE`                                                                       | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`                                | Entrega, tenencia, retorno, faltante y sustitución conservan responsables y cantidades por etapa; el contenedor no se trata como stock ordinario. |

##### 8.8. Producción

| Proceso      | Propietaria | Nombre objetivo                                                                      | Continuadores principales                                      | Apoyos                                                                                                  | Control o aceptación             | Externos o técnicos       | Frontera de continuidad                                                                                                                                  |
| ------------ | ----------- | ------------------------------------------------------------------------------------ | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | -------------------------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0033` | `fogo`      | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida | `RESPONSABLE_PRODUCTIVO`; `COORDINACION_DE_OPERACIONES`        | `RESPONSABLE_COMERCIAL`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_DE_PERSONAS` | `GERENCIA_GENERAL`               | `AUTOMATIZACION_ASISTIVA` | Las áreas aportan demanda y restricciones; producción consolida el plan y la autoridad correspondiente lo publica sin ocultar capacidad faltante.        |
| `VPROC-0034` | `fogo`      | Preparar materiales y ejecutar producción contra una versión aprobada                | `EQUIPO_PRODUCTIVO`; `RESPONSABLE_PRODUCTIVO`                  | `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                         | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA` | Preparación, consumo, ejecución y registro de resultado se atribuyen al lote y al actor real; el supervisor no sustituye la evidencia operativa.         |
| `VPROC-0035` | `fogo`      | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto       | `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                           | `RESPONSABLE_PRODUCTIVO`; `EQUIPO_PRODUCTIVO`; `BODEGA_Y_ABASTECIMIENTO`                                | `GERENCIA_O_SUPERVISION_DE_SEDE` | `ASESOR_O_AUTORIDAD`      | Producción aporta evidencia y acciones correctivas; calidad conserva independencia para liberar, retener, rechazar o exigir reproceso.                   |
| `VPROC-0036` | `fogo`      | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada        | `EQUIPO_PRODUCTIVO`; `BODEGA_Y_ABASTECIMIENTO`                 | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_DE_CATALOGO`               | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA` | Empaque, etiquetado, verificación y recepción en almacenamiento se registran por actor y no crean una identidad de lote nueva.                           |
| `VPROC-0037` | `fogo`      | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo         | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | `EQUIPO_PRODUCTIVO`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_ANALITICO`       | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA` | El cierre concilia materiales, salida, merma, reproceso y calidad; ningún participante puede corregir retroactivamente el resultado sin evento auditado. |

##### 8.9. Pedidos, ventas, pagos y caja

| Proceso      | Propietaria | Nombre objetivo                                                                                        | Continuadores principales                                                     | Apoyos                                                                                                                         | Control o aceptación             | Externos o técnicos                                                             | Frontera de continuidad                                                                                                                                       |
| ------------ | ----------- | ------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0038` | `pulso`     | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación  | `SERVICIO_DE_SALON`; `EQUIPO_OPERATIVO_DEL_AREA`; `CAJA_MOSTRADOR_O_SERVICIO` | —                                                                                                                              | `GERENCIA_O_SUPERVISION_DE_SEDE` | `CLIENTE`; `AUTOMATIZACION_ASISTIVA`                                            | Salón, preparación y caja continúan el mismo pedido mediante traspasos explícitos; el cliente participa sin gobernar estados internos.                        |
| `VPROC-0039` | `pulso`     | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                         | `CAJA_MOSTRADOR_O_SERVICIO`; `EQUIPO_OPERATIVO_DEL_AREA`                      | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                                                                            | `GERENCIA_O_SUPERVISION_DE_SEDE` | `CLIENTE`                                                                       | Toma, preparación, entrega y cobro permanecen correlacionados; entregar no implica pagar y pagar no implica entregar.                                         |
| `VPROC-0040` | `pulso`     | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación           | `CAJA_MOSTRADOR_O_SERVICIO`; `RESPONSABLE_COMERCIAL`                          | `EQUIPO_OPERATIVO_DEL_AREA`; `LOGISTICA_Y_TRANSPORTE`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                     | `GERENCIA_O_SUPERVISION_DE_SEDE` | `PLATAFORMA_O_CANAL_EXTERNO`; `ADAPTADOR_DE_INTEGRACION`                        | El adaptador normaliza y deduplica; los actores internos aceptan y continúan el pedido sin permitir que el canal externo gobierne su estado.                  |
| `VPROC-0041` | `pulso`     | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B | `RESPONSABLE_COMERCIAL`; `COORDINACION_DE_OPERACIONES`                        | `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_COMPRAS`; `LOGISTICA_Y_TRANSPORTE`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_MARCA` | `GERENCIA_GENERAL`               | `EMPRESA_CLIENTE`                                                               | Cotización, validación de capacidad, aprobación, producción, facturación y entrega se asignan por función; aceptar una etapa no acepta las demás.             |
| `VPROC-0042` | `pulso`     | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos     | `CAJA_MOSTRADOR_O_SERVICIO`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`              | `EQUIPO_OPERATIVO_DEL_AREA`; `RESPONSABLE_FINANCIERO`; `LOGISTICA_Y_TRANSPORTE`                                                | `GERENCIA_O_SUPERVISION_DE_SEDE` | `CLIENTE`; `PLATAFORMA_O_CANAL_EXTERNO`                                         | La clasificación de la solicitud determina quién actúa; una modificación, cancelación, anulación, sustitución o devolución no comparten efectos ni autoridad. |
| `VPROC-0043` | `pulso`     | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                           | `CAJA_MOSTRADOR_O_SERVICIO`                                                   | `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                                                  | `GERENCIA_O_SUPERVISION_DE_SEDE` | `CLIENTE`; `ENTIDAD_FINANCIERA_O_PROVEEDOR_DE_PAGO`; `ADAPTADOR_DE_INTEGRACION` | Caja registra la intención; el proveedor confirma; finanzas concilia; ninguna respuesta ambigua permite marcar pago final.                                    |
| `VPROC-0044` | `pulso`     | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                            | `CAJA_MOSTRADOR_O_SERVICIO`; `RESPONSABLE_FINANCIERO`                         | `RESPONSABLE_ANALITICO`                                                                                                        | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`                                                       | Quien opera caja prepara y explica; supervisión acepta diferencias y finanzas concilia sin borrar la declaración original.                                    |

##### 8.10. Clientes, fidelización, reclamos y reservas

| Proceso      | Propietaria | Nombre objetivo                                                                             | Continuadores principales                                        | Apoyos                                                                                                                     | Control o aceptación          | Externos o técnicos                     | Frontera de continuidad                                                                                                               |
| ------------ | ----------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ----------------------------- | --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0045` | `pass`      | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `CAJA_MOSTRADOR_O_SERVICIO` | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`; `RESPONSABLE_FINANCIERO`                                                  | `GERENCIA_GENERAL`            | `CLIENTE`; `AUTOMATIZACION_ASISTIVA`    | Identidad, consentimiento y ledger permanecen bajo PASS; caja solo solicita movimientos y finanzas interviene en ajustes autorizados. |
| `VPROC-0046` | `pulso`     | Gestionar reclamo, devolución, compensación y aprendizaje de causa                          | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                              | `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_FINANCIERO` | `GERENCIA_GENERAL`            | `CLIENTE`; `PLATAFORMA_O_CANAL_EXTERNO` | Atención, investigación, decisión de compensación, ejecución y aprendizaje de causa permanecen diferenciados.                         |
| `VPROC-0047` | `pulso`     | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento      | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`     | `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_MARCA`; `CAJA_MOSTRADOR_O_SERVICIO`            | `COORDINACION_DE_OPERACIONES` | `CLIENTE`; `PLATAFORMA_O_CANAL_EXTERNO` | Solicitar, validar capacidad, confirmar, modificar, comunicar y cerrar una reserva o evento son responsabilidades separadas.          |

##### 8.11. Transporte y entregas

| Proceso      | Propietaria | Nombre objetivo                                                                     | Continuadores principales                                   | Apoyos                                                                                      | Control o aceptación             | Externos o técnicos                                                  | Frontera de continuidad                                                                                                                                  |
| ------------ | ----------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------- | -------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0048` | `nexo`      | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho         | `LOGISTICA_Y_TRANSPORTE`                                    | `BODEGA_Y_ABASTECIMIENTO`; `CONDUCTOR_O_RESPONSABLE_DE_RUTA`; `COORDINACION_DE_OPERACIONES` | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`                                            | Logística construye el plan con restricciones reales; conductor y bodega validan factibilidad antes de publicación.                                      |
| `VPROC-0049` | `nexo`      | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente | `CONDUCTOR_O_RESPONSABLE_DE_RUTA`; `LOGISTICA_Y_TRANSPORTE` | `BODEGA_Y_ABASTECIMIENTO`; `RECEPCION_EN_SEDE`                                              | `COORDINACION_DE_OPERACIONES`    | `RECEPTOR_O_DESTINATARIO`                                            | Carga, tránsito, entrega, aceptación, rechazo y retorno conservan custodios y evidencia propios; el conductor no confirma recepción por el destinatario. |
| `VPROC-0050` | `pulso`     | Integrar entrega de tercero con seguimiento, prueba y conciliación interna          | `RESPONSABLE_COMERCIAL`; `LOGISTICA_Y_TRANSPORTE`           | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `CAJA_MOSTRADOR_O_SERVICIO`                            | `GERENCIA_O_SUPERVISION_DE_SEDE` | `PROVEEDOR_LOGISTICO_EXTERNO`; `CLIENTE`; `ADAPTADOR_DE_INTEGRACION` | El tercero informa eventos y prueba; PULSO conserva promesa, comunicación, excepción y cierre comercial.                                                 |

##### 8.12. Finanzas y análisis

| Proceso      | Propietaria | Nombre objetivo                                                                           | Continuadores principales                         | Apoyos                                                       | Control o aceptación                       | Externos o técnicos                                                    | Frontera de continuidad                                                                                                              |
| ------------ | ----------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0051` | `numera`    | Registrar hechos económicos desde eventos operativos y soportes correlacionados           | `RESPONSABLE_FINANCIERO`                          | `RESPONSABLE_DEL_PROCESO`; `RESPONSABLE_ANALITICO`           | `GERENCIA_GENERAL`                         | `FUENTE_DE_DATOS_CANONICA`; `AUTOMATIZACION_ASISTIVA`                  | El dueño del proceso corrige el hecho operativo; finanzas registra y concilia su efecto sin inventar ni reescribir el origen.        |
| `VPROC-0052` | `numera`    | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria             | `RESPONSABLE_FINANCIERO`                          | `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_ANALITICO`            | `GERENCIA_GENERAL`                         | `PROVEEDOR`; `ENTIDAD_FINANCIERA_O_PROVEEDOR_DE_PAGO`                  | Obligación, aprobación, instrucción bancaria, confirmación y conciliación permanecen separadas y correlacionadas.                    |
| `VPROC-0053` | `numera`    | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                | `RESPONSABLE_FINANCIERO`; `RESPONSABLE_COMERCIAL` | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `RESPONSABLE_ANALITICO` | `GERENCIA_GENERAL`                         | `CLIENTE`; `EMPRESA_CLIENTE`; `ENTIDAD_FINANCIERA_O_PROVEEDOR_DE_PAGO` | Gestión de cobro, recepción de fondos, aplicación y diferencia no se cierran por una promesa o comprobante sin conciliación.         |
| `VPROC-0054` | `numera`    | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas | `RESPONSABLE_FINANCIERO`; `RESPONSABLE_ANALITICO` | `RESPONSABLE_DEL_PROCESO`; `COORDINACION_DE_OPERACIONES`     | `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD` | `FUENTE_DE_DATOS_CANONICA`; `AUTOMATIZACION_ASISTIVA`                  | Los responsables de origen explican variaciones; finanzas calcula y gerencia aprueba reglas o cierres sin alterar hechos históricos. |

##### 8.13. Procesos transversales

| Proceso      | Propietaria | Nombre objetivo                                                                                          | Continuadores principales                                      | Apoyos                                                                                                                        | Control o aceptación                       | Externos o técnicos                                                             | Frontera de continuidad                                                                                                                                           |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0055` | `nexo`      | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones  | `RESPONSABLE_DE_INSTALACIONES`; `RESPONSABLE_DE_MANTENIMIENTO` | `EQUIPO_OPERATIVO_DEL_AREA`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | `GERENCIA_O_SUPERVISION_DE_SEDE`           | `TECNICO_O_PRESTADOR_EXTERNO`; `PROVEEDOR`                                      | Reporte, asignación, ejecución, inspección, liberación y cierre permanecen diferenciados; factura o fotografía no prueban cierre por sí solas.                    |
| `VPROC-0056` | `aura`      | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                | `RESPONSABLE_DE_MARCA`                                         | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                       | `GERENCIA_GENERAL`                         | `PLATAFORMA_O_CANAL_EXTERNO`; `ASESOR_O_AUTORIDAD`                              | Creación, revisión, aprobación, programación, publicación y retiro no se concentran en un único paso ni en el canal externo.                                      |
| `VPROC-0057` | `aura`      | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                  | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`   | `RESPONSABLE_DE_MARCA`; `COORDINACION_DE_OPERACIONES`                                                                         | `GERENCIA_O_SUPERVISION_DE_SEDE`           | `CLIENTE_O_PROSPECTO`; `PLATAFORMA_O_CANAL_EXTERNO`; `ADAPTADOR_DE_INTEGRACION` | El canal aporta conversación y contexto; el equipo interno califica, asigna, responde y convierte sin duplicar oportunidad o pedido.                              |
| `VPROC-0058` | `viso`      | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento    | `RESPONSABLE_TECNOLOGICO`                                      | `RESPONSABLE_DEL_PROCESO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`                           | `COORDINACION_DE_OPERACIONES`              | `TRABAJADOR`; `TECNICO_O_PRESTADOR_EXTERNO`; `PROVEEDOR`                        | Diagnóstico, workaround, cambio, restauración, validación y cierre se registran por función; resolver no equivale a eliminar causa.                               |
| `VPROC-0059` | `viso`      | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                 | `RESPONSABLE_TECNOLOGICO`; `RESPONSABLE_DE_PERSONAS`           | `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`                                                      | `GERENCIA_GENERAL`                         | `TRABAJADOR`; `PROVEEDOR`                                                       | Solicitud, aprobación, provisión, entrega, verificación, revisión y revocación deben separar solicitante, aprobador y ejecutor.                                   |
| `VPROC-0060` | `viso`      | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia               | `CUSTODIO_DOCUMENTAL`; `ACTOR_PRODUCTOR_DEL_HECHO_O_EVIDENCIA` | `RESPONSABLE_DEL_PROCESO`; `RESPONSABLE_TECNOLOGICO`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`                                     | `GERENCIA_GENERAL`                         | `ASESOR_O_AUTORIDAD`; `AUTOMATIZACION_ASISTIVA`                                 | El productor aporta evidencia; el custodio clasifica y conserva; la autoridad del proceso aprueba uso, retención o disposición.                                   |
| `VPROC-0061` | `numera`    | Gestionar medición, análisis, decisión de mejora y verificación de resultado                             | `RESPONSABLE_ANALITICO`; `RESPONSABLE_DEL_PROCESO`             | `RESPONSABLE_FINANCIERO`; `COORDINACION_DE_OPERACIONES`                                                                       | `GERENCIA_GENERAL`                         | `FUENTE_DE_DATOS_CANONICA`; `AUTOMATIZACION_ASISTIVA`                           | Analítica formula y verifica; el dueño del proceso ejecuta mejora; gerencia decide sin convertir correlación en causalidad automática.                            |
| `VPROC-0062` | `viso`      | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje | `RESPONSABLE_DE_CONTINUIDAD`; `RESPONSABLE_DEL_PROCESO`        | `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_TECNOLOGICO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `EQUIPO_OPERATIVO_DEL_AREA`       | `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD` | `TECNICO_O_PRESTADOR_EXTERNO`; `PROVEEDOR`; `AUTOMATIZACION_ASISTIVA`           | Contención, operación mínima, recuperación, reconciliación y retorno normal requieren responsables explícitos; ningún proveedor declara recuperación empresarial. |

##### 8.14. Procesos adicionales obligatorios

| Proceso      | Propietaria | Nombre objetivo                                                                                                                                                                                          | Continuadores principales                                                             | Apoyos                                                                       | Control o aceptación             | Externos o técnicos                  | Frontera de continuidad                                                                                                                              |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | -------------------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0063` | `viso`      | `CAP-01.07` — Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; `RESPONSABLE_DEL_PROCESO`                        | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_ANALITICO`   | `GOBIERNO_Y_PROPIEDAD`           | `ASESOR_O_AUTORIDAD`                 | El dueño trata y reporta; riesgo desafía y consolida; gobierno acepta o rechaza el residual sin autoaprobación.                                      |
| `VPROC-0064` | `viso`      | `CAP-01.09` — Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; `CUSTODIO_DOCUMENTAL`; `RESPONSABLE_DEL_PROCESO` | `GERENCIA_GENERAL`                                                           | `GOBIERNO_Y_PROPIEDAD`           | `ASESOR_O_AUTORIDAD`                 | El asesor o autoridad entrega requerimientos; el responsable interno coordina respuesta, evidencia, cumplimiento y cierre.                           |
| `VPROC-0065` | `viso`      | `CAP-02.10` — Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_PERSONAS`                           | `TRABAJADOR`; `RESPONSABLE_ANALITICO`                                        | `GERENCIA_GENERAL`               | —                                    | Objetivos, retroalimentación, respuesta del trabajador, plan de desarrollo y decisión laboral permanecen separados y con privacidad.                 |
| `VPROC-0066` | `viso`      | `CAP-03.03` — Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `BODEGA_Y_ABASTECIMIENTO`                           | `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`                               | `GERENCIA_GENERAL`               | —                                    | SST define requisito y vigencia; bodega entrega; trabajador acepta y devuelve; supervisión no sustituye evidencia de entrega.                        |
| `VPROC-0067` | `nexo`      | `CAP-07.11` — Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `BODEGA_Y_ABASTECIMIENTO`; `CUSTODIO_O_USUARIO_DE_ACTIVO`                             | `AREA_SOLICITANTE`; `RESPONSABLE_DE_CATALOGO`; `LOGISTICA_Y_TRANSPORTE`      | `GERENCIA_O_SUPERVISION_DE_SEDE` | `AUTOMATIZACION_ASISTIVA`            | Definición, armado, verificación, entrega, custodia, devolución y sustitución mantienen componentes y responsables propios.                          |
| `VPROC-0068` | `pulso`     | `CAP-10.06` — Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `RESPONSABLE_ANALITICO`                          | `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`; `RESPONSABLE_DEL_PROCESO`   | `GERENCIA_GENERAL`               | `CLIENTE`; `AUTOMATIZACION_ASISTIVA` | El cliente responde voluntariamente; analítica mide; el dueño del proceso actúa sobre hallazgos sin convertir baja puntuación en reclamo automático. |
| `VPROC-0069` | `numera`    | `CAP-12.11` — Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `RESPONSABLE_FINANCIERO`; `RESPONSABLE_ANALITICO`                                     | `RESPONSABLE_DEL_PROCESO`; `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES` | `GOBIERNO_Y_PROPIEDAD`           | `AUTOMATIZACION_ASISTIVA`            | Áreas preparan supuestos; finanzas consolida; gerencia revisa; gobierno aprueba; presupuesto no autoriza gasto ni crea asiento.                      |

---

#### 9. Fronteras transversales de continuidad

| Frontera                | Decisión                                                                                                                                                         |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| iniciador → continuador | El origen crea o solicita la instancia; el continuador asume trabajo mediante una asignación trazable y no hereda autoridad del iniciador.                       |
| área → área             | Cada transferencia conserva cantidades, documentos, pendientes, custodias y aceptación; no se crea un proceso paralelo para “continuar”.                         |
| aplicación → aplicación | La aplicación propietaria conserva el estado canónico y emite comandos, proyecciones o eventos para consumidoras; una consumidora no mantiene un cierre alterno. |
| humano → automatización | La automatización asiste y registra; no reemplaza la decisión humana sensible ni oculta quién ordenó o aceptó la acción.                                         |
| externo → interno       | El tercero aporta información, ejecución o aceptación por contrato; un actor interno conserva responsabilidad sobre validación y cierre.                         |
| ejecución → control     | Cuando exista aprobación, liberación, conciliación o aceptación, el actor de control deberá distinguirse del ejecutor según la política de segregación.          |
| ausencia o relevo       | La instancia conserva función, responsable anterior, nuevo responsable, razón, pendientes y tiempos; no se borra la asignación previa.                           |

---

#### 10. Compatibilidad con autorización, contexto y privacidad

1. La presencia de una función en este registro no concede permiso ni acceso a la aplicación.
2. Cada acción futura deberá resolver permiso exacto, modalidad, alcance, sede, área, turno, check-in, recurso y estado.
3. Las funciones externas recibirán únicamente proyecciones y acciones mínimas para su participación.
4. Los datos sensibles se limitarán por finalidad y relación con la instancia, incluso cuando el actor sea continuador válido.
5. Un continuador sustituido, inactivo o fuera de contexto perderá capacidad efectiva sin borrar su historial.
6. Las colas offline y sesiones persistentes deberán reautorizarse antes de aplicar un trabajo después de un cambio de actor, contexto o asignación.

---

#### 11. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

| ID              | Regla protegida                                                                                                                                                                                   | Tipo                                          | Prioridad | Momento de implementación                        | Destino                                  |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------- | --------- | ------------------------------------------------ | ---------------------------------------- |
| `TREQ-PROC-033` | Cada `VPROC-*` tiene uno o más continuadores principales internos y listas válidas, disjuntas y catalogadas de apoyos, controles y participantes externos o técnicos.                             | contractual + regresión                       | crítica   | materialización del registro y CI                | `SHELL-CI-017`; E3                       |
| `TREQ-PROC-034` | Todo traspaso conserva identidad de instancia, actor emisor y receptor, función, contexto, territorio, pendientes, tiempos y aceptación sin crear un proceso paralelo.                            | integración + auditoría + E2E                 | crítica   | implementación de asignaciones y transiciones    | E3/E4/E5; `PROC-CAT-012`; `PROC-CAT-018` |
| `TREQ-PROC-035` | Iniciar, continuar, apoyar o ejecutar no concede automáticamente aprobación, liberación, pago, publicación, disposición, acceso, reversión ni cierre; la segregación aplica en acciones críticas. | autorización + seguridad + regresión          | crítica   | implementación de acciones y permisos            | AUTH, servidor, RLS/RPC y paquetes E5    |
| `TREQ-PROC-036` | Terceros, adaptadores y automatizaciones solo actúan mediante contratos delimitados, no son continuadores internos únicos y no modifican directamente estados privados o decisiones sensibles.    | integración + seguridad + idempotencia        | crítica   | portales, adaptadores, jobs y eventos            | BLOQUE X, E3, E4 y E5                    |
| `TREQ-PROC-037` | Un actor inactivo, sustituido, fuera de vínculo, territorio, contexto o asignación no puede continuar trabajo pendiente; la reasignación invalida sesiones y conserva historial.                  | autorización + concurrencia + E2E + regresión | crítica   | implementación de asignaciones, sesiones y colas | AUTH, E3/E4, dispositivos y paquetes E5  |

El detalle completo deberá incorporarse al Registro Canónico de Requisitos de Prueba mediante regeneración integral del archivo.

---

#### 12. Decisiones reservadas

| Decisión                                                | Tarea                                                       |
| ------------------------------------------------------- | ----------------------------------------------------------- |
| estado inicial y tratamiento de borradores              | `PROC-CAT-009`                                              |
| estados intermedios y finales                           | `PROC-CAT-010` y `PROC-CAT-011`                             |
| transiciones normales, excepcionales y de corrección    | `PROC-CAT-012` a `PROC-CAT-014`                             |
| datos de entrada y salida                               | `PROC-CAT-015` y `PROC-CAT-016`                             |
| eventos empresariales                                   | `PROC-CAT-017`                                              |
| auditoría detallada                                     | `PROC-CAT-018`                                              |
| métricas                                                | `PROC-CAT-019`                                              |
| duplicidades                                            | `PROC-CAT-020`                                              |
| mapeo exacto función → rol, permiso, alcance y pantalla | roadmaps de autorización, UX y paquetes E5 correspondientes |

---

#### 13. Validación del registro

```text
PROCESOS CUBIERTOS             69
ASIGNACIONES PRINCIPALES       129
ASIGNACIONES DE APOYO          185
ASIGNACIONES DE CONTROL        74
PARTICIPACIONES EXT./TÉCNICAS  100
FUNCIONES UTILIZADAS           53
PROCESOS SIN CONTINUADOR          0
ACTORES FUERA DEL CATÁLOGO        0
DUPLICADOS ENTRE CLASES           0
PRINCIPAL EXTERNO O TÉCNICO       0
SOLAPAMIENTO PRINCIPAL/CONTROL    0
```

---

#### 14. Criterios de aceptación

- [ ] Están cubiertos exactamente `VPROC-0001` a `VPROC-0069`.
- [ ] Cada proceso conserva la propietaria aprobada en `PROC-CAT-005`.
- [ ] Cada proceso tiene al menos un continuador principal interno.
- [ ] Apoyos, controles y participantes externos o técnicos son explícitos y disjuntos.
- [ ] Todos los actores pertenecen al catálogo de funciones continuadoras.
- [ ] Cada proceso declara una frontera de continuidad y segregación.
- [ ] Ningún tercero o mecanismo técnico gobierna por sí solo un proceso interno.
- [ ] Se distingue continuar, apoyar, controlar, aprobar, aceptar y cerrar.
- [ ] Los traspasos preservan identidad, contexto, pendientes, actores e historial.
- [ ] No se definieron todavía estados, transiciones, datos, eventos ni métricas fuera de su tarea.
- [ ] Se generaron y registraron `TREQ-PROC-033` a `TREQ-PROC-037`.
- [ ] No se modificó código, Supabase, migraciones ni operación.
- [ ] `PROC-CAT-009` permanece como única continuidad inmediata.

---

#### 15. Estado

```text
APROBADA
```

No se inicia `PROC-CAT-009` hasta la aprobación expresa de `PROC-CAT-008`.
