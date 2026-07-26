MAPA DE ACTORES

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
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `talento`              | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                                                  | La fila declara elegibilidad de vínculo, no permisos, jerarquía, iniciador, ejecutor, supervisor, aprobador ni bypass.                                                 |
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
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `talento`   | **— `NO_APLICA` —**                                                                                                                                                                                                                                              | No admite rol operativo directo. Las acciones pertenecen a identidad personal, rol base, servicio técnico o autoridad administrativa; un turno no podrá habilitar este proceso.   |
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


### ✅ PROC-ACTOR-004 — Definir procesos personales

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-003 — Diferenciar iniciador, ejecutor, supervisor y aprobador` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-005 — Definir procesos administrativos`  
**Artefacto producido:** `PROC-PERSONAL-PROCESS-CLASSIFICATION-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Clasificaciones personales principales:** **9**  
**Clasificaciones personales parciales:** **10**  
**Procesos sin superficie personal:** **50**  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Determinar en cuáles procesos una persona puede actuar en **alcance propio** como candidato, trabajador, extrabajador, custodio o sujeto del dato, y diferenciar esa modalidad de una intervención administrativa, operativa, de cliente o de sistema.

```text
PROCESO PERSONAL
→ la persona actúa sobre su propio caso, dato, documento, solicitud, aceptación o recurso asignado

NO SIGNIFICA
→ que pueda consultar casos ajenos
→ que pueda autoaprobarse
→ que su rol base conceda acceso
→ que toda acción realizada por una persona sea personal
```

La clasificación no crea pantallas, permisos ni rutas. Define el contrato que las tareas posteriores deberán respetar.

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-003`;
- `PROC-PROCESS-INPUT-CONTRACT-001`;
- `PROC-PROCESS-OUTPUT-CONTRACT-001`;
- `PROC-PROCESS-AUDIT-PROFILE-001`;
- contratos de evidencia, aceptación, handoff y segregación aprobados para los 69 procesos.

No se modifica ninguna decisión aprobada ni se anticipan las clasificaciones reservadas para `PROC-ACTOR-005` a `PROC-ACTOR-009`.

---

#### 3. Definición normativa de proceso personal

Un proceso o una etapa es personal cuando se cumplen simultáneamente estas condiciones:

1. existe una persona identificada y vinculada legítimamente con la instancia;
2. la acción recae sobre su propio dato, solicitud, documento, marcación, recurso asignado, aceptación o expediente;
3. el recurso puede delimitarse mediante una relación canónica verificable;
4. la persona no necesita asumir una función administrativa u operativa para ejecutar esa acción;
5. la acción no concede autoridad sobre terceros ni sobre la verdad canónica completa del proceso;
6. toda aprobación, verificación independiente o efecto reservado permanece separado.

Relaciones válidas de alcance personal incluyen, según el proceso:

```text
actor_employee_id = subject_employee_id
candidate_identity = candidate_record_owner
assigned_custodian_id = actor_employee_id
document_subject_id = actor_identity
requester_id = actor_employee_id
```

La mera coincidencia de correo, nombre, documento escrito por el cliente, selección del frontend o posesión de un enlace no demuestra la relación.

---

#### 4. Modos de clasificación

| Modo                 | Cantidad | Regla                                                                                                                                           |
| -------------------- | -------: | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `PERSONAL_PRINCIPAL` |    **9** | La experiencia personal es una vía primaria del proceso y la persona crea, completa, consulta o confirma su propio caso.                        |
| `PERSONAL_PARCIAL`   |   **10** | El proceso es más amplio, pero contiene una etapa personal acotada, como reporte, consulta, custodia, aceptación, firma o rectificación propia. |
| `NO_PERSONAL`        |   **50** | La identidad personal por sí sola no habilita ninguna acción; la participación depende de otra función y se clasificará posteriormente.         |

Los modos no son roles ni permisos. Un mismo proceso podrá ser además administrativo, operativo, híbrido, de cliente o de sistema cuando las tareas posteriores lo determinen.

---

#### 5. Acciones personales permitidas

Una superficie personal podrá ofrecer únicamente acciones expresamente contratadas, como:

- consultar información propia y necesaria;
- crear una solicitud propia;
- aportar datos o documentos propios;
- guardar un borrador privado;
- confirmar recepción o conocimiento;
- aceptar una entrega o custodia propia;
- firmar o confirmar un acto específico;
- solicitar rectificación o corrección;
- reportar una novedad, daño, riesgo o incidente;
- descargar soportes propios autorizados;
- retirar una solicitud dentro del punto permitido;
- consultar estado e historial visibles para la persona.

No podrá inferirse una acción personal por el nombre de la pantalla, por usar ANIMA, por acceder desde una cuenta individual o por tener relación laboral.

---

#### 6. Prohibiciones transversales

1. Una persona no podrá enumerar, buscar ni abrir casos de otros sujetos mediante cambios de URL, filtros, parámetros o identificadores.
2. Iniciar, firmar, aceptar o confirmar no permitirá autoaprobar, conciliar, corregir ni cerrar una decisión reservada.
3. La aceptación de un documento o entrega deberá declarar el objeto exacto; no se interpretará como renuncia general, aceptación de contenido no visible o conformidad con hechos distintos.
4. Confirmar recepción de una evaluación, comprobante o comunicación no equivale necesariamente a estar de acuerdo.
5. Un trabajador operativo no obtiene una superficie personal por estar de turno; una acción de caja, cocina, producción, bodega, conducción o recepción continúa siendo operacional.
6. Las pantallas personales no mostrarán datos de equipo, clientes, candidatos, proveedores o compañeros salvo relación y finalidad expresamente autorizadas.
7. Los datos sensibles deberán minimizarse y no permanecer visibles en tablets, kioscos, historial del navegador, archivos temporales o cachés compartidas.
8. Toda corrección personal crea una solicitud o hecho nuevo vinculado; no sobrescribe el registro original.

---

#### 7. Decisión vinculante sobre firma, PIN y confirmación del trabajador

##### 7.1. El proceso ya lo permite

Los contratos aprobados ya contemplan:

- aceptación explícita de handoffs y registro separado de emisor y receptor;
- `firma` como tipo de evidencia de entrada;
- `evidence_refs[]` para vincular evidencia privada;
- prueba de despacho, recepción, entrega, rechazo, custodia y conciliación;
- función `ACCEPTOR` separada de ejecutor, supervisor y aprobador.

Por tanto, **no es necesario reabrir `PROC-CAT-012`, `PROC-CAT-015`, `PROC-CAT-016` ni `PROC-ACTOR-003`** para permitir una firma dibujada, un PIN o una confirmación reforzada.

##### 7.2. La firma dibujada es evidencia, no identidad suficiente

```text
TRAZO DIBUJADO
≠ identidad comprobada
≠ permiso
≠ aprobación
≠ aceptación de contenido no mostrado
```

Cuando se capture una firma manuscrita en pantalla deberá quedar vinculada, como mínimo, con:

- proceso, instancia, transición y acción exactas;
- principal autenticado y actor efectivo;
- rol, turno, sede, área y dispositivo cuando apliquen;
- snapshot o hash del documento, cantidades, líneas o condiciones visibles al firmar;
- propósito de la firma: envío, recepción, custodia, conformidad, lectura, consentimiento o aprobación;
- resultado, observaciones, diferencias y excepciones;
- timestamps del hecho y del registro;
- hash, ubicación privada, versión y política de retención de la evidencia.

##### 7.3. Dispositivos compartidos

En una tablet compartida la confirmación crítica deberá resolver primero al trabajador real. La modalidad concreta podrá combinar:

```text
sesión activa del trabajador
+
PIN o reautenticación
+
firma dibujada cuando el nivel de evidencia lo exija
```

La firma dibujada no podrá sustituir la sesión del actor, el PIN o la validación de identidad definida para el dispositivo.

##### 7.4. Aplicación al caso de remisiones

`VPROC-0028` continúa clasificado `NO_PERSONAL`, porque despacho y recepción se ejecutan por función operacional. Sin embargo, sus cambios de custodia pueden exigir evidencia personal del actor:

```text
DESPACHO
bodeguero o emisor autorizado
→ confirma cantidades y custodia entregada
→ PIN, reautenticación y/o firma según nivel de evidencia

RECEPCIÓN
receptor autorizado
→ confirma cantidades recibidas, faltantes y observaciones
→ PIN, reautenticación y/o firma según nivel de evidencia
```

La misma regla aplica a `VPROC-0049` para entrega logística, rechazo, novedad o retorno. El conductor no puede firmar como receptor ni autoaceptar su propia entrega.

##### 7.5. Tareas responsables ya existentes

La definición e implementación quedan asignadas sin crear pendientes narrativos:

| Decisión pendiente                                                                  | Tarea responsable                                                                             |
| ----------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| cuándo una tablet exige firma o PIN del trabajador                                  | `AUTH-DEV-007`                                                                                |
| identidad del actor y auditoría en dispositivo compartido                           | `AUTH-DEV-002`, `AUTH-DEV-010`, `AUTH-SRV-010`, `AUTH-SRV-014`                                |
| niveles de aceptación, firma electrónica, firma digital y evidencia                 | `INFO-DOM-011`                                                                                |
| autenticidad, hash, timestamp y cadena de custodia                                  | `INFO-DOM-007`                                                                                |
| inventario, metadatos, almacenamiento, retención y auditoría de la evidencia        | `EVID-ARC-001`, `EVID-ARC-004`, `EVID-ARC-005`, `EVID-ARC-008`                                |
| patrón compartido de confirmación sensible                                          | `SHELL-UI-014`                                                                                |
| vínculo con paso, dispositivo, acción, permiso y criterio de aceptación de pantalla | `PROC-SCREEN-004`, `PROC-SCREEN-013`, `PROC-SCREEN-014`, `PROC-SCREEN-024`, `PROC-SCREEN-028` |
| diseño de firma de documentos                                                       | `INFO-UX-003`                                                                                 |
| despacho y recepción de remisiones                                                  | `NEXO-UX-011`, `NEXO-UX-013`                                                                  |
| protección de despacho, recepción y dispositivo compartido                          | `NEXO-AUTH-008`, `NEXO-AUTH-010`, `NEXO-AUTH-016`                                             |

---

#### 8. Matriz canónica completa

| Proceso      | Propósito                                                                                                                                                                                  | Clasificación personal | Sujeto personal                   | Acciones personales permitidas                                                                                                                  | Límites                                                                                                                                                                                                                                                                                                 | Sensibilidad / evidencia                                 |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- | --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | PERSONAL_PARCIAL       | TRABAJADOR                        | consultar la versión aplicable; confirmar lectura o recepción; registrar duda o solicitud de aclaración                                         | no redacta, publica, sustituye ni aprueba la política; la confirmación no equivale a renuncia ni aceptación ilimitada                                                                                                                                                                                   | laboral / documento y evidencia                          |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | PERSONAL_PRINCIPAL     | CANDIDATO                         | crear o completar su postulación; aportar datos y documentos; otorgar o retirar consentimientos; responder evaluaciones; retirar la candidatura | no se autoevalúa, selecciona, habilita ni convierte en trabajador; solo accede a su expediente y comunicaciones                                                                                                                                                                                         | prelaboral / datos personales y documentos               |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | PERSONAL_PRINCIPAL     | CANDIDATO_O_TRABAJADOR            | completar datos propios; aportar documentos; aceptar entregas e instrucciones; firmar o confirmar hitos; consultar su avance                    | no aprueba su propia vinculación, rol, sede, permisos, aptitud o habilitación; la firma acredita el acto definido, no todo el expediente                                                                                                                                                                | laboral sensible / identidad, documentos y aceptación    |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | PERSONAL_PARCIAL       | TRABAJADOR                        | consultar turnos publicados; declarar disponibilidad; solicitar cambio; confirmar conocimiento; ver historial propio                            | no publica horarios, asigna a terceros, modifica el turno vigente ni se autoasigna sede, área o rol operativo                                                                                                                                                                                           | laboral / horario, ubicación y disponibilidad            |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | PERSONAL_PRINCIPAL     | TRABAJADOR                        | registrar entrada, salida o descanso; consultar marcaciones propias; solicitar corrección; adjuntar evidencia                                   | no modifica hechos confirmados ni aprueba su corrección; una cola offline debe revalidarse antes de sincronizar                                                                                                                                                                                         | laboral sensible / ubicación, tiempo y evidencia         |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | PERSONAL_PRINCIPAL     | TRABAJADOR                        | crear solicitud propia; aportar soporte; consultar estado; responder requerimientos; cancelar antes del punto permitido                         | no aprueba el permiso, ausencia o reemplazo; no consulta casos ajenos ni impone el efecto en nómina o programación                                                                                                                                                                                      | laboral sensible / salud, soporte y decisión             |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | PERSONAL_PARCIAL       | TRABAJADOR                        | consultar comprobantes y beneficios propios; descargar soporte; confirmar recepción; reportar discrepancia                                      | no calcula, modifica, aprueba ni ejecuta pagos; confirmar recepción no equivale a aceptar un valor incorrecto                                                                                                                                                                                           | financiero-laboral altamente sensible                    |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | PERSONAL_PRINCIPAL     | TRABAJADOR_O_EXTRABAJADOR         | consultar obligaciones propias; entregar recursos; firmar actas; aportar información; descargar certificados y soportes autorizados             | no cierra unilateralmente el retiro, revoca accesos, dispone documentos ni declara cumplidas obligaciones sin verificación                                                                                                                                                                              | laboral sensible / documentos, activos y accesos         |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | PERSONAL_PARCIAL       | TRABAJADOR                        | reportar peligro, exposición o condición observada; consultar controles asignados; aportar evidencia; confirmar recepción de instrucciones      | no modifica la matriz de riesgos, acepta riesgo residual ni cierra acciones que requieren verificación independiente                                                                                                                                                                                    | SST sensible / evidencia y ubicación                     |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | PERSONAL_PARCIAL       | TRABAJADOR_O_PERSONA_AFECTADA     | reportar incidente o emergencia; aportar declaración y evidencia propia; consultar atención y acciones que le correspondan                      | no altera el expediente, clasifica definitivamente el caso, investiga a terceros ni cierra el incidente                                                                                                                                                                                                 | SST y salud altamente sensible                           |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | PERSONAL_PARCIAL       | CUSTODIO_TRABAJADOR               | consultar activos asignados; aceptar custodia; reportar condición, daño o pérdida; solicitar transferencia; devolver                            | no crea activos, cambia propiedad, aprueba baja o transfiere custodia sin aceptación del receptor y autorización aplicable                                                                                                                                                                              | activo, custodia y evidencia                             |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | PERSONAL_PARCIAL       | CUSTODIO_O_USUARIO_TRABAJADOR     | solicitar mantenimiento del recurso asignado; describir falla; adjuntar evidencia; confirmar devolución o funcionamiento                        | no aprueba reparación, costo, garantía, repuesto o disposición; no modifica historial técnico                                                                                                                                                                                                           | activo, mantenimiento y evidencia                        |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | PERSONAL_PARCIAL       | CUSTODIO_TRABAJADOR               | aceptar entrega; consultar tenencia; reportar faltante, daño o pérdida; devolver o transferir con aceptación                                    | no ajusta cantidades, cierra diferencias ni elimina responsabilidad histórica                                                                                                                                                                                                                           | custodia, cantidades y evidencia                         |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | PERSONAL_PRINCIPAL     | TRABAJADOR                        | crear solicitud o incidente propio; aportar diagnóstico y evidencia; conversar con soporte; consultar avance; confirmar resolución              | no modifica prioridad definitiva, accede a tickets ajenos, ejecuta cambios privilegiados ni cierra un incidente no resuelto                                                                                                                                                                             | tecnológico / dispositivos, logs y datos personales      |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | PERSONAL_PRINCIPAL     | TRABAJADOR                        | solicitar acceso propio; completar MFA o activación; aceptar condiciones; consultar sesiones y accesos propios; reportar compromiso             | no concede, amplía, aprueba o reactiva su propio acceso; no administra permisos de terceros                                                                                                                                                                                                             | seguridad crítica / identidad y acceso                   |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | PERSONAL_PARCIAL       | TRABAJADOR_O_SUJETO_DEL_DOCUMENTO | consultar documentos propios autorizados; confirmar lectura; aceptar o firmar cuando corresponda; solicitar copia o rectificación               | no altera el original, firma por otro actor, sustituye una aprobación ni interpreta una rúbrica aislada como identidad suficiente                                                                                                                                                                       | información sensible / documento, firma y retención      |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | PERSONAL_PRINCIPAL     | TRABAJADOR                        | consultar objetivos y retroalimentación propia; aportar comentarios o evidencia; confirmar recepción; formular observación o desacuerdo         | confirmar recepción no equivale a aceptar el contenido; no modifica la evaluación ni aprueba consecuencias                                                                                                                                                                                              | laboral altamente sensible / desempeño                   |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | PERSONAL_PRINCIPAL     | TRABAJADOR                        | consultar requerimientos; aceptar entrega; confirmar talla o condición; reportar daño o faltante; solicitar cambio; devolver                    | no aprueba excepciones, sustituye controles SST ni cierra faltantes sin verificación                                                                                                                                                                                                                    | SST / entrega, aceptación y evidencia                    |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | PERSONAL_PARCIAL       | CUSTODIO_TRABAJADOR               | consultar kit asignado; verificar completitud; aceptar préstamo; reportar sustitución, daño o pérdida; devolver                                 | no redefine el kit, modifica componentes canónicos, aprueba baja o cierra diferencias                                                                                                                                                                                                                   | custodia, componentes y evidencia                        |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | NO_PERSONAL            | —                                 | No existe autoservicio personal canónico dentro de este proceso.                                                                                | La identidad personal o la relación laboral por sí solas no habilitan consulta ni acción; cualquier participación se resuelve por la función, permiso, alcance y contexto correspondientes. Las clasificaciones administrativa, operativa, cliente o sistema quedan reservadas para tareas posteriores. | Según el recurso; sin superficie personal en esta tarea. |

---

#### 9. Reglas de experiencia personal

1. La pantalla deberá explicar qué dato o caso propio se está consultando y por qué la persona puede verlo.
2. La acción principal deberá expresarse en lenguaje personal y concreto: “solicitar”, “confirmar recepción”, “reportar”, “firmar este documento” o “pedir corrección”.
3. Toda decisión pendiente de otra función deberá mostrarse como pendiente; la interfaz no prometerá aprobación automática.
4. Los borradores personales serán privados y no se convertirán en hechos empresariales hasta su envío válido.
5. Una acción interrumpida podrá reanudarse sin duplicar solicitudes, firmas, entregas o marcaciones.
6. En equipos compartidos deberá cerrarse o limpiarse la superficie personal al terminar la acción.
7. La persona podrá conocer el estado, responsable funcional y siguiente paso cuando la sensibilidad lo permita.
8. Las razones de denegación deberán distinguir identidad, relación, permiso, estado, plazo, evidencia y conflicto.

---

#### 10. Offline, concurrencia y corrección

- Una solicitud, marcación o confirmación offline conservará identificador idempotente y estado `PENDIENTE_DE_SINCRONIZACION`.
- Antes de sincronizar se revalidarán identidad, relación con el recurso, vigencia, permiso, transición y contexto.
- Dos dispositivos no podrán crear efectos personales duplicados para el mismo comando.
- Una firma o aceptación pendiente no se presentará como confirmada hasta persistirse y vincularse con la versión exacta del objeto.
- Si el objeto cambia después de la firma, la firma anterior no se trasladará a la nueva versión.
- Las rectificaciones conservarán valor anterior, valor propuesto, evidencia, decisión y resultado.

---

#### 11. Resultado cuantitativo

| Métrica                                                        | Resultado |
| -------------------------------------------------------------- | --------: |
| procesos cubiertos                                             |    **69** |
| `PERSONAL_PRINCIPAL`                                           |     **9** |
| `PERSONAL_PARCIAL`                                             |    **10** |
| `NO_PERSONAL`                                                  |    **50** |
| procesos omitidos                                              |     **0** |
| procesos duplicados                                            |     **0** |
| procesos operativos convertidos en personales por exigir firma |     **0** |
| pendientes sobre firma sin tarea responsable                   |     **0** |

---

#### 12. Exclusiones expresas

Esta tarea no:

- diseña todavía las pantallas personales;
- decide la tecnología final de firma;
- determina validez jurídica específica de una firma;
- fija en cuáles transiciones la firma será obligatoria;
- crea roles, permisos, tablas, buckets, RPC o migraciones;
- convierte un PIN en firma digital;
- convierte una rúbrica en autenticación;
- clasifica todavía procesos administrativos, operativos, híbridos, de cliente o de sistema;
- modifica código, Supabase, RLS, Storage ni aplicaciones.

La modalidad exacta y el nivel de evidencia se resolverán en las tareas responsables enumeradas en la sección 7.5.

---

#### 13. Evolución y control de cambios

Toda modificación futura deberá declarar:

1. proceso y clasificación afectados;
2. sujeto personal y relación que demuestra el alcance propio;
3. acciones agregadas o retiradas;
4. datos visibles y finalidad;
5. permiso, estado y transición;
6. sensibilidad, retención y evidencia;
7. impacto en firma, PIN o confirmación;
8. impacto en dispositivo compartido y offline;
9. compatibilidad, migración y rollback;
10. pruebas y fecha de vigencia.

CI deberá impedir procesos omitidos, modos desconocidos, superficies personales sin relación de recurso, acceso horizontal, autoaprobaciones, firmas desvinculadas del objeto y cambios no versionados.

---

#### 14. Requisitos de prueba derivados

Esta tarea genera ocho requisitos:

```text
TREQ-PROC-143
TREQ-PROC-144
TREQ-PROC-145
TREQ-PROC-146
TREQ-PROC-147
TREQ-PROC-148
TREQ-PROC-149
TREQ-PROC-150
```

El detalle completo queda incorporado en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`, que deberá reemplazarse integralmente.

---

#### 15. Criterios de aceptación

- [ ] Los 69 procesos aparecen exactamente una vez.
- [ ] Cada proceso utiliza `PERSONAL_PRINCIPAL`, `PERSONAL_PARCIAL` o `NO_PERSONAL`.
- [ ] Toda superficie personal declara sujeto, relación, acciones y límites.
- [ ] Ninguna acción personal concede acceso a casos ajenos.
- [ ] Solicitar, firmar, aceptar o confirmar no equivale a autoaprobar.
- [ ] Los procesos operativos no se convierten en personales por capturar firma del trabajador.
- [ ] `VPROC-0028` y `VPROC-0049` pueden exigir confirmación personal sin cambiar su clasificación.
- [ ] La firma dibujada queda tratada como evidencia vinculada, no como identidad suficiente.
- [ ] Toda decisión posterior sobre firma tiene tarea responsable exacta.
- [ ] Datos sensibles, dispositivos compartidos y offline tienen reglas explícitas.
- [ ] No se adelantaron `PROC-ACTOR-005` a `PROC-ACTOR-009`.
- [ ] No se modificó implementación, Supabase, migraciones ni código.
- [ ] Los ocho requisitos de prueba fueron incorporados al registro completo.

---

#### 16. Estado y continuidad

```text
PROC-ACTOR-003 APROBADA
PROC-ACTOR-004 APROBADA
PROC-ACTOR-005 NO INICIADA
```

No se inicia `PROC-ACTOR-005` hasta la aprobación expresa de esta tarea.


### ✅ PROC-ACTOR-005 — Definir procesos administrativos

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-004 — Definir procesos personales` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-006 — Definir procesos operativos`  
**Artefacto producido:** `PROC-ADMINISTRATIVE-PROCESS-CLASSIFICATION-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Procesos administrativos principales:** **49**  
**Procesos administrativos parciales:** **15**  
**Procesos sin mutación administrativa directa:** **5**  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Determinar en cuáles procesos existe una superficie administrativa legítima para planear, configurar, registrar, revisar, aprobar, conciliar, corregir, custodiar o cerrar decisiones empresariales, y separar esa función de la ejecución personal, operativa, del cliente o automática.

```text
PROCESO ADMINISTRATIVO
→ administra una decisión, caso, maestro, compromiso, excepción, conciliación o evidencia

NO SIGNIFICA
→ que todo gerente pueda modificarlo
→ que VISO sea propietario de todos los datos
→ que una pantalla administrativa conceda permiso
→ que supervisar equivalga a ejecutar o aprobar
```

La clasificación establece naturaleza funcional. No crea permisos, roles, pantallas, rutas, tablas ni bypasses.

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-004`;
- `PROC-PROCESS-TRANSITION-REGISTRY-001`;
- `PROC-PROCESS-INPUT-CONTRACT-001`;
- `PROC-PROCESS-OUTPUT-CONTRACT-001`;
- `PROC-PROCESS-AUDIT-PROFILE-001`;
- las matrices aprobadas de roles base, roles operativos y responsabilidades por proceso.

No se modifica ninguna decisión aprobada ni se anticipan las clasificaciones reservadas para `PROC-ACTOR-006` a `PROC-ACTOR-009`.

---

#### 3. Definición normativa

Una acción es administrativa cuando transforma de forma autorizada alguno de estos objetos:

- una decisión, aprobación o excepción;
- un caso, expediente, solicitud o compromiso;
- un maestro, política, versión o configuración empresarial;
- una planificación, asignación, presupuesto o programación;
- una conciliación, corrección o cierre;
- una obligación, documento o evidencia bajo custodia;
- una relación con proveedor, cliente, autoridad o tercero;
- una medición, riesgo, incidente o plan de mejora.

No es administrativa por el solo hecho de:

- aparecer en VISO o en una vista de escritorio;
- ser ejecutada por propietario, gerente o supervisor;
- incluir un formulario, tabla, reporte o botón de aprobación;
- permitir consulta transversal;
- usar una cuenta personal o un dispositivo de oficina;
- tener impacto financiero o laboral.

---

#### 4. Modos de clasificación

| Modo                       | Cantidad | Regla                                                                                                                                                                  |
| -------------------------- | -------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ADMINISTRATIVO_PRINCIPAL` |   **49** | La administración de decisiones, casos, maestros, planes, obligaciones o evidencia constituye el núcleo del proceso.                                                   |
| `ADMINISTRATIVO_PARCIAL`   |   **15** | El proceso incluye ejecución física, personal u operativa, pero conserva etapas administrativas acotadas de planificación, revisión, excepción, conciliación o cierre. |
| `NO_ADMINISTRATIVO`        |    **5** | La ejecución ordinaria no admite mutaciones administrativas directas; los roles administrativos solo consultan proyecciones o activan procesos vinculados.             |

Las clasificaciones no son mutuamente excluyentes con las tareas posteriores. Un proceso podrá resultar administrativo y operativo, administrativo y personal, o administrativo y de sistema sin mezclar funciones dentro de una misma acción.

---

#### 5. Contrato de una superficie administrativa

Toda acción administrativa deberá declarar:

1. proceso, instancia, recurso y versión;
2. acción concreta y resultado esperado;
3. rol base aplicable, actor efectivo y permiso atómico;
4. empresa, sede, área, territorio y finalidad;
5. estado de origen, transición o decisión autorizada;
6. segregación entre solicitante, preparador, ejecutor, supervisor, aprobador y conciliador;
7. datos visibles y nivel de sensibilidad;
8. motivo, evidencia, vigencia y obligaciones residuales;
9. idempotencia, control de concurrencia y auditoría;
10. impacto en aplicaciones propietarias y consumidoras.

```text
ROL BASE APLICABLE
+
PERMISO ATÓMICO
+
ALCANCE
+
CONTEXTO
+
SEGREGACIÓN
+
ESTADO Y GUARDS
=
ACCIÓN ADMINISTRATIVA AUTORIZABLE
```

El nombre del rol, la jerarquía o la ubicación de la pantalla nunca sustituyen esta resolución.

---

#### 6. Fronteras obligatorias

##### 6.1. Administración no equivale a propiedad universal

La aplicación propietaria del proceso mantiene la verdad canónica. VISO podrá ofrecer vistas o flujos administrativos, pero no creará copias mutables de inventario, producción, compras, pagos, clientes o contabilidad.

##### 6.2. Supervisar no equivale a modificar

Una vista de supervisión puede mostrar estado, riesgo, SLA, diferencia o evidencia. La capacidad de modificar, aprobar, corregir o cerrar deberá contratarse por separado.

##### 6.3. Administrar no equivale a ejecutar físicamente

Un actor administrativo no podrá declarar que produjo, contó, cargó, condujo, entregó, recibió, limpió, reparó o firmó en nombre de otro trabajador. Los hechos físicos conservan actor efectivo y evidencia propios.

##### 6.4. Administrar no elimina segregación

La escasez de personal no crea un bypass. Toda concentración temporal de funciones sensibles exige excepción explícita, vigencia, justificación, alcance y control compensatorio.

##### 6.5. Administración masiva

Importaciones, ediciones masivas, aprobaciones por lote, exportaciones y acciones multiempresa deberán:

- mostrar la población exacta antes de ejecutar;
- aplicar permisos y alcance por cada recurso;
- permitir previsualización y rechazo parcial seguro;
- usar identificador idempotente;
- conservar resultado por fila;
- impedir cambios silenciosos fuera del territorio;
- generar auditoría y evidencia de la operación completa.

---

#### 7. Matriz canónica completa

| Proceso      | Propósito empresarial                                                                                                                                                                      | Clasificación              | Roles base administrativos potencialmente aplicables                                                          | Acciones administrativas admitidas                                                                                                                             | Límite obligatorio                                                                                                                                                                                                                                                                                                                                           | Evidencia o control mínimo                                                                               |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | registrar decisiones, responsables, compromisos, vencimientos, seguimiento y cierre de acuerdos                                                                | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`                                        | mantener empresas, marcas, establecimientos, sedes, áreas, relaciones jurídicas y vigencias                                                                    | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | redactar, revisar, aprobar, publicar y retirar políticas, delegaciones y límites de decisión                                                                   | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | formalizar compromisos interárea, asignar responsables, controlar handoffs y escalar incumplimientos                                                           | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | planear dotación, administrar vacantes, etapas, evaluaciones y decisión de selección                                                                           | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. No permite alterar respuestas del candidato, omitir evaluaciones obligatorias ni convertirlo en trabajador sin decisión separada.  | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | administrar expediente, checklist de ingreso, asignaciones, habilitaciones y evidencia de incorporación                                                        | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. No permite autootorgar rol, sede, permisos, aptitud o habilitación; las asignaciones sensibles conservan aprobador independiente.  | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | planear, publicar y versionar programación; gestionar solicitudes y cambios autorizados                                                                        | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | revisar inconsistencias, decidir correcciones y conciliar marcaciones sin alterar el hecho original                                                            | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia. No permite crear una marcación administrativa ficticia ni sobrescribir fecha, ubicación, dispositivo o actor originales.                           | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | tramitar novedades, soportes, reemplazos, efectos y decisiones de permisos o ausencias                                                                         | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                            | preparar, validar y reconciliar novedades, conceptos, beneficios y paquete autorizado de pago                                                                  | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. No permite calcular o pagar desde datos no conciliados ni exponer información financiera laboral fuera de finalidad.               | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | coordinar checklist de retiro, devolución, revocación, documentos, certificados y obligaciones residuales                                                      | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | administrar matriz de riesgos, inspecciones, controles, responsables, vencimientos y aceptación residual                                                       | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | administrar expediente posterior, investigación, comunicaciones, acciones correctivas y reportes requeridos                                                    | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia. La respuesta de emergencia y los hechos clínicos permanecen separados del expediente administrativo posterior.                                     | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | versionar procedimientos, programar controles, revisar no conformidades y gestionar planes correctivos                                                         | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | mantener maestro de productos, presentaciones, unidades, equivalencias, vigencias y cambios controlados                                                        | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                     | gestionar propuesta, prueba, revisión, aprobación, publicación, sustitución y retiro de recetas                                                                | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`             | configurar oferta publicable, reglas de disponibilidad, vigencia, canal y retiro coordinado                                                                    | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | mantener especificaciones, alérgenos, restricciones, tolerancias y criterios de calidad versionados                                                            | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`              | consolidar necesidades, validar justificación, prioridad, fecha requerida y ruta de atención                                                                   | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                            | administrar invitaciones, ofertas, comparativos, evidencias, conflictos y recomendación de proveedor                                                           | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                            | revisar presupuesto y autoridad, aprobar, emitir, modificar o cancelar compromisos de compra                                                                   | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. Preparar, solicitar, aprobar, recibir, contabilizar y pagar no podrán concentrarse sin excepción aprobada y control compensatorio. | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`              | validar documentos, conformidad, diferencias, cuarentena, reclamación y conciliación de la recepción                                                           | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia. La conformidad administrativa no sustituye la recepción física ni la firma del receptor identificado.                                              | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | mantener catálogo y estado de sedes, LOC, zonas, posiciones, capacidades y restricciones                                                                       | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                     | revisar excepciones, conflictos, correcciones y conciliación de movimientos ya respaldados por ejecución física                                                | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia. Una corrección crea un movimiento compensatorio; nunca edita o elimina el movimiento físico original.                                              | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                     | autorizar excepciones, revisar disponibilidad, conciliar retiros y transferencias y resolver diferencias                                                       | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                         | planear conteos, separar observación de ajuste, investigar diferencias y aprobar correcciones                                                                  | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. Quien observa o cuenta no aprueba automáticamente el ajuste resultante.                                                            | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                         | gestionar alertas, cuarentena, vencimientos, disposición, responsables, autorizaciones y cierre documental                                                     | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | coordinar solicitud, prioridad, alistamiento, despacho, recepción, diferencias y conciliación entre sedes                                                      | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia. Despachador, conductor y receptor permanecen diferenciados; la administración no puede autoaceptar la entrega.                                     | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`              | mantener identidad del activo, asignación, custodia, transferencias, inventarios y ciclo de vida                                                               | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`              | administrar solicitudes, prioridad, diagnóstico, orden de trabajo, garantía, repuesto, costo y cierre                                                          | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`              | administrar disponibilidad, documentación, combustible, kilometraje, mantenimientos e incidencias de vehículos                                                 | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | controlar catálogo, asignación, préstamo, retorno, faltantes, reposición y baja de reutilizables                                                               | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | consolidar demanda, inventario, capacidad y prioridades; publicar y versionar el plan de producción                                                            | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `NO_ADMINISTRATIVO`        | —                                                                                                             | no existe mutación administrativa dentro de la ejecución ordinaria; solo consulta de estado mediante proyecciones autorizadas                                  | Los roles administrativos pueden consultar proyecciones autorizadas o abrir un proceso vinculado, pero no ejecutar ni corregir directamente este proceso por usar una pantalla gerencial.                                                                                                                                                                    | Solo lectura o proyección; cualquier mutación debe ejecutarse en el proceso propietario correspondiente. |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`                                                     | revisar resultados, evidencia y desviaciones; decidir liberación, retención, rechazo o corrección                                                              | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia. Quien produjo el lote no puede liberarlo mediante una función administrativa equivalente.                                                          | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `NO_ADMINISTRATIVO`        | —                                                                                                             | no existe mutación administrativa dentro del empaque ordinario; la configuración proviene de maestros y órdenes aprobadas                                      | Los roles administrativos pueden consultar proyecciones autorizadas o abrir un proceso vinculado, pero no ejecutar ni corregir directamente este proceso por usar una pantalla gerencial.                                                                                                                                                                    | Solo lectura o proyección; cualquier mutación debe ejecutarse en el proceso propietario correspondiente. |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                         | analizar rendimiento y merma, decidir reproceso o aprovechamiento, conciliar consumos y cerrar el ciclo                                                        | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `NO_ADMINISTRATIVO`        | —                                                                                                             | no existe mutación administrativa dentro del servicio ordinario; control y análisis ocurren mediante procesos correlacionados                                  | Los roles administrativos pueden consultar proyecciones autorizadas o abrir un proceso vinculado, pero no ejecutar ni corregir directamente este proceso por usar una pantalla gerencial.                                                                                                                                                                    | Solo lectura o proyección; cualquier mutación debe ejecutarse en el proceso propietario correspondiente. |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `NO_ADMINISTRATIVO`        | —                                                                                                             | no existe mutación administrativa dentro de la venta ordinaria; precios, oferta y cierres se gobiernan en procesos separados                                   | Los roles administrativos pueden consultar proyecciones autorizadas o abrir un proceso vinculado, pero no ejecutar ni corregir directamente este proceso por usar una pantalla gerencial.                                                                                                                                                                    | Solo lectura o proyección; cualquier mutación debe ejecutarse en el proceso propietario correspondiente. |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`             | administrar reglas de entrada, mapeos, excepciones, reintentos, diferencias y conciliación de canales externos                                                 | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | gestionar oportunidad, cotización, capacidad, condiciones, aprobación, contrato, facturación y seguimiento B2B                                                 | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`              | tramitar modificaciones, sustituciones, cancelaciones, devoluciones, autorizaciones y efectos residuales                                                       | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                         | revisar pagos inciertos, duplicados, reversos, conciliación y excepciones sin fabricar confirmaciones                                                          | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia. Un acuse técnico o captura manual no se convierte en pago confirmado sin la fuente y conciliación requeridas.                                      | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `contador`                                         | preparar y revisar cierre, responsables, ventas, medios de pago, efectivo, diferencias y conciliación                                                          | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. Quien operó la caja no puede aprobar unilateralmente su propia diferencia o cierre excepcional.                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`             | administrar identidad de cliente, consentimientos, reglas, movimientos, ajustes y campañas de fidelización                                                     | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`             | registrar y clasificar reclamos, asignar responsables, decidir devolución o compensación y verificar causa                                                     | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`             | administrar disponibilidad, reserva, condiciones, capacidad, comunicaciones, cambios y cancelaciones                                                           | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | planear ruta, vehículo, conductor, carga, secuencia, ventanas, restricciones y plan de contingencia                                                            | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `NO_ADMINISTRATIVO`        | —                                                                                                             | no existe mutación administrativa dentro de la ejecución ordinaria de ruta; la administración actúa mediante planificación, excepción o conciliación vinculada | Los roles administrativos pueden consultar proyecciones autorizadas o abrir un proceso vinculado, pero no ejecutar ni corregir directamente este proceso por usar una pantalla gerencial. El despacho, conducción, entrega y aceptación requieren actores operativos; la administración no firma en su nombre.                                               | Solo lectura o proyección; cualquier mutación debe ejecutarse en el proceso propietario correspondiente. |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | administrar integración, proveedor, estados, excepciones, prueba, diferencias, liquidación y conciliación de terceros                                          | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `auxiliar_administrativa`, `contador`                                       | validar fuente y soporte, clasificar hecho, registrar asiento o efecto, conciliar y corregir de forma trazable                                                 | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. NUMERA registra el efecto económico, pero no reescribe el hecho operativo fuente.                                                  | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                            | administrar obligación, vencimiento, aprobación, programación, pago, retención y conciliación bancaria                                                         | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. Registro, aprobación, pago y conciliación deberán separarse conforme al riesgo y umbral.                                           | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `contador`                            | administrar cartera, acuerdos, gestiones, recaudos, aplicación, diferencias, provisiones y cierre                                                              | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `contador`                                                       | gobernar reglas de costo, distribución, periodos, cierres, reexpresiones y análisis de rentabilidad                                                            | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | planear servicios e inspecciones, emitir órdenes, controlar proveedores, evidencia, costos y cierre de novedades                                               | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `auxiliar_administrativa`, `marketing`                           | gestionar solicitud, contenido, revisión, aprobación, calendario, publicación, monitoreo y retiro                                                              | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`             | registrar consulta u oportunidad, calificar, asignar, hacer seguimiento, convertir o cerrar con evidencia                                                      | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | registrar y priorizar solicitudes, asignar diagnóstico, controlar SLA, resolución, comunicación y conocimiento                                                 | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | administrar solicitud, aprobación, provisión, revisión, suspensión, revocación y certificación de acceso                                                       | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. Administrar técnicamente un acceso no equivale a aprobar su concesión o ampliación.                                                | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | clasificar, versionar, aprobar, distribuir, retener, custodiar y disponer documentos y evidencias                                                              | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. La disposición documental no permite borrar evidencia sujeta a retención, litigio, auditoría o investigación.                      | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | definir medición, validar datos, analizar, decidir mejora, asignar acción y verificar resultado                                                                | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | declarar incidente de continuidad, activar plan, coordinar operación mínima, recuperación, reconciliación y aprendizaje                                        | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | mantener registro de riesgos empresariales, evaluación, tratamiento, propietarios, aceptación y seguimiento                                                    | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | administrar requerimientos, conceptos, comunicaciones, entregables, vencimientos, asesores y evidencia oficial                                                 | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | administrar ciclos, objetivos, evidencia, retroalimentación, decisiones, planes y acceso restringido de desempeño                                              | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. Acceso administrativo a desempeño exige finalidad explícita y no habilita consulta masiva o uso no declarado.                      | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | definir requerimientos, registrar entrega y aceptación, controlar vigencia, cambios, faltantes y devolución                                                    | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `ADMINISTRATIVO_PARCIAL`   | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`                          | definir kits, componentes y reglas; administrar instancias, préstamos, sustituciones, diferencias y cierres                                                    | La función administrativa solo actúa sobre planificación, revisión, excepción, conciliación o cierre; no sustituye al actor que ejecutó el hecho físico u operativo ni puede reconstruirlo sin evidencia.                                                                                                                                                    | Referencia obligatoria al hecho operativo, actor efectivo, evidencia, antes/después y conciliación.      |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `marketing`             | diseñar medición, muestra y canal; administrar consentimiento, calidad, sesgo, análisis y acciones derivadas                                                   | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia.                                                                                                                                    | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `ADMINISTRATIVO_PRINCIPAL` | `propietario`, `gerente_general`, `gerente`, `supervisor`, `auxiliar_administrativa`, `contador`, `marketing` | preparar versiones, supuestos, escenarios, aprobación, vigencia, consumo, proyección y desviaciones presupuestales                                             | La función administrativa gobierna el caso o registro, pero no obtiene autoridad por nombre de rol; toda aprobación, escritura sensible o alcance transversal exige permiso atómico, territorio, segregación y evidencia. El presupuesto no se convierte en gasto, asiento o disponibilidad real sin los procesos propietarios correspondientes.             | Decisión, versión, responsable, motivo, alcance, evidencia y resultado auditables.                       |

---

#### 8. Reglas por familia administrativa

##### 8.1. Dirección y gobierno

`propietario` y `gerente_general` podrán resultar aplicables en numerosos procesos, pero no reciben un bypass global. Decisiones estratégicas, aceptación de riesgo, presupuesto, política, estructura y delegación conservarán objeto, versión, autoridad y evidencia explícitos.

##### 8.2. Gerencia territorial y supervisión

`gerente` y `supervisor` deberán quedar limitados a empresa, sede, área, recurso, turno o proceso asignados. La visibilidad ampliada no concede escritura ampliada.

##### 8.3. Soporte administrativo

`auxiliar_administrativa` podrá preparar, registrar, solicitar información, coordinar y hacer seguimiento. No se inferirán aprobación final, pago, conciliación, decisión laboral sensible, administración de seguridad ni disposición documental.

##### 8.4. Contabilidad y finanzas

`contador` administrará efectos económicos y conciliaciones dentro de su finalidad. No podrá reescribir el hecho físico u operativo que originó el registro ni concentrar preparación, aprobación, pago y conciliación sin el control aprobado.

##### 8.5. Marketing y gestión comercial

`marketing` administrará contenido, campañas, oferta, oportunidades y medición autorizadas. No recibe acceso general a expedientes laborales, salud, pagos, seguridad, proveedores o clientes identificables fuera de finalidad.

---

#### 9. Datos sensibles, exportación y evidencia

1. Las vistas administrativas aplicarán minimización y divulgación progresiva.
2. Salud, desempeño, nómina, datos bancarios, identidad, acceso tecnológico y expedientes tendrán permisos y finalidades diferenciados.
3. Descargar, imprimir, exportar, compartir o consultar masivamente datos sensibles será una acción auditable separada.
4. Los documentos exportados deberán conservar clasificación, fecha, versión, emisor, finalidad y advertencias aplicables.
5. Una captura de pantalla, archivo descargado o reporte externo no se convierte en nueva fuente canónica.
6. Toda corrección conservará antes, después, motivo, autoridad y relación con el registro original.

---

#### 10. Dispositivos compartidos, offline y concurrencia

- Una tablet compartida no tendrá rol administrativo propio.
- Toda acción administrativa desde un dispositivo compartido deberá resolver trabajador real y contexto vigente; las acciones altamente sensibles podrán prohibirse por completo en ese canal.
- Un borrador offline no concede aprobación ni reserva indefinidamente el recurso.
- Al sincronizar se revalidarán identidad, permiso, alcance, estado, versión y segregación.
- Acciones repetidas usarán idempotencia; conflictos de versión producirán conflicto explícito, no sobrescritura.
- Una aprobación o corrección pendiente no se mostrará como efectiva hasta persistirse junto con su auditoría y efectos.

---

#### 11. Resultado cuantitativo

| Métrica                                                                      | Resultado |
| ---------------------------------------------------------------------------- | --------: |
| procesos cubiertos                                                           |    **69** |
| `ADMINISTRATIVO_PRINCIPAL`                                                   |    **49** |
| `ADMINISTRATIVO_PARCIAL`                                                     |    **15** |
| `NO_ADMINISTRATIVO`                                                          |     **5** |
| procesos omitidos                                                            |     **0** |
| procesos duplicados                                                          |     **0** |
| procesos operativos convertidos en administrativos por visibilidad gerencial |     **0** |
| roles o nombres de pantalla usados como autorización                         |     **0** |

---

#### 12. Exclusiones expresas

Esta tarea no:

- diseña pantallas administrativas;
- concede permisos a ningún rol;
- define todavía qué procesos son operativos, híbridos, de cliente o automáticos;
- crea matrices RACI adicionales;
- fija umbrales económicos o de aprobación;
- permite escritura directa desde dashboards;
- centraliza la propiedad de todos los procesos en VISO;
- crea tablas, RPC, RLS, buckets, migraciones o código;
- modifica Supabase ni aplicaciones.

Los umbrales, pantallas, permisos concretos y paquetes de implementación se resolverán en sus tareas canónicas posteriores.

---

#### 13. Evolución y control de cambios

Toda modificación futura deberá declarar:

1. proceso y clasificación afectados;
2. acción administrativa agregada, modificada o retirada;
3. rol base potencial y permiso atómico;
4. alcance territorial y de recurso;
5. estado, transición, aprobación y segregación;
6. aplicación propietaria y consumidoras;
7. datos sensibles y finalidad;
8. evidencia, auditoría, offline y concurrencia;
9. compatibilidad, migración y rollback;
10. pruebas y fecha de vigencia.

CI deberá bloquear procesos omitidos, clasificaciones desconocidas, acciones administrativas sin permiso, escritura desde proyecciones, roles hardcodeados, bypass por jerarquía y cambios sin versión.

---

#### 14. Requisitos de prueba derivados

Esta tarea genera ocho requisitos:

```text
TREQ-PROC-151
TREQ-PROC-152
TREQ-PROC-153
TREQ-PROC-154
TREQ-PROC-155
TREQ-PROC-156
TREQ-PROC-157
TREQ-PROC-158
```

El detalle completo queda incorporado en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`, que deberá reemplazarse integralmente.

---

#### 15. Criterios de aceptación

- [ ] Los 69 procesos aparecen exactamente una vez.
- [ ] Cada proceso utiliza `ADMINISTRATIVO_PRINCIPAL`, `ADMINISTRATIVO_PARCIAL` o `NO_ADMINISTRATIVO`.
- [ ] La clasificación no concede permisos ni autoridad por nombre de rol.
- [ ] Las aplicaciones propietarias conservan la verdad canónica.
- [ ] Supervisión, ejecución, aprobación y conciliación permanecen diferenciadas.
- [ ] Ningún actor administrativo puede fabricar o firmar un hecho físico ajeno.
- [ ] Los cinco procesos `NO_ADMINISTRATIVO` solo admiten consulta o activación de procesos vinculados.
- [ ] Acciones masivas, exportaciones y datos sensibles tienen controles explícitos.
- [ ] Dispositivos compartidos, offline, idempotencia y concurrencia están tratados.
- [ ] No se adelantaron `PROC-ACTOR-006` a `PROC-ACTOR-009`.
- [ ] No se modificó código, Supabase ni migraciones.
- [ ] Los ocho requisitos de prueba fueron incorporados al registro completo.

---

#### 16. Estado y continuidad

```text
PROC-ACTOR-004 APROBADA
PROC-ACTOR-005 APROBADA
PROC-ACTOR-006 NO INICIADA
```

No se inicia `PROC-ACTOR-006` hasta la aprobación expresa de esta tarea.


### ✅ PROC-ACTOR-006 — Definir procesos operativos

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-005 — Definir procesos administrativos` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-007 — Definir procesos híbridos`  
**Artefacto producido:** `PROC-OPERATIONAL-PROCESS-CLASSIFICATION-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Procesos operativos principales:** **25**  
**Procesos operativos parciales:** **26**  
**Procesos sin ejecución por rol operativo:** **18**  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Determinar en cuáles procesos la ejecución física, la atención en punto, la custodia, el uso de equipos, el movimiento de bienes, la producción, el transporte o la confirmación en campo constituyen el núcleo o una etapa legítima del proceso.

La tarea separa la operación real de la administración, la aprobación y la automatización.

```text
PROCESO OPERATIVO
→ produce un hecho real en una sede, área, turno, estación, vehículo o interacción de servicio

NO SIGNIFICA
→ que todo trabajador pueda ejecutarlo
→ que el rol operativo conceda permiso por sí solo
→ que gerencia pueda registrar el hecho en nombre del ejecutor
→ que cambiar un estado equivalga a ejecutar físicamente
```

La clasificación define naturaleza funcional. No crea permisos, pantallas, formularios, migraciones, tablas, firmas obligatorias universales ni bypasses.

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-005`;
- `PROC-PROCESS-TRANSITION-REGISTRY-001`;
- `PROC-PROCESS-INPUT-CONTRACT-001`;
- `PROC-PROCESS-OUTPUT-CONTRACT-001`;
- `PROC-PROCESS-AUDIT-PROFILE-001`;
- las matrices aprobadas de roles base, roles operativos, responsabilidades, procesos personales y procesos administrativos.

No se modifica ninguna decisión aprobada ni se anticipan la clasificación híbrida, el dominio cliente o los procesos automáticos reservados para `PROC-ACTOR-007` a `PROC-ACTOR-009`.

---

#### 3. Definición normativa

Una etapa es operativa cuando un actor efectivo debe realizar o confirmar directamente una acción sobre alguno de estos elementos:

- personas, clientes o mesas atendidas;
- productos, lotes, pedidos o pagos en el punto;
- inventario, LOC, activos, reutilizables o kits;
- producción, calidad, empaque o almacenamiento;
- vehículos, carga, ruta, entrega o custodia;
- instalaciones, limpieza, mantenimiento, seguridad o continuidad;
- mediciones, inspecciones, conteos o evidencias de campo;
- handoffs cuya aceptación cambia custodia o responsabilidad.

No es operativa por el solo hecho de:

- ocurrir en una sede;
- ser consultada desde una tablet;
- estar asignada a un trabajador;
- usar un rol denominado `gerencia_operativa`;
- tener consecuencias en inventario, producción o ventas;
- incluir una firma, PIN, fotografía o checklist;
- ejecutarse desde NEXO, FOGO, PULSO u otra aplicación operacional.

---

#### 4. Modos de clasificación

| Modo                  | Cantidad | Regla                                                                                                                                                                 |
| --------------------- | -------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `OPERATIVO_PRINCIPAL` |   **25** | La ejecución física, el servicio, la custodia, el movimiento o la confirmación en campo producen el resultado principal del proceso.                                  |
| `OPERATIVO_PARCIAL`   |   **26** | El proceso conserva una etapa operativa delimitada, pero su núcleo incluye planificación, administración, aprobación, publicación, conciliación o decisión separada.  |
| `NO_OPERATIVO`        |   **18** | Ningún turno o rol operativo habilita ejecución directa; el proceso pertenece a identidad personal, rol base, autoridad administrativa o servicio técnico autorizado. |

Las clasificaciones de `PROC-ACTOR-004`, `PROC-ACTOR-005` y esta tarea son ejes independientes. Un proceso puede ser personal, administrativo y operativo en etapas distintas sin permitir que un mismo actor concentre todas las funciones.

---

#### 5. Catálogo operativo permitido

La matriz usa exclusivamente los doce códigos aprobados:

- `cajero_satelite`;
- `barista_satelite`;
- `cocinero_satelite`;
- `servicio_salon`;
- `mostrador_satelite`;
- `operador_integral_satelite`;
- `produccion_cocina`;
- `produccion_panaderia`;
- `produccion_reposteria`;
- `bodeguero`;
- `conductor_logistica`;
- `gerencia_operativa`.

Quedan prohibidos como sustitutos:

- roles base;
- nombres de cargos, áreas o estaciones;
- `navigation_role`;
- `default_operational_role`;
- el último rol utilizado;
- una opción elegida por el frontend;
- el usuario técnico de una tablet;
- nombres legacy como `cajero`, `cocina`, `bodega` o equivalentes no normalizados.

---

#### 6. Contrato mínimo de una acción operativa

Toda acción operativa deberá resolver y conservar:

1. proceso, instancia, acción y transición;
2. principal autenticado y actor efectivo;
3. rol operativo efectivo y permiso atómico;
4. turno, check-in, sede, área, estación, dispositivo o vehículo cuando apliquen;
5. recurso, cantidad, unidad, versión y condición previa;
6. resultado observado y estado resultante;
7. evidencia obligatoria según riesgo;
8. origen, destino y custodia en cada handoff;
9. idempotencia, versión esperada y reglas offline;
10. fecha del hecho, fecha de recepción y correlación con salidas, eventos y auditoría.

```text
ACTOR EFECTIVO
+
ROL OPERATIVO VIGENTE
+
PERMISO ATÓMICO
+
TURNO Y CHECK-IN CUANDO APLIQUEN
+
SEDE, ÁREA Y RECURSO COMPATIBLES
+
ESTADO Y GUARDS
+
EVIDENCIA REQUERIDA
=
ACCIÓN OPERATIVA AUTORIZABLE
```

Ningún componente puede inferirse únicamente del nombre del usuario, la pantalla o la ubicación física del dispositivo.

---

#### 7. Fronteras obligatorias

##### 7.1. Ejecutar no equivale a aprobar

El trabajador puede producir un hecho o aportar una observación. La aprobación, liberación, ajuste, autorización financiera, aceptación de riesgo o corrección sensible conserva autoridad separada.

##### 7.2. Cambiar un estado no prueba ejecución

Un botón, RPC, actualización de fila, `200 OK`, webhook o mensaje encolado no demuestra que el producto fue preparado, la carga salió, la limpieza ocurrió o el cliente recibió.

##### 7.3. El actor administrativo no suplanta al operativo

Un supervisor o gerente podrá revisar, escalar o autorizar una excepción, pero no registrar retrospectivamente como propios producción, conteo, recepción, entrega, conducción, firma o servicio ejecutados por otra persona.

##### 7.4. La gerencia operativa no es un comodín

`gerencia_operativa` solo participa en coordinación de turno, control de campo o contingencia expresamente contratados. No habilita procesos clasificados `NO_OPERATIVO` ni concede administración global.

##### 7.5. La aplicación no determina la naturaleza

Una pantalla en VISO puede presentar un proceso operativo y una pantalla en NEXO puede presentar una decisión administrativa. La clasificación depende de la acción, el actor, el objeto y el efecto; no del nombre de la aplicación.

---

#### 8. Matriz canónica completa

| Proceso      | Propósito empresarial                                                                                                                                                                      | Clasificación         | Roles operativos aplicables                                                                                                                                                                                                                                      | Acciones operativas admitidas                                                                                                                                  | Límite obligatorio                                                                                                                                                                                                                                               | Evidencia o control mínimo                                                                                                               |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | aceptar, ejecutar y confirmar compromisos o transferencias de trabajo asignadas entre áreas, conservando origen, destino y recepción                           | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | actor de origen y destino, transición, momento, aceptación y pendientes correlacionados                                                  |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | registrar entrada, salida, pausa, presencia o incidencia desde el contexto de turno; la corrección posterior queda fuera de la ejecución ordinaria             | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | actor, turno, sede, área, dispositivo, tipo de marca temporal y origen confiable                                                         |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | presentar una novedad propia, reportar imposibilidad de asistencia, aceptar un reemplazo asignado o aportar evidencia del caso                                 | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | solicitante, relación personal, fechas, motivo mínimo, evidencia y aceptación o rechazo posterior                                        |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | realizar inspecciones de campo, reportar peligros, aplicar controles asignados y verificar acciones correctivas dentro del área                                | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | inspección, ubicación, riesgo observado, control aplicado, fotografía o evidencia y responsable                                          |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | activar respuesta inmediata, proteger personas y operación, reportar el hecho, conservar evidencia inicial y ejecutar instrucciones de emergencia              | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | alerta, ubicación, personas implicadas, tiempo de respuesta, acciones inmediatas y cadena de escalamiento                                |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | ejecutar limpieza, desinfección, control de temperaturas, listas de inocuidad y demás verificaciones prescritas                                                | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | procedimiento y versión, responsable, hora, medición, resultado, desviación y corrección                                                 |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                          | consultar la definición vigente, reportar inconsistencias de presentación o unidad y validar físicamente datos que requieran observación de campo              | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | producto o presentación, versión consultada, observación física, diferencia y evidencia                                                  |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `OPERATIVO_PARCIAL`   | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `gerencia_operativa`                                                                                                | ejecutar pruebas de receta, registrar rendimientos, tiempos, sustituciones autorizadas y evidencia de resultados sin publicar la versión                       | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | receta y versión, lote de prueba, actor, insumos, tiempos, rendimiento, observaciones y evidencia                                        |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | reportar disponibilidad real, agotados, restricciones de preparación y diferencias entre oferta publicada y capacidad del turno                                | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | producto, sede, canal, disponibilidad observada, restricción, vigencia y actor                                                           |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                        | consultar y verificar especificaciones, alérgenos, restricciones y criterios de aceptación durante preparación, venta, almacenamiento o servicio               | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | producto o lote, criterio vigente, verificación, hallazgo, actor y acción segura                                                         |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | registrar necesidades reales de compra o reposición desde consumo, agotado, daño, demanda o programación del área                                              | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | recurso solicitado, cantidad, unidad, sede, área, motivo, necesidad temporal y actor                                                     |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `OPERATIVO_PARCIAL`   | `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                                                                                          | aportar muestras, pruebas de uso, evaluación técnica y conformidad operacional del producto o proveedor sin decidir la compra                                  | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | proveedor o muestra, criterio, prueba, resultado, actor y evidencia sin decisión de compra                                               |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                          | recibir físicamente, contar, inspeccionar, ubicar en espera, registrar faltantes, daños, temperatura, lote y evidencia del proveedor                           | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | orden y recepción, proveedor, actor, lote, temperatura, cantidades, diferencias, fotos y ubicación de espera                             |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `OPERATIVO_PARCIAL`   | `bodeguero`; `gerencia_operativa`                                                                                                                                                                                                                                | validar físicamente LOC, zonas, posiciones, capacidad y condiciones; reportar bloqueo, daño o incompatibilidad sin alterar la estructura maestra por sí solo   | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | LOC o posición, sede, área, capacidad, condición, evidencia y propuesta de cambio separada                                               |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa`                   | recibir, ubicar y reubicar existencias mediante movimientos con origen, destino, cantidad, unidad y actor efectivos                                            | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | movimiento, origen, destino, producto, lote, cantidad, unidad, actor, dispositivo y versión de stock                                     |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | retirar, consumir o trasladar existencias desde una ubicación real, preservando conversión, lote, motivo y destino                                             | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | movimiento, ubicación, cantidad, unidad, conversión, motivo, destino o consumo y actor                                                   |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | capturar conteos independientes como observaciones, repetir conteos autorizados y aportar evidencia; el ajuste permanece separado                              | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | sesión de conteo, línea, observador, cantidad, unidad, momento, independencia y evidencia de diferencia                                  |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | identificar y aislar vencimiento, daño, merma, pérdida, ruptura de frío o cuarentena; ejecutar disposición únicamente cuando esté autorizada                   | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | producto o activo, lote, condición, ubicación, temperatura cuando aplique, evidencia, custodia y decisión vinculada                      |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | solicitar, preparar, verificar, cargar, transportar, entregar y recibir abastecimiento interno con cantidades y custodia por etapa                             | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | solicitud, preparación, carga, tránsito, recepción, cantidades por etapa, emisor, conductor, receptor y firmas o confirmaciones exigidas |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | entregar, recibir, prestar, transferir, localizar y devolver activos bajo custodia, reportando condición y diferencias                                         | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | activo, estado, ubicación, custodio anterior y nuevo, aceptación, evidencia y obligaciones de devolución                                 |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | reportar falla, inmovilizar cuando corresponda, ejecutar mantenimiento permitido, comprobar funcionamiento y documentar repuesto o intervención                | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | activo, falla, bloqueo, orden, técnico o ejecutor, repuesto, prueba posterior y estado resultante                                        |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `OPERATIVO_PRINCIPAL` | `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                                                                                                                                                                         | inspeccionar vehículo, registrar kilometraje, combustible, disponibilidad, carga básica, novedad e inmovilización                                              | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | vehículo, conductor, kilometraje, combustible, checklist, novedad, evidencia y disponibilidad                                            |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | entregar, recibir, contar, retornar y reportar pérdida o daño de contenedores y reutilizables por responsable y ubicación                                      | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | identificador, tipo, cantidad, custodios, origen, destino, condición, aceptación y diferencia                                            |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `OPERATIVO_PARCIAL`   | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | confirmar capacidad, disponibilidad de personal, equipos, materiales y restricciones reales del área para alimentar el plan                                    | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | plan o necesidad, capacidad declarada, actor, turno, equipo, restricción y vigencia                                                      |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `OPERATIVO_PRINCIPAL` | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | preparar materiales, iniciar lote, ejecutar pasos de receta, registrar consumos, tiempos, rendimiento y cierre físico de producción                            | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | orden, receta y versión, lote, actor, materiales, consumos, pasos críticos, tiempos, rendimiento y firma reforzada cuando corresponda    |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `OPERATIVO_PRINCIPAL` | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | muestrear, inspeccionar, medir, retener y registrar hallazgos de calidad; la liberación o rechazo exige la autoridad definida                                  | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | lote, muestra, criterio, medición, hallazgo, inspector, evidencia y decisión separada                                                    |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `OPERATIVO_PRINCIPAL` | `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                             | empacar, etiquetar, verificar contenido, lote, presentación y destino, y almacenar producto terminado en la ubicación autorizada                               | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | lote, presentación, etiqueta y versión, cantidad, actor, ubicación y verificación                                                        |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `OPERATIVO_PRINCIPAL` | `barista_satelite`; `cocinero_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                                                                                   | segregar producto, ejecutar reproceso o aprovechamiento autorizado, registrar merma, consumos, resultado y cierre físico                                       | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | lote origen y resultado, autorización, actor, consumos, merma, rendimiento, evidencia y cierre                                           |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | abrir servicio, tomar pedido, coordinar preparación, entregar, atender, cobrar mediante proceso correlacionado y cerrar la atención                            | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | mesa, pedido, actores por etapa, tiempos, entrega, incidencias, pago correlacionado y cierre                                             |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | registrar pedido, preparar o coordinar preparación, entregar al cliente y correlacionar el cobro de mostrador o para llevar                                    | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | pedido, canal, productos, actor, preparación, entrega, pago correlacionado y evidencia de retiro                                         |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                             | aceptar, rechazar o poner en revisión pedidos externos, resolver datos faltantes operativos y transferirlos al flujo interno sin reescribir el canal de origen | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | identificador externo e interno, payload o versión, actor, decisión de aceptación, diferencias y correlación                             |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | verificar capacidad, preparar, empacar, cargar, transportar, entregar y aceptar hitos operativos del catering o servicio B2B                                   | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | caso B2B, orden, hitos, actores, cantidades, carga, entrega, aceptación y evidencia contractual                                          |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                                       | capturar solicitud del cliente y ejecutar sustitución, cancelación, devolución o corrección ya autorizada dentro del alcance del turno                         | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | pedido o recurso, solicitud, motivo, actor, autorización cuando aplique, antes, después y efectos residuales                             |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | capturar medio de pago, solicitar autorización, recibir efectivo, confirmar mediante fuente válida y entregar soporte al cliente                               | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | venta, intento, medio, monto, proveedor o efectivo, actor, resultado, soporte e idempotencia                                             |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                                      | contar efectivo y documentos, declarar caja, entregar custodia, registrar diferencias y participar en conciliación con separación de revisión                  | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | caja, turno, operador, conteo, declaración, entrega de custodia, diferencias y revisión separada                                         |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | identificar al cliente con datos mínimos, solicitar consentimiento aplicable, asociar la venta y ejecutar acumulación o redención autorizada                   | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | cliente, consentimiento, venta o movimiento, sede, actor, regla de puntos y resultado                                                    |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | recibir reclamo, inmovilizar producto cuando aplique, documentar evidencia, ejecutar devolución o compensación autorizada y comunicar resultado                | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | caso, cliente, pedido o producto, actor receptor, evidencia, decisión y ejecución de solución                                            |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | consultar capacidad, registrar reserva o evento, confirmar condiciones, preparar atención y comunicar cambios al cliente                                       | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | reserva o evento, capacidad, fecha, condiciones, actor, comunicaciones y aceptación del cliente                                          |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `OPERATIVO_PARCIAL`   | `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                                                                                                                                                                         | validar vehículo, conductor, carga, ventanas, restricciones y viabilidad de la ruta antes de autorizar el despacho físico                                      | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | ruta, vehículo, conductor, carga, restricciones, checklist y autorización de salida separada                                             |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa`                                                            | verificar carga, iniciar tránsito, ejecutar paradas, registrar ubicación o novedad, entregar, obtener aceptación o rechazo y gestionar retorno                 | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | ruta, vehículo, conductor, carga, geoevidencia cuando aplique, paradas, receptor, aceptación o rechazo, firma y retorno                  |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | recibir estados y prueba de tercero, verificar entrega real, registrar novedad y escalar diferencias sin asumir que el acuse externo equivale a entrega        | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | entrega externa, proveedor, estado recibido, prueba, verificación interna, actor y discrepancia                                          |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `gerencia_operativa`                        | ejecutar limpieza, inspección, mantenimiento permitido, control de plagas o servicios; registrar hallazgos, bloqueo, evidencia y restablecimiento              | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | instalación o zona, tarea, procedimiento, actor, hora, hallazgo, evidencia, bloqueo y restablecimiento                                   |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                           | verificar exhibición, precio, vigencia y retiro físico o digital de contenido y promociones en el punto asignado                                               | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | contenido o promoción, versión, sede o canal, actor verificador, vigencia, evidencia de publicación y retiro                             |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | recibir consulta, identificar necesidad, responder dentro del guion autorizado, registrar oportunidad y transferirla al responsable                            | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | canal, contacto mínimo, consentimiento, necesidad, actor, respuesta y transferencia                                                      |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | reportar incidente tecnológico, aportar diagnóstico y evidencia básica, aplicar pasos autorizados y confirmar recuperación del puesto                          | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | dispositivo o servicio, solicitante, contexto, síntomas, pasos, evidencia, resolución y confirmación                                     |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `OPERATIVO_PARCIAL`   | `gerencia_operativa`                                                                                                                                                                                                                                             | capturar hechos y observaciones de campo, validar si una mejora funciona en la operación y reportar efectos no previstos                                       | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | métrica o hipótesis, proceso, observación, actor, periodo, evidencia y resultado de verificación                                         |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | activar modo de continuidad, ejecutar operación mínima autorizada, preservar evidencia, reconciliar trabajo diferido y confirmar recuperación                  | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | incidente de continuidad, actor, modo activado, operaciones diferidas, reconciliación, recuperación y evidencia                          |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `OPERATIVO_PARCIAL`   | `gerencia_operativa`                                                                                                                                                                                                                                             | reportar riesgos operativos, verificar controles del turno y aportar señales de exposición o cambio sin aceptar riesgo residual                                | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | riesgo, sede o área, observación, actor, control, exposición y escalamiento                                                              |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | recibir, verificar talla y estado, aceptar, usar, cambiar, devolver y reportar pérdida o daño de elementos de protección                                       | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | elemento, requisito, talla, lote cuando aplique, trabajador, entregador, aceptación o firma, vigencia y devolución                       |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `OPERATIVO_PRINCIPAL` | `cajero_satelite`; `barista_satelite`; `cocinero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `produccion_cocina`; `produccion_panaderia`; `produccion_reposteria`; `bodeguero`; `conductor_logistica`; `gerencia_operativa` | armar, verificar completitud, entregar, recibir, prestar, devolver y sustituir componentes de kits bajo custodia                                               | La ejecución física o de atención es el núcleo del proceso. Requiere actor efectivo, turno y rol vigentes, sede y área compatibles, permiso, recurso, estado y evidencia. Supervisión o jerarquía no sustituyen al ejecutor ni permiten autoaprobar excepciones. | kit, componentes, estado, custodio, entregador, aceptación, diferencias, devolución y sustitución                                        |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `OPERATIVO_PARCIAL`   | `cajero_satelite`; `servicio_salon`; `mostrador_satelite`; `operador_integral_satelite`; `gerencia_operativa`                                                                                                                                                    | solicitar o capturar respuesta de satisfacción con consentimiento, canal y muestra definidos, sin convertirla en reclamo o compensación                        | Solo la etapa operacional indicada puede ejecutarse por turno. La planificación, aprobación, corrección, publicación, conciliación o cierre administrativo conserva autoridad y contrato separados.                                                              | instrumento y versión, muestra, canal, consentimiento, actor facilitador y respuesta protegida                                           |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `NO_OPERATIVO`        | —                                                                                                                                                                                                                                                                | —                                                                                                                                                              | Un turno, check-in, rol operativo o tablet compartida no podrá habilitar este proceso. Sus acciones pertenecen a identidad personal, rol base, autoridad administrativa o servicio técnico expresamente autorizado.                                              | —                                                                                                                                        |

---

#### 9. Procesos sin ejecución operativa directa

Los siguientes dieciocho procesos permanecen expresamente fuera del alcance de un turno operativo:

`VPROC-0001`, `VPROC-0002`, `VPROC-0003`, `VPROC-0005`, `VPROC-0006`, `VPROC-0007`, `VPROC-0010`, `VPROC-0011`, `VPROC-0021`, `VPROC-0051`, `VPROC-0052`, `VPROC-0053`, `VPROC-0054`, `VPROC-0059`, `VPROC-0060`, `VPROC-0064`, `VPROC-0065`, `VPROC-0069`.

Para estos procesos:

```text
ROL OPERATIVO ACTIVO
+
TURNO VÁLIDO
≠
AUTORIDAD PARA EJECUTAR EL PROCESO
```

Una aplicación no deberá habilitarlos mediante fallback a `gerencia_operativa`, rol base, dispositivo, área o perfil predeterminado.

---

#### 10. Handoffs, aceptación y firma reforzada

Las transferencias de custodia o responsabilidad deberán identificar por separado:

- emisor o entregador;
- receptor o aceptante;
- recurso y versión;
- cantidades, condición y diferencias;
- momento, sede, área, dispositivo y evidencia;
- obligaciones pendientes o rechazo.

La política de evidencia podrá exigir, según riesgo:

- sesión personal activa;
- PIN del trabajador;
- reautenticación;
- firma dibujada;
- firma electrónica;
- fotografía, escaneo o lectura de código;
- combinación de mecanismos.

```text
TRAZO DE FIRMA
≠
IDENTIDAD
≠
PERMISO
≠
ACEPTACIÓN VÁLIDA POR SÍ SOLO
```

Toda firma o confirmación reforzada deberá quedar vinculada al actor efectivo, instancia, transición, payload o versión aceptada, fecha, dispositivo y evidencia. No podrá reutilizarse una firma anterior ni permitir que emisor y receptor sean sustituidos por el mismo actor cuando la segregación exija dos personas.

La selección definitiva del mecanismo y su diseño visual permanecen en `AUTH-DEV-007`, `INFO-DOM-007`, `INFO-DOM-011`, `EVID-ARC-001` a `EVID-ARC-008`, `SHELL-UI-014`, `NEXO-UX-011`, `NEXO-UX-013` y las tareas de implementación propietarias.

---

#### 11. Dispositivos compartidos

Una tablet o terminal compartida es un principal técnico, no el trabajador.

Toda acción empresarial deberá registrar simultáneamente:

```text
PRINCIPAL AUTENTICADO
→ dispositivo técnico

ACTOR EFECTIVO
→ empleado real de la sesión o confirmación vigente
```

Se deberá impedir:

- firmar o ejecutar sin actor vigente;
- conservar visible información del trabajador anterior;
- reutilizar PIN, firma o contexto después de expiración o cambio de actor;
- atribuir acciones al `navigation_role`;
- permitir que una cuenta técnica aparezca como despachador, productor, cajero o receptor.

---

#### 12. Offline, concurrencia y reintentos

Las acciones operativas offline deberán conservar contexto firmado o verificable, tiempo del hecho, versión del recurso, actor, rol, sede, área, permiso requerido y clave idempotente.

Al sincronizar se revalidarán:

- identidad y vigencia del actor;
- rol y turno aplicables al momento permitido;
- estado y versión del recurso;
- duplicidad o conflicto;
- secuencia de custodia;
- revocaciones ocurridas antes de la aceptación definitiva.

Un conflicto no podrá resolverse sobrescribiendo silenciosamente cantidades, firmas, conteos, lotes, pagos o estados.

---

#### 13. Resultado cuantitativo

```text
PROCESOS EVALUADOS                         69
OPERATIVO_PRINCIPAL                        25
OPERATIVO_PARCIAL                          26
NO_OPERATIVO                               18
PROCESOS CON ROL OPERATIVO                 51
PROCESOS SIN ROL OPERATIVO DIRECTO         18
CÓDIGOS OPERATIVOS CANÓNICOS               12
PROCESOS OMITIDOS                           0
CLASIFICACIONES DESCONOCIDAS                0
```

---

#### 14. Exclusiones expresas

Esta tarea no:

- define todavía procesos híbridos;
- decide el diseño de pantallas o estaciones;
- asigna permisos concretos a cada transición;
- establece umbrales universales de firma, fotografía o doble control;
- crea nuevos roles operativos;
- diseña hardware, almacenamiento o biometría;
- implementa sincronización offline;
- modifica código, Supabase, migraciones o datos.

---

#### 15. Evolución y control de cambios

Toda modificación futura deberá:

1. conservar los 69 identificadores o documentar formalmente su evolución;
2. utilizar únicamente clasificaciones y roles canónicos versionados;
3. verificar coherencia con `PROC-ACTOR-002`, `PROC-ACTOR-003` y `PROC-ACTOR-005`;
4. impedir que un proceso `NO_OPERATIVO` obtenga ejecución por fallback;
5. recalcular pruebas, pantallas, estaciones, permisos y paquetes de implementación afectados;
6. registrar migración y retiro de códigos legacy;
7. mantener trazabilidad de firmas, evidencia, custodia y cambios de actor.

---

#### 16. Requisitos de prueba derivados

Esta tarea incorpora en el registro canónico completo:

- `TREQ-PROC-159`;
- `TREQ-PROC-160`;
- `TREQ-PROC-161`;
- `TREQ-PROC-162`;
- `TREQ-PROC-163`;
- `TREQ-PROC-164`;
- `TREQ-PROC-165`;
- `TREQ-PROC-166`.

El archivo `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` regenerado es la única fuente de detalle de esos requisitos.

---

#### 17. Criterios de aceptación

- [ ] Los 69 procesos tienen exactamente una clasificación operativa.
- [ ] Las cantidades son 25 principales, 26 parciales y 18 no operativas.
- [ ] Los dieciocho `NO_OPERATIVO` coinciden con los procesos sin rol operativo directo de `PROC-ACTOR-002`.
- [ ] Solo se usan los doce roles operativos canónicos.
- [ ] Aplicabilidad, rol efectivo, permiso y responsabilidad están diferenciados.
- [ ] Hechos físicos, decisiones administrativas y aprobaciones no se confunden.
- [ ] Handoffs, custodia, aceptación y firma reforzada conservan actores y evidencia separados.
- [ ] Las tablets compartidas no sustituyen identidad humana.
- [ ] Offline, reintentos y concurrencia no duplican ni sobrescriben hechos.
- [ ] No se diseñaron pantallas, migraciones ni cambios en Supabase.
- [ ] Toda brecha o decisión diferida tiene tareas responsables explícitas.
- [ ] `PROC-ACTOR-007` permanece sin iniciar.

---

#### 18. Estado y continuidad

```text
APROBADA
```

No se inicia `PROC-ACTOR-007 — Definir procesos híbridos` hasta la aprobación expresa de esta tarea.

### ✅ PROC-ACTOR-007 — Definir procesos híbridos

**Estado:** APROBADA 
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-006 — Definir procesos operativos` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-008 — Definir procesos del dominio cliente`  
**Artefacto producido:** `PROC-HYBRID-PROCESS-CLASSIFICATION-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Procesos híbridos:** **55**  
**Procesos no híbridos:** **14**  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Identificar los procesos cuyo ciclo completo atraviesa más de un plano de participación y definir de forma explícita cómo se transfiere el control entre etapas personales, administrativas y operativas.

La tarea evita dos errores opuestos:

```text
ERROR 1
→ tratar todo el proceso como si perteneciera a un solo tipo de actor

ERROR 2
→ permitir que una misma persona, rol, pantalla o aplicación herede autoridad sobre todas las etapas
```

Un proceso híbrido conserva una única identidad `VPROC-*`, pero contiene etapas con contratos de actor, autorización, datos, evidencia y experiencia diferentes.

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-006`;
- `PROC-PROCESS-TRANSITION-REGISTRY-001`;
- `PROC-PROCESS-INPUT-CONTRACT-001`;
- `PROC-PROCESS-OUTPUT-CONTRACT-001`;
- `PROC-BUSINESS-EVENT-CONTRACT-REGISTRY-001`;
- `PROC-PROCESS-AUDIT-PROFILE-001`;
- las clasificaciones aprobadas de procesos personales, administrativos y operativos.

No se redefine la clasificación del dominio cliente ni de procesos automáticos, reservadas para `PROC-ACTOR-008` y `PROC-ACTOR-009`.

---

#### 3. Definición normativa

Un proceso es híbrido cuando su resultado empresarial exige al menos dos planos internos diferentes:

- `PERSONAL`: la persona actúa sobre su propio caso, dato, documento, solicitud o recurso asignado;
- `ADMINISTRATIVO`: un actor planifica, valida, decide, publica, concilia, corrige o gobierna;
- `OPERATIVO`: un actor ejecuta o confirma un hecho físico, de servicio, custodia o campo.

```text
PROCESO HÍBRIDO
=
UNA IDENTIDAD DE PROCESO
+
DOS O MÁS PLANOS DE PARTICIPACIÓN
+
HANDOFFS EXPLÍCITOS
+
AUTORIZACIÓN RESUELTA POR ETAPA
```

No es híbrido únicamente porque:

- tenga varias pantallas;
- use más de una aplicación;
- existan varios estados;
- consuma eventos externos;
- incluya una firma o aprobación;
- se ejecute en línea y offline;
- tenga varios actores del mismo plano.

---

#### 4. Modos de clasificación

