MODELO DE EXPERIENCIA ADMINISTRATIVA

### ✅ UX-ADMIN-001 — Inventariar tareas administrativas por dominio, frecuencia y complejidad

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-ADMIN-001 — Inventariar tareas administrativas por dominio, frecuencia y complejidad`

**Tarea anterior:** `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico` — APROBADA

**Siguiente tarea reservada:** `UX-ADMIN-002 — Diseñar modo guiado para altas y configuraciones complejas` — NO INICIADA

**Artefactos producidos:**

- `UX-ADMIN-DOMAIN-CATALOG-001`;
- `UX-ADMIN-TASK-INVENTORY-001`;
- `UX-ADMIN-FREQUENCY-TAXONOMY-001`;
- `UX-ADMIN-COMPLEXITY-MODEL-001`;
- `UX-ADMIN-EXPERIENCE-ROUTING-MATRIX-001`;
- `UX-ADMIN-OWNERSHIP-BOUNDARY-001`;
- `UX-ADMIN-CARRYOVER-REGISTER-001`;

**Cobertura:** **16 dominios administrativos** y **98 familias de tareas**.

**Naturaleza:** inventario y clasificación documental de trabajo administrativo. No diseña aún pantallas finales, no implementa formularios y no traslada a VISO la propiedad funcional de otras aplicaciones.

**Cambios en código, aplicaciones, rutas, Supabase, tablas, migraciones, RLS, RPC, integraciones, hardware o producción:** no autorizados.

---

#### 1. Propósito

Construir una línea base completa de las tareas que una persona administrativa debe crear, configurar, revisar, aprobar, corregir, conciliar, exportar o auditar en Vento OS. La clasificación permite que las siguientes tareas diseñen experiencias distintas para trabajo ocasional, trabajo experto de alto volumen, aprobaciones sensibles y consulta de auditoría.

```text
PROCESO EMPRESARIAL
-> TAREA ADMINISTRATIVA CONCRETA
-> APLICACION PROPIETARIA
-> ACTOR ADMINISTRATIVO
-> FRECUENCIA Y VOLUMEN
-> COMPLEJIDAD Y RIESGO
-> RUTA DE EXPERIENCIA POSTERIOR
```

El inventario evita dos errores: convertir toda administración en tablas genericas y convertir cada configuración en un asistente lento aunque sea trabajo frecuente de una persona experta.

---

#### 2. Decisiones canónicas

1. Una tarea administrativa es una unidad de trabajo de interfaz; no crea un proceso `VPROC-*` nuevo.
2. VISO administra personas, acceso y configuración transversal, pero no replica formularios propios de NEXO, FOGO, ORIGO, PULSO, NUMERA o PASS.
3. La aplicación propietaria conserva el dato, la regla y la mutacion; VISO podrá mostrar estado, conflicto, resumen o enlace contextual.
4. Frecuencia, volumen, complejidad, riesgo y sensibilidad se clasifican por la tarea, no por el nombre del cargo.
5. Una misma persona podrá usar modo guiado, experto, aprobación o auditoría según la tarea y su autorización efectiva.
6. Las acciones masivas, financieras, de seguridad, privacidad, cierre, reverso y publicación requieren simulación de impacto, motivo y auditoría proporcional.
7. Las tareas operativas resueltas en `UX-STATION-009` no se duplican como administración; solo aparecen aqui sus configuraciones, revisiones y excepciones administrativas.
8. Ninguna fila autoriza AURA, crea un Centro de Distribución físico ni presupone una aplicación nueva no aprobada.

---

#### 3. Dependencias y límites preservados

- `PROC-CAT-001` a `PROC-CAT-020` y `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- `UX-STATION-001` a `UX-STATION-012`;
- la matriz final aprobada por `UX-STATION-009`;
- el catálogo de aplicaciones y permisos de BLOQUES C y D;
- `OPS-CAN-001`, `OPS-LOG-001`, `OPS-B2B-001` y `CAP-TAL-001` a `CAP-TAL-006`;
- los límites de VISO definidos por `VISO-UX-017` y `VISO-UX-018`;
- los mapas funcionales futuros de NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS, TALENTO y SHELL.

Esta tarea no decide el layout final, componentes concretos, rutas, permisos definitivos de cada boton, esquema de base de datos ni mecanismo de sincronizacion.

---

#### 4. Unidad minima del inventario

Cada fila de `UX-ADMIN-TASK-INVENTORY-001` representa:

```text
DOMINIO ADMINISTRATIVO
+ TAREA CON RESULTADO RECONOCIBLE
+ APLICACION PROPIETARIA O FRONTERA DISTRIBUIDA EXPLICITA
+ ACTOR FUNCIONAL
+ FRECUENCIA
+ VOLUMEN
+ COMPLEJIDAD
+ RIESGO
+ RUTA DE EXPERIENCIA
+ NIVEL DE AUDITORIA
```

Los actores de la matriz son familias funcionales y no conceden permisos. La autorización final continuara resolviendose con el modelo `AUTH-*`.

---

#### 5. Taxonomia de frecuencia

| Código        | Definición                                                              |
| ------------- | ----------------------------------------------------------------------- |
| `CONTINUA`    | bandeja o cola revisada durante la jornada; cambia con trabajo entrante |
| `DIARIA`      | se ejecuta normalmente cada día de operación                            |
| `SEMANAL`     | se concentra en programación o revisión semanal                         |
| `MENSUAL`     | se concentra en corte, conciliación o seguimiento mensual               |
| `PERIODICA`   | trimestral, semestral, anual o según calendario de control              |
| `POR_EVENTO`  | se activa por alta, cambio, solicitud, vencimiento o hecho empresarial  |
| `EXCEPCIONAL` | solo ante corrección, incidente, reverso, investigación o emergencia    |

La frecuencia describe recurrencia esperada, no prioridad. Una tarea excepcional puede ser crítica y una tarea diaria puede ser de bajo riesgo.

---

#### 6. Modelo de complejidad

| Clase | Definición                                                                                      |
| ----- | ----------------------------------------------------------------------------------------------- |
| `C1`  | acción breve sobre un objeto, pocos campos y bajo acoplamiento                                  |
| `C2`  | flujo estructurado con validaciones y varias decisiones acotadas                                |
| `C3`  | trabajo experto, alto volumen, analisis, edición masiva o cruce de dominios                     |
| `C4`  | acción sensible, irreversible, regulada, financiera, de seguridad o con segregacion obligatoria |

La complejidad aumenta por cantidad de decisiones, objetos relacionados, volumen, consecuencias, necesidad de comparación, conflicto, segregacion o conocimiento profesional. No aumenta por jerarquía del usuario.

---

#### 7. Riesgo, ruta de experiencia y auditoría

##### 7.1 Riesgo

| Clase | Definición                                                                            |
| ----- | ------------------------------------------------------------------------------------- |
| `R1`  | impacto local y reversible                                                            |
| `R2`  | impacto operativo moderado                                                            |
| `R3`  | impacto empresarial alto o propagacion entre sedes/aplicaciones                       |
| `R4`  | impacto critico en seguridad, dinero, identidad, cumplimiento, custodia o continuidad |

##### 7.2 Ruta de experiencia

| Ruta         | Uso posterior                                                                   |
| ------------ | ------------------------------------------------------------------------------- |
| `RAPIDA`     | acción directa y frecuente con validación inmediata                             |
| `GUIADA`     | pasos secuenciales, explicacion, validación preventiva y resumen final          |
| `EXPERTA`    | tabla, filtros, comparación, atajos, vistas guardadas y detalle progresivo      |
| `APROBACION` | revisión de evidencia, impacto, autoridad y decisión separada                   |
| `MASIVA`     | seleccion multiple, importacion, cambio por lote, simulación y rollback         |
| `AUDITORIA`  | consulta de solo lectura, línea de tiempo, diferencias y exportación controlada |

##### 7.3 Nivel de auditoría

| Nivel | Evidencia minima                                                                  |
| ----- | --------------------------------------------------------------------------------- |
| `A1`  | registro básico de creación y última modificación                                 |
| `A2`  | historial de cambios y actor                                                      |
| `A3`  | antes/después, motivo, alcance y evidencia                                        |
| `A4`  | aprobación, segregacion, versión, correlacion y evidencia inmutable o equivalente |

---

#### 8. Catálogo de dominios administrativos

| Código            | Dominio                                      | Aplicaciones o fronteras principales      | Alcance                                                             |
| ----------------- | -------------------------------------------- | ----------------------------------------- | ------------------------------------------------------------------- |
| `ADM-ORG`         | Gobierno y organización                      | VISO                                      | estructura empresarial, responsabilidades, políticas y delegaciones |
| `ADM-PEOPLE`      | Personas y vinculación                       | TALENTO, VISO y ANIMA                     | candidato, trabajador, expediente, incorporacion y retiro           |
| `ADM-WORKFORCE`   | Programación, asistencia y novedades         | VISO y ANIMA                              | turnos, asignaciones, cobertura, tiempo trabajado y novedades       |
| `ADM-ACCESS`      | Acceso, seguridad y dispositivos             | VISO y SHELL                              | roles, permisos, scopes, excepciones, simulación y dispositivos     |
| `ADM-CATALOG`     | Productos, presentaciones, precios y menus   | NEXO, PULSO y NUMERA                      | maestro físico, proyección comercial y reglas economicas            |
| `ADM-RECIPE`      | Recetas, especificaciones y calidad          | FOGO y NEXO                               | recetas, rendimiento, alergenos, liberacion y reproceso             |
| `ADM-PROCUREMENT` | Proveedores y compras                        | ORIGO y NUMERA                            | proveedores, condiciones, ordenes, aprobación y diferencias         |
| `ADM-INVENTORY`   | Inventario, ubicaciones y políticas de stock | NEXO                                      | ubicaciones, perfiles, conteos, ajustes, cuarentena y movimientos   |
| `ADM-PRODUCTION`  | Planeacion y control de producción           | FOGO y NUMERA                             | capacidad, planes, lotes, recursos, rendimiento y cierre            |
| `ADM-SALES`       | Venta, POS, caja y configuración comercial   | PULSO, PASS y NUMERA                      | terminales, pedidos, promociones, caja y correcciones               |
| `ADM-CUSTOMER`    | Clientes, fidelizacion, reservas y reclamos  | PASS y PULSO                              | puntos, beneficios, identidad cliente, reservas y casos             |
| `ADM-LOGISTICS`   | Logística, remisiones, activos y vehiculos   | NEXO y VISO                               | rutas, despacho, contenedores, activos y excepciones                |
| `ADM-FINANCE`     | Finanzas, costos y conciliaciones            | NUMERA                                    | hechos económicos, cartera, pagos, bancos, costos y cierres         |
| `ADM-CHANNELS`    | Marketing, canales y venta B2B               | VISO, PULSO, PASS y SHELL                 | canales, contenido, campañas, oportunidad B2B y automatización      |
| `ADM-PLATFORM`    | Tecnología, documentos y cumplimiento        | SHELL, VISO y servicio documental E4      | soporte, configuración técnica, evidencia, obligaciones y cambios   |
| `ADM-ANALYTICS`   | Analítica, auditoría y continuidad           | VISO, NUMERA, SHELL y aplicaciones fuente | indicadores, reportes, datos masivos, auditoría y recuperación      |

La columna de aplicaciones no autoriza duplicacion. Cuando aparecen varias, cada una conserva sus hechos y el flujo administrativo posterior deberá enlazar o componer contexto sin crear una segunda fuente de verdad.

---

#### 9. UX-ADMIN-TASK-INVENTORY-001

