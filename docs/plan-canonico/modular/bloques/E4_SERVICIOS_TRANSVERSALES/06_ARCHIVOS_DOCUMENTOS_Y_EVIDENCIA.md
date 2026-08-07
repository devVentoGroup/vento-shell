### ARCHIVOS, DOCUMENTOS Y EVIDENCIA

### ✅ EVID-ARC-001 — Inventariar archivos y evidencia por proceso

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-020 — Definir alcance, prerrequisitos, métricas y criterios de aceptación del piloto de impresión` — APROBADA
**Tarea siguiente:** `EVID-ARC-002 — Definir propietario funcional de cada tipo documental` — RESERVADA
**Tipo de tarea:** documental; inventario transversal de soportes AS-IS, artefactos documentales y evidencia mínima por proceso canónico
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Cambios físicos autorizados:** ninguno; no crea buckets, tablas, migraciones, políticas, archivos productivos, backfills, integraciones ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar un inventario único por identidad de proceso que distinga el soporte AS-IS ya documentado, los artefactos o documentos que el contrato funcional exige conservar y la evidencia mínima que permite sostener afirmaciones o cierres, sin tratar un archivo aislado como fuente de verdad ni inventar instancias físicas no verificadas.

---

#### 1. Propósito y resultado sustantivo

Esta tarea fija la línea base documental y evidencial de los 69 procesos canónicos para que las decisiones posteriores de propiedad, clasificación, metadatos, retención, acceso, inmutabilidad, purga y contingencia partan de un universo reconciliado.

El inventario queda gobernado por cuatro reglas:

1. `VPROC-*` es la clave primaria de enlace; los alias `ASIS-SRC-*` y `ADICIONAL-PROVISIONAL-*` se conservan solo como trazabilidad.
2. Un documento o artefacto debe vincularse con el registro empresarial que representa; el archivo aislado no constituye la fuente de verdad.
3. Foto, firma, lectura, payload, comprobante o soporte constituyen evidencia solo cuando preservan procedencia e integridad y se relacionan con una afirmación o recurso; su existencia no prueba por sí sola conformidad, aprobación, pago, entrega o cierre.
4. Esta tarea inventaría tipos y obligaciones documentales/evidenciales por proceso. No afirma nombres de archivo, rutas de Storage, hashes, tamaños, versiones físicas, conteos de instancias ni existencia productiva que las fuentes actuales no hayan verificado.

---

#### 2. Fuentes canónicas consumidas

- `PROC-ASIS-CATALOG-001`: soportes, medios y evidencia observados para los 62 procesos con precursor AS-IS.
- `PROC-CAT-003`: identidad estable de 69 procesos, `VPROC-0001` a `VPROC-0069`.
- `PROC-CAT-015`: contrato de información de entrada y semántica de evidencia.
- `PROC-CAT-016`: contrato de resultados; 381 grupos de salida canónica y 271 grupos de evidencia de cierre ya definidos para los 69 procesos.
- `PROC-CAT-018`: auditoría y trazabilidad de accesos, documentos y evidencia.
- `PROC-CAT-020`: frontera final de procesos, incluida la separación entre costos/rentabilidad y presupuesto.
- Requisitos no funcionales vigentes sobre trazabilidad, accesibilidad documental, recuperación y compatibilidad de archivos/dispositivos.

---

#### 3. Taxonomía aplicada al inventario

| Capa                              | Qué representa en este inventario                                                                                                   | Regla                                                                                           |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| Soporte AS-IS documentado         | Papel, Excel, WhatsApp, Drive, sistemas, capturas, mensajes, documentos u otros medios observados en la línea base                  | Es evidencia de cómo opera u operó el proceso; no se promueve automáticamente a fuente canónica |
| Documento o artefacto empresarial | Orden, acta, recibo, etiqueta, certificado, informe, expediente, publicación u otro artefacto producido o conservado por el proceso | Debe estar vinculado al registro canónico correspondiente                                       |
| Evidencia                         | Foto, firma, lectura, payload, comprobante, soporte, POD, checklist, acuse u observación que demuestra una afirmación               | Requiere procedencia e integridad; no equivale automáticamente al efecto empresarial            |
| Registro empresarial              | Hecho, maestro, ledger, decisión, estado o registro autoritativo del proceso                                                        | No se sustituye por PDF, captura, archivo o mensaje                                             |

La política concreta de propietario, clasificación, metadatos obligatorios, retención, acceso temporal, apéndice inmutable, purga y contingencia permanece en sus tareas EVID propietarias posteriores y no se anticipa aquí.

---

#### 4. Inventario materializado por proceso

| Proceso      | Soporte AS-IS documentado                                                               | Artefactos / documentos vinculados al proceso                                                                            | Evidencia mínima exigida                                                                                      |
| ------------ | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | `ASIS-SRC-001` — Reuniones, mensajes y documentos.                                      | Registro de decisión; acta y compromisos.                                                                                | Acta o soporte de aprobación; aceptación de responsables; verificación de cumplimiento o cierre.              |
| `VPROC-0002` | `ASIS-SRC-002` — Documentos registrales, conocimiento y sistemas.                       | Catálogo de estructura; expediente o soporte del cambio estructural.                                                     | Documento o decisión fuente; validación jurídica/operativa; comprobación de propagación a consumidoras.       |
| `VPROC-0003` | `ASIS-SRC-003` — Documentos, matrices y decisiones.                                     | Política o delegación versionada.                                                                                        | Aprobación competente; publicación controlada; confirmación de sustitución o retiro.                          |
| `VPROC-0004` | `ASIS-SRC-004` — Llamadas, WhatsApp y archivos.                                         | Paquete de handoff y compromiso.                                                                                         | Aceptación del receptor; evidencia de entrega; confirmación de cumplimiento o destino del pendiente.          |
| `VPROC-0005` | `ASIS-SRC-005` — HV/CV, entrevistas, pruebas y mensajes.                                | Requisición/vacante; expediente de candidato; evaluación; oferta; handoff.                                               | Aprobación de necesidad; evidencia de evaluación; aceptación/rechazo; traspaso autorizado.                    |
| `VPROC-0006` | `ASIS-SRC-006` — Documentos administrativos y soportes de terceros.                     | Caso de incorporación; expediente; checklist; solicitudes de acceso/equipo.                                              | Documentos y aprobaciones; aceptación de incorporación; confirmación de habilitaciones.                       |
| `VPROC-0007` | `ASIS-SRC-007` — VISO y mensajes.                                                       | Asignación; horario/programación; publicación e historial.                                                               | Aprobación/publicación; notificación; aceptación cuando aplique; resolución de conflicto.                     |
| `VPROC-0008` | `ASIS-SRC-008` — ANIMA y VISO.                                                          | Hechos de asistencia y decisión de corrección.                                                                           | Captura autenticada; geolocalización/evidencia; aprobación de corrección; conciliación final.                 |
| `VPROC-0009` | `ASIS-SRC-009` — Mensajes, comunicación verbal y registros parciales.                   | Caso laboral y soportes.                                                                                                 | Solicitud y soportes; decisión autorizada; confirmación de ajuste de turno o reemplazo.                       |
| `VPROC-0010` | `ASIS-SRC-010` — Archivos, revisión y plataforma bancaria.                              | Paquete de liquidación; detalle; instrucción de pago; conciliación.                                                      | Cálculo reproducible; aprobación segregada; confirmación bancaria; conciliación/diferencias.                  |
| `VPROC-0011` | `ASIS-SRC-011` — Comunicaciones informales, control manual y sistemas.                  | Expediente de retiro; checklist; documentos finales; certificado de cierre.                                              | Decisión de retiro; devoluciones aceptadas; accesos revocados; documentos/obligaciones cerrados.              |
| `VPROC-0012` | `ASIS-SRC-012` — Formularios, observación y evidencia dispersa.                         | Registro de riesgo; inspección; control; plan de acción; riesgo residual.                                                | Evidencia de inspección; aceptación del control; verificación de eficacia; decisión de riesgo residual.       |
| `VPROC-0013` | `ASIS-SRC-013` — Comunicación inmediata, documentos y terceros.                         | Expediente de incidente; investigación; acciones.                                                                        | Registro inicial; atención/notificaciones; investigación aprobada; acciones verificadas; cierre.              |
| `VPROC-0014` | `ASIS-SRC-014` — Revisión operativa, papel y archivos.                                  | Procedimiento; plan de control; ejecución; checklist y mediciones.                                                       | Checklist/mediciones; actor o firma; evidencia; verificación independiente cuando aplique.                    |
| `VPROC-0015` | `ASIS-SRC-015` — Aplicaciones, archivos y decisiones distribuidas.                      | Maestro de producto; presentaciones; unidades; equivalencias.                                                            | Aprobación de alta/cambio; validación de unidades; conciliación legacy.                                       |
| `VPROC-0016` | `ASIS-SRC-016` — Documentos, conocimiento y FOGO parcial.                               | Receta/versiones; resultados de prueba; aprobación; snapshot publicado.                                                  | Prueba documentada; revisión/aprobación; validación de rendimiento, alérgenos y conservación.                 |
| `VPROC-0017` | `ASIS-SRC-017` — Makos, menús digitales, ManyChat e Instagram.                          | Versión de oferta y publicación de catálogo.                                                                             | Aprobación comercial; comprobación de publicación; reconciliación de vigencia/retiro.                         |
| `VPROC-0018` | `ASIS-SRC-018` — Conocimiento técnico, documentos y validación manual.                  | Especificación; alérgenos; restricciones; criterios de calidad.                                                          | Revisión técnica; aprobación; confirmación de propagación; evidencia de cambio material.                      |
| `VPROC-0019` | `ASIS-SRC-019` — Avisos, WhatsApp, archivos y ORIGO.                                    | Solicitud de compra; consolidación; decisión.                                                                            | Justificación/validación; aceptación del área compradora; resolución de duplicados/consolidación.             |
| `VPROC-0020` | `ASIS-SRC-020` — Llamadas, mensajes y cotizaciones.                                     | Expediente de cotizaciones; comparación; evaluación; recomendación; decisión.                                            | Cotizaciones íntegras; criterios/ponderaciones; conflictos; aprobación de recomendación.                      |
| `VPROC-0021` | `ASIS-SRC-021` — Aprobaciones, mensajes, documentos y ORIGO.                            | Orden de compra aprobada; compromiso; comunicación al proveedor.                                                         | Aprobaciones segregadas; aceptación/confirmación del proveedor; versión emitida.                              |
| `VPROC-0022` | `ASIS-SRC-022` — Recepción física, factura, ORIGO y NEXO.                               | Recepción de compra; diferencias; documentos asociados.                                                                  | Conteo/inspección; documentos; aceptación de custodio; resolución de diferencias; conciliación.               |
| `VPROC-0023` | `ASIS-SRC-023` — Conocimiento local, etiquetas y NEXO.                                  | Catálogo de ubicaciones; etiqueta/identificación.                                                                        | Validación física; aprobación; etiqueta/identificación; confirmación de puesta en servicio o cierre.          |
| `VPROC-0024` | `ASIS-SRC-024` — Operación física y NEXO.                                               | Movimiento; proyección de stock; escaneos/evidencia.                                                                     | Aceptación de origen/destino; escaneo/evidencia; conciliación de cantidades.                                  |
| `VPROC-0025` | `ASIS-SRC-025` — NEXO, comunicaciones y registros manuales.                             | Movimiento de retiro/consumo/traslado; custodia/recibo.                                                                  | Autorización; preparación/entrega; aceptación del receptor; conciliación de unidades.                         |
| `VPROC-0026` | `ASIS-SRC-026` — NEXO, formularios, Excel y revisión manual.                            | Observación de conteo; sesión; diferencia; investigación; decisión de ajuste.                                            | Captura por actor; cierre de sesión; revisión; aprobación; conciliación posterior.                            |
| `VPROC-0027` | `ASIS-SRC-027` — Observación, avisos y registros incompletos.                           | Condición/cuarentena/vencimiento/merma; decisión de disposición.                                                         | Lecturas/evidencias; evaluación; autorización; movimiento/disposición correlacionada.                         |
| `VPROC-0028` | `ASIS-SRC-028` — NEXO, papel, Excel, capturas y WhatsApp.                               | Solicitud de abastecimiento; cantidad aprobada; preparación; despacho; tránsito; recepción; conciliación.                | Aceptación de cada handoff; prueba de entrega; recepción y conciliación final.                                |
| `VPROC-0029` | `ASIS-SRC-029` — Inventarios parciales, conocimiento y documentos.                      | Registro de activo; identidad; ubicación; custodia; préstamo/transferencia; historial.                                   | Alta validada; aceptación de custodia; conteo; devolución/transferencia confirmada.                           |
| `VPROC-0030` | `ASIS-SRC-030` — Comunicaciones, técnicos externos y soportes.                          | Orden de mantenimiento; diagnóstico; reparaciones/repuestos; prueba; liberación; garantía/disposición.                   | Evidencia técnica; consumo de repuestos; validación de prueba; aprobación de liberación o baja.               |
| `VPROC-0031` | `ASIS-SRC-031` — Recibos, control manual y conocimiento.                                | Registro de vehículo; disponibilidad; asignación; kilometraje; combustible; documentos; incidencias.                     | Inspección; lectura; soporte de carga; aceptación del conductor; resolución de incidencia.                    |
| `VPROC-0032` | `ASIS-SRC-032` — Separación física, memoria operativa y soporte de entrega.             | Catálogo de reutilizables/contenedores; custodia; entregas; retornos; pérdida/daño.                                      | Conteo/aceptación; evidencia de entrega/devolución; conciliación de faltantes.                                |
| `VPROC-0033` | `ASIS-SRC-033` — Tablas, mensajes, capturas y llamadas.                                 | Plan de producción versionado; órdenes planificadas; capacidad; faltantes; aprobación.                                   | Fuentes de demanda; revisión de capacidad; aprobación; publicación; aceptación de cambios.                    |
| `VPROC-0034` | `ASIS-SRC-034` — Operación física, recetas parciales y FOGO.                            | Orden de producción; lote; receta; materiales; etapas; cantidades; rendimiento; desviaciones.                            | Identificación de lote; capturas por etapa; confirmación de consumos/salida; cierre de ejecución.             |
| `VPROC-0035` | `ASIS-SRC-035` — Revisión por área y evidencia no uniforme.                             | Inspección de calidad; resultados; no conformidad; disposición.                                                          | Método/instrumento/evidencia; autoridad de disposición; verificación cuando aplique.                          |
| `VPROC-0036` | `ASIS-SRC-036` — Actividad física, etiquetas y medios parciales.                        | Registro de empaque; etiquetas/códigos; LPN; handoff a almacenamiento.                                                   | Verificación material/etiqueta; escaneo; aceptación de bodega; conciliación de cantidades.                    |
| `VPROC-0037` | `ASIS-SRC-037` — Conocimiento de producto y registros parciales.                        | Reproceso; genealogía; rendimiento; merma; cierre.                                                                       | Autorización; consumo/salida; inspección de calidad; conciliación material/económica.                         |
| `VPROC-0038` | `ASIS-SRC-038` — Makos, servicio, pedidos e impresión.                                  | Servicio de mesa; pedido/versiones; preparación; entrega; pago; cierre de cuenta.                                        | Aceptación de pedido; confirmaciones de estación/entrega; pago; conciliación mesa/caja.                       |
| `VPROC-0039` | `ASIS-SRC-039` — Makos, caja, mostrador y preparación.                                  | Pedido mostrador/para llevar; promesa; preparación; handoff; pago; cierre.                                               | Confirmación de preparación; prueba de entrega o no recogido; pago; conciliación.                             |
| `VPROC-0040` | `ASIS-SRC-040` — Plataformas externas y continuidad manual.                             | Payload externo preservado; pedido normalizado; mapping; pedido interno; discrepancia.                                   | Autenticación/deduplicación; aceptación interna; confirmación técnica/empresarial; conciliación final.        |
| `VPROC-0041` | `ASIS-SRC-041` — Mensajes, archivos, coordinación y producción.                         | Oportunidad B2B; cotización; decisión de capacidad; pedido; expediente producción-factura-entrega.                       | Aceptación de oferta; aprobaciones/depósitos; entregas/facturas; conciliación/cierre.                         |
| `VPROC-0042` | `ASIS-SRC-042` — Makos, comunicaciones internas y controles parciales.                  | Caso de cambio; antes/después; decisión; efectos.                                                                        | Autoridad/motivo; aceptación del cliente cuando aplique; confirmación de efectos; conciliación.               |
| `VPROC-0043` | `ASIS-SRC-043` — Makos, medios de pago y facturación.                                   | Intentos de pago; autorización/captura; asignación a venta; soporte fiscal; reverso/reembolso; conciliación.             | Respuesta del proveedor; comprobante; cierre caja/banco; conciliación de venta.                               |
| `VPROC-0044` | `ASIS-SRC-044` — Makos, soportes y revisión administrativa.                             | Sesión de caja; esperado vs. observado; diferencias; aprobaciones; entrega; depósito.                                    | Conteo/soportes; aceptación de entrega; aprobación de diferencias; conciliación final.                        |
| `VPROC-0045` | `ASIS-SRC-045` — PASS, PULSO y caja.                                                    | Perfil de cliente; consentimientos; cuenta/ledger de fidelización; beneficios/redenciones.                               | Verificación de identidad; versión de consentimiento; movimiento aplicado; conciliación/notificación.         |
| `VPROC-0046` | `ASIS-SRC-046` — Comunicación directa y canales digitales.                              | Caso de reclamo; clasificación; investigación; resolución; compensación; devolución/reembolso; causa/acciones.           | Acuse; evidencia; decisión; ejecución de compensación; aceptación o cierre justificado.                       |
| `VPROC-0047` | `ASIS-SRC-047` — Mensajes, llamadas y coordinación manual.                              | Reserva/evento; capacidad; comunicaciones; consentimiento; depósitos; asistencia/no-show/cancelación.                    | Confirmación/aceptación; pago/depósito; comunicaciones; resultado del evento; conciliación.                   |
| `VPROC-0048` | `ASIS-SRC-048` — Coordinación manual, conductor y soportes.                             | Plan de ruta; paradas; vehículo/conductor; carga; manifiesto; restricciones; publicación.                                | Validación de disponibilidad; aceptación de asignaciones; publicación; conciliación de carga real.            |
| `VPROC-0049` | `ASIS-SRC-049` — Conductor, papel, mensajes y comprobantes de entrega.                  | Viaje; paradas; POD; rechazo/incidente; custodia; retornos; kilometraje; cierre.                                         | Aceptación de custodia; pruebas; cierre de paradas; retorno/conciliación.                                     |
| `VPROC-0050` | `ASIS-SRC-050` — Tercero externo y seguimiento parcial.                                 | Caso de entrega de tercero; asignación; tracking; POD; incidentes; retorno; liquidación/conciliación.                    | Confirmación del tercero; prueba de entrega; conciliación de pedido/pago/liquidación.                         |
| `VPROC-0051` | `ASIS-SRC-051` — Archivos, sistemas fuente y NUMERA.                                    | Hecho económico; clasificación contable; asiento; soporte.                                                               | Validación de fuente; aprobación cuando aplique; contabilización; conciliación/periodo cerrado.               |
| `VPROC-0052` | `ASIS-SRC-052` — Soportes, revisión y plataforma bancaria.                              | Obligación; aprobación; instrucción de pago; resultado bancario; conciliación.                                           | Documentos/aceptación; segregación; confirmación bancaria; conciliación obligación/pago.                      |
| `VPROC-0053` | `ASIS-SRC-053` — Seguimiento administrativo y registros parciales.                      | Cuenta por cobrar; acciones de cobro; pago/aplicación; disputa/diferencia.                                               | Documento de origen; comunicaciones; confirmación bancaria/caja; aplicación/conciliación.                     |
| `VPROC-0054` | `ASIS-SRC-054` — Excel, archivos y datos parciales.                                     | Modelo de costos; distribución; cierre de costos; resultados; rentabilidad; variación.                                   | Fuentes conciliadas; aprobación de reglas; cierre de periodo; revisión de variaciones.                        |
| `VPROC-0055` | `ASIS-SRC-055` — Trabajo operativo, comunicaciones y terceros.                          | Plan de instalaciones; orden de trabajo; ejecución; desviación; liberación.                                              | Checklist/lecturas/evidencia; aceptación del responsable; prueba/liberación.                                  |
| `VPROC-0056` | `ASIS-SRC-056` — Marketing, redes, archivos y aprobaciones.                             | Brief; contenido/promoción versionada; revisión; aprobación; publicación; retiro; archivo.                               | Derechos/aprobaciones; comprobación de publicación; validación de vigencia; retiro confirmado.                |
| `VPROC-0057` | `ASIS-SRC-057` — Canales externos y continuidad humana.                                 | Consulta/lead; consentimiento; calificación; asignación; conversación; oportunidad; handoff.                             | Acuse; respuesta; aceptación del responsable; traspaso correlacionado; cierre con motivo.                     |
| `VPROC-0058` | `ASIS-SRC-058` — WhatsApp, comunicación verbal y ejecución directa.                     | Ticket tecnológico; clasificación/SLA; diagnóstico; workaround; conocimiento; cierre.                                    | Acuse; trazas autorizadas; validación de restauración; aceptación o cierre justificado.                       |
| `VPROC-0059` | `ASIS-SRC-059` — Solicitudes informales y sistemas separados.                           | Solicitud de acceso; aprobaciones; entitlement; resultado de provisión; revocación; attestación.                         | Autoridad/segregación; evidencia de provisión; prueba de acceso mínimo; revocación/verificación.              |
| `VPROC-0060` | `ASIS-SRC-060` — Papel, Drive, aplicaciones y archivos locales.                         | Registro documental; versión; metadatos; clasificación; firmas; retención/hold; custodia; certificado de disposición.    | Hash/integridad; firmas; aceptación de custodia; autorización de disposición; comprobación de almacenamiento. |
| `VPROC-0061` | `ASIS-SRC-061` — Excel, exportaciones y datos de aplicaciones.                          | Medición; snapshot de fuente; análisis; insight; decisión/plan de mejora; medición posterior.                            | Calidad de datos; método/revisión; aprobación de acción; medición posterior.                                  |
| `VPROC-0062` | `ASIS-SRC-062` — Papel, mensajes y soporte técnico.                                     | Caso de continuidad; impacto/severidad; plan; modo degradado; recuperación; conciliación; postmortem.                    | Detección validada; autoridad de activación; pruebas de recuperación; conciliación; cierre postevento.        |
| `VPROC-0063` | `ADICIONAL-PROVISIONAL-A` — sin precursor AS-IS explícito; no se afirma archivo actual. | Registro de riesgo; valoración; controles; tratamiento; aceptación/seguimiento.                                          | Metodología; aprobación de propietario; evidencia de controles; revisión periódica.                           |
| `VPROC-0064` | `ADICIONAL-PROVISIONAL-B` — sin precursor AS-IS explícito; no se afirma archivo actual. | Expediente de asesor/autoridad; requerimiento; comunicaciones; entregable; vencimientos; decisión interna.               | Documento de autoridad/contrato; recepción de entregable; validación interna; evidencia de respuesta.         |
| `VPROC-0065` | `ADICIONAL-PROVISIONAL-C` — sin precursor AS-IS explícito; no se afirma archivo actual. | Ciclo de desempeño; objetivos; feedback; plan de desarrollo; revisión; decisión; constancia del trabajador.              | Criterios/objetivos comunicados; aportes; revisión; aceptación o constancia de desacuerdo.                    |
| `VPROC-0066` | `ADICIONAL-PROVISIONAL-D` — sin precursor AS-IS explícito; no se afirma archivo actual. | Requisito de EPP; asignación; entrega/aceptación; formación; vigencia; reemplazo; devolución.                            | Matriz aplicable; entrega/ajuste; aceptación; formación; devolución/disposición.                              |
| `VPROC-0067` | `ADICIONAL-PROVISIONAL-E` — sin precursor AS-IS explícito; no se afirma archivo actual. | Definición/versionado de kit; instancia; manifiesto de componentes; completitud; custodia; préstamo/retorno/sustitución. | Armado/verificación; aceptación de custodia; devolución; conciliación de componentes.                         |
| `VPROC-0068` | `ADICIONAL-PROVISIONAL-F` — sin precursor AS-IS explícito; no se afirma archivo actual. | Instrumento de medición; muestra; invitación; respuesta; resultados; sesgo.                                              | Consentimiento; regla de una respuesta; cierre de muestra; revisión metodológica.                             |
| `VPROC-0069` | `ADICIONAL-PROVISIONAL-G` — sin precursor AS-IS explícito; no se afirma archivo actual. | Presupuesto/versiones; supuestos; líneas; aprobación; vigencia; consumo; forecast; variación; supersesión.               | Consistencia/sumas; aprobaciones; publicación; cierre/supersesión; conciliación con hechos.                   |

---

#### 5. Reconciliación cuantitativa

| Control                                                    | Resultado |
| ---------------------------------------------------------- | --------: |
| Procesos esperados                                         |        69 |
| Procesos materializados                                    |        69 |
| Identificadores `VPROC-*` únicos                           |        69 |
| Faltantes                                                  |         0 |
| Duplicados                                                 |         0 |
| Procesos con precursor `ASIS-SRC-*`                        |        62 |
| Procesos adicionales sin precursor AS-IS explícito         |         7 |
| Procesos con artefactos/documentos asociados inventariados |        69 |
| Procesos con evidencia mínima inventariada                 |        69 |
| Instancias físicas de archivo inventadas                   |         0 |
| Rutas, hashes o URLs inventados                            |         0 |

La reconciliación conserva la línea base de `PROC-CAT-016`: 381 grupos de salida canónica y 271 grupos de evidencia de cierre. Esos grupos no se reinterpretan como 652 archivos físicos; representan obligaciones funcionales que pueden materializar registros, documentos, artefactos, proyecciones, acuses o evidencia según su clasificación canónica.

---

#### 6. Decisiones canónicas de EVID-ARC-001

1. El universo inicial del servicio transversal de archivos y evidencia queda anclado a los 69 procesos canónicos, no a carpetas, aplicaciones ni repositorios.
2. Los 62 procesos con precursor AS-IS conservan sus medios observados como trazabilidad de origen; no se asume que esos medios ya cumplen integridad, clasificación, acceso, retención o custodia objetivo.
3. Los siete procesos adicionales no reciben archivos actuales ficticios. Su inventario comienza únicamente con artefactos y evidencia exigidos por el contrato funcional aprobado.
4. Papel, Excel, WhatsApp, Drive, capturas, mensajes y archivos locales pueden ser soporte transitorio o evidencia histórica, pero no se convierten por presencia en registro autoritativo.
5. Un documento generado debe conservar referencia al registro empresarial que le da significado; una copia aislada no puede gobernar estado, saldo, cantidad, autorización o cierre.
6. Un comprobante, acuse o payload externo demuestra como máximo la afirmación respaldada por su contrato; los efectos empresariales que requieran conciliación permanecen sujetos a esa conciliación.
7. Para `VPROC-0060`, el inventario incluye el propio registro documental, versión, metadatos, clasificación, firmas, retención/hold, custodia y disposición como parte del ciclo documental transversal; las demás aplicaciones no deben recrear una fuente documental competidora.
8. `VPROC-0054` conserva costos, distribución, cierre, rentabilidad y variaciones; el ciclo presupuestal pertenece a `VPROC-0069` y no se mezcla nuevamente en este inventario.
9. Esta tarea no asigna propietario funcional por tipo documental, clasificación de sensibilidad, esquema de metadatos, política de retención, mecanismo de URL firmada, regla de acceso, append-only, purga ni contingencia de Storage.
10. No se declara ningún bucket, objeto de Storage, tabla, vínculo físico, job de purga, política RLS, API, archivo productivo o evidencia operativa como implementado o validado.

---

#### 7. Frontera con las tareas EVID posteriores

| Decisión no tomada en esta tarea                        | Tarea propietaria reservada |
| ------------------------------------------------------- | --------------------------- |
| Propietario funcional por tipo documental               | `EVID-ARC-002`              |
| Clasificación de sensibilidad por tipo                  | `EVID-ARC-003`              |
| Metadatos, versión y vínculo con recurso                | `EVID-ARC-004`              |
| Retención y disposición por tipo                        | `EVID-ARC-005`              |
| Acceso temporal mediante URL firmada                    | `EVID-ARC-006`              |
| Descarga, compartición, impresión y auditoría de acceso | `EVID-ARC-007`              |
| Evidencia que deba ser append-only                      | `EVID-ARC-008`              |
| Jobs de purga y auditoría de eliminación                | `EVID-ARC-009`              |
| Contingencia ante indisponibilidad de Storage           | `EVID-ARC-010`              |

Estas reservas no reducen el inventario actual: cada proceso ya tiene su soporte de origen cuando existe, sus artefactos asociados y su evidencia mínima materializados en la sección 4.

---

#### 8. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea consolida y reconcilia inventario documental/evidencial ya exigido por contratos de proceso y requisitos vigentes. No crea una nueva regla de negocio, autorización, transformación, transición, restricción de integridad, integración o comportamiento ejecutable. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0; el registro de requisitos permanece sin cambios.

---

#### 9. Criterios de aceptación

- [x] los 69 procesos `VPROC-0001` a `VPROC-0069` están representados exactamente una vez en la matriz;
- [x] la cobertura reconciliada es 69 esperados, 69 materializados, 0 faltantes y 0 duplicados;
- [x] las 62 referencias AS-IS conservan su trazabilidad y los siete procesos adicionales se identifican sin inventar soporte actual;
- [x] cada proceso tiene artefactos/documentos vinculados y evidencia mínima explícita;
- [x] se distingue soporte AS-IS de documento/artefacto, evidencia y registro empresarial;
- [x] ningún archivo aislado se presenta como fuente de verdad;
- [x] no se inventan nombres de archivo, rutas, hashes, URLs, tamaños, versiones físicas o existencia productiva;
- [x] la frontera de `VPROC-0054` y `VPROC-0069` conserva la separación canónica entre costos/rentabilidad y presupuesto;
- [x] las decisiones de `EVID-ARC-002` a `EVID-ARC-010` permanecen reservadas a sus tareas propietarias;
- [x] no se declara código, Storage, Supabase, migraciones, RLS, jobs, APIs ni evidencia operativa implementados;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `EVID-ARC-002` permanece reservada y no iniciada.

---

#### 10. Handoff cerrado hacia EVID-ARC-002

`EVID-ARC-002` recibe un universo cerrado de 69 procesos con soporte AS-IS conocido cuando existe, artefactos/documentos asociados y evidencia mínima. Su responsabilidad será asignar propietario funcional a cada tipo documental que derive de este inventario sin cambiar identidades de proceso, reinterpretar evidencia como fuente de verdad ni desarrollar las decisiones reservadas para `EVID-ARC-003` a `EVID-ARC-010`.

La aprobación de `EVID-ARC-001` no inicia, desarrolla ni aprueba `EVID-ARC-002`.


### ✅ EVID-ARC-002 — Definir propietario funcional de cada tipo documental

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-001 — Inventariar archivos y evidencia por proceso` — APROBADA
**Tarea siguiente:** `EVID-ARC-003 — Definir clasificación de sensibilidad` — RESERVADA
**Tipo de tarea:** documental; asignación funcional de propiedad sobre tipos documentales y artefactos contextualizados por proceso
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Aplicaciones propietarias funcionales utilizadas:** 9
**Cambios físicos autorizados:** ninguno; no crea buckets, tablas, migraciones, políticas RLS, archivos productivos, jobs, APIs ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** asignar una única aplicación propietaria funcional a todos los tipos documentales y artefactos ya inventariados por `EVID-ARC-001`, preservando la autoridad de la aplicación propietaria de cada proceso y evitando que el servicio transversal de documentos, Storage, un tercero o un expediente compuesto se conviertan en una fuente de verdad empresarial competidora.

