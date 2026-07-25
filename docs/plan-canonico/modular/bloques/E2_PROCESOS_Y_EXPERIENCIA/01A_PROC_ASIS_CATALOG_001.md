# PROC-ASIS-CATALOG-001 — Catálogo consolidado de procesos AS-IS

**Estado del artefacto:** `PROPUESTA PARA APROBACIÓN`  
**Tarea propietaria:** `PROC-CAT-001`  
**Bloque:** BLOQUE E2 — Arquitectura funcional, procesos y experiencia transversal  
**Versión:** `2026-07-25.1`  
**Naturaleza:** índice consolidado de candidatos AS-IS  
**Identificadores:** provisionales  
**Total de candidatos:** **62**

## Reglas de lectura

1. Cada fila representa una agrupación provisional de trabajo observado.
2. Una fila puede dividirse o fusionarse durante las tareas posteriores.
3. Las claves `ASIS-SRC-*` no se utilizarán en código, tablas, permisos, rutas o integraciones.
4. La matriz describe AS-IS; no autoriza digitalizar prácticas defectuosas.
5. Las brechas exactas se reconciliarán con el registro canónico antes de aprobar `PROC-CAT-001`.
6. Los campos de actores, entradas, salidas, estados, transiciones, eventos, auditoría y métricas se completarán en sus tareas propietarias.


## Gobierno y estructura

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-001` | Tomar y comunicar decisiones empresariales | CAP-01.01; CAP-01.02; CAP-01.10 | Dirección corporativa; empresas y marcas | Reuniones; mensajes; documentos | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-GOV-001; decisiones y seguimiento dispersos |
| `ASIS-SRC-002` | Gestionar empresas, marcas, establecimientos, sedes y áreas | CAP-01.03; CAP-01.04 | Vento Group; marcas; sedes | Documentos registrales; conocimiento administrativo; sistemas parciales | `HIBRIDO` | `FRAGMENTADO` | OPS-AUD-001; OPS-ADM-001; titularidad, marca y operación no siempre coinciden |
| `ASIS-SRC-003` | Definir responsabilidades, políticas y límites de decisión | CAP-01.05; CAP-01.06 | Transversal | Documentos; matrices; decisiones de dirección | `MANUAL_CONTROLADO` | `PARCIAL` | OPS-AUD-002; responsabilidades implícitas, temporales o vacantes |
| `ASIS-SRC-004` | Coordinar operación entre negocios y sedes | CAP-01.08 | Todas las sedes y marcas | Reuniones; llamadas; WhatsApp; archivos | `MANUAL_DISTRIBUIDO` | `INFORMAL` | OPS-AUD-003; dependencia de conocimiento personal |

## Personas y trabajo

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-005` | Planear necesidad, reclutar y seleccionar personal | CAP-02.01; CAP-02.02 | Todas las operaciones | Hojas de vida; entrevistas; pruebas; mensajes | `MANUAL_CONTROLADO` | `OPERATIVO_CON_VARIANTES` | OPS-AUD-005; criterios no uniformes |
| `ASIS-SRC-006` | Vincular e incorporar trabajadores | CAP-02.03; CAP-02.04; CAP-02.09; CAP-02.11 | Todas las operaciones | Documentos; gestión administrativa; terceros | `HIBRIDO` | `PARCIAL` | OPS-AUD-005; alta documental y tecnológica separadas |
| `ASIS-SRC-007` | Asignar sede, área, función y programación | CAP-02.05; CAP-02.06 | Sedes y áreas | VISO; mensajes; coordinación de gerencia | `DIGITAL_PARCIAL` | `OPERATIVO_CON_VARIANTES` | OPS-AUD-002; variaciones por sede y reemplazos |
| `ASIS-SRC-008` | Registrar asistencia y tiempo trabajado | CAP-02.07 | Trabajadores y sedes | ANIMA; revisión en VISO | `DIGITAL_INTERNO` | `OPERATIVO_ESTABLE` | CAP-MAP-006; correcciones y excepciones pendientes |
| `ASIS-SRC-009` | Gestionar novedades, ausencias y reemplazos | CAP-02.08 | Todas las sedes | Mensajes; coordinación verbal; registros parciales | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-AUD-002; flujo de corrección no uniforme |
| `ASIS-SRC-010` | Preparar pagos y beneficios laborales | CAP-02.12 | Administración; trabajadores | Archivos; revisión; plataforma bancaria | `HIBRIDO` | `PARCIAL` | OPS-PLAN-001; fuentes y aprobaciones distribuidas |
| `ASIS-SRC-011` | Retirar trabajador y cerrar accesos | CAP-02.13; CAP-15 | Aplicaciones y sedes | Comunicación informal; ejecución manual; sistemas separados | `MANUAL_DISTRIBUIDO` | `PARCIAL` | CAP-SCOPE-015; cierre integral no confirmado |