| ID             | Dominio           | Aplicación propietaria o frontera | Tarea administrativa                                                                  | Actor funcional principal                        | Frecuencia    | Volumen | Complejidad | Riesgo | Ruta de experiencia    | Auditoría |
| -------------- | ----------------- | --------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------ | ------------- | ------- | ----------- | ------ | ---------------------- | --------- |
| `ADM-TASK-001` | `ADM-ORG`         | VISO                              | Gestionar empresas, titulares juridicos y marcas operadas                             | Dirección                                        | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-002` | `ADM-ORG`         | VISO                              | Gestionar establecimientos, sedes, áreas, zonas y centros de costo                    | Gerencia general                                 | `POR_EVENTO`  | `BAJO`  | `C3`        | `R3`   | GUIADA                 | `A3`      |
| `ADM-TASK-003` | `ADM-ORG`         | VISO                              | Definir propietarios de proceso, responsables, suplentes y límites de decisión        | Dirección                                        | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-004` | `ADM-ORG`         | VISO                              | Crear, versionar, aprobar y retirar políticas empresariales                           | Dirección                                        | `PERIODICA`   | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-005` | `ADM-ORG`         | VISO                              | Revisar el impacto de un cambio organizativo antes de publicarlo                      | Dirección y gerencia                             | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | APROBACION + AUDITORIA | `A4`      |
| `ADM-TASK-006` | `ADM-PEOPLE`      | TALENTO / VISO                    | Planear necesidades de personal y autorizar apertura de vacantes                      | Gerencia y talento                               | `SEMANAL`     | `MEDIO` | `C3`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-007` | `ADM-PEOPLE`      | TALENTO                           | Publicar vacantes, requisitos, etapas y criterios de seleccion                        | Talento                                          | `POR_EVENTO`  | `MEDIO` | `C2`        | `R2`   | GUIADA                 | `A3`      |
| `ADM-TASK-008` | `ADM-PEOPLE`      | TALENTO                           | Gestionar candidatos, evaluaciones, entrevistas y decisión de seleccion               | Talento y aprobador                              | `CONTINUA`    | `MEDIO` | `C3`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-009` | `ADM-PEOPLE`      | TALENTO / VISO / ANIMA            | Crear el expediente laboral y completar la incorporacion del trabajador               | Talento y administración                         | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-010` | `ADM-PEOPLE`      | VISO / ANIMA                      | Actualizar datos laborales, estado, vinculación y atributos protegidos                | Administración autorizada                        | `POR_EVENTO`  | `MEDIO` | `C3`        | `R4`   | GUIADA                 | `A4`      |
| `ADM-TASK-011` | `ADM-PEOPLE`      | TALENTO / VISO / SHELL            | Retirar al trabajador y cerrar accesos, custodias, pendientes y documentos            | Talento, gerencia y seguridad                    | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-012` | `ADM-WORKFORCE`   | VISO                              | Gestionar plantillas de turno, jornadas y reglas de programación                      | Gerencia                                         | `PERIODICA`   | `BAJO`  | `C2`        | `R2`   | EXPERTA                | `A3`      |
| `ADM-TASK-013` | `ADM-WORKFORCE`   | VISO                              | Crear, revisar y publicar la programación de turnos                                   | Gerencia de sede                                 | `SEMANAL`     | `ALTO`  | `C3`        | `R3`   | EXPERTA + MASIVA       | `A3`      |
| `ADM-TASK-014` | `ADM-WORKFORCE`   | VISO                              | Asignar sede, área y rol operativo efectivo a cada turno                              | Gerencia de sede                                 | `DIARIA`      | `ALTO`  | `C3`        | `R4`   | EXPERTA + MASIVA       | `A4`      |
| `ADM-TASK-015` | `ADM-WORKFORCE`   | VISO                              | Gestionar reemplazos, rotaciones, ausencias y cobertura de vacantes de turno          | Gerencia y supervision                           | `CONTINUA`    | `MEDIO` | `C2`        | `R3`   | RAPIDA + EXPERTA       | `A3`      |
| `ADM-TASK-016` | `ADM-WORKFORCE`   | ANIMA / VISO                      | Corregir asistencia, check-in, check-out y tiempo trabajado                           | Administración autorizada                        | `DIARIA`      | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-017` | `ADM-WORKFORCE`   | VISO / NUMERA                     | Revisar y aprobar novedades que alimentan pago o control laboral                      | Gerencia y contabilidad                          | `MENSUAL`     | `MEDIO` | `C4`        | `R4`   | APROBACION + AUDITORIA | `A4`      |
| `ADM-TASK-018` | `ADM-ACCESS`      | VISO                              | Gestionar catalogos de roles base y roles operativos                                  | Administrador de seguridad                       | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-019` | `ADM-ACCESS`      | VISO / SHELL                      | Gestionar permisos, alcances, denegaciones y matrices por rol                         | Administrador de seguridad                       | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-020` | `ADM-ACCESS`      | VISO                              | Asignar perfiles, sedes y áreas permitidas a trabajadores                             | Administrador autorizado                         | `POR_EVENTO`  | `ALTO`  | `C3`        | `R4`   | GUIADA + MASIVA        | `A4`      |
| `ADM-TASK-021` | `ADM-ACCESS`      | VISO                              | Gestionar excepciones individuales, delegaciones, vencimientos y revocaciones         | Administrador de seguridad                       | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-022` | `ADM-ACCESS`      | VISO                              | Simular acceso efectivo, comparar origen de permisos y resolver conflictos            | Administrador de seguridad y auditor             | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | AUDITORIA + APROBACION | `A4`      |
| `ADM-TASK-023` | `ADM-ACCESS`      | VISO / SHELL                      | Registrar, activar, suspender, rotar y revocar dispositivos compartidos               | Administrador técnico autorizado                 | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-024` | `ADM-ACCESS`      | VISO                              | Revisar auditoría de seguridad y exportar la matriz de acceso                         | Dirección, auditor y seguridad                   | `PERIODICA`   | `MEDIO` | `C3`        | `R4`   | AUDITORIA + EXPERTA    | `A4`      |
| `ADM-TASK-025` | `ADM-CATALOG`     | NEXO                              | Crear, fusionar, archivar y reactivar la identidad maestra de producto                | Administrador de catálogo                        | `POR_EVENTO`  | `MEDIO` | `C4`        | `R3`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-026` | `ADM-CATALOG`     | NEXO                              | Gestionar unidades, presentaciones, conversiones, codigos y empaques                  | Administrador de catálogo                        | `POR_EVENTO`  | `MEDIO` | `C3`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-027` | `ADM-CATALOG`     | PULSO                             | Gestionar nombre comercial, descripción, imagen y proyección por canal                | Marketing y operación comercial                  | `POR_EVENTO`  | `MEDIO` | `C2`        | `R2`   | GUIADA                 | `A2`      |
| `ADM-TASK-028` | `ADM-CATALOG`     | PULSO / NUMERA                    | Gestionar listas de precios, vigencias, impuestos, cargos y escenarios publicados     | Dirección comercial y finanzas                   | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-029` | `ADM-CATALOG`     | PULSO                             | Gestionar menus, surtido, modificadores y disponibilidad por sede o canal             | Gerencia comercial                               | `DIARIA`      | `ALTO`  | `C2`        | `R3`   | EXPERTA + MASIVA       | `A3`      |
| `ADM-TASK-030` | `ADM-CATALOG`     | NEXO / FOGO / PULSO               | Detectar y resolver duplicados, datos huerfanos y contradicciones del catálogo        | Custodios de datos maestros                      | `PERIODICA`   | `MEDIO` | `C4`        | `R3`   | AUDITORIA + APROBACION | `A4`      |
| `ADM-TASK-031` | `ADM-RECIPE`      | FOGO                              | Crear y versionar recetas y listas de materiales                                      | Responsable técnico de producto                  | `POR_EVENTO`  | `MEDIO` | `C3`        | `R4`   | GUIADA + EXPERTA       | `A4`      |
| `ADM-TASK-032` | `ADM-RECIPE`      | FOGO                              | Definir rendimiento, porcion, unidad productiva y tolerancias                         | Responsable técnico de producto                  | `POR_EVENTO`  | `MEDIO` | `C3`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-033` | `ADM-RECIPE`      | FOGO                              | Gestionar especificaciones, alergenos, manipulacion y criterios de calidad            | Calidad y producción                             | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-034` | `ADM-RECIPE`      | FOGO                              | Aprobar, publicar, restringir o retirar recetas por área y sede                       | Calidad y dirección productiva                   | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | APROBACION             | `A4`      |
| `ADM-TASK-035` | `ADM-RECIPE`      | FOGO / NEXO                       | Gestionar planes de muestreo, liberacion, retención y cuarentena                      | Calidad                                          | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-036` | `ADM-RECIPE`      | FOGO                              | Revisar desviaciones, reproceso, aprovechamiento y estandares de merma                | Producción y calidad                             | `SEMANAL`     | `MEDIO` | `C3`        | `R3`   | EXPERTA + AUDITORIA    | `A3`      |
| `ADM-TASK-037` | `ADM-PROCUREMENT` | ORIGO                             | Gestionar identidad, contactos, documentos y estado de proveedores                    | Compras                                          | `POR_EVENTO`  | `MEDIO` | `C2`        | `R3`   | GUIADA                 | `A3`      |
| `ADM-TASK-038` | `ADM-PROCUREMENT` | ORIGO                             | Gestionar productos por proveedor, precios, mínimos, plazos y condiciones             | Compras                                          | `CONTINUA`    | `ALTO`  | `C3`        | `R3`   | EXPERTA + MASIVA       | `A3`      |
| `ADM-TASK-039` | `ADM-PROCUREMENT` | ORIGO / NUMERA                    | Configurar categorias de solicitud, presupuestos, límites y aprobadores               | Compras, finanzas y dirección                    | `PERIODICA`   | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-040` | `ADM-PROCUREMENT` | ORIGO                             | Crear, modificar, cancelar y emitir ordenes de compra                                 | Compras                                          | `DIARIA`      | `ALTO`  | `C3`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-041` | `ADM-PROCUREMENT` | ORIGO                             | Aprobar, rechazar o devolver solicitudes y ordenes de compra                          | Aprobador de compras                             | `DIARIA`      | `MEDIO` | `C4`        | `R4`   | APROBACION             | `A4`      |
| `ADM-TASK-042` | `ADM-PROCUREMENT` | ORIGO                             | Gestionar diferencias de recepción, devoluciones, reclamos y evaluación del proveedor | Compras y recepción                              | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-043` | `ADM-INVENTORY`   | NEXO                              | Gestionar ubicaciones, estanterias, niveles, zonas y reglas de almacenamiento         | Administrador de inventario                      | `POR_EVENTO`  | `MEDIO` | `C2`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-044` | `ADM-INVENTORY`   | NEXO                              | Gestionar perfiles de inventario, unidades operativas y ubicaciones predeterminadas   | Administrador de inventario                      | `POR_EVENTO`  | `MEDIO` | `C3`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-045` | `ADM-INVENTORY`   | NEXO                              | Configurar mínimos, máximos, reposición, cobertura y políticas de stock               | Planeacion y gerencia                            | `SEMANAL`     | `MEDIO` | `C3`        | `R3`   | EXPERTA + MASIVA       | `A3`      |
| `ADM-TASK-046` | `ADM-INVENTORY`   | NEXO                              | Planear conteos, congelar alcance y asignar responsables                              | Administrador de inventario                      | `PERIODICA`   | `MEDIO` | `C2`        | `R2`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-047` | `ADM-INVENTORY`   | NEXO                              | Revisar diferencias de conteo y aprobar ajustes de existencias                        | Gerencia y administrador de inventario           | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | APROBACION + AUDITORIA | `A4`      |
| `ADM-TASK-048` | `ADM-INVENTORY`   | NEXO                              | Gestionar vencimiento, cuarentena, daño, merma, pérdida y disposicion                 | Inventario y calidad                             | `CONTINUA`    | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-049` | `ADM-INVENTORY`   | NEXO                              | Configurar reglas de movimiento, remision, consolidacion y rutas internas             | Logística y gerencia                             | `PERIODICA`   | `BAJO`  | `C4`        | `R3`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-050` | `ADM-PRODUCTION`  | FOGO                              | Gestionar parametros de demanda, capacidad y calendario productivo                    | Planeacion de producción                         | `SEMANAL`     | `MEDIO` | `C3`        | `R3`   | EXPERTA                | `A3`      |
| `ADM-TASK-051` | `ADM-PRODUCTION`  | FOGO                              | Crear, liberar, reprogramar y cancelar planes u ordenes de producción                 | Planeacion y supervision                         | `DIARIA`      | `ALTO`  | `C3`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-052` | `ADM-PRODUCTION`  | FOGO                              | Configurar numeración de lotes, trazabilidad y reglas de cierre                       | Administrador de producción                      | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-053` | `ADM-PRODUCTION`  | FOGO / VISO                       | Gestionar áreas productivas, recursos, calendarios y capacidad por turno              | Gerencia productiva                              | `PERIODICA`   | `BAJO`  | `C2`        | `R3`   | EXPERTA                | `A3`      |
| `ADM-TASK-054` | `ADM-PRODUCTION`  | FOGO / NUMERA                     | Revisar rendimiento, desperdicio, variaciones y cierre productivo                     | Supervision, calidad y finanzas                  | `SEMANAL`     | `MEDIO` | `C3`        | `R3`   | AUDITORIA + EXPERTA    | `A3`      |
| `ADM-TASK-055` | `ADM-SALES`       | PULSO                             | Gestionar terminales, impresoras, medios de pago y horario del punto                  | Administrador POS                                | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-056` | `ADM-SALES`       | PULSO                             | Gestionar zonas de servicio, mesas, tipos de pedido y reglas de entrega               | Gerencia de sede                                 | `POR_EVENTO`  | `MEDIO` | `C2`        | `R2`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-057` | `ADM-SALES`       | PULSO                             | Publicar catálogo de venta, modificadores, combos y restricciones de canal            | Gerencia comercial                               | `DIARIA`      | `ALTO`  | `C2`        | `R3`   | EXPERTA + MASIVA       | `A3`      |
| `ADM-TASK-058` | `ADM-SALES`       | PULSO / PASS                      | Gestionar descuentos, promociones y límites de autorización                           | Dirección comercial                              | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-059` | `ADM-SALES`       | PULSO / NUMERA                    | Gestionar apertura, cierre, fondos, arqueos y diferencias de caja                     | Caja, supervision y finanzas                     | `DIARIA`      | `ALTO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-060` | `ADM-SALES`       | PULSO / NUMERA                    | Revisar anulaciones, devoluciones, reembolsos y contracargos                          | Supervision y finanzas                           | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | APROBACION + AUDITORIA | `A4`      |
| `ADM-TASK-061` | `ADM-CUSTOMER`    | PASS                              | Configurar acumulación, redención, vencimiento y reglas del ledger de puntos          | Administrador de fidelizacion                    | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-062` | `ADM-CUSTOMER`    | PASS                              | Gestionar beneficios, cupones, elegibilidad y disponibilidad por sede                 | Marketing y fidelizacion                         | `POR_EVENTO`  | `MEDIO` | `C2`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-063` | `ADM-CUSTOMER`    | PASS                              | Resolver duplicados de cliente, consentimientos y solicitudes de privacidad           | Administrador autorizado de clientes             | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-064` | `ADM-CUSTOMER`    | PULSO / PASS                      | Gestionar reservas, eventos, capacidad, anticipos y condiciones                       | Servicio y gerencia                              | `CONTINUA`    | `MEDIO` | `C2`        | `R3`   | EXPERTA + GUIADA       | `A3`      |
| `ADM-TASK-065` | `ADM-CUSTOMER`    | PULSO / PASS                      | Revisar reclamos, devoluciones, compensaciones y cierre de casos                      | Gerencia y servicio al cliente                   | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-066` | `ADM-LOGISTICS`   | NEXO                              | Configurar rutas, cortes, ventanas y prioridades de entrega                           | Logística                                        | `SEMANAL`     | `MEDIO` | `C2`        | `R3`   | EXPERTA                | `A3`      |
| `ADM-TASK-067` | `ADM-LOGISTICS`   | NEXO                              | Planear despacho, vehículo, conductor, carga y capacidad                              | Logística y supervision                          | `DIARIA`      | `ALTO`  | `C3`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-068` | `ADM-LOGISTICS`   | NEXO                              | Gestionar tipos de contenedor, LPN, retorno, deposito y custodia                      | Logística e inventario                           | `POR_EVENTO`  | `MEDIO` | `C3`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-069` | `ADM-LOGISTICS`   | NEXO / VISO                       | Gestionar activos, custodia, mantenimiento, garantía y baja                           | Administración y responsable de activo           | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-070` | `ADM-LOGISTICS`   | NEXO                              | Gestionar vehiculos, documentos, combustible y disponibilidad                         | Logística y gerencia                             | `DIARIA`      | `MEDIO` | `C2`        | `R3`   | EXPERTA                | `A3`      |
| `ADM-TASK-071` | `ADM-LOGISTICS`   | NEXO                              | Revisar excepciones de entrega, pérdida, daño y transportador externo                 | Logística y gerencia                             | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-072` | `ADM-FINANCE`     | NUMERA                            | Mapear hechos operativos a hechos económicos sin duplicar registros                   | Contabilidad y arquitectura financiera           | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-073` | `ADM-FINANCE`     | NUMERA                            | Gestionar centros de costo, presupuestos, supuestos y escenarios                      | Dirección y finanzas                             | `MENSUAL`     | `MEDIO` | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-074` | `ADM-FINANCE`     | NUMERA                            | Registrar y revisar gastos, soportes, clasificación y correcciones                    | Contabilidad y auxiliar autorizada               | `DIARIA`      | `ALTO`  | `C3`        | `R4`   | GUIADA + EXPERTA       | `A4`      |
| `ADM-TASK-075` | `ADM-FINANCE`     | NUMERA                            | Gestionar cuentas por pagar, propuestas de pago y aprobaciones                        | Contabilidad, tesoreria y dirección              | `DIARIA`      | `MEDIO` | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-076` | `ADM-FINANCE`     | NUMERA                            | Gestionar cuentas por cobrar, vencimientos, recaudos y acuerdos                       | Contabilidad y cartera                           | `DIARIA`      | `MEDIO` | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-077` | `ADM-FINANCE`     | NUMERA                            | Conciliar ventas, pagos, bancos, caja, compras y recepciones                          | Contabilidad                                     | `DIARIA`      | `ALTO`  | `C4`        | `R4`   | EXPERTA + AUDITORIA    | `A4`      |
| `ADM-TASK-078` | `ADM-FINANCE`     | NUMERA                            | Calcular costos, variaciones, margen y rentabilidad trazable                          | Dirección y contabilidad                         | `MENSUAL`     | `ALTO`  | `C4`        | `R4`   | EXPERTA + AUDITORIA    | `A4`      |
| `ADM-TASK-079` | `ADM-FINANCE`     | NUMERA                            | Cerrar, bloquear y reabrir periodos con control de impacto                            | Contabilidad y dirección                         | `MENSUAL`     | `BAJO`  | `C4`        | `R4`   | APROBACION + AUDITORIA | `A4`      |
| `ADM-TASK-080` | `ADM-FINANCE`     | NUMERA                            | Emitir reportes y exportar o integrar información contable y fiscal                   | Contabilidad autorizada                          | `MENSUAL`     | `MEDIO` | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-081` | `ADM-CHANNELS`    | VISO / SHELL                      | Gestionar endpoints de canal, propietarios, suplentes y referencias de credencial     | Marketing, administración y tecnología           | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-082` | `ADM-CHANNELS`    | VISO / canal externo              | Planear, aprobar y publicar calendario de contenido                                   | Marketing y aprobador                            | `SEMANAL`     | `MEDIO` | `C2`        | `R2`   | EXPERTA + APROBACION   | `A3`      |
| `ADM-TASK-083` | `ADM-CHANNELS`    | PASS / marketing                  | Gestionar campañas, audiencias, consentimientos y plantillas                          | Marketing y privacidad                           | `POR_EVENTO`  | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-084` | `ADM-CHANNELS`    | PULSO / VISO                      | Gestionar oportunidad B2B, cotizacion, terminos, aprobaciones y traspaso              | Comercial, dirección y operaciones               | `CONTINUA`    | `MEDIO` | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-085` | `ADM-CHANNELS`    | SHELL / integraciones             | Configurar enrutamiento, automatización, respuestas y escalamiento de canales         | Marketing y tecnología                           | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-086` | `ADM-PLATFORM`    | SHELL                             | Gestionar solicitudes de soporte, incidentes, problemas y resolución                  | Soporte tecnologico                              | `CONTINUA`    | `MEDIO` | `C3`        | `R3`   | EXPERTA + AUDITORIA    | `A3`      |
| `ADM-TASK-087` | `ADM-PLATFORM`    | SHELL                             | Gestionar aplicaciones, ambientes, endpoints y referencias de credenciales            | Administrador técnico                            | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-088` | `ADM-PLATFORM`    | SHELL / VISO                      | Gestionar perfiles y asignación de impresoras, escáneres y dispositivos               | Soporte tecnologico                              | `POR_EVENTO`  | `MEDIO` | `C2`        | `R3`   | GUIADA + EXPERTA       | `A3`      |
| `ADM-TASK-089` | `ADM-PLATFORM`    | Servicio documental E4 / VISO     | Gestionar tipos documentales, plantillas, clasificación y retención                   | Gobierno de información                          | `PERIODICA`   | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-090` | `ADM-PLATFORM`    | VISO / aplicación propietaria     | Gestionar inspecciones, listas de control, obligaciones y acciones correctivas        | Calidad, SST y responsables de sede              | `PERIODICA`   | `MEDIO` | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-091` | `ADM-PLATFORM`    | SHELL                             | Gestionar releases, cambios, feature flags, rollback y ventanas de mantenimiento      | Tecnología y aprobador                           | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-092` | `ADM-PLATFORM`    | VISO / SHELL / PASS / TALENTO     | Gestionar solicitudes de acceso a datos, privacidad y conservacion de evidencia       | Privacidad, seguridad y custodio del dominio     | `POR_EVENTO`  | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-093` | `ADM-ANALYTICS`   | VISO / NUMERA / aplicación fuente | Definir indicadores, dimensiones, propietario, fórmula y versión                      | Dirección y custodios de datos                   | `POR_EVENTO`  | `MEDIO` | `C4`        | `R3`   | EXPERTA + APROBACION   | `A4`      |
| `ADM-TASK-094` | `ADM-ANALYTICS`   | VISO / NUMERA                     | Crear, guardar, compartir y programar tableros o reportes                             | Dirección y analistas autorizados                | `SEMANAL`     | `MEDIO` | `C2`        | `R2`   | EXPERTA                | `A3`      |
| `ADM-TASK-095` | `ADM-ANALYTICS`   | Aplicación propietaria            | Gestionar importaciones, exportaciones y campañas de corrección masiva                | Administrador de datos                           | `POR_EVENTO`  | `ALTO`  | `C4`        | `R4`   | MASIVA + APROBACION    | `A4`      |
| `ADM-TASK-096` | `ADM-ANALYTICS`   | VISO                              | Revisar auditoría, investigar anomalías y conservar conclusiones                      | Auditor, seguridad y dirección                   | `EXCEPCIONAL` | `MEDIO` | `C4`        | `R4`   | AUDITORIA              | `A4`      |
| `ADM-TASK-097` | `ADM-ANALYTICS`   | SHELL / VISO                      | Gestionar planes de contingencia, formularios manuales y arboles de contacto          | Continuidad y responsables de proceso            | `PERIODICA`   | `BAJO`  | `C4`        | `R4`   | GUIADA + APROBACION    | `A4`      |
| `ADM-TASK-098` | `ADM-ANALYTICS`   | SHELL / aplicación propietaria    | Ejecutar reconciliacion, recuperación y cierre posterior a incidente                  | Continuidad, tecnología y propietario de proceso | `EXCEPCIONAL` | `MEDIO` | `C4`        | `R4`   | GUIADA + AUDITORIA     | `A4`      |

---

#### 10. Resumen cuantitativo del inventario

- dominios: **16**;
- familias de tareas: **98**;
- frecuencia: `CONTINUA` 7; `DIARIA` 14; `SEMANAL` 9; `MENSUAL` 5; `PERIODICA` 11; `POR_EVENTO` 50; `EXCEPCIONAL` 2;
- complejidad: `C1` 0; `C2` 18; `C3` 23; `C4` 57;
- riesgo: `R1` 0; `R2` 7; `R3` 28; `R4` 63.

El inventario no se interpreta como cantidad de pantallas. Varias tareas pueden compartir una superficie experta; una tarea puede requerir variantes guiada, aprobación y auditoría sin duplicar el hecho empresarial.

Ninguna familia queda en `C1` porque el inventario agrupa resultados administrativos completos. Las microacciones `C1` se identificaran al descomponer cada flujo en `UX-ADMIN-002` a `UX-ADMIN-004`.

---

#### 11. Reglas de propiedad y composicion

- VISO es propietario de organización, personas, programación, acceso, configuración transversal y auditoría de seguridad.
- TALENTO conserva candidato, seleccion y vinculación; ANIMA conserva experiencia laboral y hechos de asistencia que le pertenezcan.
- NEXO conserva inventario, ubicaciones, movimientos, remisiones, logística, contenedores y activos cuando el dominio se apruebe alli.
- FOGO conserva recetas, planeacion y ejecucion productiva, calidad y rendimiento productivo.
- ORIGO conserva proveedor, solicitud, orden, aprobación de compra y recepción contractual.
- PULSO conserva catálogo de venta proyectado, pedido, POS, caja y correcciones comerciales.
- PASS conserva identidad de cliente, consentimiento, fidelizacion, beneficios y ledger de puntos.
- NUMERA conserva hechos económicos, conciliación, costos, cartera, cierres y analítica financiera dentro del alcance que apruebe `NUMERA-DOM-*`.
- SHELL conserva capacidades técnicas transversales, configuración de plataforma, contratos compartidos y soporte que no pertenezca a una aplicación funcional.
- VISO podrá enlazar, resumir y mostrar dependencias de otros dominios, pero `VISO-UX-017` y `VISO-UX-018` impediran duplicar sus formularios o mutaciones.

---

#### 12. Candidatos para UX-ADMIN-002

El modo guiado deberá priorizar tareas `C2` a `C4` de baja o media frecuencia donde el usuario necesita comprender requisitos, dependencias, impacto y resultado antes de guardar. Incluye, como minimo:

- `ADM-TASK-001 a ADM-TASK-005`;
- `ADM-TASK-009 a ADM-TASK-011`;
- `ADM-TASK-016 a ADM-TASK-023`;
- `ADM-TASK-025 a ADM-TASK-035`;
- `ADM-TASK-039 a ADM-TASK-042`;
- `ADM-TASK-047 a ADM-TASK-049`;
- `ADM-TASK-052`;
- `ADM-TASK-055`;
- `ADM-TASK-058 a ADM-TASK-065`;
- `ADM-TASK-069 a ADM-TASK-072`;
- `ADM-TASK-079 a ADM-TASK-081`;
- `ADM-TASK-083 a ADM-TASK-085`;
- `ADM-TASK-087 a ADM-TASK-092`;
- `ADM-TASK-095 a ADM-TASK-098`;

La lista es entrada de diseño, no obligacion de crear un asistente separado por fila.

---

#### 13. Candidatos para UX-ADMIN-003

El modo experto deberá priorizar tareas frecuentes, de alto volumen, analiticas o masivas, entre ellas:

- `ADM-TASK-008`;
- `ADM-TASK-013 a ADM-TASK-015`;
- `ADM-TASK-024`;
- `ADM-TASK-028 a ADM-TASK-030`;
- `ADM-TASK-036`;
- `ADM-TASK-038`;
- `ADM-TASK-040`;
- `ADM-TASK-043 a ADM-TASK-046`;
- `ADM-TASK-050 a ADM-TASK-054`;
- `ADM-TASK-057`;
- `ADM-TASK-059`;
- `ADM-TASK-064`;
- `ADM-TASK-066 a ADM-TASK-068`;
- `ADM-TASK-070`;
- `ADM-TASK-073 a ADM-TASK-078`;
- `ADM-TASK-080`;
- `ADM-TASK-082`;
- `ADM-TASK-084`;
- `ADM-TASK-086`;
- `ADM-TASK-093 a ADM-TASK-096`;

Estas superficies deberán admitir busqueda, filtros, vistas guardadas, densidad adaptable, teclado, comparación y edición por lote solo cuando la autorización lo permita.

---

#### 14. Reglas para aprobación, acciones masivas y auditoría

1. Crear o editar no equivaldra a aprobar ni publicar.
2. Toda aprobación mostrara objeto, versión, solicitante, diferencias, impacto, alcance y evidencia.
3. Toda acción masiva mostrara seleccion, exclusiones, simulación, errores parciales y estrategia de reversión o corrección.
4. Un exporte será una capacidad independiente, con filtros, actor, fecha, finalidad y clasificación de información.
5. La auditoría será de solo lectura salvo acciones explicitas de anotacion o apertura de un caso separado.
6. Cerrar, reabrir, anular, revocar, fusionar, archivar o eliminar requerira motivo estructurado y consecuencia visible.
7. Las vistas administrativas aplicaran alcance de empresa, sede, área y centro de costo; no ofreceran selectores que amplien autoridad.
8. Ninguna tabla permitira edición masiva de campos sensibles sin permiso atomico, validación y evidencia proporcional.

---

#### 15. Banderas obligatorias por tarea

Durante `UX-ADMIN-002` a `UX-ADMIN-004`, cada familia deberá declarar cuando aplique: datos sensibles; segregacion; doble aprobación; territorialidad; vigencia; versión; borrador; conflicto; importacion; exportación; eliminación; reversión; offline; adjuntos; notificación; SLA; ayuda contextual; impacto cruzado y enlace a aplicación propietaria.

Una bandera ausente no se interpretara como `NO_APLICA`; deberá justificarse en el contrato de pantalla posterior.

---

#### 16. Carryovers con destino exacto

| Carryover     | Condicion                                                                 | Tarea propietaria de cierre         |
| ------------- | ------------------------------------------------------------------------- | ----------------------------------- |
| `C-ADMIN-001` | Seleccionar patrones concretos de modo guiado                             | `UX-ADMIN-002`                      |
| `C-ADMIN-002` | Seleccionar patrones concretos de modo experto, consulta y edición masiva | `UX-ADMIN-003`                      |
| `C-ADMIN-003` | Definir ayudas, validación preventiva y vista previa de impacto           | `UX-ADMIN-004`                      |
| `C-ADMIN-004` | Validar flujos representativos con administradores y cerrar fricciones    | `UX-ADMIN-005 y VISO-UX-020`        |
| `C-ADMIN-005` | Cerrar contratos de cada pantalla y su propiedad funcional                | `PROC-SCREEN-001 a PROC-SCREEN-028` |
| `C-ADMIN-006` | Cerrar alcance financiero que aún dependa de frontera contable o fiscal   | `NUMERA-DOM-001 a NUMERA-DOM-018`   |
| `C-ADMIN-007` | Implementar retención, documentos y evidencia como servicio transversal   | `EVID-ARC-001 a EVID-ARC-010`       |
| `C-ADMIN-008` | Materializar paquetes, readiness, piloto y rollback                       | `BLOQUE E5 y BLOQUE U`              |

No queda pendiente narrativo sin tarea y momento de resolución.

---

#### 17. Requisitos de prueba derivados

**Resultado:** GENERA 24 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-320` a `TREQ-UX-343` al Registro Canónico completo. Todos quedan en `IDENTIFICADO`; su implementacion y evidencia pertenecen a `UX-ADMIN-002` a `UX-ADMIN-005`, `PROC-SCREEN-*`, los subbloques por aplicación, paquetes E5 y BLOQUE U.

---

#### 18. Criterios de aceptacion

- [x] Se distinguen tarea administrativa, proceso empresarial, pantalla, aplicación y permiso.
- [x] Se cubren 16 dominios y 98 familias sin duplicar operación de estaciones.
- [x] Cada fila declara propietario o frontera distribuida explícita.
- [x] Cada fila declara actor funcional, frecuencia, volumen, complejidad, riesgo, ruta y auditoría.
- [x] La frecuencia no se confunde con prioridad y la complejidad no depende de jerarquía.
- [x] Se preserva la propiedad funcional de NEXO, FOGO, ORIGO, PULSO, PASS, NUMERA, TALENTO, ANIMA y SHELL.
- [x] VISO no se convierte en un formulario universal.
- [x] Se identifican candidatos para modo guiado y modo experto.
- [x] Se protegen aprobaciones, acciones masivas, exportaciones, reversiones y datos sensibles.
- [x] Todos los carryovers tienen tarea propietaria exacta.
- [x] Se incorporan TREQ-UX-320 a TREQ-UX-343.
- [x] No se implementa código, Supabase, rutas, componentes ni cambios productivos.
- [x] UX-ADMIN-002 permanece no iniciada.

---

#### 19. Resultado y continuidad

```text
UX-STATION-009 APROBADA
UX-ADMIN-001 APROBADA
UX-ADMIN-002 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-ADMIN-002 — Diseñar modo guiado para altas y configuraciones complejas
```


### ✅ UX-ADMIN-002 — Diseñar modo guiado para altas y configuraciones complejas

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-ADMIN-002 — Diseñar modo guiado para altas y configuraciones complejas`

**Tarea anterior:** `UX-ADMIN-001 — Inventariar tareas administrativas por dominio, frecuencia y complejidad` — APROBADA

**Siguiente tarea reservada:** `UX-ADMIN-003 — Diseñar modo experto para consulta, edición masiva y auditoría` — NO INICIADA

**Artefactos producidos:**

- `UX-ADMIN-GUIDED-MODE-CONTRACT-001`;
- `UX-ADMIN-GUIDED-APPLICABILITY-RULES-001`;
- `UX-ADMIN-GUIDED-FLOW-TAXONOMY-001`;
- `UX-ADMIN-GUIDED-STEP-GRAMMAR-001`;
- `UX-ADMIN-GUIDED-DRAFT-RESUME-CONTRACT-001`;
- `UX-ADMIN-GUIDED-VALIDATION-CONTRACT-001`;
- `UX-ADMIN-GUIDED-REVIEW-COMMIT-CONTRACT-001`;
- `UX-ADMIN-GUIDED-ERROR-RECOVERY-CONTRACT-001`;
- `UX-ADMIN-GUIDED-ROUTING-MATRIX-001`;
- `UX-ADMIN-GUIDED-CARRYOVER-REGISTER-001`.

**Cobertura:** las **64 familias candidatas a guía** identificadas por `UX-ADMIN-001`, agrupadas en **10 arquetipos reutilizables**.

**Naturaleza:** contrato documental transversal del modo guiado administrativo. No diseña todavía cada pantalla física, no implementa un componente universal y no obliga a que toda tarea administrativa sea un asistente.

**Cambios en código, aplicaciones, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, integraciones, hardware o producción:** no autorizados.

---

#### 1. Propósito

Definir una forma común de conducir altas, configuraciones infrecuentes, cambios sensibles y casos complejos para que una persona autorizada pueda completar la tarea sin depender de memoria, mensajes externos o conocimiento técnico informal.

```text
INTENCIÓN CLARA
→ ALCANCE VISIBLE
→ REQUISITOS Y DEPENDENCIAS
→ DATOS Y RELACIONES NECESARIOS
→ VALIDACIÓN PREVENTIVA
→ REVISIÓN DE DIFERENCIAS E IMPACTO
→ GUARDAR, ENVIAR, APROBAR O PUBLICAR
→ RESULTADO Y SIGUIENTE ACCIÓN
```

El modo guiado reduce ambigüedad y errores; no sustituye autorización, validación del servidor, segregación, auditoría ni conocimiento profesional cuando el proceso lo exige.

---

#### 2. Decisiones canónicas

1. El modo guiado se selecciona por la tarea, su variante y su riesgo; no por aplicación, cargo o nivel jerárquico.
2. Una guía no será un formulario largo partido arbitrariamente en páginas.
3. La persona verá solo pasos aplicables a su caso; las ramas omitidas quedarán justificadas por reglas visibles y reproducibles.
4. Volver a un paso anterior no perderá información ni ejecutará efectos empresariales.
5. `Guardar borrador`, `Enviar a revisión`, `Aprobar`, `Aplicar`, `Publicar`, `Cancelar` y `Descartar` serán acciones distintas cuando produzcan efectos distintos.
6. La revisión final mostrará diferencias, alcance, vigencia, dependencias, advertencias y efecto esperado antes de toda escritura material.
7. La guía no concederá permiso por haber permitido avanzar; el servidor revalidará actor, territorio, versión, estado, segregación y capacidad exacta al guardar o decidir.
8. Una tarea frecuente o masiva podrá usar modo experto como superficie principal y conservar una envolvente guiada solo para iniciar, simular, aprobar, publicar o cerrar.
9. Los borradores no serán fuente de verdad ni producirán efectos operativos, financieros, de acceso o publicación hasta la transición autorizada.
10. Cuando la aplicación propietaria sea otra, la guía orquestará el traspaso y preservará contexto; no duplicará la mutación en VISO.
11. No habrá confirmación positiva si el resultado del servidor es desconocido, parcial o incompatible con la versión revisada.
12. Las ayudas posteriores de `UX-ADMIN-004` complementarán esta estructura sin cambiar sus estados ni semántica.

---

#### 3. Dependencias y límites preservados

Esta tarea consume y no reemplaza:

- `UX-ADMIN-001` y sus 16 dominios, 98 familias, clases `C1` a `C4`, riesgos `R1` a `R4` y rutas de experiencia;
- `UX-BASE-001` a `UX-BASE-015`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- `UX-STATION-001` a `UX-STATION-012` y la matriz aprobada por `UX-STATION-009`;
- los contratos de identidad, contexto, autorización, territorialidad y segregación `AUTH-*`;
- la propiedad funcional de VISO, TALENTO, ANIMA, NEXO, FOGO, ORIGO, PULSO, PASS, NUMERA y SHELL;
- los procesos `VPROC-0001` a `VPROC-0069` y sus estados, transiciones, acciones excepcionales y auditoría;
- la obligación de vincular todo vacío a una tarea propietaria concreta.

Esta tarea no fija rutas URL, componentes React, estructura de tablas, nombres de RPC, esquemas de borrador, mecanismo de autenticación reforzada, diseño visual final ni presupuesto de implementación.

---

#### 4. Definición canónica de modo guiado

El modo guiado es una superficie administrativa secuencial y reanudable que:

- explica qué se va a lograr;
- identifica requisitos antes de solicitar datos;
- divide decisiones por intención, no por columnas técnicas;
- muestra alcance y aplicación propietaria;
- valida progresivamente;
- conserva borrador cuando corresponda;
- permite revisar el efecto antes de comprometerlo;
- separa preparación, aprobación, aplicación y publicación;
- produce un resultado inequívoco y auditable.

```text
MODO GUIADO
≠ CAPACITACIÓN EMBEBIDA COMPLETA
≠ FORMULARIO MULTIPÁGINA UNIVERSAL
≠ AUTORIZACIÓN
≠ APROBACIÓN AUTOMÁTICA
≠ SUSTITUTO DEL MODO EXPERTO
≠ COPIA DE LA LÓGICA DEL SERVIDOR
```

---

#### 5. Regla de aplicabilidad

##### 5.1 Uso principal obligatorio

El modo guiado será la ruta principal cuando confluyan una o más de estas condiciones:

- alta de una entidad maestra o relación estructural;
- tarea `C3` o `C4` de frecuencia baja, periódica, por evento o excepcional;
- impacto en identidad, acceso, dinero, privacidad, calidad, custodia, cumplimiento o continuidad;
- múltiples prerrequisitos o dependencias entre dominios;
- versión, vigencia, aprobación o publicación separadas;
- corrección, fusión, reverso, retiro, cierre, reapertura o disposición;
- necesidad de evidencia, motivo o simulación de impacto;
- riesgo de crear referencias huérfanas o duplicar una fuente de verdad.

##### 5.2 Uso complementario o envolvente

Podrá envolver un modo experto cuando la preparación requiera tabla, comparación, edición densa o selección masiva, pero el inicio, simulación, revisión, aprobación, publicación o cierre necesiten control secuencial.

##### 5.3 Casos donde no será la superficie principal

No deberá imponerse como ruta ordinaria para:

- consulta de solo lectura;
- trabajo continuo o diario de alto volumen;
- edición repetitiva de múltiples filas;
- investigación libre de auditoría;
- una microacción reversible con un único dato y sin dependencias;
- tareas operativas ya resueltas por `UX-STATION-*`;
- selecciones masivas que necesiten comparación simultánea.

Cuando una excepción dentro de estos casos sea sensible, se abrirá una rama guiada puntual sin convertir toda la superficie en asistente.

---

#### 6. Arquetipos de flujo guiado

| Código                             | Arquetipo                                                | Resultado que guía                                                                   | No debe convertirse en                                                    |
| ---------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `GF-01_ALTA_MAESTRA`               | Alta o modificación estructural de una entidad           | entidad creada o modificada con identidad, relaciones, vigencia y propietario claros | formulario largo que mezcle todos los subdominios                         |
| `GF-02_RELACION_Y_ALCANCE`         | Configuración de relaciones, cobertura y reglas          | relación válida entre objetos, territorios, versiones y responsables                 | selector que amplíe autoridad o genere referencias huérfanas              |
| `GF-03_ACCESO_Y_SEGURIDAD`         | Roles, permisos, perfiles, excepciones y dispositivos    | acceso previsto, simulado, aprobado, vigente y auditable                             | mecanismo que conceda permisos por visibilidad del botón o nombre del rol |
| `GF-04_VERSION_Y_PUBLICACION`      | Borrador, versión, vigencia y publicación                | versión revisada y publicada en el alcance correcto                                  | edición directa de la versión vigente sin historial                       |
| `GF-05_REVISION_Y_DECISION`        | Aprobación, rechazo, devolución o cierre                 | decisión separada con evidencia, impacto y autoridad válidos                         | segunda edición disfrazada de aprobación                                  |
| `GF-06_EXCEPCION_Y_CORRECCION`     | Diferencia, corrección, reverso, fusión o disposición    | excepción resuelta sin borrar el hecho original                                      | sobrescritura silenciosa o motivo libre insuficiente                      |
| `GF-07_ORQUESTACION_TRANSVERSAL`   | Flujo que cruza aplicaciones o propietarios              | traspaso único, contextual y trazable entre dominios                                 | copia paralela de maestros o redigitación del mismo hecho                 |
| `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | Privacidad, calidad, documentos, inspecciones y soportes | obligación o caso resuelto con evidencia y conservación apropiadas                   | repositorio documental sin decisión ni trazabilidad                       |
| `GF-09_CONFIGURACION_TECNICA`      | Equipo, endpoint, integración, impresora o regla técnica | configuración probada y activada con rollback o revocación                           | guardar parámetros sin prueba ni estado de salud                          |
| `GF-10_CONTINUIDAD_Y_RECUPERACION` | Release, contingencia, recuperación y conciliación       | cambio o recuperación controlados con puerta, resultado y cierre                     | acción técnica irreversible sin plan de retorno                           |