---

#### 1. Propósito y resultado sustantivo

Esta tarea materializa la propiedad funcional del universo documental recibido de `EVID-ARC-001` sin crear todavía una taxonomía documental global. La unidad estable de resolución es el proceso `VPROC-*`: cada nombre documental o artefacto conserva literalmente el contexto en el que fue inventariado y hereda la autoridad funcional de la aplicación propietaria aprobada para ese proceso.

El resultado queda gobernado por cinco invariantes:

1. cada contexto `VPROC-*` resuelve exactamente a una aplicación propietaria funcional;
2. todos los tipos documentales y artefactos listados dentro de ese contexto heredan esa misma propietaria salvo que sean referencias a un registro fuente perteneciente a otro proceso, caso en el cual solo se conserva referencia o copia gobernada;
3. un expediente compuesto puede agrupar documentos de varias fuentes sin transferir la propiedad funcional de los registros fuente;
4. el servicio transversal de generación, custodia o evidencia ejecuta capacidades técnicas y no adquiere propiedad funcional del proceso ni del documento empresarial;
5. nombres homónimos como `aprobación`, `decisión`, `cierre`, `soporte` o `conciliación` no se fusionan entre procesos en esta tarea; la taxonomía documental global permanece reservada para `INFO-DOM-003`.

---

