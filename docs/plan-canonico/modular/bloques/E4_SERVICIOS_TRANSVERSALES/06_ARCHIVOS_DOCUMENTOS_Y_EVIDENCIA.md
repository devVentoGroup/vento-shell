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

Esta tarea fija la línea base documental y evidencial de los 69 procesos canónicos para que las decisiones posteriores de propiedad, clasificación, metadatos, ciclo documental, validación de archivo, acceso temporal, auditoría, conservación legal/eliminación y contingencia de Storage partan de un universo reconciliado.

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

La política concreta de propietario, clasificación, metadatos obligatorios, carga/sustitución/anulación/retención, validación de tipo/tamaño/integridad/malware, acceso temporal, auditoría de consulta/modificación, conservación legal/eliminación y contingencia de Storage permanece en sus tareas EVID propietarias posteriores y no se anticipa aquí.

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
9. Esta tarea no asigna propietario funcional por tipo documental, clasificación de sensibilidad, esquema de metadatos, ciclo de carga/sustitución/anulación/retención, validación de tipo/tamaño/integridad/malware, acceso temporal/URL firmada, auditoría de consulta/modificación, conservación legal/eliminación ni contingencia de Storage.
10. No se declara ningún bucket, objeto de Storage, tabla, vínculo físico, job de disposición/eliminación, política RLS, API, archivo productivo o evidencia operativa como implementado o validado.

---

#### 7. Frontera con las tareas EVID posteriores

| Decisión no tomada en esta tarea                 | Tarea propietaria reservada |
| ------------------------------------------------ | --------------------------- |
| Propietario funcional por tipo documental        | `EVID-ARC-002`              |
| Clasificación de sensibilidad por tipo           | `EVID-ARC-003`              |
| Metadatos, versión y vínculo con recurso         | `EVID-ARC-004`              |
| Carga, sustitución, anulación y retención        | `EVID-ARC-005`              |
| Validación de tipo, tamaño, integridad y malware | `EVID-ARC-006`              |
| Acceso temporal y URLs firmadas                  | `EVID-ARC-007`              |
| Auditoría de consulta y modificación             | `EVID-ARC-008`              |
| Conservación legal y eliminación                 | `EVID-ARC-009`              |
| Contingencia ante indisponibilidad de Storage    | `EVID-ARC-010`              |

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
- no define sensibilidad, metadatos/versionado, carga/sustitución/anulación/retención, validación de archivo, acceso temporal, auditoría, conservación legal/eliminación ni contingencia.

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

**Justificación:** esta tarea instancia, sobre las 332 entradas documentales ya inventariadas, la escala, granularidad, herencia, elevación, tratamiento de información desconocida y pisos de sensibilidad ya aprobados por `NFR-REQ-005`. No introduce una regla ejecutable nueva ni modifica una regla existente. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0; el registro de requisitos no recibe cambios derivados de esta tarea.

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


### ✅ EVID-ARC-004 — Definir metadatos, versión y vínculo con el recurso

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-003 — Definir clasificación de sensibilidad` — APROBADA
**Tarea siguiente:** `EVID-ARC-005 — Definir carga, sustitución, anulación y retención` — RESERVADA
**Tipo de tarea:** documental; especialización del contrato mínimo de metadatos, identidad/versionado documental y vínculo resoluble con recurso empresarial para el universo documental E4
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos cubiertas:** 332 (`DOCCTX-*`)
**Perfil documental mínimo materializado:** `EVID_META_CORE_V1`
**Cambios físicos autorizados:** ninguno; no crea buckets, objetos de Storage, tablas, políticas, RLS, migraciones, rutas, URLs, hashes, jobs, APIs ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir un contrato mínimo común para que cada documento o artefacto materializado conserve una identidad lógica estable, una versión documental inequívoca, la versión del esquema de metadatos, su contexto de proceso y un vínculo resoluble con el recurso empresarial que le da significado, preservando sin cambios la propietaria funcional y la sensibilidad ya aprobadas.

---

#### 1. Resultado sustantivo

La tarea materializa dos artefactos lógicos dentro de este mismo bloque:

- `EVID-DOCUMENT-METADATA-CONTRACT-001`: contrato mínimo de identidad, contexto, versión y referencia empresarial;
- `EVID-DOCUMENT-METADATA-VERSION-LINK-MATRIX-001`: decisión explícita para las 332 identidades `DOCCTX-*` heredadas.

El contrato especializa, sin sustituirlos, los conceptos ya aprobados de `process_id`, `process_instance_id`, `resource_type`, `resource_id`, `resource_version`, versiones de política, clasificación y referencias de evidencia. No crea una fuente de verdad documental paralela ni convierte una ruta de archivo en identidad empresarial.

---

#### 2. Fuentes canónicas consumidas

- `EVID-ARC-001`: 69 procesos, 332 entradas documentales/artefactos y regla de vínculo con el registro empresarial que da significado al documento.
- `EVID-ARC-002`: propietaria funcional inequívoca por contexto documental, sin transferencia de autoridad hacia Storage, repositorios, carpetas o servicios transversales.
- `EVID-ARC-003`: 332 claves `DOCCTX-*`, sensibilidad mínima por entrada y reglas de herencia/elevación.
- `NFR-REQ-005`: clasificación, manejo, propagación de sensibilidad y versionado de política.
- `NFR-REQ-006`: unidad de trazabilidad por proceso/instancia/recurso, identificadores estables, versiones interpretables e historia no destructiva.
- `INFO-DOM-004` y `INFO-DOM-005`: responsabilidades posteriores de ciclo documental corporativo y de metadatos/almacenamiento/búsqueda/localización, que no se anticipan aquí.

---

#### 3. Contrato mínimo `EVID-DOCUMENT-METADATA-CONTRACT-001`

##### 3.1. Campos obligatorios por documento materializado

| Campo                     | Obligación E4                                                                 | Regla                                                                                                                                           |
| ------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `document_id`             | requerido                                                                     | Identidad lógica estable del documento o artefacto materializado. No depende de nombre visible, ruta, URL, bucket, formato ni ubicación física. |
| `document_context_id`     | requerido                                                                     | Debe resolver exactamente a una identidad `DOCCTX-*` aprobada en `EVID-ARC-003`.                                                                |
| `document_version`        | requerido                                                                     | Identifica inequívocamente la versión documental concreta y no puede reutilizarse para contenido o estado documental distinto.                  |
| `metadata_schema_version` | requerido                                                                     | Identifica el contrato de metadatos con el que se interpreta la instancia; para esta línea base el perfil es `EVID_META_CORE_V1`.               |
| `process_id`              | requerido                                                                     | Debe coincidir con el `VPROC-*` de la identidad `DOCCTX-*`.                                                                                     |
| `process_instance_id`     | requerido al materializar una instancia                                       | Vincula el documento con la instancia empresarial concreta que lo origina, recibe o conserva.                                                   |
| `owner_app_code`          | requerido                                                                     | Hereda sin modificación la propietaria funcional aprobada en `EVID-ARC-002`.                                                                    |
| `classification`          | requerido                                                                     | Hereda como mínimo la clase aprobada en `EVID-ARC-003` y puede elevarse por contenido o inferencia.                                             |
| `classification_version`  | requerido                                                                     | Permite interpretar históricamente la clasificación aplicada sin confundirla con `document_version`.                                            |
| `resource_type`           | requerido cuando existe un recurso más específico que la instancia de proceso | Tipo estable del recurso empresarial autoritativo al que se vincula el documento.                                                               |
| `resource_id`             | requerido cuando existe un recurso más específico que la instancia de proceso | Identificador estable del recurso empresarial; nunca será una ruta de Storage ni una URL.                                                       |
| `resource_version`        | condicional                                                                   | Se exige cuando el recurso empresarial dispone de versión relevante para interpretar el vínculo.                                                |
| `parent_resource_ref`     | condicional                                                                   | Conserva el recurso padre cuando el documento pertenece a un expediente, agregado o composición que no debe absorber la fuente original.        |
| `external_system_ref`     | condicional                                                                   | Conserva la referencia de origen externo cuando exista; complementa y no sustituye el vínculo interno con proceso y recurso.                    |

##### 3.2. Identidades y versiones que no pueden confundirse

```text
document_id
    └── document_version

metadata_schema_version

process_id + process_instance_id

resource_type + resource_id
    └── resource_version, cuando aplique

classification + classification_version
```

Reglas obligatorias:

1. `document_id` identifica la identidad lógica; `document_version` identifica una revisión concreta de esa identidad.
2. `metadata_schema_version` versiona la interpretación del sobre de metadatos y no sustituye `document_version`.
3. `resource_version` versiona el recurso empresarial y no debe copiarse ni reutilizarse como versión del documento.
4. `classification_version` conserva la política de sensibilidad aplicable y no modifica por sí sola la versión del documento.
5. La reasignación física de un objeto, cambio de ruta, renombrado o cambio de URL no crea una nueva identidad documental ni modifica por sí mismo la identidad del recurso.
6. Una versión histórica no se sobrescribe para simular que nunca existió. Los eventos exactos que crean, sustituyen, anulan o retiran versiones pertenecen a `EVID-ARC-005` y `INFO-DOM-004`.
7. Esta tarea no inventa números de versión para documentos que todavía no han sido materializados físicamente; fija la obligación y semántica que debe cumplirse cuando exista una instancia.

---

#### 4. Regla de vínculo con recurso empresarial

El vínculo mínimo de una instancia documental queda definido así:

```text
DOCCTX-* APROBADO
        ↓
process_id + process_instance_id
        ↓
resource_type + resource_id [+ resource_version]
        ↓
document_id + document_version
```

Reglas:

1. Todo documento materializado debe quedar anclado como mínimo a una instancia de proceso y, cuando exista, al recurso empresarial específico que le da significado; un archivo huérfano no satisface el contrato.
2. Cuando no exista un recurso empresarial más específico que la propia instancia de proceso, `process_instance_id` constituye el ancla empresarial suficiente y `resource_type`/`resource_id` no se rellenan con identidades artificiales. Cuando sí exista un recurso específico, ambos campos son obligatorios.
3. Una factura, POD, cotización, payload, confirmación, certificado u otro artefacto externo conserva referencia a su origen cuando exista, pero su referencia externa no reemplaza el `process_instance_id` ni el vínculo empresarial interno de VENTO.
4. En expedientes compuestos, el documento del expediente conserva su recurso gobernante y las referencias de origen necesarias sin transferir propiedad funcional de los registros fuente.
5. Una copia, render, exportación o snapshot puede conservar una relación con el mismo recurso, pero no adquiere autoridad para cambiar el estado empresarial del recurso.
6. La ubicación física, bucket, path, clave de objeto, URL, enlace temporal o dispositivo no constituyen `resource_id`.
7. La semántica corporativa completa de taxonomía, búsquedas, localización y múltiples relaciones documentales queda reservada para `INFO-DOM-003` e `INFO-DOM-005`; este contrato fija únicamente el mínimo E4 necesario para evitar documentos desligados de su contexto empresarial.

---

#### 5. Aplicación del perfil a las 332 identidades

Para cada `DOCCTX-*` se toma una decisión explícita con los siguientes códigos:

| Código                            | Significado                                                                                                                                 |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `EVID_META_CORE_V1`               | Aplica íntegramente el contrato mínimo definido en esta tarea.                                                                              |
| `VERSION_REF_REQUIRED`            | Toda instancia debe declarar `document_version` y `metadata_schema_version`; no se inventa una versión física mientras no exista instancia. |
| `RESOURCE_REF_REQUIRED`           | Toda instancia debe resolver `process_instance_id` y un vínculo empresarial conforme a la sección 4.                                        |
| `OWNER+CLASSIFICATION_SIN_CAMBIO` | Propietaria y clase mínima se heredan de `EVID-ARC-002` y `EVID-ARC-003`; esta tarea no las modifica.                                       |
| `ESPECIFICADO`                    | La decisión documental está completa; no implica implementación física.                                                                     |
| `NINGUNO`                         | No existe bloqueo documental heredado en el contexto.                                                                                       |
| `FRONTERA_OBLIGATORIA`            | Se conserva la frontera de propiedad ya aprobada: referencias cruzadas no absorben recursos fuente ni autoridad ajena.                      |
| `APLICACION_DIFERIDA`             | La definición documental es válida, pero no acredita disponibilidad de la aplicación objetivo.                                              |

| ID contextual          | Proceso      | Perfil              | Versión                | Vínculo                 | Herencia                          | Estado         | Bloqueo / frontera     |
| ---------------------- | ------------ | ------------------- | ---------------------- | ----------------------- | --------------------------------- | -------------- | ---------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `EVID_META_CORE_V1` | `VERSION_REF_REQUIRED` | `RESOURCE_REF_REQUIRED` | `OWNER+CLASSIFICATION_SIN_CAMBIO` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |

---

#### 6. Reconciliación cuantitativa

| Control                                                  | Resultado |
| -------------------------------------------------------- | --------: |
| Contextos de proceso esperados                           |        69 |
| Contextos de proceso materializados                      |        69 |
| Entradas `DOCCTX-*` esperadas                            |       332 |
| Entradas con perfil de metadatos asignado                |       332 |
| Entradas con obligación explícita de versión             |       332 |
| Entradas con obligación explícita de vínculo empresarial |       332 |
| Claves `DOCCTX-*` únicas                                 |       332 |
| Faltantes                                                |         0 |
| Duplicados                                               |         0 |
| Propietarias funcionales modificadas                     |         0 |
| Clasificaciones mínimas modificadas                      |         0 |
| Instancias físicas, rutas, URLs o hashes inventados      |         0 |

Fronteras heredadas materializadas sobre las 332 entradas:

| Frontera               | Entradas |
| ---------------------- | -------: |
| `NINGUNO`              |       73 |
| `FRONTERA_OBLIGATORIA` |      245 |
| `APLICACION_DIFERIDA`  |       14 |
| **Total**              |  **332** |

Se conserva además la distribución canónica de propiedad por los 69 contextos: `anima` 1, `viso` 20, `nexo` 16, `fogo` 6, `origo` 4, `pulso` 12, `numera` 7, `aura` 2 y `pass` 1. No se reasigna ninguna propietaria.

Se conserva sin modificación la distribución de sensibilidad heredada sobre las 332 entradas: `S0_PUBLIC` 1, `S1_INTERNAL` 33, `S2_CONFIDENTIAL` 166, `S3_RESTRICTED` 124 y `S4_HIGHLY_RESTRICTED` 8.

---

#### 7. Decisiones canónicas de EVID-ARC-004

1. Toda instancia documental utiliza una identidad lógica estable separada de su ubicación física.
2. Las 332 identidades `DOCCTX-*` son clasificadores contextuales del contrato y no sustituyen el `document_id` de una instancia materializada.
3. `document_version`, `metadata_schema_version`, `resource_version` y `classification_version` son dimensiones independientes y no pueden reutilizarse unas como otras.
4. Toda instancia documental debe conservar `process_id` y `process_instance_id`, y resolver un recurso empresarial sin convertir path, bucket o URL en identidad de negocio.
5. La propietaria funcional y la sensibilidad mínima permanecen exactamente como fueron aprobadas en `EVID-ARC-002` y `EVID-ARC-003`.
6. Un documento externo o una copia conserva su referencia de origen sin perder el vínculo empresarial interno que justifica su existencia en VENTO.
7. Un expediente compuesto puede relacionar fuentes distintas, pero no absorbe propiedad ni autoridad de los recursos fuente.
8. La historia de versiones debe ser interpretable y no destructiva; la definición de eventos de carga, sustitución, anulación y retención permanece fuera de esta tarea.
9. El contrato no define rutas de Storage, nombres de archivo, MIME, tamaño, hash, malware, firma, URL temporal, permisos, auditoría de consultas, plazo de retención, hold, eliminación ni contingencia.
10. La definición corporativa posterior de metadatos y ciclo documental podrá ampliar este perfil, pero deberá preservar su trazabilidad hacia proceso, recurso, identidad, versión, propietaria y clasificación o materializar una transición explícita y versionada.

---

#### 8. Decisiones reservadas con propietario exacto

| Decisión reservada                                                                                  | Tarea propietaria |
| --------------------------------------------------------------------------------------------------- | ----------------- |
| Carga, sustitución, anulación y retención operativa del artefacto                                   | `EVID-ARC-005`    |
| Validación de tipo, tamaño, integridad y malware                                                    | `EVID-ARC-006`    |
| Acceso temporal y URLs firmadas                                                                     | `EVID-ARC-007`    |
| Auditoría de consulta y modificación                                                                | `EVID-ARC-008`    |
| Conservación legal y eliminación                                                                    | `EVID-ARC-009`    |
| Contingencia ante indisponibilidad de Storage                                                       | `EVID-ARC-010`    |
| Ciclo documental corporativo, estados, versiones, vigencia, sustitución, anulación y retiro         | `INFO-DOM-004`    |
| Metadatos corporativos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales | `INFO-DOM-005`    |
| Autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia           | `INFO-DOM-007`    |

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa y materializa para las 332 identidades documentales el contrato ya aprobado de identificadores estables, proceso/instancia/recurso, versiones interpretables, clasificación versionada, evidencia/procedencia e historia no destructiva. No introduce una regla ejecutable nueva de negocio, autorización, integración, transición de ciclo de vida, validación de integridad, acceso o disposición. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0; el registro canónico permanece sin cambios.

---

#### 9. Criterios de aceptación

- [x] `EVID-ARC-003` figura aprobada y entrega 332 identidades `DOCCTX-*` para 69 procesos.
- [x] las 332 identidades aparecen exactamente una vez en la matriz de esta tarea.
- [x] cada identidad recibe explícitamente el perfil `EVID_META_CORE_V1`.
- [x] cada identidad exige versión documental y versión del esquema de metadatos al materializar una instancia.
- [x] cada identidad exige contexto de proceso y vínculo empresarial resoluble al materializar una instancia.
- [x] `document_id`, `document_version`, `metadata_schema_version`, `resource_version` y `classification_version` quedan semánticamente separados.
- [x] las 332 entradas conservan sin cambios propietaria funcional y sensibilidad mínima heredadas.
- [x] las fronteras `NINGUNO`, `FRONTERA_OBLIGATORIA` y `APLICACION_DIFERIDA` permanecen reconciliadas y explícitas.
- [x] no se inventan instancias documentales, versiones físicas, nombres de archivo, buckets, rutas, URLs, hashes o resultados de ejecución.
- [x] una referencia externa no sustituye el vínculo interno con proceso y recurso.
- [x] una ruta, URL o ubicación física no puede funcionar como `document_id` ni `resource_id`.
- [x] la historia de versiones no se declara destructiva ni se definen anticipadamente eventos de sustitución/anulación.
- [x] las decisiones reservadas tienen tarea propietaria exacta.
- [x] no se crean tablas, políticas, RLS, migraciones, Storage, jobs, APIs ni despliegues.
- [x] la tarea genera cero cambios en requisitos de prueba.
- [x] `EVID-ARC-005` permanece reservada y no iniciada.

---

#### 10. Handoff cerrado hacia EVID-ARC-005

`EVID-ARC-005` recibe las 332 identidades documentales con propietaria, sensibilidad, perfil mínimo de metadatos, obligación de versionado y vínculo empresarial definidos. Su única responsabilidad siguiente será definir carga, sustitución, anulación y retención sin romper identidad, historia, clasificación ni vínculo con el recurso y sin iniciar las decisiones reservadas para `EVID-ARC-006` a `EVID-ARC-010`.

La aprobación de `EVID-ARC-004` no inicia, desarrolla ni aprueba `EVID-ARC-005`.


### ✅ EVID-ARC-005 — Definir carga, sustitución, anulación y retención

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-004 — Definir metadatos, versión y vínculo con el recurso` — APROBADA
**Tarea siguiente:** `EVID-ARC-006 — Definir validación de tipo, tamaño, integridad y malware` — RESERVADA
**Tipo de tarea:** documental; materialización del ciclo operativo de carga, sustitución, anulación y retención para el universo documental E4
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos cubiertas:** 332 (`DOCCTX-*`)
**Contrato de ciclo materializado:** `EVID_DOCUMENT_LIFECYCLE_V1`
**Cambios físicos autorizados:** ninguno; no crea buckets, objetos de Storage, tablas, políticas, RLS, migraciones, jobs, APIs, borrados ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir, para cada una de las 332 identidades documentales heredadas, cómo se incorpora una versión sin sobrescribir historia, cómo se sustituye conservando la versión previa, cómo se anula sin borrar el hecho original y qué comportamiento de retención base aplica, dejando bloqueada toda disposición automática mientras la política definitiva de retención no sea resoluble.