Los arquetipos son contratos reutilizables. Una familia podrá combinar dos, pero deberá existir un arquetipo principal que determine el resultado, la secuencia y la semántica de cierre.

---

#### 7. Contrato mínimo de una definición guiada

Cada flujo guiado deberá declarar antes de diseñar su pantalla:

| Grupo       | Campos mínimos                                                                                   |
| ----------- | ------------------------------------------------------------------------------------------------ |
| identidad   | `guided_flow_id`, versión, `ADM-TASK-*`, proceso y aplicación propietaria                        |
| intención   | alta, edición, corrección, aprobación, publicación, retiro, recuperación u otra intención exacta |
| objeto      | tipo de objeto, identificador humano, versión y estado actual cuando exista                      |
| alcance     | empresa, sede, área, centro de costo, canal, periodo, vigencia o población aplicables            |
| actor       | actor efectivo, permiso requerido, segregación y política de aprobación                          |
| pasos       | pasos aplicables, condición de entrada, condición de salida y dependencias                       |
| borrador    | propietario, estado, versión base, fecha, caducidad y política de reanudación                    |
| validación  | reglas locales, remotas, de duplicado, conflicto, dependencia y autorización                     |
| impacto     | diferencias, consumidores, objetos afectados, vigencia y riesgos                                 |
| escritura   | acción final, idempotencia, aplicación propietaria, resultado parcial y compensación             |
| evidencia   | motivo, adjuntos, comentarios, auditoría y receipt                                               |
| continuidad | cancelación, reintento, resultado desconocido, retorno y siguiente acción                        |

Los nombres son conceptuales; la implementación posterior podrá materializarlos sin perder su significado.

---

#### 8. Gramática canónica de pasos

| Código conceptual     | Paso                      | Contenido mínimo                                                           |
| --------------------- | ------------------------- | -------------------------------------------------------------------------- |
| `GS0_PURPOSE`         | Propósito y resultado     | qué se hará, qué no se hará y qué efecto puede producir                    |
| `GS1_SCOPE`           | Alcance                   | empresa, sede, área, periodo, canal, población y aplicación propietaria    |
| `GS2_PREREQUISITES`   | Requisitos                | dependencias, documentos, estados previos, permisos y bloqueos conocidos   |
| `GS3_CORE_DATA`       | Datos esenciales          | identidad y atributos indispensables para el resultado                     |
| `GS4_RELATIONS_RULES` | Relaciones y reglas       | vínculos, vigencia, conversiones, responsables, límites o condiciones      |
| `GS5_EVIDENCE`        | Evidencia                 | motivo, soportes, observaciones y datos sensibles estrictamente necesarios |
| `GS6_VALIDATE`        | Validación integral       | duplicados, conflictos, versión, dependencias, autoridad y consistencia    |
| `GS7_REVIEW_IMPACT`   | Revisión e impacto        | antes/después, alcance, exclusiones, efectos posteriores y advertencias    |
| `GS8_COMMIT_DECIDE`   | Guardar, enviar o decidir | acción exacta según permiso, segregación y estado                          |
| `GS9_RECEIPT_NEXT`    | Resultado                 | receipt, objetos creados o modificados, pendientes y siguiente acción      |

Reglas:

1. No todos los flujos usarán los diez pasos.
2. Los pasos aplicables se calcularán antes de mostrar progreso.
3. Un paso tendrá un nombre cotidiano relacionado con el trabajo; no se mostrará `GS3_CORE_DATA` al usuario.
4. El objetivo ordinario será mantener entre tres y siete etapas visibles. Si se requieren más, se agruparán por secciones y se justificará la carga cognitiva.
5. Un paso no se creará únicamente para alojar un campo.
6. Los pasos opcionales se identificarán; un dato condicional no aparecerá como sorpresa al final.
7. El sistema no avanzará automáticamente después de una elección sensible.
8. La acción principal del paso describirá el resultado inmediato: `Continuar`, `Revisar cambios`, `Enviar a aprobación` o equivalente; no se usará `Aceptar` de forma genérica.

---

#### 9. Navegación y progreso

- El encabezado mostrará tarea, objeto, alcance y estado del borrador.
- El indicador de progreso mostrará solo etapas aplicables y distinguirá completada, actual, pendiente y bloqueada.
- La persona podrá volver a pasos editables sin perder datos.
- Al cambiar un dato que invalida pasos posteriores, la guía marcará qué información debe revisarse; no borrará silenciosamente respuestas.
- Saltar estará permitido únicamente para una etapa opcional y quedará registrado en el estado del borrador.
- Cerrar la ventana no equivaldrá a descartar.
- Salir mostrará si existe borrador guardado, cambios aún no guardados o una operación ya enviada.
- Un enlace externo conservará retorno, objeto y borrador cuando la política de seguridad lo permita.

---

#### 10. Borrador, guardado y reanudación

Estados conceptuales mínimos:

| Estado                    | Significado                                                             |
| ------------------------- | ----------------------------------------------------------------------- |
| `NO_INICIADO`             | no existe borrador                                                      |
| `BORRADOR`                | datos parciales sin efecto empresarial                                  |
| `BLOQUEADO`               | falta requisito, existe conflicto o la autorización ya no es válida     |
| `LISTO_PARA_REVISION`     | entradas completas y validadas para construir impacto                   |
| `ENVIADO`                 | solicitud registrada para revisión o aprobación                         |
| `PENDIENTE_DE_APROBACION` | espera una decisión separada                                            |
| `APLICANDO`               | el servidor aceptó la intención y procesa el cambio                     |
| `APLICADO`                | efecto confirmado con receipt                                           |
| `FALLO_PARCIAL`           | solo una parte produjo efecto y cada elemento tiene resultado explícito |
| `FALLO`                   | no se confirmó efecto; existe ruta segura de reintento o corrección     |
| `CANCELADO`               | el caso fue cancelado conservando historial cuando correspondía         |
| `SUPERADO`                | otro borrador, versión o decisión reemplazó este trabajo                |

Reglas obligatorias:

1. El autoguardado mostrará hora y estado; nunca simulará persistencia.
2. Los borradores sensibles se persistirán en la fuente autorizada y no dependerán exclusivamente del almacenamiento del navegador.
3. Reanudar revalidará actor, permiso, alcance, versión base, vigencia y dependencias.
4. Si la sesión expira, la información capturada se conservará según política, pero ninguna acción se aplicará hasta reautenticar y revalidar.
5. Dos borradores sobre el mismo objeto no se fusionarán silenciosamente.
6. Todo borrador tendrá propietario, aplicación, objeto, fecha, estado y política de caducidad o limpieza.

---

#### 11. Campos, selecciones y valores predeterminados

- Cada campo será requerido, opcional o condicional con causa visible.
- Los valores predeterminados mostrarán su procedencia cuando puedan afectar alcance, dinero, permisos, vigencia o publicación.
- Un valor heredado no se interpretará como confirmado si requiere decisión explícita.
- Los selectores mostrarán nombres humanos y contexto; los identificadores internos serán secundarios.
- Las opciones fuera de alcance no se mostrarán como disponibles para después fallar al guardar.
- Las relaciones buscarán y validarán la fuente canónica, no una copia local.
- Un campo sensible se ocultará o enmascarará salvo necesidad y permiso exactos.
- Las unidades, monedas, zonas horarias, fechas y vigencias serán explícitas.
- Los adjuntos indicarán finalidad, formato, tamaño, clasificación y retención aplicables.
- Los campos de motivo usarán códigos estructurados y comentario complementario cuando el riesgo lo exija.

---

#### 12. Validación preventiva

La validación se ejecutará en capas:

1. **entrada:** formato, obligatoriedad, rango, unidad y coherencia inmediata;
2. **paso:** relaciones y condiciones necesarias para continuar;
3. **objeto:** duplicados, estado, versión y conflictos sobre el recurso;
4. **dominio:** reglas empresariales y dependencias de la aplicación propietaria;
5. **transversal:** territorio, segregación, consumidores e impacto en otras aplicaciones;
6. **autorización:** permiso y contexto efectivos en servidor;
7. **precompromiso:** repetición de validaciones materiales sobre la versión exacta revisada.

Un error deberá indicar:

```text
QUÉ NO ES VÁLIDO
+ POR QUÉ
+ DÓNDE CORREGIRLO
+ QUÉ INFORMACIÓN SE CONSERVA
+ SI EXISTE O NO OTRA RUTA AUTORIZADA
```

Las validaciones remotas mostrarán estado `verificando`, `válido`, `advertencia`, `bloqueado` o `no disponible`. Una consulta fallida no será interpretada como validación superada.

---

#### 13. Ramas y divulgación progresiva

- Las ramas dependerán de datos o decisiones declaradas, no de condiciones ocultas en la interfaz.
- La persona podrá conocer por qué aparece una etapa adicional.
- Cambiar una decisión recalculará las ramas y marcará datos incompatibles antes de descartarlos.
- La guía solicitará primero la decisión que reduce más incertidumbre sin exponer datos innecesarios.
- La información avanzada permanecerá disponible como detalle o enlace, pero no competirá con la decisión actual.
- Un usuario experto podrá abrir detalle técnico autorizado sin abandonar el flujo ni perder el borrador.
- Una rama no podrá omitir revisión, autorización, evidencia o aprobación exigidas por el riesgo.

---

#### 14. Revisión de cambios e impacto

Antes de una acción material, la guía mostrará como mínimo:

- intención exacta;
- objeto y versión base;
- alcance territorial y temporal;
- campos o relaciones creados, modificados o retirados;
- diferencias antes/después cuando exista objeto previo;
- valores heredados o calculados;
- dependencias y consumidores conocidos;
- advertencias, exclusiones y elementos sin resolver;
- datos sensibles o evidencias que se conservarán;
- actor que prepara y actor que deberá aprobar;
- posibilidad real de corregir, revertir o retirar;
- acción final exacta y resultado esperado.

La revisión se recalculará si cambia cualquier dato material. No podrá aprobarse una versión distinta de la revisada.

---

#### 15. Niveles de compromiso y confirmación

| Nivel                  | Acción                                              | Contrato mínimo                                                                                              |
| ---------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `GC0_DRAFT`            | guardar borrador                                    | no produce efecto empresarial; confirma persistencia                                                         |
| `GC1_APPLY_REVERSIBLE` | aplicar cambio local y reversible                   | resumen breve, validación final y receipt                                                                    |
| `GC2_APPLY_MATERIAL`   | aplicar cambio de impacto material                  | diferencias, alcance, motivo y confirmación explícita                                                        |
| `GC3_SUBMIT_APPROVAL`  | enviar a aprobación                                 | versión congelada, aprobador o política, evidencia y estado pendiente                                        |
| `GC4_PUBLISH_CRITICAL` | publicar, cerrar, revocar o ejecutar acción crítica | segregación, versión exacta, impacto, autorización reforzada cuando el contrato lo exija y receipt auditable |

La autenticación reforzada no se exigirá por costumbre ni se omitirá por comodidad; dependerá del permiso y la política aprobados posteriormente.

---

#### 16. Segregación y autorización

1. Poder preparar no implica poder aprobar.
2. Poder aprobar no implica poder editar la solicitud antes de aprobarla.
3. Una simulación de rol no satisface segregación real.
4. La guía ocultará o deshabilitará acciones según capacidad de presentación, pero el servidor decidirá la autorización final.
5. El alcance visible no podrá exceder el alcance efectivo.
6. Si el actor pierde autoridad durante el borrador, podrá conservarse la información según política, pero no enviar ni aplicar.
7. La decisión registrará actor, permiso, alcance, versión, motivo y política de aprobación aplicada.
8. Toda denegación explicará la condición empresarial sin revelar reglas o datos sensibles innecesarios.

---

#### 17. Escritura, idempotencia y resultado

- La acción final se enviará una sola vez mediante una intención identificable e idempotente.
- Deshabilitar el botón no será el único control contra duplicación.
- El resultado deberá distinguir `aplicado`, `pendiente`, `parcial`, `rechazado`, `conflictivo` y `desconocido`.
- Un timeout no autorizará repetir automáticamente una acción sensible.
- La interfaz consultará por el receipt o el estado de la intención antes de ofrecer reintento.
- Un fallo parcial mostrará resultado por objeto y conservará una tarea de conciliación o corrección.
- La confirmación mostrará identificador humano, fecha, alcance, actor, estado y siguiente acción.
- La interfaz no anunciará éxito solo porque cerró un modal o recibió una respuesta sin efecto confirmado.

---

#### 18. Cancelación, descarte y recuperación

| Acción             | Efecto                                                                                    |
| ------------------ | ----------------------------------------------------------------------------------------- |
| salir              | abandona la vista; conserva borrador guardado                                             |
| guardar y salir    | persiste el borrador y muestra cómo retomarlo                                             |
| descartar borrador | elimina o inutiliza el borrador según política, con confirmación proporcional             |
| cancelar caso      | cambia el estado empresarial de un caso existente y conserva auditoría                    |
| revertir           | ejecuta una transición nueva cuando el proceso la permite; no borra historia              |
| corregir           | crea una modificación trazable sobre el hecho o configuración vigente                     |
| reintentar         | reutiliza la intención segura o crea una nueva después de verificar el resultado anterior |

No se usará un único botón `Cancelar` para todos estos efectos.

---

#### 19. Propiedad funcional y navegación entre aplicaciones

- La guía se renderizará preferentemente en la aplicación propietaria de la escritura.
- VISO podrá iniciar una tarea transversal y transferir al propietario con `ADM-TASK-*`, objeto, alcance, intención y retorno.
- El retorno mostrará el resultado confirmado, no una copia local asumida.
- Una guía distribuida tendrá un único identificador de caso o correlación.
- Los datos ya confirmados por una aplicación no se volverán a pedir salvo que exista una decisión nueva o una verificación explícita.
- Un fallo en el traspaso conservará el borrador y explicará dónde continúa el trabajo.
- Los permisos se resolverán nuevamente en cada aplicación; un handoff no transportará autoridad implícita.

---

#### 20. Accesibilidad y compatibilidad

- Todo paso será operable con teclado y tendrá orden de foco coherente.
- El progreso y los estados no dependerán solo de color.
- Errores, advertencias y resultados se asociarán con el campo o sección correspondiente.
- El zoom y la ampliación no ocultarán acciones ni obligarán a desplazamiento horizontal para completar decisiones ordinarias.
- En tablet administrativa, la secuencia conservará toda la información material; la versión compacta no omitirá impacto, evidencia o segregación.
- El foco regresará al encabezado del error o al resultado después de una transición.
- Los tiempos de espera no expulsarán silenciosamente a una persona que está leyendo o adjuntando evidencia.

---

#### 21. Instrumentación y métricas

Cada implementación deberá poder medir, sin registrar contenido sensible innecesario:

- inicio, abandono, reanudación y finalización;
- paso donde ocurre el bloqueo;
- validaciones fallidas por categoría;
- tiempo activo y tiempo de espera remoto;
- uso de ayuda, regreso y cambio de rama;
- conflicto de versión y borrador superado;
- envío duplicado evitado;
- resultado parcial o desconocido;
- aprobación, rechazo y devolución;
- transición a modo experto y retorno.

Las métricas se usarán para detectar fricción; no sustituirán evidencia de autorización, auditoría ni pruebas con usuarios.

---

#### 22. Flujos de referencia

| Flujo                              | Secuencia orientativa                                                                                                |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| alta de sede o área                | propósito → estructura superior → datos → responsables → dependencias → impacto → enviar o aplicar                   |
| incorporación de trabajador        | candidato o identidad → datos laborales → sede y área → programación y acceso → documentos → revisión → aprobación   |
| alta de producto                   | identidad → unidades y presentaciones → perfil de inventario → proyecciones comerciales → conflictos → revisión      |
| nueva versión de receta            | versión base → ingredientes → rendimiento → calidad y alérgenos → sedes y áreas → impacto → aprobación y publicación |
| configuración de terminal          | sede y punto → dispositivo → periféricos → conectividad → permisos → prueba → activación                             |
| diferencia de recepción            | orden y recepción → diferencia → evidencia → efecto en inventario y compra → propuesta → decisión                    |
| promoción o beneficio              | objetivo → elegibilidad → productos o sedes → vigencia y límites → simulación → aprobación → publicación             |
| cierre de periodo                  | periodo → precondiciones → pendientes y diferencias → impacto → aprobación → cierre → receipt                        |
| solicitud de privacidad            | identidad y autoridad → alcance → fuentes → evidencia → decisión → entrega, corrección o conservación                |
| recuperación posterior a incidente | incidente → alcance → operaciones pendientes → diferencias → reconciliación → aprobación → cierre                    |

La secuencia física podrá variar, pero no podrá eliminar controles materiales del contrato.

---

#### 23. Matriz de enrutamiento de las 64 familias candidatas