#### 2. Definición normativa de propietario funcional documental

Para E4, el **propietario funcional documental** es la aplicación empresarial que gobierna el significado, validez, corrección, vigencia y cierre del artefacto dentro del proceso que lo origina o lo conserva como resultado propio.

La propiedad funcional documental:

- sigue la autoridad funcional aprobada del proceso;
- no depende de la carpeta, bucket, tabla, repositorio, URL, dispositivo, sede o formato físico donde se almacene el contenido;
- no convierte a Supabase, Storage, `vento-shell`, el servicio transversal o un proveedor en propietario empresarial;
- no equivale a autoría material, custodia técnica, custodio físico, responsable legal, encargado de tratamiento ni actor humano aprobador;
- no concede acceso, permiso, descarga, edición, compartición, impresión ni disposición;
- no define sensibilidad, metadatos, retención, firma, inmutabilidad, URL temporal, purga o contingencia.

Las responsabilidades humanas, custodios, encargados, finalidades, territorios y taxonomía documental corporativa permanecen reservados para las tareas `INFO-DOM-*` correspondientes.

---

#### 3. Regla de resolución por tipo documental

La propiedad se resuelve en el siguiente orden:

```text
TIPO DOCUMENTAL O ARTEFACTO INVENTARIADO
        ↓
VPROC-* QUE LE DA CONTEXTO EMPRESARIAL
        ↓
owner_app_code APROBADO PARA ESE PROCESO
        ↓
PROPIETARIO FUNCIONAL DOCUMENTAL
```

