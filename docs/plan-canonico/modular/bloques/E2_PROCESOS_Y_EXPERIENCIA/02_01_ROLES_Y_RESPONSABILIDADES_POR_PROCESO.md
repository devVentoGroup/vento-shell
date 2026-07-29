### MINI-BLOQUE — ROLES Y RESPONSABILIDADES POR PROCESO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **roles y responsabilidades por proceso** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `PROC-ACTOR-001` a `PROC-ACTOR-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `PROC-ACTOR-001`: Vincular cada proceso con roles base aplicables
- `PROC-ACTOR-002`: Vincular cada proceso con roles operativos aplicables
- `PROC-ACTOR-003`: Diferenciar iniciador, ejecutor, supervisor y aprobador
<!-- PLAN-SECTION-META:END -->

### ✅ PROC-ACTOR-001 — Vincular cada proceso con roles base aplicables

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-CAT-020 — Identificar procesos duplicados entre aplicaciones` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-002 — Vincular cada proceso con roles operativos aplicables`  
**Artefacto producido:** `PROC-BASE-ROLE-APPLICABILITY-MATRIX-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Roles base canónicos evaluados:** **8**  
**Pares proceso–rol posibles:** **552**  
**Vínculos aplicables definidos:** **387**  
**Procesos sin rol base aplicable:** **0**  
**Roles legacy u operativos usados como rol base:** **0**  
**Implementación, Supabase y migraciones:** no autorizados

---

#### 1. Propósito

Vincular cada proceso canónico con los roles base que podrán recibir, mediante permisos explícitos, alguna participación administrativa, funcional o personal dentro de ese proceso.

La tarea no concede permisos y no define todavía quién inicia, ejecuta, supervisa o aprueba cada instancia.

```text
ROL BASE APLICABLE
        ≠
PERMISO CONCEDIDO
        ≠
AUTORIZACIÓN EFECTIVA
        ≠
ROL OPERATIVO
        ≠
FUNCIÓN RACI DENTRO DEL PROCESO
```

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- los ocho roles base canónicos y sus matrices vigentes;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-CANONICAL-ID-REGISTRY-001`;
- `PROC-PROCESS-OWNER-MATRIX-001`;
- `PROC-PROCESS-CONSUMER-MATRIX-001`;
- `PROC-DUPLICATION-REGISTER-001`.

Una aplicación propietaria, una pantalla, un cargo informal o un oficio observado no sustituyen el rol base canónico.

---

#### 3. Catálogo de roles base permitido

| Rol base                  | Procesos vinculados | Naturaleza relevante para esta tarea                                                                              |
| ------------------------- | ------------------: | ----------------------------------------------------------------------------------------------------------------- |
| `propietario`             |              **69** | Gobierno organizacional global; elegible para permisos reservados y de supervisión, nunca wildcard.               |
| `gerente_general`         |              **69** | Dirección ejecutiva global; sin capacidades reservadas del propietario ni bypass.                                 |
| `gerente`                 |              **68** | Administración integral de sedes explícitamente asignadas.                                                        |
| `supervisor`              |              **60** | Supervisión administrativa local y limitada sobre sedes asignadas.                                                |
| `auxiliar_administrativa` |              **54** | Apoyo administrativo funcional; captura, coordinación o consulta limitada según permiso.                          |
| `contador`                |              **32** | Función financiera permanente; acceso limitado a hechos, conciliación, análisis y documentos autorizados.         |
| `marketing`               |              **22** | Función de marketing; contenido, campañas, canales, oportunidades y análisis comercial limitado.                  |
| `trabajador_operativo`    |              **13** | Rol base mínimo no privilegiado; autoservicio personal esencial y cero autoridad operativa derivada del rol base. |

No se admiten como rol base:

- códigos operativos como `cajero_satelite`, `bodeguero`, `conductor_logistica`, `produccion_cocina` o `gerencia_operativa`;
- oficios legacy como `cajero`, `cocinero`, `mesero`, `barista`, `panadero`, `pastelero`, `repostero` o `conductor`;
- identidades técnicas, dispositivos, service roles, aplicaciones, áreas, sedes o nombres de estaciones;
- códigos retirados como `propietario_admin`.

---

#### 4. Significado exacto de «aplicable»

Un rol base es **aplicable** a un proceso cuando el catálogo podrá asignarle al menos una capacidad permanente y explícita relacionada con alguna de estas finalidades:

1. gobierno o decisión administrativa;
2. supervisión y revisión dentro del alcance autorizado;
3. soporte funcional propio del rol;
4. captura o coordinación administrativa limitada;
5. consulta necesaria y autorizada;
6. autoservicio o actuación sobre el expediente propio;
7. acción excepcional administrativa expresamente catalogada.

La aplicabilidad no determina:

- permisos concretos;
- modalidad `BASE_ONLY`, `OPERATIONAL_ONLY` o `BASE_AND_OPERATIONAL`;
- alcance global, por sede, por área, propio o por recurso;
- necesidad de turno o check-in;
- actor iniciador, ejecutor, supervisor o aprobador;
- segregación de funciones;
- acceso a información sensible;
- autorización final.

Estas decisiones permanecen en el catálogo de permisos, las matrices aprobadas y `PROC-ACTOR-002` a `PROC-ACTOR-010`.

---

#### 5. Regla de autorización

```text
ROL BASE APLICABLE
+
EMPLEADO ACTIVO
+
ROL BASE VIGENTE
+
PERMISO EXPLÍCITO ACTIVO
+
MODALIDAD DE ACCIÓN CORRECTA
+
ALCANCE TERRITORIAL COMPATIBLE
+
RECURSO Y FINALIDAD AUTORIZADOS
+
SIN DENEGACIÓN PREVALENTE
=
AUTORIZACIÓN BASE POSIBLE
```

Un rol ausente de la matriz no podrá recibir silenciosamente una capacidad de ese proceso. Cualquier ampliación posterior exigirá una versión nueva, justificación, revisión de riesgo, actualización de pruebas y trazabilidad de cambio.

---

#### 6. Reglas transversales por clase de rol

##### 6.1 `propietario` y `gerente_general`

Pueden vincularse con los 69 procesos por su alcance de gobierno global, pero:

- no reciben wildcard;
- no obtienen operación física;
- no sustituyen turno, check-in o rol operativo;
- `gerente_general` no hereda capacidades reservadas del propietario;
- la sensibilidad y la finalidad pueden restringir incluso consultas globales.

##### 6.2 `gerente` y `supervisor`

Su vínculo siempre queda limitado a:

```text
permiso explícito
∩ sedes administrativas asignadas
∩ sede del recurso
∩ finalidad permitida
```

Varias sedes asignadas no equivalen a alcance global.

##### 6.3 `auxiliar_administrativa`

Su vínculo representa soporte, captura, coordinación o consulta limitada. No implica aprobación, gobierno, acceso global, modificación de permisos ni intervención sensible automática.

##### 6.4 `contador`

Su vínculo se limita a responsabilidades financieras, tributarias, de conciliación, costo, presupuesto, activos o evidencia económica. No convierte a NUMERA en propietaria de hechos operativos ni concede aprobación por el nombre del rol.

##### 6.5 `marketing`

Su vínculo se limita a contenido, campañas, canales, oportunidades, promociones, experiencia y análisis comercial. No concede control sobre pedidos, pagos, puntos, compensaciones, identidad completa del cliente o inventario.

##### 6.6 `trabajador_operativo`

Solo se vincula cuando el proceso admite autoservicio propio, reporte personal, aceptación, expediente propio o condición de sujeto. Su rol base concede cero autoridad operativa. Toda ejecución física se resolverá mediante `PROC-ACTOR-002` y el contexto operativo vigente.

---

#### 7. Matriz canónica completa

| Proceso      | Propósito empresarial                                                                                                                                                                      | Aplicación propietaria | Roles base aplicables                                                                                                                 | Frontera obligatoria                                                                                                                                                   |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `viso`                 | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`                                                                | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | VISO gobierna el proceso; un portal futuro de TALENTO solo podrá actuar como canal candidato sin conceder autoridad.                                                   |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `trabajador_operativo`                          | La participación propia del trabajador se limita a su expediente, solicitud, aceptación o reporte; la administración de terceros exige permiso, alcance y finalidad.   |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `trabajador_operativo`                          | La participación propia del trabajador se limita a su expediente, solicitud, aceptación o reporte; la administración de terceros exige permiso, alcance y finalidad.   |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `anima`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `trabajador_operativo`                          | La participación propia del trabajador se limita a su expediente, solicitud, aceptación o reporte; la administración de terceros exige permiso, alcance y finalidad.   |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `trabajador_operativo`                          | La participación propia del trabajador se limita a su expediente, solicitud, aceptación o reporte; la administración de terceros exige permiso, alcance y finalidad.   |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `numera`               | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                                                    | El acceso financiero se limita por permiso, finalidad, segregación, periodo y alcance; la presencia del rol contador no crea aprobación ni cierre automático.          |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `trabajador_operativo`                          | La participación propia del trabajador se limita a su expediente, solicitud, aceptación o reporte; la administración de terceros exige permiso, alcance y finalidad.   |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `trabajador_operativo`                          | La participación propia del trabajador se limita a su expediente, solicitud, aceptación o reporte; la administración de terceros exige permiso, alcance y finalidad.   |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `trabajador_operativo`                          | La participación propia del trabajador se limita a su expediente, solicitud, aceptación o reporte; la administración de terceros exige permiso, alcance y finalidad.   |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `fogo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`                                     | Marketing participa únicamente en contenido, canal, campaña, oportunidad o análisis autorizado; no gobierna pedido, pago, compensación ni datos completos del cliente. |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `origo`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`                                      | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `origo`                | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                                                    | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `origo`                | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                                                    | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `origo`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`                                      | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                                                 | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                                                 | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`                                      | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`                                      | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`                                      | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `fogo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `fogo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `fogo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `fogo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `fogo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                                                 | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`                                     | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`                                      | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                                                 | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                                                 | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `pass`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`                                     | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`                                     | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`                                     | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                                             | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La operación de servicio, venta, caja, entrega o conducción no nace del rol base; esta fila cubre gobierno, revisión, soporte funcional o excepción administrativa.    |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `numera`               | `propietario`, `gerente_general`, `auxiliar_administrativa`, `contador`                                                               | El acceso financiero se limita por permiso, finalidad, segregación, periodo y alcance; la presencia del rol contador no crea aprobación ni cierre automático.          |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `numera`               | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                                                    | El acceso financiero se limita por permiso, finalidad, segregación, periodo y alcance; la presencia del rol contador no crea aprobación ni cierre automático.          |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `numera`               | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                                                    | El acceso financiero se limita por permiso, finalidad, segregación, periodo y alcance; la presencia del rol contador no crea aprobación ni cierre automático.          |
| `VPROC-0054` | Gestionar costos, distribución, presupuesto, cierre y rentabilidad con reglas versionadas                                                                                                  | `numera`               | `propietario`, `gerente_general`, `gerente`, `contador`                                                                               | El acceso financiero se limita por permiso, finalidad, segregación, periodo y alcance; la presencia del rol contador no crea aprobación ni cierre automático.          |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `aura`                 | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `marketing`                                                   | Marketing participa únicamente en contenido, canal, campaña, oportunidad o análisis autorizado; no gobierna pedido, pago, compensación ni datos completos del cliente. |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `aura`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`                                     | Marketing participa únicamente en contenido, canal, campaña, oportunidad o análisis autorizado; no gobierna pedido, pago, compensación ni datos completos del cliente. |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`, `trabajador_operativo` | Todos los roles pueden ser sujetos o reportantes; esto no concede administración transversal, acceso sensible ni ejecución operativa por el rol base.                  |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`, `trabajador_operativo` | Todos los roles pueden ser sujetos o reportantes; esto no concede administración transversal, acceso sensible ni ejecución operativa por el rol base.                  |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`, `trabajador_operativo` | Todos los roles pueden ser sujetos o reportantes; esto no concede administración transversal, acceso sensible ni ejecución operativa por el rol base.                  |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `numera`               | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | El acceso financiero se limita por permiso, finalidad, segregación, periodo y alcance; la presencia del rol contador no crea aprobación ni cierre automático.          |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`, `trabajador_operativo` | Todos los roles pueden ser sujetos o reportantes; esto no concede administración transversal, acceso sensible ni ejecución operativa por el rol base.                  |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`, `trabajador_operativo` | Todos los roles pueden ser sujetos o reportantes; esto no concede administración transversal, acceso sensible ni ejecución operativa por el rol base.                  |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `viso`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`, `trabajador_operativo` | Todos los roles pueden ser sujetos o reportantes; esto no concede administración transversal, acceso sensible ni ejecución operativa por el rol base.                  |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `nexo`                 | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La ejecución física queda fuera de esta matriz y requerirá rol operativo, turno, territorio, recurso y permiso en PROC-ACTOR-002 y tareas posteriores.                 |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `pulso`                | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`                                     | Marketing participa únicamente en contenido, canal, campaña, oportunidad o análisis autorizado; no gobierna pedido, pago, compensación ni datos completos del cliente. |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `numera`               | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing`                         | El acceso financiero se limita por permiso, finalidad, segregación, periodo y alcance; la presencia del rol contador no crea aprobación ni cierre automático.          |

---

#### 8. Resultado cuantitativo

| Métrica                                      | Resultado |
| -------------------------------------------- | --------: |
| procesos evaluados                           |    **69** |
| roles base canónicos                         |     **8** |
| pares posibles                               |   **552** |
| pares aplicables                             |   **387** |
| pares no aplicables                          |   **165** |
| mínimo de roles aplicables por proceso       |     **4** |
| máximo de roles aplicables por proceso       |     **8** |
| procesos sin vínculo                         |     **0** |
| códigos de rol desconocidos                  |     **0** |
| códigos operativos o legacy usados como base |     **0** |

Distribución por cantidad de roles aplicables:

| Roles por proceso | Procesos |
| ----------------: | -------: |
|             **4** |   **12** |
|             **5** |   **23** |
|             **6** |   **20** |
|             **7** |    **8** |
|             **8** |    **6** |

---

#### 9. Exclusiones expresas

Esta tarea no:

- define roles operativos aplicables;
- asigna iniciador, ejecutor, supervisor o aprobador;
- concede permisos;
- crea una jerarquía de autorización entre roles;
- autoriza por el nombre del rol;
- permite que un rol base ejecute una transición operativa;
- define pantallas, menús o estaciones;
- modifica catálogos físicos, datasets, RLS, RPC, código o Supabase;
- reemplaza las matrices `AUTH-RBAC-*`;
- convierte al `trabajador_operativo` en rol operativo;
- incluye clientes, proveedores, autoridades, dispositivos o servicios como roles base humanos.

---

#### 10. Evolución y control de cambios

Toda modificación futura de un vínculo proceso–rol deberá declarar:

1. proceso afectado;
2. rol agregado o retirado;
3. finalidad empresarial;
4. permisos potencialmente impactados;
5. alcance y sensibilidad;
6. riesgo de segregación;
7. impacto sobre matrices, UI y pruebas;
8. compatibilidad con versiones anteriores;
9. fecha de vigencia;
10. responsable y aprobación.

CI deberá impedir:

- procesos sin fila;
- roles desconocidos;
- códigos legacy u operativos dentro de la matriz base;
- duplicados;
- ampliaciones no versionadas;
- inferencia de autorización desde esta relación.

---

#### 11. Requisitos de prueba derivados

Esta tarea genera ocho requisitos:

```text
TREQ-PROC-119
TREQ-PROC-120
TREQ-PROC-121
TREQ-PROC-122
TREQ-PROC-123
TREQ-PROC-124
TREQ-PROC-125
TREQ-PROC-126
```

El detalle completo queda incorporado en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`, que deberá reemplazarse integralmente.