| Familia        | Dominio           | Propietario                    | Arquetipo principal                | Papel del modo guiado | Aplicación del contrato                                                                                                   |
| -------------- | ----------------- | ------------------------------ | ---------------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `ADM-TASK-001` | `ADM-ORG`         | VISO                           | `GF-01_ALTA_MAESTRA`               | `PRIMARIO`            | Alta organizativa con identidad jurídica, marca operada, vigencia y aprobación separada.                                  |
| `ADM-TASK-002` | `ADM-ORG`         | VISO                           | `GF-01_ALTA_MAESTRA`               | `PRIMARIO`            | Creación jerárquica de establecimiento, sede, área, zona y centro de costo sin referencias huérfanas.                     |
| `ADM-TASK-003` | `ADM-ORG`         | VISO                           | `GF-02_RELACION_Y_ALCANCE`         | `PRIMARIO`            | Asignación de propietario, responsable, suplente y límites de decisión con vista previa de cobertura.                     |
| `ADM-TASK-004` | `ADM-ORG`         | VISO                           | `GF-04_VERSION_Y_PUBLICACION`      | `ENVOLVENTE`          | La edición puede ser experta; el alta de versión, revisión, aprobación y retiro usan el contrato guiado.                  |
| `ADM-TASK-005` | `ADM-ORG`         | VISO                           | `GF-05_REVISION_Y_DECISION`        | `DECISION`            | Comparación antes/después, dependencias y población afectada antes de publicar el cambio organizativo.                    |
| `ADM-TASK-009` | `ADM-PEOPLE`      | TALENTO / VISO / ANIMA         | `GF-07_ORQUESTACION_TRANSVERSAL`   | `PRIMARIO`            | Incorporación coordinada entre TALENTO, VISO y ANIMA con expediente, asignaciones, documentos y acceso.                   |
| `ADM-TASK-010` | `ADM-PEOPLE`      | VISO / ANIMA                   | `GF-01_ALTA_MAESTRA`               | `CASO_EXCEPCIONAL`    | Edición guiada para cambios protegidos o de alto impacto; los cambios simples podrán usar acción rápida autorizada.       |
| `ADM-TASK-011` | `ADM-PEOPLE`      | TALENTO / VISO / SHELL         | `GF-07_ORQUESTACION_TRANSVERSAL`   | `PRIMARIO`            | Retiro integral con accesos, custodias, pendientes, documentos y constancia de cierre.                                    |
| `ADM-TASK-016` | `ADM-WORKFORCE`   | ANIMA / VISO                   | `GF-06_EXCEPCION_Y_CORRECCION`     | `PRIMARIO`            | Corrección de asistencia con evidencia, motivo, impacto laboral y aprobación cuando corresponda.                          |
| `ADM-TASK-017` | `ADM-WORKFORCE`   | VISO / NUMERA                  | `GF-05_REVISION_Y_DECISION`        | `DECISION`            | Revisión de novedades que impactan pago o control laboral sin permitir que aprobar altere el hecho fuente.                |
| `ADM-TASK-018` | `ADM-ACCESS`      | VISO                           | `GF-03_ACCESO_Y_SEGURIDAD`         | `ENVOLVENTE`          | Alta o cambio de rol con diferencias, consumidores, incompatibilidades y aprobación.                                      |
| `ADM-TASK-019` | `ADM-ACCESS`      | VISO / SHELL                   | `GF-03_ACCESO_Y_SEGURIDAD`         | `ENVOLVENTE`          | Configuración de permisos, alcances y denegaciones con simulación previa; la edición densa pertenece al modo experto.     |
| `ADM-TASK-020` | `ADM-ACCESS`      | VISO                           | `GF-03_ACCESO_Y_SEGURIDAD`         | `PRIMARIO`            | Asignación individual guiada; la asignación por lote se deriva al modo experto con envolvente de revisión.                |
| `ADM-TASK-021` | `ADM-ACCESS`      | VISO                           | `GF-03_ACCESO_Y_SEGURIDAD`         | `PRIMARIO`            | Excepción, delegación, vigencia y revocación con justificación y efecto efectivo simulado.                                |
| `ADM-TASK-022` | `ADM-ACCESS`      | VISO                           | `GF-03_ACCESO_Y_SEGURIDAD`         | `DECISION`            | La simulación prepara evidencia; el modo guiado conduce la resolución o aprobación del conflicto.                         |
| `ADM-TASK-023` | `ADM-ACCESS`      | VISO / SHELL                   | `GF-09_CONFIGURACION_TECNICA`      | `PRIMARIO`            | Registro, vinculación física, capacidades, prueba, activación y revocación de dispositivo compartido.                     |
| `ADM-TASK-025` | `ADM-CATALOG`     | NEXO                           | `GF-01_ALTA_MAESTRA`               | `PRIMARIO`            | Alta de producto o resolución de fusión, archivo y reactivación con dependencias visibles.                                |
| `ADM-TASK-026` | `ADM-CATALOG`     | NEXO                           | `GF-02_RELACION_Y_ALCANCE`         | `PRIMARIO`            | Unidades, presentaciones, conversiones y empaques con validación dimensional y de consumidores.                           |
| `ADM-TASK-027` | `ADM-CATALOG`     | PULSO                          | `GF-04_VERSION_Y_PUBLICACION`      | `PRIMARIO`            | Proyección comercial por canal con contenido, vigencia y vista previa.                                                    |
| `ADM-TASK-028` | `ADM-CATALOG`     | PULSO / NUMERA                 | `GF-04_VERSION_Y_PUBLICACION`      | `ENVOLVENTE`          | La preparación puede ser experta; la publicación de precios y escenarios usa revisión guiada y aprobación.                |
| `ADM-TASK-029` | `ADM-CATALOG`     | PULSO                          | `GF-04_VERSION_Y_PUBLICACION`      | `ENVOLVENTE`          | La gestión diaria es experta; altas, cambios estructurales y publicación por sede o canal usan envolvente guiada.         |
| `ADM-TASK-030` | `ADM-CATALOG`     | NEXO / FOGO / PULSO            | `GF-06_EXCEPCION_Y_CORRECCION`     | `PRIMARIO`            | Resolución de duplicados y contradicciones con superviviente, referencias afectadas y estrategia de corrección.           |
| `ADM-TASK-031` | `ADM-RECIPE`      | FOGO                           | `GF-04_VERSION_Y_PUBLICACION`      | `PRIMARIO`            | Creación de receta y nueva versión con insumos, cantidades, rendimiento y estado de borrador.                             |
| `ADM-TASK-032` | `ADM-RECIPE`      | FOGO                           | `GF-02_RELACION_Y_ALCANCE`         | `PRIMARIO`            | Definición de rendimiento, porción, unidad y tolerancias con validación de consistencia.                                  |
| `ADM-TASK-033` | `ADM-RECIPE`      | FOGO                           | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `ENVOLVENTE`          | Edición técnica experta; alta y publicación de alérgenos, manipulación y criterios de calidad quedan guiadas.             |
| `ADM-TASK-034` | `ADM-RECIPE`      | FOGO                           | `GF-05_REVISION_Y_DECISION`        | `DECISION`            | Aprobación, publicación, restricción o retiro de receta con versión, alcance y efecto productivo.                         |
| `ADM-TASK-035` | `ADM-RECIPE`      | FOGO / NEXO                    | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `PRIMARIO`            | Plan de muestreo, liberación, retención o cuarentena con evidencia y segregación.                                         |
| `ADM-TASK-039` | `ADM-PROCUREMENT` | ORIGO / NUMERA                 | `GF-02_RELACION_Y_ALCANCE`         | `ENVOLVENTE`          | Configuración experta de reglas; el cambio de presupuesto, límite o aprobador usa revisión guiada.                        |
| `ADM-TASK-040` | `ADM-PROCUREMENT` | ORIGO                          | `GF-01_ALTA_MAESTRA`               | `COMPLEMENTARIO`      | Creación guiada de una orden compleja; la operación recurrente permanece disponible en modo experto.                      |
| `ADM-TASK-041` | `ADM-PROCUREMENT` | ORIGO                          | `GF-05_REVISION_Y_DECISION`        | `DECISION`            | Aprobación, rechazo o devolución con diferencias, evidencia y comentario estructurado.                                    |
| `ADM-TASK-042` | `ADM-PROCUREMENT` | ORIGO                          | `GF-06_EXCEPCION_Y_CORRECCION`     | `PRIMARIO`            | Diferencia de recepción, devolución o reclamo con cantidades, causa, efecto y resolución.                                 |
| `ADM-TASK-047` | `ADM-INVENTORY`   | NEXO                           | `GF-05_REVISION_Y_DECISION`        | `DECISION`            | Aprobación de ajuste después de comparar conteo, existencia, movimientos y evidencia.                                     |
| `ADM-TASK-048` | `ADM-INVENTORY`   | NEXO                           | `GF-06_EXCEPCION_Y_CORRECCION`     | `PRIMARIO`            | Caso de vencimiento, daño, merma, pérdida o disposición con lote, cantidad, custodia y decisión.                          |
| `ADM-TASK-049` | `ADM-INVENTORY`   | NEXO                           | `GF-02_RELACION_Y_ALCANCE`         | `ENVOLVENTE`          | Reglas de movimiento y remisión se editan en modo experto; su activación usa impacto y aprobación guiados.                |
| `ADM-TASK-052` | `ADM-PRODUCTION`  | FOGO                           | `GF-09_CONFIGURACION_TECNICA`      | `PRIMARIO`            | Numeración de lote, trazabilidad y cierre con muestras, colisiones y compatibilidad.                                      |
| `ADM-TASK-055` | `ADM-SALES`       | PULSO                          | `GF-09_CONFIGURACION_TECNICA`      | `PRIMARIO`            | Terminal, impresoras, medios de pago y horario con prueba técnica antes de activar.                                       |
| `ADM-TASK-058` | `ADM-SALES`       | PULSO / PASS                   | `GF-04_VERSION_Y_PUBLICACION`      | `PRIMARIO`            | Descuento o promoción con elegibilidad, vigencia, límites, costo esperado y aprobación.                                   |
| `ADM-TASK-059` | `ADM-SALES`       | PULSO / NUMERA                 | `GF-06_EXCEPCION_Y_CORRECCION`     | `PRIMARIO`            | Apertura, cierre, arqueo y diferencia con soportes, cálculo y separación entre captura y aprobación.                      |
| `ADM-TASK-060` | `ADM-SALES`       | PULSO / NUMERA                 | `GF-05_REVISION_Y_DECISION`        | `DECISION`            | Anulación, devolución, reembolso o contracargo con vínculo al origen y efecto económico.                                  |
| `ADM-TASK-061` | `ADM-CUSTOMER`    | PASS                           | `GF-04_VERSION_Y_PUBLICACION`      | `ENVOLVENTE`          | La regla puede modelarse en modo experto; activación y cambio de ledger usan revisión guiada.                             |
| `ADM-TASK-062` | `ADM-CUSTOMER`    | PASS                           | `GF-04_VERSION_Y_PUBLICACION`      | `PRIMARIO`            | Beneficio o cupón con elegibilidad, sedes, cupo, vigencia y prueba de disponibilidad.                                     |
| `ADM-TASK-063` | `ADM-CUSTOMER`    | PASS                           | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `PRIMARIO`            | Fusión de cliente, consentimiento o solicitud de privacidad con identidad, base legal, evidencia y aprobación.            |
| `ADM-TASK-064` | `ADM-CUSTOMER`    | PULSO / PASS                   | `GF-01_ALTA_MAESTRA`               | `CASO_EXCEPCIONAL`    | Alta o modificación compleja de reserva o evento; la gestión continua permanece experta.                                  |
| `ADM-TASK-065` | `ADM-CUSTOMER`    | PULSO / PASS                   | `GF-06_EXCEPCION_Y_CORRECCION`     | `PRIMARIO`            | Reclamo y compensación con hechos, política, evidencia, impacto y decisión.                                               |
| `ADM-TASK-069` | `ADM-LOGISTICS`   | NEXO / VISO                    | `GF-01_ALTA_MAESTRA`               | `PRIMARIO`            | Alta, transferencia, mantenimiento o baja de activo con custodia y efecto patrimonial.                                    |
| `ADM-TASK-070` | `ADM-LOGISTICS`   | NEXO                           | `GF-01_ALTA_MAESTRA`               | `CASO_EXCEPCIONAL`    | Alta y cambios documentales del vehículo son guiados; disponibilidad diaria permanece experta.                            |
| `ADM-TASK-071` | `ADM-LOGISTICS`   | NEXO                           | `GF-06_EXCEPCION_Y_CORRECCION`     | `PRIMARIO`            | Excepción de entrega, pérdida, daño o tercero con custodia, evidencia y resolución.                                       |
| `ADM-TASK-072` | `ADM-FINANCE`     | NUMERA                         | `GF-07_ORQUESTACION_TRANSVERSAL`   | `PRIMARIO`            | Mapeo de hecho operativo a económico con fuente, regla, no duplicación y aprobación.                                      |
| `ADM-TASK-079` | `ADM-FINANCE`     | NUMERA                         | `GF-05_REVISION_Y_DECISION`        | `PRIMARIO`            | Cierre, bloqueo o reapertura con precondiciones, excepciones, periodo e impacto.                                          |
| `ADM-TASK-080` | `ADM-FINANCE`     | NUMERA                         | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `ENVOLVENTE`          | La preparación es experta; exportar o integrar información oficial exige revisión guiada de alcance y finalidad.          |
| `ADM-TASK-081` | `ADM-CHANNELS`    | VISO / SHELL                   | `GF-09_CONFIGURACION_TECNICA`      | `PRIMARIO`            | Endpoint, propietario, suplente y referencia de credencial con prueba y activación.                                       |
| `ADM-TASK-083` | `ADM-CHANNELS`    | PASS / marketing               | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `PRIMARIO`            | Campaña, audiencia, consentimiento y plantilla con minimización de datos y aprobación.                                    |
| `ADM-TASK-084` | `ADM-CHANNELS`    | PULSO / VISO                   | `GF-07_ORQUESTACION_TRANSVERSAL`   | `COMPLEMENTARIO`      | La oportunidad se gestiona en modo experto; cotización, términos, aprobación y traspaso usan etapas guiadas.              |
| `ADM-TASK-085` | `ADM-CHANNELS`    | SHELL / integraciones          | `GF-09_CONFIGURACION_TECNICA`      | `PRIMARIO`            | Enrutamiento, automatización, respuesta y escalamiento con prueba controlada antes de publicar.                           |
| `ADM-TASK-087` | `ADM-PLATFORM`    | SHELL                          | `GF-09_CONFIGURACION_TECNICA`      | `ENVOLVENTE`          | La administración técnica puede ser experta; cambios de ambiente, endpoint o credencial usan revisión guiada.             |
| `ADM-TASK-088` | `ADM-PLATFORM`    | SHELL / VISO                   | `GF-09_CONFIGURACION_TECNICA`      | `PRIMARIO`            | Perfil y asignación de impresora, escáner o dispositivo con compatibilidad y prueba.                                      |
| `ADM-TASK-089` | `ADM-PLATFORM`    | Servicio documental E4 / VISO  | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `ENVOLVENTE`          | La edición documental es experta; nueva política de clasificación o retención usa aprobación guiada.                      |
| `ADM-TASK-090` | `ADM-PLATFORM`    | VISO / aplicación propietaria  | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `PRIMARIO`            | Inspección, obligación y acción correctiva con evidencia, responsable, plazo y cierre.                                    |
| `ADM-TASK-091` | `ADM-PLATFORM`    | SHELL                          | `GF-10_CONTINUIDAD_Y_RECUPERACION` | `ENVOLVENTE`          | La gestión técnica es experta; release, flag, rollback y ventana usan revisión, aprobación y recibo guiados.              |
| `ADM-TASK-092` | `ADM-PLATFORM`    | VISO / SHELL / PASS / TALENTO  | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `PRIMARIO`            | Solicitud de privacidad o acceso a datos con identidad, alcance, búsqueda, decisión y conservación de evidencia.          |
| `ADM-TASK-095` | `ADM-ANALYTICS`   | Aplicación propietaria         | `GF-07_ORQUESTACION_TRANSVERSAL`   | `ENVOLVENTE`          | La selección y corrección masiva ocurren en modo experto; el modo guiado controla carga, simulación, aprobación y cierre. |
| `ADM-TASK-096` | `ADM-ANALYTICS`   | VISO                           | `GF-08_CUMPLIMIENTO_Y_EVIDENCIA`   | `CASO_EXCEPCIONAL`    | La exploración es de auditoría; abrir investigación, fijar alcance y cerrar conclusiones usa guía.                        |
| `ADM-TASK-097` | `ADM-ANALYTICS`   | SHELL / VISO                   | `GF-10_CONTINUIDAD_Y_RECUPERACION` | `PRIMARIO`            | Plan de contingencia con alcance, responsables, medios manuales, contactos, prueba y aprobación.                          |
| `ADM-TASK-098` | `ADM-ANALYTICS`   | SHELL / aplicación propietaria | `GF-10_CONTINUIDAD_Y_RECUPERACION` | `PRIMARIO`            | Recuperación y conciliación posterior a incidente con pendientes, diferencias, responsables y cierre.                     |

Resultado de clasificación:

- `PRIMARIO`: el modo guiado es la ruta ordinaria del caso complejo o infrecuente;
- `ENVOLVENTE`: el trabajo denso ocurre en modo experto, pero revisión, publicación o cierre usan guía;
- `DECISION`: la guía concentra revisión, aprobación, rechazo o devolución;
- `COMPLEMENTARIO`: existe una variante guiada y una variante experta de igual legitimidad según volumen;
- `CASO_EXCEPCIONAL`: la superficie ordinaria no es guiada, pero una variante rara o sensible sí lo es.

Esta matriz cierra `C-ADMIN-001` sin obligar a crear 64 asistentes independientes.

---

#### 24. Interoperabilidad con el modo experto

`UX-ADMIN-003` deberá conservar estas reglas:

1. modo guiado y experto operan sobre el mismo objeto, versión y borrador autorizado;
2. cambiar de modo conserva alcance, filtros relevantes, cambios y validaciones compatibles;
3. una persona no podrá usar el cambio de modo para omitir revisión, segregación o aprobación;
4. el modo experto podrá preparar conjuntos o configuraciones densas;
5. el modo guiado podrá revisar, simular, enviar, publicar o cerrar ese trabajo;
6. no se duplicará la escritura al cambiar de superficie;
7. el receipt y el historial serán únicos.

---

#### 25. Carryovers con destino exacto

| Carryover     | Condición pendiente                                                                   | Tarea propietaria de cierre                                           |
| ------------- | ------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `C-ADMIN-001` | Seleccionar patrones concretos de modo guiado                                         | **CERRADO por `UX-ADMIN-002`**                                        |
| `C-ADMIN-009` | Diseñar superficie experta interoperable con borradores y revisiones guiadas          | `UX-ADMIN-003`                                                        |
| `C-ADMIN-010` | Definir microcopias, ayudas, ejemplos, validación preventiva y detalle de impacto     | `UX-ADMIN-004`                                                        |
| `C-ADMIN-011` | Prototipar arquetipos representativos y comprobar comprensión, reanudación y decisión | `UX-ADMIN-005`                                                        |
| `C-ADMIN-012` | Asignar cada `ADM-TASK-*` a pantallas, acciones y propiedad física definitiva         | `PROC-SCREEN-001 a PROC-SCREEN-028`                                   |
| `C-ADMIN-013` | Cerrar persistencia, concurrencia, idempotencia y receipts por aplicación             | `PROC-SCREEN-001 a PROC-SCREEN-028`; `SHELL-CON-012`; `SHELL-CON-015` |
| `C-ADMIN-014` | Cerrar handoffs y retornos entre aplicaciones                                         | `SHELL-CON-014`; `SHELL-CON-016`; `PROC-SCREEN-001 a PROC-SCREEN-028` |
| `C-ADMIN-015` | Implementar, probar y certificar los flujos guiados seleccionados                     | tareas UX de cada aplicación; `UX-QA-020` a `UX-QA-029`               |

No queda pendiente narrativo sin tarea y momento de resolución.

---

#### 26. Requisitos de prueba derivados

**Resultado:** GENERA 32 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-344` a `TREQ-UX-375` al Registro Canónico completo. Todos quedan en `IDENTIFICADO`; la especificación de pantallas, implementación y evidencia pertenecen a `UX-ADMIN-003` a `UX-ADMIN-005`, `PROC-SCREEN-*`, las tareas UX por aplicación, paquetes E5 y BLOQUE U.

---

#### 27. Criterios de aceptación

- [x] El modo guiado se define por tarea, variante y riesgo, no por aplicación o cargo.
- [x] Se distinguen guía, formulario, autorización, aprobación y modo experto.
- [x] Se definen reglas obligatorias, complementarias y de exclusión.
- [x] Se crean diez arquetipos reutilizables sin generar 64 asistentes aislados.
- [x] Se clasifican explícitamente las 64 familias candidatas de `UX-ADMIN-001`.
- [x] Se define gramática de pasos, navegación, progreso, ramas y divulgación progresiva.
- [x] Se define el ciclo de borrador, guardado, reanudación, conflicto y caducidad.
- [x] Se definen validaciones locales, remotas, empresariales, transversales y de autorización.
- [x] Se exige revisión de diferencias, impacto, alcance y versión antes de comprometer cambios.
- [x] Se separan guardar, enviar, aprobar, aplicar, publicar, cancelar y descartar.
- [x] Se protege segregación, territorialidad, privacidad y propiedad funcional.
- [x] Se define escritura idempotente, receipt, resultado parcial y resultado desconocido.
- [x] Se definen recuperación, handoff, accesibilidad e instrumentación.
- [x] Todos los carryovers tienen tarea propietaria exacta.
- [x] Se incorporan `TREQ-UX-344` a `TREQ-UX-375`.
- [x] No se implementa código, Supabase, rutas, componentes ni cambios productivos.
- [x] `UX-ADMIN-003` permanece no iniciada.

---

#### 28. Resultado y continuidad

```text
UX-ADMIN-001 APROBADA
UX-ADMIN-002 APROBADA
UX-ADMIN-003 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-ADMIN-003 — Diseñar modo experto para consulta, edición masiva y auditoría
```


### ✅ UX-ADMIN-003 — Diseñar modo experto para consulta, edición masiva y auditoría

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-ADMIN-003 — Diseñar modo experto para consulta, edición masiva y auditoría`

**Tarea anterior:** `UX-ADMIN-002 — Diseñar modo guiado para altas y configuraciones complejas` — APROBADA

**Siguiente tarea reservada:** `UX-ADMIN-004 — Definir ayudas contextuales, validación preventiva y vista previa de impacto` — NO INICIADA

**Artefactos producidos:**

- `UX-ADMIN-EXPERT-MODE-CONTRACT-001`;
- `UX-ADMIN-EXPERT-ARCHETYPE-CATALOG-001`;
- `UX-ADMIN-EXPERT-INFORMATION-ARCHITECTURE-001`;
- `UX-ADMIN-QUERY-FILTER-VIEW-CONTRACT-001`;
- `UX-ADMIN-DENSE-GRID-CONTRACT-001`;
- `UX-ADMIN-BULK-ACTION-CONTRACT-001`;
- `UX-ADMIN-COMPARISON-RECONCILIATION-CONTRACT-001`;
- `UX-ADMIN-AUDIT-EXPLORATION-CONTRACT-001`;
- `UX-ADMIN-EXPERT-GUIDED-INTEROP-CONTRACT-001`;
- `UX-ADMIN-EXPERT-ROUTING-MATRIX-001`;
- `UX-ADMIN-EXPERT-CARRYOVER-REGISTER-001`.

**Cobertura:** las **41 familias candidatas a modo experto** identificadas por `UX-ADMIN-001`, organizadas mediante **10 arquetipos reutilizables**.

**Naturaleza:** contrato documental transversal para consulta densa, trabajo administrativo de alto volumen, planificación, edición controlada, conciliación, analítica y auditoría. No implementa una tabla universal, un clon de hoja de cálculo ni una consola con autoridad irrestricta.

**Cambios en código, aplicaciones, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, integraciones, hardware o producción:** no autorizados.

---

#### 1. Propósito

Diseñar una experiencia administrativa eficiente para personas que trabajan repetidamente con poblaciones, periodos, versiones, diferencias, pendientes o grandes cantidades de registros y que necesitan observar más información simultánea que la permitida por un flujo guiado secuencial.

```text
ALCANCE Y PERIODO VISIBLES
→ CONSULTA, BUSQUEDA Y FILTROS REPRODUCIBLES
→ RESULTADO DENSO PERO LEGIBLE
→ SELECCION EXACTA
→ COMPARACION, EDICION O DECISION AUTORIZADA
→ SIMULACION Y VALIDACION
→ EJECUCION CONTROLADA
→ RESULTADO POR OBJETO
→ HISTORIAL, RECEIPT Y SIGUIENTE ACCION
```

El modo experto optimiza trabajo recurrente y análisis complejo. No reduce controles, no convierte filtros en autorización y no permite que una persona edite directamente toda información que pueda visualizar.

---

#### 2. Decisiones canónicas

1. El modo experto se asigna por tarea, volumen, frecuencia y necesidad de comparación; no por cargo, aplicación o nivel jerárquico.
2. No existirá una cuadrícula universal para todos los dominios. Cada superficie deberá declarar objeto, columnas, acciones y riesgos propios.
3. La consulta, la selección, la edición, la aprobación, la publicación y la auditoría serán capacidades separables.
4. Ver una fila no concederá permiso para editarla, exportarla, aprobarla o incluirla en una operación masiva.
5. Todo alcance de empresa, sede, área, centro de costo, canal, periodo o población permanecerá visible durante el trabajo.
6. Un filtro, una vista guardada, una URL, una pestaña o la última selección no ampliarán autoridad ni reemplazarán validación del servidor.
7. Seleccionar todos los elementos visibles y seleccionar todos los elementos que cumplen la consulta serán acciones distintas y explícitas.
8. Toda acción masiva tendrá previsualización, validación, simulación, autorización, ejecución idempotente y resultado por elemento.
9. La auditoría será inmutable y de solo lectura respecto del hecho histórico. Anotar, escalar o corregir abrirá una acción o caso separado.
10. La edición en línea solo se permitirá para campos expresamente habilitados, de bajo acoplamiento y con control de versión.
11. El modo experto podrá preparar trabajo que el modo guiado revise, apruebe, aplique o publique sin duplicar objeto, borrador ni receipt.
12. Las exportaciones, revelación de datos sensibles y descargas masivas tendrán permiso, propósito, clasificación y evidencia independientes.
13. Una carga rápida, paginación o virtualización no podrá ocultar datos omitidos, conteos imprecisos ni resultados parciales.
14. Ante datos desactualizados, conflicto o resultado desconocido, la interfaz detendrá la acción material y mostrará cómo reconciliar.
15. `UX-ADMIN-004` definirá microcopias, ayudas y detalle visual del impacto sin alterar estas semánticas.

---

#### 3. Dependencias y límites preservados

Esta tarea consume y no reemplaza:

- `UX-ADMIN-001`, sus 16 dominios, 98 familias y 41 candidatos expertos;
- `UX-ADMIN-002`, sus 10 arquetipos guiados y el contrato de interoperabilidad;
- `UX-BASE-001` a `UX-BASE-015`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- `UX-STATION-001` a `UX-STATION-012`;
- los contratos `AUTH-*` de actor, permiso, territorio, segregación, privacidad y dispositivo;
- los procesos `VPROC-0001` a `VPROC-0069`;
- la propiedad funcional de VISO, TALENTO, ANIMA, NEXO, FOGO, ORIGO, PULSO, PASS, NUMERA y SHELL;
- los contratos de idempotencia, concurrencia, eventos, handoff, tareas pendientes y evidencia reservados para SHELL, E4, E5 y BLOQUE U.

Esta tarea no define librería de tablas, motor de consultas, endpoint, índice, caché, esquema de importación, formato físico de exportación, política final de retención ni tecnología de analítica.

---

#### 4. Definición canónica de modo experto

El modo experto es una superficie administrativa no secuencial, de alta densidad controlada, que permite:

- consultar y explorar poblaciones;
- mantener filtros y vistas reproducibles;
- comparar elementos, periodos, versiones o fuentes;
- trabajar con cola, tabla, matriz, calendario o tablero;
- editar campos autorizados con validación inmediata;
- preparar cambios por lote;
- analizar diferencias y excepciones;
- reconstruir historia;
- navegar desde un resumen hasta la evidencia de origen;
- pasar a un flujo guiado para decisiones sensibles.

```text
MODO EXPERTO
≠ PERMISO AMPLIO
≠ TABLA GENERICA
≠ HOJA DE CALCULO SIN CONTRATO
≠ SQL EXPUESTO
≠ EDICION DIRECTA DE CUALQUIER CAMPO
≠ AUDITORIA MUTABLE
≠ EXPORTACION LIBRE
≠ ATAJO PARA OMITIR APROBACION
```