## Seguridad, higiene y cumplimiento

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-012` | Identificar riesgos, inspeccionar y ejecutar acciones preventivas | CAP-03.01; CAP-03.02; CAP-03.07; CAP-03.10 | Sedes y áreas | Formatos; observación; evidencia dispersa | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-AUD-006; seguimiento no uniforme |
| `ASIS-SRC-013` | Reportar y gestionar accidentes, incidentes o emergencias | CAP-03.04; CAP-03.05; CAP-03.09 | Todas las sedes | Comunicación inmediata; documentos; terceros | `MANUAL_CONTROLADO` | `PARCIAL` | OPS-AUD-006; evidencia y acciones separadas |
| `ASIS-SRC-014` | Controlar higiene, inocuidad y cumplimiento obligatorio | CAP-03.06; CAP-03.08; CAP-03.10 | Producción y puntos de venta | Revisión operativa; papel; archivos | `MANUAL_CONTROLADO` | `OPERATIVO_CON_VARIANTES` | OPS-AUD-006; variación por área |

## Productos, recetas y conocimiento

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-015` | Crear o modificar productos, presentaciones y unidades | CAP-04.01 a CAP-04.04 | Todas las marcas y aplicaciones | Aplicaciones; archivos; decisiones distribuidas | `DIGITAL_PARCIAL` | `FRAGMENTADO` | OPS-AUD-007; identidad y versiones no unificadas |
| `ASIS-SRC-016` | Crear, probar, aprobar y versionar recetas | CAP-04.05; CAP-04.06; CAP-04.09; CAP-04.10 | Centro de Producción; sedes | Documentos; conocimiento; FOGO parcial | `HIBRIDO` | `PARCIAL` | CAP-SCOPE-006; recetas incompletas |
| `ASIS-SRC-017` | Gestionar menús, oferta y disponibilidad | CAP-04.07; CAP-09.01 | Vento Café; Saudo; Molka; canales | Makos; menús digitales; ManyChat; Instagram | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-AUD-008; actualización duplicada |
| `ASIS-SRC-018` | Gestionar especificaciones, alérgenos y calidad de producto | CAP-04.08; CAP-04.09 | Producción y venta | Conocimiento técnico; documentos; validación manual | `MANUAL_CONTROLADO` | `PARCIAL` | CAP-SCOPE-010; publicación incompleta |

## Compras y proveedores

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-019` | Detectar necesidad y solicitar compra | CAP-05.01; CAP-05.02 | Áreas productivas; sedes; administración | Avisos; WhatsApp; archivos; ORIGO parcial | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-AUD-009; no existe entrada única |
| `ASIS-SRC-020` | Buscar proveedor, comparar y negociar | CAP-05.03 a CAP-05.05 | Compras | Llamadas; mensajes; cotizaciones | `MANUAL_CONTROLADO` | `PARCIAL` | OPS-AUD-009; decisión no siempre trazable |
| `ASIS-SRC-021` | Aprobar y emitir compra | CAP-05.06; CAP-05.07; CAP-05.12 | Gerencia; compras | Aprobación; mensajes; documentos; ORIGO parcial | `DIGITAL_PARCIAL` | `PARCIAL` | CODE-AUD-001; compra ordinaria y urgente mezcladas |
| `ASIS-SRC-022` | Recibir, verificar y resolver diferencias con proveedor | CAP-05.08 a CAP-05.11 | Centro de Producción; sedes | Recepción física; factura; ORIGO/NEXO parciales | `HIBRIDO` | `FRAGMENTADO` | CAP-COVER-006; recepción, inventario y documentos no conciliados |

## Inventario, almacenamiento y remisiones

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-023` | Definir e identificar lugares de almacenamiento | CAP-06.01; CAP-06.02 | Sedes; áreas; ubicaciones | Conocimiento local; etiquetas; NEXO parcial | `DIGITAL_PARCIAL` | `PARCIAL` | CAP-MAP-003; ubicaciones físicas y lógicas incompletas |
| `ASIS-SRC-024` | Registrar entrada, ubicar y reubicar existencias | CAP-06.03; CAP-06.04; CAP-06.05 | Centro de Producción; satélites | Operación física; NEXO parcial | `DIGITAL_PARCIAL` | `PARCIAL` | CODE-AUD-001; efecto real por ubicación incompleto |
| `ASIS-SRC-025` | Retirar, consumir o trasladar existencias | CAP-06.06 a CAP-06.08 | Áreas y ubicaciones | NEXO parcial; comunicación; registros manuales | `HIBRIDO` | `OPERATIVO_CON_VARIANTES` | CAP-SCOPE-006; conversiones y ubicaciones |
| `ASIS-SRC-026` | Contar inventario y resolver diferencias | CAP-06.12; CAP-06.13 | Sedes; áreas; ubicaciones | NEXO; formatos; Excel; revisión manual | `DIGITAL_PARCIAL` | `PARCIAL` | CODE-AUD-010; ajuste y evidencia incompletos |
| `ASIS-SRC-027` | Controlar vencimiento, daño, merma, pérdida y frío | CAP-06.14; CAP-06.15 | Inventarios y producción | Observación; avisos; registros incompletos | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | CAP-SCOPE-018; cuarentena y disposición incompletas |
| `ASIS-SRC-028` | Solicitar, preparar, transportar y recibir remisiones internas | CAP-06.09 a CAP-06.11; CAP-11 | Centro de Producción; satélites | NEXO parcial; papel; Excel; capturas; WhatsApp | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | CAP-MAP-009; estados y cantidades no conciliados |