---

#### 12. Criterios de aceptación

- [ ] Los 69 procesos aparecen exactamente una vez.
- [ ] Solo aparecen los ocho roles base canónicos.
- [ ] Los 552 pares posibles pueden reconstruirse de forma determinista.
- [ ] Ningún proceso queda sin rol base aplicable.
- [ ] No se usan roles operativos, oficios legacy, aplicaciones, dispositivos o service roles como rol base.
- [ ] La matriz no concede permisos ni autorización.
- [ ] `propietario` y `gerente_general` no reciben wildcard ni bypass operativo.
- [ ] `gerente` y `supervisor` permanecen limitados territorialmente.
- [ ] `auxiliar_administrativa`, `contador` y `marketing` conservan fronteras funcionales.
- [ ] `trabajador_operativo` solo participa en alcance propio o como sujeto y no obtiene operación por su rol base.
- [ ] Procesos sensibles conservan finalidad, minimización y segregación.
- [ ] La ejecución física queda reservada a `PROC-ACTOR-002`.
- [ ] Las funciones iniciador, ejecutor, supervisor y aprobador quedan reservadas a `PROC-ACTOR-003`.
- [ ] No se modificó implementación, Supabase, migraciones ni código.
- [ ] Los ocho requisitos de prueba fueron incorporados al registro completo.

---

#### 13. Estado y continuidad

```text
PROC-CAT-020   APROBADA
PROC-ACTOR-001 APROBADA
PROC-ACTOR-002 NO INICIADA
```

No se inicia `PROC-ACTOR-002` hasta la aprobación expresa de esta tarea.


### ✅ PROC-ACTOR-002 — Vincular cada proceso con roles operativos aplicables

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-001 — Vincular cada proceso con roles base aplicables` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-003 — Diferenciar iniciador, ejecutor, supervisor y aprobador`  
**Artefacto producido:** `PROC-OPERATIONAL-ROLE-APPLICABILITY-MATRIX-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Roles operativos canónicos evaluados:** **12**  
**Pares proceso–rol posibles:** **828**  
**Vínculos aplicables definidos:** **444**  
**Procesos con al menos un rol operativo aplicable:** **51**  
**Procesos sin rol operativo directo:** **18**  
**Roles desconocidos, legacy o base usados como operativos:** **0**  
**Implementación, Supabase y migraciones:** no autorizados

---

#### 1. Propósito

Vincular cada proceso canónico con los roles operativos que podrán intervenir en alguna acción ejecutada durante un turno válido, dentro de una sede, área, recurso y variante compatibles.

La tarea define **aplicabilidad funcional**, no autorización ni responsabilidad dentro de la instancia.

```text
ROL OPERATIVO APLICABLE
        ≠
ROL OPERATIVO EFECTIVO
        ≠
PERMISO CONCEDIDO
        ≠