---

#### 1. Resultado sustantivo

La tarea materializa dos artefactos lógicos dentro de este mismo bloque:

- `EVID-DOCUMENT-LIFECYCLE-CONTRACT-001`: contrato E4 de carga, sustitución, anulación, vigencia y retención no destructiva;
- `EVID-DOCUMENT-LIFECYCLE-RETENTION-MATRIX-001`: decisión explícita para las 332 identidades `DOCCTX-*` heredadas.

El contrato reutiliza la identidad, versión, vínculo empresarial, propietaria y sensibilidad ya aprobados. No crea una taxonomía documental corporativa paralela, no fija plazos jurídicos y no ejecuta eliminación física.

---

#### 2. Fuentes canónicas consumidas

- `EVID-ARC-001`: universo documental y evidencial de 69 procesos.
- `EVID-ARC-002`: propietaria funcional documental por contexto.
- `EVID-ARC-003`: 332 identidades `DOCCTX-*` y sensibilidad mínima por entrada.
- `EVID-ARC-004`: identidad lógica, versión documental, versión de esquema de metadatos y vínculo resoluble con proceso/recurso.
- `NFR-REQ-006`: historia no destructiva, clase `T5_EVIDENCE_DOCUMENT`, políticas de retención versionadas, estados de ciclo de vida, hold y prohibición de eliminación con política no resoluble.
- `INFO-DOM-004`: ciclo documental corporativo definitivo, estados, versiones, vigencia, sustitución, anulación y retiro.
- `INFO-DOM-006`: tablas definitivas de retención, eventos de cómputo, mínimos/máximos, archivo, legal hold, anonimización, eliminación y certificado de disposición.

---

#### 3. Contrato `EVID-DOCUMENT-LIFECYCLE-CONTRACT-001`

##### 3.1. Códigos de operación

| Código          | Regla materializada                                                                                                                                                                                                                                           |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LOAD_V1`       | Una carga materializa una nueva versión vinculada a `document_id`, `DOCCTX-*`, proceso, instancia/recurso, propietaria y clasificación. No autoriza sobrescribir una versión existente ni tratar la recepción técnica como validación o vigencia empresarial. |
| `SUBSTITUTE_V1` | Una sustitución crea una versión nueva de la misma identidad lógica cuando conserva significado y recurso gobernante; debe enlazar la versión sustituida y preservar su historia. Si cambia la identidad empresarial, no se reutiliza el `document_id`.       |
| `ANNUL_V1`      | Una anulación crea un hecho nuevo enlazado con la versión anulada, conserva actor/autoridad, motivo, timestamps y relación causal, y vuelve no vigente la versión afectada sin eliminarla ni reescribirla.                                                    |
| `RETENTION_V1`  | Toda versión persistida queda sujeta a una política versionada y a un estado de ciclo de vida. Sin política resoluble se usa `RET_UNRESOLVED`, se bloquea disposición automática y no se certifica implementación.                                            |

##### 3.2. Reglas de carga

1. La carga no reutiliza una combinación `document_id + document_version` ya materializada para contenido o estado distinto.
2. `received_at` o un acuse de transporte no equivalen por sí solos a documento válido, vigente, aprobado ni disponible para consumo.
3. La activación o aceptación técnica de la versión deberá respetar la validación que defina `EVID-ARC-006`; esta tarea no inventa MIME, tamaño, hash, antivirus ni resultado de validación.
4. Toda carga conserva el vínculo empresarial definido en `EVID-ARC-004`; una ruta, bucket, URL o nombre de archivo no sustituye proceso, instancia ni recurso.
5. Una carga externa conserva referencia de origen cuando exista, sin convertir el identificador del tercero en identidad canónica de VENTO.

##### 3.3. Reglas de sustitución

1. Sustituir no significa sobrescribir: la versión anterior permanece reconstruible y vinculada con su sucesora.
2. La sustitución usa el mismo `document_id` únicamente cuando continúa siendo la misma identidad lógica y el mismo recurso gobernante; un documento con significado empresarial distinto recibe identidad distinta.
3. La versión anterior no deja de ser la versión vigente únicamente porque exista una carga candidata. El cambio de vigencia ocurre cuando la sucesora cumple los contratos aplicables; esta tarea no adelanta la validación de `EVID-ARC-006`.
4. La sustitución conserva clasificación igual o más restrictiva según `EVID-ARC-003`; no permite rebajar sensibilidad por cambio de formato, ubicación o canal.
5. Copias, derivados y referencias dependientes no se reescriben silenciosamente; su tratamiento físico corresponde a las tareas posteriores propietarias.

##### 3.4. Reglas de anulación

1. Anular crea un hecho trazable y no destructivo; nunca representa que la versión original no existió.
2. La anulación conserva versión afectada, actor o autoridad aplicable, motivo tipado, momento efectivo y relación con el proceso/recurso.
3. Una anulación puede retirar vigencia empresarial, pero no ejecuta borrado físico, anonimización, purga ni certificado de disposición.
4. La anulación no elimina obligaciones de retención ni vence un hold activo.
5. Corrección, reverso, cancelación y anulación siguen siendo hechos diferenciables; esta tarea no fusiona sus efectos empresariales fuera del ciclo documental.

##### 3.5. Ciclo de vida E4 consumido

Los estados de retención se usan con la semántica ya aprobada por `NFR-REQ-006`:

```text
ACTIVE
→ INACTIVE
→ ARCHIVE_PENDING
→ ARCHIVED
→ ELIGIBLE_FOR_DISPOSITION
```

Estados o condiciones transversales relevantes:

```text
HOLD_ACTIVE
PRESERVATION_REQUIRED
DISPOSITION_BLOCKED
POLICY_UNRESOLVED
```

Reglas de frontera:

- `EVID-ARC-005` define hasta la elegibilidad y el bloqueo de disposición; no ejecuta `DISPOSITION_PENDING`, `DISPOSED`, `ANONYMIZED` ni `TRANSFERRED`.
- La disposición, conservación legal y eliminación pertenecen a `EVID-ARC-009` y `INFO-DOM-006`.
- Un hold válido prevalece sobre elegibilidad o disposición, pero no amplía acceso ni finalidad.
- Ubicación física, ausencia en UI, borrado lógico o mover un objeto no determinan por sí solos el estado del ciclo de vida.

---

#### 4. Retención operativa base

Las clases siguientes son las clases comportamentales ya aprobadas por `NFR-REQ-006`; no representan una duración jurídica:

| Clase base           | Uso en esta matriz                                                                                                         |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `RET_ACTIVE_CASE`    | Expedientes cuyo comportamiento principal es permanecer activos hasta un cierre verificable del caso.                      |
| `RET_BUSINESS_CYCLE` | Artefactos ligados a un ciclo operativo, productivo, comercial, logístico, de activos o presupuestal.                      |
| `RET_RELATIONSHIP`   | Artefactos cuyo contexto principal depende de una relación con trabajador, candidato, cliente o tercero.                   |
| `RET_OBLIGATION`     | Artefactos laborales, SST, financieros, de acceso o autoridad cuya conservación depende de obligación o control reforzado. |
| `RET_ARCHIVAL`       | Artefactos de gobierno, políticas o registro documental cuyo valor histórico exige archivo gobernado.                      |

No se asignan `RET_TRANSIENT`, `RET_HOLD` ni `RET_PERMANENT_EXCEPTION` como clase base a las 332 identidades porque las fuentes actuales no justifican tratar estos artefactos empresariales como temporales, bajo hold por defecto o de conservación permanente excepcional.

##### 4.1. Estado de resolución de política

Para las 332 identidades:

```text
retention_policy_resolution = RET_UNRESOLVED
owner = INFO-DOM-006
exit_condition = retention_policy_id + retention_policy_version
                 + retention_trigger + minimum_period + maximum_period
                 + archive_rule + hold_eligibility + disposition_method
```

Esto no significa ausencia de decisión en `EVID-ARC-005`: la clase comportamental, la historia no destructiva y el bloqueo quedan definidos. Significa que no se inventa un plazo legal ni un evento definitivo de cómputo antes de la tarea propietaria.

Mientras `RET_UNRESOLVED` permanezca:

- disposición automática = prohibida;
- eliminación física = prohibida;
- certificación E5 de la política = bloqueada;
- conservación indefinida por inercia = no aceptada como política;
- el objeto permanece gobernado por su estado actual, clasificación, vínculo y obligaciones de preservación conocidas.

---

#### 5. Matriz materializada de carga, sustitución, anulación y retención

Códigos de bloqueo:

| Código                 | Significado y salida                                                                                                                                                    |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RET_POLICY_PENDING`   | Falta política definitiva resoluble. Propietario: `INFO-DOM-006`. Sale cuando existen política/versión, trigger, mínimo, máximo, archivo, hold y disposición definidos. |
| `FRONTERA_OBLIGATORIA` | Conserva la frontera heredada de propiedad/recurso; una referencia cruzada no absorbe autoridad ajena.                                                                  |
| `APLICACION_DIFERIDA`  | La definición documental es válida, pero la aplicación objetivo sigue diferida y no se declara implementada.                                                            |

| ID contextual          | Proceso      | Carga     | Sustitución     | Anulación  | Retención base       | Política         | Estado         | Bloqueo / condición                       |
| ---------------------- | ------------ | --------- | --------------- | ---------- | -------------------- | ---------------- | -------------- | ----------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `LOAD_V1` | `SUBSTITUTE_V1` | `ANNUL_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |

---

#### 6. Reconciliación cuantitativa

| Control                                    | Resultado |
| ------------------------------------------ | --------: |
| Contextos de proceso esperados             |        69 |
| Contextos de proceso materializados        |        69 |
| Entradas `DOCCTX-*` esperadas              |       332 |
| Entradas materializadas                    |       332 |
| Claves `DOCCTX-*` únicas                   |       332 |
| Entradas con regla de carga                |       332 |
| Entradas con regla de sustitución          |       332 |
| Entradas con regla de anulación            |       332 |
| Entradas con clase de retención base       |       332 |
| Entradas con política definitiva inventada |         0 |
| Entradas con `RET_UNRESOLVED` explícito    |       332 |
| Faltantes                                  |         0 |
| Duplicados                                 |         0 |
| Propietarias funcionales modificadas       |         0 |
| Clasificaciones mínimas modificadas        |         0 |

Distribución de retención base sobre las 332 identidades:

| Clase                | Entradas |
| -------------------- | -------: |
| `RET_ACTIVE_CASE`    |       33 |
| `RET_BUSINESS_CYCLE` |      184 |
| `RET_RELATIONSHIP`   |       36 |
| `RET_OBLIGATION`     |       66 |
| `RET_ARCHIVAL`       |       13 |
| **Total**            |  **332** |

Fronteras heredadas preservadas:

| Frontera heredada      | Entradas |
| ---------------------- | -------: |
| `NINGUNO`              |       73 |
| `FRONTERA_OBLIGATORIA` |      245 |
| `APLICACION_DIFERIDA`  |       14 |
| **Total**              |  **332** |

La distribución canónica de propiedad y la distribución de sensibilidad aprobadas en `EVID-ARC-002` y `EVID-ARC-003` permanecen sin modificación. Esta tarea no reasigna propietarias ni reclasifica documentos.

---

#### 7. Decisiones canónicas de EVID-ARC-005

1. La carga de un documento crea una versión identificable; no es un `upsert` destructivo ni una aprobación implícita.
2. La sustitución conserva el `document_id` solo si persiste la misma identidad lógica y crea una versión nueva enlazada con la anterior; la historia previa permanece reconstruible.
3. La anulación crea un hecho nuevo y retira vigencia sin borrar ni reescribir el documento original.
4. La recepción técnica de un archivo no demuestra que sea válido, íntegro, seguro o apto para consumo; `EVID-ARC-006` conserva esa decisión.
5. Las 332 identidades reciben una clase de retención comportamental explícita; ninguna recibe un plazo jurídico inventado.
6. Las 332 identidades quedan con política definitiva `RET_UNRESOLVED` hasta que `INFO-DOM-006` materialice política, trigger, mínimo, máximo, archivo, hold y disposición resolubles.
7. `RET_UNRESOLVED` bloquea disposición automática y certificación de la política, pero no autoriza retención indefinida por inercia.
8. `HOLD_ACTIVE` prevalece sobre elegibilidad o disposición y no concede acceso adicional.
9. Sustitución, anulación y archivo no equivalen a eliminación; la conservación legal, anonimización, borrado y certificado pertenecen a `EVID-ARC-009` y `INFO-DOM-006`.
10. Ninguna decisión de esta tarea convierte bucket, path, URL, nombre de archivo o ubicación física en identidad o estado empresarial.
11. La propietaria funcional, sensibilidad, metadatos mínimos y vínculo empresarial recibidos de `EVID-ARC-002` a `EVID-ARC-004` permanecen obligatorios durante todo el ciclo.
12. La futura taxonomía/ciclo corporativo de `INFO-DOM-004` podrá refinar nombres y estados, pero deberá preservar historia, supersesión/anulación, identidad y bloqueo de disposición o materializar una transición explícita y versionada.

---

#### 8. Decisiones reservadas con propietario exacto

| Decisión reservada                                                                                     | Tarea propietaria |
| ------------------------------------------------------------------------------------------------------ | ----------------- |
| Validación de tipo, tamaño, integridad y malware antes de aceptar una carga o sustitución              | `EVID-ARC-006`    |
| Acceso temporal y URLs firmadas                                                                        | `EVID-ARC-007`    |
| Auditoría de consulta y modificación                                                                   | `EVID-ARC-008`    |
| Conservación legal, ejecución de disposición, anonimización, eliminación y certificado                 | `EVID-ARC-009`    |
| Contingencia ante indisponibilidad de Storage                                                          | `EVID-ARC-010`    |
| Ciclo documental corporativo definitivo, estados, versiones, vigencia, sustitución, anulación y retiro | `INFO-DOM-004`    |
| Tablas definitivas de retención, triggers, mínimos/máximos, archivo, legal hold y disposición          | `INFO-DOM-006`    |
| Autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia              | `INFO-DOM-007`    |

No existe un pendiente narrativo sin propietario. `RET_POLICY_PENDING` tiene propietario y condición de salida explícitos.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea instancia sobre las 332 identidades documentales comportamientos ya aprobados y protegidos: historia no destructiva, corrección/sustitución/anulación mediante hechos nuevos, política de retención versionada, trigger verificable, mínimos/máximos, estados de ciclo de vida, bloqueo con política no resoluble y prohibición de sobrescribir o borrar directamente evidencia preservada. No introduce una regla ejecutable nueva ni modifica las existentes. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0; el registro canónico permanece sin cambios.

---

#### 9. Criterios de aceptación

- [x] `EVID-ARC-004` figura aprobada y entrega 332 identidades `DOCCTX-*` para 69 procesos.
- [x] las 332 identidades aparecen exactamente una vez en la matriz.
- [x] cada identidad recibe `LOAD_V1`, `SUBSTITUTE_V1` y `ANNUL_V1` de forma explícita.
- [x] cada identidad recibe una clase de retención base explícita.
- [x] ninguna carga puede sobrescribir una versión ya materializada para representar otro contenido o estado.
- [x] una sustitución conserva la versión anterior y su relación de supersesión.
- [x] una anulación conserva el hecho original y no ejecuta borrado físico.
- [x] la carga o sustitución no se presenta como validada antes de `EVID-ARC-006`.
- [x] las 332 políticas definitivas no resolubles quedan identificadas como `RET_UNRESOLVED`, con propietario `INFO-DOM-006` y condición de salida exacta.
- [x] `RET_UNRESOLVED` bloquea disposición automática y certificación de la política.
- [x] no se inventan plazos legales, triggers definitivos, fundamentos jurídicos ni permanencias excepcionales.
- [x] hold, archivo y disposición se distinguen; hold no amplía acceso y anulación no equivale a eliminación.
- [x] propietaria, sensibilidad, identidad, metadatos y vínculo empresarial heredados permanecen sin cambios.
- [x] las fronteras heredadas se conservan en las 332 filas.
- [x] no se crean buckets, objetos de Storage, tablas, políticas RLS, migraciones, jobs, APIs, borrados ni despliegues.
- [x] la tarea genera cero cambios en requisitos de prueba.
- [x] `EVID-ARC-006` permanece reservada y no iniciada.

---

#### 10. Handoff cerrado hacia EVID-ARC-006

`EVID-ARC-006` recibe las 332 identidades con reglas de carga, sustitución, anulación, clase de retención base y bloqueo de política definitiva materializados. Su única responsabilidad siguiente será definir validación de tipo, tamaño, integridad y malware para las cargas y sustituciones, sin cambiar identidad, propietaria, sensibilidad, vínculo empresarial, historia no destructiva ni reglas de retención aprobadas aquí.

La aprobación de `EVID-ARC-005` no inicia, desarrolla ni aprueba `EVID-ARC-006`.


### ✅ EVID-ARC-006 — Definir validación de tipo, tamaño, integridad y malware

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-005 — Definir carga, sustitución, anulación y retención` — APROBADA
**Tarea siguiente:** `EVID-ARC-007 — Definir acceso temporal y URLs firmadas` — RESERVADA
**Tipo de tarea:** documental; materialización del gate técnico de validación para cargas y sustituciones documentales
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos cubiertas:** 332 (`DOCCTX-*`)
**Perfil de validación materializado:** `EVID_FILE_VALIDATION_V1`
**Cambios físicos autorizados:** ninguno; no crea ni modifica buckets, objetos de Storage, tablas, políticas, RLS, migraciones, funciones, jobs, scanners, URLs, secretos, APIs ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir y materializar, para las 332 identidades documentales heredadas, el gate que debe superar cualquier payload de archivo asociado a una carga o sustitución antes de quedar técnicamente habilitado para activación: política de tipo resoluble, límite de tamaño versionado, verificación de integridad del contenido y resultado de malware limpio. La validación técnica no equivale a vigencia empresarial, publicación, autorización de lectura ni aprobación del contenido.