## Activos, reutilizables y vehículos

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-029` | Identificar, asignar y transferir custodia de activos | CAP-07.01 a CAP-07.06 | Sedes; puntos externos; trabajadores | Inventarios parciales; conocimiento; documentos | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-ACT-001; custodia incompleta |
| `ASIS-SRC-030` | Mantener, reparar, garantizar o dar de baja activos | CAP-07.07 a CAP-07.10 | Equipos e instalaciones | Comunicación; técnicos externos; soportes | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | CAP-SCOPE-015; historial no centralizado |
| `ASIS-SRC-031` | Gestionar vehículos, combustible y disponibilidad | CAP-07.12; CAP-07.13 | Camioneta; conductor; gerencia | Recibos; control manual; conocimiento | `MANUAL_CONTROLADO` | `CONCENTRADO` | OPS-ACT-001; dependencia del conductor |
| `ASIS-SRC-032` | Entregar, recuperar y controlar canastas, contenedores y reutilizables | CAP-07.03 a CAP-07.06; CAP-11 | Centro de Producción y satélites | Separación física; memoria; conductor | `MANUAL` | `INFORMAL` | OPS-AUD-001; ciclo de retorno incompleto |

## Producción

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-033` | Recopilar necesidades y planear producción | CAP-08.01 a CAP-08.05 | Centro de Producción; satélites | Tablas; mensajes; capturas; llamadas | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-AUD-011; demanda, stock y capacidad separados |
| `ASIS-SRC-034` | Preparar materiales y ejecutar producción | CAP-08.06 a CAP-08.09 | Áreas productivas | Operación física; recetas parciales; FOGO parcial | `HIBRIDO` | `OPERATIVO_CON_VARIANTES` | CAP-SCOPE-006; captura incompleta |
| `ASIS-SRC-035` | Controlar calidad y liberar, retener o rechazar producto | CAP-08.10; CAP-08.12 | Áreas productivas; almacenamiento | Revisión del área; evidencia no uniforme | `MANUAL_CONTROLADO` | `PARCIAL` | CAP-SCOPE-018; criterios no uniformes |
| `ASIS-SRC-036` | Empacar, etiquetar y almacenar producto terminado | CAP-08.11 | Áreas productivas; despacho | Actividad física; etiquetas; medios parciales | `HIBRIDO` | `OPERATIVO_CON_VARIANTES` | CAP-MAP-011; etiquetado central pendiente |
| `ASIS-SRC-037` | Gestionar reproceso, aprovechamiento y cierre productivo | CAP-08.13; CAP-08.14 | Áreas productivas | Conocimiento productivo; registros parciales | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | CAP-COVER-008; rendimiento y merma no conciliados |