Si un artefacto de un proceso contiene o referencia un documento cuyo registro fuente pertenece a otro `VPROC-*`, la aplicación del proceso actual gobierna únicamente su expediente, vínculo, aceptación o uso dentro de su propio resultado. El documento fuente mantiene la propiedad del proceso que lo originó.

La existencia de una copia, PDF, foto, payload, comprobante, exportación, snapshot o adjunto no cambia esta resolución.

---

#### 4. Estados de asignación heredados

| Estado                            | Uso en esta tarea                                                                                                        | Bloqueo o condición                                                             |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------- |
| `ASIGNADA`                        | La propietaria funcional documental coincide directamente con la propietaria del proceso.                                | `NINGUNO` documental; no implica implementación física.                         |
| `ASIGNADA_CON_FRONTERA`           | La propietaria es única, pero el artefacto puede vincular hechos, documentos, efectos o participantes de otros dominios. | `FRONTERA_OBLIGATORIA`: no absorbe registros fuente ni autoridad ajena.         |
| `ASIGNADA_EN_APLICACION_DIFERIDA` | La propietaria objetivo es definitiva aunque la aplicación permanezca diferida.                                          | `APLICACION_DIFERIDA`: no declarar disponibilidad, navegación o implementación. |

---

#### 5. Matriz materializada de propiedad funcional documental

Los nombres de la segunda columna se conservan desde `EVID-ARC-001` y no se normalizan ni consolidan como taxonomía global en esta tarea.