---

#### 1. Resultado sustantivo

La tarea materializa dos artefactos lógicos dentro de este mismo bloque:

- `EVID-FILE-VALIDATION-CONTRACT-001`: contrato transversal de validación de payloads de archivo;
- `EVID-FILE-VALIDATION-MATRIX-001`: decisión explícita para las 332 identidades `DOCCTX-*` heredadas.

El contrato se aplica cuando una instancia documental materializa un payload de archivo u objeto binario. Una identidad `DOCCTX-*` que se resuelva únicamente mediante un registro estructurado no obliga a fabricar un archivo para satisfacer esta tarea; si posteriormente incorpora un adjunto, representación, exportación, evidencia o derivado binario, ese payload queda sujeto al mismo gate.

La tarea no cambia `document_id`, `document_version`, propietaria funcional, sensibilidad mínima, vínculo con proceso/recurso, historia no destructiva, anulación ni retención definidas entre `EVID-ARC-002` y `EVID-ARC-005`.

---

#### 2. Fuentes canónicas consumidas

- `EVID-ARC-001`: universo documental/evidencial de 69 procesos y 332 entradas contextualizadas.
- `EVID-ARC-002`: propietaria funcional inequívoca por contexto documental.
- `EVID-ARC-003`: sensibilidad mínima y reglas de herencia/elevación.
- `EVID-ARC-004`: identidad lógica, versión documental, metadatos mínimos y vínculo resoluble con proceso/recurso.
- `EVID-ARC-005`: `LOAD_V1`, `SUBSTITUTE_V1`, historia no destructiva, anulación y retención; una carga candidata no adquiere vigencia por recepción técnica.
- `NFR-REQ-005`: protección por defecto, propagación de sensibilidad y prohibición de exposición indirecta por archivos, nombres, URLs, previews o metadatos.
- `NFR-REQ-006`: evidencia con hash/referencia de integridad, procedencia, versión e historia reconstruible; validación física de archivos y malware delegada a la familia EVID.
- `SUPA-ARC-018`: tarea propietaria de la arquitectura de Storage; `EVID-ARC-006` consume esa frontera de propiedad sin declarar buckets, políticas físicas ni materialización productiva como verificadas.

---

#### 3. Contrato `EVID-FILE-VALIDATION-CONTRACT-001`

##### 3.1. Gate completo

El ciclo de una carga o sustitución con payload de archivo queda definido así:

```text
CANDIDATE_RESERVED
        ↓
PAYLOAD_RECEIVED_PRIVATE
        ↓
TYPE_CHECK
        ↓
SIZE_CHECK
        ↓
INTEGRITY_CHECK
        ↓
MALWARE_CHECK
        ↓
VALIDATED_FOR_ACTIVATION
```

Cualquier incumplimiento o imposibilidad de verificar produce un resultado explícito y fail closed:

```text
VALIDATION_PENDING
FAILED
QUARANTINED
VALIDATED_FOR_ACTIVATION
```

Solo `VALIDATED_FOR_ACTIVATION` permite que `EVID-ARC-005` continúe con la decisión de vigencia o sustitución. Ninguno de estos estados concede acceso, publicación, aprobación empresarial ni autoridad sobre el recurso.

##### 3.2. Sobre mínimo de validación

Toda ejecución del gate deberá poder resolver y conservar, como mínimo:

```text
document_id
document_version
document_context_id
validation_policy_id
validation_policy_version
declared_mime
detected_mime
file_extension_or_format_hint
actual_bytes
max_bytes
content_fingerprint
fingerprint_algorithm_id
integrity_result
malware_result
scanner_or_control_id
scanner_rule_version
validated_at
validation_status
reason_code
```

Reglas:

1. Los valores de política se resuelven en servidor desde una versión aprobada; el cliente no decide bucket, allowlist, tamaño máximo, clasificación ni resultado de validación.
2. Nombre, extensión, MIME declarado, ruta o metadata aportada por cliente son señales; ninguna es autoridad suficiente por sí sola.
3. El resultado se vincula con la misma identidad/version documental que se está validando. Un resultado limpio no puede reutilizarse para otro payload, versión, ambiente o identidad.
4. La evidencia técnica del gate deberá minimizar contenido sensible; el payload no se copiará a logs para demostrar validación.

---

#### 4. Validación de tipo y contenido

Para cada payload aplica `ALLOWLIST_VERSIONADA`.

Reglas obligatorias:

1. La política efectiva debe resolver una allowlist de tipos admitidos antes de habilitar la operación.
2. La comprobación posterior a la recepción compara, cuando apliquen, MIME declarado, MIME detectado desde contenido/firma, extensión o formato y política efectiva.
3. Una extensión permitida con contenido detectado incompatible no supera el gate.
4. Un MIME declarado permitido con firma o contenido incompatible no supera el gate.
5. Un tipo no incluido en la allowlist vigente produce `FAILED`; una discrepancia que indique spoofing, contenido ambiguo o necesidad de análisis produce `QUARANTINED`.
6. No existe una allowlist universal definida por esta tarea. Los valores concretos pertenecen al contrato Storage/version de política que materialice la representación física; `EVID-ARC-006` no inventa formatos que las fuentes actuales no hayan autorizado.
7. Cambiar de formato no rebaja sensibilidad, no crea una identidad empresarial nueva por sí solo y no convierte una versión histórica en sustituible destructivamente.

---

#### 5. Validación de tamaño

Para cada payload aplica `MAX_BYTES_VERSIONADO`.

Reglas obligatorias:

1. `max_bytes` debe ser resoluble desde la política versionada antes de autorizar la carga y debe volver a comprobarse sobre el objeto recibido.
2. El tamaño declarado por el cliente es únicamente preflight; `actual_bytes` del payload recibido gobierna la verificación final.
3. `actual_bytes > max_bytes` produce `FAILED` y la versión candidata no puede alcanzar `VALIDATED_FOR_ACTIVATION`.
4. Si no puede resolverse un límite versionado, la operación falla cerrada; ausencia de configuración no significa tamaño ilimitado.
5. Esta tarea no generaliza límites específicos observados para otros buckets o clases de objeto. En particular, ningún umbral particular de imágenes legacy se convierte por inferencia en límite global de documentos/evidencia.

---

#### 6. Validación de integridad

Para cada payload aplica `FINGERPRINT_REQUIRED`.

Reglas obligatorias:

1. La versión recibida debe conservar un fingerprint del contenido exacto y el identificador del algoritmo o mecanismo con el que fue calculado.
2. La finalización debe reconciliar identidad/version, reserva, objeto recibido, metadata relevante, fingerprint y vínculo empresarial antes de habilitar la versión.
3. Una diferencia de fingerprint entre el contenido esperado/registrado y el objeto final produce `QUARANTINED`; nunca se corrige reescribiendo silenciosamente el hash o el historial.
4. Cambiar bytes implica volver a validar el payload correspondiente; un resultado anterior no certifica contenido diferente.
5. Integridad técnica no equivale a autenticidad, autorización, aprobación, procedencia jurídica ni cadena de custodia completa. La definición corporativa de autenticidad, hash, timestamp y cadena de custodia permanece en `INFO-DOM-007`.
6. Una sustitución que falle integridad no invalida ni sobrescribe automáticamente la última versión válida recibida de `EVID-ARC-005`.

---

#### 7. Validación de malware y contenido sospechoso

Para cada payload aplica `CLEAN_REQUIRED`.

El resultado de control se interpreta mediante el siguiente vocabulario mínimo:

| Resultado técnico  | Tratamiento E4                                                                 |
| ------------------ | ------------------------------------------------------------------------------ |
| `CLEAN`            | Puede continuar al cierre del gate si tipo, tamaño e integridad también pasan. |
| `MALICIOUS`        | `QUARANTINED`; bloqueado para consumo ordinario.                               |
| `SUSPICIOUS`       | `QUARANTINED`; requiere tratamiento controlado, nunca fallback a limpio.       |
| `SCAN_ERROR`       | `QUARANTINED`; fallo técnico no equivale a ausencia de malware.                |
| `SCAN_UNAVAILABLE` | `QUARANTINED`; indisponibilidad del control no habilita el archivo.            |
| `UNVERIFIABLE`     | `QUARANTINED` o `FAILED` según la causa tipada; nunca `CLEAN`.                 |

Reglas:

1. Solo `CLEAN` satisface el componente malware del gate.
2. Un payload en cuarentena no se publica, previsualiza, indexa, transforma, deriva ni entrega por el flujo ordinario.
3. El estado de cuarentena conserva identidad, versión, propietaria, sensibilidad, vínculo empresarial y motivo; no transfiere propiedad al scanner ni al servicio Storage.
4. Un reintento por fallo transitorio solo puede reutilizar la misma identidad de intento cuando el fingerprint del payload permanece idéntico. Si cambian los bytes, se trata como contenido que debe validar nuevamente.
5. Esta tarea define el resultado observable, no selecciona proveedor o motor de malware ni crea infraestructura física. La materialización técnica deberá respetar los contratos Storage y de seguridad ya aprobados.

---

#### 8. Composición del resultado

La condición necesaria para habilitar una candidata queda congelada así:

```text
VALIDATED_FOR_ACTIVATION =
    TYPE_PASS
    AND SIZE_PASS
    AND INTEGRITY_PASS
    AND MALWARE_CLEAN
```

Consecuencias:

1. Ningún componente puede omitirse por éxito de los otros tres.
2. `VALIDATED_FOR_ACTIVATION` significa únicamente que el payload superó el gate técnico E4.
3. La versión no se vuelve automáticamente vigente, aprobada, publicada, descargable ni visible.
4. La carga o sustitución solo puede completar sus efectos empresariales mediante el ciclo definido en `EVID-ARC-005` y los controles posteriores que correspondan.
5. Una candidata `FAILED` o `QUARANTINED` no desplaza la versión vigente anterior.
6. La cuarentena y el fallo deben ser trazables sin exponer el contenido en logs, errores, nombres o URLs.

---

#### 9. Matriz `EVID-FILE-VALIDATION-MATRIX-001`

Códigos utilizados:

| Código                     | Significado                                                                                                                      |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `EVID_FILE_VALIDATION_V1`  | Perfil completo de esta tarea.                                                                                                   |
| `PAYLOAD_FILE_CONDITIONAL` | El gate se ejecuta cuando la instancia materializa un payload de archivo; no obliga a fabricar uno para registros estructurados. |
| `ALLOWLIST_VERSIONADA`     | El tipo admitido debe resolverse mediante política versionada y verificarse contra contenido.                                    |
| `MAX_BYTES_VERSIONADO`     | El máximo permitido debe ser resoluble y verificarse sobre bytes reales.                                                         |
| `FINGERPRINT_REQUIRED`     | El contenido recibido debe conservar y reconciliar fingerprint/integridad.                                                       |
| `CLEAN_REQUIRED`           | Solo un resultado de malware limpio permite pasar el componente de seguridad.                                                    |
| `ESPECIFICADO`             | La decisión documental está completa; no afirma implementación física ni ejecución del gate.                                     |

| ID contextual          | Proceso      | Perfil                    | Ámbito                     | Tipo                   | Tamaño                 | Integridad             | Malware          | Estado         |
| ---------------------- | ------------ | ------------------------- | -------------------------- | ---------------------- | ---------------------- | ---------------------- | ---------------- | -------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `EVID_FILE_VALIDATION_V1` | `PAYLOAD_FILE_CONDITIONAL` | `ALLOWLIST_VERSIONADA` | `MAX_BYTES_VERSIONADO` | `FINGERPRINT_REQUIRED` | `CLEAN_REQUIRED` | `ESPECIFICADO` |

---

#### 10. Reconciliación cuantitativa

| Control                                         | Resultado |
| ----------------------------------------------- | --------: |
| Contextos de proceso esperados                  |        69 |
| Contextos de proceso materializados             |        69 |
| Entradas `DOCCTX-*` esperadas                   |       332 |
| Entradas materializadas                         |       332 |
| Claves `DOCCTX-*` únicas                        |       332 |
| Entradas con `EVID_FILE_VALIDATION_V1`          |       332 |
| Entradas con `ALLOWLIST_VERSIONADA`             |       332 |
| Entradas con `MAX_BYTES_VERSIONADO`             |       332 |
| Entradas con `FINGERPRINT_REQUIRED`             |       332 |
| Entradas con `CLEAN_REQUIRED`                   |       332 |
| Entradas que inventan un MIME concreto          |         0 |
| Entradas que inventan un límite global de bytes |         0 |
| Faltantes                                       |         0 |
| Duplicados                                      |         0 |
| Propietarias funcionales modificadas            |         0 |
| Clasificaciones mínimas modificadas             |         0 |
| Vínculos empresariales modificados              |         0 |
| Reglas de retención modificadas                 |         0 |

---

#### 11. Fronteras y decisiones reservadas

| Decisión fuera de esta tarea                                                                         | Tarea propietaria                                                              |
| ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| Acceso temporal y URLs firmadas, incluida duración y emisión de enlaces                              | `EVID-ARC-007`                                                                 |
| Auditoría de consulta y modificación de documentos/evidencia                                         | `EVID-ARC-008`                                                                 |
| Conservación legal, disposición, anonimización, eliminación y certificado                            | `EVID-ARC-009`                                                                 |
| Contingencia ante indisponibilidad de Storage                                                        | `EVID-ARC-010`                                                                 |
| Taxonomía corporativa de documentos, registros, evidencia, originales y copias                       | `INFO-DOM-003`                                                                 |
| Metadatos corporativos, almacenamiento, búsqueda y localización                                      | `INFO-DOM-005`                                                                 |
| Autenticidad, integridad probatoria, procedencia, hash, timestamp, preservación y cadena de custodia | `INFO-DOM-007`                                                                 |
| Materialización física de buckets, políticas, límites, allowlists y controles Storage                | `SUPA-ARC-018` y el paquete de implementación que corresponda una vez aprobado |

No se deja un valor físico genérico pendiente dentro de `EVID-ARC-006`: MIME y `max_bytes` se resuelven obligatoriamente desde el contrato Storage versionado que gobierne la representación; si esa referencia no es resoluble, el gate falla cerrado.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa sobre las 332 identidades documentales reglas de carga segura ya aprobadas por los contratos NFR y de arquitectura consumidos: política versionada de tipo y tamaño, verificación entre MIME declarado/detectado y extensión, control de límite antes de disponibilidad, reconciliación de fingerprint/integridad, cuarentena de contenido no verificable o sospechoso y exigencia de resultado limpio antes de disponibilidad. No introduce un comportamiento verificable nuevo ni modifica uno existente; crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0; el registro de requisitos no recibe cambios derivados de esta tarea.