## Pedidos, ventas, pagos y clientes

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-038` | Atender pedido y servicio presencial en mesa | CAP-09.02 a CAP-09.11 | Vento Café; Saudo; Molka | Makos; servicio; comandas; impresión | `DIGITAL_PARCIAL` | `OPERATIVO_CON_VARIANTES` | OPS-AUD-012; variantes por sede |
| `ASIS-SRC-039` | Atender venta de mostrador o para llevar | CAP-09.02 a CAP-09.12 | Vento Café; Saudo; Molka | Makos; caja; mostrador; preparación | `DIGITAL_PARCIAL` | `OPERATIVO_CON_VARIANTES` | CAP-MAP-003; puntos integrados distintos |
| `ASIS-SRC-040` | Procesar pedido de Rappi, ManyChat, Instagram, WhatsApp o Shopify | CAP-09.13; CAP-11.12 | Canales externos y sedes | Plataformas externas; continuidad manual | `EXTERNO_CON_CONTINUIDAD_INTERNA` | `FRAGMENTADO` | CAP-MAP-009; sin integración automática confirmada |
| `ASIS-SRC-041` | Gestionar catering, pedido especial o venta B2B | CAP-09.14 | Catering; empresas compradoras | Mensajes; archivos; coordinación; producción | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-GOV-001; modelo objetivo pendiente |
| `ASIS-SRC-042` | Modificar, sustituir, cancelar o anular pedido | CAP-09.05 | Puntos de venta y canales | Makos; comunicación interna; controles parciales | `DIGITAL_PARCIAL` | `PARCIAL` | GAP-CTRL-003; transiciones no diferenciadas |
| `ASIS-SRC-043` | Cobrar, confirmar pago y emitir soporte o factura | CAP-09.08 a CAP-09.10; CAP-12.02; CAP-12.06 | Puntos de venta; titulares | Makos; medios de pago; facturación | `HIBRIDO` | `OPERATIVO_CON_VARIANTES` | OPS-GOV-001; marca, titular y emisor difieren |
| `ASIS-SRC-044` | Cerrar caja y revisar jornada de venta | CAP-09.15; CAP-12.02; CAP-12.07 | Puntos de venta; administración | Makos; soportes; revisión administrativa | `HIBRIDO` | `PARCIAL` | CAP-SCOPE-012; conciliación pendiente |
| `ASIS-SRC-045` | Identificar cliente y gestionar fidelización | CAP-10.01; CAP-10.02; CAP-10.07; CAP-10.10 | PASS; PULSO; puntos de venta | PASS; PULSO; caja | `DIGITAL_PARCIAL` | `PARCIAL` | CAP-SCOPE-010; privacidad y redención |
| `ASIS-SRC-046` | Recibir reclamo, devolución o compensación | CAP-10.03 a CAP-10.05 | Canales de atención y sedes | Comunicación directa; canales digitales | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | OPS-AUD-013; decisión y efecto separados |
| `ASIS-SRC-047` | Gestionar reservas, eventos y comunicaciones al cliente | CAP-10.08; CAP-10.09 | Vento Café; eventos; catering | Mensajes; llamadas; coordinación manual | `MANUAL_CONTROLADO` | `PARCIAL` | CAP-MAP-009; disponibilidad no centralizada |

## Transporte y entrega

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-048` | Planear recorrido, asignar vehículo y preparar carga | CAP-11.01 a CAP-11.06 | Centro de Producción; sedes; vehículo | Coordinación manual; conductor; soportes | `MANUAL_CONTROLADO` | `CONCENTRADO` | OPS-AUD-014; rutas y custodia personales |
| `ASIS-SRC-049` | Ejecutar recorrido y confirmar entrega o recepción | CAP-11.07 a CAP-11.11 | Rutas internas | Conductor; papel; mensajes; recepción | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | CAP-MAP-009; novedades no centralizadas |
| `ASIS-SRC-050` | Gestionar entrega mediante tercero | CAP-11.12 | Domicilios y canales externos | Tercero externo; seguimiento parcial | `EXTERNO_DEPENDIENTE` | `PARCIAL` | CAP-SCOPE-017; custodia externa |