| Proceso      | Tipos documentales / artefactos contextualizados                                                                         | Propietaria funcional | Estado                            | Bloqueo / frontera     |
| ------------ | ------------------------------------------------------------------------------------------------------------------------ | --------------------- | --------------------------------- | ---------------------- |
| `VPROC-0001` | Registro de decisión; acta y compromisos.                                                                                | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0002` | Catálogo de estructura; expediente o soporte del cambio estructural.                                                     | `viso`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0003` | Política o delegación versionada.                                                                                        | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0004` | Paquete de handoff y compromiso.                                                                                         | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0005` | Requisición/vacante; expediente de candidato; evaluación; oferta; handoff.                                               | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0006` | Caso de incorporación; expediente; checklist; solicitudes de acceso/equipo.                                              | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0007` | Asignación; horario/programación; publicación e historial.                                                               | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0008` | Hechos de asistencia y decisión de corrección.                                                                           | `anima`               | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0009` | Caso laboral y soportes.                                                                                                 | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0010` | Paquete de liquidación; detalle; instrucción de pago; conciliación.                                                      | `numera`              | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0011` | Expediente de retiro; checklist; documentos finales; certificado de cierre.                                              | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0012` | Registro de riesgo; inspección; control; plan de acción; riesgo residual.                                                | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0013` | Expediente de incidente; investigación; acciones.                                                                        | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0014` | Procedimiento; plan de control; ejecución; checklist y mediciones.                                                       | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0015` | Maestro de producto; presentaciones; unidades; equivalencias.                                                            | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0016` | Receta/versiones; resultados de prueba; aprobación; snapshot publicado.                                                  | `fogo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0017` | Versión de oferta y publicación de catálogo.                                                                             | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0018` | Especificación; alérgenos; restricciones; criterios de calidad.                                                          | `nexo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0019` | Solicitud de compra; consolidación; decisión.                                                                            | `origo`               | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0020` | Expediente de cotizaciones; comparación; evaluación; recomendación; decisión.                                            | `origo`               | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0021` | Orden de compra aprobada; compromiso; comunicación al proveedor.                                                         | `origo`               | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0022` | Recepción de compra; diferencias; documentos asociados.                                                                  | `origo`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0023` | Catálogo de ubicaciones; etiqueta/identificación.                                                                        | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0024` | Movimiento; proyección de stock; escaneos/evidencia.                                                                     | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0025` | Movimiento de retiro/consumo/traslado; custodia/recibo.                                                                  | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0026` | Observación de conteo; sesión; diferencia; investigación; decisión de ajuste.                                            | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0027` | Condición/cuarentena/vencimiento/merma; decisión de disposición.                                                         | `nexo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0028` | Solicitud de abastecimiento; cantidad aprobada; preparación; despacho; tránsito; recepción; conciliación.                | `nexo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0029` | Registro de activo; identidad; ubicación; custodia; préstamo/transferencia; historial.                                   | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0030` | Orden de mantenimiento; diagnóstico; reparaciones/repuestos; prueba; liberación; garantía/disposición.                   | `nexo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0031` | Registro de vehículo; disponibilidad; asignación; kilometraje; combustible; documentos; incidencias.                     | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0032` | Catálogo de reutilizables/contenedores; custodia; entregas; retornos; pérdida/daño.                                      | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0033` | Plan de producción versionado; órdenes planificadas; capacidad; faltantes; aprobación.                                   | `fogo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0034` | Orden de producción; lote; receta; materiales; etapas; cantidades; rendimiento; desviaciones.                            | `fogo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0035` | Inspección de calidad; resultados; no conformidad; disposición.                                                          | `fogo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0036` | Registro de empaque; etiquetas/códigos; LPN; handoff a almacenamiento.                                                   | `fogo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0037` | Reproceso; genealogía; rendimiento; merma; cierre.                                                                       | `fogo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0038` | Servicio de mesa; pedido/versiones; preparación; entrega; pago; cierre de cuenta.                                        | `pulso`               | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0039` | Pedido mostrador/para llevar; promesa; preparación; handoff; pago; cierre.                                               | `pulso`               | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0040` | Payload externo preservado; pedido normalizado; mapping; pedido interno; discrepancia.                                   | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0041` | Oportunidad B2B; cotización; decisión de capacidad; pedido; expediente producción-factura-entrega.                       | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0042` | Caso de cambio; antes/después; decisión; efectos.                                                                        | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0043` | Intentos de pago; autorización/captura; asignación a venta; soporte fiscal; reverso/reembolso; conciliación.             | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0044` | Sesión de caja; esperado vs. observado; diferencias; aprobaciones; entrega; depósito.                                    | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0045` | Perfil de cliente; consentimientos; cuenta/ledger de fidelización; beneficios/redenciones.                               | `pass`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0046` | Caso de reclamo; clasificación; investigación; resolución; compensación; devolución/reembolso; causa/acciones.           | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0047` | Reserva/evento; capacidad; comunicaciones; consentimiento; depósitos; asistencia/no-show/cancelación.                    | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0048` | Plan de ruta; paradas; vehículo/conductor; carga; manifiesto; restricciones; publicación.                                | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0049` | Viaje; paradas; POD; rechazo/incidente; custodia; retornos; kilometraje; cierre.                                         | `nexo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0050` | Caso de entrega de tercero; asignación; tracking; POD; incidentes; retorno; liquidación/conciliación.                    | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0051` | Hecho económico; clasificación contable; asiento; soporte.                                                               | `numera`              | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0052` | Obligación; aprobación; instrucción de pago; resultado bancario; conciliación.                                           | `numera`              | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0053` | Cuenta por cobrar; acciones de cobro; pago/aplicación; disputa/diferencia.                                               | `numera`              | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0054` | Modelo de costos; distribución; cierre de costos; resultados; rentabilidad; variación.                                   | `numera`              | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0055` | Plan de instalaciones; orden de trabajo; ejecución; desviación; liberación.                                              | `nexo`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0056` | Brief; contenido/promoción versionada; revisión; aprobación; publicación; retiro; archivo.                               | `aura`                | `ASIGNADA_EN_APLICACION_DIFERIDA` | `APLICACION_DIFERIDA`  |
| `VPROC-0057` | Consulta/lead; consentimiento; calificación; asignación; conversación; oportunidad; handoff.                             | `aura`                | `ASIGNADA_EN_APLICACION_DIFERIDA` | `APLICACION_DIFERIDA`  |
| `VPROC-0058` | Ticket tecnológico; clasificación/SLA; diagnóstico; workaround; conocimiento; cierre.                                    | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0059` | Solicitud de acceso; aprobaciones; entitlement; resultado de provisión; revocación; attestación.                         | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0060` | Registro documental; versión; metadatos; clasificación; firmas; retención/hold; custodia; certificado de disposición.    | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0061` | Medición; snapshot de fuente; análisis; insight; decisión/plan de mejora; medición posterior.                            | `numera`              | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0062` | Caso de continuidad; impacto/severidad; plan; modo degradado; recuperación; conciliación; postmortem.                    | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0063` | Registro de riesgo; valoración; controles; tratamiento; aceptación/seguimiento.                                          | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0064` | Expediente de asesor/autoridad; requerimiento; comunicaciones; entregable; vencimientos; decisión interna.               | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0065` | Ciclo de desempeño; objetivos; feedback; plan de desarrollo; revisión; decisión; constancia del trabajador.              | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0066` | Requisito de EPP; asignación; entrega/aceptación; formación; vigencia; reemplazo; devolución.                            | `viso`                | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0067` | Definición/versionado de kit; instancia; manifiesto de componentes; completitud; custodia; préstamo/retorno/sustitución. | `nexo`                | `ASIGNADA`                        | `NINGUNO`              |
| `VPROC-0068` | Instrumento de medición; muestra; invitación; respuesta; resultados; sesgo.                                              | `pulso`               | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |
| `VPROC-0069` | Presupuesto/versiones; supuestos; líneas; aprobación; vigencia; consumo; forecast; variación; supersesión.               | `numera`              | `ASIGNADA_CON_FRONTERA`           | `FRONTERA_OBLIGATORIA` |

---

#### 6. Reconciliación cuantitativa

| Control                                                     | Resultado |
| ----------------------------------------------------------- | --------: |
| Contextos de proceso esperados                              |        69 |
| Contextos de proceso materializados                         |        69 |
| Entradas documentales/artefactos contextualizadas heredadas |       332 |
| Entradas con propietaria funcional resuelta                 |       332 |
| Identificadores `VPROC-*` únicos                            |        69 |
| Faltantes                                                   |         0 |
| Duplicados                                                  |         0 |
| Procesos sin propietaria funcional documental               |         0 |
| Procesos con propiedad múltiple                             |         0 |
| Propietarias externas                                       |         0 |
| Procesos asignados a `shell`                                |         0 |
| Aplicaciones propietarias funcionales utilizadas            |         9 |
| Estados `ASIGNADA`                                          |        17 |
| Estados `ASIGNADA_CON_FRONTERA`                             |        50 |
| Estados `ASIGNADA_EN_APLICACION_DIFERIDA`                   |         2 |

La distribución por aplicación conserva exactamente la propiedad aprobada del catálogo de procesos:

| Aplicación | Contextos documentales asignados |
| ---------- | -------------------------------: |
| `anima`    |                                1 |
| `viso`     |                               20 |
| `nexo`     |                               16 |
| `fogo`     |                                6 |
| `origo`    |                                4 |
| `pulso`    |                               12 |
| `numera`   |                                7 |
| `aura`     |                                2 |
| `pass`     |                                1 |
| **Total**  |                           **69** |

---

#### 7. Fronteras especiales

1. **Documentos externos.** Una factura, documento de autoridad, contrato, confirmación bancaria, cotización, comprobante de proveedor o POD puede haber sido emitido por un tercero. El tercero conserva su autoría u origen; la aplicación propietaria del `VPROC-*` gobierna su recepción, validación, relación con el caso y efecto interno, sin convertir al tercero en propietario del proceso VENTO.
2. **Expedientes compuestos.** Paquetes como incorporación, retiro, B2B, mantenimiento, reclamo, continuidad o entrega pueden vincular artefactos pertenecientes a otros procesos. La propietaria del expediente gobierna el expediente y su cierre; los registros fuente continúan bajo sus propietarias canónicas.
3. **Generación documental.** El servicio transversal que renderice o genere un documento no decide su contenido empresarial, aprobación, vigencia o cierre. La intención y autoridad permanecen en la propietaria funcional documental.
4. **Custodia transversal.** Almacenamiento, hash, versión física, URL, escaneo, antivirus o retención técnica no transfieren propiedad funcional.
5. **`VPROC-0060`.** `viso` gobierna el proceso transversal de gestión documental y evidencia, pero no absorbe la propiedad de los hechos empresariales respaldados por documentos de otros `VPROC-*`. Su función transversal se limita al ciclo documental que le corresponde y a las fronteras aprobadas.
6. **AURA.** Los contextos `VPROC-0056` y `VPROC-0057` mantienen `aura` como propietaria objetivo con aplicación diferida; esta asignación no acredita implementación ni operación disponible.

---

#### 8. Decisiones reservadas

| Decisión no tomada en esta tarea                                                               | Tarea propietaria |
| ---------------------------------------------------------------------------------------------- | ----------------- |
| Clasificación de sensibilidad                                                                  | `EVID-ARC-003`    |
| Metadatos, versión y vínculo con el recurso                                                    | `EVID-ARC-004`    |
| Carga, sustitución, anulación y retención                                                      | `EVID-ARC-005`    |
| Validación de tipo, tamaño, integridad y malware                                               | `EVID-ARC-006`    |
| Acceso temporal y URLs firmadas                                                                | `EVID-ARC-007`    |
| Auditoría de consulta y modificación                                                           | `EVID-ARC-008`    |
| Conservación legal y eliminación                                                               | `EVID-ARC-009`    |
| Contingencia ante indisponibilidad de Storage                                                  | `EVID-ARC-010`    |
| Propietarios humanos, custodios, responsables, encargados, finalidades y territorios           | `INFO-DOM-001`    |
| Taxonomía global de documentos, registros, evidencia, series, expedientes, originales y copias | `INFO-DOM-003`    |

---

#### 9. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa, para el universo documental de `EVID-ARC-001`, la propiedad funcional ya aprobada por proceso y la regla E4 que impide transferir autoridad empresarial a un servicio transversal. No introduce una nueva regla de negocio, autorización, cálculo, transformación, transición, restricción de integridad, contrato de integración o comportamiento ejecutable. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 10. Criterios de aceptación

- [x] `EVID-ARC-001` figura aprobada y entrega 69 contextos de proceso.
- [x] cada `VPROC-0001` a `VPROC-0069` aparece exactamente una vez.
- [x] las 332 entradas documentales/artefactos contextualizadas heredadas tienen una propietaria funcional inequívoca.
- [x] la distribución de propiedad coincide exactamente con la propiedad aprobada de los 69 procesos.
- [x] no existen propietarios múltiples, externos, nulos ni asignaciones a `shell`.
- [x] los expedientes compuestos no absorben registros fuente de otras propietarias.
- [x] servicios transversales, Supabase, Storage, repositorios, carpetas y formatos físicos no adquieren propiedad funcional.
- [x] la propiedad documental no concede autorización, acceso, descarga, modificación, compartición, impresión ni eliminación.
- [x] AURA permanece como aplicación propietaria objetivo diferida en sus dos contextos y no se presenta como implementada.
- [x] `VPROC-0060` conserva su frontera transversal sin convertirse en propietario universal de los hechos empresariales.
- [x] la taxonomía documental global y los roles humanos de gobierno permanecen reservados para las tareas propietarias correspondientes.
- [x] no se crean buckets, tablas, políticas, migraciones, archivos productivos, jobs, APIs ni cambios en Supabase.
- [x] la tarea genera cero cambios en requisitos de prueba.
- [x] `EVID-ARC-003` permanece reservada y no iniciada.

---

#### 11. Handoff cerrado hacia EVID-ARC-003

`EVID-ARC-003` recibe los 69 contextos documentales con propietaria funcional resuelta y fronteras de propiedad preservadas. Su única responsabilidad siguiente será definir la clasificación de sensibilidad sin cambiar propietarias, fusionar prematuramente tipos documentales entre procesos ni iniciar decisiones reservadas para `EVID-ARC-004` a `EVID-ARC-010`.

La aprobación de `EVID-ARC-002` no inicia, desarrolla ni aprueba `EVID-ARC-003`.


### ✅ EVID-ARC-003 — Definir clasificación de sensibilidad

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-002 — Definir propietario funcional de cada tipo documental` — APROBADA
**Tarea siguiente:** `EVID-ARC-004 — Definir metadatos, versión y vínculo con el recurso` — RESERVADA
**Tipo de tarea:** documental; materialización de sensibilidad por entrada documental contextualizada
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos clasificadas:** 332
**Escala canónica consumida:** `S0_PUBLIC`, `S1_INTERNAL`, `S2_CONFIDENTIAL`, `S3_RESTRICTED`, `S4_HIGHLY_RESTRICTED`
**Cambios físicos autorizados:** ninguno; no crea buckets, tablas, políticas, RLS, migraciones, cifrado, objetos de Storage ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** asignar una clase mínima de sensibilidad a cada una de las 332 entradas documentales/artefactos recibidas de `EVID-ARC-002`, preservando propiedad funcional, granularidad, herencia y elevación de sensibilidad, sin convertir la clasificación en autorización ni anticipar las decisiones reservadas a `EVID-ARC-004` a `EVID-ARC-010`.

