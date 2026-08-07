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


### [ ] EVID-ARC-003 — Definir clasificación de sensibilidad
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