---

#### 12. Criterios de aceptación

- [x] `EVID-ARC-005` figura aprobada y entrega 332 identidades `DOCCTX-*` para 69 procesos.
- [x] las 332 identidades aparecen exactamente una vez en la matriz.
- [x] las 332 identidades reciben el perfil `EVID_FILE_VALIDATION_V1`.
- [x] el gate aplica a payloads de archivo sin obligar a materializar archivos para registros puramente estructurados.
- [x] tipo declarado, tipo detectado, extensión/formato y allowlist versionada no se confunden entre sí.
- [x] nombre, extensión o MIME aportado por cliente no constituyen autoridad suficiente.
- [x] las 332 identidades exigen límite de tamaño versionado cuando exista payload de archivo.
- [x] el tamaño real vuelve a comprobarse después de recibir el payload.
- [x] las 332 identidades exigen fingerprint/integridad para el contenido recibido.
- [x] un mismatch de integridad no se corrige reescribiendo silenciosamente historial o hash.
- [x] las 332 identidades exigen resultado malware `CLEAN` para superar el componente de seguridad.
- [x] malware, sospecha, error de scanner, indisponibilidad o contenido no verificable nunca producen un fallback limpio.
- [x] solo la conjunción de tipo, tamaño, integridad y malware permite `VALIDATED_FOR_ACTIVATION`.
- [x] una candidata fallida o en cuarentena no desplaza la versión válida anterior.
- [x] el resultado técnico no concede vigencia, publicación, descarga, lectura ni aprobación empresarial.
- [x] no se inventa una allowlist universal, proveedor de scanner, límite global de bytes, bucket, path o URL.
- [x] propietaria funcional, sensibilidad, identidad, vínculo, historia y retención heredados permanecen sin cambios.
- [x] las decisiones posteriores tienen tarea propietaria exacta.
- [x] no se crean buckets, objetos, políticas, RLS, migraciones, jobs, scanners, APIs ni despliegues.
- [x] la tarea genera cero cambios en requisitos de prueba y no requiere regenerar el registro canónico.
- [x] `EVID-ARC-007` permanece reservada y no iniciada.

---

#### 13. Handoff cerrado hacia EVID-ARC-007

`EVID-ARC-007` recibe las 332 identidades documentales con un gate de validación explícito para cualquier payload de archivo: tipo permitido mediante política versionada, límite de tamaño resoluble, integridad reconciliada y malware limpio antes de habilitar la candidata. Su única responsabilidad siguiente será definir acceso temporal y URLs firmadas sin reinterpretar `VALIDATED_FOR_ACTIVATION` como autorización, publicación o vigencia empresarial.

La aprobación de `EVID-ARC-006` no inicia, desarrolla ni aprueba `EVID-ARC-007`.


### ✅ EVID-ARC-007 — Definir acceso temporal y URLs firmadas

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-006 — Definir validación de tipo, tamaño, integridad y malware` — APROBADA
**Tarea siguiente:** `EVID-ARC-008 — Definir auditoría de consulta y modificación` — RESERVADA
**Tipo de tarea:** documental; contrato transversal de acceso temporal a representaciones documentales y evidencia mediante URLs firmadas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos cubiertas:** 332 (`DOCCTX-*`)
**Perfil de acceso temporal materializado:** `EVID_TEMP_ACCESS_V1`
**Cambios físicos autorizados:** ninguno; no crea buckets, objetos, políticas, RLS, funciones, migraciones, rutas, claves, URLs reales, jobs, APIs ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar para las 332 identidades documentales un contrato de acceso temporal que exige autorización server-side antes de emitir una URL firmada, vincula la emisión con un documento y versión exactos, impone vigencia finita y reautorización para toda nueva emisión, y evita que la URL se convierta en identidad, permiso, publicación o vínculo persistente.

---

#### 1. Resultado sustantivo

La tarea materializa dos artefactos lógicos dentro de este mismo bloque:

- `EVID-TEMPORARY-ACCESS-CONTRACT-001`: contrato de solicitud, autorización, emisión, expiración y nueva emisión de acceso temporal;
- `EVID-TEMPORARY-ACCESS-MATRIX-001`: decisión explícita para las 332 identidades `DOCCTX-*` heredadas.

El contrato parte de una regla no negociable: `VALIDATED_FOR_ACTIVATION` de `EVID-ARC-006` solo acredita que la representación candidata superó su gate técnico. No concede lectura, preview, `DOWNLOAD`, publicación, compartición ni otra autoridad empresarial.

---

#### 2. Fuentes canónicas consumidas

- `EVID-ARC-001` a `EVID-ARC-005`: universo de 69 procesos, 332 identidades `DOCCTX-*`, propietaria, sensibilidad, identidad/versionado, vínculo empresarial, historia y retención.
- `EVID-ARC-006`: gate técnico `EVID_FILE_VALIDATION_V1` y handoff cerrado que prohíbe interpretar la validación como autorización, publicación o vigencia empresarial.
- `NFR-REQ-005`: finalidad, minimización, necesidad de conocer, protección por defecto, exposición segura, enlaces temporales no adivinables y prohibición de URLs persistentes como vía ordinaria de exposición protegida.
- `NFR-REQ-006`: obligación de auditar consultas, revelados, `DOWNLOAD`, comparticiones y accesos extraordinarios sin replicar el contenido protegido.
- `INFO-AUTH-002`: propietaria posterior de la política corporativa definitiva para datos sensibles, `DOWNLOAD`, impresión, exportación, compartición y URLs firmadas.
- `INFO-DOM-005` e `INFO-DOM-010`: propietarias posteriores de almacenamiento/localización y de compartición/divulgación/terceros, sin alterar el mínimo E4 fijado aquí.

---

#### 3. Contrato `EVID-TEMPORARY-ACCESS-CONTRACT-001`

##### 3.1. Gate previo a la emisión

Una URL firmada solo podrá emitirse cuando todos los componentes siguientes sean resolubles y aceptados:

```text
document_context_id + document_id + document_version
        +
process_id + process_instance_id
        +
resource_type + resource_id [+ resource_version]
        +
principal + actor efectivo + contexto
        +
finalidad + acción solicitada
        +
clasificación + estado/vigencia del documento
        +
decisión de autorización server-side = ALLOW
        +
access_policy_id + access_policy_version resolubles
        ↓
AUTHORIZED_FOR_TEMPORARY_ISSUE
```

Reglas obligatorias:

1. Conocer `document_id`, una ruta física, un nombre, una clave de objeto o una URL anterior no concede acceso.
2. La decisión se toma en servidor con identidad, actor efectivo, finalidad, clasificación, recurso, relación, territorio, estado y acción exacta; una interfaz visible no sustituye ese gate.
3. La URL firmada se emite únicamente después de `ALLOW`; nunca se usa como prueba de que el actor estaba autorizado antes de obtenerla.
4. El alcance de la emisión queda fijado al `document_id` y `document_version` solicitados. Sustitución, anulación o nueva versión no transfieren automáticamente el acceso a otra versión.
5. `PREVIEW`, `VIEW` y `DOWNLOAD` son acciones diferenciables. Autorizar una de ellas no concede por inferencia las demás ni concede compartición a terceros.
6. La compartición o divulgación a un tercero requiere su contrato propietario posterior; `EVID-ARC-007` no convierte un enlace bearer en un permiso de difusión general.
7. Una denegación, ambigüedad, política ausente, referencia no resoluble o fallo de emisión termina en fallo cerrado sin URL utilizable.

##### 3.2. Sobre mínimo de solicitud y emisión

| Campo                                                  | Obligación                               | Regla                                                                                                                          |
| ------------------------------------------------------ | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `access_request_id`                                    | requerido                                | Identifica de forma estable la solicitud de acceso y permite correlacionar decisión y resultado sin persistir la URL completa. |
| `document_context_id`                                  | requerido                                | Resuelve exactamente a una identidad `DOCCTX-*` aprobada.                                                                      |
| `document_id` + `document_version`                     | requeridos                               | Fijan identidad lógica y versión concreta; una URL no sustituye estos identificadores.                                         |
| `process_id` + `process_instance_id`                   | requeridos al materializar la instancia  | Conservan el contexto empresarial de la solicitud.                                                                             |
| `resource_type` + `resource_id` [+ `resource_version`] | condicionales según el contrato heredado | Vinculan el acceso con el recurso empresarial autoritativo.                                                                    |
| `principal_id` + `effective_actor_id`                  | requeridos                               | Distinguen sesión/principal técnico de la persona o actor efectivo.                                                            |
| `purpose_code`                                         | requerido                                | Declara finalidad concreta; ausencia o ambigüedad bloquea la emisión.                                                          |
| `requested_action`                                     | requerido                                | Uno de los modos de acceso gobernados por esta tarea; no se infiere desde la ruta cliente.                                     |
| `classification` + `classification_version`            | requeridos                               | Heredan la clasificación vigente y cualquier elevación aplicable.                                                              |
| `authorization_decision_ref`                           | requerido                                | Referencia la decisión server-side que permitió o denegó la solicitud; no contiene secretos.                                   |
| `access_policy_id` + `access_policy_version`           | requeridos                               | Resuelven la política temporal aplicable a clase, acción y contexto.                                                           |
| `issued_at`                                            | requerido cuando se emite                | Marca el inicio de vigencia del artefacto temporal.                                                                            |
| `expires_at`                                           | requerido cuando se emite                | Debe ser posterior a `issued_at` y finito; no existe URL permanente como fallback.                                             |
| `delivery_mode`                                        | requerido                                | Para este contrato: `SIGNED_URL_EPHEMERAL` cuando exista representación física que deba entregarse temporalmente.              |
| `issuance_outcome`                                     | requerido                                | `ISSUED`, `DENIED`, `POLICY_UNRESOLVED`, `ISSUE_FAILED` o `NOT_APPLICABLE_NO_FILE_PAYLOAD`.                                    |

El valor completo de la URL firmada y su material de firma son artefactos efímeros de transporte. El registro persistente conserva identidad de solicitud, decisión, recurso, versión, política y tiempos; no necesita persistir el valor completo de la URL.

---

#### 4. Vigencia temporal, expiración y nueva emisión

Se adopta `TTL_POLICY_REQUIRED` para las 332 identidades. La política temporal debe ser versionada y resoluble antes de emitir.

Reglas:

1. Toda emisión tiene `issued_at` y `expires_at`; `expires_at` es finito y posterior a `issued_at`.
2. La duración concreta no se inventa en E4: se obtiene de `access_policy_id + access_policy_version` según clasificación, acción y contexto. Si falta esa referencia o no produce una vigencia válida, el resultado es `POLICY_UNRESOLVED` y no se emite.
3. La expiración no se extiende modificando el mismo artefacto. Continuar el acceso exige una solicitud nueva y una decisión de autorización nueva: `REAUTHORIZE_ON_REISSUE`.
4. Cambio de actor, sesión, relación, territorio, estado del recurso, clasificación, versión documental o autorización obliga a evaluar de nuevo toda futura emisión.
5. Revocar autoridad o finalidad bloquea futuras emisiones y nuevas emisiones. No se afirmará que una URL ya emitida fue invalidada antes de `expires_at` salvo que el mecanismo físico seleccionado demuestre esa capacidad.
6. Vencer la URL no elimina el documento, no cambia su retención y no demuestra que una copia legítimamente obtenida haya sido eliminada.
7. El reloj y la unidad temporal del mecanismo físico deberán ser coherentes y verificables en implementación; esta tarea no inventa proveedor, algoritmo ni unidad específica de configuración.

##### 4.1. Política pendiente con propietario exacto

Para las 332 identidades:

```text
temporary_access_policy_resolution = ACCESS_POLICY_PENDING
owner = INFO-AUTH-002
exit_condition = access_policy_id + access_policy_version
                 + applicability_by_classification_and_action
                 + finite_ttl_rule
                 + reissue_rule
                 + external_sharing_boundary