---

#### 1. Resultado sustantivo

La tarea materializa `EVID-SENSITIVITY-CLASSIFICATION-MATRIX-001`: una decisión explícita y verificable para cada entrada documental contextualizada. La unidad de decisión es el tipo documental o artefacto dentro de su `VPROC-*`; no la aplicación completa, el bucket, la tabla, la carpeta ni el formato físico.

Cada fila recibe una clave `DOCCTX-VPROC-####-NN` exclusiva de esta matriz para comprobar cobertura, orden y duplicados. Esa clave no afirma existencia de un archivo físico ni crea una identidad de Storage.

---

#### 2. Fuentes canónicas consumidas

- `EVID-ARC-001`: inventario de soportes, artefactos/documentos y evidencia mínima por los 69 procesos.
- `EVID-ARC-002`: 69 contextos de proceso, 332 entradas documentales/artefactos y propietaria funcional inequívoca para cada contexto.
- `NFR-REQ-005`: contrato aprobado de privacidad y sensibilidad, escala `S0` a `S4`, categorías mínimas, granularidad, propagación, inferencia y guardrails.
- `PROC-CAT-005`: propiedad funcional de los 69 procesos; la clasificación no modifica propietarias.
- Registro Canónico de Requisitos de Prueba vigente: reglas ya existentes de clasificación, herencia, archivos sensibles, privacidad y Storage.
- `INFO-DOM-001` a `INFO-DOM-003`: decisiones posteriores reservadas de gobierno, clasificación definitiva corporativa y taxonomía documental global.

---

#### 3. Escala y reglas de decisión

| Clase                  | Significado operativo en EVID-ARC-003                                                                                                                       |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `S0_PUBLIC`            | Solo contenido cuya divulgación abierta está expresamente aprobada. La condición pública se limita a la versión publicada y vigente.                        |
| `S1_INTERNAL`          | Información de operación ordinaria que no debe divulgarse externamente por defecto.                                                                         |
| `S2_CONFIDENTIAL`      | Información limitada por función, sede, relación, finalidad o conocimiento empresarial propietario.                                                         |
| `S3_RESTRICTED`        | Información cuya exposición, alteración o correlación puede causar daño alto laboral, financiero, disciplinario, investigativo, de ubicación o equivalente. |
| `S4_HIGHLY_RESTRICTED` | Salud, secretos, credenciales, PIN, tokens, declaraciones/investigaciones especialmente sensibles o contenido cuyo compromiso exige contención inmediata.   |

Reglas obligatorias:

1. La clase de la fila es un **piso mínimo**. Si el contenido real, un campo, adjunto, firma, evidencia, sujeto o combinación exige una clase superior, prevalece la más restrictiva.
2. Una clasificación ausente, desconocida o no resoluble se trata con la política más restrictiva; nunca como pública.
3. Copias, derivados, joins, cachés, exportaciones, impresiones, screenshots, thumbnails, evidencias y metadatos heredan la clase más restrictiva de su contenido o fuente y pueden elevarla por inferencia o daño adicional.
4. `S0_PUBLIC` no se propaga hacia borradores, comentarios, fuentes, metadatos, historial ni versiones no publicadas. Un artefacto mixto conserva su piso interno y solo su proyección pública aprobada puede bajar a `S0_PUBLIC`.
5. Expedientes, archivos, documentos, payloads, snapshots, POD, actas, certificados y soportes usan `HERENCIA_CONTENIDO` cuando su contenido puede ser más sensible que el piso de la fila.
6. Resultados analíticos y agregados usan `INFERENCIA`: pueden elevarse cuando una combinación permita reidentificación, perfilado, drill-down o daño adicional.
7. La clasificación no concede acceso, permiso, exportación, impresión, descarga, compartición, edición, firma, retención, eliminación ni disponibilidad offline.
8. La clasificación de esta tarea es mínima y operativa para E4. `INFO-DOM-001` y `INFO-DOM-002` podrán refinar gobierno y clasificación corporativa posterior, pero no degradar silenciosamente los mínimos aprobados sin una reclasificación explícita y versionada.

Códigos de regla usados en la matriz:

| Regla                    | Aplicación                                                                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `BASE`                   | La clase declarada es el piso contextual; siguen aplicando elevación y propagación generales.                                               |
| `HERENCIA_CONTENIDO`     | La clase efectiva es la más restrictiva entre el piso de la fila y la clase del contenido/fuente asociado.                                  |
| `PUBLICACION_CONTROLADA` | Solo una versión expresamente aprobada para audiencia abierta puede ser `S0_PUBLIC`; material previo o relacionado conserva clase superior. |
| `INFERENCIA`             | La clase efectiva puede elevarse por combinación, reidentificación, perfilado o granularidad del resultado.                                 |
| `S4_DIRECTA`             | La naturaleza del contexto fija `S4_HIGHLY_RESTRICTED` como piso y no admite degradación implícita.                                         |

---

#### 4. Matriz materializada de sensibilidad