| Modo                                        | Cantidad | Regla                                                                                                                                                                                                  |
| ------------------------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `HIBRIDO_PERSONAL_ADMINISTRATIVO`           |    **9** | La persona aporta, consulta, firma, solicita o recibe sobre su propio recurso y una función administrativa valida, decide, publica o cierra. No existe ejecución por rol operativo dentro del proceso. |
| `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` |   **10** | El ciclo contiene participación personal, decisión o gobierno administrativo y ejecución física o de campo.                                                                                            |
| `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          |   **36** | Una etapa administrativa planifica, autoriza, publica o reconcilia y una etapa operativa ejecuta o confirma el hecho real.                                                                             |
| `NO_HIBRIDO_ADMINISTRATIVO`                 |    **9** | El proceso permanece íntegramente en el plano administrativo; los hechos de otros dominios son entradas o salidas, no etapas internas.                                                                 |
| `NO_HIBRIDO_OPERATIVO`                      |    **5** | El proceso permanece íntegramente operativo; decisiones administrativas o financieras excepcionales se ejecutan mediante procesos vinculados, no como etapas ocultas.                                  |

Resultado consolidado:

```text
PROCESOS HÍBRIDOS       55
PROCESOS NO HÍBRIDOS    14
TOTAL                    69
```

---

#### 5. Contrato obligatorio de etapa

Cada etapa deberá declarar como mínimo:

1. `stage_id` estable dentro del proceso;
2. plano `PERSONAL`, `ADMINISTRATIVO` u `OPERATIVO`;
3. acción, propósito y resultado permitido;
4. actor o tipo de actor admisible;
5. permiso y alcance necesarios;
6. aplicación propietaria de la escritura;
7. condición de entrada y salida;
8. datos y evidencia que recibe y produce;
9. posibilidad de rechazo, devolución, expiración o escalamiento;
10. evento o handoff que habilita la etapa siguiente.

La autorización se resuelve nuevamente en cada etapa. El actor de una etapa anterior no transmite sus permisos al actor siguiente.

---

#### 6. Contrato obligatorio de handoff

Todo cambio de plano deberá conservar:

```text
PROCESO E INSTANCIA
+
ETAPA DE ORIGEN Y DESTINO
+
EMISOR Y RECEPTOR
+
OBJETO, CANTIDAD O SNAPSHOT
+
ESTADO Y VERSIÓN
+
MOMENTO DEL HECHO
+
EVIDENCIA
+
ACEPTACIÓN, RECHAZO O DEVOLUCIÓN
+
CORRELACIÓN E IDEMPOTENCIA
```

El handoff no podrá modelarse como un simple cambio de etiqueta. La etapa receptora deberá verificar que el paquete recibido es suficiente, vigente y autorizado antes de actuar.

---

#### 7. Reglas de separación

##### 7.1. No existe autorización heredada

```text
AUTORIZADO PARA INICIAR
≠
AUTORIZADO PARA EJECUTAR
≠
AUTORIZADO PARA SUPERVISAR
≠
AUTORIZADO PARA APROBAR
≠
AUTORIZADO PARA CERRAR
```

##### 7.2. No existe actor híbrido universal

Una persona puede participar en varias etapas únicamente si satisface cada contrato y no viola segregación. La clasificación híbrida no crea un rol híbrido ni justifica `gerencia_operativa` como comodín.

##### 7.3. No existen escrituras transversales implícitas

La aplicación que presenta una vista integral no adquiere propiedad sobre los registros de otras aplicaciones. Cada etapa escribe mediante la aplicación propietaria o un contrato de servicio autorizado.

##### 7.4. La etapa física no puede fabricarse administrativamente

Planificar, aprobar o conciliar no prueba que se produjo, contó, limpió, cargó, condujo, entregó, recibió o firmó.

##### 7.5. La etapa personal no puede usarse como autoaprobación

Solicitar, confirmar lectura, firmar, aceptar una entrega o reportar una novedad no permite aprobar, corregir, conciliar o cerrar el propio caso.

---

#### 8. Matriz canónica completa

| Proceso      | Propósito empresarial                                                                                                                                                                      | Clasificación híbrida                       | Planos internos                         | Secuencia canónica resumida                                                                                                                                                              | Frontera crítica                                                                                                                                                      | Evidencia mínima del cruce                                                                                                                                         |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | propuesta administrativa → revisión independiente → decisión autorizada → seguimiento y cierre                                                                                           | la decisión no se transforma en trabajo operativo dentro de este proceso; los compromisos ejecutables originan instancias vinculadas de `VPROC-0004` u otros procesos | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | solicitud de cambio → validación jurídica y organizacional → aprobación → publicación de versión                                                                                         | ninguna sede, área o aplicación puede autoactualizar la estructura canónica como efecto lateral                                                                       | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración redacta y publica → trabajador consulta o confirma → administración atiende dudas, excepciones y nueva versión                                                            | la confirmación personal solo acredita el objeto mostrado; no equivale a aprobación, renuncia ni autorización general                                                 | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración formaliza compromiso → actor operativo receptor acepta → ejecuta o reporta bloqueo → administración verifica y cierra                                                     | la aceptación del destinatario no hereda permisos del originador ni permite cerrar sin resultado y evidencia                                                          | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración abre necesidad y vacante → candidato aporta postulación → administración evalúa y decide → candidato recibe resultado                                                     | el candidato controla sus datos y consentimientos, pero no su evaluación, selección ni conversión en trabajador                                                       | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración crea expediente y requisitos → persona aporta, firma o confirma → administración verifica y habilita → persona recibe constancia                                          | firma, recepción documental, aptitud, rol, sede, acceso y habilitación son decisiones separadas                                                                       | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración planifica y publica → trabajador consulta, declara disponibilidad o solicita cambio → administración resuelve y republica                                                 | una solicitud personal no modifica el turno vigente hasta existir decisión y nueva versión publicada                                                                  | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | trabajador registra hecho de asistencia en contexto operativo → administración detecta o recibe discrepancia → decide corrección → trabajador consulta resultado                         | el hecho original permanece inmutable y la corrección no se ejecuta con la autoridad del trabajador ni borra el origen                                                | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | trabajador reporta o solicita → administración valida y decide → operación acepta o ejecuta cobertura autorizada → trabajador recibe resultado                                           | solicitud, aprobación, sustitución operativa y efecto laboral son transiciones distintas                                                                              | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración consolida y reconcilia paquete → trabajador consulta, recibe o reporta discrepancia → administración investiga y corrige por versión                                      | la recepción personal no prueba conformidad con el cálculo ni ejecuta el pago                                                                                         | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración abre retiro → persona devuelve, aporta o firma → administración verifica activos y accesos → revoca, reconcilia y cierra                                                  | la firma personal no declara automáticamente cumplidas obligaciones ni autoriza borrar historial                                                                      | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | administración define riesgo y control → trabajador u operación inspecciona, reporta o aplica → administración verifica eficacia y decide cierre                                         | quien ejecuta el control no acepta por sí mismo el riesgo residual ni cierra su propia desviación crítica                                                             | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | persona u operación alerta → operación responde y protege → administración investiga, clasifica y decide acciones → persona recibe información aplicable                                 | respuesta inmediata, declaración personal, investigación y cierre conservan actores y datos separados                                                                 | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración publica procedimiento y frecuencia → operación ejecuta y mide → administración revisa desviaciones y dispone corrección                                                   | una lista marcada no equivale a cumplimiento cuando falta medición, evidencia o condición real                                                                        | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración crea o versiona maestro → operación valida presentación, unidad o condición física → administración aprueba y publica corrección                                          | la observación de campo no puede editar directamente el maestro ni una edición administrativa puede fingir validación física                                          | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración formula versión de prueba → operación ejecuta ensayo y registra rendimiento → administración evalúa, aprueba y publica                                                    | la receta usada en producción debe ser la versión aprobada; el ensayo no se vuelve vigente por haber sido ejecutado                                                   | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración gobierna oferta → operación reporta disponibilidad y restricciones reales → administración publica, actualiza o retira por canal                                          | una señal local no cambia silenciosamente todos los canales ni la publicación puede ignorar la capacidad real                                                         | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración mantiene especificación → operación inspecciona o mide → administración evalúa desviación y actualiza control o versión                                                   | el dato observado, la decisión de conformidad y la modificación de especificación son hechos distintos                                                                | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación o área origina necesidad → administración normaliza, agrupa y prioriza → remite a comparación o compra                                                                         | reportar necesidad no autoriza proveedor, cantidad final, presupuesto ni emisión de compra                                                                            | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación o área aporta necesidad y condiciones observadas → administración solicita y compara ofertas → autoridad decide selección                                                      | la evidencia operativa no sustituye evaluación comercial ni el comparador puede aprobar su propia recomendación cuando aplique segregación                            | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | administración prepara solicitud → autoridad aprueba o rechaza → administración emite orden y conserva versión                                                                           | la ejecución física de compra o recepción pertenece a procesos separados; no existe etapa operativa interna                                                           | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración comunica orden esperada → operación recibe, inspecciona y registra diferencias → administración resuelve efecto documental y económico                                    | recepción física, aceptación de conformidad y reconocimiento de obligación no son el mismo acto                                                                       | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración diseña y habilita LOC → operación valida condición y uso real → administración corrige, bloquea o versiona configuración                                                  | el operario no crea estructura maestra ad hoc y la configuración no declara una ubicación físicamente apta sin verificación                                           | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración o proceso previo autoriza contexto → operación registra ingreso o reubicación → administración reconcilia excepciones                                                     | cada movimiento conserva origen, destino y actor; no se corrige saldo editando una cifra agregada                                                                     | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración define política y autorización aplicable → operación retira, consume o traslada → administración revisa excepción o diferencia                                            | unidad, conversión y destino se preservan; un retiro físico no puede convertirse en ajuste administrativo encubierto                                                  | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación observa y registra conteo → administración investiga diferencia → autoridad aprueba ajuste → operación confirma recuento cuando corresponda                                    | contador, investigador y aprobador del ajuste no se colapsan sin excepción formal y control compensatorio                                                             | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación detecta, segrega o reporta condición → administración evalúa y decide disposición → operación ejecuta traslado, descarte o recuperación → administración reconcilia            | cuarentena y disposición no se infieren de una etiqueta; cada cambio conserva autoridad, cantidad y evidencia                                                         | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración o sede solicita → operación prepara y despacha → transporte transfiere custodia → operación destino recibe → administración concilia diferencias y cierre                 | cada handoff resuelve actor propio; despacho, tránsito, recepción y conciliación no pueden autoaceptarse ni compartir firma                                           | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | administración asigna o autoriza transferencia → trabajador u operación recibe y custodia → administración reconcilia ubicación, estado y responsabilidad                                | la persona acepta un recurso identificado; no aprueba su propia asignación ni altera el maestro del activo                                                            | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | persona u operación reporta necesidad → administración diagnostica y autoriza → operación o técnico repara → custodio acepta → administración cierra                                     | solicitud, autorización de costo, ejecución técnica, aceptación y disposición son responsabilidades separadas                                                         | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración programa y habilita vehículo → operación inspecciona, usa y registra consumo o incidente → administración reconcilia disponibilidad y mantenimiento                       | el conductor no modifica el historial maestro ni administración declara una inspección física no realizada                                                            | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | administración asigna o solicita → operación entrega → persona o custodio acepta y usa → operación recibe retorno → administración reconcilia faltantes                                  | entrega, tenencia, devolución y pérdida conservan actores, cantidades y condición; nadie puede autoentregarse y autorecibirse                                         | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración calcula necesidad y plan → operación confirma capacidad, materiales o bloqueo → administración publica o reprograma                                                       | la confirmación operacional no cambia por sí sola prioridad, demanda ni versión del plan                                                                              | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `NO_HIBRIDO_OPERATIVO`                      | `OPERATIVO`                             | operación prepara materiales → ejecuta receta vigente → registra consumos, lote y resultado → entrega a control o siguiente etapa                                                        | el proceso permanece operacional; aprobación de receta, liberación y ajustes se resuelven en procesos vinculados, no como etapas administrativas ocultas              | actor efectivo; rol operativo; turno y territorio; recurso; versión aplicable; evidencia del hecho; excepción vinculada cuando exista                              |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación inspecciona y registra resultado → autoridad de calidad decide liberar, retener o rechazar → operación segrega o transfiere → administración conserva cierre                   | quien produjo no se autolibera y quien decide no puede inventar mediciones faltantes                                                                                  | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `NO_HIBRIDO_OPERATIVO`                      | `OPERATIVO`                             | operación recibe producto liberado → empaca y etiqueta → almacena o transfiere con trazabilidad                                                                                          | el proceso permanece operacional; cambios de especificación, receta o maestro se tramitan fuera de la instancia                                                       | actor efectivo; rol operativo; turno y territorio; recurso; versión aplicable; evidencia del hecho; excepción vinculada cuando exista                              |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación registra rendimiento, merma o necesidad → administración evalúa y autoriza reproceso o disposición → operación ejecuta → administración reconcilia cierre                      | una merma observada no se borra ni el reproceso se usa para ocultar rendimiento o consumo                                                                             | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `NO_HIBRIDO_OPERATIVO`                      | `OPERATIVO`                             | operación abre servicio → captura pedido → coordina preparación y entrega → cobra o transfiere a pago → concilia cierre operativo                                                        | el proceso permanece operacional; excepciones administrativas, fiscales o financieras generan decisiones vinculadas sin sustituir al actor de servicio                | actor efectivo; rol operativo; turno y territorio; recurso; versión aplicable; evidencia del hecho; excepción vinculada cuando exista                              |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `NO_HIBRIDO_OPERATIVO`                      | `OPERATIVO`                             | operación captura pedido → prepara o coordina → entrega → cobra y conserva soporte                                                                                                       | el proceso permanece operacional; descuentos excepcionales, devoluciones y conciliación financiera se resuelven mediante contratos vinculados                         | actor efectivo; rol operativo; turno y territorio; recurso; versión aplicable; evidencia del hecho; excepción vinculada cuando exista                              |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | canal externo origina pedido → administración o adaptador normaliza y valida → operación prepara y entrega → administración reconcilia estados y acuses                                  | un acuse externo no prueba aceptación interna ni entrega; el contrato canónico conserva identidad y correlación                                                       | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración cotiza, valida capacidad y obtiene aprobación → operación produce y entrega → administración factura, concilia y cierra                                                   | cotización, aprobación comercial, ejecución física, aceptación de entrega y reconocimiento económico permanecen separados                                             | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | cliente u operación solicita cambio → administración valida regla e impacto → operación ejecuta sustitución, devolución o anulación física → administración reconcilia efectos           | modificación, cancelación, devolución, reembolso y reverso no se condensan en un único estado                                                                         | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación inicia cobro y presenta medio → proveedor o sistema confirma técnicamente → administración o finanzas reconcilia excepciones → operación entrega soporte                       | acuse, autorización, captura, conciliación y reembolso son hechos distintos; nadie fuerza pago cambiando estado                                                       | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación cuenta y declara cierre → administración o finanzas compara ventas y medios → autoridad decide diferencia → se conserva cierre reconciliado                                    | el cajero no aprueba unilateralmente su diferencia y el revisor no reemplaza el conteo original                                                                       | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación identifica y registra interacción autorizada → administración gobierna consentimiento, regla y ledger → operación aplica beneficio válido → administración reconcilia          | identificación, consentimiento, acumulación, redención y ajuste de puntos conservan controles independientes                                                          | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación recibe reclamo o devolución → administración investiga y decide compensación → operación ejecuta entrega, retiro o devolución autorizada → administración registra aprendizaje | quien atiende no concede compensación ilimitada ni la compensación borra causa, evidencia o efecto económico                                                          | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración reserva capacidad y comunica condiciones → operación prepara y presta servicio → administración reconcilia cambios, asistencia y cierre                                   | reserva, confirmación del cliente, ejecución del evento y cobro son etapas diferenciadas                                                                              | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración planifica ruta y carga → operación valida vehículo, capacidad y alistamiento → autoridad libera despacho                                                                  | la validación física no modifica silenciosamente el plan y la liberación no prueba que la ruta ya salió                                                               | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `NO_HIBRIDO_OPERATIVO`                      | `OPERATIVO`                             | operación recibe carga → ejecuta ruta → entrega, rechaza o retorna → receptor acepta y se conserva prueba                                                                                | el proceso permanece operacional; planificación, facturación y conciliación se mantienen en procesos vinculados                                                       | actor efectivo; rol operativo; turno y territorio; recurso; versión aplicable; evidencia del hecho; excepción vinculada cuando exista                              |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración crea seguimiento y contrato con tercero → tercero ejecuta → operación interna recibe o verifica → administración concilia prueba, cobro y excepción                       | el estado del proveedor no reemplaza evidencia interna ni una recepción técnica equivale a cierre comercial                                                           | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | administración consume eventos y soportes → valida periodo y regla → registra asiento → revisa y cierra                                                                                  | no existe ejecución operativa interna; el hecho operativo de origen permanece en su aplicación propietaria                                                            | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | administración registra obligación → valida soporte y aprobación → ejecuta pago autorizado → concilia banco y cierra                                                                     | no existe etapa operativa por turno; preparación, aprobación, pago y conciliación aplican segregación administrativa                                                  | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | administración reconoce cartera → gestiona cobro → aplica recaudo → investiga diferencia y cierra                                                                                        | no existe etapa operativa por turno; el recaudo externo o comercial llega como evidencia y no como autoridad                                                          | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | administración calcula costos con reglas versionadas → distribuye → revisa cierre y rentabilidad → aprueba o restata                                                                     | no existe etapa operativa interna y el proceso no administra presupuesto; consume hechos canónicos de otros dominios                                                  | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración planifica frecuencia, proveedor o intervención → operación ejecuta e inspecciona → administración verifica resultado, costo y cierre                                      | una orden cerrada no prueba limpieza o reparación; la evidencia física y la aceptación permanecen separadas                                                           | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración solicita, crea y aprueba contenido → operación verifica exhibición o retiro en punto → administración confirma publicación, vigencia y cierre                             | el trabajador del punto no cambia la pieza maestra ni administración declara retirada una promoción aún visible                                                       | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación o canal recibe consulta → administración califica y asigna oportunidad → operación responde o ejecuta contacto autorizado → administración sigue y cierra                      | consentimiento, finalidad y mínimo de datos se revalidan en cada transferencia                                                                                        | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | persona reporta incidencia → administración técnica prioriza y asigna → operación o usuario ejecuta pasos y verifica recuperación → administración documenta y cierra → persona confirma | credenciales, soporte remoto, cambio de configuración y confirmación del usuario son actos separados y auditables                                                     | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | persona o responsable solicita acceso → administración valida autoridad y provisiona → persona verifica → administración revisa, suspende o revoca                                       | la persona no se autoasigna permisos y el técnico no se concede acceso ni usa la credencial del usuario                                                               | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración crea, clasifica y publica documento → persona consulta, firma o descarga lo propio → administración retiene, versiona o dispone                                           | cada firma se vincula a versión visible; el acceso personal no concede búsqueda, exportación o disposición global                                                     | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración define métrica, hipótesis o cambio → operación captura hechos y prueba → administración analiza, decide y verifica resultado                                              | el equipo no puede seleccionar solo observaciones favorables ni la administración inventar evidencia de campo                                                         | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | administración declara modo de continuidad y prioridades → operación ejecuta servicio mínimo y conserva cola → administración recupera, reconcilia y aprende                             | modo degradado no elimina autorización, actor, idempotencia ni conciliación posterior                                                                                 | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación reporta señal o exposición → administración evalúa, prioriza y define tratamiento → operación verifica controles → administración monitorea y acepta o escala riesgo           | quien ejecuta el control no acepta unilateralmente riesgo residual ni la observación se borra al cerrar tratamiento                                                   | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | administración registra requerimiento → coordina asesor o autoridad → valida entregable → responde, conserva evidencia y cierra                                                          | no existe etapa operativa interna; el tercero aporta concepto o requerimiento, pero no asume la propiedad interna del resultado                                       | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `HIBRIDO_PERSONAL_ADMINISTRATIVO`           | `PERSONAL ↔ ADMINISTRATIVO`             | administración acuerda objetivos y contexto → persona aporta autoevaluación o recibe retroalimentación → administración evalúa y decide acciones → persona confirma conocimiento         | la participación personal no habilita editar evaluación, ocultar historial o aprobar su propio resultado                                                              | sujeto y relación; objeto o versión; acción personal; recepción administrativa; decisión; notificación; timestamps y auditoría                                     |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | administración determina requisito y asignación → operación entrega y verifica → trabajador acepta, usa, cambia o devuelve → administración reconcilia vigencia y cierre                 | entregador, receptor y aprobador de excepción se mantienen separados; firma o PIN se vinculan al elemento exacto                                                      | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO` | `PERSONAL ↔ ADMINISTRATIVO ↔ OPERATIVO` | administración define kit y asignación → operación arma y entrega → trabajador o custodio acepta y usa → operación recibe retorno → administración reconcilia componentes                | kit, activo, LPN y contenedor no se fusionan; cada diferencia conserva componente, actor y decisión                                                                   | sujeto y relación; solicitud o aceptación; decisión administrativa; orden o asignación; actor operativo; evidencia física; reconciliación y resultado personal     |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `HIBRIDO_ADMINISTRATIVO_OPERATIVO`          | `ADMINISTRATIVO ↔ OPERATIVO`            | operación solicita o captura respuesta bajo consentimiento → administración consolida y analiza → decide mejora o deriva reclamo → operación verifica cambio cuando aplique              | medición, incentivo, reclamo y compensación permanecen separados; el detalle del actor cliente se reserva a `PROC-ACTOR-008`                                          | instrucción o versión aprobada; emisor y receptor; actor operativo y contexto; recurso; evidencia del hecho; diferencias; aceptación o conciliación administrativa |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `NO_HIBRIDO_ADMINISTRATIVO`                 | `ADMINISTRATIVO`                        | administración formula supuestos y versión → revisa y aprueba → controla consumo y proyección → analiza desviación y restata                                                             | no existe etapa operativa interna y el presupuesto no se convierte en asiento, costo ni pago por sí mismo                                                             | actor administrativo; permiso y alcance; versión o decisión; segregación; soporte; auditoría y resultado                                                           |

---

#### 9. Tratamiento de los procesos no híbridos

##### 9.1. `NO_HIBRIDO_ADMINISTRATIVO`

Corresponde a:

- `VPROC-0001`;
- `VPROC-0002`;
- `VPROC-0021`;
- `VPROC-0051`;
- `VPROC-0052`;
- `VPROC-0053`;
- `VPROC-0054`;
- `VPROC-0064`;
- `VPROC-0069`.

Los hechos operativos, externos o automáticos que consuman son entradas documentadas. No se convierten en una etapa del proceso ni autorizan a editar el registro de origen.

##### 9.2. `NO_HIBRIDO_OPERATIVO`

Corresponde a:

- `VPROC-0034`;
- `VPROC-0036`;
- `VPROC-0038`;
- `VPROC-0039`;
- `VPROC-0049`.

Estos procesos ejecutan el trabajo ordinario bajo reglas ya vigentes. Las excepciones administrativas, fiscales, financieras o de calidad originan decisiones o procesos correlacionados, pero no se incorporan como bypass dentro del flujo operativo.

---

#### 10. Pantallas y colas por plano

Una experiencia híbrida podrá presentar continuidad visual, pero deberá diferenciar:

- bandeja o autoservicio personal;
- cola administrativa de revisión o decisión;
- estación operativa de ejecución;
- panel de supervisión o conciliación;
- historial transversal de solo lectura autorizado.

Un botón visible en una vista consolidada solo podrá ejecutar la acción de la etapa cuyo contrato haya sido resuelto.

```text
VISTA INTEGRAL
≠
PERMISO INTEGRAL
≠
PROPIEDAD INTEGRAL DE DATOS
```

---

#### 11. Firmas, aceptaciones y evidencia

Cuando un handoff requiera firma, PIN, reautenticación, fotografía, escaneo o aceptación:

- deberá identificarse al actor de esa etapa;
- se mostrará el objeto, versión, cantidad o condición aceptados;
- la evidencia no se trasladará a una etapa posterior;
- un cambio de actor, payload o versión invalidará la confirmación pendiente;
- entregador y receptor permanecerán separados cuando el control lo exija;
- la firma dibujada no sustituirá identidad, permiso ni decisión administrativa.

Esta regla aplica especialmente a remisiones, activos, reutilizables, EPP, kits, documentos, vinculación y retiro.

---

#### 12. Offline, reintentos y continuidad

Una etapa operativa podrá trabajar offline solo cuando su contrato lo admita. La cola deberá preservar etapa, actor, rol, contexto, recurso, versión, evidencia e idempotencia.

Al sincronizar:

1. se revalida la autoridad de la etapa original;
2. se comprueba que el handoff no fue rechazado, sustituido o completado;
3. se detecta conflicto de versión o actor;
4. se evita duplicar la etapa siguiente;
5. una aprobación o firma no se transfiere automáticamente;
6. el estado visible permanece `PENDIENTE_DE_SINCRONIZACION` hasta confirmación canónica.

Las decisiones administrativas sensibles no se habilitan offline por defecto.

---

#### 13. Actores externos, clientes y sistema

Los clientes, candidatos, proveedores, autoridades, plataformas, webhooks y servicios pueden originar o recibir información en un proceso híbrido. En esta tarea se tratan únicamente como límites de entrada o salida.

La definición detallada de:

- actores y procesos del dominio cliente queda en `PROC-ACTOR-008`;
- procesos automáticos o sin actor humano directo queda en `PROC-ACTOR-009`.

Ningún actor externo ni servicio técnico se convierte implícitamente en aprobador, trabajador, receptor interno o propietario de la decisión empresarial.

---

#### 14. Resultado cuantitativo

```text
PROCESOS EVALUADOS                                  69
HIBRIDO_PERSONAL_ADMINISTRATIVO                      9
HIBRIDO_PERSONAL_ADMINISTRATIVO_OPERATIVO           10
HIBRIDO_ADMINISTRATIVO_OPERATIVO                    36
NO_HIBRIDO_ADMINISTRATIVO                            9
NO_HIBRIDO_OPERATIVO                                 5
PROCESOS HÍBRIDOS                                   55
PROCESOS NO HÍBRIDOS                                14
PROCESOS OMITIDOS                                    0
CLASIFICACIONES DESCONOCIDAS                         0
```

---

#### 15. Exclusiones expresas

Esta tarea no:

- crea nuevos roles base u operativos;
- asigna permisos;
- diseña pantallas definitivas;
- define al actor cliente en detalle;
- define procesos automáticos;
- crea tablas, RPC, colas, eventos o migraciones;
- autoriza escrituras directas entre aplicaciones;
- establece que una firma sea obligatoria en todos los handoffs;
- permite concentrar funciones por falta de personal;
- modifica los 69 identificadores canónicos.

---

#### 16. Evolución y control de cambios

Toda modificación futura deberá verificar simultáneamente:

- que el proceso conserve propósito e identidad;
- que cada nueva etapa tenga plano y actor definidos;
- que los handoffs tengan entrada, salida, aceptación y evidencia;
- que no aparezca autorización heredada;
- que la aplicación propietaria siga siendo única;
- que personal, administración y operación conserven sus fronteras;
- que los eventos, auditoría y métricas continúen correlacionables;
- que las migraciones y backfills se documenten en `vento-shell`.

Si cambia materialmente el inicio, resultado o cadena de custodia, deberá evaluarse si corresponde una nueva versión o un proceso separado.