```

`ACCESS_POLICY_PENDING` no deja indeterminado el comportamiento seguro: mientras permanezca, la emisión de una URL temporal falla cerrada. El pendiente corresponde exclusivamente a los valores y reglas corporativas definitivas que la tarea AA propietaria debe materializar.

---

#### 5. Propiedades de la URL firmada

Cuando exista una representación física y el gate permita acceso, `SIGNED_URL_EPHEMERAL` deberá cumplir:

- ser temporal y no adivinable;
- apuntar a la representación exacta de `document_id + document_version`;
- no convertirse en `document_id`, `resource_id`, ruta canónica ni referencia empresarial persistente;
- no aparecer como índice público ni como URL persistente reutilizable;
- no incorporar JWT, cookies, PIN, credenciales empresariales ni secretos de aplicación adicionales para completar la autorización;
- no registrarse completa en logs, analytics, mensajes de error, auditoría ni metadatos empresariales;
- no exponer por nombre, path, query, preview o metadatos más información que la permitida por la decisión de acceso;
- no acreditar por su mera emisión que el contenido fue visto, obtenido, compartido o aceptado;
- exigir solicitud nueva para una nueva emisión después de expiración o cuando cambie el contexto gobernante.

La firma del enlace protege la entrega temporal; no sustituye autorización, minimización, clasificación, vínculo empresarial, trazabilidad ni retención.

---

#### 6. Estados y resultados del acceso temporal

| Código                           | Significado                                                                      | Efecto permitido                                                                                  |
| -------------------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `REQUESTED`                      | Existe solicitud identificada pendiente de evaluación.                           | Ninguna URL.                                                                                      |
| `AUTHORIZED_FOR_TEMPORARY_ISSUE` | La solicitud obtuvo `ALLOW` y política temporal resoluble.                       | Puede intentar emisión.                                                                           |
| `ISSUED`                         | El mecanismo produjo una URL efímera con vigencia finita.                        | Exponerla únicamente al consumidor autorizado del flujo.                                          |
| `DENIED`                         | La autorización o el contexto impiden el acceso.                                 | Ninguna URL ni filtración de existencia/metadatos.                                                |
| `POLICY_UNRESOLVED`              | No existe política temporal resoluble.                                           | Fallo cerrado; ninguna URL.                                                                       |
| `ISSUE_FAILED`                   | El mecanismo técnico no produjo la URL.                                          | No degradar a URL pública/persistente; permitir nueva solicitud controlada.                       |
| `EXPIRED`                        | Se alcanzó `expires_at`.                                                         | Nueva solicitud y nueva autorización si se requiere continuar.                                    |
| `NOT_APPLICABLE_NO_FILE_PAYLOAD` | La identidad no posee representación física que deba entregarse mediante enlace. | La autorización del registro estructurado se resuelve por su canal propietario, sin fabricar URL. |

Un estado de emisión nunca cambia el estado empresarial del documento ni demuestra consulta efectiva. La auditoría exacta de intento, emisión, acceso y modificación pertenece a `EVID-ARC-008`.

---

#### 7. Fronteras con publicación, compartición y acceso extraordinario

1. Una versión clasificada como pública solo es pública cuando existe una decisión de publicación vigente del proceso propietario. La existencia de una URL firmada no publica el documento ni vuelve públicos borradores, metadatos o historial.
2. Compartir con un tercero no es equivalente a emitir una URL para el actor actual. `INFO-DOM-010` e `INFO-AUTH-002` materializarán destinatario, transferencia, divulgación y reglas corporativas definitivas.
3. El acceso extraordinario no nace de un rol genérico ni de conocer la URL; debe ser mínimo, temporal, justificado y auditable según los contratos de autorización vigentes.
4. Preview, thumbnail, nombre visible y metadata reciben el mismo límite de clasificación y autorización que la representación que ayudan a localizar.
5. El mecanismo de Storage no adquiere propiedad funcional ni autoridad sobre el contenido empresarial.

---

#### 8. Matriz `EVID-TEMPORARY-ACCESS-MATRIX-001`

Códigos aplicados:

| Código                   | Significado                                                                                                      |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `EVID_TEMP_ACCESS_V1`    | Aplica íntegramente el contrato de acceso temporal definido en esta tarea.                                       |
| `AUTHZ_BEFORE_ISSUE`     | La URL solo puede emitirse después de una decisión server-side `ALLOW`.                                          |
| `SIGNED_URL_EPHEMERAL`   | La representación física, cuando exista, se entrega mediante artefacto temporal; no URL persistente.             |
| `TTL_POLICY_REQUIRED`    | `issued_at`, `expires_at` y política temporal versionada son obligatorios para emitir.                           |
| `REAUTHORIZE_ON_REISSUE` | Toda nueva emisión exige nueva solicitud y nueva decisión de autorización.                                       |
| `ACCESS_POLICY_PENDING`  | Falta política corporativa definitiva. Propietaria: `INFO-AUTH-002`; hasta resolverla, la emisión falla cerrada. |
| `FRONTERA_OBLIGATORIA`   | Se conserva la frontera heredada de propiedad/recurso.                                                           |
| `APLICACION_DIFERIDA`    | La definición es válida, pero no acredita disponibilidad de la aplicación propietaria objetivo.                  |
| `NINGUNO`                | No existe frontera adicional heredada para esta identidad.                                                       |

| ID contextual          | Proceso      | Perfil                | Autorización         | Entrega                | Vigencia              | Nueva emisión            | Estado         | Bloqueo / condición                          |
| ---------------------- | ------------ | --------------------- | -------------------- | ---------------------- | --------------------- | ------------------------ | -------------- | -------------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `EVID_TEMP_ACCESS_V1` | `AUTHZ_BEFORE_ISSUE` | `SIGNED_URL_EPHEMERAL` | `TTL_POLICY_REQUIRED` | `REAUTHORIZE_ON_REISSUE` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |

---

#### 9. Reconciliación cuantitativa

| Control                                       | Resultado |
| --------------------------------------------- | --------: |
| Contextos de proceso esperados                |        69 |
| Contextos de proceso materializados           |        69 |
| Entradas `DOCCTX-*` esperadas                 |       332 |
| Entradas materializadas                       |       332 |
| Claves `DOCCTX-*` únicas                      |       332 |
| Entradas con `EVID_TEMP_ACCESS_V1`            |       332 |
| Entradas con `AUTHZ_BEFORE_ISSUE`             |       332 |
| Entradas con `SIGNED_URL_EPHEMERAL`           |       332 |
| Entradas con `TTL_POLICY_REQUIRED`            |       332 |
| Entradas con `REAUTHORIZE_ON_REISSUE`         |       332 |
| Entradas con `ACCESS_POLICY_PENDING`          |       332 |
| Fronteras `FRONTERA_OBLIGATORIA` preservadas  |       245 |
| Condiciones `APLICACION_DIFERIDA` preservadas |        14 |
| Contextos sin frontera adicional (`NINGUNO`)  |        73 |
| Entradas con TTL numérico inventado           |         0 |
| Entradas con URL real inventada               |         0 |
| Faltantes                                     |         0 |
| Duplicados                                    |         0 |
| Propietarias funcionales modificadas          |         0 |
| Clasificaciones mínimas modificadas           |         0 |
| Vínculos empresariales modificados            |         0 |
| Reglas de retención modificadas               |         0 |
| Decisiones del gate de validación modificadas |         0 |

---

#### 10. Fronteras y decisiones reservadas

| Decisión fuera de esta tarea                                                                                                  | Tarea propietaria                                                              |
| ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| Política corporativa definitiva de clasificación/finalidad/acción para accesos y URLs firmadas, incluidos valores de vigencia | `INFO-AUTH-002`                                                                |
| Compartición, divulgación, terceros, encargados, transferencias y requerimientos de autoridad                                 | `INFO-DOM-010`                                                                 |
| Metadatos corporativos, almacenamiento, búsqueda, localización y vínculo con recursos                                         | `INFO-DOM-005`                                                                 |
| Auditoría detallada de consulta, emisión, acceso y modificación                                                               | `EVID-ARC-008`                                                                 |
| Conservación legal, disposición, anonimización, eliminación y certificado                                                     | `EVID-ARC-009`                                                                 |
| Contingencia ante indisponibilidad de Storage                                                                                 | `EVID-ARC-010`                                                                 |
| Materialización física de buckets, políticas de Storage y mecanismo real de emisión                                           | `SUPA-ARC-018` y el paquete de implementación que corresponda una vez aprobado |

No queda un pendiente narrativo sin propietario: el único bloqueo material para emitir en implementación es `ACCESS_POLICY_PENDING`, cuya salida está definida en la sección 4.1. Las demás filas anteriores preservan responsabilidades ya reservadas y no impiden cerrar la especificación E4.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa sobre las 332 identidades documentales controles ya aprobados por `NFR-REQ-005`, `NFR-REQ-006` y los contratos EVID precedentes para autorización previa a cualquier exposición, enlaces temporales no adivinables, prohibición de URL persistente como bypass, necesidad de finalidad/clasificación/recurso/acción, revalidación de contexto, minimización de URLs y metadatos y trazabilidad de accesos sensibles. No fija un umbral temporal numérico nuevo ni introduce una excepción de autorización; la política corporativa definitiva permanece en su tarea propietaria. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0; el registro de requisitos no recibe cambios derivados de esta tarea.

---

#### 11. Criterios de aceptación

- [x] `EVID-ARC-006` figura aprobada y entrega 332 identidades `DOCCTX-*` para 69 procesos.
- [x] las 332 identidades aparecen exactamente una vez en la matriz.
- [x] las 332 identidades reciben `EVID_TEMP_ACCESS_V1`, `AUTHZ_BEFORE_ISSUE`, `SIGNED_URL_EPHEMERAL`, `TTL_POLICY_REQUIRED` y `REAUTHORIZE_ON_REISSUE`.
- [x] `VALIDATED_FOR_ACTIVATION` no se interpreta como autorización, publicación ni vigencia empresarial.
- [x] conocer una ruta, objeto, nombre o URL previa no concede acceso.
- [x] la autorización server-side resuelve actor, finalidad, clasificación, recurso, relación, territorio, estado y acción exacta antes de emitir.
- [x] una emisión queda vinculada con `document_id + document_version` exactos y no se transfiere automáticamente a otra versión.
- [x] preview, `VIEW` y `DOWNLOAD` no se fusionan en una autoridad genérica.
- [x] la URL firmada es temporal, no adivinable y no se convierte en identidad empresarial ni URL persistente.
- [x] `issued_at` y `expires_at` son obligatorios para toda emisión.
- [x] la ausencia de política temporal resoluble produce fallo cerrado.
- [x] una nueva emisión exige una solicitud y autorización nuevas; no se prolonga silenciosamente el artefacto anterior.
- [x] no se promete invalidación anticipada de una URL ya emitida cuando el mecanismo físico todavía no ha demostrado esa capacidad.
- [x] la URL completa o su material de firma no se persisten en logs, analytics, errores, auditoría o metadatos empresariales.
- [x] la emisión no demuestra que el contenido fue visto, obtenido, compartido o aceptado.
- [x] la expiración no elimina el documento ni modifica retención, clasificación o historia.
- [x] la publicación pública y la compartición a terceros permanecen separadas del mero mecanismo de URL firmada.
- [x] se preservan exactamente 245 fronteras obligatorias, 14 condiciones de aplicación diferida y 73 contextos sin frontera adicional.
- [x] propietaria, sensibilidad, identidad, vínculo, retención y gate técnico heredados permanecen sin cambios.
- [x] no se inventan segundos/minutos de TTL, URLs reales, buckets, paths, proveedor, algoritmo de firma ni políticas físicas.
- [x] no se crean objetos, RLS, funciones, migraciones, jobs, APIs ni despliegues.
- [x] la tarea genera cero cambios en requisitos de prueba y no requiere regenerar el registro canónico.
- [x] `EVID-ARC-008` permanece reservada y no iniciada.

---

#### 12. Handoff cerrado hacia EVID-ARC-008

`EVID-ARC-008` recibe las 332 identidades documentales con un contrato de acceso temporal explícito: autorización server-side antes de emisión, vínculo a documento/versión exactos, URL firmada efímera, vigencia finita gobernada por política versionada, fallo cerrado cuando la política no sea resoluble y reautorización obligatoria para toda nueva emisión. Su única responsabilidad siguiente será definir la auditoría de consulta y modificación, incluidos eventos, actor, finalidad, resultado y correlación, sin cambiar las decisiones de acceso temporal aprobadas aquí.

La aprobación de `EVID-ARC-007` no inicia, desarrolla ni aprueba `EVID-ARC-008`.


### ✅ EVID-ARC-008 — Definir auditoría de consulta y modificación

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-007 — Definir acceso temporal y URLs firmadas` — APROBADA
**Tarea siguiente:** `EVID-ARC-009 — Definir conservación legal y eliminación` — RESERVADA
**Tipo de tarea:** documental; contrato transversal de auditoría de consulta, exposición y modificación de documentos y evidencia
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos cubiertas:** 332 (`DOCCTX-*`)
**Perfil de auditoría materializado:** `EVID_AUDIT_TRAIL_V1`
**Cambios físicos autorizados:** ninguno; no crea tablas, buckets, objetos, políticas, RLS, funciones, triggers, migraciones, jobs, rutas, APIs, colectores, logs productivos ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar para las 332 identidades documentales un contrato de auditoría que permite reconstruir quién o qué consultó, intentó consultar, expuso o modificó un documento o evidencia, bajo qué finalidad y contexto, sobre qué versión exacta, con qué decisión y resultado, y cómo se correlaciona el hecho con la autorización, solicitud, proceso y recurso, sin copiar el contenido protegido ni confundir emisión de acceso temporal con consumo real.

---

#### 1. Propósito y resultado sustantivo

`EVID-ARC-008` especializa para documentos y evidencia el sobre auditable ya aprobado por `NFR-REQ-006` y lo aplica al universo estable de 332 `DOCCTX-*` recibido de `EVID-ARC-007`.

El resultado debe permitir reconstruir de forma determinista:

```text
ACTOR / SISTEMA + FINALIDAD + CONTEXTO
        ↓
PROCESO + INSTANCIA + DOCUMENTO + VERSIÓN
        ↓
ACCIÓN SOLICITADA + DECISIÓN DE AUTORIZACIÓN
        ↓
CONSULTA / EXPOSICIÓN / MODIFICACIÓN OBSERVADA
        ↓
RESULTADO + CORRELACIÓN + EVIDENCIA DE AUDITORÍA
```

La auditoría no se convierte en una copia del documento, no sustituye el historial empresarial y no transforma una URL firmada, request, respuesta HTTP o evento técnico en prueba automática de consulta efectiva.

---

#### 2. Entradas y fronteras obligatorias

Esta tarea conserva sin reinterpretar:

- las 332 identidades `DOCCTX-*` y sus 69 `VPROC-*`;
- identidad, propietaria, sensibilidad, vínculo empresarial, historia no destructiva, retención base y gate técnico heredados;
- el contrato `EVID_TEMP_ACCESS_V1` de `EVID-ARC-007`;
- las clases `T3_ACCESS_DISCLOSURE` y `T5_EVIDENCE_DOCUMENT` del contrato de trazabilidad vigente;
- el sobre `NFR-AUDIT-EVENT-ENVELOPE-001` como base de campos y semántica;
- `ACCESS_POLICY_PENDING` como condición heredada mientras `INFO-AUTH-002` no materialice la política corporativa definitiva de acceso temporal;
- `FRONTERA_OBLIGATORIA`, `APLICACION_DIFERIDA` y `NINGUNO` exactamente según la identidad recibida.

Fronteras no modificadas:

| Tema                                                                      | Propietaria posterior / límite                                 |
| ------------------------------------------------------------------------- | -------------------------------------------------------------- |
| política corporativa definitiva de acceso, exposición y URLs firmadas     | `INFO-AUTH-002`                                                |
| investigación de accesos o cambios indebidos y preservación investigativa | `INFO-DOM-013`; protección de esa evidencia en `INFO-AUTH-004` |
| conservación legal, hold y eliminación de documentos                      | `EVID-ARC-009`; gobierno definitivo en `INFO-DOM-006`          |
| autenticidad, hash corporativo y cadena de custodia definitiva            | `INFO-DOM-007`                                                 |
| contingencia de Storage                                                   | `EVID-ARC-010`                                                 |
| habilitación de implementación física del carril                          | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`        |

---

#### 3. Perfil canónico `EVID_AUDIT_TRAIL_V1`

Toda identidad usa el mismo perfil base. La sensibilidad y el contexto pueden aumentar controles, pero nunca reducir el sobre mínimo.

| Código                   | Regla                                                                                                                                          |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUDIT_CONSULT`          | Toda consulta o exposición auditable conserva actor/sistema, finalidad, documento y versión, acción, decisión y resultado.                     |
| `AUDIT_MODIFY`           | Toda modificación solicitada, rechazada o materializada conserva acción, versión previa/nueva o referencias equivalentes, motivo y resultado.  |
| `ACTOR_PURPOSE_REQUIRED` | Actor humano efectivo o actor de servicio y finalidad resoluble son obligatorios; la ausencia no se reemplaza con texto libre inventado.       |
| `OUTCOME_REQUIRED`       | Una solicitud, una autorización y un efecto material son hechos distintos; cada evento declara su resultado real.                              |
| `CORRELATION_REQUIRED`   | Request, comando, proceso, instancia, recurso, autorización, causalidad e idempotencia se enlazan cuando apliquen.                             |
| `ISSUE_IS_NOT_ACCESS`    | Emitir o reemitir acceso temporal no demuestra que el contenido fue consultado.                                                                |
| `OBSERVED_ACCESS_ONLY`   | Un evento de acceso efectivo solo se registra como tal cuando el canal o proveedor permite observarlo; no se infiere desde una emisión previa. |
| `NO_CONTENT_IN_AUDIT`    | El evento no copia archivo, documento, secreto, token, URL firmada completa ni payload sensible completo.                                      |
| `APPEND_ONLY_CORRECTION` | Un evento de auditoría no se sobrescribe; una corrección crea un evento enlazado mediante `corrects_event_id` o referencia equivalente.        |

---

#### 4. Acciones auditables de consulta y exposición

El campo `action` utilizará códigos estables. La existencia de un código no concede autoridad ni implica disponibilidad de una superficie.

| Acción                    | Qué demuestra el evento                                                                                       | Clase base                                      |
| ------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `SEARCH`                  | ejecución autorizada o denegada de una búsqueda relacionada con el documento, con alcance/filtros minimizados | `T3_ACCESS_DISCLOSURE`                          |
| `LIST`                    | consulta de una colección o expediente que puede revelar existencia o metadatos                               | `T3_ACCESS_DISCLOSURE`                          |
| `METADATA_READ`           | lectura de metadatos autorizados de una identidad/versión                                                     | `T3_ACCESS_DISCLOSURE`                          |
| `PREVIEW`                 | solicitud y resultado de vista previa                                                                         | `T3_ACCESS_DISCLOSURE` + `T5_EVIDENCE_DOCUMENT` |
| `VIEW`                    | consulta de contenido en una superficie autorizada                                                            | `T3_ACCESS_DISCLOSURE` + `T5_EVIDENCE_DOCUMENT` |
| `DOWNLOAD`                | obtención autorizada de una representación por el canal correspondiente                                       | `T3_ACCESS_DISCLOSURE` + `T5_EVIDENCE_DOCUMENT` |
| `EXPORT`                  | extracción controlada que incluye o referencia la identidad                                                   | `T3_ACCESS_DISCLOSURE`                          |
| `PRINT`                   | exposición mediante impresión controlada                                                                      | `T3_ACCESS_DISCLOSURE`                          |
| `SHARE`                   | divulgación a un destinatario o canal autorizado                                                              | `T3_ACCESS_DISCLOSURE`                          |
| `TEMP_ACCESS_ISSUE`       | emisión inicial de acceso temporal; no prueba consumo                                                         | `T3_ACCESS_DISCLOSURE` + `T5_EVIDENCE_DOCUMENT` |
| `TEMP_ACCESS_REISSUE`     | nueva emisión precedida por nueva autorización; no prolonga ni prueba consumo del artefacto anterior          | `T3_ACCESS_DISCLOSURE` + `T5_EVIDENCE_DOCUMENT` |
| `CONTENT_ACCESS_OBSERVED` | solicitud real observada contra la representación exacta, cuando el mecanismo físico permita demostrarla      | `T3_ACCESS_DISCLOSURE` + `T5_EVIDENCE_DOCUMENT` |
| `ADMIN_ACCESS`            | consulta privilegiada o de soporte autorizada sobre documento/evidencia                                       | `T0_CONTROL_CRITICAL` + `T3_ACCESS_DISCLOSURE`  |

Las denegaciones sensibles también son auditables. El evento registra la acción solicitada, decisión, razón tipada y cero efecto; no revela al solicitante metadatos adicionales del recurso protegido.

---

#### 5. Acciones auditables de modificación

Las modificaciones conservan el hecho anterior y nunca se interpretan como sobrescritura destructiva.

| Acción                     | Resultado auditable mínimo                                                                                   | Frontera                                           |
| -------------------------- | ------------------------------------------------------------------------------------------------------------ | -------------------------------------------------- |
| `LOAD`                     | solicitud, validación previa aplicable, identidad/versión creada o rechazo y correlación                     | no redefine validación de `EVID-ARC-006`           |
| `SUBSTITUTE`               | versión sustituida, nueva versión, motivo, actor, decisión y resultado                                       | no destruye versión anterior                       |
| `ANNUL`                    | identidad/versión afectada, causa, autoridad y estado resultante                                             | no equivale a eliminación física                   |
| `METADATA_UPDATE`          | campos o grupos de metadatos afectados mediante referencias minimizadas, versión anterior/nueva y motivo     | no copia valores sensibles completos en auditoría  |
| `LINK_UPDATE`              | cambio de vínculo con proceso, instancia, recurso o evidencia relacionado, con origen/destino identificables | no transfiere propiedad empresarial por inferencia |
| `VALIDATION_STATUS_UPDATE` | transición del estado técnico de validación con causa y evidencia técnica referenciada                       | conserva las reglas de `EVID-ARC-006`              |

`RETENTION_CHANGE`, `HOLD_CHANGE`, `DISPOSITION` y eliminación física no se materializan en esta tarea. Esas acciones pertenecen a `EVID-ARC-009` y deberán, cuando sean definidas, consumir el mismo sobre auditable sin alterar las reglas aprobadas aquí.

---

#### 6. Sobre mínimo del evento documental

`EVID_AUDIT_TRAIL_V1` consume los campos aplicables de `NFR-AUDIT-EVENT-ENVELOPE-001` y exige para consulta/modificación el siguiente mínimo resoluble:

```text
event_id
event_type
event_version
event_class
occurred_at
recorded_at
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
reason_code
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
policy_versions
classification
retention_policy_id
hold_status
evidence_refs[]
integrity_reference
corrects_event_id
supersedes_event_id
purpose_ref
authorization_decision_ref
temporary_access_ref
```

Reglas de especialización:

1. `purpose_ref` referencia una finalidad empresarial resoluble; no almacena texto sensible irrestricto.
2. `authorization_decision_ref` enlaza la decisión server-side cuando la acción exige autorización; no reemplaza sus razones o evidencia propietarias.
3. `temporary_access_ref` enlaza emisión/reemisión/observación sin persistir la URL completa ni material de firma.
4. `resource_id + resource_version` identifican la representación lógica exacta; una nueva versión requiere un evento distinto.
5. cuando un campo no aplique, su ausencia debe ser interpretable por contrato y no sustituirse por un valor inventado.
6. cuando un actor humano no exista legítimamente, `service_actor_ref` u otra atribución técnica aprobada identifica al ejecutor.