---

#### 5. Aplicabilidad

##### 5.1 Superficie principal

El modo experto será principal cuando la tarea tenga una o varias de estas condiciones:

- frecuencia continua, diaria, semanal o mensual;
- volumen medio o alto;
- comparación simultánea entre varios registros;
- planificación por fecha, recurso, capacidad o territorio;
- búsqueda e investigación abiertas;
- revisión de diferencias;
- conciliación entre fuentes;
- edición repetitiva de campos homogéneos;
- selección o preparación masiva;
- analítica, auditoría o construcción de reportes;
- necesidad de teclado, atajos y navegación rápida.

##### 5.2 Superficie complementaria

Será complementario cuando:

- una alta guiada necesite buscar y seleccionar objetos existentes;
- una guía reciba una población preparada en tabla;
- una aprobación necesite comparar detalles o antecedentes;
- un caso excepcional se detecte dentro de una bandeja;
- una corrección masiva requiera cerrar mediante flujo guiado.

##### 5.3 Casos excluidos como superficie principal

No será la ruta principal para:

- operación física o de servicio resuelta por `UX-STATION-*`;
- una alta infrecuente con múltiples dependencias y riesgo elevado;
- una acción crítica que deba revisarse paso a paso;
- exposición de secretos o credenciales;
- recuperación técnica irreversible sin puerta guiada;
- una decisión que exija evidencia y segregación antes de comprometerla;
- un proceso personal, de cliente o candidato sin función administrativa.

---

#### 6. Arquetipos de modo experto

| Código                          | Arquetipo                                               | Uso principal                                                                                 | Controles obligatorios                                                                        |
| ------------------------------- | ------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `EM-01_BANDEJA_CASOS`           | bandeja de casos, pendientes u obligaciones             | priorizar y resolver trabajo continuo por estado, responsable, vencimiento y siguiente acción | propietario, SLA, bloqueo, estado, prioridad, acción disponible y relación con notificación   |
| `EM-02_EXPLORADOR_REGISTROS`    | explorador de objetos y relaciones                      | localizar, filtrar, navegar jerarquías y abrir detalle                                        | alcance visible, consulta reproducible, total conocido, fuentes y detalle progresivo          |
| `EM-03_MATRIZ_EDICION`          | matriz o cuadrícula de edición controlada               | comparar y modificar campos homogéneos en varias filas                                        | columnas editables declaradas, validación por celda y fila, versión y cambios pendientes      |
| `EM-04_PLANIFICADOR`            | calendario, capacidad, asignación o secuencia           | planear personas, recursos, turnos, producción, rutas o publicaciones                         | zona horaria, capacidad, conflictos, dependencias, estado de publicación y comparación        |
| `EM-05_COMPARADOR_CONCILIADOR`  | comparación entre versiones, fuentes o periodos         | resolver diferencias sin ocultar el origen                                                    | fuente A, fuente B, regla, tolerancia, diferencia, decisión, pendiente y receipt              |
| `EM-06_CAMPANA_MASIVA`          | importación, selección o cambio por lote                | preparar y ejecutar acciones sobre una población definida                                     | población congelada, exclusiones, simulación, aprobación, idempotencia y resultado por objeto |
| `EM-07_AUDITORIA_TRAZABILIDAD`  | línea de tiempo e investigación                         | reconstruir quién, qué, cuándo, desde dónde y con qué resultado                               | inmutabilidad, secuencia, actor, contexto, antes, después, evidencia y exporte controlado     |
| `EM-08_EDITOR_REGLAS_VERSIONES` | editor de políticas, reglas, fórmulas o configuraciones | mantener borradores, comparar versiones y publicar                                            | borrador separado, vigencia, dependencias, prueba, diff, aprobación y rollback                |
| `EM-09_ANALITICA_REPORTES`      | análisis, indicadores, escenarios y reportes            | explorar métricas y construir vistas autorizadas                                              | fórmula, versión, fuente, fecha de corte, filtros, granularidad y navegación al origen        |
| `EM-10_CONSOLA_TECNICA`         | soporte, configuración y cambios técnicos               | administrar integraciones, dispositivos, salud y cambios de plataforma                        | ambiente, estado, prueba, secreto referenciado, autorización reforzada, rollback y auditoría  |

Una superficie podrá combinar dos arquetipos, pero deberá declarar cuál gobierna la navegación, la selección y el resultado.

---

#### 7. Marco común de información

Toda superficie experta deberá mantener identificables:

| Zona lógica | Contenido mínimo                                                                        |
| ----------- | --------------------------------------------------------------------------------------- |
| contexto    | aplicación propietaria, dominio, empresa, territorio, periodo y estado de actualización |
| consulta    | búsqueda, filtros, orden, agrupación, vista y total de resultados                       |
| resultado   | filas, tarjetas, eventos, celdas, periodos o diferencias visibles                       |
| selección   | cantidad, criterio, exclusiones y alcance exacto                                        |
| acciones    | acciones permitidas para la selección y razón de las no disponibles                     |
| detalle     | objeto, relaciones, historial, evidencia y campos sensibles autorizados                 |
| cambios     | borrador, celdas modificadas, errores, conflictos y versión base                        |
| ejecución   | simulación, impacto, intención, progreso y resultado por elemento                       |
| continuidad | tareas pendientes, handoff, receipt, corrección o siguiente acción                      |

No es obligatorio que todas las zonas estén simultáneamente abiertas. Sí es obligatorio que ninguna acción material dependa de contexto invisible.

---

#### 8. Consulta, búsqueda, filtros y orden

1. La búsqueda declarará qué campos consulta y si es exacta, parcial, fonética, por código o por texto.
2. Los filtros mostrarán estado activo, valores aplicados y forma de retirarlos.
3. El orden predeterminado responderá a la tarea, no a conveniencia técnica.
4. Toda agrupación mostrará si modifica conteos, selección o totales.
5. El total de resultados deberá distinguir entre total exacto, aproximado y aún no calculado.
6. Los filtros sensibles o territoriales se aplicarán además en servidor.
7. Una búsqueda sin resultados diferenciará ausencia real, falta de permiso, filtro restrictivo y error de carga.
8. La consulta podrá persistirse como vista, pero no como autoridad.
9. Los enlaces compartidos no incluirán secretos ni concederán acceso.
10. Cambiar de empresa, sede, periodo o vista invalidará selecciones incompatibles.

---

#### 9. Vistas guardadas y personalización

Las vistas podrán ser:

- personales;
- compartidas con un grupo autorizado;
- publicadas como estándar del dominio;
- temporales para investigación;
- fijadas como vista inicial por tarea.

Cada vista declarará:

- propietario;
- alcance;
- filtros;
- columnas;
- orden;
- agrupación;
- densidad;
- fecha de actualización;
- audiencia;
- versión del contrato compatible.

Una vista guardada no podrá:

- otorgar permisos;
- esconder permanentemente advertencias materiales;
- cambiar la fuente de verdad;
- fijar un territorio no autorizado;
- incluir datos sensibles no permitidos al destinatario;
- ejecutar automáticamente acciones al abrirse.

---

#### 10. Tablas, matrices y densidad

1. Cada columna tendrá significado empresarial, formato, unidad, sensibilidad, fuente y capacidad de edición.
2. Las columnas técnicas, IDs internos y campos de integración permanecerán ocultos salvo necesidad explícita.
3. La densidad podrá ser cómoda, estándar o compacta, sin reducir tamaño táctil o legibilidad por debajo del contrato de accesibilidad.
4. Las columnas esenciales permanecerán identificables al desplazar horizontalmente.
5. El encabezado mostrará orden, filtro, unidad y ayuda contextual cuando sea necesario.
6. Los totales y subtotales declararán población, moneda o unidad, fecha de corte y redondeo.
7. Las filas expandidas no sustituirán una pantalla de detalle cuando la información o acción sea material.
8. La virtualización no cambiará orden, selección, foco ni conteos.
9. La cuadrícula no copiará celdas no visibles o no autorizadas.
10. Los valores vacíos, cero, no aplica, desconocido y no autorizado serán estados distintos.

---

#### 11. Teclado y accesibilidad

El modo experto deberá admitir, según la tarea:

- navegación de teclado entre regiones, filas, celdas y controles;
- foco visible y predecible;
- selección con teclado sin depender únicamente de casillas pequeñas;
- atajos documentados y no conflictivos con el navegador;
- anuncio accesible de errores, resultados, cambios de selección y progreso;
- etiquetas completas para iconos y acciones;
- orden de lectura coherente;
- alternativa a interacción de arrastrar y soltar;
- escalado y zoom sin pérdida de acciones;
- densidad ajustable por persona sin alterar permisos ni datos.

Los atajos aceleran una acción existente; no crean una acción nueva ni omiten confirmaciones requeridas.

---

#### 12. Selección exacta

Toda selección declarará uno de estos alcances:

| Código         | Significado                                                 |
| -------------- | ----------------------------------------------------------- |
| `SEL_VISIBLE`  | elementos visibles en la página o ventana actual            |
| `SEL_MATCHING` | todos los elementos que cumplen la consulta congelada       |
| `SEL_EXPLICIT` | lista de identificadores seleccionados individualmente      |
| `SEL_RANGE`    | rango continuo con criterio y orden definidos               |
| `SEL_GROUP`    | grupo empresarial explícito, como sede, periodo o categoría |
| `SEL_IMPORTED` | población procedente de un archivo validado y versionado    |

Reglas:

1. `Seleccionar todo` no podrá alternar silenciosamente entre página y consulta completa.
2. La cantidad seleccionada permanecerá visible.
3. Las exclusiones se enumerarán o contabilizarán con motivo.
4. Cambiar filtros, orden, alcance o versión invalidará o recalculará la selección.
5. La selección no incluirá filas que la persona no puede volver a resolver en servidor.
6. Una selección grande podrá representarse como consulta congelada, no como lista enviada desde el navegador.
7. La selección caducará cuando el cambio de datos haga insegura su aplicación.

---

#### 13. Edición en línea

La edición directa en tabla solo se permitirá cuando:

- el campo sea explícitamente editable;
- la mutación tenga alcance acotado;
- la relación con otros campos sea comprensible;
- exista validación inmediata;
- el valor anterior permanezca visible o recuperable;
- la versión base se controle;
- el guardado no equivalga a aprobación o publicación;
- la acción no requiera evidencia, motivo o revisión extensa.

No se permitirá edición en línea ordinaria para:

- roles y permisos críticos;
- cierres, reaperturas, anulaciones o bajas;
- secretos;
- hechos físicos históricos;
- conciliaciones finalizadas;
- pagos ejecutados;
- identidad protegida;
- cambios con impacto transversal no simulado.

Los cambios de varias celdas se mantendrán como conjunto pendiente hasta guardar o descartar. El sistema deberá mostrar qué filas tienen cambios sin enviar.

---

#### 14. Ciclo de acción masiva

Toda acción masiva seguirá:

```text
1. DEFINIR POBLACION
2. CONGELAR CONSULTA, VERSION Y ALCANCE
3. DECLARAR CAMBIO O REGLA
4. VALIDAR PERMISOS Y PRECONDICIONES
5. SIMULAR IMPACTO
6. MOSTRAR INCLUIDOS, EXCLUIDOS Y ERRORES
7. OBTENER APROBACION CUANDO APLIQUE
8. CREAR INTENCION IDEMPOTENTE
9. EJECUTAR POR LOTES CONTROLADOS
10. MOSTRAR RESULTADO POR OBJETO
11. REINTENTAR SOLO ELEMENTOS SEGUROS
12. CORREGIR, COMPENSAR O CONCILIAR
13. CERRAR CON RECEIPT Y EVIDENCIA
```

No se permitirá convertir una acción individual en masiva únicamente repitiendo llamadas desde el cliente.

---

#### 15. Simulación, validación y resultado parcial

La previsualización deberá informar:

- cantidad total;
- cantidad autorizada;
- cantidad excluida;
- cantidad con error;
- cambios esperados;
- dependencias;
- conflictos;
- impactos por empresa o sede;
- campos sensibles afectados;
- aprobaciones requeridas;
- reversibilidad;
- tiempo o ventana estimada cuando sea material.

Después de ejecutar se distinguirá:

- aplicado;
- no aplicable;
- omitido;
- rechazado por permiso;
- rechazado por versión;
- fallido;
- pendiente;
- resultado desconocido;
- compensado;
- requiere conciliación.

Un resultado parcial nunca se resumirá como éxito completo.

---

#### 16. Importaciones y correcciones por archivo

Toda importación usará un área de preparación separada de la fuente de verdad:

1. cargar archivo;
2. identificar formato y versión;
3. mapear columnas;
4. validar tipo, unidad y referencia;
5. detectar duplicados;
6. mostrar filas válidas, advertidas y rechazadas;
7. comparar contra datos vigentes;
8. corregir sin alterar el archivo original;
9. congelar lote;
10. revisar impacto;
11. aprobar cuando corresponda;
12. aplicar idempotentemente;
13. emitir resultado por fila.

El archivo no podrá otorgar permisos, elegir territorio fuera de alcance ni reemplazar valores protegidos solo porque incluya una columna con ese nombre.

---

#### 17. Comparación y conciliación

Toda comparación deberá declarar:

- objetos o fuentes comparadas;
- periodo y fecha de corte;
- versión;
- unidad y moneda;
- tolerancia;
- regla de equivalencia;
- campos ausentes;
- diferencias materiales;
- dueño de cada fuente;
- acción permitida sobre la diferencia.

La conciliación no editará ambas fuentes para “hacerlas coincidir”. Identificará el hecho correcto, el origen del error y la tarea propietaria de corrección.

---

#### 18. Auditoría e investigación

El modo de auditoría permitirá:

- buscar por actor, objeto, proceso, permiso, sede, área, dispositivo, fecha, correlación o receipt;
- reconstruir antes y después;
- ordenar cronológicamente;
- seguir handoffs entre aplicaciones;
- ver decisiones y razones;
- abrir evidencia autorizada;
- identificar eventos faltantes o duplicados;
- conservar filtros de investigación;
- anotar conclusiones en un expediente separado;
- exportar un conjunto autorizado.

No permitirá:

- editar eventos históricos;
- ocultar eventos;
- reescribir actor o fecha;
- corregir directamente la fuente desde la línea de tiempo;
- revelar datos protegidos sin capacidad;
- presentar telemetría como auditoría empresarial.

---

#### 19. Línea de tiempo y evidencia

Cada evento mostrará cuando exista:

- fecha y hora con zona;
- actor humano;
- principal técnico;
- aplicación;
- proceso, caso u objeto;
- acción;
- estado anterior;
- estado posterior;
- empresa, sede y área;
- dispositivo o canal;
- motivo;
- correlación;
- receipt;
- evidencia;
- resultado.

Los eventos simultáneos o fuera de orden deberán conservar hora de ocurrencia, hora de recepción y relación causal cuando esté disponible.

---

#### 20. Exportación y revelación de datos

Toda exportación declarará:

- propósito;
- población;
- filtros;
- columnas;
- clasificación;
- enmascaramiento;
- actor;
- fecha;
- aplicación propietaria;
- formato;
- retención o caducidad;
- receipt.

Exportar no será una extensión automática de consultar. Las exportaciones grandes podrán ejecutarse como tarea asíncrona y deberán volver a validar permiso y alcance al generarse y al descargarse.

---

#### 21. Concurrencia, versiones y borradores

1. Cada objeto editable tendrá versión visible o token equivalente.
2. Guardar sobre una versión desactualizada exigirá comparar cambios.
3. No se aplicará “último guardado gana” sobre campos sensibles o relacionados.
4. Los cambios pendientes podrán conservarse como borrador sin producir efectos.
5. Un borrador podrá ser personal, compartido o enviado a revisión según contrato.
6. Los locks serán explícitos, temporales y recuperables; no sustituirán control de versión.
7. Una pestaña duplicada o sesión paralela no podrá sobrescribir silenciosamente.
8. La reapertura de un conjunto masivo conservará población, exclusiones, simulación y versión.
9. Cambiar al modo guiado conservará el mismo borrador autorizado.

---

#### 22. Errores, latencia y estado desactualizado

La superficie diferenciará:

- cargando;
- sin resultados;
- resultado parcial;
- datos desactualizados;
- sin permiso;
- consulta inválida;
- servicio no disponible;
- conflicto de versión;
- acción en ejecución;
- acción finalizada;
- resultado desconocido.

Cuando no exista conectividad:

- una vista almacenada se marcará como desactualizada;
- no se presentará como estado vigente;
- los cambios materiales no se enviarán a una cola ciega;
- los borradores locales, si se autorizan, no producirán efecto;
- la reanudación revalidará consulta, selección, versión, permiso y alcance.

---

#### 23. Seguridad, privacidad y segregación

1. Las columnas sensibles se enmascararán por defecto.
2. Revelar, copiar, descargar o exportar tendrán capacidades independientes.
3. La consulta del navegador no será el límite de seguridad.
4. El servidor filtrará filas, columnas y acciones.
5. La selección masiva no podrá incluir objetos fuera del territorio autorizado.
6. Preparar, revisar, aprobar, ejecutar y conciliar podrán requerir actores distintos.
7. La simulación de rol estará marcada y no producirá cambios.
8. Una acción sensible podrá exigir reautenticación.
9. Los mensajes de error no revelarán la existencia de objetos no autorizados.
10. El modo experto no estará disponible desde una identidad técnica de estación compartida como actor administrativo.

---

#### 24. Propiedad funcional y cruces entre aplicaciones

Una superficie experta podrá mostrar información proveniente de varias aplicaciones, pero deberá:

- identificar la fuente;
- diferenciar dato canónico, proyección y dato calculado;
- enviar cada mutación a su propietario;
- conservar correlación;
- evitar redigitación;
- mantener retorno al contexto;
- mostrar resultado por aplicación;
- crear tareas de conciliación cuando exista fallo parcial.

VISO podrá actuar como punto de entrada administrativo, pero no adquirirá por ello propiedad sobre órdenes, inventario, recetas, ventas, puntos o hechos financieros.

---

#### 25. Interoperabilidad con modo guiado

El cambio de superficie seguirá estas reglas:

| Desde          | Hacia             | Debe conservar                                                                             |
| -------------- | ----------------- | ------------------------------------------------------------------------------------------ |
| experto        | guiado            | objeto, población, borrador, alcance, versión, diferencias, simulación y acción solicitada |
| guiado         | experto           | caso, dependencias, datos ya validados, borrador y motivo de retorno                       |
| auditoría      | guiado            | evento o diferencia origen, sin transportar autoridad                                      |
| comparación    | corrección guiada | objetos, fuente, evidencia y discrepancia                                                  |
| campaña masiva | aprobación guiada | población congelada, exclusiones, impacto y versión                                        |

Cambiar de modo no permitirá omitir pasos obligatorios ni crear un segundo receipt.

---

#### 26. Adaptación por dispositivo

El modo experto se diseñará primero para escritorio o pantalla con espacio suficiente cuando la tarea requiera alta densidad. En tablet podrá:

- priorizar bandejas;
- consulta;
- detalle;
- aprobación;
- acciones acotadas;
- planificación simplificada.

Una adaptación pequeña no ocultará alcance, selección, impacto, errores o estado. Cuando una tarea masiva o comparativa no sea segura en tablet, se declarará no compatible para edición y se conservará consulta o aprobación proporcional.

---

#### 27. Rendimiento y volumen

Cada superficie declarará:

- volumen ordinario;
- volumen de pico;
- tamaño de página o ventana;
- estrategia de búsqueda;
- orden estable;
- tiempo objetivo para primera respuesta;
- tiempo objetivo para aplicar filtros;
- límite de selección;
- límite sincrónico;
- umbral de proceso asíncrono;
- forma de progreso;
- comportamiento ante timeout.

La experiencia no dependerá de cargar toda la población en el navegador. Los conteos, totales y exportes deberán declarar su exactitud y fecha de corte.

---

#### 28. Instrumentación

Podrán medirse:

- tiempo hasta encontrar un objeto;
- consultas sin resultado;
- filtros utilizados;
- vistas guardadas;
- errores de selección;
- cambios descartados;
- conflictos;
- simulaciones;
- campañas parciales;
- reanudaciones;
- uso de modo guiado;
- abandono;
- tiempo hasta resolución.

La telemetría excluirá contenido sensible innecesario y no reemplazará auditoría ni evidencia empresarial.

---

#### 29. Matriz de encaminamiento de las 41 familias expertas