---

#### 17. Requisitos de prueba derivados

Esta tarea genera:

- `TREQ-PROC-167`;
- `TREQ-PROC-168`;
- `TREQ-PROC-169`;
- `TREQ-PROC-170`;
- `TREQ-PROC-171`;
- `TREQ-PROC-172`;
- `TREQ-PROC-173`;
- `TREQ-PROC-174`.

El detalle completo se incorpora únicamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 18. Criterios de aceptación

- [ ] Los 69 procesos tienen exactamente una clasificación híbrida válida.
- [ ] Existen 55 procesos híbridos y 14 no híbridos.
- [ ] Cada proceso híbrido declara planos, secuencia, frontera y evidencia mínima.
- [ ] Cada etapa vuelve a resolver actor, permiso, alcance, contexto y estado.
- [ ] Ningún handoff se reduce a un cambio de estado sin paquete verificable.
- [ ] Las etapas personales no conceden autoaprobación.
- [ ] Las etapas administrativas no fabrican hechos físicos.
- [ ] Las etapas operativas no heredan autoridad administrativa.
- [ ] Las aplicaciones consumidoras no escriben verdades paralelas.
- [ ] Firmas y aceptaciones permanecen vinculadas a etapa, actor y objeto exactos.
- [ ] Offline y reintentos no duplican ni adelantan etapas.
- [ ] Los dominios cliente y sistema permanecen reservados para sus tareas.
- [ ] No se modificó código, Supabase, migraciones ni operación.

---

#### 19. Estado y continuidad

```text
APROBADA
```

Al aprobarse:

- `PROC-HYBRID-PROCESS-CLASSIFICATION-001` será el contrato canónico de hibridación;
- `PROC-ACTOR-006` permanecerá aprobada;
- los requisitos `TREQ-PROC-167` a `TREQ-PROC-174` quedarán identificados;
- la continuidad será exclusivamente:

```text
PROC-ACTOR-008 — Definir procesos del dominio cliente
```


### ✅ PROC-ACTOR-008 — Definir procesos del dominio cliente

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-007 — Definir procesos híbridos` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-009 — Definir procesos de sistema sin actor humano directo`  
**Artefacto producido:** `PROC-CUSTOMER-DOMAIN-CLASSIFICATION-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Procesos con relación material al cliente:** **32**  
**Procesos fuera del dominio cliente:** **37**  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Definir en cuáles procesos existe una relación material con cliente, prospecto, pagador, destinatario, reclamante, encuestado o cuenta B2B, y establecer qué puede hacer o conocer cada identidad sin confundirla con trabajadores, proveedores, canales externos o servicios técnicos.

La tarea evita cuatro errores estructurales:

```text
CLIENTE
≠ EMPLEADO
≠ ROL BASE
≠ ROL OPERATIVO
≠ CANAL EXTERNO
≠ PROVEEDOR DE PAGO O ENTREGA
```

También impide que todo proceso que “impacta al cliente” se convierta automáticamente en una pantalla cliente o requiera almacenar su identidad.

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-007`;
- `PASS-INT-004 — Definir administración laboral de clientes cuando corresponda`;
- `PASS-INT-005 — Evitar mezclar identidad cliente y trabajador`;
- `INFO-DOM-008` a `INFO-DOM-011`;
- `INFO-AUTH-001` a `INFO-AUTH-004`;
- los contratos aprobados de estados, transiciones, entradas, salidas, eventos, auditoría y métricas.

No se define todavía qué procesos carecen de actor humano directo; esa clasificación corresponde a `PROC-ACTOR-009`.

---

#### 3. Identidades y relaciones reconocidas

El dominio cliente podrá reconocer, según el proceso:

| Tipo                        | Significado                                                       | Regla                                                                                           |
| --------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `CUSTOMER_AUTHENTICATED`    | Cliente con sesión propia válida                                  | La sesión demuestra principal autenticado, no propiedad universal sobre pedidos, pagos o datos. |
| `CUSTOMER_IDENTIFIED`       | Persona identificada por un proceso comercial                     | Requiere relación demostrable y finalidad; no implica cuenta autenticada.                       |
| `CUSTOMER_ANONYMOUS`        | Visitante o comprador sin perfil persistente                      | Se limita a sesión, pedido o interacción concreta y no crea perfil oculto.                      |
| `PROSPECT`                  | Contacto u oportunidad aún no convertida en cliente               | Consentimiento, finalidad y retención se gestionan separadamente.                               |
| `B2B_ACCOUNT`               | Organización cliente o contraparte comercial                      | La entidad y sus representantes autorizados son conceptos distintos.                            |
| `AUTHORIZED_CONTACT`        | Persona facultada para actuar por una cuenta o caso               | La facultad debe ser verificable, limitada y vigente.                                           |
| `PAYER`                     | Persona o entidad que presenta o autoriza un pago                 | Puede diferir del comprador, cliente, beneficiario o receptor.                                  |
| `RECIPIENT`                 | Persona autorizada que recibe una entrega o servicio              | Su aceptación no equivale a aprobación interna ni a pago.                                       |
| `CLAIMANT`                  | Persona que presenta un reclamo con relación demostrable          | No decide unilateralmente causa, responsabilidad o compensación.                                |
| `RESPONDENT`                | Persona que responde una medición o encuesta                      | Puede ser anónima o identificada bajo contratos diferentes.                                     |
| `ASSISTED_CUSTOMER_CONTEXT` | Interacción donde un trabajador opera la interfaz para el cliente | Se registra el cliente y el actor laboral por separado; no existe suplantación.                 |

Una misma persona podrá ser simultáneamente trabajador y cliente, pero cada solicitud deberá seleccionar y validar el dominio aplicable.

```text
MISMO auth_user_id POSIBLE
        ↓
IDENTIDAD LABORAL SEPARADA
+
IDENTIDAD CLIENTE SEPARADA
        ↓
SIN HERENCIA DE PERMISOS, DATOS O CONTEXTO
```

---

#### 4. Modos de clasificación

| Modo                                | Cantidad | Regla                                                                                                                                    |
| ----------------------------------- | -------: | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `CLIENTE_NUCLEO`                    |    **6** | El objeto principal es la identidad, relación, caso, obligación, oportunidad, reclamo, reserva o medición del cliente.                   |
| `CLIENTE_PARTICIPANTE`              |    **8** | El cliente solicita, ordena, paga, modifica, acepta, rechaza, recibe o confirma dentro del proceso.                                      |
| `CLIENTE_DESTINATARIO`              |    **2** | El cliente recibe contenido, oferta o comunicación publicada, pero no administra el proceso interno que la produce.                      |
| `CLIENTE_REFERENCIADO`              |    **3** | El proceso interno necesita una referencia mínima de cliente, pagador, destinatario o cuenta, sin darle una acción directa.              |
| `IMPACTO_CLIENTE_SIN_PARTICIPACION` |   **13** | Calidad, inocuidad, producción, instalaciones, mejora o continuidad afectan al cliente, pero no requieren su identidad ni participación. |
| `NO_DOMINIO_CLIENTE`                |   **37** | El proceso es laboral, administrativo, operativo, financiero interno, tecnológico, documental o de gobierno sin relación cliente propia. |

Resultado:

```text
RELACIÓN MATERIAL CON CLIENTE    32
FUERA DEL DOMINIO CLIENTE        37
TOTAL                            69
```

---

#### 5. Regla de autorización y propiedad

La clasificación cliente no concede acceso.

```text
IDENTIDAD CLIENTE VÁLIDA
+
RELACIÓN CON EL RECURSO
+
ACCIÓN PERMITIDA PARA EL ESTADO
+
FINALIDAD Y CONSENTIMIENTO CUANDO APLIQUE
+
CONTROLES DE FRAUDE, ABUSO E IDEMPOTENCIA
=
ACCIÓN CLIENTE AUTORIZABLE
```

Quedan prohibidas autorizaciones como:

```text
role = 'client'
→ puede leer cualquier pedido

conoce order_id
→ puede modificarlo

mismo correo o teléfono
→ misma persona confirmada

trabajador atiende al cliente
→ puede actuar como cliente sin auditoría
```

La propiedad deberá resolverse por relaciones explícitas como:

- cliente titular del recurso;
- representante autorizado de cuenta B2B;
- pagador vinculado al intento concreto;
- receptor autorizado de la entrega;
- reclamante vinculado al hecho;
- participante de reserva o evento;
- encuestado bajo token o sesión correspondiente.

---

#### 6. Proyección cliente frente a registro interno

El cliente no recibe acceso directo a las tablas o estados internos. Cada proceso propietario producirá una proyección mínima y comprensible.

```text
REGISTRO INTERNO CANÓNICO
        ↓
POLÍTICA DE VISIBILIDAD
        ↓
PROYECCIÓN CLIENTE
        ↓
ESTADO, MENSAJE Y ACCIÓN PERMITIDOS
```

Una proyección cliente podrá ocultar:

- nombres o desempeño de trabajadores;
- notas internas y motivos reservados;
- ubicaciones de inventario;
- costos, márgenes y presupuestos;
- proveedores y condiciones privadas;
- controles antifraude;
- investigación de reclamos;
- arquitectura, incidentes o vulnerabilidades;
- datos de otros clientes o contrapartes.

La simplificación no podrá mentir sobre el resultado. Un pago incierto, entrega no conciliada, pedido rechazado o compensación pendiente deberá conservar un estado cliente honesto y recuperable.

---

#### 7. Interacción asistida

Cuando un cajero, mesero, agente, auxiliar o trabajador registre una acción solicitada por el cliente, se conservarán simultáneamente:

```text
ACTOR LABORAL QUE OPERÓ
+
CLIENTE O CONTEXTO ANÓNIMO ATENDIDO
+
ACCIÓN Y DATOS MOSTRADOS
+
CONSENTIMIENTO O AUTORIZACIÓN APLICABLE
+
CANAL, SEDE, DISPOSITIVO Y MOMENTO
```

El modo asistido no permite:

- utilizar la sesión personal del trabajador como cuenta cliente;
- inventar consentimiento;
- consultar historial no necesario;
- redimir puntos sin confirmación;
- cambiar teléfono, documento o correo sin verificación;
- firmar, aceptar o recibir en nombre del cliente;
- conservar datos del cliente visibles después de terminar la interacción.

---

#### 8. Canales e intermediarios

No son clientes:

- marketplaces;
- proveedores de pago;
- transportadores o plataformas de entrega;
- bots, webhooks y servicios técnicos;
- dispositivos de tienda;
- cuentas de integración.

Estos actores pueden transmitir una solicitud o confirmación técnica, pero deberán conservar separados:

```text
CANAL O SERVICIO TÉCNICO
CLIENTE
PAGADOR
RECEPTOR
ACTOR LABORAL
```

Un `200 OK`, webhook aceptado, evento del marketplace o estado del transportador no prueba por sí solo pago, entrega, aceptación o cierre empresarial.

---

#### 9. Consentimiento, privacidad y derechos

Cada uso de datos cliente deberá declarar:

- finalidad;
- categoría de datos;
- fundamento o consentimiento;
- versión del aviso;
- canal y momento;
- vigencia y revocación;
- terceros o encargados;
- retención, anonimización o eliminación aplicable.

La revocación de marketing no elimina automáticamente:

- pedidos;
- facturas;
- pagos;
- ledgers de fidelización;
- reclamos;
- entregas;
- auditoría;
- obligaciones legales o contractuales.

Las solicitudes de acceso, rectificación, prueba, revocación o supresión se resolverán en `INFO-DOM-009`, sin permitir alteración destructiva de hechos empresariales.

---

#### 10. Firma, PIN y confirmación del cliente

Una transición podrá exigir PIN, OTP, reautenticación, firma dibujada, firma electrónica, fotografía o una combinación proporcional al riesgo.

```text
FIRMA DIBUJADA
≠ IDENTIDAD COMPROBADA
≠ RELACIÓN CON EL RECURSO
≠ CONSENTIMIENTO GENERAL
≠ APROBACIÓN INTERNA
```

La evidencia deberá vincularse al contenido mostrado, versión, pedido o entrega, actor, dispositivo, canal y momento. No podrá reutilizarse para otra transición o después de modificar cantidades, destinatario, precio, condiciones o documento.

En tablet compartida:

- la sesión laboral permanece separada;
- no se almacenan credenciales cliente;
- se limpia la superficie al terminar;
- el trabajador no firma como cliente;
- la captura offline queda pendiente de revalidación y sincronización idempotente.

---

#### 11. Integridad transaccional

Los procesos cliente deberán impedir duplicar:

- pedidos;
- cobros;
- reembolsos;
- puntos;
- redenciones;
- compensaciones;
- reservas;
- entregas;
- reclamos;
- respuestas incentivadas.

Reintentos y conciliación conservarán identificadores internos y externos, idempotencia, correlación, versión y resultado final.

La fusión de un cliente anónimo con uno identificado requerirá prueba suficiente y no podrá mezclar pedidos, consentimientos, puntos o historiales de personas diferentes.

---

#### 12. Matriz canónica completa

| Proceso      | Propósito empresarial                                                                                                                                                                      | Clasificación cliente               | Identidad o relación                                                                                                            | Participación/exposición permitida                                                                                                                                      | Frontera interna                                                                                                                                                          | Evidencia y controles mínimos                                                                                                                        |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | Publicar únicamente certificaciones, avisos o restricciones autorizadas; no listas internas, responsables ni hallazgos de trabajadores.                                 | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | Exponer solo catálogo comercial aprobado: nombre, presentación, unidad y atributos autorizados; no costos, proveedores ni equivalencias internas sensibles.             | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No exponer receta, fórmula, rendimiento ni sustituciones internas; únicamente proyecciones aprobadas como alérgenos o información permitida.                            | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `CLIENTE_DESTINATARIO`              | Visitante anónimo, cliente identificado o segmento autorizado.                                                                  | Consultar oferta, disponibilidad y restricciones publicadas; recibir personalización solo con fundamento o consentimiento aplicable.                                    | La superficie cliente consume una proyección versionada; no expone inventario interno, capacidad productiva, reglas comerciales privadas ni causas operativas.            | Versión de oferta, canal, vigencia, sede, idioma, segmentación, consentimiento cuando aplique y trazabilidad de publicación.                         |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | Publicar alérgenos, restricciones y criterios autorizados con versión vigente; no evidencia interna, investigaciones o proveedores.                                     | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente; la condición del inventario bloquea o retira oferta mediante procesos propietarios sin revelar lotes o mermas internas.                          | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente; la promesa comercial consume capacidad publicada sin mostrar planes, turnos, faltantes ni prioridades internas.                                  | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente; la ejecución produce trazabilidad interna y solo libera resultados autorizados hacia venta o información pública.                                | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente; liberación o retiro modifica disponibilidad/proyección, sin exponer controles, responsables ni investigación.                                    | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente; etiqueta y empaque aprobados pueden ser visibles, pero la operación interna permanece protegida.                                                 | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente; reproceso, merma y rendimiento permanecen internos salvo aviso, retiro o reclamo gestionado por otro proceso.                                    | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `CLIENTE_PARTICIPANTE`              | Comensal o responsable de mesa, identificado o anónimo según el canal.                                                          | Solicitar productos, confirmar cambios, recibir servicio, pedir cuenta y pagar directamente o mediante atención asistida.                                               | El cliente no accede a comandas internas, asignación de trabajadores, tiempos individuales, notas laborales ni controles de cocina; el personal no suplanta al cliente.   | Sesión o mesa, pedido, versión de precios, consentimientos, actor asistente cuando exista, confirmaciones, pago y cierre correlacionados.            |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `CLIENTE_PARTICIPANTE`              | Comprador, pagador y receptor; pueden ser personas distintas.                                                                   | Crear o confirmar pedido, aceptar sustituciones, pagar y recibir el producto mediante canal directo o atención asistida.                                                | No se exponen stock por ubicación, costos, producción, caja interna ni datos de otros clientes; la entrega no se presume por el cobro.                                    | Pedido, canal, sede, precios, pagador, receptor, entrega, comprobante, idempotencia y auditoría del actor asistente.                                 |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `CLIENTE_PARTICIPANTE`              | Cliente del canal externo, pagador y receptor; el marketplace o integrador es un actor técnico separado.                        | Originar y consultar el pedido mediante el canal autorizado y recibir estados externos conciliados.                                                                     | El canal no se convierte en cliente ni en autoridad canónica; sus estados y payloads se validan, transforman y concilian antes de afectar el proceso interno.             | Identificadores externo e interno, versión del contrato, firma o autenticación técnica, consentimiento, correlación, idempotencia y reconciliación.  |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `CLIENTE_PARTICIPANTE`              | Cuenta B2B, representante autorizado, contacto operativo, pagador y receptor.                                                   | Solicitar cotización, aportar requisitos, aprobar propuesta comercial, aceptar cambios y recibir o rechazar entregables.                                                | La aprobación comercial del cliente no sustituye aprobación interna de capacidad, precio excepcional, crédito, producción, facturación o compensación.                    | Entidad, representantes y facultades, propuesta/versiones, aceptación, capacidad, condiciones, facturación, entrega y evidencia.                     |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `CLIENTE_PARTICIPANTE`              | Titular o representante autorizado del pedido; pagador y receptor cuando corresponda.                                           | Solicitar modificación, sustitución, cancelación o devolución y consultar su resultado.                                                                                 | La solicitud no ejecuta por sí sola la anulación, reversión de inventario, reembolso, compensación ni corrección fiscal; cada efecto conserva autoridad y estado propios. | Relación con el pedido, acción solicitada, motivo, estado y versión, decisión, efectos derivados, notificación e idempotencia.                       |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `CLIENTE_PARTICIPANTE`              | Cliente, pagador, titular del medio y beneficiario del pedido, diferenciados cuando no coincidan.                               | Autorizar o presentar el pago, consultar resultado y recibir soporte permitido.                                                                                         | El proveedor de pago confirma una operación técnica; no determina identidad laboral, entrega, cierre de caja, fidelización ni conciliación final.                         | Pedido, intento y transacción, pagador, monto/moneda originales, proveedor, autorización, resultado, conciliación, soporte e idempotencia.           |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `CLIENTE_REFERENCIADO`              | Referencia condicional a transacciones, pagadores o clientes; el cliente no es actor del cierre.                                | Ninguna acción directa. Solo puede recibir comprobantes o correcciones mediante el proceso comercial correspondiente.                                                   | El cierre usa referencias mínimas; no requiere perfil completo, hábitos, documentos personales ni navegación del cliente.                                                 | Caja, turno, ventas, medios, transacciones, diferencias y referencias minimizadas; acceso restringido y auditoría.                                   |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `CLIENTE_NUCLEO`                    | Cliente autenticado o identificado, con identidad comercial separada de cualquier identidad laboral.                            | Crear o completar perfil permitido, gestionar consentimientos, identificarse, acumular o redimir mediante contratos autorizados y consultar ledger e historial propios. | El cliente no puede modificar saldo, rol, estado, reglas, recompensas, transacciones o ledger; el personal ve únicamente la proyección mínima necesaria.                  | Identidad, relación Auth, consentimientos/versiones, ledger, transacción origen, QR o token, sede, expiración, idempotencia y auditoría.             |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `CLIENTE_NUCLEO`                    | Reclamante, comprador, pagador, receptor o representante con relación demostrable.                                              | Crear reclamo, aportar evidencia, consultar estado, aceptar comunicación y recibir resolución o compensación autorizada.                                                | El cliente no elige unilateralmente causa, responsabilidad, valor o mecanismo de compensación; tampoco accede a investigación interna o datos de trabajadores.            | Relación con pedido/entrega/pago, hechos alegados, evidencia, consentimiento, clasificación, investigación, decisión, compensación y cierre.         |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `CLIENTE_NUCLEO`                    | Titular de reserva, organizador, asistente o contacto autorizado.                                                               | Solicitar reserva o evento, aportar datos mínimos, aceptar condiciones, modificar o cancelar dentro de reglas y recibir comunicaciones.                                 | La solicitud no bloquea capacidad ni confirma evento hasta la aceptación canónica; comunicaciones comerciales y operativas mantienen finalidades separadas.               | Contacto, asistentes mínimos, sede/fecha/capacidad, condiciones/versiones, consentimiento, confirmación, cambios, cancelación y comunicaciones.      |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `CLIENTE_REFERENCIADO`              | Cliente o destinatario referenciado, contacto de entrega y dirección autorizada.                                                | Ninguna acción directa dentro de la planificación; puede aportar instrucciones mediante el pedido o portal correspondiente.                                             | La planificación interna expone al conductor solo lo necesario; no revela historial comercial, puntos, reclamaciones, datos laborales ni notas ajenas a la entrega.       | Pedido/entrega, destinatario, contacto mínimo, dirección, ventana, restricciones, consentimiento/fundamento, ruta y acceso auditado.                 |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `CLIENTE_PARTICIPANTE`              | Destinatario, cliente, representante autorizado o receptor alterno validado.                                                    | Consultar estado permitido, presentar PIN o evidencia, aceptar, rechazar o reportar novedad de entrega.                                                                 | El conductor no firma por el receptor; una firma dibujada o PIN aislado no sustituye identidad, relación, contenido mostrado ni prueba de custodia.                       | Entrega, destinatario, receptor efectivo, PIN/hash o firma, contenido y versión, ubicación/tiempo según política, evidencia, novedad e idempotencia. |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `CLIENTE_PARTICIPANTE`              | Cliente o destinatario final; transportador, plataforma y repartidor son actores externos separados.                            | Recibir seguimiento permitido, confirmar entrega o reportar incidencia por el canal autorizado.                                                                         | El estado del tercero no cierra automáticamente la entrega ni revela datos internos; se exige conciliación entre prueba externa y resultado empresarial.                  | Entrega interna/externa, tercero, receptor, prueba, timestamps, contrato, webhooks, reintentos, conciliación y excepción.                            |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `CLIENTE_REFERENCIADO`              | Referencia condicional a cuenta cliente, factura, pedido o recaudo; el cliente no es actor del registro contable.               | Ninguna acción directa; consulta de documentos comerciales se atiende mediante una proyección o proceso autorizado.                                                     | Contabilidad no reutiliza el perfil completo del cliente ni expone asientos, centros de costo, cierres o información de terceros.                                         | Evento origen, contraparte y documento mínimos, cuenta contable, periodo, monto, correlación, restricción de acceso y auditoría.                     |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `CLIENTE_NUCLEO`                    | Cuenta cliente o B2B, deudor, pagador y contacto autorizado.                                                                    | Consultar obligación permitida, recibir comunicaciones, realizar o acreditar pago y controvertir diferencias mediante canal controlado.                                 | El cliente no aplica pagos, condona deuda, modifica vencimientos ni accede a notas internas; cobranza respeta consentimiento, finalidad y horarios autorizados.           | Cuenta/contraparte, obligación, documentos, vencimientos, comunicaciones, recaudo, aplicación, diferencia, acuerdos y auditoría.                     |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente; solo se comunica indisponibilidad o condición necesaria mediante canales autorizados, sin detalle de infraestructura o proveedores.              | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `CLIENTE_DESTINATARIO`              | Audiencia anónima, cliente, segmento o contacto con consentimiento aplicable.                                                   | Recibir contenido o promoción vigente y ejercer preferencias, revocación o salida del canal cuando corresponda.                                                         | La segmentación no revela criterios sensibles; el contenido no concede automáticamente precio, stock, recompensa o derecho no confirmado por el proceso propietario.      | Pieza/versiones, audiencia, canal, vigencia, finalidad, consentimiento, exclusiones, publicación, retiro y medición agregada.                        |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `CLIENTE_NUCLEO`                    | Prospecto, lead, cliente potencial, cuenta B2B o contacto autorizado.                                                           | Iniciar consulta, autorizar contacto, aportar necesidades y recibir respuesta u oferta mediante canales permitidos.                                                     | Un mensaje no implica consentimiento comercial ilimitado; la oportunidad interna, scoring y notas no se exponen al contacto ni se usan fuera de finalidad.                | Origen, identidad/contacto mínimo, finalidad, consentimiento, oportunidad, responsable, comunicaciones, resultado y retención.                       |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente por defecto; los datos identificables requieren finalidad específica y los resultados se publican agregados o anonimizados.                       | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `IMPACTO_CLIENTE_SIN_PARTICIPACION` | Ninguna identidad cliente requerida para ejecutar; consumidores afectados de forma agregada o indirecta.                        | No hay acción cliente dentro de continuidad; estados públicos y alternativas se comunican mediante proyecciones autorizadas y sin arquitectura interna.                 | El proceso conserva actores laborales/técnicos y datos internos; cualquier salida cliente se materializa como proyección mínima, versionada y autorizada.                 | Estado y versión canónicos; publicación o bloqueo correlacionado; minimización; auditoría; pruebas de no exposición.                                 |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `CLIENTE_NUCLEO`                    | Cliente, comensal, comprador, receptor o encuestado anónimo/identificado.                                                       | Responder voluntariamente, retirar consentimiento cuando aplique y recibir cierre solo si abrió un caso separado.                                                       | La encuesta no crea automáticamente reclamo, compensación ni puntos; respuestas identificables y anónimas siguen contratos distintos.                                     | Muestra, canal, versión, consentimiento, anonimato/identidad, respuesta, incentivo separado, sesgo, retención y análisis.                            |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `NO_DOMINIO_CLIENTE`                | No aplica. Candidatos, trabajadores, proveedores, autoridades, asesores y servicios técnicos no se reinterpretan como clientes. | Ninguna pantalla, mutación o autorización cliente dentro de este proceso. Cualquier comunicación externa se deriva mediante un proceso cliente explícito.               | La identidad cliente no concede lectura ni acción sobre expedientes, operación, finanzas, seguridad, trabajadores, proveedores o configuración.                           | Identidad laboral o técnica válida; permiso; alcance; finalidad; auditoría; ausencia de rutas o proyecciones cliente no declaradas.                  |

---

#### 13. Resumen por clasificación

##### 13.1. Procesos `CLIENTE_NUCLEO`

```text
VPROC-0045 — Identidad y fidelización
VPROC-0046 — Reclamos, devoluciones y compensaciones
VPROC-0047 — Reservas, eventos y comunicaciones
VPROC-0053 — Cartera y recaudo de cliente/B2B
VPROC-0057 — Consultas y oportunidades comerciales
VPROC-0068 — Medición de satisfacción
```

##### 13.2. Procesos `CLIENTE_PARTICIPANTE`

```text
VPROC-0038 — Servicio en mesa
VPROC-0039 — Venta de mostrador o para llevar
VPROC-0040 — Pedidos de canales externos
VPROC-0041 — Catering o venta B2B
VPROC-0042 — Modificación, cancelación y devolución
VPROC-0043 — Pagos comerciales
VPROC-0049 — Ruta y entrega
VPROC-0050 — Entrega de tercero
```

##### 13.3. Procesos con exposición limitada