INICIADOR / EJECUTOR / SUPERVISOR / APROBADOR
```

---

#### 2. Dependencias canónicas

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`, especialmente `AUTH-MOD-005` y `AUTH-MOD-006`;
- el catálogo aprobado de doce roles operativos;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001`;
- `PROC-CANONICAL-ID-REGISTRY-001`;
- `PROC-PROCESS-OWNER-MATRIX-001`;
- `PROC-PROCESS-CONSUMER-MATRIX-001`;
- `PROC-BASE-ROLE-APPLICABILITY-MATRIX-001`.

La relación se construye sobre la operación objetivo y no sobre nombres de pantallas, rutas, dispositivos, perfiles predeterminados o permisos legacy existentes.

---

#### 3. Catálogo operativo permitido

| Código                       | Familia            | Límite funcional                                                                              | Procesos aplicables |
| ---------------------------- | ------------------ | --------------------------------------------------------------------------------------------- | ------------------: |
| `cajero_satelite`            | Operación satélite | Caja, cobro y operación POS en sede y área habilitadas.                                       |              **39** |
| `barista_satelite`           | Operación satélite | Preparación y control de bebidas y barra.                                                     |              **38** |
| `cocinero_satelite`          | Operación satélite | Preparación y producción de cocina en punto de venta.                                         |              **38** |
| `servicio_salon`             | Operación satélite | Atención, servicio, entrega y seguimiento de mesa.                                            |              **33** |
| `mostrador_satelite`         | Operación satélite | Atención, alistamiento, entrega y operación de mostrador.                                     |              **40** |
| `operador_integral_satelite` | Operación satélite | Ejecución integrada únicamente en sedes que la habiliten; no es unión automática de permisos. |              **45** |
| `produccion_cocina`          | Producción         | Cocina caliente central dentro del área asignada.                                             |              **33** |
| `produccion_panaderia`       | Producción         | Panadería y galletería dentro del área asignada.                                              |              **33** |
| `produccion_reposteria`      | Producción         | Repostería y pastelería dentro del área asignada.                                             |              **33** |
| `bodeguero`                  | Logística          | Bodega, inventario, custodia y preparación logística.                                         |              **36** |
| `conductor_logistica`        | Logística          | Transporte y custodia durante rutas y entregas asignadas.                                     |              **25** |
| `gerencia_operativa`         | Coordinación       | Coordinación directa durante el turno; no es rol administrativo global ni bypass.             |              **51** |

Queda expresamente excluido `propietario_admin`, junto con cualquier oficio legacy, rol base, dispositivo, aplicación, área, sede o service role utilizado como si fuera rol operativo.

---

#### 4. Significado exacto de «aplicable»

Un rol operativo es aplicable cuando, en al menos una variante aprobada del proceso, puede recibir una acción operacional acotada como:

- capturar o confirmar un hecho del turno;
- ejecutar una actividad física o de servicio;
- recibir, transferir o aceptar custodia;
- consultar la información mínima necesaria para ejecutar;
- registrar evidencia, novedad o resultado;
- coordinar un tramo operativo dentro de la sede y el turno;
- activar una contingencia previamente autorizada.

La aplicabilidad no determina:

- qué rol inicia, ejecuta, supervisa o aprueba;
- qué permiso concreto se requiere;
- si una acción es `OPERATIONAL_ONLY` o `BASE_AND_OPERATIONAL`;
- si se exige check-in, doble control o segregación;
- qué pantalla verá el actor;
- si el actor puede consultar expedientes completos;
- si el rol puede operar en cualquier sede o área.

Esas decisiones permanecen en el catálogo de permisos, las matrices `AUTH-RBAC-*`, el contexto canónico y `PROC-ACTOR-003` a `PROC-ACTOR-010`.

---

#### 5. Resolución del rol operativo efectivo

```text
EMPLEADO ACTIVO
+ TURNO VÁLIDO
+ UN ÚNICO ROL OPERATIVO ASIGNADO
+ ROL ACTIVO
+ ROL HABILITADO EN LA SEDE
+ ÁREA COMPATIBLE
+ CHECK-IN VÁLIDO CUANDO APLIQUE
+ PERMISO EXPLÍCITO
+ RECURSO DENTRO DEL ALCANCE
+ SIN DENEGACIÓN PREVALENTE
= ROL OPERATIVO EFECTIVO PARA LA ACCIÓN
```

No se utilizarán como fallback:

- `employees.role`;
- el rol base;
- `default_operational_role`;
- `navigation_role`;
- el último turno;
- el nombre del área o la estación;
- una selección enviada por el frontend;
- el usuario técnico del dispositivo compartido.

Ante ausencia, ambigüedad, expiración o incompatibilidad: **DENEGAR**.

---

#### 6. Salvaguardas por rol

##### 6.1 `operador_integral_satelite`

Solo podrá utilizarse en sedes que lo habiliten expresamente. No representa la suma automática de caja, barra, cocina, servicio y mostrador; cada acción seguirá exigiendo permiso, área, recurso y segregación propios.

##### 6.2 `gerencia_operativa`

Es coordinación temporal durante el turno. No concede administración global, acceso sensible, edición de catálogos, aprobación financiera, gestión laboral, cambio de permisos ni bypass por jerarquía.

##### 6.3 `bodeguero`

Su aplicabilidad se limita a bodega, almacenamiento, inventario, alistamiento, custodia y recepción dentro de LOC y sedes autorizadas. No crea autoridad comercial, contable o de compra.

##### 6.4 `conductor_logistica`

Su alcance se limita a vehículo, carga, ruta, parada, evidencia y custodia en tránsito. No administra inventario global ni puede cerrar entregas sin prueba y aceptación aplicables.

##### 6.5 Roles satélite y productivos

Solo operan en la sede, área, estación, receta, pedido, lote, caja, mesa o recurso que corresponda. Un rol habilitado en una sede no se vuelve válido en otra ni en un área incompatible.

---

#### 7. Matriz canónica completa

| Proceso      | Propósito empresarial                                                                                                                                                                      | Propietaria | Roles operativos aplicables                                                                                                                                                                                                                                      | Frontera obligatoria                                                                                                                                                              |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Cada rol solo podrá aceptar, registrar o completar el tramo que corresponda a su turno, sede, área y recurso; no adquiere coordinación global ni autoridad sobre otros equipos.   |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `anima`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | El rol operativo aporta el contexto del turno afectado. La consulta o decisión sobre expedientes de terceros sigue dependiendo de rol base, finalidad y permiso sensible.         |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | El rol operativo aporta el contexto del turno afectado. La consulta o decisión sobre expedientes de terceros sigue dependiendo de rol base, finalidad y permiso sensible.         |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `numera`    | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Permite reporte, control inmediato, checklist o respuesta dentro del área asignada; no concede acceso completo al expediente SST, médico, disciplinario o de investigación.       |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Permite reporte, control inmediato, checklist o respuesta dentro del área asignada; no concede acceso completo al expediente SST, médico, disciplinario o de investigación.       |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Permite reporte, control inmediato, checklist o respuesta dentro del área asignada; no concede acceso completo al expediente SST, médico, disciplinario o de investigación.       |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                          | La operación puede proponer, consultar, probar o validar dentro de su variante; publicar, versionar, retirar o aprobar el maestro exige acción y permiso separados.               |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `fogo`      | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `gerencia_operativa`                                                                                                | La operación puede proponer, consultar, probar o validar dentro de su variante; publicar, versionar, retirar o aprobar el maestro exige acción y permiso separados.               |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | La operación puede proponer, consultar, probar o validar dentro de su variante; publicar, versionar, retirar o aprobar el maestro exige acción y permiso separados.               |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                        | La operación puede proponer, consultar, probar o validar dentro de su variante; publicar, versionar, retirar o aprobar el maestro exige acción y permiso separados.               |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `origo`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | La operación se limita a necesidad, evidencia técnica o recepción física aplicable. No concede selección final, aprobación de compra, obligación financiera ni pago.              |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `origo`     | `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                                                                                          | La operación se limita a necesidad, evidencia técnica o recepción física aplicable. No concede selección final, aprobación de compra, obligación financiera ni pago.              |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `origo`     | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `origo`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                          | La operación se limita a necesidad, evidencia técnica o recepción física aplicable. No concede selección final, aprobación de compra, obligación financiera ni pago.              |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `nexo`      | `bodeguero`; `gerencia_operativa`                                                                                                                                                                                                                                | Solo aplica sobre LOC, stock, lote, custodia y área compatibles con el turno. Ajustes, disposición, transferencias y cierres exigen comandos y permisos exactos.                  |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa`                   | Solo aplica sobre LOC, stock, lote, custodia y área compatibles con el turno. Ajustes, disposición, transferencias y cierres exigen comandos y permisos exactos.                  |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Solo aplica sobre LOC, stock, lote, custodia y área compatibles con el turno. Ajustes, disposición, transferencias y cierres exigen comandos y permisos exactos.                  |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Solo aplica sobre LOC, stock, lote, custodia y área compatibles con el turno. Ajustes, disposición, transferencias y cierres exigen comandos y permisos exactos.                  |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Solo aplica sobre LOC, stock, lote, custodia y área compatibles con el turno. Ajustes, disposición, transferencias y cierres exigen comandos y permisos exactos.                  |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Solo aplica sobre LOC, stock, lote, custodia y área compatibles con el turno. Ajustes, disposición, transferencias y cierres exigen comandos y permisos exactos.                  |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | La participación se limita a custodia, uso, inspección, entrega, retorno o novedad del recurso asignado; no concede administración global del catálogo ni disposición final.      |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | La participación se limita a custodia, uso, inspección, entrega, retorno o novedad del recurso asignado; no concede administración global del catálogo ni disposición final.      |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `nexo`      | `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                                                                                                                                                                         | La participación se limita a custodia, uso, inspección, entrega, retorno o novedad del recurso asignado; no concede administración global del catálogo ni disposición final.      |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | La participación se limita a custodia, uso, inspección, entrega, retorno o novedad del recurso asignado; no concede administración global del catálogo ni disposición final.      |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `fogo`      | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | Solo aplica a la variante productiva y área habilitadas. Receta, lote, materiales, calidad, liberación y merma conservan permisos y segregaciones independientes.                 |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `fogo`      | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | Solo aplica a la variante productiva y área habilitadas. Receta, lote, materiales, calidad, liberación y merma conservan permisos y segregaciones independientes.                 |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `fogo`      | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | Solo aplica a la variante productiva y área habilitadas. Receta, lote, materiales, calidad, liberación y merma conservan permisos y segregaciones independientes.                 |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `fogo`      | `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                             | Solo aplica a la variante productiva y área habilitadas. Receta, lote, materiales, calidad, liberación y merma conservan permisos y segregaciones independientes.                 |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `fogo`      | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | Solo aplica a la variante productiva y área habilitadas. Receta, lote, materiales, calidad, liberación y merma conservan permisos y segregaciones independientes.                 |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                             | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                                       | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `pulso`     | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `pulso`     | `cajero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                                      | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `pass`      | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `pulso`     | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `nexo`      | `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                                                                                                                                                                         | Solo aplica a carga, ruta, vehículo, parada, custodia y recepción asignadas. No concede stock global, edición de ruta ajena ni cierre sin prueba de entrega.                      |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `nexo`      | `cajero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                            | Solo aplica a carga, ruta, vehículo, parada, custodia y recepción asignadas. No concede stock global, edición de ruta ajena ni cierre sin prueba de entrega.                      |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `pulso`     | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `numera`    | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `numera`    | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `numera`    | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | `numera`    | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                        | Permite ejecutar o evidenciar controles de la instalación y área asignadas; contratos, proveedores, gasto, cierre técnico y disposición requieren autoridad separada.             |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `aura`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `aura`      | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | El rol puede reportar, aportar evidencia o confirmar recuperación desde su estación; no concede soporte privilegiado, administración de cuentas ni acceso a logs sensibles.       |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `numera`    | `gerencia_operativa`                                                                                                                                                                                                                                             | Solo `gerencia_operativa` puede participar en análisis o seguimiento del turno y alcance asignados; no sustituye gobierno, riesgo empresarial, aprobación ni acceso global.       |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | La operación solo ejecuta el procedimiento de contingencia aprobado para su sede y área; no puede declarar por sí sola activación global, recuperación total o cierre.            |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `viso`      | `gerencia_operativa`                                                                                                                                                                                                                                             | Solo `gerencia_operativa` puede participar en análisis o seguimiento del turno y alcance asignados; no sustituye gobierno, riesgo empresarial, aprobación ni acceso global.       |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `viso`      | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `viso`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | El rol permite entrega, aceptación, verificación de uso, cambio o devolución dentro del turno; datos sensibles, prescripción y aprobación siguen separados.                       |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `nexo`      | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | La participación se limita a custodia, uso, inspección, entrega, retorno o novedad del recurso asignado; no concede administración global del catálogo ni disposición final.      |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `pulso`     | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | Solo aplica al punto, canal, caja, cliente o pedido atendido durante el turno. No concede administración comercial global, conciliación financiera ni acceso completo al cliente. |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `numera`    | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |

---

#### 8. Procesos sin rol operativo directo

Los siguientes procesos quedan explícitamente fuera del catálogo operativo:

- `VPROC-0001` — Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento
- `VPROC-0002` — Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas
- `VPROC-0003` — Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes
- `VPROC-0005` — Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo
- `VPROC-0006` — Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona
- `VPROC-0007` — Administrar asignaciones laborales y programación publicada con historial y revisión controlada
- `VPROC-0010` — Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales
- `VPROC-0011` — Orquestar retiro laboral, devolución, revocación de accesos y cierre documental
- `VPROC-0021` — Aprobar y emitir compras separando flujo ordinario, urgencia y excepción
- `VPROC-0051` — Registrar hechos económicos desde eventos operativos y soportes correlacionados
- `VPROC-0052` — Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria
- `VPROC-0053` — Gestionar cartera, cobro, recaudo, aplicación y diferencia
- `VPROC-0054` — Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas
- `VPROC-0059` — Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación
- `VPROC-0060` — Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia
- `VPROC-0064` — Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado.
- `VPROC-0065` — Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.
- `VPROC-0069` — Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.

Su ejecución deberá resolverse mediante rol base, identidad personal, servicio autorizado, evento canónico o autoridad externa, según el contrato correspondiente. No se asignará un turno ni `gerencia_operativa` para desbloquearlos.

---

#### 9. Resultado cuantitativo

| Métrica                                | Resultado |
| -------------------------------------- | --------: |
| procesos evaluados                     |    **69** |
| roles operativos canónicos             |    **12** |
| pares posibles                         |   **828** |
| pares aplicables                       |   **444** |
| pares no aplicables                    |   **384** |
| procesos con rol operativo             |    **51** |
| procesos sin rol operativo directo     |    **18** |
| mínimo de roles aplicables por proceso |     **0** |
| máximo de roles aplicables por proceso |    **12** |
| códigos desconocidos, legacy o base    |     **0** |

Distribución por cantidad de roles operativos aplicables:

| Roles por proceso | Procesos |
| ----------------: | -------: |
|             **0** |   **18** |
|             **1** |    **2** |
|             **2** |    **1** |
|             **3** |    **2** |
|             **4** |    **1** |
|             **5** |    **6** |
|             **6** |    **1** |
|             **7** |    **6** |
|             **8** |    **4** |
|             **9** |    **3** |
|            **10** |    **2** |
|            **11** |    **3** |
|            **12** |   **20** |

---

#### 10. Exclusiones expresas

Esta tarea no:

- define iniciador, ejecutor, supervisor o aprobador;
- concede permisos o acceso a pantallas;
- autoriza por nombre de rol;
- convierte `gerencia_operativa` en gerente administrativo;
- convierte `operador_integral_satelite` en superusuario;
- permite múltiples roles operativos simultáneos en un turno;
- usa perfiles, dispositivos o navegación como fuente de autorización;
- define estaciones, menús, UX o rutas;
- modifica datasets, RLS, RPC, código, migraciones o Supabase;
- reemplaza las matrices `AUTH-RBAC-*`;
- crea roles operativos nuevos.

---

#### 11. Evolución y control de cambios

Toda modificación futura deberá declarar:

1. proceso afectado;
2. rol agregado o retirado;
3. variante, sede y área justificantes;
4. acción operacional esperada;
5. permisos y datos impactados;
6. riesgo de segregación, custodia o privacidad;
7. impacto en dispositivos compartidos y operación offline;
8. compatibilidad y estrategia de transición;
9. pruebas afectadas;
10. responsable, aprobación y fecha de vigencia.

CI deberá impedir procesos omitidos, roles desconocidos, `propietario_admin`, roles base dentro de la matriz operativa, duplicados, ampliaciones no versionadas y fallbacks desde nombres hardcodeados.

---

#### 12. Requisitos de prueba derivados

Esta tarea genera ocho requisitos:

```text
TREQ-PROC-127
TREQ-PROC-128
TREQ-PROC-129
TREQ-PROC-130
TREQ-PROC-131
TREQ-PROC-132
TREQ-PROC-133
TREQ-PROC-134
```