| Familia        | Dominio           | Propietario            | Arquetipo principal             | Arquetipo de apoyo              | Uso aprobado                                                                                                    |
| -------------- | ----------------- | ---------------------- | ------------------------------- | ------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `ADM-TASK-008` | `ADM-PEOPLE`      | TALENTO                | `EM-01_BANDEJA_CASOS`           | `EM-05_COMPARADOR_CONCILIADOR`  | Gestionar candidatos por etapa, responsable, SLA, evaluación y decisión sin perder comparación entre perfiles.  |
| `ADM-TASK-013` | `ADM-WORKFORCE`   | VISO                   | `EM-04_PLANIFICADOR`            | `EM-03_MATRIZ_EDICION`          | Construir y publicar programación semanal con cobertura, conflictos y cambios visibles.                         |
| `ADM-TASK-014` | `ADM-WORKFORCE`   | VISO                   | `EM-03_MATRIZ_EDICION`          | `EM-04_PLANIFICADOR`            | Asignar en volumen sede, área y rol operativo por turno con validación territorial y de compatibilidad.         |
| `ADM-TASK-015` | `ADM-WORKFORCE`   | VISO                   | `EM-01_BANDEJA_CASOS`           | `EM-04_PLANIFICADOR`            | Resolver ausencias, reemplazos y rotaciones desde una bandeja priorizada con impacto de cobertura.              |
| `ADM-TASK-024` | `ADM-ACCESS`      | VISO                   | `EM-07_AUDITORIA_TRAZABILIDAD`  | `EM-02_EXPLORADOR_REGISTROS`    | Investigar cambios de seguridad, origen de permisos y exportes autorizados sin editar el historial.             |
| `ADM-TASK-028` | `ADM-CATALOG`     | PULSO / NUMERA         | `EM-08_EDITOR_REGLAS_VERSIONES` | `EM-03_MATRIZ_EDICION`          | Preparar listas de precios, impuestos y vigencias en borrador, comparar diferencias y publicar por alcance.     |
| `ADM-TASK-029` | `ADM-CATALOG`     | PULSO                  | `EM-03_MATRIZ_EDICION`          | `EM-06_CAMPANA_MASIVA`          | Mantener surtido, modificadores y disponibilidad por sede o canal con selección exacta y resultado por fila.    |
| `ADM-TASK-030` | `ADM-CATALOG`     | NEXO / FOGO / PULSO    | `EM-05_COMPARADOR_CONCILIADOR`  | `EM-07_AUDITORIA_TRAZABILIDAD`  | Detectar duplicados, huérfanos y contradicciones, comparar fuentes y abrir correcciones separadas.              |
| `ADM-TASK-036` | `ADM-RECIPE`      | FOGO                   | `EM-05_COMPARADOR_CONCILIADOR`  | `EM-07_AUDITORIA_TRAZABILIDAD`  | Comparar rendimiento, desperdicio, reproceso y estándar por receta, lote, área y periodo.                       |
| `ADM-TASK-038` | `ADM-PROCUREMENT` | ORIGO                  | `EM-03_MATRIZ_EDICION`          | `EM-06_CAMPANA_MASIVA`          | Mantener productos por proveedor, precios, mínimos y plazos con edición densa y validación por fila.            |
| `ADM-TASK-040` | `ADM-PROCUREMENT` | ORIGO                  | `EM-01_BANDEJA_CASOS`           | `EM-03_MATRIZ_EDICION`          | Preparar órdenes de compra de alto volumen, conservar borradores y separar emisión, cancelación y aprobación.   |
| `ADM-TASK-043` | `ADM-INVENTORY`   | NEXO                   | `EM-02_EXPLORADOR_REGISTROS`    | `EM-08_EDITOR_REGLAS_VERSIONES` | Navegar la jerarquía de ubicaciones, detectar inconsistencias y abrir cambios estructurados.                    |
| `ADM-TASK-044` | `ADM-INVENTORY`   | NEXO                   | `EM-03_MATRIZ_EDICION`          | `EM-08_EDITOR_REGLAS_VERSIONES` | Comparar y mantener perfiles de inventario, unidades y ubicaciones predeterminadas por producto y sede.         |
| `ADM-TASK-045` | `ADM-INVENTORY`   | NEXO                   | `EM-03_MATRIZ_EDICION`          | `EM-06_CAMPANA_MASIVA`          | Configurar mínimos, máximos y cobertura en volumen con simulación y exclusiones explícitas.                     |
| `ADM-TASK-046` | `ADM-INVENTORY`   | NEXO                   | `EM-04_PLANIFICADOR`            | `EM-01_BANDEJA_CASOS`           | Planear conteos, congelar alcance, asignar responsables y detectar superposiciones.                             |
| `ADM-TASK-050` | `ADM-PRODUCTION`  | FOGO                   | `EM-04_PLANIFICADOR`            | `EM-08_EDITOR_REGLAS_VERSIONES` | Modelar demanda, capacidad y calendario productivo con escenarios comparables.                                  |
| `ADM-TASK-051` | `ADM-PRODUCTION`  | FOGO                   | `EM-01_BANDEJA_CASOS`           | `EM-04_PLANIFICADOR`            | Crear, liberar, reprogramar y cancelar planes u órdenes conservando estado, capacidad e impacto.                |
| `ADM-TASK-052` | `ADM-PRODUCTION`  | FOGO                   | `EM-08_EDITOR_REGLAS_VERSIONES` | `EM-07_AUDITORIA_TRAZABILIDAD`  | Administrar numeración de lotes y reglas de trazabilidad mediante versiones y publicación controlada.           |
| `ADM-TASK-053` | `ADM-PRODUCTION`  | FOGO / VISO            | `EM-04_PLANIFICADOR`            | `EM-02_EXPLORADOR_REGISTROS`    | Relacionar áreas, recursos, calendarios y capacidad por turno sin duplicar propiedad funcional.                 |
| `ADM-TASK-054` | `ADM-PRODUCTION`  | FOGO / NUMERA          | `EM-05_COMPARADOR_CONCILIADOR`  | `EM-07_AUDITORIA_TRAZABILIDAD`  | Conciliar rendimiento, consumo, desperdicio, variaciones y cierre con trazabilidad al origen.                   |
| `ADM-TASK-057` | `ADM-SALES`       | PULSO                  | `EM-03_MATRIZ_EDICION`          | `EM-06_CAMPANA_MASIVA`          | Publicar catálogo, combos y restricciones por sede o canal con cambios masivos controlados.                     |
| `ADM-TASK-059` | `ADM-SALES`       | PULSO / NUMERA         | `EM-01_BANDEJA_CASOS`           | `EM-05_COMPARADOR_CONCILIADOR`  | Revisar aperturas, cierres, arqueos y diferencias diarias; la decisión sensible continúa en modo guiado.        |
| `ADM-TASK-064` | `ADM-CUSTOMER`    | PULSO / PASS           | `EM-01_BANDEJA_CASOS`           | `EM-04_PLANIFICADOR`            | Gestionar reservas y eventos por fecha, capacidad, anticipo, estado y responsable.                              |
| `ADM-TASK-066` | `ADM-LOGISTICS`   | NEXO                   | `EM-04_PLANIFICADOR`            | `EM-08_EDITOR_REGLAS_VERSIONES` | Mantener rutas, cortes, ventanas y prioridades con versiones y conflictos visibles.                             |
| `ADM-TASK-067` | `ADM-LOGISTICS`   | NEXO                   | `EM-04_PLANIFICADOR`            | `EM-01_BANDEJA_CASOS`           | Planear despacho, vehículo, conductor, carga y capacidad con advertencias de incompatibilidad.                  |
| `ADM-TASK-068` | `ADM-LOGISTICS`   | NEXO                   | `EM-03_MATRIZ_EDICION`          | `EM-08_EDITOR_REGLAS_VERSIONES` | Mantener tipos de contenedor, reglas de retorno, depósito y custodia en una matriz trazable.                    |
| `ADM-TASK-070` | `ADM-LOGISTICS`   | NEXO                   | `EM-01_BANDEJA_CASOS`           | `EM-02_EXPLORADOR_REGISTROS`    | Controlar disponibilidad, documentos, combustible y mantenimientos de vehículos.                                |
| `ADM-TASK-073` | `ADM-FINANCE`     | NUMERA                 | `EM-09_ANALITICA_REPORTES`      | `EM-08_EDITOR_REGLAS_VERSIONES` | Comparar presupuestos, supuestos y escenarios versionados antes de aprobar o publicar.                          |
| `ADM-TASK-074` | `ADM-FINANCE`     | NUMERA                 | `EM-01_BANDEJA_CASOS`           | `EM-03_MATRIZ_EDICION`          | Registrar y revisar gastos en volumen con soportes, clasificación, estados y excepciones.                       |
| `ADM-TASK-075` | `ADM-FINANCE`     | NUMERA                 | `EM-01_BANDEJA_CASOS`           | `EM-05_COMPARADOR_CONCILIADOR`  | Gestionar obligaciones y propuestas de pago con vencimiento, soporte, aprobación y resultado.                   |
| `ADM-TASK-076` | `ADM-FINANCE`     | NUMERA                 | `EM-01_BANDEJA_CASOS`           | `EM-05_COMPARADOR_CONCILIADOR`  | Gestionar cartera, vencimientos, recaudos, aplicación y acuerdos por caso y población.                          |
| `ADM-TASK-077` | `ADM-FINANCE`     | NUMERA                 | `EM-05_COMPARADOR_CONCILIADOR`  | `EM-07_AUDITORIA_TRAZABILIDAD`  | Conciliar ventas, pagos, bancos, caja, compras y recepciones mostrando fuentes y diferencias.                   |
| `ADM-TASK-078` | `ADM-FINANCE`     | NUMERA                 | `EM-09_ANALITICA_REPORTES`      | `EM-07_AUDITORIA_TRAZABILIDAD`  | Analizar costos, variaciones, margen y rentabilidad con navegación hasta el hecho fuente.                       |
| `ADM-TASK-080` | `ADM-FINANCE`     | NUMERA                 | `EM-09_ANALITICA_REPORTES`      | `EM-06_CAMPANA_MASIVA`          | Preparar reportes y exportes oficiales con alcance, versión, clasificación y finalidad.                         |
| `ADM-TASK-082` | `ADM-CHANNELS`    | VISO / canal externo   | `EM-04_PLANIFICADOR`            | `EM-01_BANDEJA_CASOS`           | Planear calendario de contenido, responsables, canales y aprobaciones.                                          |
| `ADM-TASK-084` | `ADM-CHANNELS`    | PULSO / VISO           | `EM-01_BANDEJA_CASOS`           | `EM-05_COMPARADOR_CONCILIADOR`  | Gestionar oportunidades B2B, cotizaciones, condiciones, aprobaciones y traspasos.                               |
| `ADM-TASK-086` | `ADM-PLATFORM`    | SHELL                  | `EM-01_BANDEJA_CASOS`           | `EM-07_AUDITORIA_TRAZABILIDAD`  | Gestionar solicitudes, incidentes y problemas con prioridad, SLA, dependencia y evidencia.                      |
| `ADM-TASK-093` | `ADM-ANALYTICS`   | VISO / NUMERA / fuente | `EM-08_EDITOR_REGLAS_VERSIONES` | `EM-09_ANALITICA_REPORTES`      | Definir indicadores, dimensiones, fórmula, propietario y versión con prueba contra fuentes.                     |
| `ADM-TASK-094` | `ADM-ANALYTICS`   | VISO / NUMERA          | `EM-09_ANALITICA_REPORTES`      | `EM-02_EXPLORADOR_REGISTROS`    | Crear, guardar, compartir y programar tableros o reportes sin convertir una vista en autoridad.                 |
| `ADM-TASK-095` | `ADM-ANALYTICS`   | Aplicación propietaria | `EM-06_CAMPANA_MASIVA`          | `EM-05_COMPARADOR_CONCILIADOR`  | Preparar importaciones, exportaciones y correcciones masivas mediante staging, simulación y resultado por fila. |
| `ADM-TASK-096` | `ADM-ANALYTICS`   | VISO                   | `EM-07_AUDITORIA_TRAZABILIDAD`  | `EM-02_EXPLORADOR_REGISTROS`    | Investigar anomalías, reconstruir historia y conservar conclusiones sin mutar el hecho auditado.                |

La matriz cierra `C-ADMIN-002` y `C-ADMIN-009`. La asignación física a rutas y pantallas permanece en `PROC-SCREEN-001` a `PROC-SCREEN-028`.

---

#### 30. Carryovers con destino exacto

| Carryover     | Condición pendiente                                                           | Tarea propietaria de cierre                                           |
| ------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `C-ADMIN-001` | Seleccionar patrones concretos de modo guiado                                 | **CERRADO por `UX-ADMIN-002`**                                        |
| `C-ADMIN-002` | Seleccionar patrones concretos de modo experto, consulta y edición masiva     | **CERRADO por `UX-ADMIN-003`**                                        |
| `C-ADMIN-009` | Diseñar superficie experta interoperable con borradores y revisiones guiadas  | **CERRADO por `UX-ADMIN-003`**                                        |
| `C-ADMIN-003` | Definir ayudas, validación preventiva y vista previa de impacto               | `UX-ADMIN-004`                                                        |
| `C-ADMIN-010` | Definir microcopias, ayudas, ejemplos y detalle visual del impacto            | `UX-ADMIN-004`                                                        |
| `C-ADMIN-004` | Validar flujos representativos con administradores                            | `UX-ADMIN-005`; `VISO-UX-020`                                         |
| `C-ADMIN-011` | Prototipar arquetipos representativos y comprobar comprensión y productividad | `UX-ADMIN-005`                                                        |
| `C-ADMIN-012` | Asignar cada `ADM-TASK-*` a pantallas y acciones definitivas                  | `PROC-SCREEN-001 a PROC-SCREEN-028`                                   |
| `C-ADMIN-013` | Materializar persistencia, concurrencia, idempotencia y receipts              | `PROC-SCREEN-001 a PROC-SCREEN-028`; `SHELL-CON-012`; `SHELL-CON-015` |
| `C-ADMIN-014` | Materializar handoffs y retornos entre aplicaciones                           | `SHELL-CON-014`; `SHELL-CON-016`; `PROC-SCREEN-001 a PROC-SCREEN-028` |
| `C-ADMIN-016` | Definir formatos, clasificación, retención y entrega de exportes              | `EVID-ARC-001 a EVID-ARC-010`; `PROC-SCREEN-001 a PROC-SCREEN-028`    |
| `C-ADMIN-017` | Definir presupuestos técnicos por pantalla y conjunto de datos                | `NFR-REQ-002`; `NFR-REQ-003`; `PROC-SCREEN-001 a PROC-SCREEN-028`     |
| `C-ADMIN-018` | Implementar, probar y certificar superficies expertas                         | tareas UX de cada aplicación; paquetes E5; `UX-QA-020` a `UX-QA-029`  |

No queda pendiente narrativo sin tarea y momento de resolución.

---

#### 31. Requisitos de prueba derivados

**Resultado:** GENERA 37 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-376` a `TREQ-UX-412` al Registro Canónico completo. Todos quedan en `IDENTIFICADO`; la definición visual detallada corresponde a `UX-ADMIN-004`, la validación a `UX-ADMIN-005`, la asignación física a `PROC-SCREEN-*` y la implementación a los paquetes E5 y BLOQUE U.

---

#### 32. Criterios de aceptación

- [x] El modo experto se define por tarea, frecuencia, volumen y comparación, no por cargo.
- [x] Se prohíbe una tabla universal o un clon de hoja de cálculo sin contrato.
- [x] Se crean diez arquetipos reutilizables.
- [x] Se clasifican las 41 familias candidatas de `UX-ADMIN-001`.
- [x] Se define marco común de contexto, consulta, selección, acciones, detalle y resultado.
- [x] Se definen búsqueda, filtros, orden, vistas guardadas y personalización.
- [x] Se definen columnas, densidad, teclado y accesibilidad.
- [x] Se diferencia selección visible, por consulta, explícita, por rango, grupo e importación.
- [x] Se define edición en línea controlada.
- [x] Se define ciclo completo de acción masiva.
- [x] Se definen importación, simulación, resultado parcial y conciliación.
- [x] La auditoría permanece inmutable y separada de corrección.
- [x] Se definen exportación, datos sensibles, concurrencia y borradores.
- [x] Se conserva propiedad funcional y handoff entre aplicaciones.
- [x] Se cierra interoperabilidad con el modo guiado.
- [x] Se definen adaptación por dispositivo, rendimiento e instrumentación.
- [x] Todos los carryovers tienen tarea propietaria exacta.
- [x] Se incorporan `TREQ-UX-376` a `TREQ-UX-412`.
- [x] No se implementa código, Supabase, rutas, componentes ni cambios productivos.
- [x] `UX-ADMIN-004` permanece no iniciada.

---

#### 33. Resultado y continuidad

```text
UX-ADMIN-001 APROBADA
UX-ADMIN-002 APROBADA
UX-ADMIN-003 APROBADA
UX-ADMIN-004 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-ADMIN-004 — Definir ayudas contextuales, validación preventiva y vista previa de impacto
```


### ✅ UX-ADMIN-004 — Definir ayudas contextuales, validación preventiva y vista previa de impacto

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-ADMIN-004 — Definir ayudas contextuales, validación preventiva y vista previa de impacto`

**Tarea anterior:** `UX-ADMIN-003 — Diseñar modo experto para consulta, edición masiva y auditoría` — APROBADA

**Siguiente tarea reservada:** `UX-ADMIN-005 — Prototipar y aprobar flujos administrativos con usuarios reales` — NO INICIADA

**Artefactos producidos:**

- `UX-ADMIN-CONTEXTUAL-ASSISTANCE-CONTRACT-001`;
- `UX-ADMIN-HELP-LAYER-CATALOG-001`;
- `UX-ADMIN-HELP-CONTENT-GOVERNANCE-001`;
- `UX-ADMIN-PREVENTIVE-VALIDATION-CONTRACT-001`;
- `UX-ADMIN-VALIDATION-SEVERITY-TAXONOMY-001`;
- `UX-ADMIN-VALIDATION-TIMING-MATRIX-001`;
- `UX-ADMIN-IMPACT-CLASSIFICATION-001`;
- `UX-ADMIN-IMPACT-PREVIEW-CONTRACT-001`;
- `UX-ADMIN-CONFIRMATION-APPROVAL-CONTRACT-001`;
- `UX-ADMIN-ERROR-RECOVERY-CONTRACT-001`;
- `UX-ADMIN-CROSS-APP-IMPACT-CONTRACT-001`;
- `UX-ADMIN-HELP-VALIDATION-IMPACT-MATRIX-001`;
- `UX-ADMIN-CARRYOVER-REGISTER-004`.

**Cobertura:** los **16 dominios administrativos**, las **98 familias `ADM-TASK-*`**, los **10 arquetipos guiados** de `UX-ADMIN-002` y los **10 arquetipos expertos** de `UX-ADMIN-003`.

**Naturaleza:** contrato documental transversal para explicar, prevenir errores, mostrar consecuencias y guiar recuperación antes y después de una acción administrativa. No implementa componentes, reglas de servidor, motor de simulación ni contenidos definitivos por pantalla.

**Cambios en código, aplicaciones, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, integraciones, hardware o producción:** no autorizados.

---

#### 1. Propósito

Definir cómo Vento OS deberá ayudar a una persona administrativa a comprender una tarea, detectar errores antes de comprometer cambios, revisar consecuencias materiales y recuperarse cuando una acción no pueda completarse con seguridad.

```text
INTENCION Y CONTEXTO COMPRENSIBLES
→ DATOS Y DEPENDENCIAS VALIDADOS TEMPRANO
→ CONSECUENCIAS VISIBLES ANTES DE EJECUTAR
→ DECISION, APROBACION O CORRECCION INFORMADA
→ RESULTADO Y CAMBIOS REALES EXPLICADOS
→ RECEIPT, RECUPERACION Y SIGUIENTE ACCION
```

La ayuda no compensará una interfaz confusa. La validación del cliente no sustituirá autorización ni reglas empresariales del servidor. La vista previa no ejecutará la acción ni garantizará un resultado que pueda cambiar antes del compromiso final.

---

#### 2. Decisiones canónicas

1. La ayuda contextual se asociará con la tarea, el campo, el estado y la decisión actual; no será un manual genérico separado del trabajo.
2. La interfaz deberá intentar ser comprensible sin ayuda. La ayuda ampliará significado, consecuencias o excepciones, pero no ocultará información indispensable detrás de un icono.
3. Toda validación material se repetirá en servidor. La validación preventiva de interfaz reducirá errores, pero nunca concederá autoridad ni reemplazará reglas canónicas.
4. Información, sugerencia, advertencia, bloqueo, conflicto, denegación y resultado desconocido serán estados diferentes con tratamiento visual y semántico diferente.
5. Una advertencia no se utilizará cuando la acción sea inválida: una condición inválida deberá bloquearse.
6. Una vista previa declarará si el impacto es exacto, estimado, parcial o todavía no calculable.
7. Una vista previa caduca cuando cambian población, versión, permiso, alcance, dependencias, fecha de corte o datos fuente.
8. Guardar, enviar, aprobar, aplicar, publicar, cerrar, anular y eliminar conservarán intención y consecuencia diferenciadas.
9. Una confirmación no sustituirá una aprobación, segregación de funciones, reason code ni autenticación reforzada.
10. Los mensajes evitarán códigos técnicos como contenido principal y deberán indicar qué ocurrió, qué no ocurrió y cuál es la siguiente acción segura.
11. El modo guiado ofrecerá explicación progresiva y revisión estructurada; el modo experto ofrecerá ayudas compactas, diagnósticos precisos y acceso rápido a detalle.
12. VISO podrá mostrar impacto transversal, pero la aplicación propietaria conservará la mutación, la regla y el receipt de su dominio.
13. Los efectos sobre datos sensibles, accesos, dinero, inventario, producción, clientes, publicaciones o integraciones externas siempre serán explícitos y proporcionales al riesgo.
14. `UX-ADMIN-005` validará comprensión y utilidad con administradores; `PROC-SCREEN-*` asignará estos contratos a pantallas y acciones concretas.

---

#### 3. Dependencias y límites preservados

Esta tarea consume y no reemplaza:

- `UX-ADMIN-001`, sus 16 dominios y 98 familias administrativas;
- `UX-ADMIN-002`, sus arquetipos guiados, borradores, revisión y publicación;
- `UX-ADMIN-003`, sus arquetipos expertos, selección, edición masiva, auditoría y conciliación;
- `UX-BASE-001` a `UX-BASE-015`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- `UX-STATION-001` a `UX-STATION-012`;
- los contratos `AUTH-*` de actor, permiso, territorio, segregación, privacidad y dispositivo;
- los procesos `VPROC-0001` a `VPROC-0069`;
- la propiedad funcional de VISO, TALENTO, ANIMA, NEXO, FOGO, ORIGO, PULSO, PASS, NUMERA y SHELL;
- los contratos futuros de acciones, eventos, tareas pendientes, handoffs, evidencia, notificaciones y receipts.

Esta tarea no:

- redacta todavía toda la microcopia de cada pantalla;
- define estilos visuales físicos, tokens, colores ni componentes finales;
- implementa validadores, esquemas, RPC, RLS, simuladores o motores de reglas;
- convierte una vista previa en una garantía transaccional;
- autoriza una acción por haber superado validaciones de interfaz;
- expone reglas, campos o datos que la persona no esté autorizada a conocer;
- crea un centro de ayuda universal sin propietario ni versión;
- sustituye capacitación, política empresarial, soporte o piloto cuando estos sean necesarios.

---

#### 4. Distinciones obligatorias

```text
AYUDA CONTEXTUAL
≠ INSTRUCCION EMPRESARIAL COMPLETA
≠ CAPACITACION
≠ SOPORTE TECNICO

VALIDACION PREVENTIVA
≠ AUTORIZACION
≠ REGLA SOLO DE FRONTEND
≠ GARANTIA DE EXITO

VISTA PREVIA
≠ EJECUCION
≠ RECEIPT
≠ ESTADO FINAL

CONFIRMACION
≠ APROBACION
≠ SEGREGACION
≠ AUTENTICACION REFORZADA

ADVERTENCIA
≠ BLOQUEO
≠ ERROR
≠ RESULTADO DESCONOCIDO
```

---

#### 5. Unidad mínima del contrato

Cada acción administrativa deberá poder declarar:

```text
TASK_FAMILY
+ BUSINESS_OBJECT
+ CURRENT_STATE
+ ADMINISTRATIVE_INTENT
+ ACTOR_AND_SCOPE
+ INPUTS_AND_DEPENDENCIES
+ VALIDATION_RULES
+ IMPACT_CLASS
+ PREVIEW_REQUIREMENT
+ COMMIT_ACTION
+ RESULT_AND_RECEIPT
+ RECOVERY_PATH
```

No bastará definir ayuda o validación por aplicación completa. Dos acciones sobre el mismo objeto podrán exigir tratamientos distintos según estado, volumen, territorio, sensibilidad y consecuencia.

---

#### 6. Principio de autosuficiencia de la interfaz

La interfaz deberá mostrar directamente, sin requerir abrir ayuda:

- nombre humano del objeto y acción;
- estado actual;
- alcance empresarial y territorial;
- periodo o vigencia;
- campos obligatorios;
- unidad, formato y restricción material;
- acción primaria y resultado esperado;
- bloqueos actuales;
- consecuencia principal de una acción sensible.

Una ayuda no podrá ser el único lugar donde se revele:

- que una acción publica o activa una versión;
- que afecta múltiples sedes, personas u objetos;
- que elimina acceso;
- que modifica inventario, dinero, puntos o información sensible;
- que envía información a un tercero;
- que no puede revertirse automáticamente;
- que requiere otra aprobación;
- que el resultado es parcial o todavía desconocido.

---

#### 7. Capas de ayuda contextual

| Código                   | Capa                                         | Uso                                                                    | Regla                                                  |
| ------------------------ | -------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------ |
| `HL-0_SELF_EXPLANATORY`  | interfaz autosuficiente                      | etiquetas, unidades, estado y acción comprensibles                     | obligatoria antes de agregar ayuda                     |
| `HL-1_INLINE_HINT`       | aclaración breve junto al control            | formato, ejemplo corto, restricción o consecuencia inmediata           | no repetirá la etiqueta ni ocupará el lugar del error  |
| `HL-2_CONTEXT_PANEL`     | explicación contextual expandible            | dependencia, política, alcance, cálculo o decisión no evidente         | conservará objeto y contexto actual                    |
| `HL-3_EXAMPLE_CHECKLIST` | ejemplo, lista de verificación o comparación | altas complejas, publicaciones, conciliaciones o acciones infrecuentes | usará datos ficticios o autorizados y no secretos      |
| `HL-4_REFERENCE`         | referencia empresarial o técnica gobernada   | política, contrato, definición, procedimiento o fuente oficial         | declarará propietario, versión y vigencia              |
| `HL-5_SUPPORT_HANDOFF`   | traspaso a soporte o responsable             | bloqueo no resoluble, incidente, permiso o inconsistencia de datos     | incluirá referencia segura sin exponer datos sensibles |

No toda pantalla necesitará todas las capas. La ausencia de ayuda deberá ser una decisión consciente cuando la interfaz y la tarea sean suficientemente claras.

---

#### 8. Disparadores de ayuda

La ayuda podrá aparecer o sugerirse cuando:

- la tarea se utiliza por primera vez;
- cambió una regla, versión o significado relevante;
- un campo tiene formato, unidad o alcance no evidente;
- existen dependencias todavía no satisfechas;
- una acción es infrecuente, sensible o excepcional;
- la persona repite el mismo error;
- una vista está vacía y necesita explicar cómo comenzar;
- un permiso permite consultar pero no modificar;
- una acción requiere aplicación propietaria diferente;
- existe conflicto, resultado parcial o necesidad de conciliación.

La ayuda no interrumpirá repetidamente a una persona experta cuando ya haya sido comprendida, salvo cambio material, riesgo crítico o obligación normativa.

---

#### 9. Contrato del contenido de ayuda

Toda ayuda gobernada deberá declarar, cuando aplique:

- pregunta o necesidad que resuelve;
- audiencia y tarea;
- objeto y estado aplicables;
- alcance territorial o empresarial;
- contenido breve y contenido ampliado;
- ejemplo permitido;
- propietario funcional;
- versión y vigencia;
- fuente oficial;
- información sensible excluida;
- fecha o evento de revisión;
- enlace o handoff autorizado;
- métricas de uso y efectividad.

La ayuda utilizará terminología aprobada por `UX-BASE-015`. Los nombres técnicos, identificadores internos y códigos de error podrán mostrarse como detalle de soporte, nunca como explicación principal para una persona administrativa.

---

#### 10. Ayuda según modo de trabajo

##### 10.1 Modo guiado

El modo guiado priorizará:

- propósito del paso;
- por qué se solicita un dato;
- ejemplo válido;
- dependencia pendiente;
- condición para continuar;
- resumen de cambios antes de enviar;
- siguiente etapa y responsable.

No llenará cada paso de texto permanente. La explicación se ampliará cuando exista ambigüedad, riesgo o solicitud explícita.

##### 10.2 Modo experto

El modo experto priorizará:

- definiciones de columnas y métricas;
- alcance de filtros y selección;
- razón precisa de una celda inválida;
- reglas de comparación o tolerancia;
- impacto agregado y por elemento;
- diferencia entre dato fuente, cálculo y proyección;
- acceso rápido a historial, contrato o evidencia.

La ayuda no reducirá la densidad útil ni bloqueará navegación por teclado.

---

#### 11. Accesibilidad y dispositivos

Las ayudas, validaciones y vistas previas deberán:

- funcionar sin depender únicamente de color, hover o posición visual;
- estar asociadas programáticamente con el campo o acción correspondiente;
- anunciar cambios relevantes mediante tecnologías de asistencia;
- conservar orden lógico de lectura y foco;
- permitir ampliar texto sin perder contenido o controles;
- ser utilizables con teclado;
- evitar tooltips obligatorios en pantallas táctiles;
- permitir cerrar contenido no modal sin perder el trabajo;
- mantener contexto, errores e impacto en viewport reducido;
- evitar animaciones que oculten cambios o provoquen pérdida de orientación.

---

#### 12. Principio de validación preventiva

La validación preventiva deberá detectar una condición tan pronto como exista información suficiente para hacerlo, pero sin marcar como incorrecto un campo que la persona todavía no ha tenido oportunidad razonable de completar.

```text
VALIDAR TEMPRANO
+ EXPLICAR CERCA DEL PROBLEMA
+ CONSERVAR EL TRABAJO
+ OFRECER CORRECCION SEGURA
+ REVALIDAR EN SERVIDOR
```

Una acción material no se comprometerá cuando exista una condición bloqueante conocida. Una advertencia no impedirá continuar si la regla empresarial permite conscientemente asumir el riesgo y existe la autorización correspondiente.

---

#### 13. Momentos de validación

| Momento                       | Alcance                                                                    |
| ----------------------------- | -------------------------------------------------------------------------- |
| al seleccionar contexto       | empresa, sede, periodo, objeto, versión y permiso visibles                 |
| durante captura               | formato, tipo, unidad, rango y obligatoriedad razonable                    |
| al abandonar un campo         | regla local completa y relación inmediata con otros campos                 |
| al cerrar un paso             | coherencia del paso, dependencia y evidencia mínima                        |
| antes de revisión             | consistencia del borrador completo y efectos calculables                   |
| antes de enviar o comprometer | versión, autorización, segregación, población e impacto actualizados       |
| en servidor                   | todas las reglas canónicas, concurrencia, RLS, RPC, idempotencia y estado  |
| después del resultado         | resultado real, diferencias frente a la vista previa, pendientes y receipt |

Los mensajes no desaparecerán antes de que la causa haya sido corregida o la persona haya cambiado deliberadamente de contexto.

---

#### 14. Taxonomía de severidad

| Código                     | Estado                                        | Permite continuar             | Comportamiento obligatorio                                |
| -------------------------- | --------------------------------------------- | ----------------------------- | --------------------------------------------------------- |
| `VS-0_INFO`                | información                                   | sí                            | explica contexto o consecuencia sin señalar problema      |
| `VS-1_SUGGESTION`          | sugerencia                                    | sí                            | propone mejora opcional y explica beneficio               |
| `VS-2_WARNING`             | advertencia                                   | sí, si la política lo permite | describe riesgo concreto, alcance y alternativa           |
| `VS-3_BLOCKING_INPUT`      | dato inválido o incompleto                    | no                            | identifica campo o fila y forma de corregir               |
| `VS-4_BLOCKING_DEPENDENCY` | dependencia, estado o segregación incumplidos | no                            | identifica dependencia y responsable o siguiente acción   |
| `VS-5_CONFLICT`            | versión o cambio concurrente                  | no para mutación ciega        | permite comparar, recargar, conservar borrador o resolver |
| `VS-6_DENIED`              | autorización denegada                         | no                            | explica capacidad faltante sin revelar datos protegidos   |
| `VS-7_UNKNOWN_RESULT`      | resultado todavía no determinado              | no permite repetir ciegamente | exige consulta, conciliación o recuperación idempotente   |

Una severidad no se reducirá por conveniencia visual. La misma condición conservará significado equivalente en modo guiado, experto y aplicaciones distintas.

---

#### 15. Estructura del mensaje de validación

Cuando aplique, el mensaje deberá responder:

1. qué dato, objeto o condición presenta el problema;
2. por qué impide o afecta la acción;
3. qué consecuencia evita;
4. cómo puede corregirse;
5. quién puede resolverlo cuando no sea el actor actual;
6. si el trabajo quedó guardado;
7. qué identificador de soporte existe.

Ejemplo conceptual:

```text
NO SE PUEDE PUBLICAR ESTA PROGRAMACION
Dos turnos dejan Cocina sin cobertura el viernes entre 18:00 y 20:00.
Ajusta la asignacion o envia el caso al gerente autorizado.
El borrador permanece guardado.
```

Se evitarán mensajes como `Error 400`, `valor inválido`, `operación fallida` o `no autorizado` sin contexto suficiente.

---

#### 16. Alcances de validación

La validación podrá operar sobre:

- **campo:** formato, unidad, rango, obligatoriedad;
- **grupo:** coherencia entre campos relacionados;
- **objeto:** estado, versión, dependencias y reglas propias;
- **población:** duplicados, exclusiones, cobertura y selección;
- **periodo:** vigencia, cierre, solapamiento y fecha de corte;
- **territorio:** empresa, sede, área, centro de costo o canal;
- **segregación:** preparación, revisión, aprobación y aplicación;
- **cruce de aplicaciones:** referencias, propiedad, sincronización y disponibilidad;
- **externo:** tercero, credencial referenciada, aceptación o rechazo;
- **resultado:** efecto completo, parcial, rechazado o desconocido.

La interfaz no descargará poblaciones o datos no autorizados solo para validarlos localmente.

---

#### 17. Conflictos y datos desactualizados

Ante una versión desactualizada o cambio concurrente, se mostrará:

- objeto y versión editada;
- versión vigente;
- quién o qué proceso cambió el objeto cuando sea visible;
- momento del cambio;
- diferencias relevantes;
- campos sin conflicto;
- opciones permitidas: recargar, comparar, reaplicar cambios compatibles, guardar copia, abandonar o escalar.

No se ofrecerá `sobrescribir de todos modos` como respuesta genérica. Esa capacidad solo existirá si el dominio define una acción explícita, autorizada y auditable.

---

#### 18. Autorización, privacidad y denegación

Una validación o ayuda nunca revelará:

- existencia de objetos fuera del territorio autorizado;
- nombres, salarios, documentos, datos financieros o credenciales no visibles;
- reglas internas que permitan inferir privilegios ajenos;
- valores anteriores que la persona no puede consultar;
- información de un tercero solo para explicar una denegación.

La denegación indicará la acción no permitida, el alcance actual y el canal de solicitud o escalamiento autorizado cuando exista. El frontend no decidirá por sí solo que una persona puede continuar.

---

#### 19. Aplicabilidad de la vista previa de impacto

No toda acción requiere una pantalla adicional de revisión. El nivel de vista previa se determinará por consecuencia, no solo por cantidad de campos.

| Clase                              | Impacto                                                                                                 | Tratamiento mínimo                                                                       |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `IC-0_NON_MATERIAL`                | preferencia o cambio local sin efecto empresarial material                                              | confirmación inmediata y estado actualizado                                              |
| `IC-1_SINGLE_REVERSIBLE`           | un objeto, efecto acotado y reversión directa                                                           | resumen visible junto a la acción                                                        |
| `IC-2_MULTI_OBJECT_OR_DEPENDENT`   | múltiples objetos, dependencias o vigencia                                                              | paso de revisión con población y diferencias                                             |
| `IC-3_CROSS_DOMAIN_OR_SENSITIVE`   | dinero, acceso, inventario, producción, cliente, publicación o varias aplicaciones                      | simulación, impacto detallado, motivo y controles de aprobación                          |
| `IC-4_EXTERNAL_OR_HARD_TO_REVERSE` | tercero externo, eliminación material, cierre, revocación amplia o efecto no reversible automáticamente | puerta reforzada, evidencia, contingencia, aprobación y mecanismo de corrección definido |

El número de objetos no determina por sí solo la clase. Revocar acceso a una persona puede ser más crítico que editar cien etiquetas descriptivas.

---

#### 20. Contrato mínimo de vista previa

Toda vista previa requerida deberá declarar:

1. acción exacta que se pretende ejecutar;
2. actor, permiso y segregación aplicables;
3. empresa, territorio, periodo y vigencia;
4. objeto o población exacta;
5. cantidad incluida, excluida, inválida y pendiente;
6. versión o fecha de corte usada;
7. estado antes y estado propuesto;
8. campos modificados y campos que permanecerán iguales;
9. dependencias y conflictos;
10. efectos empresariales directos;
11. efectos secundarios, eventos y notificaciones;
12. aplicaciones propietarias involucradas;
13. datos sensibles o externos afectados;
14. posibilidad de reversión, corrección o compensación;
15. aprobación o autenticación adicional;
16. precisión del cálculo: exacta, estimada, parcial o no disponible;
17. vencimiento de la simulación;
18. acción final, texto de confirmación y resultado esperado.

---

#### 21. Patrones de presentación del impacto

La vista previa podrá utilizar:

- resumen de alcance;
- comparación antes y después;
- lista de diferencias;
- población incluida y excluida;
- muestra representativa con acceso al total;
- agrupación por sede, estado, resultado o error;
- calendario o línea de tiempo;
- dependencias y bloqueos;
- impacto monetario, de cantidad, capacidad o disponibilidad;
- efectos cruzados entre aplicaciones;
- cambios de acceso y datos visibles;
- eventos, mensajes o documentos que se emitirán.

No se mostrará solo una cifra agregada cuando existan excepciones materiales. Tampoco se exigirá revisar miles de filas individualmente cuando una agrupación verificable permita comprender el impacto y acceder al detalle.

---

#### 22. Exactitud, estimaciones y caducidad

La interfaz distinguirá:

- `EXACT`: calculado con datos y reglas vigentes;
- `ESTIMATED`: proyección con supuestos visibles;
- `PARTIAL`: faltan fuentes o elementos identificados;
- `UNAVAILABLE`: no puede calcularse de forma segura;
- `STALE`: cambió una dependencia desde la simulación.

Una estimación mostrará supuestos, fuente, fecha y rango cuando aplique. Una vista previa `STALE` no permitirá comprometer una acción sensible hasta revalidar. El receipt final mostrará el resultado real y cualquier diferencia frente a la simulación.

---

#### 23. Confirmar, enviar, aprobar, aplicar y publicar

| Acción    | Significado                                                                   |
| --------- | ----------------------------------------------------------------------------- |
| guardar   | conservar borrador sin producir efecto final                                  |
| enviar    | transferir el caso a revisión o siguiente etapa                               |
| confirmar | ratificar intención dentro de la autoridad actual                             |
| aprobar   | emitir decisión segregada sobre una propuesta                                 |
| aplicar   | comprometer el cambio autorizado en la fuente de verdad                       |
| publicar  | volver vigente o visible una versión aprobada                                 |
| cerrar    | impedir nuevas mutaciones ordinarias sobre periodo o caso                     |
| anular    | neutralizar una operación mediante acción explícita y trazable                |
| eliminar  | retirar un objeto cuando el dominio lo permita y con política de conservación |

Los botones, títulos y receipts usarán el verbo exacto. No se utilizará `Aceptar` para acciones con efectos distintos.

---

#### 24. Confirmaciones proporcionales

- Las acciones `IC-0` normalmente no requerirán modal.
- Las acciones `IC-1` podrán confirmarse con resumen adyacente y acción claramente nombrada.
- Las acciones `IC-2` tendrán revisión dedicada cuando el alcance no sea visible en la superficie principal.
- Las acciones `IC-3` requerirán simulación, motivo y controles de segregación aplicables.
- Las acciones `IC-4` podrán exigir autenticación reforzada, aprobación adicional, texto de confirmación específico o ventana de espera cuando exista justificación de riesgo.

Se prohíben confirmaciones repetitivas que entrenen a ignorar advertencias. La confirmación escrita no se usará como decoración; solo cuando obligue a reconocer objeto y consecuencia material.

---

#### 25. Acciones masivas e importaciones

Una acción masiva deberá mostrar:

- consulta o población congelada;
- total exacto o estado de cálculo;
- elementos seleccionados, excluidos e inválidos;
- cambios comunes y excepciones por fila;
- muestra y acceso al detalle;
- validaciones pendientes;
- impacto agregado y por grupo;
- estrategia de ejecución sincrónica o asíncrona;
- posibilidad de cancelar antes del compromiso;
- resultado por elemento;
- forma de reintentar solo lo fallido;
- receipt de campaña.

Una importación permanecerá en staging hasta validar estructura, identidad, duplicados, referencias, permisos, reglas y consecuencias. Subir un archivo no aplicará automáticamente los cambios.

---

#### 26. Impactos por dominio

| Dominio             | Impactos que deberán hacerse visibles                                                              |
| ------------------- | -------------------------------------------------------------------------------------------------- |
| organización        | empresas, sedes, áreas, vigencias, dependencias y consumidores                                     |
| personas y talento  | identidad, expediente, invitación, acceso, programación y datos sensibles                          |
| acceso y seguridad  | permisos efectivos, territorios, dispositivos, sesiones, denegaciones y revocación                 |
| productos y recetas | versiones, unidades, rendimiento, costos, publicación y consumidores                               |
| compras             | presupuesto, proveedor, recepción, obligación financiera y estado de aprobación                    |
| inventario          | cantidades, unidades, ubicaciones, disponibilidad, conteos y ajustes                               |
| producción          | demanda, capacidad, lotes, consumo, resultado, desperdicio y trazabilidad                          |
| ventas y clientes   | precio, oferta, pedido, pago, factura, puntos, privacidad y compensación                           |
| logística y activos | ruta, carga, custodia, vehículo, contenedor, entrega y retorno                                     |
| finanzas            | empresa, centro de costo, periodo, moneda, obligación, conciliación, cierre y exporte              |
| canales             | contenido, audiencia, vigencia, publicación, tercero y reversión                                   |
| plataforma          | ambiente, integración, dispositivo, configuración, secreto referenciado, disponibilidad y rollback |
| analítica           | fuente, fórmula, versión, fecha de corte, granularidad, clasificación y destinatarios              |

---

#### 27. Efectos cruzados entre aplicaciones

Cuando una acción produzca efectos en más de una aplicación, la vista previa distinguirá:

- aplicación propietaria de la acción;
- aplicaciones consumidoras;
- escrituras directas y eventos posteriores;
- efectos sincrónicos y asíncronos;
- dependencias todavía no disponibles;
- estado esperado por aplicación;
- receipt o correlación común;
- estrategia ante rechazo parcial.

La interfaz no prometerá consistencia inmediata cuando el contrato sea eventual. Tampoco presentará como final una proyección antes de que la aplicación propietaria confirme la escritura.

---

#### 28. Errores, fallos parciales y resultado desconocido

Después de una ejecución, la superficie mostrará:

- qué se intentó;
- qué se confirmó;
- qué fue rechazado;
- qué permanece pendiente;
- qué no cambió;
- si es seguro reintentar;
- cómo reintentar solo elementos fallidos;
- cómo conciliar un resultado desconocido;
- quién es responsable del siguiente paso;
- receipt, referencia o evidencia disponible.

Ante `VS-7_UNKNOWN_RESULT`, el botón principal no será `Intentar de nuevo` hasta consultar el estado mediante clave idempotente o procedimiento de conciliación.

---

#### 29. Borradores y conservación del trabajo

Los errores y conflictos deberán conservar, cuando sea seguro:

- campos capturados;
- adjuntos y referencias;
- selección;
- filtros relevantes;
- versión base;
- simulación anterior claramente marcada como caducada;
- observaciones y motivo;
- punto de reanudación.

No se conservarán secretos en borradores, URLs, telemetría ni almacenamiento no autorizado. Cambiar de modo guiado a experto conservará el mismo borrador y objeto, no una copia paralela.

---

#### 30. Métricas de efectividad

Podrán medirse:

- apertura y utilidad declarada de ayudas;
- búsquedas de ayuda sin respuesta;
- errores prevenidos antes de envío;
- advertencias ignoradas;
- bloqueos frecuentes;
- tiempo hasta corregir;
- conflictos y reanudaciones;
- vistas previas caducadas;
- cancelaciones después de revisar impacto;
- diferencias entre simulación y resultado;
- reintentos evitados por resultado desconocido;
- escalaciones a soporte;
- comprensión durante piloto.

La telemetría excluirá contenido sensible y no sustituirá auditoría empresarial.

---

#### 31. Matriz mínima por arquetipo

| Arquetipo            | Ayuda prioritaria                  | Validación prioritaria                                      | Vista previa prioritaria                                  |
| -------------------- | ---------------------------------- | ----------------------------------------------------------- | --------------------------------------------------------- |
| alta guiada          | propósito, ejemplo y dependencia   | identidad, duplicados, referencias y obligatoriedad         | objeto creado, accesos, vigencia y siguientes etapas      |
| configuración guiada | significado de regla y alternativa | compatibilidad, cobertura y conflicto                       | versión, consumidores, publicación y rollback             |
| aprobación guiada    | criterio, evidencia y segregación  | estado, autoridad, versión y evidencia                      | diferencias, impacto, motivo y efectos posteriores        |
| bandeja experta      | estado, SLA y siguiente acción     | filtros, territorio, asignación y bloqueo                   | impacto del cambio de responsable, estado o prioridad     |
| explorador experto   | fuente, campo y relación           | consulta, permiso y datos desactualizados                   | normalmente resumen contextual, no modal universal        |
| matriz de edición    | columna, unidad y regla            | celda, fila, población y concurrencia                       | diferencias agregadas, inválidos y resultado por fila     |
| planificador         | capacidad, dependencia y vigencia  | solapamientos, cobertura y restricciones                    | calendario antes y después, conflictos y publicación      |
| conciliador          | fuente, tolerancia y propietario   | equivalencia, corte y clasificación                         | diferencias, decisiones y efecto contable u operativo     |
| campaña masiva       | alcance, exclusión y reintento     | población, simulación e idempotencia                        | total, grupos, errores, impacto y estrategia de ejecución |
| auditoría            | significado del evento y evidencia | integridad, orden y acceso                                  | no ejecuta cambios; abre caso separado para corregir      |
| editor de reglas     | fórmula, versión y consumidor      | sintaxis, dependencia, prueba y vigencia                    | diff, cobertura, consumidores, publicación y rollback     |
| consola técnica      | ambiente, estado y contrato        | secreto referenciado, conectividad y autorización reforzada | servicio afectado, prueba, riesgo, rollback y auditoría   |

---

#### 32. Carryovers con destino exacto

| Carryover     | Condición pendiente                                                                  | Tarea propietaria de cierre                                                                                            |
| ------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------- |
| `C-ADMIN-003` | Definir ayudas, validación preventiva y vista previa de impacto                      | **CERRADO por `UX-ADMIN-004`**                                                                                         |
| `C-ADMIN-010` | Definir microcopias, ayudas, ejemplos y detalle visual del impacto                   | **CERRADO contractualmente por `UX-ADMIN-004`; materialización por pantalla en `PROC-SCREEN-001` a `PROC-SCREEN-028`** |
| `C-ADMIN-004` | Validar flujos representativos con administradores                                   | `UX-ADMIN-005`; `VISO-UX-020`                                                                                          |
| `C-ADMIN-011` | Prototipar arquetipos y comprobar comprensión, productividad y prevención de errores | `UX-ADMIN-005`                                                                                                         |
| `C-ADMIN-012` | Asignar cada `ADM-TASK-*` a pantallas y acciones definitivas                         | `PROC-SCREEN-001 a PROC-SCREEN-028`                                                                                    |
| `C-ADMIN-013` | Materializar persistencia, concurrencia, idempotencia y receipts                     | `PROC-SCREEN-001 a PROC-SCREEN-028`; `SHELL-CON-012`; `SHELL-CON-015`                                                  |
| `C-ADMIN-014` | Materializar handoffs y retornos entre aplicaciones                                  | `SHELL-CON-014`; `SHELL-CON-016`; `PROC-SCREEN-001 a PROC-SCREEN-028`                                                  |
| `C-ADMIN-019` | Implementar catálogo gobernado de contenidos de ayuda y sus versiones                | `PROC-SCREEN-001 a PROC-SCREEN-028`; tareas UX por aplicación; paquetes E5                                             |
| `C-ADMIN-020` | Implementar validadores canónicos de cliente y servidor sin divergencia              | tareas de servidor y datos por aplicación; paquetes E5; BLOQUE U                                                       |
| `C-ADMIN-021` | Implementar simulación, clasificación de impacto y receipts por acción               | `PROC-SCREEN-001 a PROC-SCREEN-028`; `SHELL-CON-012`; paquetes E5                                                      |
| `C-ADMIN-022` | Definir estilos, componentes y accesibilidad física de ayudas, mensajes y diffs      | `PROC-SCREEN-001 a PROC-SCREEN-028`; fundación UI compartida                                                           |
| `C-ADMIN-023` | Certificar ayudas, prevención, impacto y recuperación en pilotos                     | `UX-ADMIN-005`; `UX-QA-020` a `UX-QA-029`                                                                              |

No queda pendiente narrativo sin tarea y momento de resolución.

---

#### 33. Requisitos de prueba derivados

**Resultado:** GENERA 36 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-413` a `TREQ-UX-448` al Registro Canónico completo. Todos quedan en `IDENTIFICADO`; la validación con administradores corresponde a `UX-ADMIN-005`, la asignación física a `PROC-SCREEN-*` y la implementación y certificación a los paquetes E5 y BLOQUE U.

---

#### 34. Criterios de aceptación

- [x] Se diferencia ayuda contextual, capacitación, soporte y referencia gobernada.
- [x] La interfaz debe ser autosuficiente antes de depender de ayuda adicional.
- [x] Se definen seis capas de ayuda y sus reglas de uso.
- [x] Se definen gobierno, propietario, versión, vigencia y revisión del contenido.
- [x] Se preservan accesibilidad, teclado, táctil y tecnologías de asistencia.
- [x] La validación preventiva no sustituye validación ni autorización del servidor.
- [x] Se definen momentos de validación desde contexto hasta resultado final.
- [x] Se definen ocho estados de severidad no intercambiables.
- [x] Se define estructura accionable de mensajes y recuperación.
- [x] Se cubren campo, objeto, población, periodo, territorio, segregación, cruce de aplicaciones y resultado.
- [x] Se definen conflictos y datos desactualizados sin sobrescritura genérica.
- [x] Se protege privacidad durante ayuda, validación y denegación.
- [x] Se definen cinco clases de impacto y controles proporcionales.
- [x] Se define contrato mínimo de vista previa con exactitud y caducidad.
- [x] Se distinguen guardar, enviar, confirmar, aprobar, aplicar, publicar, cerrar, anular y eliminar.
- [x] Se definen acciones masivas, importaciones, efectos cruzados y resultados parciales.
- [x] Se cubren los dominios administrativos y los arquetipos guiados y expertos.
- [x] Todos los carryovers tienen tarea propietaria exacta.
- [x] Se incorporan `TREQ-UX-413` a `TREQ-UX-448`.
- [x] No se implementa código, Supabase, rutas, componentes ni cambios productivos.
- [x] `UX-ADMIN-005` permanece no iniciada.

---

#### 35. Resultado y continuidad

```text
UX-ADMIN-001 APROBADA
UX-ADMIN-002 APROBADA
UX-ADMIN-003 APROBADA
UX-ADMIN-004 APROBADA
UX-ADMIN-005 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-ADMIN-005 — Prototipar y aprobar flujos administrativos con usuarios reales
```


### ✅ UX-ADMIN-005 — Prototipar y aprobar flujos administrativos con usuarios reales

**Estado:** APROBADA

**Resultado:** `PASS_WITH_CARRYOVER`

**Método de cierre:** `EVIDENCE_SUBSTITUTION_APPROVED`

**Aclaración obligatoria:** no se afirma que se hayan ejecutado sesiones formales con administradores reales durante esta tarea. La aprobación documental se sustenta en los contratos aprobados de `UX-ADMIN-001` a `UX-ADMIN-004`, conocimiento operativo interno, prototipos contractuales, walkthroughs adversariales, datos sintéticos y patrones administrativos ampliamente estabilizados. La validación humana integrada se conserva como puerta obligatoria antes de producción mediante `UX-QA-020`, `UX-QA-023` a `UX-QA-029` y los pilotos de cada aplicación.

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-ADMIN-005 — Prototipar y aprobar flujos administrativos con usuarios reales`