| ID contextual          | Proceso      | Propietaria | Tipo documental / artefacto                   | Clase mínima           | Regla dominante          |
| ---------------------- | ------------ | ----------- | --------------------------------------------- | ---------------------- | ------------------------ |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `viso`      | Registro de decisión                          | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `viso`      | acta y compromisos                            | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `viso`      | Catálogo de estructura                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `viso`      | expediente o soporte del cambio estructural   | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `viso`      | Política o delegación versionada              | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `viso`      | Paquete de handoff y compromiso               | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `viso`      | Requisición/vacante                           | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `viso`      | expediente de candidato                       | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `viso`      | evaluación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `viso`      | oferta                                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `viso`      | handoff                                       | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `viso`      | Caso de incorporación                         | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `viso`      | expediente                                    | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `viso`      | checklist                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `viso`      | solicitudes de acceso/equipo                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `viso`      | Asignación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `viso`      | horario/programación                          | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `viso`      | publicación e historial                       | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `anima`     | Hechos de asistencia y decisión de corrección | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `viso`      | Caso laboral y soportes                       | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `numera`    | Paquete de liquidación                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `numera`    | detalle                                       | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `numera`    | instrucción de pago                           | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `numera`    | conciliación                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `viso`      | Expediente de retiro                          | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `viso`      | checklist                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `viso`      | documentos finales                            | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `viso`      | certificado de cierre                         | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `viso`      | Registro de riesgo                            | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `viso`      | inspección                                    | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `viso`      | control                                       | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `viso`      | plan de acción                                | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `viso`      | riesgo residual                               | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `viso`      | Expediente de incidente                       | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `viso`      | investigación                                 | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `viso`      | acciones                                      | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `viso`      | Procedimiento                                 | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `viso`      | plan de control                               | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `viso`      | ejecución                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `viso`      | checklist y mediciones                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `nexo`      | Maestro de producto                           | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `nexo`      | presentaciones                                | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `nexo`      | unidades                                      | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `nexo`      | equivalencias                                 | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `fogo`      | Receta/versiones                              | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `fogo`      | resultados de prueba                          | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `fogo`      | aprobación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `fogo`      | snapshot publicado                            | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `pulso`     | Versión de oferta y publicación de catálogo   | `S1_INTERNAL`          | `PUBLICACION_CONTROLADA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `nexo`      | Especificación                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `nexo`      | alérgenos                                     | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `nexo`      | restricciones                                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `nexo`      | criterios de calidad                          | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `origo`     | Solicitud de compra                           | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `origo`     | consolidación                                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `origo`     | decisión                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `origo`     | Expediente de cotizaciones                    | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `origo`     | comparación                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `origo`     | evaluación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `origo`     | recomendación                                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `origo`     | decisión                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `origo`     | Orden de compra aprobada                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `origo`     | compromiso                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `origo`     | comunicación al proveedor                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `origo`     | Recepción de compra                           | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `origo`     | diferencias                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `origo`     | documentos asociados                          | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `nexo`      | Catálogo de ubicaciones                       | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `nexo`      | etiqueta/identificación                       | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `nexo`      | Movimiento                                    | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `nexo`      | proyección de stock                           | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `nexo`      | escaneos/evidencia                            | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `nexo`      | Movimiento de retiro/consumo/traslado         | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `nexo`      | custodia/recibo                               | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `nexo`      | Observación de conteo                         | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `nexo`      | sesión                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `nexo`      | diferencia                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `nexo`      | investigación                                 | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `nexo`      | decisión de ajuste                            | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `nexo`      | Condición/cuarentena/vencimiento/merma        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `nexo`      | decisión de disposición                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `nexo`      | Solicitud de abastecimiento                   | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `nexo`      | cantidad aprobada                             | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `nexo`      | preparación                                   | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `nexo`      | despacho                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `nexo`      | tránsito                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `nexo`      | recepción                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `nexo`      | conciliación                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `nexo`      | Registro de activo                            | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `nexo`      | identidad                                     | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `nexo`      | ubicación                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `nexo`      | custodia                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `nexo`      | préstamo/transferencia                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `nexo`      | historial                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `nexo`      | Orden de mantenimiento                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `nexo`      | diagnóstico                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `nexo`      | reparaciones/repuestos                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `nexo`      | prueba                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `nexo`      | liberación                                    | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `nexo`      | garantía/disposición                          | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `nexo`      | Registro de vehículo                          | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `nexo`      | disponibilidad                                | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `nexo`      | asignación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `nexo`      | kilometraje                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `nexo`      | combustible                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `nexo`      | documentos                                    | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `nexo`      | incidencias                                   | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `nexo`      | Catálogo de reutilizables/contenedores        | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `nexo`      | custodia                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `nexo`      | entregas                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `nexo`      | retornos                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `nexo`      | pérdida/daño                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `fogo`      | Plan de producción versionado                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `fogo`      | órdenes planificadas                          | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `fogo`      | capacidad                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `fogo`      | faltantes                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `fogo`      | aprobación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `fogo`      | Orden de producción                           | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `fogo`      | lote                                          | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `fogo`      | receta                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `fogo`      | materiales                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `fogo`      | etapas                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `fogo`      | cantidades                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `fogo`      | rendimiento                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `fogo`      | desviaciones                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `fogo`      | Inspección de calidad                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `fogo`      | resultados                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `fogo`      | no conformidad                                | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `fogo`      | disposición                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `fogo`      | Registro de empaque                           | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `fogo`      | etiquetas/códigos                             | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `fogo`      | LPN                                           | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `fogo`      | handoff a almacenamiento                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `fogo`      | Reproceso                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `fogo`      | genealogía                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `fogo`      | rendimiento                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `fogo`      | merma                                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `fogo`      | cierre                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `pulso`     | Servicio de mesa                              | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `pulso`     | pedido/versiones                              | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `pulso`     | preparación                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `pulso`     | entrega                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `pulso`     | pago                                          | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `pulso`     | cierre de cuenta                              | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `pulso`     | Pedido mostrador/para llevar                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `pulso`     | promesa                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `pulso`     | preparación                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `pulso`     | handoff                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `pulso`     | pago                                          | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `pulso`     | cierre                                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `pulso`     | Payload externo preservado                    | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `pulso`     | pedido normalizado                            | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `pulso`     | mapping                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `pulso`     | pedido interno                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `pulso`     | discrepancia                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `pulso`     | Oportunidad B2B                               | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `pulso`     | cotización                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `pulso`     | decisión de capacidad                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `pulso`     | pedido                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `pulso`     | expediente producción-factura-entrega         | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `pulso`     | Caso de cambio                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `pulso`     | antes/después                                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `pulso`     | decisión                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `pulso`     | efectos                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `pulso`     | Intentos de pago                              | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `pulso`     | autorización/captura                          | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `pulso`     | asignación a venta                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `pulso`     | soporte fiscal                                | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `pulso`     | reverso/reembolso                             | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `pulso`     | conciliación                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `pulso`     | Sesión de caja                                | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `pulso`     | esperado vs. observado                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `pulso`     | diferencias                                   | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `pulso`     | aprobaciones                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `pulso`     | entrega                                       | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `pulso`     | depósito                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `pass`      | Perfil de cliente                             | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `pass`      | consentimientos                               | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `pass`      | cuenta/ledger de fidelización                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `pass`      | beneficios/redenciones                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `pulso`     | Caso de reclamo                               | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `pulso`     | clasificación                                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `pulso`     | investigación                                 | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `pulso`     | resolución                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `pulso`     | compensación                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `pulso`     | devolución/reembolso                          | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `pulso`     | causa/acciones                                | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `pulso`     | Reserva/evento                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `pulso`     | capacidad                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `pulso`     | comunicaciones                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `pulso`     | consentimiento                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `pulso`     | depósitos                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `pulso`     | asistencia/no-show/cancelación                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `nexo`      | Plan de ruta                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `nexo`      | paradas                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `nexo`      | vehículo/conductor                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `nexo`      | carga                                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `nexo`      | manifiesto                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `nexo`      | restricciones                                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `nexo`      | publicación                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `nexo`      | Viaje                                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `nexo`      | paradas                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `nexo`      | POD                                           | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `nexo`      | rechazo/incidente                             | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `nexo`      | custodia                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `nexo`      | retornos                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `nexo`      | kilometraje                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `nexo`      | cierre                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `pulso`     | Caso de entrega de tercero                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `pulso`     | asignación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `pulso`     | tracking                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `pulso`     | POD                                           | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `pulso`     | incidentes                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `pulso`     | retorno                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `pulso`     | liquidación/conciliación                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `numera`    | Hecho económico                               | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `numera`    | clasificación contable                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `numera`    | asiento                                       | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `numera`    | soporte                                       | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `numera`    | Obligación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `numera`    | aprobación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `numera`    | instrucción de pago                           | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `numera`    | resultado bancario                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `numera`    | conciliación                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `numera`    | Cuenta por cobrar                             | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `numera`    | acciones de cobro                             | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `numera`    | pago/aplicación                               | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `numera`    | disputa/diferencia                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `numera`    | Modelo de costos                              | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `numera`    | distribución                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `numera`    | cierre de costos                              | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `numera`    | resultados                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `numera`    | rentabilidad                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `numera`    | variación                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `nexo`      | Plan de instalaciones                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `nexo`      | orden de trabajo                              | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `nexo`      | ejecución                                     | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `nexo`      | desviación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `nexo`      | liberación                                    | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `aura`      | Brief                                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `aura`      | contenido/promoción versionada                | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `aura`      | revisión                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `aura`      | aprobación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `aura`      | publicación                                   | `S0_PUBLIC`            | `PUBLICACION_CONTROLADA` |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `aura`      | retiro                                        | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `aura`      | archivo                                       | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `aura`      | Consulta/lead                                 | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `aura`      | consentimiento                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `aura`      | calificación                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `aura`      | asignación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `aura`      | conversación                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `aura`      | oportunidad                                   | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `aura`      | handoff                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `viso`      | Ticket tecnológico                            | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `viso`      | clasificación/SLA                             | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `viso`      | diagnóstico                                   | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `viso`      | workaround                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `viso`      | conocimiento                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `viso`      | cierre                                        | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `viso`      | Solicitud de acceso                           | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `viso`      | aprobaciones                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `viso`      | entitlement                                   | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `viso`      | resultado de provisión                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `viso`      | revocación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `viso`      | attestación                                   | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `viso`      | Registro documental                           | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `viso`      | versión                                       | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `viso`      | metadatos                                     | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `viso`      | clasificación                                 | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `viso`      | firmas                                        | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `viso`      | retención/hold                                | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `viso`      | custodia                                      | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `viso`      | certificado de disposición                    | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `numera`    | Medición                                      | `S2_CONFIDENTIAL`      | `INFERENCIA`             |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `numera`    | snapshot de fuente                            | `S2_CONFIDENTIAL`      | `INFERENCIA`             |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `numera`    | análisis                                      | `S2_CONFIDENTIAL`      | `INFERENCIA`             |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `numera`    | insight                                       | `S2_CONFIDENTIAL`      | `INFERENCIA`             |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `numera`    | decisión/plan de mejora                       | `S2_CONFIDENTIAL`      | `INFERENCIA`             |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `numera`    | medición posterior                            | `S2_CONFIDENTIAL`      | `INFERENCIA`             |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `viso`      | Caso de continuidad                           | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `viso`      | impacto/severidad                             | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `viso`      | plan                                          | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `viso`      | modo degradado                                | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `viso`      | recuperación                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `viso`      | conciliación                                  | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `viso`      | postmortem                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `viso`      | Registro de riesgo                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `viso`      | valoración                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `viso`      | controles                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `viso`      | tratamiento                                   | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `viso`      | aceptación/seguimiento                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `viso`      | Expediente de asesor/autoridad                | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `viso`      | requerimiento                                 | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `viso`      | comunicaciones                                | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `viso`      | entregable                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `viso`      | vencimientos                                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `viso`      | decisión interna                              | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `viso`      | Ciclo de desempeño                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `viso`      | objetivos                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `viso`      | feedback                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `viso`      | plan de desarrollo                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `viso`      | revisión                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `viso`      | decisión                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `viso`      | constancia del trabajador                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `viso`      | Requisito de EPP                              | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `viso`      | asignación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `viso`      | entrega/aceptación                            | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `viso`      | formación                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `viso`      | vigencia                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `viso`      | reemplazo                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `viso`      | devolución                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `nexo`      | Definición/versionado de kit                  | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `nexo`      | instancia                                     | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `nexo`      | manifiesto de componentes                     | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `nexo`      | completitud                                   | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `nexo`      | custodia                                      | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `nexo`      | préstamo/retorno/sustitución                  | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `pulso`     | Instrumento de medición                       | `S1_INTERNAL`          | `BASE`                   |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `pulso`     | muestra                                       | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `pulso`     | invitación                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `pulso`     | respuesta                                     | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `pulso`     | resultados                                    | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `pulso`     | sesgo                                         | `S2_CONFIDENTIAL`      | `BASE`                   |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `numera`    | Presupuesto/versiones                         | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `numera`    | supuestos                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `numera`    | líneas                                        | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `numera`    | aprobación                                    | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `numera`    | vigencia                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `numera`    | consumo                                       | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `numera`    | forecast                                      | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `numera`    | variación                                     | `S3_RESTRICTED`        | `BASE`                   |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `numera`    | supersesión                                   | `S3_RESTRICTED`        | `BASE`                   |

---

#### 5. Reconciliación cuantitativa

| Control                                    | Resultado |
| ------------------------------------------ | --------: |
| Contextos de proceso esperados             |        69 |
| Contextos de proceso materializados        |        69 |
| Entradas documentales/artefactos esperadas |       332 |
| Entradas clasificadas                      |       332 |
| Claves contextuales únicas                 |       332 |
| Entradas sin clase                         |         0 |
| Entradas con clase desconocida             |         0 |
| Entradas duplicadas por clave contextual   |         0 |
| Procesos faltantes                         |         0 |
| Procesos duplicados                        |         0 |
| Propietarias funcionales modificadas       |         0 |
| Instancias físicas de archivo inventadas   |         0 |
| Rutas, buckets, hashes o URLs inventados   |         0 |

Distribución de las 332 decisiones por clase mínima:

| Clase                  | Entradas |
| ---------------------- | -------: |
| `S0_PUBLIC`            |        1 |
| `S1_INTERNAL`          |       33 |
| `S2_CONFIDENTIAL`      |      166 |
| `S3_RESTRICTED`        |      124 |
| `S4_HIGHLY_RESTRICTED` |        8 |
| **Total**              |  **332** |

Distribución por regla dominante:

| Regla                    | Entradas |
| ------------------------ | -------: |
| `BASE`                   |      287 |
| `HERENCIA_CONTENIDO`     |       29 |
| `PUBLICACION_CONTROLADA` |        2 |
| `INFERENCIA`             |        6 |
| `S4_DIRECTA`             |        8 |
| **Total**                |  **332** |

---

#### 6. Decisiones canónicas de EVID-ARC-003

1. La sensibilidad se materializa por entrada documental contextualizada y no por aplicación, proceso completo, tabla, bucket, formato o carpeta.
2. Las 332 entradas conservan la propietaria funcional recibida de `EVID-ARC-002`; sensibilidad y propiedad son dimensiones independientes.
3. Los artefactos laborales, financieros, de acceso, desempeño y otras materias de daño alto conservan `S3_RESTRICTED` como mínimo cuando corresponda.
4. SST, salud, investigaciones y declaraciones especialmente sensibles conservan `S4_HIGHLY_RESTRICTED` como mínimo; cualquier secreto o credencial detectado en otra entrada también obliga a elevar a `S4_HIGHLY_RESTRICTED` y retirar el secreto de soportes ordinarios.
5. Recetas, fórmulas, costos, rendimientos, especificaciones y conocimiento propietario conservan `S2_CONFIDENTIAL` o superior salvo una proyección distinta cuya publicación esté aprobada expresamente.
6. Pagos, cuentas, nómina, obligaciones, conciliaciones, presupuestos y costos conservan `S3_RESTRICTED` o superior.
7. Evidencia, firmas, documentos genéricos, soportes, snapshots, POD, archivos y metadatos no pueden rebajar la sensibilidad del contenido que representan.
8. `VPROC-0060` conserva su función transversal: su registro documental y metadatos no convierten a VISO en propietario de los hechos fuente ni permiten rebajar su sensibilidad.
9. `VPROC-0061` aplica evaluación de inferencia: mediciones, snapshots, análisis e insights pueden ser más sensibles que una fuente aislada.
10. La presencia de una entrada `S0_PUBLIC` no acredita publicación técnica, URL pública, bucket público ni disponibilidad externa. Solo expresa que esa proyección exacta puede ser de audiencia abierta cuando su publicación esté aprobada.
11. Esta tarea no declara qué usuario puede acceder, cómo se firma una URL, qué metadatos físicos se almacenan, cuánto se retiene, cómo se valida malware ni cómo se elimina un objeto.

---

#### 7. Frontera con tareas posteriores

| Decisión no tomada en esta tarea                                                               | Tarea propietaria |
| ---------------------------------------------------------------------------------------------- | ----------------- |
| Metadatos, versión y vínculo con el recurso                                                    | `EVID-ARC-004`    |
| Carga, sustitución, anulación y retención                                                      | `EVID-ARC-005`    |
| Validación de tipo, tamaño, integridad y malware                                               | `EVID-ARC-006`    |
| Acceso temporal y URLs firmadas                                                                | `EVID-ARC-007`    |
| Auditoría de consulta y modificación                                                           | `EVID-ARC-008`    |
| Conservación legal y eliminación                                                               | `EVID-ARC-009`    |
| Contingencia ante indisponibilidad de Storage                                                  | `EVID-ARC-010`    |
| Propietarios humanos, custodios, responsables, encargados, finalidades y territorios           | `INFO-DOM-001`    |
| Clasificación corporativa definitiva, minimización y manejo por categoría                      | `INFO-DOM-002`    |
| Taxonomía global de documentos, registros, evidencia, series, expedientes, originales y copias | `INFO-DOM-003`    |

---

#### 8. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea instancia, sobre las 332 entradas documentales ya inventariadas, la escala, granularidad, herencia, elevación, tratamiento de información desconocida y pisos de sensibilidad ya aprobados por el contrato no funcional vigente y ya protegidos en el Registro Canónico de Requisitos de Prueba. No introduce una regla ejecutable nueva ni modifica una regla existente. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0; el registro permanece sin cambios.

---

#### 9. Criterios de aceptación

- [x] `EVID-ARC-002` figura aprobada y entrega 69 contextos con 332 entradas documentales/artefactos.
- [x] cada `VPROC-0001` a `VPROC-0069` aparece al menos una vez en la matriz y el universo de procesos queda completo.
- [x] las 332 entradas heredadas reciben exactamente una clave contextual y una clase mínima explícita.
- [x] las cinco clases canónicas `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED` son las únicas clases utilizadas.
- [x] no existen clases nulas, desconocidas ni fallbacks públicos por ausencia de clasificación.
- [x] la matriz no sustituye granularidad de campo ni impide elevar una entrada cuando su contenido real sea más sensible.
- [x] copias, derivados, evidencias, metadatos y artefactos genéricos heredan o elevan sensibilidad según su fuente.
- [x] la publicación controlada separa versión pública aprobada de borradores, fuentes, historial y metadatos.
- [x] los contextos SST/salud/investigación especialmente sensible conservan piso `S4_HIGHLY_RESTRICTED`.
- [x] los contextos financieros relevantes conservan piso `S3_RESTRICTED` o superior.
- [x] recetas, fórmulas, costos, rendimientos y conocimiento propietario conservan `S2_CONFIDENTIAL` o superior salvo proyección pública aprobada distinta.
- [x] las propietarias funcionales de `EVID-ARC-002` no cambian.
- [x] no se crean buckets, tablas, políticas, RLS, migraciones, URLs, archivos productivos ni cambios físicos.
- [x] la tarea genera cero cambios en requisitos de prueba.
- [x] `EVID-ARC-004` permanece reservada y no iniciada.

---

#### 10. Handoff cerrado hacia EVID-ARC-004

`EVID-ARC-004` recibe 332 entradas documentales contextualizadas con propietaria funcional y clase mínima de sensibilidad explícitas. Su responsabilidad posterior será definir metadatos, versión y vínculo con el recurso preservando estas clases, la regla de herencia/elevación y las fronteras de propiedad, sin reinterpretar esta clasificación como autorización o retención.

La aprobación de `EVID-ARC-003` no inicia, desarrolla ni aprueba `EVID-ARC-004`.


### [ ] EVID-ARC-004 — Definir metadatos, versión y vínculo con el recurso
### [ ] EVID-ARC-005 — Definir carga, sustitución, anulación y retención
### [ ] EVID-ARC-006 — Definir validación de tipo, tamaño, integridad y malware
### [ ] EVID-ARC-007 — Definir acceso temporal y URLs firmadas
### [ ] EVID-ARC-008 — Definir auditoría de consulta y modificación
### [ ] EVID-ARC-009 — Definir conservación legal y eliminación
### [ ] EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage

Los pilotos operativos reales no se ejecutan durante E4.

E4 define contratos, arquitectura y criterios. La implementación, readiness,
cutover, piloto e hypercare se planifican en E5 y se ejecutan después de
implementar el paquete aprobado.