```text
CLIENTE_DESTINATARIO
VPROC-0017, VPROC-0056

CLIENTE_REFERENCIADO
VPROC-0044, VPROC-0048, VPROC-0051

IMPACTO_CLIENTE_SIN_PARTICIPACION
VPROC-0014, VPROC-0015, VPROC-0016, VPROC-0018, VPROC-0027,
VPROC-0033, VPROC-0034, VPROC-0035, VPROC-0036, VPROC-0037,
VPROC-0055, VPROC-0061, VPROC-0062
```

---

#### 14. Relación con aplicaciones

Esta tarea no cambia la propiedad aprobada en `PROC-CAT-005`.

- PASS conserva identidad y fidelización del cliente.
- PULSO conserva ventas, pedidos y cobros que le correspondan.
- NEXO conserva logística, custodia y prueba de entrega que le correspondan.
- AURA conserva contenido y campañas que le correspondan.
- NUMERA conserva efectos financieros y contables, sin convertirse en perfil cliente.
- VISO presenta seguimiento interno autorizado, no una cuenta cliente universal.
- Los canales externos actúan mediante adaptadores y contratos, nunca como fuente absoluta de identidad o resultado.

Una misma experiencia cliente podrá orquestar varios dominios, pero cada escritura deberá ejecutarse mediante la aplicación propietaria o servicio autorizado.

---

#### 15. Decisiones reservadas

| Decisión                                            | Tarea responsable                     |
| --------------------------------------------------- | ------------------------------------- |
| procesos sin actor humano directo                   | `PROC-ACTOR-009`                      |
| prohibición final de autorización por nombre de rol | `PROC-ACTOR-010`                      |
| pantallas cliente                                   | `PROC-SCREEN-011`                     |
| actores objetivo de cada pantalla                   | `PROC-SCREEN-012`                     |
| información sensible visible                        | `PROC-SCREEN-022`                     |
| permisos de lectura y acción                        | `PROC-SCREEN-023`, `PROC-SCREEN-024`  |
| experiencia móvil de PASS                           | `PASS-UX-001` a `PASS-UX-013`         |
| integración PULSO–PASS                              | `PASS-INT-001`, `PASS-INT-002`        |
| administración laboral de clientes                  | `PASS-INT-004`                        |
| separación cliente–trabajador                       | `PASS-INT-005`                        |
| consentimiento, derechos y firma                    | `INFO-DOM-008` a `INFO-DOM-011`       |
| protección por finalidad y relación                 | `INFO-AUTH-001` a `INFO-AUTH-004`     |
| archivos y evidencia                                | `EVID-ARC-001` a `EVID-ARC-010`       |
| implementación y cutover                            | paquetes E3, E4 y E5 correspondientes |

---

#### 16. Requisitos de prueba derivados

Esta tarea genera:

```text
TREQ-PROC-175
TREQ-PROC-176
TREQ-PROC-177
TREQ-PROC-178
TREQ-PROC-179
TREQ-PROC-180
TREQ-PROC-181
TREQ-PROC-182
```

El detalle canónico se incorpora exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 17. Criterios de aceptación

- [ ] Los 69 procesos tienen exactamente una clasificación cliente.
- [ ] Los conteos son 6 núcleo, 8 participante, 2 destinatario, 3 referenciado, 13 impacto sin participación y 37 fuera del dominio.
- [ ] Cliente, empleado, proveedor, canal, pagador y receptor permanecen separados.
- [ ] Toda acción cliente exige relación explícita con el recurso.
- [ ] La atención asistida conserva cliente y trabajador por separado.
- [ ] Ningún proceso interno queda expuesto por “impactar al cliente”.
- [ ] Las proyecciones ocultan datos internos y conservan estados honestos.
- [ ] Consentimiento, finalidad, derechos, retención y terceros tienen tarea responsable.
- [ ] Pagos, pedidos, puntos, entregas y compensaciones son idempotentes y conciliables.
- [ ] Firmas, PIN y confirmaciones quedan ligados a contenido, versión, actor y transición.
- [ ] Tablets compartidas no conservan sesiones ni datos cliente después de la interacción.
- [ ] No se implementó código, migraciones ni cambios en Supabase.
- [ ] Los requisitos nuevos se encuentran en el registro canónico completo.
- [ ] `PROC-ACTOR-009` permanece sin iniciar.

---

#### 18. Estado

```text
APROBADA
```

No se inicia `PROC-ACTOR-009` hasta aprobación expresa de esta tarea.


### ✅ PROC-ACTOR-009 — Definir procesos de sistema sin actor humano directo

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-008 — Definir procesos del dominio cliente` — APROBADA  
**Siguiente tarea reservada:** `PROC-ACTOR-010 — Prohibir autorización derivada únicamente del nombre del rol`  
**Artefacto producido:** `PROC-SYSTEM-ACTOR-CLASSIFICATION-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Procesos que admiten actor de sistema directo en alguna etapa:** **55**  
**Procesos sin actor de sistema directo:** **14**  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Definir en qué procesos un principal técnico puede iniciar, vigilar o ejecutar acciones empresariales sin una persona operando directamente en ese instante, y establecer límites que impidan convertir cron, webhooks, jobs, triggers, colas, dispositivos o credenciales privilegiadas en autoridades empresariales universales.

La tarea distingue:

```text
QUIÉN EJECUTA TÉCNICAMENTE
≠
QUIÉN DECIDIÓ
≠
QUIÉN AUTORIZÓ
≠
QUIÉN REALIZÓ EL HECHO FÍSICO
≠
QUIÉN ACEPTÓ O FIRMÓ
```

---

#### 2. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-008`;
- `SHELL-CON-017 — Crear contrato de principal técnico de integración`;
- `SHELL-CON-023 — Crear contrato de idempotencia y conciliación`;
- `SUPA-AUD-011 — Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema`;
- `SUPA-AUD-014 — Auditar Edge Functions, webhooks, cron, colas y automatizaciones`;
- `SUPA-ARC-020 — Definir arquitectura de Edge Functions, webhooks y cron`;
- `QUEUE-ARC-001` a `QUEUE-ARC-008`;
- `INT-DB-001`, `INT-DB-005`, `INT-DB-007`;
- `INT-EXT-002`, `INT-EXT-010` a `INT-EXT-012`, `INT-EXT-017`;
- `AUTH-DB-010`, `AUTH-DB-024`;
- los contratos aprobados de estados, transiciones, eventos, auditoría, métricas, evidencia y actores.

No se crea todavía implementación física de identidades técnicas, colas, cron, Edge Functions, webhooks ni RPC.

---

#### 3. Qué es un actor de sistema

Un actor de sistema es un **principal técnico identificable** que ejecuta una acción declarada mediante un contrato versionado.

Tipos permitidos:

| Tipo                    | Uso                                                          |
| ----------------------- | ------------------------------------------------------------ |
| `SCHEDULER_JOB`         | Trabajo iniciado por calendario o vencimiento.               |
| `DOMAIN_EVENT_CONSUMER` | Reacción a un evento empresarial canónico.                   |
| `INTEGRATION_ADAPTER`   | Entrada o salida con un sistema externo.                     |
| `WORKFLOW_ORCHESTRATOR` | Coordinación determinista de etapas y handoffs.              |
| `RULE_ENGINE`           | Evaluación de reglas versionadas sin discreción abierta.     |
| `BATCH_PROCESSOR`       | Cálculo, conciliación o materialización reproducible.        |
| `SYSTEM_MONITOR`        | Observación, alerta y contención segura.                     |
| `DOCUMENT_WORKER`       | Generación, publicación, versionado o retiro documental.     |
| `NOTIFICATION_WORKER`   | Entrega de mensajes desde una decisión o evento previo.      |
| `DEVICE_SERVICE`        | Transporte técnico de evidencia originada en un dispositivo. |

Los nombres específicos usados en la matriz son especializaciones de estas categorías.

```text
service_role
≠ actor de sistema
≠ permiso universal
≠ propietario del proceso
```

`service_role` o una credencial equivalente es un medio técnico de autenticación. La auditoría deberá resolver además el servicio, versión, proceso, acción, alcance y causa concreta.

---

#### 4. Modos de clasificación

| Clasificación                    | Cantidad | Regla                                                                                                                                                               |
| -------------------------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SISTEMA_EJECUTOR_PRINCIPAL`     |    **6** | El sistema ejecuta directamente la etapa técnica ordinaria y puede cerrarla sin presencia humana en ese instante, después de una configuración o aprobación válida. |
| `SISTEMA_EJECUTOR_PARCIAL`       |   **24** | Ejecuta uno o más pasos deterministas, pero una persona, cliente, contraparte o hecho previo conserva la iniciación, decisión, custodia o aceptación.               |
| `SISTEMA_DISPARADOR_O_VIGILANTE` |   **25** | Detecta una condición, abre o actualiza un caso, alerta o aplica contención segura; no decide el resultado material.                                                |
| `SIN_ACTOR_SISTEMA_DIRECTO`      |   **14** | Ninguna transición sustantiva puede atribuirse únicamente al sistema; el hecho exige actor humano, cliente o contraparte real.                                      |

Resultado:

```text
ACTOR DE SISTEMA DIRECTO EN ALGUNA ETAPA   55
SIN ACTOR DE SISTEMA DIRECTO               14
TOTAL                                      69
```

La clasificación expresa el **máximo nivel permitido de participación técnica**, no obliga a automatizar el proceso.

---

#### 5. Contrato mínimo del principal técnico

Toda acción atribuida a sistema deberá conservar como mínimo:

```text
service_principal_id
principal_type
service_name
service_version
source_application
process_id
process_instance_id
stage_id
action_type
allowed_capability
scope
trigger_type
trigger_reference
rule_id
rule_version
command_id
idempotency_key
correlation_id
causation_id
input_reference_or_hash
output_reference_or_hash
action_result
occurred_at
recorded_at
trace_context
```

Cuando la acción derive de una decisión humana previa también deberá conservar:

```text
approved_by_actor_id
authorization_or_decision_id
approved_scope
approved_at
valid_until
```

No se inventará `employee_id`, rol base, rol operativo, turno, check-in o firma humana para completar una acción técnica.

---

#### 6. Regla de autorización

```text
PRINCIPAL TÉCNICO AUTENTICADO
+
CAPACIDAD DE SERVICIO EXPLÍCITA
+
PROCESO Y ACCIÓN DECLARADOS
+
REGLA Y VERSIÓN VIGENTES
+
ALCANCE ACOTADO
+
TRIGGER AUTÉNTICO Y CORRELACIONADO
+
ESTADO Y PRECONDICIONES VÁLIDOS
+
IDEMPOTENCIA
=
ACCIÓN DE SISTEMA AUTORIZABLE
```

Quedan prohibidos:

- bypass por `service_role`;
- RPC o funciones que acepten cualquier proceso o tabla;
- jobs con acceso transversal no justificado;
- uso de una cuenta técnica compartida sin identidad del servicio;
- acciones fuera de la aplicación propietaria;
- reglas embebidas sin versión ni auditoría;
- atribución retrospectiva a un trabajador;
- cierre empresarial basado únicamente en un `200 OK` o ejecución técnica exitosa.

---

#### 7. Acciones que sí puede ejecutar el sistema

Con contrato aprobado, un actor de sistema podrá:

- validar integridad y precondiciones;
- calcular valores derivados reproducibles;
- generar identificadores, documentos, etiquetas o proyecciones;
- propagar una versión previamente aprobada;
- consumir y emitir eventos;
- normalizar y deduplicar mensajes externos;
- registrar un asiento o ledger estrictamente derivado;
- programar y entregar notificaciones;
- crear tareas, alertas o casos por umbral;
- aplicar una retención o bloqueo preventivo expresamente autorizado;
- ejecutar revocación o expiración segura previamente definida;
- reconciliar estados técnicos y empresariales;
- reintentar con límites, backoff y clave idempotente;
- enviar a cola de fallos cuando no pueda continuar con seguridad.

---

#### 8. Decisiones que exigen persona autorizada

Un actor de sistema no podrá decidir por sí solo:

- contratación, rechazo de candidato o retiro laboral;
- publicación de programación laboral o excepción;
- aceptación de riesgo residual;
- diagnóstico médico, legal o disciplinario;
- selección de proveedor;
- aprobación de compra o gasto;
- recepción física, conteo o ajuste de inventario;
- transferencia de custodia sin entregador y receptor;
- liberación, rechazo o reproceso de calidad;
- producción, empaque, limpieza, mantenimiento o entrega física;
- compensación de cliente;
- diferencia de caja;
- autorización o liberación de pago;
- concesión o ampliación de acceso;
- evaluación de desempeño;
- aprobación presupuestal;
- firma, aceptación o testimonio en nombre de una persona.

El sistema podrá recomendar, calcular, bloquear preventivamente o solicitar revisión, pero no sustituir la autoridad.

---

#### 9. Triggers y sistemas externos

El trigger no es el actor que decide.

```text
WEBHOOK EXTERNO
        ↓
ADAPTADOR TÉCNICO INTERNO
        ↓
VALIDACIÓN DE ORIGEN, FIRMA, TIMESTAMP Y REPLAY
        ↓
COMANDO O EVENTO INTERNO IDEMPOTENTE
        ↓
REGLAS DEL PROCESO PROPIETARIO
```

Se conservarán separados:

- proveedor externo;
- principal técnico de la integración;
- cliente, trabajador o contraparte relacionada;
- evento recibido;
- decisión empresarial;
- efecto interno;
- respuesta técnica enviada.

Un webhook podrá iniciar una evaluación, pero no probará por sí solo pago, entrega, recepción, aprobación o cierre.

---

#### 10. Tiempo, reintentos, replay y concurrencia

Todo trabajo asíncrono deberá definir:

- instante empresarial y de procesamiento;
- zona horaria y calendario aplicable;
- prioridad y vencimiento;
- clave idempotente;
- política de reintentos y backoff;
- límite máximo;
- cancelación antes y durante ejecución;
- bloqueo o control de concurrencia;
- orden causal;
- detección de replay;
- cola de fallos;
- recuperación manual;
- efecto de backfill y restatement.

```text
REINTENTO
≠ NUEVA DECISIÓN
≠ NUEVO PAGO
≠ NUEVA ENTREGA
≠ NUEVO MOVIMIENTO
≠ NUEVA FIRMA
```

Los datos faltantes o ambiguos no se tratarán como cero, éxito o aprobación implícita.

---

#### 11. Dispositivos compartidos y operación offline

Un dispositivo compartido, lector, impresora o aplicación offline no es actor empresarial autónomo.

```text
DISPOSITIVO / COLA OFFLINE
→ transporta comando y evidencia

TRABAJADOR ORIGINAL
→ conserva atribución del hecho