**Tarea anterior:** `UX-ADMIN-004 — Definir ayudas contextuales, validación preventiva y vista previa de impacto` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-001 — Inventariar pantallas necesarias por proceso y aplicación` — NO INICIADA

**Artefactos producidos:**

- `UX-ADMIN-EVIDENCE-SUBSTITUTION-DECISION-001`;
- `UX-ADMIN-REPRESENTATIVE-FLOW-CATALOG-001`;
- `UX-ADMIN-PROTOTYPE-STATE-MODEL-001`;
- `UX-ADMIN-GUIDED-EXPERT-CONTINUITY-CONTRACT-001`;
- `UX-ADMIN-ADVERSARIAL-WALKTHROUGH-MATRIX-001`;
- `UX-ADMIN-USABILITY-ACCEPTANCE-MATRIX-001`;
- `UX-ADMIN-RESIDUAL-RISK-REGISTER-001`;
- `UX-ADMIN-DEFERRED-HUMAN-VALIDATION-MAP-001`;
- `UX-ADMIN-SCREEN-HANDOFF-PACKAGE-001`;
- `UX-ADMIN-CARRYOVER-REGISTER-005`.

**Cobertura:** los **16 dominios administrativos**, las **98 familias `ADM-TASK-*`**, los **10 arquetipos guiados**, los **10 arquetipos expertos** y los contratos de ayuda, validación, impacto, confirmación, receipt y recuperación aprobados en `UX-ADMIN-004`.

**Naturaleza:** prototipado contractual transversal, aprobación condicionada de los patrones administrativos y preparación de insumos para contratos de pantalla. No constituye certificación productiva, piloto formal ni evidencia de sesiones humanas ya ejecutadas.

**Cambios en código, aplicaciones, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, integraciones o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Cerrar el subbloque de experiencia administrativa con una línea base suficientemente precisa para diseñar pantallas y comenzar implementación posterior, sin fingir pruebas humanas inexistentes ni obligar a detener el roadmap hasta disponer de software real.

```text
INVENTARIO ADMINISTRATIVO
+ MODO GUIADO
+ MODO EXPERTO
+ AYUDA, VALIDACION E IMPACTO
        ↓
PROTOTIPOS CONTRACTUALES REPRESENTATIVOS
+ WALKTHROUGHS ADVERSARIALES
+ SUPUESTOS Y RIESGOS EXPLICITOS
        ↓
APROBACION CONDICIONADA PARA DISEÑO DE PANTALLAS
        ↓
IMPLEMENTACION, PRUEBAS TECNICAS Y PILOTO HUMANO
```

La tarea aprueba una arquitectura de experiencia y un conjunto de patrones reutilizables. No asigna el estado `CERTIFIED_FOR_PRODUCTION` a ninguna aplicación.

---

#### 2. Decisión de proporcionalidad

Se aplica la misma política de sustitución proporcional aprobada para `UX-STATION-008`:

1. la investigación y el prototipado documental permiten continuar;
2. la ausencia de sesiones formales en esta etapa no bloquea `PROC-SCREEN-*`;
3. las decisiones de alto riesgo quedan condicionadas a implementación verificable y piloto;
4. los hallazgos del piloto deberán volver a la tarea propietaria exacta;
5. ningún flujo se considera productivamente certificado sin evidencia humana y técnica posterior.

```text
APROBAR EL PATRON
≠ APROBAR PRODUCCION

DIFERIR EL PILOTO
≠ ELIMINAR EL PILOTO

USAR EVIDENCIA SINTETICA
≠ USAR DATOS PRODUCTIVOS
```

---

#### 3. Evidencia utilizada

La aprobación se apoya en:

- las 98 familias administrativas clasificadas por frecuencia, complejidad, volumen y riesgo;
- los contratos guiados de altas, configuración, aprobación, conciliación, importación y publicación;
- los contratos expertos de bandeja, explorador, matriz, planificación, campaña, auditoría y consola;
- las reglas de ayuda contextual, validación preventiva y vista previa de impacto;
- los contratos de actor, territorio, permiso, versión, segregación, privacidad e idempotencia;
- el conocimiento operativo acumulado de Vento Group;
- patrones maduros de backoffice, ERP, WMS, POS, RR. HH., compras, finanzas y administración de acceso;
- walkthroughs de éxito, error, conflicto, denegación, resultado parcial y resultado desconocido;
- prototipos contractuales con datos sintéticos y estados explícitos.

---

#### 4. Qué significa prototipo contractual

Un prototipo contractual no es una maqueta decorativa. Cada flujo representativo define:

```text
OBJETO Y PROPOSITO
+ ACTOR, PERMISO Y TERRITORIO
+ ESTADO DE ENTRADA
+ PASOS Y RAMIFICACIONES
+ DATOS Y DEPENDENCIAS
+ VALIDACIONES
+ AYUDA CONTEXTUAL
+ IMPACTO Y CONFIRMACION
+ COMPROMISO EN SERVIDOR
+ RECEIPT Y RECUPERACION
```

El estilo visual definitivo, la ruta física, el componente y la implementación corresponden a `PROC-SCREEN-001` a `PROC-SCREEN-028` y a los paquetes posteriores.

---

#### 5. Cobertura por equivalencia

No se construirá un prototipo separado para cada una de las 98 familias. La cobertura se obtiene mediante:

- representación directa de las familias de mayor riesgo o frecuencia;
- equivalencia controlada por arquetipo, efecto y contrato;
- variantes explícitas cuando cambian segregación, territorialidad, sensibilidad, volumen o reversibilidad;
- obligación de crear un prototipo adicional si una tarea futura no encaja en ningún patrón aprobado.

Una equivalencia es válida únicamente cuando conserva:

- intención administrativa;
- estado y transición;
- actor y permiso;
- población o territorio;
- tipo de impacto;
- necesidad de guía o densidad experta;
- validación, confirmación, receipt y recuperación.

---

#### 6. Catálogo de flujos representativos

| Código   | Flujo prototipado                                          | Dominio principal     | Aplicación propietaria                     | Patrón dominante                      |
| -------- | ---------------------------------------------------------- | --------------------- | ------------------------------------------ | ------------------------------------- |
| `APF-01` | crear candidato, vincular trabajador y activar expediente  | personas y talento    | TALENTO / ANIMA / VISO                     | guiado multietapa con handoff         |
| `APF-02` | asignar sede, área, rol operativo, turno y vigencia        | organización y acceso | VISO                                       | guiado de configuración y aprobación  |
| `APF-03` | crear o versionar producto, unidad y presentación          | productos y maestros  | NEXO / aplicación propietaria del catálogo | guiado de alta y editor experto       |
| `APF-04` | crear, revisar, aprobar y publicar versión de receta       | recetas y producción  | FOGO                                       | editor de reglas + aprobación         |
| `APF-05` | crear proveedor, comparar oferta y emitir compra           | compras               | ORIGO                                      | guiado de alta + bandeja experta      |
| `APF-06` | aprobar compra y resolver recepción con diferencias        | compras y recepción   | ORIGO                                      | aprobación + conciliador              |
| `APF-07` | revisar diferencia y aprobar ajuste de inventario          | inventario            | NEXO                                       | conciliador + aprobación sensible     |
| `APF-08` | versionar precio, oferta o menú y publicar por sede/canal  | comercial             | PULSO / propietario de oferta              | editor de versiones + publicación     |
| `APF-09` | registrar gasto, aprobar, conciliar y cerrar periodo       | finanzas              | NUMERA                                     | guiado + conciliador + cierre         |
| `APF-10` | importar o modificar una población administrativa          | transversal           | aplicación propietaria                     | campaña masiva + staging              |
| `APF-11` | retirar trabajador, revocar acceso y cerrar sesiones       | personas y seguridad  | VISO / SHELL / ANIMA                       | guiado sensible con segregación       |
| `APF-12` | investigar evento, reconstruir historia y abrir corrección | auditoría             | aplicación propietaria / VISO              | auditoría inmutable + caso correctivo |

Estos doce flujos cubren altas, edición, versionado, aprobación, publicación, conciliación, cierre, importación, revocación y auditoría.

---

#### 7. Estados comunes del prototipo

Todo flujo representativo deberá recorrer, según aplicabilidad:

| Estado            | Propósito                                                          |
| ----------------- | ------------------------------------------------------------------ |
| `PS-01_ENTRY`     | explicar propósito, objeto, alcance y prerrequisitos               |
| `PS-02_CONTEXT`   | resolver empresa, sede, periodo, población y versión               |
| `PS-03_CAPTURE`   | capturar o editar datos sin compromiso final                       |
| `PS-04_VALIDATE`  | mostrar inválidos, advertencias, conflictos y dependencias         |
| `PS-05_REVIEW`    | resumir diferencias, impacto, alcance y evidencia                  |
| `PS-06_AUTHORIZE` | resolver aprobación, segregación o autenticación reforzada         |
| `PS-07_COMMIT`    | ejecutar una intención exacta e idempotente                        |
| `PS-08_RESULT`    | presentar confirmado, parcial, rechazado o desconocido             |
| `PS-09_RECEIPT`   | conservar evidencia, actor, correlación y siguiente acción         |
| `PS-10_RECOVER`   | recargar, conciliar, corregir, reintentar selectivamente o escalar |

Un flujo puede omitir estados no aplicables, pero no podrá omitir silenciosamente validación, impacto o receipt cuando el riesgo los exija.

---

#### 8. Prototipo APF-01 — Vinculación de trabajador

Secuencia base:

```text
CREAR O RECUPERAR CANDIDATO
→ VALIDAR IDENTIDAD Y DUPLICADOS
→ REGISTRAR DECISION DE SELECCION
→ CREAR VINCULO LABORAL
→ ASOCIAR DOCUMENTOS Y VIGENCIA
→ PREPARAR ACCESO SIN ACTIVAR PRIVILEGIOS INDEBIDOS
→ HANDOFF A PROGRAMACION Y ACCESO
→ RECEIPT DE VINCULACION
```

Controles obligatorios:

- candidato, persona, trabajador y usuario permanecen diferenciados;
- no se crea empleado por una postulación ni acceso por una vinculación incompleta;
- los datos sensibles se minimizan por etapa;
- una coincidencia de identidad bloquea duplicación y ofrece reconciliación;
- cada aplicación conserva su escritura propietaria;
- el cierre parcial indica qué etapas siguen pendientes.

---

#### 9. Prototipo APF-02 — Asignación laboral y acceso

Secuencia base:

```text
SELECCIONAR TRABAJADOR
→ RESOLVER EMPRESA Y TERRITORIO ADMINISTRABLE
→ ASIGNAR SEDE Y AREA
→ ASIGNAR ROL O PERFIL COMPATIBLE
→ DEFINIR VIGENCIA O TURNO
→ SIMULAR PERMISOS EFECTIVOS
→ MOSTRAR CONFLICTOS Y CAPACIDADES GANADAS O RETIRADAS
→ APROBAR O APLICAR SEGUN SEGREGACION
→ RECEIPT Y SESIONES AFECTADAS
```

La simulación no concede acceso. El filtro administrativo no equivale a sede activa. La aplicación deberá mostrar origen de cada capacidad y conflictos antes de guardar.

---

#### 10. Prototipo APF-03 — Producto, unidad y presentación

El flujo deberá permitir:

- buscar posibles duplicados antes de crear;
- distinguir producto, unidad, presentación, empaque y conversión;
- declarar aplicaciones y procesos consumidores;
- previsualizar impacto sobre inventario, compras, recetas, venta y analítica;
- guardar borrador antes de publicar;
- versionar sin reescribir historia;
- impedir conversiones ambiguas o incompatibles;
- generar receipt de versión y vigencia.

El modo experto podrá editar campos autorizados de varias presentaciones, pero no mezclará silenciosamente unidades físicas distintas.

---

#### 11. Prototipo APF-04 — Versión de receta

El flujo deberá separar:

1. edición de borrador;
2. prueba o revisión técnica;
3. comparación con versión vigente;
4. impacto en insumos, rendimiento, alérgenos, costo y producción;
5. aprobación;
6. publicación con vigencia;
7. retiro o reemplazo controlado.

Una persona no podrá aprobar su propia versión cuando la segregación lo prohíba. Publicar no modifica lotes históricos ni convierte automáticamente una receta futura en instrucción vigente para producción ya iniciada.

---

#### 12. Prototipos APF-05 y APF-06 — Compra y recepción con diferencias

El prototipo cubrirá:

- alta o selección de proveedor;
- comparación de cotizaciones;
- orden con sede, centro de costo, moneda y vigencia;
- aprobación diferenciada de creación;
- recepción total o parcial;
- diferencia de cantidad, calidad, precio, documento o presentación;
- decisión de aceptar, retener, reclamar, corregir o rechazar;
- efecto separado sobre inventario y finanzas;
- resultado parcial por línea;
- receipt de orden, aprobación, recepción y diferencia.

La recepción física no podrá fabricarse retrospectivamente desde administración sin actor y evidencia operacional.

---

#### 13. Prototipo APF-07 — Ajuste de inventario

Antes de aprobar un ajuste deberán mostrarse:

- producto, presentación, unidad y ubicación;
- cantidad contada, esperada y diferencia;
- movimientos y conteos relacionados;
- motivo estructurado;
- evidencia disponible;
- impacto en disponibilidad, producción, compras y costo;
- segregación entre conteo, revisión y aprobación;
- alternativa de recuento o investigación.

El ajuste no borrará el movimiento original. La auditoría conservará el antes, después, actor, razón y correlación.

---

#### 14. Prototipo APF-08 — Precio, oferta o menú

El flujo deberá distinguir:

- borrador;
- versión propuesta;
- aprobación;
- publicación;
- vigencia;
- canal, sede y audiencia;
- retiro o sustitución.

La vista previa mostrará valores anteriores y nuevos, productos sin cobertura, canales consumidores, fecha efectiva y efecto sobre promociones o puntos. Una publicación parcial deberá informar exactamente qué canal quedó actualizado y cuál no.

---

#### 15. Prototipo APF-09 — Gasto, conciliación y cierre

El prototipo cubrirá:

- registro de gasto y soporte;
- empresa, centro de costo, periodo y contraparte;
- validación de duplicados;
- aprobación separada;
- conciliación con hechos de origen;
- diferencias y tolerancias;
- cierre de periodo;
- reapertura controlada;
- corrección mediante asiento, compensación o caso autorizado, nunca borrado silencioso.

El cierre mostrará elementos pendientes, impacto, responsabilidades y condiciones que impedirán o permitirán continuar.

---

#### 16. Prototipo APF-10 — Importación o cambio masivo

La secuencia mínima será:

```text
CARGAR O DEFINIR POBLACION
→ MAPEAR CAMPOS
→ VALIDAR EN STAGING
→ CLASIFICAR VALIDOS, INVALIDOS Y CONFLICTIVOS
→ CONGELAR POBLACION Y VERSION
→ SIMULAR IMPACTO
→ REVISAR MUESTRA Y TOTALES
→ AUTORIZAR
→ EJECUTAR POR LOTES IDEMPOTENTES
→ MOSTRAR RESULTADO POR ELEMENTO
→ REINTENTAR SOLO FALLIDOS ELEGIBLES
```

Seleccionar la página visible y seleccionar todos los resultados serán acciones diferentes. La importación no afectará datos reales antes del compromiso explícito.

---

#### 17. Prototipo APF-11 — Retiro y revocación

El flujo deberá coordinar:

- fecha y motivo de finalización;
- accesos, roles, permisos y sesiones;
- dispositivos, activos, documentos y pendientes;
- asignaciones, turnos y responsabilidades;
- handoffs necesarios;
- vigencia exacta de revocación;
- acciones irreversibles o externas;
- receipt integral y elementos todavía pendientes.

La terminación laboral y la revocación técnica serán coordinadas, pero no se asumirán equivalentes ni atómicas cuando pertenezcan a sistemas diferentes.

---

#### 18. Prototipo APF-12 — Auditoría y corrección

La auditoría deberá ser de solo lectura respecto del evento histórico. Desde ella podrá:

- filtrar y reconstruir una secuencia;
- ver actor, objeto, estado, diferencia y evidencia autorizada;
- correlacionar eventos entre aplicaciones;
- exportar únicamente con permiso independiente;
- abrir un caso de corrección;
- enlazar a la aplicación propietaria.

La corrección resultante creará un nuevo hecho o transición y conservará relación con el evento investigado.

---

#### 19. Walkthroughs adversariales obligatorios

Cada prototipo se revisó contractualmente contra escenarios de:

- permiso insuficiente;
- territorio no autorizado;
- objeto eliminado o cambiado;
- versión desactualizada;
- duplicado;
- dependencia faltante;
- segregación incumplida;
- aprobación propia prohibida;
- dato sensible no visible;
- validación tardía;
- conflicto concurrente;
- falla de integración;
- ejecución parcial;
- timeout con resultado desconocido;
- doble clic o reintento;
- borrador interrumpido;
- cambio entre modo guiado y experto;
- exportación no autorizada;
- volumen alto;
- necesidad de corrección posterior.

Ningún walkthrough autoriza bypass, sobrescritura ciega ni reintento indiscriminado.

---

#### 20. Criterios de usabilidad documental

Un prototipo se considera apto para pasar a contratos de pantalla cuando:

- la intención principal es identificable;
- el objeto, alcance, periodo y versión permanecen visibles;
- el siguiente paso es inequívoco;
- el lenguaje es empresarial y no técnico;
- el modo guiado reduce decisiones simultáneas;
- el modo experto mejora densidad sin ocultar riesgo;
- errores y bloqueos indican cómo continuar;
- la vista previa permite cancelar informadamente;
- el compromiso final usa un verbo exacto;
- el receipt distingue resultado real de intención;
- el flujo puede completarse sin apoyo técnico permanente;
- teclado, táctil y tecnologías de asistencia conservan equivalencia.

---

#### 21. Continuidad entre modo guiado y experto

Ambos modos deberán compartir:

- objeto y versión;
- permiso y territorio;
- borrador;
- validaciones;
- simulación vigente;
- intención de compromiso;
- clave idempotente;
- receipt.

Cambiar de modo solo modifica densidad, navegación y nivel de explicación. No crea una copia paralela ni una segunda mutación.

---

#### 22. Validación con datos sintéticos

Los prototipos se diseñarán y probarán inicialmente con:

- identidades ficticias;
- empresas, sedes y periodos de prueba;
- cantidades y valores simulados;
- archivos sintéticos;
- estados de red e integración simulados;
- datos que cubran éxito, error, conflicto y resultado parcial.

No se requiere copiar datos productivos ni exponer información personal para comprobar la arquitectura del flujo.

---

#### 23. Métricas previstas para implementación y piloto

Las aplicaciones deberán instrumentar, cuando corresponda:

- inicio, abandono y finalización;
- tiempo hasta primera acción correcta;
- errores por paso;
- ayudas abiertas;
- bloqueos y advertencias;
- retrocesos;
- borradores reanudados;
- conflictos;
- cancelaciones después de vista previa;
- aprobaciones rechazadas;
- resultados parciales o desconocidos;
- reintentos evitados;
- cambio entre modo guiado y experto;
- asistencia humana requerida.

La telemetría no almacenará contenido sensible ni reemplazará auditoría empresarial.

---

#### 24. Validación humana diferida

La validación con administradores reales permanece obligatoria antes de producción, pero se integra a:

- `UX-QA-020 — Cada aplicación supera piloto con usuarios reales`;
- `UX-QA-023 — Probar VISO por rol administrativo`;
- `UX-QA-024` a `UX-QA-029` para las demás aplicaciones;
- `VISO-UX-020 — Ejecutar pruebas con administradores reales`;
- pilotos y puertas E5 aplicables.

La prueba posterior será proporcional:

- personal existente;
- escenarios representativos;
- datos controlados;
- sesiones cortas dentro de pilotos;
- foco en comprensión, error crítico, impacto, productividad y recuperación;
- sin contratar participantes ni crear una campaña extensa separada.

---

#### 25. Riesgos residuales

| Riesgo                                                            | Estado                         | Puerta de cierre                       |
| ----------------------------------------------------------------- | ------------------------------ | -------------------------------------- |
| terminología interna no comprendida por todos los administradores | `DIRECT_PILOT_REQUIRED`        | `UX-QA-020`; `UX-QA-023` a `UX-QA-029` |
| densidad insuficiente o excesiva en tareas recurrentes            | `DIRECT_PILOT_REQUIRED`        | piloto por aplicación                  |
| ayudas ignoradas o demasiado intrusivas                           | `DIRECT_PILOT_REQUIRED`        | instrumentación y piloto               |
| diferencias entre simulación y efecto real                        | `TECHNICAL_AND_PILOT_REQUIRED` | pruebas E2E, receipts y piloto         |
| tiempos de respuesta con grandes poblaciones                      | `TECHNICAL_REQUIRED`           | NFR, performance y staging             |
| segregación y permisos mal comprendidos                           | `DIRECT_PILOT_REQUIRED`        | VISO y pruebas de seguridad            |
| flujos externos o fiscales no totalmente controlables             | `INTEGRATION_GATE_REQUIRED`    | tareas de integración y contingencia   |

Estos riesgos no bloquean contratos de pantalla ni código desacoplado; sí pueden bloquear release o producción.

---

#### 26. Estados de aprobación

| Estado                          | Significado                                                         |
| ------------------------------- | ------------------------------------------------------------------- |
| `ASSUMED_HIGH_CONFIDENCE`       | patrón administrativo estable y coherente con contratos aprobados   |
| `SCREEN_CONTRACT_READY`         | listo para asignación en `PROC-SCREEN-*`                            |
| `IMPLEMENTATION_CANDIDATE`      | puede convertirse en componentes, servicios y pruebas               |
| `TECHNICAL_VALIDATION_REQUIRED` | exige pruebas de integración, concurrencia, seguridad o rendimiento |
| `DIRECT_PILOT_REQUIRED`         | exige observación con administradores antes de producción           |
| `CERTIFIED_FOR_PRODUCTION`      | solo después de piloto, pruebas y puerta de despliegue              |

Esta tarea no asigna `CERTIFIED_FOR_PRODUCTION`.

---

#### 27. Handoff obligatorio hacia contratos de pantalla

Cada pantalla derivada deberá declarar:

- flujo `APF-*` o equivalencia;
- familia `ADM-TASK-*`;
- aplicación propietaria;
- carril y modo;
- objeto, estado y acción;
- actor, permiso y territorio;
- pasos y ramificaciones;
- ayuda y validaciones;
- clase de impacto;
- confirmación o aprobación;
- receipt y recuperación;
- requisitos `TREQ-*` aplicables;
- riesgos residuales y puerta de cierre.

`PROC-SCREEN-001` no deberá reiniciar el diseño desde cero: consumirá este paquete.

---

#### 28. Carryovers con destino exacto

| Carryover     | Condición pendiente                                              | Tarea propietaria de cierre                                                          |
| ------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `C-ADMIN-004` | validar flujos representativos con administradores               | **DIFERIDO proporcionalmente a `UX-QA-020`, `UX-QA-023` a `UX-QA-029` y pilotos E5** |
| `C-ADMIN-011` | comprobar comprensión, productividad y prevención de errores     | **DIFERIDO a pilotos con instrumentación**                                           |
| `C-ADMIN-012` | asignar familias a pantallas y acciones definitivas              | `PROC-SCREEN-001 a PROC-SCREEN-028`                                                  |
| `C-ADMIN-013` | materializar persistencia, concurrencia, idempotencia y receipts | `PROC-SCREEN-*`; paquetes E5; BLOQUE U                                               |
| `C-ADMIN-014` | materializar handoffs y retornos entre aplicaciones              | `PROC-SCREEN-*`; contratos SHELL e integración                                       |
| `C-ADMIN-023` | certificar ayudas, prevención, impacto y recuperación            | `UX-QA-020`; `UX-QA-023` a `UX-QA-029`                                               |
| `C-ADMIN-024` | resolver hallazgos humanos críticos antes de producción          | tarea propietaria de pantalla o aplicación; puerta E5                                |
| `C-ADMIN-025` | medir rendimiento con poblaciones reales o representativas       | NFR, pruebas de performance y pilotos                                                |

No queda pendiente narrativo sin tarea y momento de resolución.

---

#### 29. Requisitos de prueba derivados

**Resultado:** GENERA 32 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-449` a `TREQ-UX-480` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; la implementación corresponde a `PROC-SCREEN-*` y paquetes posteriores, y la certificación humana a BLOQUE U y pilotos.

---

#### 30. Criterios de aceptación

- [x] Se declara honestamente que no se ejecutaron sesiones formales con administradores en esta etapa.
- [x] Se conserva la validación humana obligatoria antes de producción.
- [x] El trabajo de campo deja de bloquear contratos de pantalla y código posterior.
- [x] Los 16 dominios y 98 familias quedan cubiertos por representación o equivalencia controlada.
- [x] Se definen doce flujos representativos de extremo a extremo.
- [x] Se cubren altas, configuración, aprobación, conciliación, publicación, importación, revocación y auditoría.
- [x] Se aplican los contratos guiados, expertos, de ayuda, validación, impacto y recuperación.
- [x] Se revisan permisos, territorialidad, privacidad, segregación, concurrencia e idempotencia.
- [x] Se cubren resultado parcial y resultado desconocido.
- [x] Se conserva continuidad entre modo guiado y experto.
- [x] Se utilizan datos sintéticos y no datos productivos.
- [x] Se definen métricas y riesgos residuales.
- [x] Cada carryover tiene tarea y puerta de cierre.
- [x] Se generan `TREQ-UX-449` a `TREQ-UX-480`.
- [x] No se implementa código ni se certifica producción.
- [x] `PROC-SCREEN-001` queda como siguiente tarea exacta.

---

#### 31. Resultado y continuidad

```text
UX-ADMIN-001 APROBADA
UX-ADMIN-002 APROBADA
UX-ADMIN-003 APROBADA
UX-ADMIN-004 APROBADA
UX-ADMIN-005 APROBADA — PASS_WITH_CARRYOVER
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-001 — Inventariar pantallas necesarias por proceso y aplicación
```