El detalle completo queda incorporado en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`, que deberá reemplazarse integralmente.

---

#### 13. Criterios de aceptación

- [ ] Los 69 procesos aparecen exactamente una vez.
- [ ] Solo aparecen los doce roles operativos canónicos.
- [ ] Los 828 pares posibles pueden reconstruirse de forma determinista.
- [ ] Los 18 procesos sin rol operativo están marcados explícitamente como `NO_APLICA`.
- [ ] No se usa `gerencia_operativa` como comodín administrativo.
- [ ] `operador_integral_satelite` no agrega permisos de otros roles.
- [ ] Cada rol requiere turno, sede, área, check-in cuando aplique, permiso y recurso compatibles.
- [ ] No existen fallbacks desde rol base, perfil, navegación, dispositivo o último turno.
- [ ] Los roles de producción, satélite y logística conservan fronteras territoriales y de custodia.
- [ ] La matriz no concede permisos ni define funciones RACI.
- [ ] Las funciones iniciador, ejecutor, supervisor y aprobador quedan reservadas a `PROC-ACTOR-003`.
- [ ] No se modificó implementación, Supabase, migraciones ni código.
- [ ] Los ocho requisitos de prueba fueron incorporados al registro completo.

---

#### 14. Estado y continuidad

```text
PROC-ACTOR-001 APROBADA
PROC-ACTOR-002 APROBADA
PROC-ACTOR-003 NO INICIADA
```

No se inicia `PROC-ACTOR-003` hasta la aprobación expresa de esta tarea.


### ✅ PROC-ACTOR-003 — Diferenciar iniciador, ejecutor, supervisor y aprobador

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-002 — Vincular cada proceso con roles operativos aplicables` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-004 — Definir procesos personales`  
**Artefacto producido:** `PROC-ACTOR-RESPONSIBILITY-MATRIX-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Funciones diferenciadas por proceso:** iniciador, ejecutor, supervisor/control y aprobador/aceptador  
**Filas canónicas:** **69**  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Convertir las funciones iniciadoras y continuadoras ya aprobadas en una matriz inequívoca de responsabilidad para cada proceso, evitando que iniciar, ejecutar, supervisar y aprobar se interpreten como sinónimos o se concentren automáticamente en una misma persona.

```text
INICIAR
→ crea o formaliza una instancia válida

EJECUTAR
→ produce el trabajo o efecto sustantivo

SUPERVISAR / CONTROLAR
→ verifica avance, calidad, evidencia, aceptación o conciliación

APROBAR
→ autoriza una decisión reservada, material o excepcional
```