---

#### 7. Reglas de resultado, correlación y no inferencia

- una solicitud puede terminar `DENY`, `REJECTED`, `FAILED` o `SUCCEEDED` según la etapa; no se fabricará `SUCCEEDED` desde un acuse técnico;
- `TEMP_ACCESS_ISSUE` o `TEMP_ACCESS_REISSUE` con resultado exitoso demuestran únicamente emisión del mecanismo temporal;
- `CONTENT_ACCESS_OBSERVED` solo existe cuando hay evidencia técnica del acceso; ausencia de ese evento no prueba que nunca existió acceso si el mecanismo físico no ofrece observación suficiente;
- un `DOWNLOAD`, `PRINT`, `EXPORT` o `SHARE` auditado no demuestra aceptación, aprobación, firma ni efecto empresarial posterior;
- un `LOAD`, `SUBSTITUTE`, `ANNUL` o cambio de metadata/vínculo no borra el evento anterior ni la versión anterior;
- reintentos conservan `idempotency_key` y aumentan `attempt_number` cuando aplique;
- un evento correctivo referencia el evento corregido y conserva ambos;
- toda correlación entre aplicaciones mantiene la propietaria de cada efecto y no duplica una decisión ajena como propia.

---

#### 8. Minimización y protección de la propia auditoría

La auditoría conserva suficiente contexto para reconstrucción sin convertirse en un repositorio paralelo de información sensible.

Queda prohibido persistir dentro del evento:

- contenido completo del documento o archivo;
- secretos, tokens, PIN, credenciales o material criptográfico;
- URL firmada completa o query string que transporte credenciales;
- payload empresarial completo por comodidad;
- nombres, filtros o términos sensibles cuando una referencia minimizada sea suficiente;
- snapshots completos si una referencia de integridad/versionado demuestra el cambio.

La consulta, exportación, preservación, corrección o administración de estos eventos de auditoría también debe ser auditada. Las reglas de investigación, preservación y cierre permanecen en `INFO-DOM-013`; la autorización privilegiada correspondiente permanece en `INFO-AUTH-004`.

---

#### 9. Matriz materializada por identidad documental

Códigos aplicados:

| Código                   | Significado                                                                       |
| ------------------------ | --------------------------------------------------------------------------------- |
| `EVID_AUDIT_TRAIL_V1`    | Perfil completo de auditoría documental de esta tarea.                            |
| `AUDIT_CONSULT`          | Consulta/exposición auditada con acción, decisión y resultado.                    |
| `AUDIT_MODIFY`           | Modificación auditada con acción, versión/estado y resultado.                     |
| `ACTOR_PURPOSE_REQUIRED` | Actor/sistema y finalidad resolubles obligatorios.                                |
| `OUTCOME_REQUIRED`       | Resultado explícito; no inferido desde solicitud, emisión o acuse.                |
| `CORRELATION_REQUIRED`   | Correlación con proceso, recurso, request/comando y causalidad cuando aplique.    |
| `ACCESS_POLICY_PENDING`  | Condición heredada de `EVID-ARC-007`; propietaria `INFO-AUTH-002`.                |
| `FRONTERA_OBLIGATORIA`   | La identidad conserva frontera de dominio/propiedad heredada.                     |
| `APLICACION_DIFERIDA`    | La definición documental no acredita disponibilidad de la aplicación propietaria. |
| `NINGUNO`                | No existe frontera heredada adicional para esa identidad.                         |

| ID contextual          | Proceso      | Perfil                | Consulta        | Modificación   | Actor/finalidad          | Resultado          | Correlación            | Estado         | Bloqueo / frontera heredada                  |
| ---------------------- | ------------ | --------------------- | --------------- | -------------- | ------------------------ | ------------------ | ---------------------- | -------------- | -------------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `EVID_AUDIT_TRAIL_V1` | `AUDIT_CONSULT` | `AUDIT_MODIFY` | `ACTOR_PURPOSE_REQUIRED` | `OUTCOME_REQUIRED` | `CORRELATION_REQUIRED` | `ESPECIFICADO` | `ACCESS_POLICY_PENDING+FRONTERA_OBLIGATORIA` |

---

#### 10. Reconciliación cuantitativa

| Control                                       | Resultado |
| --------------------------------------------- | --------: |
| Contextos de proceso esperados                |        69 |
| Contextos de proceso materializados           |        69 |
| Entradas `DOCCTX-*` esperadas                 |       332 |
| Entradas materializadas                       |       332 |
| Claves `DOCCTX-*` únicas                      |       332 |
| Entradas con `EVID_AUDIT_TRAIL_V1`            |       332 |
| Entradas con `AUDIT_CONSULT`                  |       332 |
| Entradas con `AUDIT_MODIFY`                   |       332 |
| Entradas con `ACTOR_PURPOSE_REQUIRED`         |       332 |
| Entradas con `OUTCOME_REQUIRED`               |       332 |
| Entradas con `CORRELATION_REQUIRED`           |       332 |
| Condiciones heredadas `ACCESS_POLICY_PENDING` |       332 |
| Fronteras `FRONTERA_OBLIGATORIA`              |       245 |
| Condiciones `APLICACION_DIFERIDA`             |        14 |
| Contextos `NINGUNO`                           |        73 |
| Faltantes                                     |         0 |
| Duplicados                                    |         0 |

---

#### 11. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea instancia sobre las 332 identidades documentales obligaciones de auditoría ya aprobadas por los contratos vigentes de trazabilidad y proceso: sobre auditable versionado, atribución de actor y contexto, finalidad, resultado, correlación, historial no destructivo, acceso/divulgación sensibles, auditoría de la propia auditoría y minimización del evento. No introduce una regla ejecutable nueva ni modifica una existente. Crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 12. Criterios de aceptación

- [x] `EVID-ARC-007` figura aprobada y entrega 332 identidades `DOCCTX-*` para 69 procesos.
- [x] las 332 identidades aparecen exactamente una vez en la matriz.
- [x] las 332 identidades reciben `EVID_AUDIT_TRAIL_V1`, `AUDIT_CONSULT`, `AUDIT_MODIFY`, `ACTOR_PURPOSE_REQUIRED`, `OUTCOME_REQUIRED` y `CORRELATION_REQUIRED`.
- [x] consulta, exposición, modificación, autorización, emisión temporal y efecto empresarial permanecen conceptualmente separados.
- [x] una emisión o reemisión temporal no se registra como prueba de acceso efectivo.
- [x] `CONTENT_ACCESS_OBSERVED` solo puede representar un acceso realmente observable por el mecanismo físico.
- [x] las denegaciones sensibles conservan acción, decisión, razón tipada y cero efecto sin filtrar información adicional.
- [x] toda modificación conserva documento/versión afectada, acción, actor/sistema, finalidad, motivo y resultado según aplicabilidad.
- [x] sustitución, anulación y corrección no sobrescriben el evento ni la versión anteriores.
- [x] request, comando, correlación, causalidad, idempotencia y reintentos se conservan cuando apliquen.
- [x] el evento usa referencias y minimización en lugar de copiar contenido sensible.
- [x] secretos, tokens, credenciales y URLs firmadas completas quedan fuera del payload de auditoría.
- [x] la consulta o administración de la propia auditoría también queda sometida a auditoría.
- [x] las decisiones aprobadas de identidad, propietaria, sensibilidad, retención, validación técnica y acceso temporal permanecen sin cambios.
- [x] se preservan exactamente 245 fronteras obligatorias, 14 condiciones de aplicación diferida y 73 contextos sin frontera adicional.
- [x] las 332 condiciones `ACCESS_POLICY_PENDING` heredadas permanecen vinculadas con `INFO-AUTH-002` y no se reinterpretan como falla de auditoría.
- [x] `RETENTION_CHANGE`, `HOLD_CHANGE`, `DISPOSITION` y eliminación física permanecen reservadas a `EVID-ARC-009`.
- [x] investigación y preservación de accesos/cambios indebidos permanecen en `INFO-DOM-013` y `INFO-AUTH-004`.
- [x] no se crean tablas, objetos de Storage, políticas, RLS, funciones, triggers, migraciones, jobs, APIs, colectores ni despliegues.
- [x] la tarea genera cero cambios en requisitos de prueba y no requiere una copia del registro canónico.
- [x] `EVID-ARC-009` permanece reservada y no iniciada.

---

#### 13. Handoff cerrado hacia EVID-ARC-009

`EVID-ARC-009` recibe las 332 identidades documentales con auditoría de consulta, exposición y modificación materializada: actor o sistema atribuible, finalidad resoluble, documento y versión exactos, acción, decisión, resultado, correlación, minimización y corrección append-only. Su única responsabilidad siguiente será definir conservación legal y eliminación, incluidos hold y disposición, consumiendo este sobre auditable sin cambiar identidad, propiedad, sensibilidad, validación, acceso temporal ni historia aprobados aquí.

La aprobación de `EVID-ARC-008` no inicia, desarrolla ni aprueba `EVID-ARC-009`.


### ✅ EVID-ARC-009 — Definir conservación legal y eliminación

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-008 — Definir auditoría de consulta y modificación` — APROBADA
**Tarea siguiente:** `EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage` — RESERVADA
**Tipo de tarea:** documental; contrato transversal de conservación gobernada, legal hold, elegibilidad, disposición, eliminación/anonimización y evidencia de disposición
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos cubiertas:** 332 (`DOCCTX-*`)
**Perfil materializado:** `EVID_LEGAL_RETENTION_DISPOSITION_V1`
**Cambios físicos autorizados:** ninguno; no ejecuta borrados, anonimización, archivo físico, Storage, DDL, DML, RLS, jobs, migraciones, backfills, restauraciones ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar para las 332 identidades documentales el contrato que impide disponer o eliminar sin política de retención resoluble, verificación de hold y excepciones, manifiesto de alcance, aprobación según riesgo, ejecución idempotente, tratamiento de copias/derivados/terceros/backups y evidencia verificable del resultado. Ninguna fila recibe un plazo jurídico, fundamento legal o estado de hold inventado.

---

#### 1. Propósito y resultado sustantivo

Esta tarea cierra la frontera E4 entre conservar un documento y ejecutar su disposición. El resultado no es una tabla jurídica definitiva ni una eliminación física: es un contrato documental completo que hace **imposible interpretar vencimiento, anulación, sustitución, archivo, ausencia de uso o petición aislada como permiso de borrado**.

La decisión se materializa sobre las 332 identidades heredadas y conserva cinco invariantes:

1. `document_id + document_version` y el vínculo empresarial permanecen identificables hasta que la disposición autorizada alcance un resultado verificable.
2. `RET_UNRESOLVED` bloquea toda disposición automática; no se convierte en retención indefinida por defecto.
3. un hold activo prevalece sobre la elegibilidad de disposición y no amplía lectura, obtención de contenido, modificación ni finalidad.
4. eliminar o anonimizar es un resultado gobernado de una disposición; no un `DELETE`, borrado de objeto, limpieza de caché o cambio de estado aislado.
5. una disposición solo puede considerarse cerrada cuando deja evidencia suficiente sin conservar el contenido que debía desaparecer y cuando existe tratamiento explícito para copias gobernadas y restauraciones.

---

#### 2. Entradas y fronteras consumidas

Se consumen sin reinterpretación las decisiones aprobadas de `EVID-ARC-001` a `EVID-ARC-008`, especialmente:

- 332 identidades `DOCCTX-*` y 69 procesos canónicos;
- propietaria funcional, sensibilidad, metadatos y vínculo con recurso;
- `LOAD_V1`, `SUBSTITUTE_V1`, `ANNUL_V1` e historia no destructiva;
- clase de retención base por identidad;
- `RET_UNRESOLVED` para las 332 políticas definitivas, con propietaria `INFO-DOM-006`;
- validación de archivo previa a activación;
- acceso temporal y autorización previa;
- `EVID_AUDIT_TRAIL_V1` para consulta y modificación.

Esta tarea **no** cambia propiedad, sensibilidad, identidad, metadatos, política de acceso, resultados de validación, historia de versiones ni clases de retención. Tampoco decide la contingencia por indisponibilidad de Storage, reservada a `EVID-ARC-010`.

Las definiciones corporativas definitivas permanecen asignadas a tareas existentes:

| Decisión definitiva                                                                                                             | Tarea propietaria |
| ------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| tabla de retención, fundamento, trigger, mínimo, máximo, archivo, hold, anonimización, eliminación y certificado de disposición | `INFO-DOM-006`    |
| segregación de creación, revisión, aprobación, retención, legal hold, disposición y eliminación                                 | `INFO-AUTH-003`   |
| contingencia cuando Storage no está disponible                                                                                  | `EVID-ARC-010`    |

---

#### 3. Perfil canónico `EVID_LEGAL_RETENTION_DISPOSITION_V1`

Toda identidad usa el mismo perfil transversal. La clase de retención base orienta el contexto empresarial, pero **no selecciona por sí sola duración, trigger, método ni fundamento**.

| Código                             | Regla materializada                                                                                                                                                   |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RET_POLICY_REQUIRED`              | La disposición exige `retention_policy_id + retention_policy_version` resolubles y vigentes para la identidad/versión.                                                |
| `HOLD_CHECK_REQUIRED`              | Antes de declarar elegibilidad o ejecutar disposición se evalúan hold, preservación excepcional y excepciones aplicables.                                             |
| `DISPOSITION_ELIGIBILITY_REQUIRED` | La elegibilidad deriva del trigger verificable, mínimo/máximo, estado del recurso y obligaciones; nunca de `updated_at`, última consulta, anulación o ausencia en UI. |
| `DISPOSITION_MANIFEST_REQUIRED`    | Toda ejecución futura debe fijar un manifiesto de alcance con política/versión, trigger, recursos, copias/derivados/terceros, método, excepciones y responsables.     |
| `DISPOSITION_BY_POLICY_ONLY`       | Archivo, transferencia, anonimización o eliminación solo pueden ejecutarse mediante el método autorizado por la política y el manifiesto.                             |
| `DISPOSITION_IDEMPOTENT`           | Un reintento no duplica efectos ni permite que una falla parcial se presente como éxito.                                                                              |
| `DISPOSITION_EVIDENCE_REQUIRED`    | El cierre conserva certificado o evidencia mínima del resultado, sin conservar por esa vía el contenido dispuesto.                                                    |
| `NO_RESURRECTION_REQUIRED`         | Restauraciones, backups y copias gobernadas deben impedir que información ya dispuesta vuelva a quedar disponible para uso ordinario.                                 |

---

#### 4. Política de conservación y estado actual de resolución

Las clases heredadas permanecen exactamente:

| Clase                | Entradas | Interpretación comportamental                                                                   |
| -------------------- | -------: | ----------------------------------------------------------------------------------------------- |
| `RET_ACTIVE_CASE`    |       33 | expediente activo hasta cierre verificable del caso; no fija duración posterior                 |
| `RET_BUSINESS_CYCLE` |      184 | artefacto ligado a ciclo operativo, productivo, comercial, logístico, de activos o presupuestal |
| `RET_RELATIONSHIP`   |       36 | artefacto gobernado por una relación con trabajador, candidato, cliente o tercero               |
| `RET_OBLIGATION`     |       66 | artefacto laboral, SST, financiero, de acceso o autoridad con control reforzado                 |
| `RET_ARCHIVAL`       |       13 | artefacto de gobierno/política/registro con valor histórico sujeto a archivo gobernado          |
| **Total**            |  **332** | —                                                                                               |

Para las 332 identidades sigue vigente:

```text
retention_policy_resolution = RET_UNRESOLVED
owner = INFO-DOM-006
exit_condition = retention_policy_id + retention_policy_version
                 + retention_trigger + minimum_period + maximum_period
                 + archive_rule + hold_eligibility + disposition_method
                 + backup_treatment + copy_and_derivative_treatment
```

Consecuencia contractual actual:

- conservación gobernada = obligatoria;
- disposición automática = bloqueada;
- eliminación física o anonimización ejecutable = bloqueada;
- certificado de disposición real = imposible hasta una ejecución futura verificable;
- retención indefinida por inercia = no constituye política válida.

---

#### 5. Legal hold y preservación excepcional

`HOLD_ACTIVE` es una condición transversal de preservación y no una clase de retención base. Ninguna de las 332 identidades se marca como hold activo por inferencia; el estado solo podrá existir para instancias concretas con evidencia.

Un hold materializado deberá conservar al menos `hold_id`, tipo, alcance o manifiesto, motivo, autoridad, solicitante, aprobador, emisión/vigencia, revisión, condición de liberación, custodio, acciones de preservación y excepciones aplicables.

Reglas obligatorias:

1. `HOLD_ACTIVE` bloquea disposición aunque el recurso hubiera alcanzado elegibilidad ordinaria.
2. El hold no concede acceso, finalidad, obtención de contenido, edición o visibilidad adicional.
3. El alcance debe ser concreto y resoluble; no se utiliza un hold global indefinido por conveniencia.
4. Liberar o modificar un hold exige autoridad, motivo, timestamp, evidencia y nueva evaluación de elegibilidad.
5. La liberación de hold no ejecuta disposición automáticamente ni borra el historial del hold.
6. Las acciones de alta, revisión, cambio y liberación consumen el sobre auditable de `EVID-ARC-008`.

---

#### 6. Elegibilidad, disposición y eliminación

El flujo obligatorio queda materializado así:

```text
POLÍTICA RESOLUBLE
→ ELEGIBILIDAD CALCULADA
→ VERIFICACIÓN DE HOLD Y EXCEPCIONES
→ MANIFIESTO DE ALCANCE
→ APROBACIÓN SEGÚN RIESGO
→ EJECUCIÓN IDEMPOTENTE
→ VERIFICACIÓN DE COPIAS Y DERIVADOS
→ CERTIFICADO O EVIDENCIA
→ PROTECCIÓN CONTRA RESURRECCIÓN
```

Se adoptan los estados documentales de ciclo ya aprobados: `ACTIVE → INACTIVE → ARCHIVE_PENDING → ARCHIVED → ELIGIBLE_FOR_DISPOSITION → DISPOSITION_PENDING → DISPOSED | ANONYMIZED | TRANSFERRED`, con condiciones transversales `HOLD_ACTIVE`, `PRESERVATION_REQUIRED`, `DISPOSITION_BLOCKED`, `DISPOSITION_FAILED` y `POLICY_UNRESOLVED`.

Guardas de disposición:

- una política no resoluble produce `POLICY_UNRESOLVED`/`DISPOSITION_BLOCKED`;
- eliminación lógica no cierra disposición si el contenido continúa accesible;
- fallas parciales producen `DISPOSITION_FAILED`, nunca éxito silencioso;
- reintentos deben ser idempotentes;
- la evidencia mínima de disposición se conserva sin replicar el contenido eliminado;
- la integridad referencial debe recibir tratamiento aprobado antes de retirar un recurso;
- disposiciones masivas o de información `S3_RESTRICTED`/`S4_HIGHLY_RESTRICTED` requieren segregación reforzada;
- una versión sustituida, anulada o archivada no se elimina por ese solo hecho.

---

#### 7. Manifiesto y evidencia de disposición

Toda futura disposición deberá poder demostrar, como mínimo:

- política y versión aplicadas;
- trigger y fecha de elegibilidad;
- documento/versión y recursos afectados;
- copias, adjuntos, índices y derivados gobernados conocidos;
- terceros afectados;
- método de disposición;
- excepciones y fallas;
- ejecutor y aprobador;
- conteos o reconciliación antes/después cuando corresponda;
- correlación con la auditoría de solicitud, autorización, ejecución y resultado.

El certificado/evidencia no podrá afirmar una eliminación global si permanecen copias legítimas pendientes. Cuando aplique, el resultado distinguirá el alcance interno, terceros pendientes y verificación final. Ningún certificado real se materializa en esta tarea porque no se ejecutan disposiciones.

---

#### 8. Copias, terceros, backups y no resurrección

Una disposición del origen no se considera completa sin tratamiento explícito de copias gobernadas. Si una copia no puede retirarse de inmediato, deberá quedar inaccesible, expirar según política y no reutilizarse.

Para backups:

- su política es propia y su acceso es excepcional;
- no funcionan como archivo histórico ni consulta ordinaria;
- contenido ya dispuesto puede persistir cifrado hasta la expiración técnica aprobada del backup, sin volver a uso ordinario;
- una restauración debe reaplicar el ledger de disposiciones, holds, revocaciones y políticas posteriores al punto restaurado antes de abrir acceso;
- restaurar no revierte por sí mismo anonimización, eliminación o revocación ya aplicables.

La arquitectura de contingencia, recuperación e indisponibilidad física de Storage continúa reservada a sus tareas propietarias y no se implementa aquí.

---

#### 9. Matriz materializada por identidad documental

Códigos de bloqueo y frontera:

| Código                 | Significado                                                                                                                                                                                             |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RET_POLICY_PENDING`   | Falta política definitiva resoluble. Propietaria: `INFO-DOM-006`. Sale cuando existen política/versión, trigger, mínimo, máximo, archivo, hold, método de disposición y tratamientos de copias/backups. |
| `FRONTERA_OBLIGATORIA` | Se conserva la frontera heredada de propiedad/recurso; una disposición no absorbe autoridad de otro dominio.                                                                                            |
| `APLICACION_DIFERIDA`  | La definición documental es válida, pero no acredita disponibilidad de la aplicación propietaria objetivo.                                                                                              |
| `NINGUNO`              | No existe una frontera heredada adicional; `RET_POLICY_PENDING` sigue bloqueando la disposición.                                                                                                        |

| ID contextual          | Proceso      | Retención base       | Política         | Hold                  | Elegibilidad                       | Disposición                  | Evidencia                       | Restauración               | Estado         | Bloqueo / frontera                        |
| ---------------------- | ------------ | -------------------- | ---------------- | --------------------- | ---------------------------------- | ---------------------------- | ------------------------------- | -------------------------- | -------------- | ----------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING`                      |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_ELIGIBILITY_REQUIRED` | `DISPOSITION_BY_POLICY_ONLY` | `DISPOSITION_EVIDENCE_REQUIRED` | `NO_RESURRECTION_REQUIRED` | `ESPECIFICADO` | `RET_POLICY_PENDING+FRONTERA_OBLIGATORIA` |

---

#### 10. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea instancia sobre las 332 identidades documentales reglas de retención, hold, elegibilidad, disposición, fallas parciales, copias, backups y no resurrección ya aprobadas por `NFR-REQ-006` y la línea base de `EVID-ARC-005`. No introduce un nuevo plazo, fundamento, autorización, transformación, transición, excepción ni comportamiento verificable adicional; por ello crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0. El registro canónico de requisitos permanece sin cambios.

---

#### 11. Reconciliación cuantitativa

| Control                                         | Resultado |
| ----------------------------------------------- | --------: |
| Procesos esperados                              |        69 |
| Procesos materializados                         |        69 |
| Entradas `DOCCTX-*` esperadas                   |       332 |
| Entradas materializadas                         |       332 |
| Claves `DOCCTX-*` únicas                        |       332 |
| Entradas con `RET_UNRESOLVED`                   |       332 |
| Entradas con `HOLD_CHECK_REQUIRED`              |       332 |
| Entradas con `DISPOSITION_ELIGIBILITY_REQUIRED` |       332 |
| Entradas con `DISPOSITION_BY_POLICY_ONLY`       |       332 |
| Entradas con `DISPOSITION_EVIDENCE_REQUIRED`    |       332 |
| Entradas con `NO_RESURRECTION_REQUIRED`         |       332 |
| Faltantes                                       |         0 |
| Duplicados                                      |         0 |

Fronteras heredadas:

| Frontera               | Entradas |
| ---------------------- | -------: |
| `NINGUNO`              |       73 |
| `FRONTERA_OBLIGATORIA` |      245 |
| `APLICACION_DIFERIDA`  |       14 |
| **Total**              |  **332** |

Clases de retención heredadas:

| Clase                | Entradas |
| -------------------- | -------: |
| `RET_ACTIVE_CASE`    |       33 |
| `RET_BUSINESS_CYCLE` |      184 |
| `RET_RELATIONSHIP`   |       36 |
| `RET_OBLIGATION`     |       66 |
| `RET_ARCHIVAL`       |       13 |
| **Total**            |  **332** |

No se modifica ninguna propietaria funcional ni clasificación de sensibilidad heredada.

---

#### 12. Criterios de aceptación

- [x] `EVID-ARC-008` figura aprobada y entrega 332 identidades para 69 procesos.
- [x] las 332 identidades aparecen exactamente una vez.
- [x] las cinco clases de retención conservan exactamente la distribución heredada 33/184/36/66/13.
- [x] las 332 identidades permanecen `RET_UNRESOLVED` hasta `INFO-DOM-006`; no se inventan plazos, fundamentos, triggers definitivos ni métodos jurídicos específicos.
- [x] las 332 identidades requieren verificación de hold antes de disposición.
- [x] hold activo bloquea disposición y no amplía autorización o acceso.
- [x] liberar hold recalcula elegibilidad y no ejecuta borrado automático.
- [x] toda disposición exige elegibilidad, manifiesto, aprobación según riesgo, ejecución idempotente y evidencia de resultado.
- [x] eliminación lógica, sustitución, anulación, archivo o ausencia en UI no se consideran disposición final por sí solos.
- [x] fallas parciales permanecen como fallo; no se certifica éxito silencioso.
- [x] copias, derivados, terceros y backups reciben tratamiento explícito y se protege contra resurrección.
- [x] las fronteras 73/245/14 permanecen reconciliadas.
- [x] no se ejecuta ningún cambio físico, borrado, anonimización, migración, job o cambio en Supabase/Storage.
- [x] la tarea genera cero cambios en requisitos de prueba y no requiere una copia del registro canónico.
- [x] `EVID-ARC-010` permanece reservada y no iniciada.

---

#### 13. Handoff cerrado hacia EVID-ARC-010

`EVID-ARC-010` recibe las 332 identidades documentales con conservación gobernada y disposición fail-closed materializadas: clase de retención heredada, política jurídica no resuelta con propietaria exacta, evaluación de hold, elegibilidad, manifiesto, ejecución idempotente, evidencia de disposición y protección contra resurrección. Su única responsabilidad siguiente será definir la contingencia ante indisponibilidad de Storage sin cambiar identidad, propiedad, sensibilidad, validación, acceso temporal, auditoría, retención, hold ni disposición aprobados aquí.

La aprobación de `EVID-ARC-009` no inicia, desarrolla ni aprueba `EVID-ARC-010`.


### ✅ EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-009 — Definir conservación legal y eliminación` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-001 — Inventariar notificaciones actuales y canales` — RESERVADA
**Tipo de tarea:** documental; contrato transversal de contingencia documental y evidencial ante disponibilidad parcial o indisponibilidad de Storage
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Entradas documentales/artefactos cubiertas:** 332 (`DOCCTX-*`)
**Perfil de contingencia materializado:** `EVID_STORAGE_CONTINGENCY_V1`
**Cambios físicos autorizados:** ninguno; no crea buckets, objetos, políticas RLS, migraciones, Edge Functions, jobs, backups, failover, rutas alternativas, despliegues ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar sobre las 332 identidades documentales un contrato único para detectar indisponibilidad o degradación de Storage, fallar de forma segura cuando el objeto exacto no pueda resolverse, conservar intenciones pendientes solo donde el contrato offline lo permite, recuperar con reintentos idempotentes y reconciliar antes de reabrir el servicio ordinario, sin convertir archivos locales, cachés o almacenes alternos en fuente de verdad y sin eludir autorización, validación, auditoría, retención, hold o disposición.

---

#### 1. Propósito y resultado sustantivo

Esta tarea cierra la arquitectura documental de evidencia de E4 para el escenario en que Storage esté parcialmente disponible, degradado, indisponible o en recuperación. El resultado no es un runbook de infraestructura ni una selección de proveedor: es el comportamiento canónico que deben respetar las 332 identidades mientras el objeto físico no pueda consultarse, persistirse, verificarse o disponerse con certeza.

El contrato fija cinco invariantes:

1. **Storage se diagnostica como dependencia separada.** La disponibilidad de Auth, base de datos, red, funciones u otros componentes no permite inferir que Storage esté disponible.
2. **La indisponibilidad no crea otra fuente de verdad.** Un archivo local, caché, correo, Drive, dispositivo, carpeta temporal, bucket alterno o copia manual no adquiere autoridad empresarial por contingencia.
3. **Lo pendiente no se presenta como confirmado.** Captura local, transferencia iniciada, reintento, acuse técnico o metadata persistida no equivalen a objeto disponible, validado, vinculado, publicado, eliminado ni reconciliado.
4. **La recuperación no se declara por respuesta técnica aislada.** Antes de reanudar operación ordinaria se reconcilian objeto, versión, metadatos, autorización, integridad, validación, auditoría, hold y disposición aplicables.
5. **El fallo permanece cerrado.** Ambigüedad, ausencia de objeto, duplicidad, versión incierta, respuesta desconocida o restauración incompleta bloquean el efecto sensible hasta reconciliación verificable.

---

#### 2. Fuentes canónicas y handoff consumidos

- `EVID-ARC-001` a `EVID-ARC-009`: inventario, propiedad, sensibilidad, metadatos, versiones, validación, acceso temporal, auditoría y disposición de las 332 identidades.
- `EVID-ARC-009`: entrega política versionada o `RET_UNRESOLVED`, hold prevalente, elegibilidad explícita, manifiesto de disposición, ejecución idempotente, evidencia mínima y protección contra resurrección.
- `NFR-REQ-004`: clases offline, captura local controlada, idempotencia, estados pendientes, conflictos y reconciliación.
- `NFR-REQ-005`: minimización y protección de persistencia local según sensibilidad.
- `NFR-REQ-006`: trazabilidad, retención, hold, disposición, copias, derivados, backups y no resurrección.
- `NFR-REQ-009`: observabilidad diferenciada de dependencias, incluido Storage, y cierre de incidentes solo tras recuperación verificada.
- `NFR-REQ-010`: recuperación coherente de archivos, referencias, metadatos, permisos, retención, hold y backlog.

El handoff recibido de `EVID-ARC-009` no autoriza cambiar identidad documental, propietaria, sensibilidad, clase de retención, política de acceso, controles de validación, historial ni decisión de disposición.

---

#### 3. Alcance y propietarios reservados

`EVID-ARC-010` define exclusivamente el contrato documental de contingencia. Las responsabilidades siguientes conservan propietario exacto:

| Responsabilidad reservada                                                                 | Tarea propietaria                                       |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| arquitectura de Storage                                                                   | `SUPA-ARC-018`                                          |
| retención, archivado, respaldo y recuperación dentro de la arquitectura Supabase          | `SUPA-ARC-022`                                          |
| mapa de dependencias, recursos críticos, single points of failure y sustitutos            | `CONT-DOM-003`                                          |
| MTPD, RTO, RPO, MBCO, prioridades y criterios de aceptación de riesgo                     | `CONT-DOM-004`                                          |
| taxonomía, severidad, declaración, activación, escalamiento, desactivación y cierre       | `CONT-DOM-005`                                          |
| mando, sustitución, bitácora de decisiones, comunicación de crisis y coordinación externa | `CONT-DOM-006`                                          |
| operación mínima viable por proceso, sede, horario, temporada y duración                  | `CONT-DOM-007`                                          |
| estrategias de contingencia y alternativas manuales, offline, físicas y de proveedor      | `CONT-DOM-008`                                          |
| registro, folios, evidencia, custodia y trabajo ejecutado durante la falla                | `CONT-DOM-009`                                          |
| reincorporación, idempotencia, conflictos, conciliación y confirmación de pendientes      | `CONT-DOM-010`                                          |
| inventario, política, frecuencia, retención, seguridad y cobertura de respaldos           | `CONT-DOM-011`                                          |
| runbooks, orden de recuperación, restauración, failover, retorno y validación funcional   | `CONT-DOM-012`                                          |
| continuidad de proveedores, energía, red, pagos, transporte, canales y recursos alternos  | `CONT-DOM-013`                                          |
| walkthroughs, tabletops, simulaciones, restauraciones y ejercicios operativos             | `CONT-DOM-014`                                          |
| revisión posterior, lecciones, acciones, eficacia y actualización periódica del plan      | `CONT-DOM-015`                                          |
| tablas y fundamentos definitivos de retención, hold y disposición                         | `INFO-DOM-006`                                          |
| autenticidad, integridad, procedencia, preservación y cadena de custodia                  | `INFO-DOM-007`                                          |
| habilitación de implementación física del carril                                          | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` |

Esta tarea no fija RTO/RPO, topología de failover, proveedor de almacenamiento, sincronizador, mecanismo de backup, intervalos de sondeo ni credenciales de emergencia.

---

#### 4. Perfil canónico `EVID_STORAGE_CONTINGENCY_V1`

Toda identidad `DOCCTX-*` recibe el mismo perfil base. La clasificación, propietaria, frontera y políticas heredadas pueden endurecerlo, pero nunca reducirlo.

| Código                         | Regla materializada                                                                                                                                                                                                                                       |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `STORAGE_DEPENDENCY_EXPLICIT`  | La salud de Storage se resuelve separadamente de otras dependencias; un componente sano no enmascara la falla del objeto físico.                                                                                                                          |
| `FAIL_CLOSED_OBJECT_ACCESS`    | Si el objeto y versión exactos no pueden resolverse y servirse bajo autorización vigente, el contenido no se expone.                                                                                                                                      |
| `PENDING_IDEMPOTENT_RETRY`     | Una carga, sustitución o efecto pendiente conserva identidad e idempotencia y no se reintenta a ciegas. El código no habilita persistencia offline por sí solo: aplica únicamente cuando `NFR-REQ-004` y la sensibilidad permiten conservar la intención. |
| `NO_ALTERNATE_SOURCE_OF_TRUTH` | Capturas o copias de contingencia permanecen no autoritativas hasta reconciliación contra el registro empresarial y el objeto gobernado.                                                                                                                  |
| `NO_FALSE_DISPOSITION`         | Ausencia o falla de Storage nunca convierte una eliminación pendiente en disposición completada ni permite emitir evidencia final falsa.                                                                                                                  |
| `RECONCILE_BEFORE_RESUME`      | Recuperar respuesta técnica no basta; las dependencias documentales se reconcilian antes de reabrir efectos ordinarios.                                                                                                                                   |
| `AUDIT_CONTINGENCY`            | Detección, cambio de modo, bloqueo, reintento, recuperación y decisión de reconciliación producen hechos auditables sin copiar contenido protegido.                                                                                                       |

---

#### 5. Estados de contingencia

```text
STORAGE_NORMAL
    -> STORAGE_DEGRADED | STORAGE_UNAVAILABLE
    -> STORAGE_RECOVERY_RECONCILIATION
    -> STORAGE_NORMAL
```

Cuando persista cualquier incertidumbre:

```text
STORAGE_RECOVERY_RECONCILIATION
    -> STORAGE_RECOVERY_BLOCKED
    -> STORAGE_DEGRADED | STORAGE_UNAVAILABLE
```

| Estado                            | Semántica                                                                                                                                                  |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `STORAGE_NORMAL`                  | La dependencia está disponible y el objeto puede someterse a los controles ordinarios. No implica que un documento concreto sea válido o accesible.        |
| `STORAGE_DEGRADED`                | Storage responde parcialmente o con capacidad insuficiente; solo continúan capacidades que no dependan de la función degradada y cuyo contrato lo permita. |
| `STORAGE_UNAVAILABLE`             | El objeto no puede consultarse o persistirse con certeza; las operaciones dependientes quedan bloqueadas o pendientes conforme al contrato offline.        |
| `STORAGE_RECOVERY_RECONCILIATION` | La dependencia vuelve a responder, pero aún se verifican objetos, versiones, pendientes y efectos antes de normalizar.                                     |
| `STORAGE_RECOVERY_BLOCKED`        | Existe ausencia, duplicidad, versión incierta, conflicto, hold, disposición, validación incompleta u otra divergencia que impide cerrar recuperación.      |

El estado se refiere a la capacidad de Storage, no sustituye los estados empresariales o documentales de cada identidad.

---

#### 6. Comportamiento por operación

##### 6.1. Consulta y exposición

1. Una lectura que requiere el objeto exacto falla cerrada cuando Storage no permite resolverlo.
2. No se emite una nueva capacidad temporal de acceso si el servidor no puede resolver documento, versión, objeto, autorización y estado aplicables.
3. Una URL previamente emitida no se transforma en fuente de verdad ni en permiso persistente por la indisponibilidad.
4. Metadatos o proyecciones que permanezcan disponibles conservan su autorización propia; la falla del objeto no amplía campos, finalidad ni audiencia.
5. La interfaz o consumidor debe distinguir `contenido no disponible` de `contenido inexistente` o `sin permiso` sin filtrar información protegida.

##### 6.2. Carga y sustitución

1. La captura local solo puede existir cuando `NFR-REQ-004` y la sensibilidad permiten ese modo.
2. El contenido local no se marca `AVAILABLE`, `PUBLISHED`, validado, vigente ni enlazado de forma final antes de persistencia y verificación remotas.
3. El pendiente conserva al menos identidad documental, versión pretendida, `DOCCTX-*`, proceso/recurso, actor o sistema, contexto, correlación, clave de idempotencia, timestamps, expiración y referencias de política aplicables; el fingerprint se conserva cuando ya fue calculado de forma confiable.
4. Una respuesta perdida queda con resultado desconocido hasta consultar evidencia idempotente, recibo o estado autoritativo; no se crea una segunda intención para forzar progreso.
5. Un reintento vencido, no autorizado o incompatible con la versión actual se bloquea y se reconcilia; no se ejecuta por precedencia temporal.

##### 6.3. Validación de archivo

1. La indisponibilidad no permite saltar tipo, tamaño, integridad o malware.
2. Una validación que depende del objeto físico permanece pendiente mientras no pueda leer el objeto exacto.
3. Un hash o metadato local aislado no demuestra que el objeto remoto corresponda a la misma versión.
4. Al recuperar Storage se vuelve a comprobar el objeto materializado contra reserva, metadata, fingerprint y vínculo antes de disponibilidad ordinaria.

##### 6.4. Anulación, retención, hold y disposición

1. Anular un documento sigue siendo un hecho empresarial distinto de borrar el objeto.
2. `HOLD_ACTIVE` prevalece aunque Storage esté degradado o indisponible; la contingencia nunca libera un hold ni amplía acceso.
3. `RET_UNRESOLVED` continúa bloqueando disposición automática.
4. Si una disposición ya elegible no puede ejecutar el tratamiento físico por indisponibilidad, queda `DISPOSITION_BLOCKED_STORAGE`; no se marca completa y no se emite certificado final.
5. `DISPOSITION_FAILED` se usa solo cuando hubo un intento de ejecución y este falló; la mera indisponibilidad previa no inventa un intento.
6. Al recuperar o restaurar Storage se reaplican holds, disposiciones, tombstones y decisiones posteriores al punto restaurado antes de abrir acceso, evitando resurrección.

---

#### 7. Sobre mínimo de una intención pendiente

Cuando el contrato offline permita conservar una intención de carga o sustitución, el sobre mínimo es:

```text
pending_intent_id
idempotency_key
document_id
document_version
document_context_id
process_id
process_instance_id
resource_ref
actor_or_system_ref
principal_ref
context_ref
device_ref
requested_action
requested_at
expires_at
policy_refs[]
classification
local_payload_state
remote_object_state
validation_state
correlation_id
causation_id
fingerprint_algorithm_id?
content_fingerprint?
last_attempt_at?
last_result
reason_code?
```

Reglas del sobre:

- no contiene una autorización perpetua; la autoridad se revalida al ejecutar;
- no presupone que `document_version` ya quedó materializada en Storage;
- no permite reutilizar `idempotency_key` para otra intención;
- no transforma `local_payload_state` en estado empresarial;
- debe poder expirar o quedar bloqueado sin eliminar silenciosamente el payload cuando exista obligación de custodia o reconciliación;
- para `S3_RESTRICTED` y `S4_HIGHLY_RESTRICTED`, la persistencia local sigue las restricciones de `NFR-REQ-005`; la contingencia no crea excepción.

---

#### 8. Gate de recuperación y reconciliación

Antes de volver de `STORAGE_RECOVERY_RECONCILIATION` a `STORAGE_NORMAL` para una capacidad documental afectada, se ejecuta lógicamente el siguiente gate:

```text
STORAGE_HEALTH_RECHECK
-> SESSION_ACTOR_CONTEXT_RECHECK
-> AUTHORIZATION_AND_POLICY_RECHECK
-> PENDING_INTENT_AND_RECEIPT_RECONCILIATION
-> OBJECT_EXISTENCE_AND_EXACT_VERSION_RECHECK
-> METADATA_AND_RESOURCE_LINK_RECHECK
-> FINGERPRINT_INTEGRITY_RECHECK
-> FILE_VALIDATION_STATUS_RECHECK
-> HOLD_AND_DISPOSITION_RECHECK
-> AUDIT_CORRELATION_RECHECK
-> CAPABILITY_RESUME
```

Resultados:

| Resultado                   | Efecto                                                                                                                |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `RECONCILED`                | La identidad puede volver al flujo ordinario si los demás controles permiten la acción.                               |
| `RECONCILIATION_REQUIRED`   | Falta evidencia suficiente o existe divergencia; la identidad permanece bloqueada para el efecto afectado.            |
| `DUPLICATE_DETECTED`        | Se conserva evidencia de ambas materializaciones y se resuelve por identidad/idempotencia; no se usa last-write-wins. |
| `OBJECT_MISSING`            | La referencia no se trata como recuperada; se activa investigación/reconciliación según propietario.                  |
| `ORPHAN_OBJECT`             | El objeto no se adopta automáticamente como registro empresarial; requiere reconciliación.                            |
| `VERSION_CONFLICT`          | No se sobrescribe ninguna versión para ocultar el conflicto.                                                          |
| `AUTHORIZATION_EXPIRED`     | El pendiente no se ejecuta; requiere nueva autoridad conforme al flujo ordinario.                                     |
| `HOLD_OR_DISPOSITION_BLOCK` | Se preserva el estado más restrictivo y no se reabre acceso o eliminación incompatible.                               |

La reconciliación nunca repara silenciosamente historia, hash, propietario, sensibilidad, hold, disposición o versión.

---

#### 9. Auditoría, seguridad y observabilidad

`EVID_AUDIT_TRAIL_V1` continúa aplicando durante la contingencia. Deben ser auditables, cuando ocurran:

- detección o cambio de estado de Storage;
- entrada y salida de modo degradado;
- intento de lectura bloqueado por indisponibilidad;
- creación, expiración, reintento o rechazo de una intención pendiente;
- resultado desconocido y su resolución;
- inicio de recuperación y reconciliación;
- detección de objeto faltante, huérfano, duplicado o conflicto de versión;
- bloqueo por hold, disposición o autorización;
- decisión de reanudar o mantener bloqueada una capacidad.

La auditoría conserva actor o sistema, finalidad, acción, documento/versión, proceso/recurso, decisión, resultado, motivo y correlación aplicables, pero no copia el archivo ni secretos dentro del evento de auditoría.

La observabilidad de Storage debe permanecer separada de la disponibilidad de las demás dependencias. Recuperar parcialmente Storage no habilita una capacidad que también dependa de otro componente todavía no disponible.

---

#### 10. Matriz materializada de contingencia para las 332 identidades

Códigos aplicados:

| Código                        | Significado                                                                                         |
| ----------------------------- | --------------------------------------------------------------------------------------------------- |
| `EVID_STORAGE_CONTINGENCY_V1` | Perfil completo de esta tarea.                                                                      |
| `FAIL_CLOSED_OBJECT_ACCESS`   | El objeto exacto no se expone cuando Storage no puede servirlo con certeza.                         |
| `PENDING_IDEMPOTENT_RETRY`    | La escritura pendiente conserva identidad e idempotencia y exige revalidación.                      |
| `NO_FALSE_DISPOSITION`        | Una falla de Storage no puede producir disposición o certificado falsamente exitosos.               |
| `RECONCILE_BEFORE_RESUME`     | La identidad se reconcilia antes de reabrir el efecto afectado.                                     |
| `AUDIT_CONTINGENCY`           | Los hechos de contingencia y reconciliación quedan auditables.                                      |
| `RET_UNRESOLVED`              | La política definitiva sigue sin plazo jurídico inventado; su propietario permanece `INFO-DOM-006`. |
| `NINGUNO`                     | No existe frontera heredada adicional para la identidad.                                            |
| `FRONTERA_OBLIGATORIA`        | La referencia cruzada no absorbe autoridad ni propiedad ajena.                                      |
| `APLICACION_DIFERIDA`         | La definición documental es válida, pero no acredita disponibilidad de la aplicación propietaria.   |

| ID contextual          | Proceso      | Perfil                        | Retención base       | Política         | Lectura objeto              | Carga/sustitución          | Disposición            | Recuperación              | Auditoría           | Estado         | Bloqueo / frontera heredada |
| ---------------------- | ------------ | ----------------------------- | -------------------- | ---------------- | --------------------------- | -------------------------- | ---------------------- | ------------------------- | ------------------- | -------------- | --------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `APLICACION_DIFERIDA`       |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `NINGUNO`                   |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `EVID_STORAGE_CONTINGENCY_V1` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `FAIL_CLOSED_OBJECT_ACCESS` | `PENDING_IDEMPOTENT_RETRY` | `NO_FALSE_DISPOSITION` | `RECONCILE_BEFORE_RESUME` | `AUDIT_CONTINGENCY` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA`      |

---

#### 11. Reconciliación cuantitativa

Cobertura de identidades:

| Control                                       | Resultado |
| --------------------------------------------- | --------: |
| Procesos esperados                            |        69 |
| Procesos materializados                       |        69 |
| Identidades `DOCCTX-*` esperadas              |       332 |
| Identidades materializadas                    |       332 |
| Identificadores `DOCCTX-*` únicos             |       332 |
| Identidades con `EVID_STORAGE_CONTINGENCY_V1` |       332 |
| Identidades con `FAIL_CLOSED_OBJECT_ACCESS`   |       332 |
| Identidades con `PENDING_IDEMPOTENT_RETRY`    |       332 |
| Identidades con `NO_FALSE_DISPOSITION`        |       332 |
| Identidades con `RECONCILE_BEFORE_RESUME`     |       332 |
| Identidades con `AUDIT_CONTINGENCY`           |       332 |
| Identidades con `RET_UNRESOLVED` preservado   |       332 |
| Faltantes                                     |         0 |
| Duplicados                                    |         0 |

Clases de retención heredadas preservadas:

| Clase                | Entradas |
| -------------------- | -------: |
| `RET_ACTIVE_CASE`    |       33 |
| `RET_BUSINESS_CYCLE` |      184 |
| `RET_RELATIONSHIP`   |       36 |
| `RET_OBLIGATION`     |       66 |
| `RET_ARCHIVAL`       |       13 |
| **Total**            |  **332** |

Fronteras heredadas preservadas:

| Frontera               | Entradas |
| ---------------------- | -------: |
| `NINGUNO`              |       73 |
| `FRONTERA_OBLIGATORIA` |      245 |
| `APLICACION_DIFERIDA`  |       14 |
| **Total**              |  **332** |

No se modifica ninguna propietaria funcional, sensibilidad, identidad, versión, clase de retención, frontera, regla de validación, acceso temporal, historia de auditoría, hold ni disposición aprobados en tareas anteriores.

---

#### 12. Cobertura verificable heredada

`EVID_STORAGE_CONTINGENCY_V1` no crea una capa nueva de reglas. Especializa para las 332 identidades obligaciones ya aprobadas en sus contratos propietarios:

- `NFR-REQ-004`: operación degradada/offline, estados pendientes, idempotencia, revalidación y reconciliación segura;
- `NFR-REQ-005`: sensibilidad, minimización y restricciones sobre persistencia o exposición local;
- `NFR-REQ-006`: trazabilidad, retención, hold, disposición, historia no destructiva y protección contra resurrección;
- `NFR-REQ-009`: observabilidad por dependencia, backlog, alertas y cierre sustentado por recuperación verificable;
- `NFR-REQ-010`: respaldo, recuperación coherente y validación de restauración;
- `EVID-ARC-005` a `EVID-ARC-009`: ciclo documental, validación, acceso temporal, auditoría, conservación legal y eliminación que la contingencia debe preservar.

Esta tarea no reproduce ni infiere identificadores `TREQ-*`; la sección de requisitos derivados determina únicamente si `EVID-ARC-010` crea o modifica comportamiento verificable respecto de esos contratos.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el perfil materializa sobre las 332 identidades documentales comportamientos de disponibilidad parcial, captura pendiente condicionada, idempotencia, fallo cerrado, observabilidad, retención, hold, disposición, recuperación y reconciliación ya definidos por `NFR-REQ-004`, `NFR-REQ-005`, `NFR-REQ-006`, `NFR-REQ-009`, `NFR-REQ-010` y `EVID-ARC-005` a `EVID-ARC-009`. No introduce una conducta ejecutable nueva ni modifica una existente; por ello genera 0 requisitos nuevos y modifica 0.

---

#### 13. Criterios de aceptación

- [x] `EVID-ARC-009` figura aprobada y entrega 332 identidades `DOCCTX-*` para 69 procesos.
- [x] las 332 identidades aparecen exactamente una vez en la matriz y conservan sus identificadores estables.
- [x] las 332 identidades reciben `EVID_STORAGE_CONTINGENCY_V1`, lectura cerrada, regla de pendiente idempotente condicionada por elegibilidad offline, disposición sin falso éxito, reconciliación antes de reanudar y auditoría de contingencia.
- [x] Storage se diagnostica como dependencia separada y una recuperación parcial no habilita capacidades que dependan de componentes aún indisponibles.
- [x] ningún archivo local, caché, correo, Drive, bucket alterno o copia manual se convierte en fuente de verdad por contingencia.
- [x] una captura o carga pendiente nunca se presenta como objeto disponible, validado, publicado o confirmado antes de reconciliación.
- [x] una respuesta desconocida no se resuelve mediante reintento ciego ni creando una segunda intención.
- [x] tipo, tamaño, integridad y malware no se omiten durante degradación o recuperación.
- [x] una indisponibilidad de Storage no produce eliminación, disposición o certificado falsamente exitosos.
- [x] `HOLD_ACTIVE` y `RET_UNRESOLVED` conservan sus bloqueos y no son debilitados por la contingencia.
- [x] una restauración o retorno técnico reaplica holds, disposiciones, revocaciones y protección contra resurrección antes de abrir acceso.
- [x] objetos faltantes, huérfanos, duplicados o con conflicto de versión quedan sujetos a reconciliación explícita y no a reparación silenciosa.
- [x] las distribuciones heredadas de retención y fronteras suman exactamente 332 y permanecen sin cambios.
- [x] no se inventan RTO/RPO, proveedor, topología de failover, mecanismo de backup, runbook, bucket alterno ni resultados operativos.
- [x] no se crean buckets, objetos, tablas, políticas RLS, funciones, migraciones, jobs, backups, despliegues ni cambios en Supabase.
- [x] la tarea genera cero cambios en requisitos de prueba y no requiere una copia del registro canónico.
- [x] `NOTIFY-ARC-001` permanece reservada y no iniciada.

---

#### 14. Handoff cerrado hacia NOTIFY-ARC-001

`EVID-ARC-010` cierra la serie EVID con 332 identidades documentales cubiertas por contingencia de Storage: dependencia explícita, fallo cerrado de lectura, escritura pendiente idempotente, ausencia de fuente alternativa autoritativa, disposición sin falso éxito, reconciliación antes de reanudar, auditoría y protección contra resurrección.

`NOTIFY-ARC-001` recibe la continuidad del carril exclusivamente para inventariar las notificaciones actuales y sus canales conforme a su alcance canónico. No recibe autorización para alterar los contratos EVID. Los eventos empresariales originadores, destinatarios, prioridad, preferencias, confirmación, reintentos, privacidad y métricas de entrega permanecen reservados para `NOTIFY-ARC-002` a `NOTIFY-ARC-010`.

La aprobación de `EVID-ARC-010` no inicia, desarrolla ni aprueba `NOTIFY-ARC-001`.


Los pilotos operativos reales no se ejecutan durante E4.

E4 define contratos, arquitectura y criterios. La implementación, readiness,
cutover, piloto e hypercare se planifican en E5 y se ejecutan después de
implementar el paquete aprobado.