SERVICIO DE SINCRONIZACIÓN
→ conserva atribución técnica del procesamiento
```

Al sincronizar se conservarán simultáneamente:

- principal técnico del dispositivo o servicio;
- actor humano original cuando exista;
- momento del hecho y momento de sincronización;
- turno, sede, área y rol originales;
- estado y versión observados;
- evidencia y firma vinculadas;
- idempotencia y resultado de revalidación.

El servicio de sincronización no podrá reemplazar al trabajador ni aplicar una firma pendiente a otra persona, recurso, versión o transición.

---

#### 12. Auditoría y evidencia

La auditoría distinguirá:

```text
DECISIÓN HUMANA PREVIA
COMANDO
TRABAJO EN COLA
INTENTO DE EJECUCIÓN
RESULTADO TÉCNICO
EFECTO EMPRESARIAL
EVENTO EMITIDO
NOTIFICACIÓN
```

Un log técnico no sustituye el registro empresarial ni la evidencia humana.

La evidencia producida por sistema deberá indicar que es:

- calculada;
- generada;
- recibida de tercero;
- materializada desde evento;
- publicada automáticamente;
- reconciliada;
- reintentada o reproducida.

Nunca se etiquetará como observación física, firma o aprobación humana.

---

#### 13. Matriz canónica completa

| Proceso      | Propósito empresarial                                                                                                                                                                      | Clasificación de sistema         | Principal técnico permitido      | Acción directa permitida                                                                                                                                                     | Frontera humana obligatoria                                                                                                   | Evidencia y controles mínimos                                                                                                                                                                                                                 |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------- | -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `SIN_ACTOR_SISTEMA_DIRECTO`      | `WORKFLOW_ORCHESTRATOR`          | Recordar compromisos, consolidar evidencia y presentar información sin crear la decisión empresarial.                                                                        | Una persona autorizada formula, delibera, decide, aprueba y asume la responsabilidad.                                         | `principal_type=WORKFLOW_ORCHESTRATOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.          |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `SISTEMA_EJECUTOR_PARCIAL`       | `MASTER_DATA_WORKER`             | Validar integridad, unicidad y jerarquía; propagar una versión organizativa ya aprobada a consumidores.                                                                      | La creación, fusión, traslado, activación o cierre de entidades, sedes y áreas requiere autoridad humana.                     | `principal_type=MASTER_DATA_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.             |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `SISTEMA_EJECUTOR_PARCIAL`       | `POLICY_DISTRIBUTION_WORKER`     | Publicar, fechar, distribuir y retirar versiones previamente aprobadas; aplicar vigencias deterministas.                                                                     | Redacción, delegación, excepción, aprobación y revocación discrecional permanecen humanas.                                    | `principal_type=POLICY_DISTRIBUTION_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `SISTEMA_DISPARADOR_O_VIGILANTE` | `SLA_MONITOR`                    | Detectar vencimientos, bloqueos o handoffs no aceptados y abrir una alerta o escalamiento correlacionado.                                                                    | Aceptar, reasignar, renegociar, rechazar o cerrar el compromiso requiere actor humano.                                        | `principal_type=SLA_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.                    |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `SIN_ACTOR_SISTEMA_DIRECTO`      | `RECRUITMENT_SUPPORT_SERVICE`    | Desduplicar postulaciones, validar campos objetivos y coordinar agenda; no decidir idoneidad.                                                                                | Preselección sustantiva, entrevista, rechazo, oferta y contratación son decisiones humanas auditables.                        | `principal_type=RECRUITMENT_SUPPORT_SERVICE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.    |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `SISTEMA_EJECUTOR_PARCIAL`       | `ONBOARDING_ORCHESTRATOR`        | Crear checklist, solicitar documentos, emitir tareas y ejecutar aprovisionamientos ya autorizados.                                                                           | La vinculación, identidad laboral, rol, sede, excepciones y habilitación final requieren aprobación humana.                   | `principal_type=ONBOARDING_ORCHESTRATOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.        |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `SISTEMA_EJECUTOR_PARCIAL`       | `SCHEDULING_ENGINE`              | Calcular borradores, detectar solapes, restricciones y descansos, y notificar una programación publicada.                                                                    | Publicar, alterar o aprobar excepciones de horario requiere autoridad laboral humana.                                         | `principal_type=SCHEDULING_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.              |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `SISTEMA_DISPARADOR_O_VIGILANTE` | `ATTENDANCE_ANOMALY_MONITOR`     | Detectar ausencia de marcación, duplicidad, desfase o inconsistencia y abrir caso de corrección.                                                                             | El sistema no fabrica asistencia ni decide una corrección; trabajador y autoridad aportan y aprueban evidencia.               | `principal_type=ATTENDANCE_ANOMALY_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `SISTEMA_DISPARADOR_O_VIGILANTE` | `WORKFORCE_CASE_MONITOR`         | Vigilar fechas, soportes, reemplazos y SLA; crear recordatorios o escalamiento.                                                                                              | Solicitud, valoración, decisión laboral y sustitución excepcional requieren personas autorizadas.                             | `principal_type=WORKFORCE_CASE_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.         |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `SISTEMA_EJECUTOR_PARCIAL`       | `PAYROLL_CALCULATION_WORKER`     | Calcular y reconciliar un paquete desde hechos aprobados, aplicar reglas versionadas y generar salida controlada.                                                            | Aprobar novedades, excepciones, pago y liberación del paquete exige segregación humana.                                       | `principal_type=PAYROLL_CALCULATION_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `SISTEMA_DISPARADOR_O_VIGILANTE` | `OFFBOARDING_TRIGGER`            | Activar checklist por hecho laboral vigente y ejecutar revocaciones programadas ya autorizadas.                                                                              | La terminación, fecha efectiva, liquidación, excepciones y cierre laboral son decisiones humanas.                             | `principal_type=OFFBOARDING_TRIGGER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.            |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `SISTEMA_DISPARADOR_O_VIGILANTE` | `RISK_CONTROL_MONITOR`           | Programar inspecciones, detectar controles vencidos y abrir acciones correctivas.                                                                                            | Evaluar riesgo, aceptar riesgo residual, aprobar tratamiento o cerrar hallazgos requiere autoridad humana.                    | `principal_type=RISK_CONTROL_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.           |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `SISTEMA_DISPARADOR_O_VIGILANTE` | `INCIDENT_DETECTION_SERVICE`     | Recibir alerta técnica o sensor, abrir incidente, preservar tiempo y notificar respuesta.                                                                                    | La atención física, clasificación médica/legal, investigación y cierre requieren personas competentes.                        | `principal_type=INCIDENT_DETECTION_SERVICE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `SIN_ACTOR_SISTEMA_DIRECTO`      | `COMPLIANCE_SUPPORT_SERVICE`     | Entregar procedimiento vigente, checklist y temporización; no afirmar que el control fue ejecutado.                                                                          | La observación, medición, limpieza, verificación y firma deben provenir del trabajador o inspector real.                      | `principal_type=COMPLIANCE_SUPPORT_SERVICE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `SISTEMA_EJECUTOR_PARCIAL`       | `PRODUCT_MASTER_WORKER`          | Calcular equivalencias, validar dimensiones, unicidad y consistencia, y publicar versiones aprobadas.                                                                        | Crear producto, cambiar unidad, equivalencia o presentación y aprobar vigencia requiere autoridad humana.                     | `principal_type=PRODUCT_MASTER_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.          |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `SISTEMA_EJECUTOR_PARCIAL`       | `RECIPE_CALCULATION_WORKER`      | Calcular rendimientos, escalados, costos y alérgenos; publicar una versión después de su aprobación.                                                                         | Prueba física, evaluación sensorial, decisión de fórmula y aprobación final son humanas.                                      | `principal_type=RECIPE_CALCULATION_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.      |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `SISTEMA_EJECUTOR_PRINCIPAL`     | `OFFER_PUBLICATION_WORKER`       | Propagar automáticamente oferta y disponibilidad aprobadas, aplicar vigencia y retirar publicaciones por regla canónica.                                                     | Precio, contenido, restricciones, excepciones y versión publicable deben haber sido aprobados previamente.                    | `principal_type=OFFER_PUBLICATION_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.       |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `SISTEMA_DISPARADOR_O_VIGILANTE` | `SPECIFICATION_CONFLICT_MONITOR` | Detectar versión vencida, conflicto de alérgeno, restricción o criterio faltante y bloquear publicación insegura.                                                            | Resolver el conflicto, cambiar especificación o aceptar excepción requiere responsable humano.                                | `principal_type=SPECIFICATION_CONFLICT_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas. |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `SISTEMA_DISPARADOR_O_VIGILANTE` | `REPLENISHMENT_SIGNAL_ENGINE`    | Detectar umbral, demanda o ruptura y crear una necesidad de compra trazable.                                                                                                 | Prioridad, cantidad excepcional, sustitución y decisión de comprar requieren revisión humana.                                 | `principal_type=REPLENISHMENT_SIGNAL_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.    |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `SISTEMA_EJECUTOR_PARCIAL`       | `SUPPLIER_COMPARISON_ENGINE`     | Normalizar cotizaciones y calcular comparables o puntuaciones con reglas transparentes.                                                                                      | Seleccionar proveedor, negociar, aceptar excepción o declarar conflicto de interés es humano.                                 | `principal_type=SUPPLIER_COMPARISON_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `SISTEMA_EJECUTOR_PARCIAL`       | `PURCHASE_ORDER_WORKER`          | Emitir, numerar, firmar técnicamente y transmitir una orden ya aprobada; rastrear recepción del proveedor.                                                                   | Aprobar gasto, urgencia, excepción, proveedor y condiciones requiere autoridad humana segregada.                              | `principal_type=PURCHASE_ORDER_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.          |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `SIN_ACTOR_SISTEMA_DIRECTO`      | `RECEIPT_SUPPORT_SERVICE`        | Preparar referencias, calcular diferencias y proponer efectos posteriores sin afirmar recepción física.                                                                      | Contar, inspeccionar, aceptar, rechazar y firmar la recepción corresponde al receptor real.                                   | `principal_type=RECEIPT_SUPPORT_SERVICE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.        |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `SISTEMA_EJECUTOR_PARCIAL`       | `LOCATION_MASTER_WORKER`         | Generar códigos, validar jerarquía, capacidad y compatibilidad, y publicar una configuración aprobada.                                                                       | Existencia física, condición, activación, bloqueo o retiro de LOC requiere verificación humana.                               | `principal_type=LOCATION_MASTER_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.         |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `SISTEMA_EJECUTOR_PARCIAL`       | `INVENTORY_POSTING_WORKER`       | Registrar movimiento derivado de un comando, escaneo o handoff válido y actualizar proyecciones de stock.                                                                    | El sistema no inventa origen, destino, cantidad ni custodia; el hecho físico debe tener actor y evidencia.                    | `principal_type=INVENTORY_POSTING_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.       |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `SISTEMA_EJECUTOR_PARCIAL`       | `CONSUMPTION_POSTING_WORKER`     | Aplicar conversiones y registrar consumo o traslado desde una orden autorizada y evidencia operacional.                                                                      | La retirada, uso o transferencia física debe ser confirmada por el trabajador real.                                           | `principal_type=CONSUMPTION_POSTING_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `SIN_ACTOR_SISTEMA_DIRECTO`      | `COUNT_VARIANCE_CALCULATOR`      | Calcular diferencia, materialidad y conciliación preliminar sin crear la observación ni el ajuste.                                                                           | El conteo, investigación y aprobación del ajuste requieren actores humanos distintos cuando aplique.                          | `principal_type=COUNT_VARIANCE_CALCULATOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.      |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `SISTEMA_DISPARADOR_O_VIGILANTE` | `CONDITION_ALERT_ENGINE`         | Detectar vencimiento, temperatura, cuarentena o pérdida y abrir caso; puede aplicar retención segura por regla aprobada.                                                     | Disposición, liberación, merma y excepción requieren decisión humana con evidencia.                                           | `principal_type=CONDITION_ALERT_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.         |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `SISTEMA_EJECUTOR_PARCIAL`       | `INTERNAL_SUPPLY_ORCHESTRATOR`   | Validar secuencia, cantidades, eventos, notificaciones y estados derivados de handoffs firmados.                                                                             | Preparar, entregar, transportar, recibir y aceptar diferencias exigen actores humanos efectivos.                              | `principal_type=INTERNAL_SUPPLY_ORCHESTRATOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.   |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `SIN_ACTOR_SISTEMA_DIRECTO`      | `ASSET_CUSTODY_SUPPORT`          | Recordar vencimientos y mostrar historial sin declarar préstamo, devolución o transferencia.                                                                                 | Toda transferencia de custodia requiere entregador, receptor y evidencia humana.                                              | `principal_type=ASSET_CUSTODY_SUPPORT`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.          |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `SISTEMA_DISPARADOR_O_VIGILANTE` | `MAINTENANCE_TRIGGER`            | Abrir mantenimiento por calendario, medidor o incidencia y aplicar bloqueo preventivo autorizado.                                                                            | Diagnóstico, reparación, liberación, garantía y disposición requieren responsable humano.                                     | `principal_type=MAINTENANCE_TRIGGER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.            |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `SISTEMA_DISPARADOR_O_VIGILANTE` | `FLEET_MONITOR`                  | Detectar mantenimiento, consumo, kilometraje o condición anómala y generar alerta o indisponibilidad segura.                                                                 | Conducción, inspección, carga de combustible y aceptación de disponibilidad requieren actor humano.                           | `principal_type=FLEET_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.                  |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `SIN_ACTOR_SISTEMA_DIRECTO`      | `REUSABLE_CUSTODY_SUPPORT`       | Calcular completitud y vencimientos sin afirmar entrega, retorno, pérdida o sustitución.                                                                                     | La custodia y condición física deben ser confirmadas por entregador y receptor.                                               | `principal_type=REUSABLE_CUSTODY_SUPPORT`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.       |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `SISTEMA_DISPARADOR_O_VIGILANTE` | `PRODUCTION_DEMAND_ENGINE`       | Convertir demanda, inventario y capacidad en propuesta priorizada y alertas de inviabilidad.                                                                                 | Publicar el plan, cambiar prioridades, aceptar faltantes o autorizar sustituciones es humano.                                 | `principal_type=PRODUCTION_DEMAND_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.       |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `SIN_ACTOR_SISTEMA_DIRECTO`      | `PRODUCTION_GUIDANCE_SERVICE`    | Mostrar receta vigente, secuencia y controles; calcular consumos solo después de confirmaciones válidas.                                                                     | Preparación, transformación, medición y declaración de producción corresponden al trabajador real.                            | `principal_type=PRODUCTION_GUIDANCE_SERVICE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.    |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `SISTEMA_DISPARADOR_O_VIGILANTE` | `QUALITY_HOLD_ENGINE`            | Detectar resultado fuera de criterio y aplicar retención preventiva o abrir decisión de calidad.                                                                             | Liberar, rechazar, reprocesar o aceptar desviación requiere autoridad humana competente.                                      | `principal_type=QUALITY_HOLD_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.            |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `SISTEMA_EJECUTOR_PARCIAL`       | `LABEL_AND_TRACEABILITY_WORKER`  | Generar lote, etiqueta y datos de trazabilidad desde producto y versión aprobados; registrar almacenamiento tras escaneo.                                                    | Empacar, verificar contenido, condición y ubicación física requiere trabajador identificado.                                  | `principal_type=LABEL_AND_TRACEABILITY_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.  |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `SISTEMA_EJECUTOR_PARCIAL`       | `YIELD_RECONCILIATION_WORKER`    | Calcular rendimiento, merma y balance desde cantidades confirmadas y aplicar reglas versionadas.                                                                             | Declarar causa, autorizar reproceso, aprovechamiento o cierre excepcional requiere personas autorizadas.                      | `principal_type=YIELD_RECONCILIATION_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.    |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `SIN_ACTOR_SISTEMA_DIRECTO`      | `SERVICE_FLOW_SUPPORT`           | Transportar pedidos y avisos entre estaciones sin declararse mesero, cocinero, entregador, pagador o receptor.                                                               | Tomar pedido, preparar, servir, aceptar cambios, cobrar y cerrar la mesa requieren actores humanos o cliente.                 | `principal_type=SERVICE_FLOW_SUPPORT`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.           |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `SISTEMA_EJECUTOR_PARCIAL`       | `COUNTER_SALE_ORCHESTRATOR`      | Validar precios, enrutar preparación y pago, emitir documentos y cerrar etapas deterministas tras confirmaciones.                                                            | El pedido, entrega física, efectivo, aceptación y excepciones requieren cliente o trabajador real.                            | `principal_type=COUNTER_SALE_ORCHESTRATOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.      |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `SISTEMA_EJECUTOR_PRINCIPAL`     | `EXTERNAL_ORDER_ADAPTER`         | Autenticar mensaje externo, deduplicar, normalizar, crear pedido interno y transferirlo al flujo propietario.                                                                | El canal no garantiza capacidad, preparación, pago, entrega ni aprobación de excepciones.                                     | `principal_type=EXTERNAL_ORDER_ADAPTER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.         |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `SISTEMA_EJECUTOR_PARCIAL`       | `B2B_WORKFLOW_ENGINE`            | Calcular propuesta, capacidad y documentos; emitir factura o tareas después de aprobaciones y aceptación válidas.                                                            | Negociación, precio excepcional, aceptación, capacidad y aprobación comercial son humanas.                                    | `principal_type=B2B_WORKFLOW_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.            |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `SISTEMA_EJECUTOR_PARCIAL`       | `ORDER_EFFECTS_ORCHESTRATOR`     | Propagar idempotentemente una modificación, cancelación o devolución ya autorizada a inventario, pago y documentos.                                                          | La elegibilidad, decisión, compensación y excepción requieren autoridad humana o regla previamente aprobada.                  | `principal_type=ORDER_EFFECTS_ORCHESTRATOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `SISTEMA_EJECUTOR_PARCIAL`       | `PAYMENT_ADAPTER`                | Procesar respuesta técnica, deduplicar, actualizar intento, emitir soporte y conciliar estados deterministas.                                                                | Efectivo, pago incierto, reverso excepcional, fraude y cierre financiero requieren intervención autorizada.                   | `principal_type=PAYMENT_ADAPTER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.                |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `SISTEMA_EJECUTOR_PARCIAL`       | `CASH_RECONCILIATION_ENGINE`     | Calcular totales esperados, comparar medios y señalar diferencias sin firmar el cierre.                                                                                      | Conteo físico, declaración del cajero y aprobación de diferencia requieren personas segregadas.                               | `principal_type=CASH_RECONCILIATION_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `SISTEMA_EJECUTOR_PARCIAL`       | `LOYALTY_LEDGER_WORKER`          | Registrar puntos y redenciones a partir de transacciones canónicas, tokens válidos e idempotencia.                                                                           | Consentimiento, identificación, excepción y compensación manual requieren cliente o personal autorizado.                      | `principal_type=LOYALTY_LEDGER_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.          |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `SISTEMA_DISPARADOR_O_VIGILANTE` | `CUSTOMER_CASE_INGESTOR`         | Crear y deduplicar reclamo desde canal autorizado, clasificar preliminarmente y enrutar.                                                                                     | Determinar causa, responsabilidad, devolución, compensación o cierre requiere decisión humana.                                | `principal_type=CUSTOMER_CASE_INGESTOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.         |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `SISTEMA_DISPARADOR_O_VIGILANTE` | `RESERVATION_MONITOR`            | Vigilar capacidad, vencimientos y confirmaciones; enviar recordatorios y abrir seguimiento.                                                                                  | Aceptar reserva, excepción, precio, capacidad o cancelación sensible requiere persona autorizada.                             | `principal_type=RESERVATION_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.            |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `SISTEMA_EJECUTOR_PARCIAL`       | `ROUTE_OPTIMIZATION_ENGINE`      | Proponer ruta, secuencia, carga y ventanas; recalcular ante restricciones conocidas.                                                                                         | Despachador aprueba; conductor acepta vehículo y carga; sistema no asume custodia.                                            | `principal_type=ROUTE_OPTIMIZATION_ENGINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.      |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `SIN_ACTOR_SISTEMA_DIRECTO`      | `DELIVERY_TRACKING_SUPPORT`      | Calcular ETA y transportar telemetría sin declarar recogida, entrega, rechazo, novedad o retorno.                                                                            | Cada handoff y prueba de entrega requiere actor humano o receptor válido.                                                     | `principal_type=DELIVERY_TRACKING_SUPPORT`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.      |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `SISTEMA_EJECUTOR_PRINCIPAL`     | `THIRD_PARTY_DELIVERY_ADAPTER`   | Consumir estados y pruebas externas, validar origen, deduplicar, reconciliar y cerrar la etapa de integración.                                                               | El resultado empresarial solo se confirma cuando la prueba satisface el contrato interno; excepciones se revisan humanamente. | `principal_type=THIRD_PARTY_DELIVERY_ADAPTER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.   |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `SISTEMA_EJECUTOR_PRINCIPAL`     | `ACCOUNTING_EVENT_CONSUMER`      | Crear asiento determinista desde evento y soporte canónicos, con periodo, versión e idempotencia.                                                                            | Asientos manuales, reclasificaciones, cierres, excepciones y aprobación contable permanecen humanas.                          | `principal_type=ACCOUNTING_EVENT_CONSUMER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.      |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `SISTEMA_DISPARADOR_O_VIGILANTE` | `PAYABLES_DUE_MONITOR`           | Detectar obligación vencida o lista para pago y crear propuesta, recordatorio o escalamiento.                                                                                | Aprobar obligación, liberar pago, cambiar beneficiario o resolver diferencia requiere segregación humana.                     | `principal_type=PAYABLES_DUE_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.           |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `SISTEMA_DISPARADOR_O_VIGILANTE` | `RECEIVABLES_MONITOR`            | Detectar vencimiento, recaudo no aplicado o diferencia y abrir gestión de cobro.                                                                                             | Acuerdo, castigo, condonación, aplicación excepcional y cierre requieren autoridad humana.                                    | `principal_type=RECEIVABLES_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.            |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | `SISTEMA_EJECUTOR_PRINCIPAL`     | `COSTING_BATCH_PROCESSOR`        | Calcular y versionar costos, distribuciones, cierres analíticos y rentabilidad mediante reglas aprobadas.                                                                    | Aprobar reglas, reabrir periodo, aceptar ajuste o publicar resultado oficial requiere autoridad humana.                       | `principal_type=COSTING_BATCH_PROCESSOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.        |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `SIN_ACTOR_SISTEMA_DIRECTO`      | `FACILITY_WORK_SUPPORT`          | Programar, recordar y presentar procedimiento sin afirmar limpieza, inspección, reparación o control de plagas.                                                              | La ejecución física, verificación y cierre requieren trabajador o proveedor identificado.                                     | `principal_type=FACILITY_WORK_SUPPORT`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.          |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `SISTEMA_EJECUTOR_PRINCIPAL`     | `CONTENT_PUBLICATION_WORKER`     | Publicar, programar, retirar y verificar contenido aprobado en canales autorizados.                                                                                          | Creación, revisión, aprobación, excepción reputacional y respuesta sensible son humanas.                                      | `principal_type=CONTENT_PUBLICATION_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `SISTEMA_DISPARADOR_O_VIGILANTE` | `DIGITAL_LEAD_INGESTOR`          | Crear caso desde formulario o mensaje, deduplicar, clasificar preliminarmente y enrutar por SLA.                                                                             | Calificación, oferta, compromiso, cierre comercial y tratamiento de datos requieren persona autorizada.                       | `principal_type=DIGITAL_LEAD_INGESTOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.          |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `SISTEMA_DISPARADOR_O_VIGILANTE` | `TECHNOLOGY_MONITOR`             | Detectar alerta, crear incidente, adjuntar telemetría y priorizar provisionalmente.                                                                                          | Diagnóstico, cambio, comunicación material, aceptación de solución y cierre son humanos.                                      | `principal_type=TECHNOLOGY_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.             |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `SISTEMA_DISPARADOR_O_VIGILANTE` | `ACCESS_LIFECYCLE_TRIGGER`       | Abrir o ejecutar revocación segura por fecha, retiro o política aprobada y generar verificación.                                                                             | Conceder, ampliar, exceptuar o restaurar acceso requiere aprobación humana y permisos explícitos.                             | `principal_type=ACCESS_LIFECYCLE_TRIGGER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.       |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `SISTEMA_DISPARADOR_O_VIGILANTE` | `RETENTION_MONITOR`              | Detectar vencimiento, ausencia de metadatos o condición de disposición y abrir revisión; aplicar regla automática solo si está expresamente aprobada y no existe legal hold. | Clasificación sensible, legal hold, excepción y disposición irreversible requieren autoridad humana.                          | `principal_type=RETENTION_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.              |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `SISTEMA_EJECUTOR_PARCIAL`       | `ANALYTICS_PIPELINE`             | Agregar datos, calcular métricas, detectar anomalías y producir análisis reproducible.                                                                                       | Interpretar, decidir mejora, priorizar acción y certificar resultado requiere responsable humano.                             | `principal_type=ANALYTICS_PIPELINE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.             |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `SISTEMA_DISPARADOR_O_VIGILANTE` | `CONTINUITY_DETECTION_SERVICE`   | Detectar degradación, abrir incidente, activar comunicaciones y pasos automáticos seguros del runbook.                                                                       | Declarar crisis, operar excepciones, aceptar recuperación y retornar a normalidad requiere mando humano.                      | `principal_type=CONTINUITY_DETECTION_SERVICE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.   |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `SISTEMA_DISPARADOR_O_VIGILANTE` | `ENTERPRISE_RISK_MONITOR`        | Detectar umbral, incidente o control vencido y crear o actualizar caso de riesgo con trazabilidad.                                                                           | Valorar impacto, probabilidad, tratamiento y aceptación del riesgo residual es humano.                                        | `principal_type=ENTERPRISE_RISK_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.        |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `SISTEMA_DISPARADOR_O_VIGILANTE` | `OBLIGATION_DEADLINE_MONITOR`    | Registrar ingreso técnico, vigilar vencimientos y crear tareas o escalamiento.                                                                                               | Interpretar requerimiento, comprometer respuesta, aprobar entrega y cerrar relación requiere responsable humano.              | `principal_type=OBLIGATION_DEADLINE_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.    |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `SIN_ACTOR_SISTEMA_DIRECTO`      | `PERFORMANCE_SUPPORT_SERVICE`    | Recordar ciclos y consolidar evidencia autorizada sin calificar, inferir desempeño ni decidir consecuencias.                                                                 | Objetivos, retroalimentación, evaluación, plan y decisión laboral requieren personas autorizadas.                             | `principal_type=PERFORMANCE_SUPPORT_SERVICE`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.    |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `SIN_ACTOR_SISTEMA_DIRECTO`      | `PPE_CONTROL_SUPPORT`            | Alertar vencimiento o requisito y mostrar historial sin afirmar talla, entrega, aceptación o devolución.                                                                     | Selección, entrega, ajuste, aceptación y cambio requieren trabajador y responsable reales.                                    | `principal_type=PPE_CONTROL_SUPPORT`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.            |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `SIN_ACTOR_SISTEMA_DIRECTO`      | `KIT_COMPLETENESS_SUPPORT`       | Calcular completitud desde componentes confirmados sin declarar préstamo, custodia, devolución o pérdida.                                                                    | Composición física, entrega, recepción y sustitución requieren actores humanos.                                               | `principal_type=KIT_COMPLETENESS_SUPPORT`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.       |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `SISTEMA_EJECUTOR_PARCIAL`       | `SURVEY_DISTRIBUTION_WORKER`     | Distribuir encuesta aprobada, recibir respuestas, deduplicar e instrumentar incentivo separado.                                                                              | Interpretación, decisión de mejora, reclamo y compensación no se automatizan desde la respuesta.                              | `principal_type=SURVEY_DISTRIBUTION_WORKER`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.     |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `SISTEMA_DISPARADOR_O_VIGILANTE` | `BUDGET_VARIANCE_MONITOR`        | Calcular consumo, proyección y desviación y abrir alerta o solicitud de revisión.                                                                                            | Crear versión oficial, aprobar presupuesto, mover recursos o aceptar desviación requiere autoridad humana.                    | `principal_type=BUDGET_VARIANCE_MONITOR`; `service_principal_id`; versión desplegada; proceso/acción; trigger; idempotency_key; correlation/causation; regla y versión; entradas y salidas; resultado; timestamps; auditoría y trazas.        |

---

#### 14. Resumen por clasificación

##### 14.1. `SISTEMA_EJECUTOR_PRINCIPAL`

```text
VPROC-0017 — Oferta y disponibilidad
VPROC-0040 — Pedidos de canales externos
VPROC-0050 — Entrega de tercero
VPROC-0051 — Registro contable desde eventos
VPROC-0054 — Costos, cierre y rentabilidad
VPROC-0056 — Contenido y promociones
```

Estos procesos admiten una etapa técnica principal sin operador humano en ese momento, pero conservan configuración, aprobación, excepción y gobierno humanos cuando corresponda.

##### 14.2. `SISTEMA_EJECUTOR_PARCIAL`

```text
VPROC-0002, VPROC-0003, VPROC-0006, VPROC-0007, VPROC-0010, VPROC-0015,
VPROC-0016, VPROC-0020, VPROC-0021, VPROC-0023, VPROC-0024, VPROC-0025,
VPROC-0028, VPROC-0036, VPROC-0037, VPROC-0039, VPROC-0041, VPROC-0042,
VPROC-0043, VPROC-0044, VPROC-0045, VPROC-0048, VPROC-0061, VPROC-0068
```

##### 14.3. `SISTEMA_DISPARADOR_O_VIGILANTE`

```text
VPROC-0004, VPROC-0008, VPROC-0009, VPROC-0011, VPROC-0012, VPROC-0013,
VPROC-0018, VPROC-0019, VPROC-0027, VPROC-0030, VPROC-0031, VPROC-0033,
VPROC-0035, VPROC-0046, VPROC-0047, VPROC-0052, VPROC-0053, VPROC-0057,
VPROC-0058, VPROC-0059, VPROC-0060, VPROC-0062, VPROC-0063, VPROC-0064,
VPROC-0069
```

##### 14.4. `SIN_ACTOR_SISTEMA_DIRECTO`

```text
VPROC-0001 — Decisiones empresariales
VPROC-0005 — Selección de personas
VPROC-0014 — Higiene e inocuidad
VPROC-0022 — Recepción de compras
VPROC-0026 — Conteo y ajuste
VPROC-0029 — Custodia de activos
VPROC-0032 — Reutilizables y contenedores
VPROC-0034 — Ejecución productiva
VPROC-0038 — Servicio en mesa
VPROC-0049 — Ruta y entrega
VPROC-0055 — Instalaciones
VPROC-0065 — Desempeño y desarrollo
VPROC-0066 — Elementos de protección
VPROC-0067 — Kits y conjuntos
```

En estos procesos el software puede apoyar, pero no ser el autor directo del hecho sustantivo.

---

#### 15. Relación con aplicaciones y servicios

Esta tarea no modifica la propiedad aprobada en `PROC-CAT-005`.

- La aplicación propietaria valida y materializa el efecto empresarial.
- `vento-shell` define contratos compartidos de principal, comando, auditoría e idempotencia.
- Supabase ejecuta infraestructura, no se convierte en dueño de los procesos.
- Edge Functions, cron y webhooks se versionan y se limitan por proceso y acción.
- Las colas conservan causa, prioridad, estado, reintentos y recuperación.
- Los adaptadores externos no escriben directamente en tablas de dominio sin contrato.
- NUMERA puede consumir eventos contables, pero no inventar hechos operativos.
- VISO puede vigilar procesos, pero no ejecutar como servicio universal.

---

#### 16. Decisiones reservadas

| Decisión                                            | Tarea responsable                     |
| --------------------------------------------------- | ------------------------------------- |
| prohibición final de autorización por nombre de rol | `PROC-ACTOR-010`                      |
| auditoría de actores de sistema existentes          | `SUPA-AUD-011`, `SUPA-AUD-014`        |
| arquitectura Edge Functions, webhooks y cron        | `SUPA-ARC-020`                        |
| contrato de trabajo asíncrono                       | `QUEUE-ARC-001` a `QUEUE-ARC-008`     |
| principal técnico compartido                        | `SHELL-CON-017`                       |
| idempotencia y conciliación compartidas             | `SHELL-CON-023`                       |
| validación de principal en RPC                      | `AUTH-DB-010`                         |
| versionado de automatizaciones                      | `AUTH-DB-024`                         |
| principal técnico por integración                   | `INT-EXT-002`                         |
| webhook, polling, firma y replay                    | `INT-EXT-010` a `INT-EXT-012`         |
| auditoría y conciliación de integraciones           | `INT-EXT-017`, `INT-DB-007`           |
| modelo de pantallas y acciones de sistema           | `PROC-SCREEN-012`, `PROC-SCREEN-014`  |
| implementación y cutover                            | paquetes E3, E4 y E5 correspondientes |

No queda pendiente narrativo sin tarea responsable.

---

#### 17. Requisitos de prueba derivados

Esta tarea genera:

```text
TREQ-PROC-183
TREQ-PROC-184
TREQ-PROC-185
TREQ-PROC-186
TREQ-PROC-187
TREQ-PROC-188
TREQ-PROC-189
TREQ-PROC-190
```

El detalle canónico se incorpora exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 18. Criterios de aceptación

- [ ] Los 69 procesos tienen exactamente una clasificación de sistema.
- [ ] Los conteos son 6 principal, 24 parcial, 25 disparador/vigilante y 14 sin actor directo.
- [ ] Cada proceso identifica un principal técnico permitido y su frontera humana.
- [ ] `service_role` no se interpreta como actor ni permiso universal.
- [ ] Ningún sistema se atribuye firma, aceptación, custodia o hecho físico humano.
- [ ] Compras, pagos, accesos, calidad, riesgo, contratación y presupuesto conservan gates humanos.
- [ ] Webhooks y eventos se validan y no prueban por sí solos el resultado empresarial.
- [ ] Reintentos, replay, concurrencia, backfill y offline son idempotentes y auditables.
- [ ] Dispositivo, trabajador original y servicio de sincronización permanecen separados.
- [ ] Cada automatización conserva servicio, versión, regla, trigger, comando, causa y resultado.
- [ ] No se implementó código, migraciones ni cambios en Supabase.
- [ ] Los requisitos nuevos se encuentran en el registro canónico completo.
- [ ] `PROC-ACTOR-010` permanece sin iniciar.

---

#### 19. Estado

```text
APROBADA
```

No se inicia `PROC-ACTOR-010` hasta aprobación expresa de esta tarea.


### ✅ PROC-ACTOR-010 — Prohibir autorización derivada únicamente del nombre del rol

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `PROC-ACTOR-009 — Definir procesos de sistema sin actor humano directo` — APROBADA  
**Siguiente tarea reservada:** `UX-STATION-001 — Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación`  
**Artefacto producido:** `PROC-ROLE-NAME-AUTHORIZATION-PROHIBITION-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Roles base cubiertos:** **8**  
**Roles operativos cubiertos:** **12**  
**Identidades adicionales cubiertas:** cliente, trabajador como sujeto, dispositivo compartido y principal técnico  
**Cambios en código, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Cerrar el mapa canónico de actores estableciendo que ningún nombre de rol, cargo, oficio, área, sede, estación, dispositivo, ruta, aplicación o tipo de principal podrá constituir por sí solo una autorización empresarial.

La regla aplica a:

```text
FRONTEND
MIDDLEWARE
SERVER ACTIONS
API Y RPC
RLS
STORAGE
REALTIME
EDGE FUNCTIONS
CRON, JOBS Y COLAS
APLICACIONES MÓVILES
OPERACIÓN OFFLINE
DISPOSITIVOS COMPARTIDOS
```

---

#### 2. Decisión canónica

```text
NOMBRE O CÓDIGO DE ROL
        ↓
CLASIFICA, AGRUPA O HABILITA ELEGIBILIDAD
        ↓
NO PRODUCE UNA DECISIÓN ALLOW
```

Toda acción protegida deberá resolver:

```text
PRINCIPAL AUTENTICADO
+
IDENTIDAD Y ACTOR EFECTIVO
+
PERMISO EXACTO Y VIGENTE
+
MODALIDAD DEL PERMISO
+
RECURSO Y ACCIÓN SOLICITADA
+
ALCANCE TERRITORIAL Y EMPRESARIAL
+
CONTEXTO PERSONAL, ADMINISTRATIVO, OPERATIVO, CLIENTE O TÉCNICO
+
ESTADO, PRECONDICIONES Y SEGREGACIÓN
+
DENEGACIONES Y RESTRICCIONES APLICABLES
+
FRESCURA DE LA DECISIÓN
=
DECISIÓN CANÓNICA ALLOW O DENY
```

El rol puede ser uno de los datos de entrada del contexto. Nunca será la decisión completa.

---

#### 3. Dependencias canónicas

Esta propuesta conserva y aplica:

- `ADR-AUTH-001 — ACCEPTED`;
- `AUTH-AUD-018 — Buscar decisiones hardcodeadas por rol`;
- `AUTH-AUD-020 — Crear informe de riesgos y brechas`;
- `AUTH-MOD-001` a `AUTH-MOD-021`;
- `AUTH-CAT-001` a `AUTH-CAT-024`;
- `AUTH-RBAC-001` a `AUTH-RBAC-028`;
- `AUTH-CTX-001` a `AUTH-CTX-030`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-009`;
- `CODE-AUD-009`, `CODE-AUD-014` y `CODE-AUD-017`;
- `SHELL-AUD-002` a `SHELL-AUD-005`;
- `SHELL-AUTH-001` a `SHELL-AUTH-005`;
- `AUTH-DB-006` a `AUTH-DB-010`;
- `AUTH-DB-021` a `AUTH-DB-024`;
- `AUTH-DB-033` a `AUTH-DB-035`;
- `SHELL-CI-017` a `SHELL-CI-019`;
- `AUTH-QA-001` a `AUTH-QA-030`.

No se modifica todavía ningún guard, helper, política, RPC, ruta, pantalla, caché o dato físico.

---

#### 4. Qué representa un rol

##### 4.1. Rol base

Representa una responsabilidad laboral permanente y permite construir una matriz de concesiones administrativas o laborales.

```text
ROL BASE
→ fuente posible de concesiones explícitas
→ clasificación de experiencia
→ cobertura potencial
→ NO autorización final
```

##### 4.2. Rol operativo

Representa una función temporal durante un turno válido.

```text
ROL OPERATIVO
+
TURNO Y CONTEXTO VÁLIDOS
→ permite consultar sus concesiones operativas
→ NO crea permisos por sí mismo
```

##### 4.3. Etiquetas que no son roles autorizadores

No podrán utilizarse como autorización:

- `navigation_role`;
- nombre de estación o dispositivo;
- nombre de sede, área o tipo de sede;
- perfil operativo predeterminado;
- último rol utilizado;
- rol simulado;
- `role=client`;
- `service_role`;
- nombre de una aplicación o ruta;
- texto visible del cargo.

---

#### 5. Usos permitidos del nombre del rol

El código de rol podrá utilizarse para:

1. buscar concesiones explícitas en una matriz versionada;
2. validar que una asignación de rol sea estructuralmente admisible;
3. determinar elegibilidad para una capacidad reservada, siempre junto con permiso exacto y demás condiciones;
4. escoger etiquetas, ayudas, navegación o presentación;
5. agrupar métricas y reportes autorizados;
6. proponer valores predeterminados no vinculantes;
7. seleccionar escenarios de prueba;
8. describir al actor en auditoría después de resolver la autorización;
9. restringir qué roles pueden recibir una concesión, sin concederla automáticamente;
10. comparar matrices durante una migración controlada.

Estos usos deberán quedar separados del punto donde se emite `ALLOW` o `DENY`.

---

#### 6. Usos prohibidos

Queda prohibido:

```ts
if (role === "propietario") return true;
if (["propietario", "gerente_general"].includes(role)) allow();
if (operationalRole === "bodeguero") permitMutation();
```

También queda prohibido:

- conceder una ruta, botón o mutación por una lista local de roles;
- asumir acceso total porque el rol es global;
- asumir acceso a toda la sede porque el rol es `gerente` o `supervisor`;
- derivar un oficio operativo desde `employees.role`;
- completar un permiso faltante con el rol base;
- completar contexto operativo con perfil, navegación o último turno;
- convertir el área o estación en permiso;
- asumir propiedad de un recurso porque `role=client`;
- utilizar `service_role` como autorización empresarial;
- omitir RLS o validación de servidor porque la interfaz ocultó la acción;
- mantener listas privilegiadas distintas en cada aplicación;
- interpretar una simulación como permiso real;
- conservar acceso en caché después de revocación, cambio de rol o fin de turno;
- autorizar un recurso nuevo mediante un snapshot creado para otro recurso;
- emitir `ALLOW` cuando falte permiso, alcance, recurso o contexto.

---

#### 7. Elegibilidad estructural no equivale a autorización

Algunas capacidades pueden exigir una clase estructural específica.

Ejemplo conceptual:

```text
ROL BASE = propietario
+
PERMISO RESERVADO DE PROPIETARIO
+
EMPLEADO ACTIVO
+
ALCANCE Y RECURSO VÁLIDOS
+
SIN DENEGACIÓN
=
ACCIÓN AUTORIZABLE
```

Esto es válido porque el rol es **una condición necesaria**, no la condición suficiente.

Queda prohibido:

```text
ROL BASE = propietario
=
ALLOW UNIVERSAL
```

La misma regla aplica a cualquier rol administrativo u operativo.

---

#### 8. Contrato mínimo de decisión

Toda evaluación deberá producir o poder reconstruir:

```text
decision_id
principal_id
principal_type
actor_id
actor_type
base_role_code
operational_role_code
permission_code
permission_catalog_version
permission_modality
process_id
process_instance_id
stage_id
action
resource_type
resource_id
company_id
site_id
area_id
shift_id
checkin_id
scope_resolution
subject_or_relationship
service_capability
individual_denials
segregation_result
sensitivity_requirements
context_version
freshness_token
decision = ALLOW | DENY
reason_codes[]
decided_at
expires_at
evaluator_version
trace_id
```

Un campo no aplicable podrá ser nulo de forma explícita. No podrá sustituirse por el nombre del rol.

---

#### 9. Precedencia obligatoria

```text
PRINCIPAL O ACTOR INVÁLIDO
        > cualquier rol

EMPLEADO INACTIVO
        > cualquier permiso heredado

DENEGACIÓN INDIVIDUAL O TRANSVERSAL
        > concesión por matriz

FALTA DE PERMISO EXACTO
        > nombre o jerarquía del rol

ALCANCE O RECURSO NO AUTORIZADO
        > permiso sin cobertura suficiente

FALTA DE TURNO/CHECK-IN CUANDO APLICA
        > rol operativo

SEGREGACIÓN INCUMPLIDA
        > capacidad funcional

CONTEXTO DESACTUALIZADO
        > decisión en caché
```

La ausencia de información necesaria produce `DENY`, no un fallback por rol.

---

#### 10. Reglas por clase de actor

##### 10.1. Propietario y gerente general

- pueden recibir permisos globales explícitos;
- no reciben bypass universal;
- no sustituyen turno, check-in o rol operativo;
- `gerente_general` no hereda capacidades reservadas de propietario;
- propietario tampoco equivale a `service_role`.

##### 10.2. Gerente y supervisor

- su cobertura se limita a sedes, áreas y recursos autorizados;
- supervisar no concede mutar, aprobar o cerrar;
- una sede seleccionada no amplía cobertura;
- una vista transversal no concede escritura transversal.

##### 10.3. Roles funcionales administrativos

`auxiliar_administrativa`, `contador` y `marketing` solo ejecutan permisos explícitos del dominio y alcance concedidos. El cargo no habilita datos sensibles, exportaciones, aprobaciones ni acciones de terceros.

##### 10.4. `trabajador_operativo`

El rol base acredita pertenencia laboral, no un oficio activo. La operación exige turno y rol operativo efectivos.

##### 10.5. Roles operativos

`bodeguero`, `cajero_satelite`, `produccion_*`, `conductor_logistica` y demás roles operativos no reciben todas las acciones de su dominio. Cada acción exige permiso atómico, estado, recurso, sede, área, turno y check-in cuando corresponda.

##### 10.6. Cliente

`role=client` no concede acceso a pedidos, puntos, reclamos o datos. Se exige identidad de dominio, relación con el recurso, acción válida, finalidad y consentimiento aplicables.

##### 10.7. Dispositivo compartido

El dispositivo no hereda permisos por `navigation_role`, estación o plantilla. Las acciones empresariales se atribuyen al actor humano vigente.

##### 10.8. Principal técnico

`service_role`, cron, webhook, worker o Edge Function no reciben autoridad general. Se exige principal técnico, capacidad, proceso, acción, alcance, trigger, versión e idempotencia.

---

#### 11. Cobertura de los 69 procesos

Leyenda de planos:

```text
P = personal
A = administrativo
O = operativo
C = cliente
S = sistema directo en alguna etapa
```

| Proceso      | Propósito                                                                                                                                                                                  | Planos aplicables  | Atajo prohibido principal                                                                                                                  | Resolución mínima obligatoria                                                                                                                                                                                                                                                                                                                   | Control mínimo                                                                                                                                                       |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Gobernar decisiones empresariales con registro, alcance, responsable, compromisos y seguimiento                                                                                            | `A`                | `propietario`/`gerente*`/`supervisor` ⇒ allow                                                                                              | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; decisión, razones y auditoría                                                                                                                                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol                                                                                                    |
| `VPROC-0002` | Mantener una estructura organizativa y jurídica coherente entre empresas, marcas, establecimientos, sedes y áreas                                                                          | `A`, `S`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; `service_role`, webhook o job ⇒ autoridad                                                   | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay                                                                    |
| `VPROC-0003` | Gobernar responsabilidades, políticas, delegaciones y límites de decisión mediante versiones vigentes                                                                                      | `P`, `A`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso; `service_role`, webhook o job ⇒ autoridad           | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay; autorización por etapa                                            |
| `VPROC-0004` | Coordinar compromisos y transferencias de trabajo entre negocios, sedes y áreas                                                                                                            | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo                                                                                         | `P`, `A`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso                                                      | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                                                                               | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; autorización por etapa                                                                            |
| `VPROC-0006` | Orquestar vinculación, expediente, incorporación, preparación y habilitación inicial de la persona                                                                                         | `P`, `A`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso; `service_role`, webhook o job ⇒ autoridad           | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay; autorización por etapa                                            |
| `VPROC-0007` | Administrar asignaciones laborales y programación publicada con historial y revisión controlada                                                                                            | `P`, `A`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso; `service_role`, webhook o job ⇒ autoridad           | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay; autorización por etapa                                            |
| `VPROC-0008` | Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables                                                                                                     | `P`, `A`, `O`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría          | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0009` | Gestionar novedades, ausencias, permisos y reemplazos como casos laborales completos                                                                                                       | `P`, `A`, `O`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría          | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0010` | Preparar y reconciliar el paquete autorizado para pagos y beneficios laborales                                                                                                             | `P`, `A`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso; `service_role`, webhook o job ⇒ autoridad           | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay; autorización por etapa                                            |
| `VPROC-0011` | Orquestar retiro laboral, devolución, revocación de accesos y cierre documental                                                                                                            | `P`, `A`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso; `service_role`, webhook o job ⇒ autoridad           | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay; autorización por etapa                                            |
| `VPROC-0012` | Gestionar riesgos, inspecciones, controles preventivos y acciones correctivas                                                                                                              | `P`, `A`, `O`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría          | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0013` | Gestionar incidentes, accidentes y emergencias con respuesta inmediata y expediente posterior                                                                                              | `P`, `A`, `O`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría          | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0014` | Ejecutar controles de higiene, inocuidad y cumplimiento mediante procedimientos versionados                                                                                                | `A`, `O`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso                                                    | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                                        | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0015` | Gobernar el ciclo de vida de productos, presentaciones, unidades y equivalencias                                                                                                           | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0016` | Gestionar desarrollo, prueba, aprobación, publicación y versión de recetas                                                                                                                 | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0017` | Publicar oferta y disponibilidad desde una definición gobernada hacia todos los canales                                                                                                    | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0018` | Mantener especificaciones, alérgenos, restricciones y criterios de calidad del producto                                                                                                    | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0019` | Capturar y priorizar necesidades de compra mediante una entrada única y trazable                                                                                                           | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0020` | Comparar proveedores y condiciones con evidencia suficiente para decidir                                                                                                                   | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0021` | Aprobar y emitir compras separando flujo ordinario, urgencia y excepción                                                                                                                   | `A`, `S`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; `service_role`, webhook o job ⇒ autoridad                                                   | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay                                                                    |
| `VPROC-0022` | Recibir compras, verificar conformidad y resolver diferencias sin separar recepción física, documental y económica                                                                         | `A`, `O`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso                                                    | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                                        | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0023` | Gobernar sedes, LOC, zonas, posiciones y condiciones de almacenamiento                                                                                                                     | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0024` | Registrar ingreso, ubicación y reubicación mediante movimientos correlacionados                                                                                                            | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0025` | Retirar, consumir o trasladar existencias conservando unidad, conversión, origen y destino                                                                                                 | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0026` | Contar como observación, investigar diferencias y ajustar mediante decisión separada                                                                                                       | `A`, `O`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso                                                    | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                                        | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0027` | Gestionar condición, vencimiento, cuarentena, merma, pérdida, frío y disposición                                                                                                           | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0028` | Ejecutar abastecimiento interno de solicitud a recepción con cantidades conciliables por etapa                                                                                             | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0029` | Gestionar identidad, ubicación, custodia, préstamo y transferencia de activos                                                                                                              | `P`, `A`, `O`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0030` | Gestionar mantenimiento, reparación, garantía, repuesto y disposición de activos                                                                                                           | `P`, `A`, `O`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría          | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0031` | Gestionar disponibilidad de vehículos, combustible, kilometraje e incidencias                                                                                                              | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0032` | Controlar entrega, tenencia, retorno, pérdida y completitud de reutilizables y contenedores                                                                                                | `P`, `A`, `O`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0033` | Planear producción desde demanda, inventario, capacidad, prioridad y fecha requerida                                                                                                       | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0034` | Preparar materiales y ejecutar producción contra una versión aprobada                                                                                                                      | `O`                | rol operativo, área o estación ⇒ permiso                                                                                                   | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; turno, rol operativo efectivo, sede/área y check-in aplicable; decisión, razones y auditoría                                                                                                                                                    | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out                                                                    |
| `VPROC-0035` | Inspeccionar y decidir liberación, retención, rechazo o corrección de producto                                                                                                             | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0036` | Empacar, etiquetar y almacenar producto terminado con trazabilidad preservada                                                                                                              | `O`, `S`           | rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad                                                        | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                              | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay                                    |
| `VPROC-0037` | Gestionar reproceso, aprovechamiento, rendimiento, merma y cierre productivo                                                                                                               | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0038` | Gestionar servicio en mesa de apertura a cierre con pedido, preparación, entrega, pago y conciliación                                                                                      | `O`, `C`           | rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad                                                 | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; decisión, razones y auditoría                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR                                                         |
| `VPROC-0039` | Gestionar venta de mostrador o para llevar con entrega y cobro correlacionados                                                                                                             | `O`, `C`, `S`      | rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad; `service_role`, webhook o job ⇒ autoridad      | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                             | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay                         |
| `VPROC-0040` | Normalizar pedidos de canales externos y transferirlos al proceso interno con reconciliación                                                                                               | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0041` | Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B                                                                                     | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0042` | Gestionar modificación, sustitución, cancelación, anulación y devolución sin confundir sus efectos                                                                                         | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0043` | Cobrar, confirmar pago y emitir soporte fiscal mediante contrato conciliable                                                                                                               | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0044` | Cerrar caja y conciliar ventas, pagos, efectivo, diferencias y responsables                                                                                                                | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0045` | Identificar cliente y administrar fidelización mediante ledgers y consentimientos separados                                                                                                | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0046` | Gestionar reclamo, devolución, compensación y aprendizaje de causa                                                                                                                         | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0047` | Gestionar reservas, eventos y comunicaciones al cliente con capacidad y consentimiento                                                                                                     | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0048` | Planear ruta, vehículo, carga, secuencia y restricciones antes del despacho                                                                                                                | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0049` | Ejecutar ruta y confirmar entrega, rechazo, novedad o retorno con prueba suficiente                                                                                                        | `O`, `C`           | rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad                                                 | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; decisión, razones y auditoría                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR                                                         |
| `VPROC-0050` | Integrar entrega de tercero con seguimiento, prueba y conciliación interna                                                                                                                 | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0051` | Registrar hechos económicos desde eventos operativos y soportes correlacionados                                                                                                            | `A`, `C`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; `role=client`, teléfono, correo o ID ⇒ propiedad; `service_role`, webhook o job ⇒ autoridad | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; anti-IDOR; identidad de servicio y replay                                                         |
| `VPROC-0052` | Gestionar obligación, aprobación y pago a proveedor con conciliación bancaria                                                                                                              | `A`, `S`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; `service_role`, webhook o job ⇒ autoridad                                                   | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay                                                                    |
| `VPROC-0053` | Gestionar cartera, cobro, recaudo, aplicación y diferencia                                                                                                                                 | `A`, `C`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; `role=client`, teléfono, correo o ID ⇒ propiedad; `service_role`, webhook o job ⇒ autoridad | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; anti-IDOR; identidad de servicio y replay                                                         |
| `VPROC-0054` | Gestionar costos, distribución, cierre y rentabilidad con reglas versionadas                                                                                                               | `A`, `S`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; `service_role`, webhook o job ⇒ autoridad                                                   | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay                                                                    |
| `VPROC-0055` | Gestionar limpieza, inspección, mantenimiento, plagas, servicios y cierre de novedades de instalaciones                                                                                    | `A`, `O`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso                                                    | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                                        | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0056` | Gestionar contenido y promociones desde solicitud y aprobación hasta publicación y retiro                                                                                                  | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0057` | Convertir consultas y oportunidades de canales digitales en casos comerciales trazables                                                                                                    | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0058` | Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento                                                                                      | `P`, `A`, `O`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría          | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0059` | Gestionar el ciclo de acceso tecnológico desde solicitud hasta revocación y verificación                                                                                                   | `P`, `A`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso; `service_role`, webhook o job ⇒ autoridad           | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay; autorización por etapa                                            |
| `VPROC-0060` | Gestionar documentos y evidencia desde creación hasta disposición con metadatos y custodia                                                                                                 | `P`, `A`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso; `service_role`, webhook o job ⇒ autoridad           | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                         | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay; autorización por etapa                                            |
| `VPROC-0061` | Gestionar medición, análisis, decisión de mejora y verificación de resultado                                                                                                               | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0062` | Gestionar continuidad desde detección hasta operación mínima, recuperación, reconciliación y aprendizaje                                                                                   | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0063` | Gestionar riesgos empresariales: Gestionar riesgos estratégicos, financieros, operativos, legales y tecnológicos como registro versionado de riesgo, tratamiento y seguimiento.            | `A`, `O`, `S`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `service_role`, webhook o job ⇒ autoridad         | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría                                  | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; identidad de servicio y replay; autorización por etapa            |
| `VPROC-0064` | Gestionar relaciones con asesores y autoridades: Gobernar requerimientos, conceptos, entregables, vencimientos, comunicaciones y evidencia sin delegar la propiedad interna del resultado. | `A`, `S`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; `service_role`, webhook o job ⇒ autoridad                                                   | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay                                                                    |
| `VPROC-0065` | Acompañar desempeño y desarrollo: Mantener un proceso diferido y sensible de objetivos, retroalimentación y decisiones, con uso explícito y privacidad aprobada.                           | `P`, `A`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; ser empleado o sujeto ⇒ acceso al caso                                                      | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                                                                               | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; autorización por etapa                                                                            |
| `VPROC-0066` | Entregar y controlar elementos de protección: Gestionar requisito, entrega, aceptación, vigencia, cambio, devolución y evidencia de elementos de protección.                               | `P`, `A`, `O`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0067` | Gestionar kits y conjuntos: Definir kit, instancia, componentes obligatorios y opcionales, completitud, préstamo, devolución y sustitución sin confundir kit, activo, LPN o contenedor.    | `P`, `A`, `O`      | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; ser empleado o sujeto ⇒ acceso al caso            | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; relación propia/sujeto; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; reevaluación por etapa y handoff; decisión, razones y auditoría                                                                | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; autorización por etapa                                            |
| `VPROC-0068` | Medir satisfacción: Separar medición, incentivo, reclamo y compensación; conservar muestra, canal, consentimiento, respuesta y sesgo conocido.                                             | `A`, `O`, `C`, `S` | `propietario`/`gerente*`/`supervisor` ⇒ allow; rol operativo, área o estación ⇒ permiso; `role=client`, teléfono, correo o ID ⇒ propiedad  | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; turno, rol operativo efectivo, sede/área y check-in aplicable; relación cliente/consentimiento; principal técnico, capacidad, trigger e idempotencia; reevaluación por etapa y handoff; decisión, razones y auditoría | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; revocación por turno/check-out; anti-IDOR; identidad de servicio y replay; autorización por etapa |
| `VPROC-0069` | Gestionar presupuestos: Gestionar versión presupuestal, supuestos, aprobación, vigencia, consumo, proyección y desviación sin convertir el presupuesto en hecho contable.                  | `A`, `S`           | `propietario`/`gerente*`/`supervisor` ⇒ allow; `service_role`, webhook o job ⇒ autoridad                                                   | principal y actor válidos; permiso exacto/versionado; recurso y acción; alcance y denegaciones; cobertura administrativa; principal técnico, capacidad, trigger e idempotencia; decisión, razones y auditoría                                                                                                                                   | backend canónico; RLS/RPC cuando aplique; prueba negativa por rol; identidad de servicio y replay                                                                    |

La matriz no crea permisos nuevos. Declara que **todos los procesos** deben consumir una decisión de autorización independiente del nombre del rol.

---

#### 12. Reglas por capa tecnológica

##### 12.1. Interfaz y navegación

La interfaz podrá adaptar presentación por rol, pero:

```text
BOTÓN VISIBLE
≠ AUTORIZACIÓN

BOTÓN OCULTO
≠ CONTROL DE SEGURIDAD
```

Toda mutación deberá validarse nuevamente en servidor.

##### 12.2. Middleware, rutas y server actions

- no mantendrán listas privilegiadas locales;
- declararán el permiso y recurso requeridos;
- consumirán el evaluador canónico;
- denegarán acceso directo por URL y formularios manipulados;
- distinguirán navegación de capacidad empresarial.

##### 12.3. RPC y funciones

Toda RPC sensible deberá validar principal, actor, permiso exacto, recurso, sede, área, estado y contexto. `SECURITY DEFINER` no elimina estas validaciones.

##### 12.4. RLS y grants

Las políticas no concederán acceso por `employees.role IN (...)`. Los grants técnicos no equivalen a autorización sobre filas.

##### 12.5. Storage y Realtime

Buckets, objetos, canales y payloads deberán aplicar identidad, relación, permiso, alcance y minimización. El nombre del rol no habilitará suscripción o descarga transversal.

##### 12.6. Edge Functions, cron y colas

Resolverán principal técnico y capacidad explícita. No utilizarán `service_role` como sustituto del actor o decisión de negocio.

---

#### 13. Caché, offline y frescura

Una decisión almacenada deberá estar vinculada a:

```text
actor
permiso
recurso
alcance
context_version
permission_catalog_version
freshness_token
expires_at
```

Al cambiar rol, permiso, denegación, sede, área, turno, check-in, actor de dispositivo o recurso:

```text
INVALIDAR O REVALIDAR
```

Una cola offline conservará la decisión original como evidencia, pero revalidará al sincronizar. No podrá ejecutar mediante el rol que el usuario tenía anteriormente.

---

#### 14. Simulación, soporte, override y emergencia

##### Simulación

El rol simulado solo cambia el escenario hipotético. No modifica la autorización real ni RLS.

##### Soporte

Observar o diagnosticar no concede mutar. Toda acción de soporte sensible tendrá permiso y auditoría propios.

##### Override

Un override deberá declarar:

- permiso específico;
- causa;
- recurso;
- alcance;
- duración;
- actor responsable;
- control compensatorio;
- auditoría y revisión.

No podrá denominarse simplemente “override de propietario”.

##### Emergencia

El acceso de emergencia deberá ser explícito, temporal, acotado, revocable y auditado. El rol no activa la emergencia por sí solo.

---

#### 15. Migración y retiro de hardcodes

La transición seguirá este orden:

1. inventariar comparaciones y listas de roles en todos los repositorios;
2. clasificar cada uso como presentación, elegibilidad estructural o autorización;
3. conservar únicamente usos no autorizadores documentados;
4. asignar a cada acción un permiso, recurso, alcance y contexto exactos;
5. implementar `get_access_context` y `evaluate_authorization` canónicos;
6. migrar frontend, middleware, server actions, RPC, RLS, Storage, Realtime y automatizaciones;
7. ejecutar evaluación dual legacy/canónica sin ampliar acceso;
8. investigar toda divergencia;
9. retirar fallbacks y listas privilegiadas locales;
10. activar denegación cerrada;
11. ejecutar pruebas negativas por cada rol y proceso crítico;
12. bloquear nuevas comparaciones autorizadoras mediante lint y CI;
13. conservar evidencia de adopción antes de eliminar objetos legacy;
14. habilitar rollback por repositorio sin restaurar bypasses inseguros.

Durante la transición:

```text
RESULTADO LEGACY = ALLOW
RESULTADO CANÓNICO = DENY
→ NO AMPLIAR AUTOMÁTICAMENTE
→ INVESTIGAR Y RESOLVER
```

---

#### 16. Decisiones reservadas y tareas responsables

| Decisión o implementación                               | Tarea responsable                   |
| ------------------------------------------------------- | ----------------------------------- |
| inventario de guards y helpers duplicados               | `SHELL-AUD-002` a `SHELL-AUD-005`   |
| SDK canónico de contexto y autorización                 | `SHELL-AUTH-001` a `SHELL-AUTH-003` |
| lint y gates contra consumidores legacy                 | `SHELL-AUTH-004`                    |
| migración de consumidores en todos los repositorios     | `SHELL-AUTH-005`                    |
| contexto de acceso canónico                             | `AUTH-DB-033`, `AUTH-DB-035`        |
| evaluación de autorización canónica                     | `AUTH-DB-034`                       |
| validaciones dentro de RPC sensibles                    | `AUTH-DB-006` a `AUTH-DB-010`       |
| políticas, Storage, Realtime y automatizaciones         | `AUTH-DB-021` a `AUTH-DB-024`       |
| retiro de objetos legacy                                | `AUTH-DB-030`                       |
| certificación de paridad                                | `AUTH-DB-031`                       |
| verificación automática del registro y bloqueo de merge | `SHELL-CI-017` a `SHELL-CI-019`     |
| pruebas negativas y regresión integral                  | `AUTH-QA-001` a `AUTH-QA-030`       |
| estaciones e interacción física                         | `UX-STATION-001` a `UX-STATION-012` |

No queda pendiente narrativo sin tarea responsable.

---

#### 17. Requisitos de prueba derivados

Esta tarea genera:

```text
TREQ-PROC-191
TREQ-PROC-192
TREQ-PROC-193
TREQ-PROC-194
TREQ-PROC-195
TREQ-PROC-196
TREQ-PROC-197
TREQ-PROC-198
```

El detalle canónico se incorpora exclusivamente en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 18. Criterios de aceptación

- [ ] La prohibición aplica a los 69 procesos.
- [ ] Los ocho roles base y doce roles operativos quedan cubiertos.
- [ ] Cliente, dispositivo, simulación y principal técnico no se convierten en bypasses equivalentes.
- [ ] El rol solo se utiliza para clasificación, elegibilidad o búsqueda de concesiones explícitas.
- [ ] Ninguna capa emite `ALLOW` únicamente por nombre o lista de roles.
- [ ] Propietario y gerente general no reciben bypass universal.
- [ ] Las capacidades reservadas exigen rol estructural, permiso exacto y demás condiciones.
- [ ] Toda acción protegida declara permiso, recurso, alcance y contexto.
- [ ] La operación exige turno, rol operativo efectivo y check-in cuando corresponda.
- [ ] Las relaciones personales y cliente se validan por recurso, no por etiqueta de rol.
- [ ] `service_role` no equivale a autorización empresarial.
- [ ] Cachés y colas offline se invalidan o revalidan.
- [ ] Simulación, override y emergencia no usan el rol como autoridad suficiente.
- [ ] Existe una ruta explícita para inventariar, migrar, probar y retirar hardcodes.
- [ ] Los requisitos nuevos se encuentran en el registro canónico completo.
- [ ] No se implementó código, migraciones ni cambios en Supabase.
- [ ] `UX-STATION-001` permanece sin iniciar.

---

#### 19. Resultado del subbloque de actores

Con la aprobación futura de esta tarea quedarán definidos:

```text
ROLES BASE APLICABLES
+
ROLES OPERATIVOS APLICABLES
+
INICIADOR / EJECUTOR / SUPERVISOR / APROBADOR
+
PROCESOS PERSONALES
+
PROCESOS ADMINISTRATIVOS
+
PROCESOS OPERATIVOS
+
PROCESOS HÍBRIDOS
+
DOMINIO CLIENTE
+
ACTORES DE SISTEMA
+
PROHIBICIÓN DE AUTORIZACIÓN POR NOMBRE DE ROL
```

Esto cierra la definición documental del mapa de actores. No certifica todavía su implementación física.

---

#### 20. Estado

```text
APROBADA
```

No se inicia `UX-STATION-001` hasta aprobación expresa de esta tarea.