## Finanzas y obligaciones

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-051` | Registrar hechos económicos y soportes | CAP-12.01; CAP-12.06 | Operaciones; Contabilidad | Archivos; sistemas origen; NUMERA parcial | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | CAP-SCOPE-012; fuentes no integradas |
| `ASIS-SRC-052` | Gestionar cuentas por pagar y pagos | CAP-12.03; CAP-12.05; CAP-12.08 | Administración; proveedores | Soportes; revisión; plataforma bancaria | `HIBRIDO` | `PARCIAL` | CAP-MAP-006; aprobaciones distribuidas |
| `ASIS-SRC-053` | Gestionar cuentas por cobrar e ingresos pendientes | CAP-12.04; CAP-12.07 | Administración; clientes; canales | Seguimiento administrativo; registros parciales | `MANUAL_CONTROLADO` | `PARCIAL` | CAP-SCOPE-012; fuente de verdad pendiente |
| `ASIS-SRC-054` | Calcular costos, analizar rentabilidad y preparar cierres | CAP-12.09; CAP-17 | Administración; NUMERA | Excel; archivos; datos parciales | `MANUAL_DISTRIBUIDO` | `PARCIAL` | CODE-AUD-010; costeo y reglas incompletos |

## Instalaciones, marketing, tecnología, información y continuidad

| Clave | Proceso AS-IS | Capacidades relacionadas | Alcance observado | Soporte actual | Modalidad | Condición | Fuente y ruptura conocida |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ASIS-SRC-055` | Limpiar, inspeccionar y mantener instalaciones | CAP-13 | Todas las sedes | Trabajo operativo; comunicación; externos | `MANUAL_CONTROLADO` | `OPERATIVO_CON_VARIANTES` | OPS-ACT-001; evidencia variable |
| `ASIS-SRC-056` | Diseñar, aprobar y publicar contenido o promoción | CAP-14 | Marcas y canales | Marketing; redes; archivos; aprobaciones | `MANUAL_CONTROLADO` | `OPERATIVO_CON_VARIANTES` | CAP-MAP-006; medición no uniforme |
| `ASIS-SRC-057` | Gestionar consultas y oportunidades de canales digitales | CAP-14; CAP-09; CAP-10 | Instagram; ManyChat; WhatsApp | Canales externos; continuidad humana | `EXTERNO_CON_CONTINUIDAD_INTERNA` | `FRAGMENTADO` | CAP-MAP-009; conversación y pedido separados |
| `ASIS-SRC-058` | Solicitar, diagnosticar y resolver soporte tecnológico | CAP-15 | Aplicaciones y dispositivos | WhatsApp; comunicación verbal; ejecución directa | `MANUAL_DISTRIBUIDO` | `INFORMAL` | CAP-SCOPE-015; sin registro único |
| `ASIS-SRC-059` | Crear, modificar o retirar accesos tecnológicos | CAP-15; CAP-02.13 | SHELL; aplicaciones; Supabase | Solicitudes informales; sistemas separados | `MANUAL_DISTRIBUIDO` | `CONCENTRADO` | AUTH-CTX-001 a AUTH-CTX-030; decisión y ejecución separadas |
| `ASIS-SRC-060` | Crear, versionar, compartir, archivar y conservar documentos | CAP-16 | Todas las áreas | Papel; Drive; aplicaciones; archivos locales | `HIBRIDO` | `FRAGMENTADO` | CAP-SCOPE-016; fuentes y retención no uniformes |
| `ASIS-SRC-061` | Preparar reportes, analizar resultados y definir mejoras | CAP-17 | Gerencia; administración; áreas | Excel; exportaciones; datos de aplicaciones | `MANUAL_DISTRIBUIDO` | `FRAGMENTADO` | CAP-COVER-012; métricas pendientes |
| `ASIS-SRC-062` | Detectar incidente, mantener operación mínima, recuperar y conciliar | CAP-18 | Todas las operaciones | Papel; mensajes; soporte técnico | `MANUAL_DISTRIBUIDO` | `INFORMAL` | CAP-SCOPE-018; contingencia y conciliación no formalizadas |

## Controles antes de aprobación

- [ ] Cada fila conserva fuentes exactas de E1.
- [ ] Cada fila se vincula con las brechas exactas aplicables.
- [ ] Ninguna fila describe únicamente una pantalla, documento, cargo o actividad.
- [ ] Las variantes por sede, canal, titular o custodia están visibles.
- [ ] Las agrupaciones no crean identificadores definitivos.
- [ ] Los posibles duplicados quedan reservados para `PROC-CAT-020`.
- [ ] Las capacidades relacionadas existen en el mapa aprobado.
- [ ] Ninguna práctica defectuosa se presenta como TO-BE.
- [ ] No se modificó código, Supabase, migraciones ni operación.

## Continuidad

```text
PROC-CAT-002 — Diseñar procesos TO-BE
PROC-CAT-003 — Crear identificadores estables
PROC-CAT-004 a PROC-CAT-020 — Completar el contrato de procesos
```