Una función podrá no existir en el flujo ordinario. En particular, no se impondrá un aprobador artificial a hechos automáticos, transacciones ordinarias, capturas de evidencia o acciones ya autorizadas por contrato.

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-PROCESS-STARTER-REGISTRY-001`;
- `PROC-PROCESS-CONTINUATION-REGISTRY-001`;
- `PROC-BASE-ROLE-APPLICABILITY-MATRIX-001`;
- `PROC-OPERATIONAL-ROLE-APPLICABILITY-MATRIX-001`;
- estados, transiciones, excepciones, cancelaciones, reversos, entradas, salidas, eventos y auditoría aprobados para los 69 procesos.

La matriz no reemplaza el catálogo de permisos ni convierte una función empresarial en un rol RBAC nuevo.

---

#### 3. Definiciones normativas

##### 3.1. Iniciador

Actor u origen autorizado que presenta la intención, el hecho, la alerta o el evento mínimo necesario para que la aplicación propietaria cree una instancia válida.

Iniciar no permite por sí solo ejecutar, aprobar, corregir, cancelar, revertir ni cerrar.

##### 3.2. Ejecutor

Actor interno responsable de realizar el trabajo sustantivo, producir salidas, registrar efectos o coordinar apoyos. Puede existir más de un ejecutor por etapas, pero cada acción concreta tendrá un actor efectivo identificable.

##### 3.3. Supervisor o control

Actor que verifica avance, cumplimiento, calidad, evidencia, custodia, recepción o conciliación. Supervisar no autoriza automáticamente cambios reservados ni permite sobrescribir hechos producidos por el ejecutor.

##### 3.4. Aprobador

Autoridad que emite una decisión explícita sobre un objeto material: versión, gasto, compra, liberación, ajuste, excepción, acceso, disposición, riesgo, presupuesto u otro compromiso reservado.

El aprobador no se infiere por jerarquía, nombre del rol, pertenencia a una pantalla, recepción de una notificación o presencia en una matriz de aplicabilidad.

##### 3.5. Aceptador

Actor que confirma recepción, entrega, custodia, consentimiento o conformidad. La aceptación puede cerrar un handoff, pero no equivale a aprobación administrativa, financiera o de gobierno.

---

#### 4. Modos de aprobación

| Modo                        | Cantidad | Regla                                                                                                                         |
| --------------------------- | -------: | ----------------------------------------------------------------------------------------------------------------------------- |
| `OBLIGATORIA`               |   **32** | Existe una decisión material que no puede quedar vigente sin autoridad explícita.                                             |
| `CONDICIONAL`               |   **25** | Solo ciertas excepciones, umbrales o decisiones dentro del proceso requieren aprobación separada.                             |
| `NO_APLICA_FLUJO_ORDINARIO` |   **10** | El flujo ordinario no tiene una decisión de aprobación; conserva autorización por comando, controles y excepciones separadas. |
| `ACEPTACION`                |    **2** | Existe aceptación del receptor o destinatario, distinta de una aprobación administrativa.                                     |

Queda prohibido interpretar `NO_APLICA_FLUJO_ORDINARIO` como ausencia de autorización. Toda acción sigue exigiendo permiso, contexto, estado, recurso y condiciones contractuales; simplemente no se agrega una segunda firma sin valor de control.

---

#### 5. Resolución de una función hacia un actor real

Las funciones utilizadas por esta matriz son responsabilidades funcionales ya aprobadas. En tiempo de ejecución deberán resolverse así:

```text
FUNCIÓN DEL PROCESO
+ identidad válida
+ rol base aplicable, cuando corresponda
+ rol operativo efectivo, cuando corresponda
+ permiso exacto
+ alcance territorial y de recurso
+ estado y transición permitidos
+ segregación y umbral
= ACTOR AUTORIZADO PARA ESA ACCIÓN
```

Reglas obligatorias:

1. `GERENCIA_O_SUPERVISION_DE_SEDE` podrá resolverse a `gerente`, `supervisor` o `gerencia_operativa` únicamente según la naturaleza administrativa u operativa de la acción y su territorio.
2. `EQUIPO_OPERATIVO_DEL_AREA`, `EQUIPO_PRODUCTIVO`, `BODEGA_Y_ABASTECIMIENTO`, `CAJA_MOSTRADOR_O_SERVICIO` y funciones equivalentes solo podrán resolverse hacia roles operativos aplicables en `PROC-ACTOR-002`.
3. `TRABAJADOR` podrá actuar con identidad personal para autoservicio o como rol operativo efectivo para acciones de turno; una modalidad no sustituye la otra.
4. `CLIENTE`, `CANDIDATO`, `PROVEEDOR`, `ASESOR_O_AUTORIDAD` y otros participantes externos no se convertirán en roles internos.
5. `EVENTO_CANONICO_DE_PROCESO`, `REGLA_PROGRAMADA`, `UMBRAL_O_ALERTA`, `SISTEMA_DE_ORIGEN` y automatizaciones son orígenes o mecanismos, no personas, supervisores ni aprobadores.
6. Un dispositivo compartido es principal técnico, nunca iniciador empresarial, ejecutor, supervisor o aprobador por sí mismo.

---

#### 6. Reglas de segregación

1. Quien inicia una solicitud podrá ejecutarla solo cuando la acción sea ordinaria, el permiso lo permita y no exista una decisión reservada.
2. Quien ejecuta una acción crítica no podrá emitir su aprobación final ni validar por sí solo la evidencia que demuestra su propia corrección.
3. Supervisar no permite editar retroactivamente el hecho supervisado; una corrección deberá conservar antes, después, razón y actor.
4. Aprobar exige objeto, alcance, decisión, motivo, evidencia, actor, autoridad, umbral y momento explícitos.
5. Una aceptación externa no sustituye una aprobación interna y una aprobación interna no sustituye la aceptación del receptor.
6. La misma persona podrá ocupar dos funciones solo cuando el contrato lo permita expresamente, no exista conflicto material y la auditoría conserve ambas acciones diferenciadas.
7. Para compras, pagos, caja, inventario, accesos, calidad, disposiciones, riesgos, presupuesto y decisiones laborales críticas, iniciación/preparación, ejecución, aprobación y conciliación deberán separarse según riesgo y umbral.
8. En contingencia, una combinación temporal de funciones requerirá excepción aprobada, duración, alcance, razón, compensación de control y revisión posterior.

---

#### 7. Matriz canónica completa

| Proceso      | Propósito                                                                                                                                                                                  | Iniciador(es)                                                                                                                                            | Ejecutor responsable y apoyos                                                                                                                                                                                    | Supervisor / control                                    | Aprobador o aceptador                                                                                                                                                           | Segregación mínima                                                                                                                                                                                                                                                          |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | Primario: `GOBIERNO_Y_PROPIEDAD`; alternos: `GERENCIA_GENERAL`                                                                                           | Principal: `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`; apoyos: `RESPONSABLE_DEL_PROCESO`; `CUSTODIO_DOCUMENTAL`                                                                                           | `GOBIERNO_Y_PROPIEDAD`                                  | `OBLIGATORIA` — `GOBIERNO_Y_PROPIEDAD`; objeto: decisión empresarial material, alcance, responsable y compromisos.                                                              | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien prepara o ejecuta el seguimiento no emite la decisión reservada.                                                                                                   |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | Primario: `GERENCIA_GENERAL`; alternos: `GOBIERNO_Y_PROPIEDAD`; `ASESOR_O_AUTORIDAD`                                                                     | Principal: `GERENCIA_GENERAL`; apoyos: `RESPONSABLE_DE_PERSONAS`; `RESPONSABLE_FINANCIERO`; `CUSTODIO_DOCUMENTAL`; `RESPONSABLE_TECNOLOGICO`                                                                     | `GOBIERNO_Y_PROPIEDAD`                                  | `OBLIGATORIA` — `GOBIERNO_Y_PROPIEDAD`; objeto: creación, modificación, cierre o regularización de estructura jurídica u organizativa.                                          | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Los especialistas aportan evidencia; no aprueban la estructura que actualizan.                                                                                           |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | Primario: `GOBIERNO_Y_PROPIEDAD`; alternos: `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`                                                      | Principal: `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; apoyos: `RESPONSABLE_DEL_PROCESO`; `CUSTODIO_DOCUMENTAL`                                                                                     | `GOBIERNO_Y_PROPIEDAD`                                  | `OBLIGATORIA` — `GOBIERNO_Y_PROPIEDAD`; objeto: versión, delegación, límite, publicación o retiro de política.                                                                  | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Redactor, evaluador de impacto y aprobador quedan diferenciados.                                                                                                         |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | Primario: `COORDINACION_DE_OPERACIONES`; alternos: `GERENCIA_GENERAL`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `EVENTO_CANONICO_DE_PROCESO`                    | Principal: `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_DEL_PROCESO`; apoyos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `EQUIPO_OPERATIVO_DEL_AREA`                                                                       | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `GERENCIA_GENERAL` o receptor competente; objeto: reasignación crítica, conflicto de alcance o compromiso interempresarial.                                     | La separación se activa para reasignación crítica, conflicto de alcance o compromiso interempresarial; el flujo ordinario no agrega aprobación artificial. La aceptación del receptor no equivale a aprobación jerárquica; el flujo ordinario no crea una firma artificial. |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | Primario: `GERENCIA_O_SUPERVISION_DE_SEDE`; alternos: `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`; `CANDIDATO`                                     | Principal: `RESPONSABLE_DE_SELECCION_Y_VINCULACION`; `GERENCIA_O_SUPERVISION_DE_SEDE`; apoyos: `RESPONSABLE_DE_PERSONAS`                                                                                         | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: apertura de vacante, selección final o decisión de contratación.                                                                    | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien evalúa o documenta candidatos no decide en solitario la contratación.                                                                                              |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | Primario: `RESPONSABLE_DE_PERSONAS`; alternos: `GERENCIA_GENERAL`; `EVENTO_CANONICO_DE_PROCESO`                                                          | Principal: `RESPONSABLE_DE_PERSONAS`; `RESPONSABLE_DE_SELECCION_Y_VINCULACION`; apoyos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_TECNOLOGICO`; `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `BODEGA_Y_ABASTECIMIENTO` | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: vinculación, activación laboral e incorporación concluida.                                                                          | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. La preparación documental, tecnológica, SST y logística no sustituye la aprobación de alta.                                                                              |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | Primario: `GERENCIA_O_SUPERVISION_DE_SEDE`; alternos: `COORDINACION_DE_OPERACIONES`; `GERENCIA_GENERAL`                                                  | Principal: `RESPONSABLE_DE_PROGRAMACION_LABORAL`; `GERENCIA_O_SUPERVISION_DE_SEDE`; apoyos: `RESPONSABLE_DE_PERSONAS`; `TRABAJADOR`                                                                              | `COORDINACION_DE_OPERACIONES`                           | `OBLIGATORIA` — `COORDINACION_DE_OPERACIONES`; objeto: publicación de programación y cambios materiales.                                                                        | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien propone o captura turnos no puede autoaprobar cambios incompatibles con capacidad o reglas laborales.                                                              |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | Primario: `TRABAJADOR`; alternos: `SISTEMA_DE_ORIGEN`                                                                                                    | Principal: `TRABAJADOR`; `GERENCIA_O_SUPERVISION_DE_SEDE`; apoyos: `RESPONSABLE_DE_PERSONAS`                                                                                                                     | `RESPONSABLE_DE_PROGRAMACION_LABORAL`                   | `CONDICIONAL` — `RESPONSABLE_DE_PROGRAMACION_LABORAL`; objeto: corrección, justificación o regularización de asistencia.                                                        | La separación se activa para corrección, justificación o regularización de asistencia; el flujo ordinario no agrega aprobación artificial. El hecho de asistencia se registra sin aprobación; solo su corrección exige decisión separada.                                   |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | Primario: `TRABAJADOR`; alternos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_PERSONAS`                                                            | Principal: `RESPONSABLE_DE_PERSONAS`; `GERENCIA_O_SUPERVISION_DE_SEDE`; apoyos: `TRABAJADOR`; `RESPONSABLE_DE_PROGRAMACION_LABORAL`; `RESPONSABLE_DE_NOMINA_Y_BENEFICIOS`                                        | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `GERENCIA_GENERAL` o autoridad delegada; objeto: permiso, ausencia, reemplazo o excepción con impacto laboral.                                                  | La separación se activa para permiso, ausencia, reemplazo o excepción con impacto laboral; el flujo ordinario no agrega aprobación artificial. Solicitante, registrador y aprobador no se confunden cuando existe impacto económico o de cobertura.                         |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | Primario: `REGLA_PROGRAMADA`; alternos: `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_PERSONAS`                                                              | Principal: `RESPONSABLE_DE_NOMINA_Y_BENEFICIOS`; `RESPONSABLE_FINANCIERO`; apoyos: `RESPONSABLE_DE_PERSONAS`; `GERENCIA_O_SUPERVISION_DE_SEDE`                                                                   | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: paquete autorizado de nómina, beneficios y orden de pago.                                                                           | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Preparación, conciliación, autorización y ejecución bancaria deben quedar separadas.                                                                                     |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | Primario: `RESPONSABLE_DE_PERSONAS`; alternos: `GERENCIA_GENERAL`; `TRABAJADOR`                                                                          | Principal: `RESPONSABLE_DE_PERSONAS`; `GERENCIA_O_SUPERVISION_DE_SEDE`; apoyos: `RESPONSABLE_TECNOLOGICO`; `BODEGA_Y_ABASTECIMIENTO`; `CUSTODIO_DOCUMENTAL`; `RESPONSABLE_FINANCIERO`                            | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: retiro, fecha efectiva y cierre integral del offboarding.                                                                           | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Ningún ejecutor de devolución, revocación o archivo puede declarar por sí solo el cierre laboral.                                                                        |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | Primario: `RESPONSABLE_SST_Y_CUMPLIMIENTO`; alternos: `TRABAJADOR`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`                                  | Principal: `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; apoyos: `TRABAJADOR`; `RESPONSABLE_DE_INSTALACIONES`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                        | `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL` | `CONDICIONAL` — `GERENCIA_GENERAL` o `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; objeto: aceptación de riesgo, tratamiento extraordinario o cierre de acción crítica.                  | La separación se activa para aceptación de riesgo, tratamiento extraordinario o cierre de acción crítica; el flujo ordinario no agrega aprobación artificial. El inspector o ejecutor de la acción correctiva no acepta su propio riesgo residual.                          |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | Primario: `TRABAJADOR`; alternos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`; `TECNICO_O_PRESTADOR_EXTERNO`                                     | Principal: `EQUIPO_DE_RESPUESTA_Y_EMERGENCIA`; `RESPONSABLE_SST_Y_CUMPLIMIENTO`; apoyos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`; `RESPONSABLE_DE_PERSONAS`                                               | `GERENCIA_GENERAL`                                      | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: respuesta inmediata a incidente o emergencia.                                                                     | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. La respuesta no espera aprobación; el cierre, reporte o decisión posterior sí requiere control independiente.                                                      |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | Primario: `REGLA_PROGRAMADA`; alternos: `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`         | Principal: `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_SST_Y_CUMPLIMIENTO`; apoyos: `EQUIPO_OPERATIVO_DEL_AREA`; `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_INSTALACIONES`                                 | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; objeto: cierre de no conformidad, excepción sanitaria o liberación condicionada.       | La separación se activa para cierre de no conformidad, excepción sanitaria o liberación condicionada; el flujo ordinario no agrega aprobación artificial. El control rutinario no requiere firma adicional; una desviación no puede ser cerrada por quien la produjo.       |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | Primario: `RESPONSABLE_DE_CATALOGO`; alternos: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_COMPRAS`                               | Principal: `RESPONSABLE_DE_CATALOGO`; apoyos: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                                  | `COORDINACION_DE_OPERACIONES`                           | `OBLIGATORIA` — `COORDINACION_DE_OPERACIONES`; objeto: alta o nueva versión de producto, presentación, unidad o equivalencia.                                                   | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. El custodio del catálogo no aprueba solo una equivalencia con impacto operativo o financiero.                                                                            |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | Primario: `RESPONSABLE_PRODUCTIVO`; alternos: `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_DE_CATALOGO`; `GERENCIA_GENERAL`                        | Principal: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; apoyos: `EQUIPO_PRODUCTIVO`; `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_ANALITICO`                                                       | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: versión de receta liberada para uso.                                                                                                | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Desarrollo, prueba, evaluación de calidad y aprobación final quedan segregados.                                                                                          |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | Primario: `RESPONSABLE_COMERCIAL`; alternos: `RESPONSABLE_DE_MARCA`; `EVENTO_CANONICO_DE_PROCESO`; `GERENCIA_GENERAL`                                    | Principal: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`; apoyos: `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_PRODUCTIVO`; `GERENCIA_O_SUPERVISION_DE_SEDE`                                                        | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: publicación, retiro o cambio material de oferta.                                                                                    | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Marketing o comercial prepara; la publicación gobernada requiere autoridad explícita.                                                                                    |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | Primario: `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; alternos: `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_PRODUCTIVO`; `ASESOR_O_AUTORIDAD`                      | Principal: `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_DE_CATALOGO`; apoyos: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_COMPRAS`                                                                           | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL` con control de calidad; objeto: versión de especificaciones, alérgenos, restricciones o criterio de calidad.                                 | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. El productor o proveedor no aprueba por sí mismo la especificación que debe cumplir.                                                                                     |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | Primario: `AREA_SOLICITANTE`; alternos: `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_PRODUCTIVO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`         | Principal: `RESPONSABLE_DE_COMPRAS`; apoyos: `AREA_SOLICITANTE`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_PRODUCTIVO`                                                                   | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: prioridad, urgencia o excepción de necesidad de compra.                                                               | La separación se activa para prioridad, urgencia o excepción de necesidad de compra; el flujo ordinario no agrega aprobación artificial. La captura ordinaria de necesidad no exige aprobación; elevar prioridad o excepción sí.                                            |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | Primario: `RESPONSABLE_DE_COMPRAS`; alternos: `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`                                                          | Principal: `RESPONSABLE_DE_COMPRAS`; apoyos: `AREA_SOLICITANTE`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                                                                  | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`       | `OBLIGATORIA` — `GERENCIA_GENERAL` o `COORDINACION_DE_OPERACIONES`; objeto: recomendación y selección de proveedor o condición.                                                 | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien cotiza y compara no adjudica por sí solo cuando exista materialidad o conflicto.                                                                                   |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | Primario: `RESPONSABLE_DE_COMPRAS`; alternos: `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`                                                          | Principal: `RESPONSABLE_DE_COMPRAS`; apoyos: `RESPONSABLE_FINANCIERO`; `AREA_SOLICITANTE`                                                                                                                        | `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`       | `OBLIGATORIA` — `GERENCIA_GENERAL` o `COORDINACION_DE_OPERACIONES`; objeto: orden de compra, urgencia o excepción.                                                              | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Solicitante y comprador no pueden aprobar su propia compra crítica.                                                                                                      |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | Primario: `RECEPCION_EN_SEDE`; alternos: `PROVEEDOR`; `EVENTO_EXTERNO_DE_ENTREGA`                                                                        | Principal: `RECEPCION_EN_SEDE`; `BODEGA_Y_ABASTECIMIENTO`; apoyos: `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `AREA_SOLICITANTE`; `RESPONSABLE_FINANCIERO`                                  | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` con calidad o finanzas según diferencia; objeto: rechazo, aceptación condicionada o resolución de diferencia.                  | La separación se activa para rechazo, aceptación condicionada o resolución de diferencia; el flujo ordinario no agrega aprobación artificial. La recepción conforme puede cerrarse por contrato; una diferencia exige actor distinto del receptor.                          |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | Primario: `BODEGA_Y_ABASTECIMIENTO`; alternos: `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_DE_INSTALACIONES`                                             | Principal: `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_CATALOGO`; apoyos: `RESPONSABLE_DE_INSTALACIONES`; `COORDINACION_DE_OPERACIONES`                                                                           | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: alta, cambio o retiro de sede, LOC, zona o condición gobernada.                                                                     | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Bodega o instalaciones proponen y verifican; no aprueban unilateralmente el maestro.                                                                                     |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | Primario: `RECEPCION_EN_SEDE`; alternos: `BODEGA_Y_ABASTECIMIENTO`; `EVENTO_CANONICO_DE_PROCESO`; `LOGISTICA_Y_TRANSPORTE`                               | Principal: `RECEPCION_EN_SEDE`; `BODEGA_Y_ABASTECIMIENTO`; apoyos: `LOGISTICA_Y_TRANSPORTE`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                                                                | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: movimiento normal de ingreso, ubicación o reubicación.                                                            | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. El movimiento exige autorización del comando, pero no una aprobación separada; excepciones usan flujo específico.                                                  |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | Primario: `AREA_SOLICITANTE`; alternos: `RESPONSABLE_PRODUCTIVO`; `CAJA_MOSTRADOR_O_SERVICIO`; `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE`       | Principal: `EQUIPO_OPERATIVO_DEL_AREA`; `BODEGA_Y_ABASTECIMIENTO`; apoyos: `RESPONSABLE_PRODUCTIVO`; `LOGISTICA_Y_TRANSPORTE`; `CAJA_MOSTRADOR_O_SERVICIO`                                                       | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: retiro excepcional, traslado fuera de alcance o consumo no estándar.                                                  | La separación se activa para retiro excepcional, traslado fuera de alcance o consumo no estándar; el flujo ordinario no agrega aprobación artificial. El consumo o traslado ordinario autorizado no crea una aprobación adicional.                                          |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | Primario: `REGLA_PROGRAMADA`; alternos: `BODEGA_Y_ABASTECIMIENTO`; `COORDINACION_DE_OPERACIONES`; `UMBRAL_O_ALERTA`                                      | Principal: `BODEGA_Y_ABASTECIMIENTO`; `EQUIPO_OPERATIVO_DEL_AREA`; apoyos: `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_ANALITICO`                                                                                | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `OBLIGATORIA` — `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: ajuste de inventario después de conteo e investigación.                                                               | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien cuenta o investiga no aprueba el ajuste que modifica el saldo.                                                                                                     |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | Primario: `UMBRAL_O_ALERTA`; alternos: `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `TRABAJADOR`                                     | Principal: `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `BODEGA_Y_ABASTECIMIENTO`; apoyos: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_INSTALACIONES`; `EQUIPO_OPERATIVO_DEL_AREA`                                        | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `OBLIGATORIA` — `GERENCIA_O_SUPERVISION_DE_SEDE` con `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; objeto: liberación de cuarentena, merma, pérdida o disposición.                      | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Custodio, inspector y aprobador de disposición deben quedar trazables y separados.                                                                                       |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | Primario: `AREA_SOLICITANTE`; alternos: `UMBRAL_O_ALERTA`; `RESPONSABLE_PRODUCTIVO`; `CAJA_MOSTRADOR_O_SERVICIO`; `GERENCIA_O_SUPERVISION_DE_SEDE`       | Principal: `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE`; `RECEPCION_EN_SEDE`; apoyos: `AREA_SOLICITANTE`; `RESPONSABLE_PRODUCTIVO`; `CAJA_MOSTRADOR_O_SERVICIO`                                           | `COORDINACION_DE_OPERACIONES`                           | `ACEPTACION` — `RECEPCION_EN_SEDE` o receptor autorizado; objeto: aceptación de entrega interna y cantidades recibidas.                                                         | El ejecutor no puede autoaceptar la entrega; aceptación y aprobación administrativa permanecen distintas. La aceptación del receptor no es aprobación administrativa; diferencias se escalan por separado.                                                                  |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | Primario: `CUSTODIO_O_USUARIO_DE_ACTIVO`; alternos: `COORDINACION_DE_OPERACIONES`; `RECEPCION_EN_SEDE`; `RESPONSABLE_DE_INSTALACIONES`                   | Principal: `CUSTODIO_O_USUARIO_DE_ACTIVO`; `BODEGA_Y_ABASTECIMIENTO`; apoyos: `RECEPCION_EN_SEDE`; `RESPONSABLE_DE_INSTALACIONES`; `COORDINACION_DE_OPERACIONES`                                                 | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: asignación, transferencia, baja o disposición según valor y riesgo.                                                   | La separación se activa para asignación, transferencia, baja o disposición según valor y riesgo; el flujo ordinario no agrega aprobación artificial. Custodio o usuario no aprueba la baja o pérdida del activo bajo su tenencia.                                           |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | Primario: `CUSTODIO_O_USUARIO_DE_ACTIVO`; alternos: `REGLA_PROGRAMADA`; `UMBRAL_O_ALERTA`; `TECNICO_O_PRESTADOR_EXTERNO`; `RESPONSABLE_DE_INSTALACIONES` | Principal: `RESPONSABLE_DE_MANTENIMIENTO`; `RESPONSABLE_DE_INSTALACIONES`; apoyos: `CUSTODIO_O_USUARIO_DE_ACTIVO`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_FINANCIERO`                 | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `GERENCIA_GENERAL`; objeto: reparación, gasto, reemplazo, garantía o disposición según umbral.                               | La separación se activa para reparación, gasto, reemplazo, garantía o disposición según umbral; el flujo ordinario no agrega aprobación artificial. Diagnóstico, ejecución del servicio y aprobación económica no se concentran sin excepción declarada.                    |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | Primario: `LOGISTICA_Y_TRANSPORTE`; alternos: `REGLA_PROGRAMADA`; `UMBRAL_O_ALERTA`; `CUSTODIO_O_USUARIO_DE_ACTIVO`                                      | Principal: `LOGISTICA_Y_TRANSPORTE`; `CONDUCTOR_O_RESPONSABLE_DE_RUTA`; apoyos: `RESPONSABLE_DE_MANTENIMIENTO`; `RESPONSABLE_FINANCIERO`; `BODEGA_Y_ABASTECIMIENTO`                                              | `COORDINACION_DE_OPERACIONES`                           | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: liberación de vehículo, gasto extraordinario o indisponibilidad crítica.                                              | La separación se activa para liberación de vehículo, gasto extraordinario o indisponibilidad crítica; el flujo ordinario no agrega aprobación artificial. Conductor o registrador de kilometraje no aprueba su propia novedad material.                                     |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | Primario: `AREA_SOLICITANTE`; alternos: `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE`; `CUSTODIO_O_USUARIO_DE_ACTIVO`                              | Principal: `BODEGA_Y_ABASTECIMIENTO`; `LOGISTICA_Y_TRANSPORTE`; `CUSTODIO_O_USUARIO_DE_ACTIVO`; apoyos: `AREA_SOLICITANTE`; `RECEPCION_EN_SEDE`                                                                  | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: pérdida, faltante, sustitución o baja de reutilizable.                                                                | La separación se activa para pérdida, faltante, sustitución o baja de reutilizable; el flujo ordinario no agrega aprobación artificial. Entrega y devolución ordinarias se aceptan; pérdida o baja exige decisión independiente.                                            |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | Primario: `RESPONSABLE_PRODUCTIVO`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `UMBRAL_O_ALERTA`; `GERENCIA_O_SUPERVISION_DE_SEDE`                          | Principal: `RESPONSABLE_PRODUCTIVO`; `COORDINACION_DE_OPERACIONES`; apoyos: `RESPONSABLE_COMERCIAL`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_DE_PERSONAS`                              | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `COORDINACION_DE_OPERACIONES` o `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: plan de producción, prioridad y compromiso de capacidad.                              | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien calcula o prepara el plan no lo aprueba sin autoridad sobre capacidad y demanda.                                                                                   |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | Primario: `RESPONSABLE_PRODUCTIVO`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `GERENCIA_O_SUPERVISION_DE_SEDE`                                             | Principal: `EQUIPO_PRODUCTIVO`; `RESPONSABLE_PRODUCTIVO`; apoyos: `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                                                                | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: ejecución de producción contra plan y receta aprobados.                                                           | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. La ejecución no se autoaprueba; la liberación del producto ocurre en `VPROC-0035`.                                                                                 |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | Primario: `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `RESPONSABLE_PRODUCTIVO`                                         | Principal: `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; apoyos: `RESPONSABLE_PRODUCTIVO`; `EQUIPO_PRODUCTIVO`; `BODEGA_Y_ABASTECIMIENTO`                                                                                | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `OBLIGATORIA` — `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; objeto: liberación, retención, rechazo o reproceso del producto.                                                          | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. El equipo que produjo el lote no puede emitir por sí solo su decisión de calidad.                                                                                        |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | Primario: `RESPONSABLE_PRODUCTIVO`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                         | Principal: `EQUIPO_PRODUCTIVO`; `BODEGA_Y_ABASTECIMIENTO`; apoyos: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_DE_CATALOGO`                                                     | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` o `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: desviación de empaque, etiqueta, almacenamiento o trazabilidad.                | La separación se activa para desviación de empaque, etiqueta, almacenamiento o trazabilidad; el flujo ordinario no agrega aprobación artificial. La operación conforme no exige firma adicional; una desviación sí requiere control independiente.                          |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | Primario: `RESPONSABLE_PRODUCTIVO`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`                                         | Principal: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; apoyos: `EQUIPO_PRODUCTIVO`; `BODEGA_Y_ABASTECIMIENTO`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_ANALITICO`                             | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `OBLIGATORIA` — `RESPONSABLE_PRODUCTIVO` con calidad o supervisión; objeto: reproceso, aprovechamiento, disposición y cierre de rendimiento.                                    | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien declara la merma o ejecuta el reproceso no aprueba solo su resultado final.                                                                                        |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | Primario: `CLIENTE`; alternos: `SERVICIO_DE_SALON`; `CAJA_MOSTRADOR_O_SERVICIO`                                                                          | Principal: `SERVICIO_DE_SALON`; `EQUIPO_OPERATIVO_DEL_AREA`; `CAJA_MOSTRADOR_O_SERVICIO`; apoyos: —                                                                                                              | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: servicio ordinario en mesa.                                                                                       | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. Pedido, entrega, pago y cierre tienen autorizaciones propias; no se crea un aprobador único del servicio.                                                          |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | Primario: `CLIENTE`; alternos: `CAJA_MOSTRADOR_O_SERVICIO`                                                                                               | Principal: `CAJA_MOSTRADOR_O_SERVICIO`; `EQUIPO_OPERATIVO_DEL_AREA`; apoyos: `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                                                                                 | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: venta ordinaria de mostrador o para llevar.                                                                       | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. Las excepciones, devoluciones y anulaciones se gobiernan en `VPROC-0042`.                                                                                          |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | Primario: `PLATAFORMA_O_CANAL_EXTERNO`; alternos: `PROSPECTO_O_CLIENTE`; `RESPONSABLE_COMERCIAL`                                                         | Principal: `CAJA_MOSTRADOR_O_SERVICIO`; `RESPONSABLE_COMERCIAL`; apoyos: `EQUIPO_OPERATIVO_DEL_AREA`; `LOGISTICA_Y_TRANSPORTE`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                              | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: normalización de pedido externo válido.                                                                           | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. El canal origina el pedido; una excepción comercial requiere autoridad separada.                                                                                   |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | Primario: `EMPRESA_CLIENTE`; alternos: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`                                                                   | Principal: `RESPONSABLE_COMERCIAL`; `COORDINACION_DE_OPERACIONES`; apoyos: `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_COMPRAS`; `LOGISTICA_Y_TRANSPORTE`; `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_MARCA`        | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL` o `COORDINACION_DE_OPERACIONES`; objeto: cotización, capacidad comprometida, términos y excepción B2B.                                       | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien prepara la propuesta no compromete capacidad, precio o crédito sin aprobación.                                                                                     |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | Primario: `CLIENTE`; alternos: `CAJA_MOSTRADOR_O_SERVICIO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `EVENTO_CANONICO_DE_PROCESO`                               | Principal: `CAJA_MOSTRADOR_O_SERVICIO`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; apoyos: `EQUIPO_OPERATIVO_DEL_AREA`; `RESPONSABLE_FINANCIERO`; `LOGISTICA_Y_TRANSPORTE`                                             | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `RESPONSABLE_COMERCIAL`; objeto: cancelación, sustitución, devolución, anulación o compensación según umbral.                | La separación se activa para cancelación, sustitución, devolución, anulación o compensación según umbral; el flujo ordinario no agrega aprobación artificial. Quien originó o ejecutó la venta no aprueba automáticamente su reversión o compensación.                      |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | Primario: `CAJA_MOSTRADOR_O_SERVICIO`; alternos: `CLIENTE`; `PLATAFORMA_O_CANAL_EXTERNO`; `EVENTO_CANONICO_DE_PROCESO`                                   | Principal: `CAJA_MOSTRADOR_O_SERVICIO`; apoyos: `RESPONSABLE_FINANCIERO`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                                                                                    | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: pago iniciado por cliente y confirmado por proveedor.                                                             | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. La autorización del medio de pago no es aprobación interna; reembolso o reverso usa contrato separado.                                                             |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | Primario: `CAJA_MOSTRADOR_O_SERVICIO`; alternos: `REGLA_PROGRAMADA`; `GERENCIA_O_SUPERVISION_DE_SEDE`                                                    | Principal: `CAJA_MOSTRADOR_O_SERVICIO`; `RESPONSABLE_FINANCIERO`; apoyos: `RESPONSABLE_ANALITICO`                                                                                                                | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `OBLIGATORIA` — `GERENCIA_O_SUPERVISION_DE_SEDE` con `RESPONSABLE_FINANCIERO`; objeto: cierre de caja y resolución de diferencias.                                              | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Cajero, preparador de conciliación y aprobador de diferencia deben quedar diferenciados.                                                                                 |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | Primario: `CLIENTE`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `CAJA_MOSTRADOR_O_SERVICIO`                                                                 | Principal: `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `CAJA_MOSTRADOR_O_SERVICIO`; apoyos: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`; `RESPONSABLE_FINANCIERO`                                                   | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `CLIENTE` para consentimiento; autoridad comercial para reglas excepcionales; objeto: consentimiento, alta sensible o ajuste excepcional de fidelización.       | La separación se activa para consentimiento, alta sensible o ajuste excepcional de fidelización; el flujo ordinario no agrega aprobación artificial. El consentimiento del cliente no equivale a aprobación interna ni permite ajustar el ledger sin autoridad.             |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | Primario: `CLIENTE`; alternos: `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `PLATAFORMA_O_CANAL_EXTERNO`; `GERENCIA_O_SUPERVISION_DE_SEDE`                       | Principal: `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; apoyos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD`; `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_FINANCIERO`                               | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; objeto: compensación, devolución o cierre excepcional de reclamo.                       | La separación se activa para compensación, devolución o cierre excepcional de reclamo; el flujo ordinario no agrega aprobación artificial. Quien atiende o investiga no puede conceder compensación fuera de umbral sin aprobación.                                         |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | Primario: `CLIENTE`; alternos: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`; `PLATAFORMA_O_CANAL_EXTERNO`                                             | Principal: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; apoyos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_PRODUCTIVO`; `RESPONSABLE_DE_MARCA`; `CAJA_MOSTRADOR_O_SERVICIO`                 | `COORDINACION_DE_OPERACIONES`                           | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `RESPONSABLE_COMERCIAL`; objeto: capacidad, condiciones especiales o compromiso de evento.                                   | La separación se activa para capacidad, condiciones especiales o compromiso de evento; el flujo ordinario no agrega aprobación artificial. La captura de reserva no compromete recursos no confirmados.                                                                     |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | Primario: `LOGISTICA_Y_TRANSPORTE`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `BODEGA_Y_ABASTECIMIENTO`; `COORDINACION_DE_OPERACIONES`                     | Principal: `LOGISTICA_Y_TRANSPORTE`; apoyos: `BODEGA_Y_ABASTECIMIENTO`; `CONDUCTOR_O_RESPONSABLE_DE_RUTA`; `COORDINACION_DE_OPERACIONES`                                                                         | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `OBLIGATORIA` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `COORDINACION_DE_OPERACIONES`; objeto: plan de ruta, vehículo, carga y restricciones.                                        | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Planificador y conductor no sustituyen la autorización de despacho cuando exista riesgo o capacidad crítica.                                                             |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | Primario: `LOGISTICA_Y_TRANSPORTE`; alternos: `EVENTO_CANONICO_DE_PROCESO`; `BODEGA_Y_ABASTECIMIENTO`                                                    | Principal: `CONDUCTOR_O_RESPONSABLE_DE_RUTA`; `LOGISTICA_Y_TRANSPORTE`; apoyos: `BODEGA_Y_ABASTECIMIENTO`; `RECEPCION_EN_SEDE`                                                                                   | `COORDINACION_DE_OPERACIONES`                           | `ACEPTACION` — `RECEPTOR_O_DESTINATARIO`; objeto: entrega, rechazo, novedad o retorno acreditados.                                                                              | El ejecutor no puede autoaceptar la entrega; aceptación y aprobación administrativa permanecen distintas. El conductor no puede autoaceptar la entrega; la resolución de diferencias pertenece a coordinación.                                                              |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | Primario: `EVENTO_CANONICO_DE_PROCESO`; alternos: `PLATAFORMA_O_CANAL_EXTERNO`; `RESPONSABLE_COMERCIAL`                                                  | Principal: `RESPONSABLE_COMERCIAL`; `LOGISTICA_Y_TRANSPORTE`; apoyos: `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `CAJA_MOSTRADOR_O_SERVICIO`                                                                           | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `RESPONSABLE_COMERCIAL`; objeto: conciliación o excepción de entrega de tercero.                                             | La separación se activa para conciliación o excepción de entrega de tercero; el flujo ordinario no agrega aprobación artificial. El evento del proveedor no constituye aprobación ni prueba suficiente por sí solo.                                                         |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | Primario: `EVENTO_CANONICO_DE_PROCESO`; alternos: `RESPONSABLE_FINANCIERO`                                                                               | Principal: `RESPONSABLE_FINANCIERO`; apoyos: `RESPONSABLE_DEL_PROCESO`; `RESPONSABLE_ANALITICO`                                                                                                                  | `GERENCIA_GENERAL`                                      | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: registro contable derivado de hecho canónico.                                                                     | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. El asiento automático no requiere aprobación por fila; ajustes y cierres usan decisiones controladas.                                                              |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | Primario: `EVENTO_CANONICO_DE_PROCESO`; alternos: `RESPONSABLE_FINANCIERO`; `REGLA_PROGRAMADA`                                                           | Principal: `RESPONSABLE_FINANCIERO`; apoyos: `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_ANALITICO`                                                                                                                   | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según umbral; objeto: obligación, orden y ejecución de pago a proveedor.                                            | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Registro de factura, aprobación, pago y conciliación deben permanecer segregados.                                                                                        |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | Primario: `EVENTO_CANONICO_DE_PROCESO`; alternos: `RESPONSABLE_FINANCIERO`; `REGLA_PROGRAMADA`                                                           | Principal: `RESPONSABLE_FINANCIERO`; `RESPONSABLE_COMERCIAL`; apoyos: `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `RESPONSABLE_ANALITICO`                                                                               | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `GERENCIA_GENERAL` o `RESPONSABLE_FINANCIERO` según umbral; objeto: acuerdo, castigo, nota, crédito o aplicación excepcional.                                   | La separación se activa para acuerdo, castigo, nota, crédito o aplicación excepcional; el flujo ordinario no agrega aprobación artificial. Cobro y aplicación ordinarios no crean firma adicional; una concesión material sí.                                               |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | Primario: `REGLA_PROGRAMADA`; alternos: `RESPONSABLE_FINANCIERO`; `GERENCIA_GENERAL`; `RESPONSABLE_ANALITICO`                                            | Principal: `RESPONSABLE_FINANCIERO`; `RESPONSABLE_ANALITICO`; apoyos: `RESPONSABLE_DEL_PROCESO`; `COORDINACION_DE_OPERACIONES`                                                                                   | `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD`              | `OBLIGATORIA` — `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD`; objeto: regla de distribución, cierre, restatement o lectura oficial de rentabilidad.                              | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien calcula no aprueba unilateralmente la regla ni el cierre oficial.                                                                                                  |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | Primario: `TRABAJADOR`; alternos: `REGLA_PROGRAMADA`; `RESPONSABLE_DE_INSTALACIONES`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`                | Principal: `RESPONSABLE_DE_INSTALACIONES`; `RESPONSABLE_DE_MANTENIMIENTO`; apoyos: `EQUIPO_OPERATIVO_DEL_AREA`; `RESPONSABLE_DE_COMPRAS`; `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `RESPONSABLE_DE_CALIDAD_E_INOCUIDAD` | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `GERENCIA_GENERAL` según gasto; objeto: orden, cierre, gasto, proveedor o excepción de mantenimiento.                        | La separación se activa para orden, cierre, gasto, proveedor o excepción de mantenimiento; el flujo ordinario no agrega aprobación artificial. Quien reporta o ejecuta mantenimiento no aprueba su propia conformidad material.                                             |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | Primario: `RESPONSABLE_DE_MARCA`; alternos: `RESPONSABLE_COMERCIAL`; `GERENCIA_GENERAL`; `EVENTO_CANONICO_DE_PROCESO`                                    | Principal: `RESPONSABLE_DE_MARCA`; apoyos: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_CATALOGO`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                                                               | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: contenido, promoción, condiciones, publicación o retiro.                                                                            | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Creador y publicador técnico no sustituyen la aprobación comercial o legal.                                                                                              |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | Primario: `PROSPECTO_O_CLIENTE`; alternos: `PLATAFORMA_O_CANAL_EXTERNO`; `RESPONSABLE_COMERCIAL`                                                         | Principal: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; apoyos: `RESPONSABLE_DE_MARCA`; `COORDINACION_DE_OPERACIONES`                                                                           | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: creación y atención ordinaria de oportunidad.                                                                     | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. La oportunidad puede avanzar sin aprobador; cotización o compromiso se deriva al proceso correspondiente.                                                          |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | Primario: `TRABAJADOR`; alternos: `UMBRAL_O_ALERTA`; `RESPONSABLE_TECNOLOGICO`; `GERENCIA_O_SUPERVISION_DE_SEDE`                                         | Principal: `RESPONSABLE_TECNOLOGICO`; apoyos: `RESPONSABLE_DEL_PROCESO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`                                                                | `COORDINACION_DE_OPERACIONES`                           | `CONDICIONAL` — `COORDINACION_DE_OPERACIONES` o autoridad tecnológica competente; objeto: prioridad crítica, cambio sensible, cierre de incidente mayor o aceptación de riesgo. | La separación se activa para prioridad crítica, cambio sensible, cierre de incidente mayor o aceptación de riesgo; el flujo ordinario no agrega aprobación artificial. Solicitante y técnico no aprueban por sí solos un cambio o cierre de alto impacto.                   |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | Primario: `RESPONSABLE_DE_PERSONAS`; alternos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`; `EVENTO_CANONICO_DE_PROCESO`                              | Principal: `RESPONSABLE_TECNOLOGICO`; `RESPONSABLE_DE_PERSONAS`; apoyos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_SEGURIDAD_TECNOLOGICA`                                                                | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL` o autoridad de seguridad competente; objeto: concesión, modificación, privilegio, suspensión o revocación de acceso.                         | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Solicitante, administrador técnico y aprobador deben quedar separados en accesos sensibles.                                                                              |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | Primario: `ACTOR_PRODUCTOR_DEL_HECHO_O_EVIDENCIA`; alternos: `CUSTODIO_DOCUMENTAL`; `REGLA_PROGRAMADA`; `ASESOR_O_AUTORIDAD`                             | Principal: `CUSTODIO_DOCUMENTAL`; `ACTOR_PRODUCTOR_DEL_HECHO_O_EVIDENCIA`; apoyos: `RESPONSABLE_DEL_PROCESO`; `RESPONSABLE_TECNOLOGICO`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`                                     | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD`; objeto: excepción de retención, acceso masivo o disposición documental.                                            | La separación se activa para excepción de retención, acceso masivo o disposición documental; el flujo ordinario no agrega aprobación artificial. Crear o clasificar un documento no exige aprobación; disponerlo o exceptuar retención sí.                                  |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | Primario: `RESPONSABLE_ANALITICO`; alternos: `GERENCIA_GENERAL`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `UMBRAL_O_ALERTA`; `EVENTO_CANONICO_DE_PROCESO`       | Principal: `RESPONSABLE_ANALITICO`; `RESPONSABLE_DEL_PROCESO`; apoyos: `RESPONSABLE_FINANCIERO`; `COORDINACION_DE_OPERACIONES`                                                                                   | `GERENCIA_GENERAL`                                      | `OBLIGATORIA` — `GERENCIA_GENERAL`; objeto: decisión de mejora, priorización y cierre de resultado.                                                                             | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Analista y responsable del proceso no aprueban por sí solos la eficacia de su intervención.                                                                              |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | Primario: `UMBRAL_O_ALERTA`; alternos: `TRABAJADOR`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_CONTINUIDAD`; `TECNICO_O_PRESTADOR_EXTERNO`       | Principal: `RESPONSABLE_DE_CONTINUIDAD`; `RESPONSABLE_DEL_PROCESO`; apoyos: `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_TECNOLOGICO`; `GERENCIA_O_SUPERVISION_DE_SEDE`; `EQUIPO_OPERATIVO_DEL_AREA`              | `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD`              | `OBLIGATORIA` — `GERENCIA_GENERAL` o `GOBIERNO_Y_PROPIEDAD` según severidad; objeto: activación, modo degradado, recuperación total y cierre de continuidad.                    | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Quien opera la contingencia no declara por sí solo la recuperación o el cierre.                                                                                          |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | Primario: `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; alternos: `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD`; `UMBRAL_O_ALERTA`                                   | Principal: `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; `RESPONSABLE_DEL_PROCESO`; apoyos: `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`; `RESPONSABLE_ANALITICO`                                                    | `GOBIERNO_Y_PROPIEDAD`                                  | `OBLIGATORIA` — `GOBIERNO_Y_PROPIEDAD`; objeto: aceptación de riesgo, tratamiento, apetito o excepción.                                                                         | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Propietario del riesgo, evaluador y autoridad de aceptación quedan diferenciados.                                                                                        |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | Primario: `ASESOR_O_AUTORIDAD`; alternos: `GERENCIA_GENERAL`; `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; `CUSTODIO_DOCUMENTAL`                                 | Principal: `RESPONSABLE_DE_RIESGO_EMPRESARIAL`; `CUSTODIO_DOCUMENTAL`; `RESPONSABLE_DEL_PROCESO`; apoyos: `GERENCIA_GENERAL`                                                                                     | `GOBIERNO_Y_PROPIEDAD`                                  | `OBLIGATORIA` — `GOBIERNO_Y_PROPIEDAD`; objeto: respuesta oficial, compromiso, entrega o posición ante autoridad.                                                               | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Asesor o autoridad externa no aprueba la obligación interna ni sustituye su propietario.                                                                                 |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | Primario: `GERENCIA_O_SUPERVISION_DE_SEDE`; alternos: `RESPONSABLE_DE_PERSONAS`; `TRABAJADOR`; `REGLA_PROGRAMADA`                                        | Principal: `GERENCIA_O_SUPERVISION_DE_SEDE`; `RESPONSABLE_DE_PERSONAS`; apoyos: `TRABAJADOR`; `RESPONSABLE_ANALITICO`                                                                                            | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `GERENCIA_GENERAL`; objeto: decisión formal de desempeño, plan o consecuencia sensible.                                                                         | La separación se activa para decisión formal de desempeño, plan o consecuencia sensible; el flujo ordinario no agrega aprobación artificial. Retroalimentación ordinaria no exige firma adicional; una decisión formal sí.                                                  |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | Primario: `RESPONSABLE_SST_Y_CUMPLIMIENTO`; alternos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`; `UMBRAL_O_ALERTA`                                  | Principal: `RESPONSABLE_SST_Y_CUMPLIMIENTO`; `BODEGA_Y_ABASTECIMIENTO`; apoyos: `GERENCIA_O_SUPERVISION_DE_SEDE`; `TRABAJADOR`                                                                                   | `GERENCIA_GENERAL`                                      | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE` o `RESPONSABLE_SST_Y_CUMPLIMIENTO`; objeto: entrega excepcional, sustitución, no conformidad o cierre de faltante.             | La separación se activa para entrega excepcional, sustitución, no conformidad o cierre de faltante; el flujo ordinario no agrega aprobación artificial. La aceptación del trabajador no sustituye la aprobación de excepción ni la custodia.                                |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | Primario: `AREA_SOLICITANTE`; alternos: `BODEGA_Y_ABASTECIMIENTO`; `CUSTODIO_O_USUARIO_DE_ACTIVO`; `RESPONSABLE_DE_CATALOGO`                             | Principal: `BODEGA_Y_ABASTECIMIENTO`; `CUSTODIO_O_USUARIO_DE_ACTIVO`; apoyos: `AREA_SOLICITANTE`; `RESPONSABLE_DE_CATALOGO`; `LOGISTICA_Y_TRANSPORTE`                                                            | `GERENCIA_O_SUPERVISION_DE_SEDE`                        | `CONDICIONAL` — `GERENCIA_O_SUPERVISION_DE_SEDE`; objeto: definición, sustitución, faltante, baja o excepción de kit.                                                           | La separación se activa para definición, sustitución, faltante, baja o excepción de kit; el flujo ordinario no agrega aprobación artificial. Préstamo y devolución pueden cerrarse por aceptación; pérdida o baja requiere decisión separada.                               |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | Primario: `EVENTO_CANONICO_DE_PROCESO`; alternos: `CLIENTE`; `REGLA_PROGRAMADA`; `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`                                     | Principal: `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`; `RESPONSABLE_ANALITICO`; apoyos: `RESPONSABLE_COMERCIAL`; `RESPONSABLE_DE_MARCA`; `RESPONSABLE_DEL_PROCESO`                                                      | `GERENCIA_GENERAL`                                      | `NO_APLICA_FLUJO_ORDINARIO` — sin aprobador separado; objeto: respuesta de satisfacción y medición ordinaria.                                                                   | No se crea autoaprobación ficticia; excepciones, correcciones o reversos exigen su autoridad específica. El consentimiento del cliente gobierna la captura; incentivos o compensaciones se resuelven en procesos distintos.                                                 |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | Primario: `RESPONSABLE_FINANCIERO`; alternos: `GERENCIA_GENERAL`; `GOBIERNO_Y_PROPIEDAD`; `REGLA_PROGRAMADA`                                             | Principal: `RESPONSABLE_FINANCIERO`; `RESPONSABLE_ANALITICO`; apoyos: `RESPONSABLE_DEL_PROCESO`; `GERENCIA_GENERAL`; `COORDINACION_DE_OPERACIONES`                                                               | `GOBIERNO_Y_PROPIEDAD`                                  | `OBLIGATORIA` — `GOBIERNO_Y_PROPIEDAD`; objeto: versión presupuestal, supuestos, vigencia y modificación material.                                                              | Iniciador/preparador y ejecutor no pueden emitir la aprobación final de la misma decisión crítica. Preparación, análisis, aprobación y seguimiento del presupuesto no se concentran en un mismo actor crítico.                                                              |

---

#### 8. Fronteras críticas

##### 8.1. Iniciación externa o automática

Un cliente, candidato, proveedor, autoridad, plataforma, alerta o evento puede originar el proceso. La aplicación propietaria sigue siendo responsable de validar, deduplicar y materializar la instancia; el origen no se vuelve ejecutor ni aprobador interno.

##### 8.2. Procesos sin aprobación ordinaria

Los procesos marcados `NO_APLICA_FLUJO_ORDINARIO` no quedan sin control. Mantienen autorización por comando, estados, guards, evidencia, auditoría y supervisión. La aprobación aparece solo cuando existe una excepción, corrección, reverso, umbral o decisión material explícita.

##### 8.3. Supervisión frente a aprobación

El supervisor puede verificar, observar, devolver, escalar o conciliar. Solo el aprobador competente puede hacer vigente una decisión reservada. Un botón denominado “revisar”, “confirmar” o “cerrar” no podrá mezclar ambas funciones sin contrato explícito.

##### 8.4. Aceptación frente a aprobación

La recepción de mercancía, entrega interna, entrega logística, devolución de recurso, consentimiento del cliente o aceptación del trabajador demuestran un handoff o consentimiento. No conceden autoridad para aprobar gasto, ajuste, baja, compensación, política o cierre administrativo.

##### 8.5. Rol operativo y autoridad

`gerencia_operativa` puede coordinar y supervisar acciones del turno dentro del alcance asignado. No podrá aprobar decisiones laborales, financieras, de seguridad, acceso, gobierno, riesgo o presupuesto por el solo nombre del rol.

---

#### 9. Registro y auditoría mínima por función

Cada acción deberá conservar:

- `process_id` e instancia;
- función ejercida: `INITIATOR`, `EXECUTOR`, `SUPERVISOR`, `APPROVER` o `ACCEPTOR`;
- principal autenticado y actor efectivo;
- rol base y rol operativo efectivos, cuando apliquen;
- permiso, alcance, sede, área, turno, recurso y versión;
- comando, estado origen, estado destino y objeto de decisión;
- resultado, razón, evidencia y correlación;
- umbral o política de aprobación utilizada;
- identidad del actor anterior y posterior en handoffs;
- marca temporal del hecho y del registro.

La auditoría deberá detectar cuando la misma persona ocupa funciones incompatibles dentro de la misma instancia y bloquear o escalar según el contrato.

---

#### 10. Resultado cuantitativo

| Métrica                                   | Resultado |
| ----------------------------------------- | --------: |
| procesos cubiertos                        |    **69** |
| filas de responsabilidad                  |    **69** |
| funciones diferenciadas por fila          |     **4** |
| aprobaciones obligatorias                 |    **32** |
| aprobaciones condicionales                |    **25** |
| flujos ordinarios sin aprobación separada |    **10** |
| aceptaciones diferenciadas                |     **2** |
| procesos omitidos                         |     **0** |
| funciones técnicas tratadas como personas |     **0** |

---

#### 11. Exclusiones expresas

Esta tarea no:

- concede permisos;
- define una matriz RACI completa de actividades internas;
- fija montos, umbrales o SLA de aprobación;
- crea roles base u operativos nuevos;
- decide todavía qué procesos son personales, administrativos, operativos, híbridos, de cliente o de sistema;
- diseña pantallas, botones, rutas, formularios o notificaciones;
- autoriza dispositivos, service roles o automatizaciones para aprobar;
- modifica estados, transiciones o acciones ya aprobadas;
- modifica código, Supabase, migraciones, RLS o datos.

Las clasificaciones posteriores permanecen reservadas para `PROC-ACTOR-004` a `PROC-ACTOR-009`; la prohibición de autorizar por nombre del rol permanece reservada para `PROC-ACTOR-010`.

---

#### 12. Evolución y control de cambios

Toda modificación futura deberá declarar:

1. proceso y función afectados;
2. actor funcional agregado, retirado o trasladado;
3. objeto de aprobación o aceptación;
4. modo de aprobación;
5. permiso, alcance, umbral y territorio;
6. conflicto de interés y segregación;
7. impacto en handoffs, auditoría y evidencia;
8. impacto en dispositivos compartidos y offline;
9. compatibilidad, transición y rollback;
10. pruebas, responsable y fecha de vigencia.

CI deberá impedir procesos sin fila, funciones vacías, aprobadores técnicos o desconocidos, aprobaciones obligatorias sin objeto, flujos `NO_APLICA` usados como bypass, y combinaciones incompatibles no justificadas.

---

#### 13. Requisitos de prueba derivados

Esta tarea genera ocho requisitos:

```text
TREQ-PROC-135
TREQ-PROC-136
TREQ-PROC-137
TREQ-PROC-138
TREQ-PROC-139
TREQ-PROC-140
TREQ-PROC-141
TREQ-PROC-142
```

El detalle completo queda incorporado en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`, que deberá reemplazarse integralmente.

---

#### 14. Criterios de aceptación

- [ ] Los 69 procesos aparecen exactamente una vez.
- [ ] Cada fila distingue iniciador, ejecutor, supervisor/control y aprobador/aceptador.
- [ ] Las funciones de inicio corresponden a `PROC-CAT-007`.
- [ ] Las funciones de ejecución y control corresponden a `PROC-CAT-008`.
- [ ] Los roles elegibles permanecen limitados por `PROC-ACTOR-001` y `PROC-ACTOR-002`.
- [ ] Los modos `OBLIGATORIA`, `CONDICIONAL`, `NO_APLICA_FLUJO_ORDINARIO` y `ACEPTACION` están diferenciados.
- [ ] Ningún origen técnico o externo se convierte en aprobador interno.
- [ ] Los procesos sin aprobación ordinaria conservan autorización, controles, auditoría y excepciones.
- [ ] Las decisiones críticas declaran objeto y separación mínima.
- [ ] Aceptación, supervisión y aprobación no se usan como sinónimos.
- [ ] Dispositivos y automatizaciones no se tratan como actores empresariales humanos.
- [ ] No se adelantaron las clasificaciones `PROC-ACTOR-004` a `PROC-ACTOR-009`.
- [ ] No se modificó implementación, Supabase, migraciones ni código.
- [ ] Los ocho requisitos de prueba fueron incorporados al registro completo.

---

#### 15. Estado y continuidad

```text
PROC-ACTOR-002 APROBADA
PROC-ACTOR-003 APROBADA
PROC-ACTOR-004 NO INICIADA
```

No se inicia `PROC-ACTOR-004` hasta la aprobación expresa de esta tarea.
