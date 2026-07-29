### MINI-BLOQUE — DEPENDENCIAS TRAZABILIDAD CONTINGENCIA Y VALIDACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dependencias trazabilidad contingencia y validación** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `OPS-AUD-011` a `OPS-AUD-015` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `OPS-AUD-011`: Identificar dependencias entre áreas, sedes, aplicaciones y terceros
- `OPS-AUD-012`: Identificar puntos de doble digitación y conciliación manual
- `OPS-AUD-013`: Identificar pérdidas de trazabilidad, información y responsabilidad
- `OPS-AUD-014`: Identificar contingencias por caída de red, energía, dispositivo o proveedor
- `OPS-AUD-015`: Validar hallazgos con trabajadores, supervisores y responsables del proceso
<!-- PLAN-SECTION-META:END -->

### ✅ OPS-AUD-011 — Identificar dependencias entre áreas, sedes, aplicaciones y terceros

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Mapa AS-IS de dependencias operativas, tecnológicas, físicas y externas  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-010`  
**Validación pendiente:** `OPS-AUD-015` para dependencias, responsables, frecuencias o terceros no suficientemente confirmados

---

#### 1. Propósito

Identificar de qué depende cada proceso actual para poder iniciar, continuar y cerrar correctamente.

La tarea deberá documentar dependencias entre:

- empresas y marcas;
- sedes;
- áreas;
- trabajadores;
- responsables;
- aplicaciones;
- dispositivos;
- documentos;
- inventario;
- producción;
- transporte;
- proveedores;
- mensajerías;
- bancos;
- abogados;
- técnicos;
- servicios públicos;
- infraestructura física.

El objetivo es entender cómo una falla en un punto se propaga al resto de la operación.

```text
DEPENDENCIA NO DISPONIBLE
→ PROCESO AFECTADO
→ ÁREAS AFECTADAS
→ SEDES AFECTADAS
→ EFECTO OPERATIVO
→ EFECTO FINANCIERO O DE SERVICIO
```

Esta tarea describe el estado actual.

No define todavía:

- arquitectura TO-BE;
- integraciones;
- contratos entre aplicaciones;
- redundancia;
- SLA;
- colas;
- reintentos;
- contingencias;
- priorización técnica;
- implementación.

---

#### 2. Definición canónica de dependencia

Una dependencia existe cuando un proceso necesita que otro elemento esté disponible, correcto o terminado.

##### 2.1. Dependencia de información

El proceso necesita:

- solicitud;
- cantidad;
- horario;
- estado;
- precio;
- factura;
- dirección;
- permiso;
- aprobación.

##### 2.2. Dependencia operativa

El proceso necesita que otra persona o área ejecute una actividad previa.

##### 2.3. Dependencia física

El proceso necesita:

- insumo;
- producto;
- espacio;
- equipo;
- vehículo;
- canasta;
- horno;
- frío;
- energía;
- conectividad.

##### 2.4. Dependencia tecnológica

El proceso necesita:

- aplicación;
- sesión;
- cuenta;
- dispositivo;
- impresora;
- red;
- base de datos;
- servicio externo.

##### 2.5. Dependencia externa

El proceso depende de un tercero fuera del control directo de Vento Group.

##### 2.6. Dependencia temporal

El proceso debe ocurrir antes, después o dentro de una ventana específica.

##### 2.7. Dependencia de decisión

El proceso no puede continuar sin criterio, aprobación o priorización de una persona.

---

#### 3. Clasificación de dependencias

| Código | Tipo           | Definición                                                  |
| ------ | -------------- | ----------------------------------------------------------- |
| `INF`  | Información    | Dato, documento, solicitud o estado previo                  |
| `PER`  | Persona        | Conocimiento, presencia o decisión individual               |
| `ARE`  | Área           | Capacidad previa de otra área                               |
| `SED`  | Sede           | Disponibilidad o respuesta de otra sede                     |
| `APP`  | Aplicación     | Sistema interno o externo                                   |
| `DEV`  | Dispositivo    | Tablet, computador, celular, datáfono o impresora           |
| `NET`  | Red            | Internet, Wi-Fi, LAN o conectividad                         |
| `DAT`  | Datos          | Catálogo, inventario, usuario, producto o configuración     |
| `INV`  | Inventario     | Existencia física o digital                                 |
| `EQP`  | Equipo         | Horno, cámara fría, congelador u otro activo                |
| `LOG`  | Logística      | Vehículo, conductor, ruta, canasta o mensajería             |
| `DOC`  | Documento      | Factura, remisión, cierre, guía o contrato                  |
| `TER`  | Tercero        | Proveedor, banco, técnico, abogado, plataforma o mensajería |
| `ENE`  | Energía        | Servicio eléctrico                                          |
| `TMP`  | Tiempo         | Ventana, secuencia o anticipación                           |
| `DEC`  | Decisión       | Aprobación, prioridad o criterio                            |
| `LEG`  | Legal/contable | Requisito fiscal, laboral o contractual                     |

---

#### 4. Estado de dependencia

| Estado          | Significado                                         |
| --------------- | --------------------------------------------------- |
| `OBLIGATORIA`   | Sin ella el proceso no puede continuar              |
| `CRÍTICA`       | Su ausencia detiene o compromete gravemente         |
| `ALTA`          | Su ausencia genera retraso o reproceso importante   |
| `MEDIA`         | Existe alternativa manual o parcial                 |
| `BAJA`          | Afecta eficiencia, pero no bloquea                  |
| `INFORMAL`      | Existe por costumbre o comunicación no estructurada |
| `PERSONA_CLAVE` | Depende especialmente de una persona                |
| `TERCERO_CLAVE` | Depende de un actor externo                         |
| `NO_CONFIRMADA` | Requiere validación en `OPS-AUD-015`                |

---

#### 5. Inventario maestro de dependencias

| Código    | Proceso                  | Depende de                                         | Tipo                       | Estado          |
| --------- | ------------------------ | -------------------------------------------------- | -------------------------- | --------------- |
| `DEP-001` | Solicitud de remisión    | Responsable del área prepare y envíe Excel         | `PER`, `INF`, `APP`        | `OBLIGATORIA`   |
| `DEP-002` | Consolidación productiva | Solicitudes lleguen completas y legibles           | `INF`, `TMP`               | `CRÍTICA`       |
| `DEP-003` | Producción               | Disponibilidad de insumos                          | `INV`, `TER`               | `CRÍTICA`       |
| `DEP-004` | Panadería                | Fermentación, reposo y hornos                      | `TMP`, `EQP`               | `CRÍTICA`       |
| `DEP-005` | Repostería               | Angélica distribuya trabajo                        | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-006` | Tortas                   | Disponibilidad de Valentina                        | `PER`                      | `PERSONA_CLAVE` |
| `DEP-007` | Galletería               | Responsable y autorización de Angélica             | `PER`, `DEC`               | `ALTA`          |
| `DEP-008` | Cocina Caliente          | Plan semanal y cocinera responsable                | `INF`, `PER`               | `PERSONA_CLAVE` |
| `DEP-009` | Producción de Barra      | Rotación de trabajador entre sedes                 | `PER`, `ARE`, `SED`        | `ALTA`          |
| `DEP-010` | Despacho                 | Conductor disponible                               | `PER`, `LOG`               | `CRÍTICA`       |
| `DEP-011` | Despacho                 | Vehículo disponible                                | `LOG`, `EQP`               | `CRÍTICA`       |
| `DEP-012` | Despacho                 | Canastas disponibles                               | `LOG`, `EQP`               | `ALTA`          |
| `DEP-013` | Recepción en sede        | Responsable disponible                             | `PER`, `ARE`               | `ALTA`          |
| `DEP-014` | Recepción proveedor      | Receptor competente                                | `PER`                      | `ALTA`          |
| `DEP-015` | Recepción proveedor      | Factura o soporte                                  | `DOC`, `TER`               | `ALTA`          |
| `DEP-016` | Compra                   | Áreas informen faltantes                           | `ARE`, `INF`               | `CRÍTICA`       |
| `DEP-017` | Compra                   | Gerente general consolide y decida                 | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-018` | Compra                   | Proveedor confirme                                 | `TER`, `INF`               | `TERCERO_CLAVE` |
| `DEP-019` | Bodega                   | Inventario físico y ubicación                      | `INV`, `DAT`               | `CRÍTICA`       |
| `DEP-020` | Inventario digital       | Todos los movimientos sean registrados             | `ARE`, `APP`, `DAT`        | `CRÍTICA`       |
| `DEP-021` | Venta                    | Makos disponible                                   | `APP`, `DEV`, `NET`        | `CRÍTICA`       |
| `DEP-022` | Comandas Vento Café      | Impresoras y red local                             | `DEV`, `NET`               | `CRÍTICA`       |
| `DEP-023` | Servicio de mesa         | Tablet o dispositivo disponible                    | `DEV`, `APP`               | `ALTA`          |
| `DEP-024` | Pago tarjeta             | Datáfono y conectividad bancaria                   | `DEV`, `NET`, `TER`        | `CRÍTICA`       |
| `DEP-025` | Rappi                    | Plataforma externa operativa                       | `APP`, `TER`, `NET`        | `TERCERO_CLAVE` |
| `DEP-026` | Domicilio directo        | ManyChat y mensajero                               | `APP`, `TER`, `NET`        | `ALTA`          |
| `DEP-027` | Cierre de Caja           | Makos y conteo físico                              | `APP`, `DOC`, `PER`        | `CRÍTICA`       |
| `DEP-028` | Entrega de efectivo      | Cierre impreso y Gerencia                          | `DOC`, `PER`               | `CRÍTICA`       |
| `DEP-029` | Contabilidad             | Soportes lleguen completos                         | `DOC`, `ARE`, `PER`        | `CRÍTICA`       |
| `DEP-030` | Programación laboral     | Gerente general y gerente Vento Café               | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-031` | Consulta de turno        | VISO publique y ANIMA funcione                     | `APP`, `DAT`, `NET`        | `CRÍTICA`       |
| `DEP-032` | Check-in                 | Cuenta activa, turno y dispositivo                 | `APP`, `DAT`, `DEV`, `NET` | `CRÍTICA`       |
| `DEP-033` | Propinas                 | Reportes de asistencia correctos                   | `APP`, `DAT`, `INF`        | `ALTA`          |
| `DEP-034` | Nómina                   | Información laboral, Contabilidad y banco          | `DAT`, `ARE`, `TER`, `LEG` | `CRÍTICA`       |
| `DEP-035` | Contratación             | Gerencia, responsable de área, Nathalia y abogados | `PER`, `ARE`, `TER`, `LEG` | `ALTA`          |
| `DEP-036` | Alta de acceso           | Gerencia solicite y Operaciones ejecute            | `PER`, `INF`, `APP`        | `CRÍTICA`       |
| `DEP-037` | Baja de acceso           | Notificación de retiro                             | `INF`, `ARE`, `PER`        | `CRÍTICA`       |
| `DEP-038` | Marketing                | Solicitud y criterio de Nathalia o Jeo             | `PER`, `DEC`               | `PERSONA_CLAVE` |
| `DEP-039` | Vaila Vainilla           | Shopify                                            | `APP`, `TER`, `NET`        | `CRÍTICA`       |
| `DEP-040` | Vaila Vainilla           | Jeo y trabajadora de ventas                        | `PER`                      | `PERSONA_CLAVE` |
| `DEP-041` | Vaila Vainilla           | Mensajería externa                                 | `TER`, `LOG`               | `TERCERO_CLAVE` |
| `DEP-042` | Soporte técnico          | Jefe de Operaciones disponible                     | `PER`                      | `PERSONA_CLAVE` |
| `DEP-043` | Mantenimiento            | Gerencia contacte técnico                          | `PER`, `TER`               | `TERCERO_CLAVE` |
| `DEP-044` | Mantenimiento            | Repuesto disponible                                | `TER`, `EQP`               | `CRÍTICA`       |
| `DEP-045` | Servicios Generales      | Instrucciones y criterio de priorización           | `PER`, `DEC`               | `INFORMAL`      |
| `DEP-046` | Frío                     | Energía y equipos                                  | `ENE`, `EQP`               | `CRÍTICA`       |
| `DEP-047` | Aplicaciones             | Internet y red local                               | `NET`                      | `CRÍTICA`       |
| `DEP-048` | Impresión                | Energía, red, impresora y consumibles              | `ENE`, `NET`, `DEV`, `INV` | `CRÍTICA`       |
| `DEP-049` | Operación administrativa | Computadores y cuentas                             | `DEV`, `APP`, `DAT`        | `ALTA`          |
| `DEP-050` | Trazabilidad             | Identidad individual y registros completos         | `DAT`, `APP`, `PER`        | `CRÍTICA`       |

---

#### 6. Dependencias entre sedes

##### 6.1. Vento Café → Centro de Producción

Vento Café depende del Centro de Producción para:

- Panadería;
- Repostería;
- Tortas;
- Galletería;
- preparaciones de Cocina Caliente;
- producción central de Barra;
- abastecimiento de Bodega;
- remisiones;
- transporte.

```text
VENTO CAFÉ SOLICITA
→ CENTRO PRODUCE O ALISTA
→ CONDUCTOR TRANSPORTA
→ VENTO CAFÉ RECIBE
```

Una falla del Centro puede afectar:

- vitrina;
- Cocina;
- Barra;
- Servicio;
- ventas.

##### 6.2. Saudo → Centro de Producción

Saudo depende del Centro para:

- productos terminados;
- ingredientes;
- postres;
- productos de vitrina;
- preparaciones de Barra;
- abastecimiento interno.

También depende de Vento Café para parte del fruver, según la operación actual presumida.

Esta ruta debe validarse en `OPS-AUD-015`.

##### 6.3. Molka → Centro de Producción

Molka no tiene cocina productiva propia.

Depende fuertemente de:

- productos terminados;
- inventario central;
- remisiones;
- conductor;
- productos reasignados desde otras sedes.

La falla de abastecimiento tiene impacto directo en su capacidad de venta.

##### 6.4. Centro de Producción → sedes

El Centro depende de las sedes para:

- solicitudes oportunas;
- cantidades correctas;
- devolución de canastas;
- retroalimentación de faltantes;
- información de consumo;
- información de sobrantes.

##### 6.5. Oficinas administrativas → todas las sedes

Gerencia, Contabilidad, Marketing y Operaciones soportan transversalmente:

- compras;
- dinero;
- personal;
- accesos;
- horarios;
- sistemas;
- proveedores;
- técnicos;
- decisiones.

Las sedes dependen de decisiones centralizadas.

---

#### 7. Dependencias entre áreas del Centro de Producción

##### 7.1. Bodega → producción

Todas las áreas productivas dependen de Bodega para:

- insumos;
- empaques;
- utensilios;
- disponibilidad;
- recepción de proveedores.

##### 7.2. Producción → conductor

El conductor depende de que cada área:

- termine;
- empaque;
- separe;
- almacene en el lugar correcto;
- informe productos extra o faltantes.

##### 7.3. Conductor → Bodega y Cocina Caliente

El conductor completa las remisiones usando:

- Bodega;
- Cocina Caliente;
- producto terminado de áreas.

##### 7.4. Servicios Generales → producción y logística

La operación depende de limpieza de:

- zonas;
- utensilios;
- canastas;
- superficies;
- espacios de circulación.

##### 7.5. Frío → producción y logística

Cámara fría y congelación sostienen:

- producto terminado;
- preparaciones;
- insumos;
- conservación hasta despacho.

---

#### 8. Dependencias de personas clave

##### 8.1. Gerente general

Dependencias actuales:

- compras;
- proveedores;
- efectivo;
- Contabilidad;
- turnos;
- propinas;
- contratación;
- mantenimiento;
- decisiones transversales;
- coordinación entre sedes.

Riesgo:

```text
ALTA CENTRALIZACIÓN
→ COLA DE DECISIONES
→ DEMORA
→ DEPENDENCIA DE DISPONIBILIDAD PERSONAL
```

##### 8.2. Nathalia

Participa en:

- prioridades;
- contratación;
- Marketing;
- decisiones operativas;
- instrucciones a Servicios Generales;
- revisión de asuntos empresariales.

##### 8.3. Jeo

Dependencias:

- Vaila Vainilla;
- Marketing;
- pedidos;
- decisiones comerciales;
- aprobaciones de contenido.

##### 8.4. Jefe de Operaciones

Dependencias:

- soporte tecnológico;
- desarrollo;
- accesos;
- recepción de proveedores;
- Bodega;
- implementación;
- equipos;
- redes;
- aplicaciones.

La atención de incidentes desplaza desarrollo.

##### 8.5. Conductor

Dependencias:

- apertura del Centro;
- remisiones;
- alistamiento;
- transporte;
- distribución;
- retorno de canastas;
- cierre físico.

##### 8.6. Angélica

Dependencias:

- coordinación de Repostería;
- Tortas;
- Galletería;
- distribución de trabajo;
- decisiones productivas.

##### 8.7. Valentina

Dependencia crítica en ejecución habitual de Tortas.

##### 8.8. Gerente de Vento Café

Dependencias:

- programación;
- operación de sede;
- inducción;
- control de personal;
- coordinación con Gerencia General.

---

#### 9. Dependencias de aplicaciones

##### 9.1. Makos

Procesos dependientes:

- mesas;
- pedidos;
- Caja;
- cierres;
- facturas;
- comandas;
- Rappi transcrito;
- domicilios transcritos.

Una caída puede afectar simultáneamente:

- Servicio;
- Cocina;
- Barra;
- Caja;
- facturación;
- reportes.

##### 9.2. VISO

Procesos dependientes:

- creación y publicación de turnos;
- revisión administrativa;
- reportes de asistencia.

##### 9.3. ANIMA

Procesos dependientes:

- consulta de turnos;
- notificaciones;
- check-in;
- identidad laboral del trabajador.

##### 9.4. WhatsApp

Procesos dependientes:

- remisiones;
- compras;
- proveedores;
- Marketing;
- soporte;
- mantenimiento;
- accesos;
- coordinación general.

WhatsApp funciona como infraestructura operacional informal.

##### 9.5. Excel

Procesos dependientes:

- solicitudes de remisión;
- consolidaciones;
- controles administrativos;
- algunos reportes.

##### 9.6. Shopify

Vaila Vainilla depende de Shopify para recibir y consultar pedidos principales.

##### 9.7. Rappi

Vento Café y Saudo dependen de Rappi para el canal de plataforma.

##### 9.8. ManyChat

Vento Café depende de ManyChat para pedidos directos y domicilios.

##### 9.9. Sistema contable

Gerencia y Contabilidad dependen de:

- registro financiero;
- soportes;
- información tributaria;
- conciliación.

##### 9.10. Bancolombia Nóminas

La nómina formal depende del portal bancario.

##### 9.11. Vento OS experimental

Los procesos en prueba dependen de:

- integridad de datos;
- registro completo;
- cuentas;
- dispositivos;
- Supabase;
- conectividad.

Actualmente no puede ser fuente autoritativa donde los movimientos estén incompletos.

---

#### 10. Dependencias entre aplicaciones

| Origen     | Destino           | Mecanismo actual         | Riesgo                          |
| ---------- | ----------------- | ------------------------ | ------------------------------- |
| Excel      | WhatsApp          | Captura o fotografía     | Pérdida de estructura y versión |
| WhatsApp   | Producción        | Interpretación humana    | Omisión o lectura tardía        |
| Rappi      | Makos             | Transcripción manual     | Error y duplicación             |
| ManyChat   | Makos             | Transcripción manual     | Error y pérdida de datos        |
| Makos      | Contabilidad      | Reporte y soporte manual | Conciliación tardía             |
| VISO       | ANIMA             | Integración parcial      | Dependencia de datos laborales  |
| ANIMA      | VISO              | Check-in y reporte       | Correcciones no confirmadas     |
| Asistencia | Propinas          | Cálculo manual           | Reglas no trazables             |
| Shopify    | Mensajería        | Coordinación humana      | Seguimiento incompleto          |
| Gerencia   | Accesos           | Solicitud informal       | Datos incompletos               |
| Vento OS   | Inventario físico | Registro parcial         | Stock inválido                  |

---

#### 11. Dependencias de dispositivos

##### 11.1. Tablets de Servicio

Afectan:

- pedidos;
- mesas;
- consulta;
- cuentas compartidas.

##### 11.2. Computador de Caja

Afecta:

- Makos;
- Rappi;
- ManyChat;
- facturación;
- cierres.

##### 11.3. Impresoras térmicas

Afectan:

- comandas;
- resúmenes;
- facturas;
- operación por estación.

##### 11.4. Datáfono

Afecta pagos con tarjeta.

##### 11.5. Celulares

Afectan:

- WhatsApp;
- pedidos;
- fotografías;
- soporte;
- coordinación;
- notas informales.

##### 11.6. Computadores administrativos

Afectan:

- Contabilidad;
- Gerencia;
- Marketing;
- desarrollo;
- reportes;
- banca.

##### 11.7. Dispositivos compartidos

La dependencia de un dispositivo compartido crea además dependencia de:

- sesión;
- cuenta;
- contexto;
- identidad efectiva;
- disponibilidad física.

---

#### 12. Dependencias de red y energía

##### 12.1. Internet

Dependencias:

- WhatsApp;
- Rappi;
- ManyChat;
- Shopify;
- VISO;
- ANIMA;
- Vento OS;
- sistema contable en línea;
- banca;
- soporte remoto.

##### 12.2. Red local

Dependencias:

- impresoras LAN;
- computadores;
- tablets;
- servicios locales;
- dispositivos POS.

##### 12.3. Energía

Dependencias críticas:

- hornos;
- refrigeración;
- congelación;
- computadores;
- impresoras;
- red;
- cámaras;
- iluminación;
- datáfonos;
- equipos de producción.

##### 12.4. Frío

La cámara fría y congelación dependen de energía continua.

Una falla puede afectar:

- seguridad alimentaria;
- mermas;
- producción;
- inventario;
- venta;
- responsabilidad.

---

#### 13. Dependencias de equipos y capacidad física

##### 13.1. Hornos de Saudo

La capacidad depende de dos hornos napolitanos.

Cuando se acumulan pizzas:

```text
DEMANDA
> CAPACIDAD DE HORNO
→ COLA
→ RETRASO
→ AFECTACIÓN AL CLIENTE
```

##### 13.2. Hornos y fermentación de Panadería

Dependencias:

- tiempo técnico;
- capacidad;
- secuencia;
- disponibilidad;
- programación anticipada.

##### 13.3. Equipos de frío

Dependencias:

- conservación;
- almacenamiento;
- despacho;
- vida útil.

##### 13.4. Empaque al vacío

Cocina Caliente depende de la capacidad de porcionar y empacar.

##### 13.5. Vehículo

Todas las sedes satélite dependen del vehículo para abastecimiento interno.

##### 13.6. Canastas

La distribución depende de suficientes canastas limpias y disponibles.

---

#### 14. Dependencias de proveedores

##### 14.1. Insumos de producción

La producción depende de:

- disponibilidad;
- calidad;
- presentación;
- precio;
- fecha de entrega.

##### 14.2. Fruver

Vento Café depende de entrega directa.

Saudo puede depender indirectamente de redistribución desde Vento Café.

##### 14.3. Proveedores especializados

Ciertos insumos o repuestos pueden tener pocos proveedores.

##### 14.4. Proveedor como fuente de información

El proveedor confirma:

- cantidad;
- precio;
- fecha.

La información queda en WhatsApp y puede convertirse en fuente informal de verdad.

---

#### 15. Dependencias de terceros no proveedores

##### 15.1. Mensajería de domicilios

Dependencias:

- disponibilidad;
- tiempo de recogida;
- dirección;
- pago;
- entrega.

##### 15.2. Mensajería de Vaila Vainilla

Dependencias:

- frecuencia de recolección;
- capacidad;
- guía;
- entrega final;
- devoluciones.

##### 15.3. Abogados externos

La contratación formal depende de abogados.

##### 15.4. Técnicos

El mantenimiento depende de:

- disponibilidad;
- diagnóstico;
- repuesto;
- visita.

##### 15.5. Bancos

Dependencias:

- datáfonos;
- transferencias;
- nómina;
- portales;
- conectividad.

##### 15.6. Plataformas externas

Dependencias:

- Rappi;
- Shopify;
- ManyChat;
- redes sociales;
- servicios de mensajería.

---

#### 16. Dependencias documentales

##### 16.1. Factura de proveedor

Necesaria para:

- recepción;
- soporte;
- Contabilidad;
- pago;
- conciliación.

##### 16.2. Cierre de Makos

Necesario para:

- entrega de efectivo;
- comparación;
- custodia;
- registro.

##### 16.3. Hoja de merma

Actualmente es el único soporte conocido de descarte.

##### 16.4. Reporte de asistencia

Necesario para:

- revisión laboral;
- propinas;
- novedades.

##### 16.5. Contrato laboral

Necesario para formalización.

##### 16.6. Guía de envío

Probable dependencia de Vaila Vainilla, pendiente de validación.

---

#### 17. Dependencias de datos maestros

La operación tecnológica futura depende de catálogos confiables.

Dependencias actuales o necesarias:

- empresas;
- marcas;
- sedes;
- áreas;
- personas;
- roles;
- productos;
- presentaciones;
- unidades;
- ubicaciones;
- proveedores;
- clientes;
- medios de pago;
- equipos;
- canastas;
- permisos.

Cuando estos datos faltan o están duplicados:

- los flujos no pueden relacionarse;
- los reportes pierden precisión;
- las reglas se escriben manualmente;
- la integración se vuelve inconsistente.

---

#### 18. Dependencias temporales

##### 18.1. Solicitud antes de producción

La solicitud debe llegar antes de la ventana productiva.

##### 18.2. Producción antes de despacho

El producto debe quedar listo antes de que el conductor cargue.

##### 18.3. Frío antes de transporte

El producto debe estar conservado correctamente.

##### 18.4. Horario antes del turno

El trabajador depende de publicación previa.

##### 18.5. Alta antes del inicio laboral

La cuenta debe existir antes de utilizar ANIMA o Vento OS.

##### 18.6. Baja inmediatamente después del retiro

La revocación depende de notificación inmediata.

##### 18.7. Factura antes del registro contable

Contabilidad depende del soporte.

##### 18.8. Repuesto antes de reparación completa

Mantenimiento puede quedar suspendido.

---

#### 19. Cadenas de dependencia críticas

##### 19.1. Abastecimiento interno

```text
SEDE DETECTA NECESIDAD
→ RESPONSABLE PREPARA EXCEL
→ WHATSAPP ENTREGA CAPTURA
→ PRODUCCIÓN CONSOLIDA
→ BODEGA ENTREGA INSUMOS
→ EQUIPO PRODUCE
→ CONDUCTOR ALISTA
→ VEHÍCULO TRANSPORTA
→ SEDE RECIBE
→ ÁREA ALMACENA
```

Falla en cualquier punto puede producir faltante.

##### 19.2. Compra y recepción

```text
ÁREA REPORTA FALTANTE
→ GERENCIA CONSOLIDA
→ PROVEEDOR CONFIRMA
→ PROVEEDOR ENTREGA
→ RECEPTOR REVISA
→ FACTURA SE FIRMA
→ GERENCIA RECIBE SOPORTE
→ CONTABILIDAD REGISTRA
```

##### 19.3. Venta de mesa

```text
TABLET
→ MAKOS
→ IMPRESORA
→ COCINA/BARRA
→ MESERO
→ DATÁFONO O EFECTIVO
→ CAJA
→ FACTURA
→ CIERRE
```

##### 19.4. Turno y asistencia

```text
GERENCIA PLANIFICA
→ VISO PUBLICA
→ ANIMA NOTIFICA
→ TRABAJADOR CONSULTA
→ TRABAJADOR HACE CHECK-IN
→ VISO REPORTA
→ GERENCIA REVISA
→ PROPINA O NOVEDAD LABORAL
```

##### 19.5. Alta y baja de acceso

```text
CONTRATACIÓN
→ GERENCIA SOLICITA
→ OPERACIONES CREA
→ TRABAJADOR USA
```

```text
RETIRO
→ GERENCIA DEBERÍA INFORMAR
→ OPERACIONES DEBERÍA REVOCAR
```

La segunda cadena no funciona de forma obligatoria.

---

#### 20. Propagación de fallas

##### 20.1. Solicitud no enviada

```text
NO HAY SOLICITUD
→ PRODUCCIÓN NO PLANIFICA
→ CONDUCTOR NO ALISTA
→ SEDE NO RECIBE
→ PRODUCTO SE AGOTA
→ VENTA SE PIERDE
```

##### 20.2. Inventario incorrecto

```text
MOVIMIENTOS INCOMPLETOS
→ STOCK DIGITAL INCORRECTO
→ COMPRA INCORRECTA
→ PRODUCCIÓN SIN INSUMO
→ REMISIÓN PARCIAL
→ SEDE SIN PRODUCTO
```

##### 20.3. Conductor ausente

```text
NO HAY APERTURA O ALISTAMIENTO
→ PRODUCCIÓN NO SE RECOGE
→ REMISIONES NO SALEN
→ SEDES NO RECIBEN
```

##### 20.4. Makos caído

```text
NO HAY REGISTRO NORMAL
→ COMANDAS FALLAN
→ CAJA SE AFECTA
→ FACTURACIÓN SE AFECTA
→ CIERRE SE AFECTA
```

##### 20.5. Internet caído

```text
WHATSAPP/RAPPI/MANYCHAT/VISO/ANIMA/SHOPIFY
→ INDISPONIBLES O DEGRADADOS
→ COMUNICACIÓN Y VENTAS AFECTADAS
```

##### 20.6. Energía o frío caído

```text
EQUIPOS SE DETIENEN
→ PRODUCCIÓN Y CONSERVACIÓN FALLAN
→ MERMA Y RIESGO SANITARIO
```

##### 20.7. Gerente general no disponible

```text
COMPRAS
+ EFECTIVO
+ TURNOS
+ PROPINA
+ MANTENIMIENTO
+ DECISIONES
→ PUEDEN ACUMULARSE
```

##### 20.8. Jefe de Operaciones no disponible

```text
SOPORTE
+ ACCESOS
+ RECEPCIÓN
+ DESARROLLO
+ INFRAESTRUCTURA
→ RESPUESTA DEGRADADA
```

---

#### 21. Puntos únicos de falla humanos

| Código     | Persona o función              | Procesos afectados                               |
| ---------- | ------------------------------ | ------------------------------------------------ |
| `SPOF-001` | Gerente general                | Compras, dinero, turnos, propinas, mantenimiento |
| `SPOF-002` | Jefe de Operaciones            | Soporte, accesos, desarrollo, recepción, Bodega  |
| `SPOF-003` | Conductor                      | Apertura, alistamiento, transporte, canastas     |
| `SPOF-004` | Angélica                       | Repostería, Tortas, Galletería                   |
| `SPOF-005` | Valentina                      | Ejecución habitual de Tortas                     |
| `SPOF-006` | Jeo                            | Vaila Vainilla y decisiones comerciales          |
| `SPOF-007` | Gerente de Vento Café          | Operación, personal, programación e inducción    |
| `SPOF-008` | Responsable de Cocina Caliente | Plan y reposición de preparaciones               |
| `SPOF-009` | Jefe de Panadería              | Planificación y asignación de Panadería          |

El término `SPOF` describe el riesgo AS-IS; no implica que cada persona sea absolutamente irreemplazable.

---

#### 22. Puntos únicos de falla tecnológicos y físicos

| Código     | Dependencia                 | Impacto                               |
| ---------- | --------------------------- | ------------------------------------- |
| `SPOF-T01` | Makos                       | Venta, Caja, facturación y comandas   |
| `SPOF-T02` | Computador de Caja          | Makos, Rappi y ManyChat               |
| `SPOF-T03` | Impresoras operativas       | Comandas, facturas y resúmenes        |
| `SPOF-T04` | Internet                    | Canales, aplicaciones y comunicación  |
| `SPOF-T05` | Red local                   | Impresión y dispositivos              |
| `SPOF-T06` | Vehículo                    | Abastecimiento interno                |
| `SPOF-T07` | Cámara fría y congelación   | Conservación                          |
| `SPOF-T08` | Hornos Saudo                | Capacidad de pizzas                   |
| `SPOF-T09` | Shopify                     | Pedidos principales de Vaila Vainilla |
| `SPOF-T10` | Datáfono                    | Pagos con tarjeta                     |
| `SPOF-T11` | WhatsApp                    | Coordinación transversal informal     |
| `SPOF-T12` | Supabase/servicios Vento OS | Aplicaciones internas                 |

---

#### 23. Dependencias circulares

##### 23.1. Inventario y compras

```text
COMPRAS NECESITA INVENTARIO CONFIABLE
↔
INVENTARIO CONFIABLE NECESITA RECEPCIONES Y RETIROS COMPLETOS
```

##### 23.2. Producción y remisiones

```text
PRODUCCIÓN NECESITA SOLICITUDES
↔
SEDES NECESITAN CONOCER DISPONIBILIDAD PARA SOLICITAR
```

##### 23.3. Soporte y desarrollo

```text
APLICACIONES NECESITAN DESARROLLO
↔
DESARROLLO SE INTERRUMPE POR SOPORTE DE LAS APLICACIONES Y EQUIPOS
```

##### 23.4. Datos y adopción

```text
SISTEMA NECESITA DATOS COMPLETOS
↔
TRABAJADORES SOLO CONFÍAN SI EL SISTEMA YA ES CORRECTO
```

Estas dependencias deberán resolverse mediante transición controlada en E5.

---

#### 24. Dependencias ocultas o informales

1. memoria del conductor para identificar productos;
2. reconocimiento visual de canastas;
3. conocimiento de Angélica para distribuir trabajo;
4. conocimiento del jefe de Panadería;
5. experiencia de Gerencia para comprar;
6. comunicación verbal de pago con tarjeta;
7. mensajes de WhatsApp para cambios;
8. criterio del trabajador para declarar merma;
9. aviso informal de retiro laboral;
10. disponibilidad personal del Jefe de Operaciones;
11. prioridad cultural de sedes;
12. conocimiento de quién puede reemplazar a otro;
13. información guardada en teléfonos;
14. relación personal con técnicos y proveedores.

---

#### 25. Dependencias legales, laborales y contables

##### 25.1. Facturación

Depende de:

- Makos;
- configuración fiscal;
- titular jurídico;
- documento correcto;
- medio de pago.

##### 25.2. Contabilidad

Depende de:

- facturas;
- cierres;
- comprobantes;
- clasificación;
- responsables.

##### 25.3. Contratación

Depende de:

- decisión interna;
- documentación;
- abogados externos.

##### 25.4. Nómina

Depende de:

- datos laborales;
- novedades;
- cálculo;
- banco.

##### 25.5. Accesos

Dependen del evento laboral de ingreso, cambio o retiro.

La desconexión entre RR. HH. y tecnología genera riesgo de seguridad.

---

#### 26. Dependencias para la experiencia del cliente

##### 26.1. Disponibilidad

Depende de:

- compras;
- inventario;
- producción;
- remisiones;
- transporte;
- almacenamiento;
- actualización de agotados.

##### 26.2. Tiempo de entrega

Depende de:

- toma de pedido;
- Makos;
- impresora;
- estación;
- capacidad;
- mesero;
- pago.

##### 26.3. Domicilio

Depende de:

- canal;
- transcripción;
- producción;
- empaque;
- mensajero;
- dirección;
- pago.

##### 26.4. Factura

Depende de Caja, Makos e impresora.

---

#### 27. Dependencias para trazabilidad

La trazabilidad completa depende de que todos los procesos compartan identificadores.

Actualmente no existe una relación canónica entre:

- solicitud;
- producción;
- despacho;
- recepción;
- inventario;
- faltante;
- compra;
- proveedor;
- factura;
- pago;
- persona;
- sede;
- área.

Por eso, la trazabilidad depende de reconstrucción manual.

---

#### 28. Dependencias que deberán convertirse en contratos

Esta sección no diseña contratos; identifica candidatos.

##### 28.1. ANIMA ↔ VISO

- trabajadores;
- turnos;
- check-in;
- estados laborales.

##### 28.2. NEXO ↔ FOGO

- solicitudes;
- producción;
- disponibilidad;
- despachos.

##### 28.3. NEXO ↔ ORIGO

- faltantes;
- compras;
- recepciones;
- inventario.

##### 28.4. PULSO ↔ inventario

- ventas;
- agotados;
- consumos;
- devoluciones.

##### 28.5. NUMERA ↔ PULSO/ORIGO/NEXO

- ventas;
- pagos;
- compras;
- inventario;
- costos;
- soportes.

##### 28.6. VISO ↔ todas las aplicaciones

- indicadores;
- alertas;
- decisiones;
- auditoría.

##### 28.7. SHELL ↔ todas las aplicaciones

- identidad;
- sesión;
- contexto;
- permisos;
- navegación.

La definición formal corresponde al BLOQUE X y fases posteriores.

---

#### 29. Dependencias no confirmadas para `OPS-AUD-015`

| Tema                | Duda                                         |
| ------------------- | -------------------------------------------- |
| Fruver              | Ruta exacta hacia Saudo                      |
| Recepción sustituta | Quién puede recibir y firmar                 |
| Compras             | Alcance de Leidy                             |
| Vaila Vainilla      | Guías, mensajería, inventario y devoluciones |
| Correo              | Procesos administrativos críticos            |
| Nómina              | Responsables y doble aprobación              |
| Propinas            | Periodicidad y soportes                      |
| Turnos              | Cambios y reemplazos                         |
| Canastas            | Cantidad, propiedad y pérdidas               |
| Mantenimiento       | Técnicos, facturas y garantías               |
| Marketing           | Correcciones y aprobación                    |
| Proveedores         | Rechazos y devoluciones                      |
| Contabilidad        | Ruta de soportes                             |
| Frío                | Respuesta ante falla                         |
| Conductor           | Sustituto y rutas                            |
| Producción          | Sustitutos de personas clave                 |

---

#### 30. Relación con `OPS-AUD-012`

`OPS-AUD-012` deberá identificar dónde estas dependencias provocan doble digitación o conciliación manual.

Casos principales:

- Excel ↔ captura;
- WhatsApp ↔ producción;
- Rappi ↔ Makos;
- ManyChat ↔ Makos;
- factura ↔ sistema contable;
- cierre ↔ efectivo;
- VISO ↔ cálculo de propinas;
- inventario físico ↔ digital;
- producción reportada ↔ producto cargado;
- despacho ↔ recepción.

---

#### 31. Relación con `OPS-AUD-013`

`OPS-AUD-013` deberá consolidar dónde una dependencia provoca pérdida de:

- actor;
- origen;
- destino;
- estado;
- tiempo;
- versión;
- cantidad;
- responsabilidad;
- evidencia.

---

#### 32. Relación con `OPS-AUD-014`

`OPS-AUD-014` deberá documentar qué ocurre cuando fallan:

- red;
- internet;
- energía;
- dispositivo;
- aplicación;
- impresora;
- vehículo;
- proveedor;
- técnico;
- banco;
- frío;
- persona clave.

---

#### 33. Hallazgos transversales

##### 33.1. La operación está altamente acoplada

Una falla local puede propagarse a varias sedes y aplicaciones.

##### 33.2. WhatsApp conecta procesos, pero no administra dependencias

El canal transmite información, pero no garantiza:

- entrega;
- lectura;
- aceptación;
- ejecución;
- cierre.

##### 33.3. Las personas clave sustituyen al sistema

La memoria y experiencia resuelven vacíos de:

- datos;
- reglas;
- ubicación;
- prioridad;
- aprobación;
- contingencia.

##### 33.4. Las dependencias no están visibles

No existe un tablero que muestre:

- qué está esperando;
- de quién depende;
- desde cuándo;
- qué bloquea;
- qué sedes afecta.

##### 33.5. La falta de inventario confiable se propaga a todo el sistema

Afecta:

- compras;
- producción;
- remisiones;
- venta;
- costos;
- planeación.

##### 33.6. La ausencia de integración crea dependencias humanas

La información debe ser copiada, interpretada y conciliada.

##### 33.7. La centralización genera cuellos de decisión

Gerencia General, Operaciones, conductor y responsables productivos concentran procesos críticos.

---

#### 34. Matriz de riesgo de dependencia

| Riesgo                  | Dependencia          | Consecuencia             |
| ----------------------- | -------------------- | ------------------------ |
| Abastecimiento detenido | Conductor o vehículo | Sedes sin producto       |
| Producción detenida     | Insumos o energía    | Remisiones parciales     |
| Venta detenida          | Makos o Caja         | Pérdida de ingresos      |
| Comandas detenidas      | Impresora o red      | Coordinación verbal      |
| Accesos incorrectos     | Notificación laboral | Riesgo de seguridad      |
| Nómina fallida          | Datos o banco        | Incumplimiento laboral   |
| Contabilidad incompleta | Soportes             | Riesgo financiero        |
| Producto deteriorado    | Frío                 | Merma y riesgo sanitario |
| Desarrollo detenido     | Incidentes           | Retraso del roadmap      |
| Compra incorrecta       | Inventario           | Exceso o faltante        |
| Domicilio fallido       | Mensajería           | Reclamo y devolución     |
| Vaila detenida          | Shopify o Jeo        | Pedidos sin gestionar    |

---

#### 35. Matriz de destino de hallazgos

| Hallazgo                                         | Tarea exacta                      |
| ------------------------------------------------ | --------------------------------- |
| Doble digitación causada por dependencias        | `OPS-AUD-012`                     |
| Pérdida de trazabilidad y responsabilidad        | `OPS-AUD-013`                     |
| Contingencias por caída                          | `OPS-AUD-014`                     |
| Dependencias no confirmadas                      | `OPS-AUD-015`                     |
| Mapa de capacidades                              | `CAP-MAP-001` a `CAP-MAP-015`     |
| Auditoría de código e integraciones              | `CODE-AUD-001` a `CODE-AUD-020`   |
| Alcance por aplicación                           | `CAP-SCOPE-001` a `CAP-SCOPE-019` |
| Cobertura de capacidades                         | `CAP-COVER-001` a `CAP-COVER-012` |
| Consolidación de brechas                         | `GAP-CTRL-001`                    |
| Vinculación a tareas y paquetes                  | `GAP-CTRL-006`                    |
| Contratos entre aplicaciones                     | BLOQUE X                          |
| Arquitectura de datos y eventos                  | BLOQUE E3                         |
| Colas, reintentos, observabilidad y notificación | BLOQUE E4                         |
| Pilotos, transición y contingencia               | BLOQUE E5                         |

---

#### 36. Decisiones propuestas

1. Toda dependencia deberá clasificarse por tipo, criticidad y estado.
2. Las sedes comerciales dependen del Centro de Producción para abastecimiento.
3. El Centro depende de solicitudes oportunas y devolución de canastas.
4. Gerencia General constituye un punto de concentración transversal.
5. El Jefe de Operaciones concentra soporte, accesos, desarrollo e infraestructura.
6. El conductor constituye una dependencia crítica de logística interna.
7. Varias áreas productivas dependen de personas clave.
8. Makos es dependencia crítica para venta, Caja y comandas.
9. WhatsApp es dependencia operacional informal para múltiples procesos.
10. Excel es dependencia actual de remisiones.
11. VISO y ANIMA dependen de datos laborales consistentes.
12. Shopify, Rappi, ManyChat, bancos, mensajerías, abogados y técnicos son dependencias externas.
13. Energía, internet, red, frío, hornos, vehículo, impresoras y datáfonos son dependencias físicas o tecnológicas críticas.
14. La falta de inventario confiable se propaga a compras, producción, remisiones y venta.
15. Las aplicaciones actuales dependen de transcripción manual.
16. La identidad compartida reduce la trazabilidad de las dependencias.
17. Existen cadenas críticas que atraviesan varias sedes y áreas.
18. Existen dependencias circulares entre inventario, compras, producción y adopción.
19. El diseño TO-BE deberá hacer visibles las esperas, bloqueos y responsables.
20. Ninguna dependencia AS-IS se convierte automáticamente en arquitectura definitiva.
21. Ninguna decisión autoriza integraciones, colas, redundancia, código, migraciones o cambios en Supabase.

---

#### 37. Criterios de aceptación

`OPS-AUD-011` podrá aprobarse cuando se confirme que:

- se identifican dependencias entre áreas, sedes, aplicaciones y terceros;
- se distinguen dependencias humanas, físicas, tecnológicas, documentales y externas;
- se documentan cadenas críticas;
- se identifican puntos únicos de falla;
- se identifica propagación de fallas;
- se registran dependencias informales;
- se documentan dependencias circulares;
- se identifican candidatos a contratos futuros sin diseñarlos;
- cada duda queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 38. Resultado y continuidad

Con la aprobación de `OPS-AUD-011` quedará establecida la línea base inicial de:

- dependencias entre sedes;
- dependencias entre áreas;
- aplicaciones críticas;
- dispositivos;
- red;
- energía;
- equipos;
- proveedores;
- mensajerías;
- bancos;
- abogados;
- técnicos;
- personas clave;
- puntos únicos de falla;
- cadenas de propagación;
- dependencias circulares;
- candidatos a contratos entre aplicaciones.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-012
— Identificar puntos de doble digitación y conciliación manual
```

`OPS-AUD-012` deberá utilizar este mapa para documentar dónde una misma información se copia, interpreta, compara o reconcilia entre herramientas, documentos, sedes y responsables.



### ✅ OPS-AUD-012 — Identificar puntos de doble digitación y conciliación manual

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de duplicación de captura, transcripción, comparación y regularización manual  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-011`  
**Validación pendiente:** `OPS-AUD-015` para campos, responsables, frecuencias o mecanismos no suficientemente confirmados

---

#### 1. Propósito

Identificar dónde la misma información:

- se registra más de una vez;
- se copia entre herramientas;
- se transcribe desde una plataforma hacia otra;
- se convierte en captura o fotografía;
- se compara manualmente;
- se suma o consolida fuera del sistema original;
- se corrige en una fuente sin actualizar las demás;
- se regulariza después mediante conteos, facturas o reportes.

La tarea deberá documentar:

- dato original;
- fuente de origen;
- fuente secundaria;
- actor que copia o compara;
- momento de la duplicación;
- motivo operativo;
- riesgo de divergencia;
- forma actual de conciliación;
- efecto cuando no coincide;
- sistema o proceso que debería resolverlo posteriormente.

```text
MISMO HECHO
→ DOS O MÁS REGISTROS
→ POSIBLE DIFERENCIA
→ COMPARACIÓN MANUAL
→ AJUSTE O DECISIÓN HUMANA
```

Esta tarea describe la realidad actual.

No define todavía:

- fuente de verdad objetivo;
- contrato de integración;
- sincronización automática;
- reconciliación contable futura;
- diseño de tablas;
- eventos;
- colas;
- RPC;
- pantallas;
- implementación.

---

#### 2. Definiciones canónicas

##### 2.1. Doble digitación

La misma información se escribe nuevamente en otra herramienta o documento.

Ejemplo:

```text
PEDIDO RAPPI
→ CAJERO TRANSCRIBE A MAKOS
```

##### 2.2. Duplicación documental

La misma operación existe en varios artefactos.

Ejemplo:

```text
SOLICITUD EN EXCEL
+
CAPTURA
+
MENSAJE DE WHATSAPP
+
REMISIÓN FÍSICA
+
REGISTRO EN VENTO OS
```

##### 2.3. Conciliación manual

Una persona compara fuentes para determinar cuál representa mejor la realidad.

Ejemplo:

```text
CIERRE MAKOS
↔ EFECTIVO FÍSICO
```

##### 2.4. Consolidación manual

Varias entradas se suman o combinan fuera de un sistema estructurado.

Ejemplo:

```text
SOLICITUDES DE SEDES
→ TOTAL EN TABLERO O TELÉFONO
```

##### 2.5. Regularización posterior

La diferencia se corrige después de que el hecho físico ya ocurrió.

Ejemplo:

```text
INVENTARIO DIGITAL INCORRECTO
→ CONTEO FÍSICO
→ AJUSTE POSTERIOR
```

##### 2.6. Divergencia

Dos fuentes que deberían representar el mismo hecho contienen valores distintos.

---

#### 3. Clasificación de puntos de duplicación

| Código   | Tipo                   | Definición                                                |
| -------- | ---------------------- | --------------------------------------------------------- |
| `DD-CAP` | Captura duplicada      | El dato se escribe nuevamente                             |
| `DD-IMG` | Conversión a imagen    | El archivo se reemplaza por fotografía o captura          |
| `DD-TRN` | Transcripción          | El dato se copia entre plataformas                        |
| `DD-CNS` | Consolidación          | Varias fuentes se suman manualmente                       |
| `DD-IMP` | Impresión              | Un registro digital se convierte en papel operativo       |
| `DD-REC` | Reconciliación         | Se comparan fuentes para aceptar una                      |
| `DD-AJU` | Ajuste                 | Se corrige una diferencia                                 |
| `DD-REP` | Reporte derivado       | Se exporta o reconstruye información                      |
| `DD-MEM` | Memoria humana         | La información se retiene sin artefacto estructurado      |
| `DD-VER` | Confirmación verbal    | Un dato se transmite sin vínculo digital                  |
| `DD-PAR` | Registro paralelo      | Dos procesos se mantienen simultáneamente                 |
| `DD-CON` | Contabilidad posterior | Un soporte operativo se carga después al sistema contable |

---

#### 4. Estado de evidencia

| Estado               | Significado                                              |
| -------------------- | -------------------------------------------------------- |
| `CONFIRMADO`         | La duplicación o conciliación está descrita directamente |
| `CONFIRMADO_PARCIAL` | Existe, pero faltan campos, frecuencia o responsables    |
| `TRANSITORIO`        | Se usa durante pruebas o coexistencia                    |
| `PROBABLE`           | Es razonable, pero no fue confirmado                     |
| `POR_VALIDAR`        | Debe verificarse en `OPS-AUD-015`                        |
| `AUSENTE`            | No existe conciliación aunque debería existir            |

---

#### 5. Inventario maestro

| Código    | Proceso                  | Fuente 1                   | Fuente 2 o destino              | Tipo                  | Estado               |
| --------- | ------------------------ | -------------------------- | ------------------------------- | --------------------- | -------------------- |
| `DUP-001` | Solicitud de remisión    | Excel                      | Captura o fotografía            | `DD-IMG`              | `CONFIRMADO`         |
| `DUP-002` | Solicitud de remisión    | Captura                    | WhatsApp                        | `DD-PAR`              | `CONFIRMADO`         |
| `DUP-003` | Remisiones en prueba     | Excel/WhatsApp             | Hoja física                     | `DD-PAR`              | `TRANSITORIO`        |
| `DUP-004` | Remisiones en prueba     | Hoja física                | Vento OS                        | `DD-PAR`, `DD-CAP`    | `TRANSITORIO`        |
| `DUP-005` | Consolidación productiva | Solicitudes de sedes       | Tablero/teléfono                | `DD-CNS`              | `CONFIRMADO`         |
| `DUP-006` | Producción               | Consolidado                | Reporte por WhatsApp            | `DD-REP`              | `CONFIRMADO`         |
| `DUP-007` | Despacho                 | Reporte de producción      | Conteo físico del conductor     | `DD-REC`              | `CONFIRMADO`         |
| `DUP-008` | Recepción en sede        | Cantidad solicitada        | Cantidad física recibida        | `DD-REC`              | `CONFIRMADO_PARCIAL` |
| `DUP-009` | Compra                   | Necesidad de áreas         | Lista consolidada de Gerencia   | `DD-CNS`              | `CONFIRMADO_PARCIAL` |
| `DUP-010` | Compra                   | Pedido WhatsApp            | Confirmación del proveedor      | `DD-REC`              | `CONFIRMADO`         |
| `DUP-011` | Recepción proveedor      | Pedido acordado            | Factura del proveedor           | `DD-REC`              | `CONFIRMADO_PARCIAL` |
| `DUP-012` | Recepción proveedor      | Factura                    | Mercancía física                | `DD-REC`              | `CONFIRMADO`         |
| `DUP-013` | Contabilidad             | Factura física             | Sistema contable                | `DD-CON`, `DD-CAP`    | `CONFIRMADO`         |
| `DUP-014` | Venta Rappi              | Pedido Rappi               | Pedido Makos                    | `DD-TRN`              | `CONFIRMADO`         |
| `DUP-015` | Domicilio directo        | ManyChat                   | Pedido Makos                    | `DD-TRN`              | `CONFIRMADO`         |
| `DUP-016` | Venta                    | Pedido Makos               | Comandas impresas               | `DD-IMP`              | `CONFIRMADO`         |
| `DUP-017` | Pago tarjeta             | Datáfono                   | Makos                           | `DD-TRN`, `DD-VER`    | `CONFIRMADO`         |
| `DUP-018` | Cierre de Caja           | Makos                      | Cierre impreso                  | `DD-IMP`              | `CONFIRMADO`         |
| `DUP-019` | Cierre de Caja           | Cierre Makos               | Efectivo físico                 | `DD-REC`              | `CONFIRMADO`         |
| `DUP-020` | Efectivo                 | Entrega a Gerencia         | Registro como gasto o retiro    | `DD-CAP`, `DD-AJU`    | `CONFIRMADO`         |
| `DUP-021` | Propinas                 | Reporte de asistencia      | Cálculo manual                  | `DD-CNS`, `DD-CAP`    | `CONFIRMADO`         |
| `DUP-022` | Nómina                   | Información preparada      | Bancolombia Nóminas             | `DD-CAP`              | `CONFIRMADO_PARCIAL` |
| `DUP-023` | Asistencia               | Check-in ANIMA             | Reporte VISO                    | `DD-REP`              | `CONFIRMADO`         |
| `DUP-024` | Accesos                  | Solicitud informal         | Creación manual en aplicaciones | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-025` | Marketing                | Solicitud WhatsApp/verbal  | Pieza final                     | `DD-MEM`, `DD-CAP`    | `CONFIRMADO_PARCIAL` |
| `DUP-026` | Vaila Vainilla           | Pedido Shopify             | Preparación y despacho manual   | `DD-CAP`, `DD-MEM`    | `CONFIRMADO_PARCIAL` |
| `DUP-027` | Inventario piloto        | Conteo inicial             | Stock digital                   | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-028` | Inventario piloto        | Retiros físicos            | Registro kiosco                 | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-029` | Inventario               | Stock digital              | Conteo físico                   | `DD-REC`, `DD-AJU`    | `CONFIRMADO`         |
| `DUP-030` | Merma                    | Producto físico descartado | Hoja manual                     | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-031` | Transferencia a Molka    | Movimiento físico          | Comunicación verbal             | `DD-VER`              | `CONFIRMADO`         |
| `DUP-032` | Soporte técnico          | Incidente WhatsApp/verbal  | Memoria del responsable         | `DD-MEM`              | `CONFIRMADO`         |
| `DUP-033` | Mantenimiento            | Reporte informal           | Factura o comprobante           | `DD-CON`              | `PROBABLE`           |
| `DUP-034` | Canastas                 | Ubicación física           | Reconocimiento visual           | `DD-MEM`              | `CONFIRMADO`         |
| `DUP-035` | Disponibilidad de venta  | Inventario físico/vitrina  | Catálogo Makos                  | `DD-REC` ausente      | `CONFIRMADO`         |
| `DUP-036` | Productos agotados       | Estado físico              | Eliminación manual en Makos     | `DD-AJU`              | `CONFIRMADO`         |
| `DUP-037` | Venta sustituida         | Producto eliminado         | Nuevo pedido adicional          | `DD-PAR`              | `CONFIRMADO`         |
| `DUP-038` | Recepción interna        | Despachado                 | Recibido                        | `DD-REC` insuficiente | `CONFIRMADO_PARCIAL` |
| `DUP-039` | Producción               | Solicitado                 | Producido                       | `DD-REC` informal     | `CONFIRMADO_PARCIAL` |
| `DUP-040` | Logística                | Producido                  | Cargado                         | `DD-REC` manual       | `CONFIRMADO`         |
| `DUP-041` | Pagos y gastos           | Efectivo entregado         | Factura posterior               | `DD-REC`              | `CONFIRMADO`         |
| `DUP-042` | Reclutamiento            | Hoja de vida               | Datos enviados a abogados       | `DD-CAP`              | `CONFIRMADO_PARCIAL` |
| `DUP-043` | Turnos                   | Programación de Gerencia   | Publicación VISO                | `DD-CAP`              | `CONFIRMADO`         |
| `DUP-044` | Incidencias de acceso    | Estado laboral             | Estado de cuenta                | `DD-REC` ausente      | `CONFIRMADO`         |

---

#### 6. Remisiones internas

##### 6.1. Excel → captura → WhatsApp

El dato original se registra en Excel.

Después:

```text
EXCEL
→ CAPTURA
→ WHATSAPP
→ INTERPRETACIÓN HUMANA
```

En esta transformación pueden perderse:

- fórmulas;
- validaciones;
- filas ocultas;
- versión;
- autor;
- fecha de modificación;
- identificadores;
- capacidad de búsqueda.

La captura se convierte en la referencia operativa aunque el archivo original cambie.

##### 6.2. Registro paralelo durante pruebas

En la transición coexistieron:

- solicitud en Excel;
- captura;
- hoja física;
- Vento OS.

Cada soporte podía representar un estado distinto.

```text
CUATRO FUENTES
→ SIN IDENTIFICADOR COMÚN
→ CONCILIACIÓN POR PERSONAS
```

Este esquema se clasifica como transitorio, no como diseño permanente.

##### 6.3. Solicitado → producido → despachado → recibido

Actualmente estas cantidades pueden existir en fuentes distintas:

| Etapa       | Fuente actual          |
| ----------- | ---------------------- |
| Solicitado  | Excel/captura          |
| Consolidado | tablero/teléfono       |
| Producido   | mensaje o conteo       |
| Cargado     | conteo del conductor   |
| Recibido    | conteo en sede         |
| Diferencia  | conversación posterior |

No existe una conciliación estructurada que conecte las cinco etapas.

---

#### 7. Consolidación de producción

##### 7.1. Suma manual por área

El responsable productivo toma varias solicitudes y calcula un total.

```text
VENTO CAFÉ
+
SAUDO
+
MOLKA
→ TOTAL MANUAL
```

Riesgos:

- doble conteo;
- omisión;
- suma incorrecta;
- uso de una versión anterior;
- pérdida del desglose por sede.

##### 7.2. Reporte final frente a producto físico

El área puede publicar un total producido.

El conductor cuenta físicamente y organiza.

El reporte no es necesariamente la fuente del despacho.

```text
PRODUCCIÓN REPORTADA
↔ PRODUCCIÓN ENCONTRADA
↔ PRODUCCIÓN CARGADA
```

No existe conciliación formal confirmada.

##### 7.3. Distribución de faltantes y sobrantes

Cuando no alcanza:

- se distribuye lo disponible;
- se prioriza por sede;
- se explica después si preguntan.

Cuando sobra:

- se conserva;
- se redistribuye;
- se envía a Molka;
- se informa ocasionalmente.

No existe una conciliación de saldo pendiente o excedente.

---

#### 8. Compras y proveedores

##### 8.1. Necesidad → lista de compra

Las necesidades nacen en varias áreas.

Gerencia las consolida mediante:

- preguntas;
- WhatsApp;
- experiencia;
- memoria;
- notas.

La consolidación puede cambiar nombres, cantidades o prioridades.

##### 8.2. Lista → pedido al proveedor

El pedido se escribe de nuevo en WhatsApp.

No existe evidencia de que el proveedor reciba un documento estructurado idéntico a la lista interna.

##### 8.3. Pedido → confirmación

El proveedor responde:

- disponibilidad;
- precio;
- fecha;
- cantidad.

La conversación produce una versión final implícita.

No existe un documento consolidado confirmado con:

```text
SOLICITADO
→ MODIFICADO
→ CONFIRMADO
```

##### 8.4. Confirmado → factura

Cuando llega la mercancía, la factura se compara con el físico.

No se confirmó una comparación sistemática contra el pedido acordado.

Por tanto, pueden existir tres fuentes:

1. conversación de compra;
2. factura;
3. mercancía física.

##### 8.5. Factura → sistema contable

La información se carga nuevamente.

Riesgos:

- digitación incorrecta;
- clasificación errada;
- soporte faltante;
- duplicado;
- fecha distinta;
- centro de costo equivocado.

---

#### 9. Inventario

##### 9.1. Conteo inicial

El inventario físico se registra digitalmente.

Este proceso es una primera digitación necesaria, pero se convierte en duplicación problemática cuando:

- el físico cambia;
- no se registran todos los movimientos;
- el sistema sigue mostrando el dato anterior.

##### 9.2. Retiros

El retiro físico y el registro en kiosco deben representar el mismo hecho.

El piloto falló porque:

- algunos retiros se registraron;
- otros movimientos no;
- recepciones y producción no se capturaron integralmente.

Resultado:

```text
FÍSICO
≠
DIGITAL
```

##### 9.3. Conteo correctivo

Cuando el stock digital pierde confiabilidad, la única referencia vuelve a ser el conteo físico.

La conciliación se hace:

```text
STOCK SISTEMA
↔ CONTEO
→ DIFERENCIA
→ AJUSTE
```

No existe procedimiento estable confirmado para autorizar o explicar el ajuste.

##### 9.4. Sobrantes en áreas

El inventario puede permanecer:

- en Bodega;
- en Cocina;
- en Barra;
- en áreas productivas;
- en canastas;
- en frío.

El sistema no refleja necesariamente esas ubicaciones.

La conciliación depende de búsqueda física.

---

#### 10. Ventas y Makos

##### 10.1. Rappi → Makos

El cajero transcribe manualmente:

- productos;
- cantidades;
- observaciones;
- clasificación del canal.

Riesgos:

- producto omitido;
- cantidad errada;
- observación perdida;
- pedido duplicado;
- cambio no replicado.

##### 10.2. ManyChat → Makos

El pedido directo puede contener:

- cliente;
- dirección;
- teléfono;
- productos;
- forma de pago.

Caja vuelve a escribir la información en Makos.

No existe vínculo automático entre conversación y pedido.

##### 10.3. Makos → comanda impresa

Makos genera una representación física para Cocina, Bar o Barra.

Cuando la comanda:

- no imprime;
- se pierde;
- se duplica;
- se modifica;

el equipo debe reconciliar con la pantalla o comunicación verbal.

##### 10.4. Producto físico → disponibilidad en Makos

Makos puede mostrar un producto disponible aunque esté agotado.

La conciliación actual ocurre visualmente.

```text
CATÁLOGO MAKOS
↔ VITRINA O STOCK FÍSICO
```

No existe actualización automática.

##### 10.5. Eliminación → sustitución

Cuando falta un producto:

1. Caja elimina la línea;
2. escribe un comentario;
3. Servicio acuerda reemplazo;
4. agrega un nuevo pedido.

Son dos operaciones relacionadas solo por contexto humano.

---

#### 11. Pagos y Caja

##### 11.1. Datáfono → Makos

El pago con tarjeta ocurre en el datáfono.

Después el cajero registra el medio de pago en Makos.

La conciliación depende de aviso verbal.

Riesgos:

- pago aprobado no registrado;
- medio equivocado;
- duplicado;
- mesa abierta;
- pago rechazado registrado.

##### 11.2. Makos → cierre impreso

El cierre digital se imprime para acompañar el efectivo.

El papel se convierte en soporte de conciliación.

##### 11.3. Cierre → efectivo

Gerencia compara:

- total del cierre;
- efectivo entregado;
- base retenida;
- pagos registrados.

No se confirmó un documento estructurado de diferencias.

##### 11.4. Retiro → gasto

Un retiro de efectivo entregado a Gerencia puede registrarse como gasto.

Esto crea divergencia entre:

- naturaleza operativa;
- clasificación en Makos;
- registro contable;
- custodia real.

##### 11.5. Efectivo → factura

Cuando Gerencia utiliza dinero, el soporte llega después.

La conciliación depende de que cada salida tenga factura.

---

#### 12. Contabilidad

##### 12.1. Soportes múltiples

Contabilidad puede recibir:

- factura de proveedor;
- comprobante;
- cierre;
- Excel;
- reporte de Makos;
- información bancaria.

La misma operación puede aparecer en varios soportes.

##### 12.2. Conciliación posterior

Las diferencias se detectan después mediante revisión.

Esto puede identificar:

- factura faltante;
- gasto duplicado;
- clasificación incorrecta;
- valor distinto;
- soporte sin relación clara.

##### 12.3. Ausencia de identificador común

No existe evidencia de una clave única compartida entre:

- compra;
- recepción;
- factura;
- pago;
- movimiento de inventario;
- registro contable.

La conciliación depende de fecha, proveedor, valor y memoria.

---

#### 13. Turnos, asistencia, propinas y nómina

##### 13.1. Programación → VISO

Gerencia define el horario y luego lo registra o publica en VISO.

Debe validarse si existe una herramienta previa o si la programación nace directamente allí.

##### 13.2. ANIMA → VISO

El trabajador hace check-in en ANIMA.

Gerencia consulta reportes en VISO.

Esta derivación es legítima si existe integración consistente.

Las correcciones no están documentadas.

##### 13.3. Reporte → propinas

La información de retrasos y ausencias se utiliza para calcular propinas manualmente.

```text
REPORTE DE ASISTENCIA
→ CÁLCULO EXTERNO
→ AJUSTE
→ ENTREGA EN EFECTIVO
```

No existe vínculo entre cada novedad y cada descuento.

##### 13.4. Nómina → banco

La información de nómina se prepara y luego se carga en Bancolombia Nóminas.

No se confirmó:

- archivo;
- campos;
- revisión;
- conciliación posterior.

---

#### 14. Accesos

##### 14.1. Solicitud informal → creación técnica

Gerencia comunica datos.

El Jefe de Operaciones vuelve a registrarlos en:

- ANIMA;
- Vento OS;
- otras cuentas necesarias.

Riesgos:

- nombre distinto;
- correo equivocado;
- sede incorrecta;
- área incorrecta;
- permiso incompleto;
- falta de fecha.

##### 14.2. Estado laboral → estado de acceso

No existe conciliación automática entre:

- trabajador activo;
- contrato;
- asignación;
- cuentas;
- sesiones.

El retiro puede existir en la realidad y no reflejarse en tecnología.

##### 14.3. Múltiples aplicaciones

La misma persona puede requerir alta o baja en varias plataformas.

Sin un evento central, la actualización se repite manualmente.

---

#### 15. Marketing

##### 15.1. Solicitud → interpretación

La solicitud puede ser verbal o por WhatsApp.

El trabajador convierte esa instrucción en:

- fotografía;
- video;
- diseño;
- texto;
- publicación.

No existe un brief estructurado que permita conciliar:

```text
SOLICITADO
↔ PRODUCIDO
↔ APROBADO
↔ PUBLICADO
```

##### 15.2. Correcciones

Las modificaciones se comunican informalmente.

No existe control de versiones confirmado.

---

#### 16. Vaila Vainilla

##### 16.1. Shopify → operación física

El pedido digital debe convertirse en:

- picking;
- empaque;
- etiqueta o guía;
- lote de despacho;
- entrega a mensajería.

Parte de esa información puede volver a capturarse manualmente.

##### 16.2. Pedido → inventario

No se confirmó una conciliación entre:

- pedido;
- stock;
- producto empacado;
- producto entregado.

##### 16.3. Mensajería → cierre

No se confirmó una relación automática con:

- guía;
- estado;
- prueba de entrega;
- devolución;
- reembolso.

---

#### 17. Soporte técnico y mantenimiento

##### 17.1. Reporte → diagnóstico

El incidente llega por WhatsApp o verbalmente.

El diagnóstico y solución quedan en memoria.

No existe ticket que consolide:

- reporte;
- activo;
- causa;
- acciones;
- repuesto;
- cierre.

##### 17.2. Mantenimiento → factura

La reparación física puede producir una factura posterior.

No existe registro estructurado que relacione:

- falla;
- técnico;
- diagnóstico;
- reparación;
- repuesto;
- costo;
- garantía.

---

#### 18. Canastas y logística física

##### 18.1. Identidad visual

Las canastas se reconocen por:

- color;
- forma;
- marca;
- experiencia.

No existe un registro digital equivalente.

##### 18.2. Conteo

No existe conciliación sistemática entre:

- canastas enviadas;
- canastas recibidas;
- canastas retornadas;
- canastas lavadas;
- canastas perdidas.

##### 18.3. Estado

El estado se determina visualmente.

No existe registro de:

- sucia;
- en lavado;
- húmeda;
- seca;
- disponible;
- en tránsito.

---

#### 19. Conciliaciones críticas

##### 19.1. Remisiones

```text
SOLICITADO
↔ CONSOLIDADO
↔ PRODUCIDO
↔ CARGADO
↔ RECIBIDO
```

##### 19.2. Inventario

```text
ENTRADAS
+
PRODUCCIÓN
+
RETIROS
+
VENTAS
+
MERMAS
+
TRANSFERENCIAS
↔
CONTEO FÍSICO
```

##### 19.3. Ventas

```text
CANAL EXTERNO
↔ MAKOS
↔ COMANDA
↔ FACTURA
↔ PAGO
```

##### 19.4. Caja

```text
VENTAS
↔ MEDIOS DE PAGO
↔ CIERRE
↔ EFECTIVO
↔ RETIROS
↔ GASTOS
```

##### 19.5. Compras

```text
NECESIDAD
↔ PEDIDO
↔ CONFIRMACIÓN
↔ RECEPCIÓN
↔ FACTURA
↔ PAGO
↔ INVENTARIO
```

##### 19.6. Laboral

```text
CONTRATACIÓN
↔ TRABAJADOR
↔ TURNO
↔ ASISTENCIA
↔ PROPINA
↔ NÓMINA
↔ ACCESOS
```

---

#### 20. Puntos sin conciliación suficiente

1. remisión solicitada frente a recibida;
2. producción reportada frente a cargada;
3. cargado frente a recibido;
4. transferencias a Molka;
5. sobrantes por área;
6. inventario digital frente a físico;
7. producto disponible frente a Makos;
8. Rappi frente a Makos;
9. ManyChat frente a Makos;
10. datáfono frente a medio registrado;
11. retiro de efectivo frente a gasto;
12. factura frente a compra original;
13. factura frente a inventario recibido;
14. reporte de asistencia frente a descuento de propina;
15. estado laboral frente a cuentas activas;
16. pedido Shopify frente a inventario;
17. paquete entregado frente a entrega final;
18. canastas por sede;
19. mantenimiento realizado frente a activo;
20. soporte resuelto frente a historial técnico.

---

#### 21. Causas principales de doble digitación

##### 21.1. Aplicaciones aisladas

Cada herramienta resuelve una parte del proceso.

##### 21.2. Falta de integración

No existe intercambio automático entre:

- Rappi y Makos;
- ManyChat y Makos;
- operación y Contabilidad;
- asistencia y propinas;
- Shopify y logística;
- estado laboral y accesos.

##### 21.3. Uso de imágenes

La captura reemplaza el dato estructurado.

##### 21.4. Papel como puente

El cierre, factura o remisión física conecta sistemas.

##### 21.5. Falta de fuente de verdad

Las personas comparan varias fuentes para decidir.

##### 21.6. Implementación parcial

Vento OS registra algunos eventos, pero no el ciclo completo.

##### 21.7. Identidad compartida

El dato debe reconstruirse porque el sistema no identifica a la persona efectiva.

---

#### 22. Consecuencias operativas

- errores de cantidad;
- información desactualizada;
- pérdida de tiempo;
- imposibilidad de saber cuál versión es válida;
- conciliaciones posteriores;
- inventario incorrecto;
- compras urgentes;
- faltantes;
- cobros errados;
- diferencias de Caja;
- soportes faltantes;
- baja trazabilidad;
- dependencia de personas;
- retraso de decisiones;
- dificultad para medir rendimiento;
- desconfianza en las aplicaciones.

---

#### 23. Consecuencias técnicas

- múltiples fuentes de verdad;
- registros huérfanos;
- ausencia de IDs compartidos;
- estados inconsistentes;
- datos duplicados;
- imposibilidad de sincronización segura;
- necesidad de ajustes manuales;
- reportes contradictorios;
- auditoría incompleta;
- riesgo de reintentos duplicados;
- dificultad para migrar.

---

#### 24. Reglas futuras que deberá considerar el TO-BE

Esta sección no diseña la solución; identifica principios obligatorios.

##### 24.1. Una captura no deberá sustituir al registro estructurado

##### 24.2. Toda operación deberá tener identificador común

##### 24.3. Los sistemas externos deberán conservar referencia cruzada

##### 24.4. La corrección deberá conservar original y ajuste

##### 24.5. La conciliación deberá distinguir diferencia esperada y anomalía

##### 24.6. El dato no deberá volver a escribirse cuando pueda reutilizarse

##### 24.7. El papel podrá ser salida o contingencia, no fuente paralela indefinida

##### 24.8. Cada fuente deberá declarar autoridad y alcance

##### 24.9. La sincronización deberá ser idempotente

##### 24.10. Los procesos parciales deberán mostrar pendientes, no aparentar cierre

---

#### 25. Candidatos a fuente de verdad futura

No se aprueban todavía; se registran para diseño posterior.

| Dominio                 | Candidato futuro                        |
| ----------------------- | --------------------------------------- |
| Identidad y acceso      | SHELL / modelo central de identidad     |
| Turnos y asistencia     | VISO + ANIMA según contrato             |
| Inventario y remisiones | NEXO                                    |
| Producción              | FOGO                                    |
| Compras y recepciones   | ORIGO                                   |
| Venta y POS             | PULSO o contrato temporal Makos         |
| Contabilidad y costos   | NUMERA                                  |
| Clientes y fidelización | PASS                                    |
| Vaila Vainilla          | Shopify integrado con contratos propios |
| Indicadores             | VISO                                    |
| Eventos transversales   | Infraestructura compartida de Vento OS  |

La decisión final corresponde a E2, E3, X y fases funcionales.

---

#### 26. Métricas necesarias

##### 26.1. Doble digitación

- campos copiados por proceso;
- minutos de transcripción;
- actores involucrados;
- errores detectados;
- correcciones;
- duplicados;
- pedidos omitidos.

##### 26.2. Conciliación

- conciliaciones por período;
- tiempo invertido;
- diferencias encontradas;
- valor económico;
- tiempo hasta cierre;
- fuente elegida como válida.

##### 26.3. Calidad de datos

- registros sin ID;
- registros sin actor;
- registros sin sede;
- diferencias de cantidades;
- documentos sin soporte;
- cuentas activas sin trabajador.

---

#### 27. Validaciones pendientes para `OPS-AUD-015`

| Tema              | Validación                                   |
| ----------------- | -------------------------------------------- |
| Remisiones        | Cuántos soportes se usan simultáneamente hoy |
| Producción        | Cómo se calcula y conserva el consolidado    |
| Recepción interna | Cómo se confirma diferencia                  |
| Compras           | Formato real de lista y pedido               |
| Proveedores       | Comparación contra pedido original           |
| Contabilidad      | Campos digitados y sistemas utilizados       |
| Rappi             | Campos transcritos                           |
| ManyChat          | Campos transcritos                           |
| Datáfono          | Comprobantes y conciliación                  |
| Caja              | Procedimiento de diferencias                 |
| Propinas          | Herramienta de cálculo                       |
| Nómina            | Archivo o captura bancaria                   |
| Accesos           | Aplicaciones actualizadas por persona        |
| Vaila Vainilla    | Guías, inventario y mensajería               |
| Mantenimiento     | Relación entre factura y activo              |
| Canastas          | Existencia de conteos informales             |
| Makos             | Reportes exportados y conciliados            |

---

#### 28. Relación con `OPS-AUD-013`

`OPS-AUD-013` deberá identificar qué información se pierde durante cada copia o conciliación.

Ejemplos:

- autor;
- hora;
- versión;
- producto canónico;
- actor efectivo;
- motivo;
- estado;
- origen;
- destino;
- relación entre eventos.

---

#### 29. Relación con `OPS-AUD-014`

`OPS-AUD-014` deberá diferenciar:

- duplicación innecesaria;
- respaldo de contingencia;
- operación offline;
- registro temporal durante una caída;
- reconciliación posterior obligatoria.

No todo registro paralelo es incorrecto si existe una contingencia controlada.

---

#### 30. Hallazgos transversales

##### 30.1. La misma operación cambia varias veces de soporte

```text
ARCHIVO
→ IMAGEN
→ CHAT
→ TABLERO
→ PAPEL
→ SISTEMA
```

##### 30.2. La conciliación ocurre tarde

Muchas diferencias se descubren cuando:

- llega la sede;
- se cuenta Caja;
- se hace inventario;
- Contabilidad revisa;
- el cliente reclama;
- falta un producto.

##### 30.3. El dato estructurado se degrada

Excel o plataforma externa contienen campos; la captura o conversación los reduce a información visual.

##### 30.4. El físico sigue siendo la referencia final

Cuando sistema y operación difieren, prevalece:

- conteo;
- producto visible;
- efectivo;
- factura;
- observación.

##### 30.5. La doble digitación oculta responsabilidades

No siempre se sabe quién produjo el error:

- origen;
- transcripción;
- ejecución;
- conciliación.

##### 30.6. El registro paralelo puede generar cierres falsos

Un proceso puede aparecer completo en una fuente y pendiente en otra.

##### 30.7. El problema no es únicamente técnico

También proviene de:

- reglas no definidas;
- propietarios ambiguos;
- falta de identificadores;
- procesos incompletos;
- transición sin cierre.

---

#### 31. Matriz de prioridad inicial

| Prioridad | Puntos                                                         |
| --------- | -------------------------------------------------------------- |
| `P0`      | Inventario físico/digital, pagos, Caja, estado laboral/accesos |
| `P1`      | Remisiones, producción, despacho, recepción, compras           |
| `P2`      | Rappi, ManyChat, Contabilidad, propinas, Vaila Vainilla        |
| `P3`      | Marketing, soporte, mantenimiento, canastas                    |

La prioridad es documental y deberá validarse mediante criticidad, frecuencia e impacto.

---

#### 32. Matriz de destino de hallazgos

| Hallazgo                                             | Tarea exacta                      |
| ---------------------------------------------------- | --------------------------------- |
| Información perdida durante la copia                 | `OPS-AUD-013`                     |
| Registro paralelo por contingencia                   | `OPS-AUD-014`                     |
| Campos y procesos no confirmados                     | `OPS-AUD-015`                     |
| Mapa de capacidades                                  | `CAP-MAP-001` a `CAP-MAP-015`     |
| Auditoría de integraciones y duplicaciones de código | `CODE-AUD-001` a `CODE-AUD-020`   |
| Definición de aplicación propietaria                 | `CAP-SCOPE-001` a `CAP-SCOPE-019` |
| Cobertura faltante                                   | `CAP-COVER-001` a `CAP-COVER-012` |
| Consolidación de brechas                             | `GAP-CTRL-001`                    |
| Vinculación con paquete futuro                       | `GAP-CTRL-006`                    |
| Fuente de verdad y flujo TO-BE                       | BLOQUE E2                         |
| Identificadores, eventos y reconciliación            | BLOQUE E3                         |
| Integraciones, colas e idempotencia                  | BLOQUE E4 y BLOQUE X              |
| Transición y coexistencia                            | BLOQUE E5                         |

---

#### 33. Decisiones propuestas

1. Excel, captura y WhatsApp se consideran artefactos distintos de una misma solicitud.
2. La coexistencia de papel y Vento OS se clasifica como transición, no como modelo permanente.
3. El consolidado productivo constituye una segunda representación de las solicitudes.
4. El reporte de producción y el conteo del conductor no están conciliados formalmente.
5. Solicitado, producido, cargado y recibido no comparten actualmente un registro único.
6. La lista de compra, el pedido, la confirmación, la factura y la recepción son fuentes separadas.
7. Rappi y ManyChat requieren transcripción manual a Makos.
8. El datáfono y Makos dependen de registro y confirmación humana.
9. El cierre de Makos se concilia manualmente con efectivo.
10. La clasificación de retiro como gasto demuestra divergencia semántica.
11. Las facturas se vuelven a registrar en Contabilidad.
12. El inventario digital debe conciliarse con el físico porque los movimientos actuales son incompletos.
13. El reporte de asistencia alimenta un cálculo manual de propinas.
14. La nómina requiere carga posterior en Bancolombia.
15. Las altas y bajas se repiten por aplicación.
16. El estado laboral no está conciliado automáticamente con los accesos.
17. Shopify no tiene conciliación confirmada con inventario y mensajería.
18. Soporte y mantenimiento carecen de un registro que conecte inicio, ejecución y cierre.
19. Las canastas no cuentan con conciliación por ubicación o estado.
20. El TO-BE deberá eliminar duplicación innecesaria y conservar únicamente la redundancia controlada.
21. Ninguna decisión autoriza integraciones, fuentes de verdad definitivas, código, migraciones o cambios en Supabase.

---

#### 34. Criterios de aceptación

`OPS-AUD-012` podrá aprobarse cuando se confirme que:

- se identifican los principales puntos de doble digitación;
- se documentan conciliaciones manuales;
- se distinguen captura, transcripción, consolidación, impresión, ajuste y registro paralelo;
- se cubren remisiones, producción, compras, inventario, ventas, Caja, Contabilidad, trabajo, accesos y terceros;
- se identifican puntos sin conciliación suficiente;
- se documentan consecuencias operativas y técnicas;
- las cifras o campos no confirmados quedan vinculados a `OPS-AUD-015`;
- cada brecha tiene destino documental;
- no se ha definido todavía la fuente de verdad TO-BE;
- no se ha autorizado implementación.

---

#### 35. Resultado y continuidad

Con la aprobación de `OPS-AUD-012` quedará establecida la línea base inicial de:

- datos capturados más de una vez;
- transcripciones entre plataformas;
- documentos paralelos;
- consolidaciones manuales;
- conciliaciones;
- ajustes posteriores;
- divergencias;
- registros sin identificador común;
- puntos sin conciliación;
- prioridades de corrección;
- candidatos a fuentes de verdad futuras.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-013
— Identificar pérdidas de trazabilidad, información y responsabilidad
```

`OPS-AUD-013` deberá utilizar este inventario para determinar exactamente qué datos, actores, causas, estados y responsabilidades se pierden durante cada traspaso, copia, corrección o conciliación.



### ✅ OPS-AUD-013 — Identificar pérdidas de trazabilidad, información y responsabilidad

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de pérdidas de trazabilidad, degradación de información y vacíos de responsabilidad  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-012`  
**Validación pendiente:** `OPS-AUD-015` para actores, campos, custodios, procedimientos o consecuencias no suficientemente confirmados

---

#### 1. Propósito

Identificar en qué puntos de la operación actual se pierde la capacidad de responder de forma inequívoca:

- qué ocurrió;
- quién lo hizo;
- quién lo ordenó;
- quién lo aprobó;
- cuándo ocurrió;
- dónde ocurrió;
- sobre qué producto, dinero, documento, activo o trabajador;
- cuál era el estado anterior;
- cuál fue el estado posterior;
- por qué cambió;
- qué evidencia lo respalda;
- quién quedó responsable;
- qué proceso debía continuar;
- qué quedó pendiente.

La tarea deberá diferenciar tres problemas relacionados, pero no equivalentes:

```text
PÉRDIDA DE TRAZABILIDAD
→ no se puede reconstruir el recorrido completo

PÉRDIDA DE INFORMACIÓN
→ un dato se omite, degrada, transforma o desaparece

PÉRDIDA DE RESPONSABILIDAD
→ no se puede atribuir decisión, ejecución, custodia o corrección
```

Esta tarea describe el estado actual.

No define todavía:

- modelo de auditoría objetivo;
- campos definitivos;
- eventos de dominio;
- retención;
- permisos;
- RLS;
- firma electrónica;
- evidencia inmutable;
- arquitectura de observabilidad;
- implementación.

---

#### 2. Principio obligatorio

Una operación no se considera trazable únicamente porque exista un mensaje, una factura, una captura o un registro en una aplicación.

La trazabilidad suficiente requiere poder relacionar:

```text
ACTOR
+
ACCIÓN
+
OBJETO
+
CONTEXTO
+
FECHA Y HORA
+
ESTADO ANTERIOR
+
ESTADO POSTERIOR
+
MOTIVO
+
EVIDENCIA
+
RESPONSABILIDAD
```

La ausencia de cualquiera de estos elementos puede ser tolerable en procesos de baja sensibilidad, pero es crítica cuando afecta:

- dinero;
- inventario;
- seguridad alimentaria;
- acceso;
- nómina;
- facturación;
- compras;
- producción;
- clientes;
- activos;
- obligaciones legales o contables.

---

#### 3. Tipos de pérdida

##### 3.1. Pérdida de identidad

No se conoce la persona efectiva que realizó la acción.

Ejemplos:

- cuenta compartida;
- dispositivo compartido;
- sesión abierta;
- acción registrada a nombre de una función.

##### 3.2. Pérdida de contexto

No se conoce:

- sede;
- área;
- turno;
- dispositivo;
- rol operativo;
- aplicación;
- proceso;
- recurso afectado.

##### 3.3. Pérdida temporal

No existe fecha u hora suficiente para ordenar los hechos.

##### 3.4. Pérdida de causalidad

No se puede relacionar:

- una solicitud con su producción;
- una compra con su recepción;
- una venta con su pago;
- una merma con el lote;
- una baja laboral con la revocación de acceso.

##### 3.5. Pérdida de versión

No se sabe cuál archivo, captura, mensaje o instrucción era la vigente.

##### 3.6. Pérdida de cantidad

No se distinguen cantidades:

- solicitadas;
- confirmadas;
- producidas;
- cargadas;
- recibidas;
- rechazadas;
- pendientes.

##### 3.7. Pérdida de motivo

La corrección, faltante, rechazo, anulación o ajuste carece de razón estructurada.

##### 3.8. Pérdida de custodia

No se sabe quién tuvo:

- dinero;
- factura;
- mercancía;
- canasta;
- equipo;
- acceso;
- documento.

##### 3.9. Pérdida de estado

No se conoce si un proceso está:

- pendiente;
- en curso;
- parcial;
- bloqueado;
- cancelado;
- cerrado;
- corregido.

##### 3.10. Pérdida de evidencia

La operación depende de memoria, conversación o percepción sin soporte durable.

##### 3.11. Pérdida de responsabilidad

No se puede determinar quién debía:

- iniciar;
- ejecutar;
- revisar;
- aprobar;
- recibir;
- corregir;
- escalar;
- cerrar.

---

#### 4. Clasificación de severidad

| Nivel            | Descripción                                                | Ejemplo                                            |
| ---------------- | ---------------------------------------------------------- | -------------------------------------------------- |
| `TR1 — MENOR`    | Dificulta consulta, pero el efecto es limitado             | No saber quién pidió una corrección de diseño      |
| `TR2 — MODERADA` | Genera reproceso o demora                                  | No identificar la versión vigente de una solicitud |
| `TR3 — ALTA`     | Afecta operación, inventario o servicio                    | No saber dónde ocurrió un faltante                 |
| `TR4 — CRÍTICA`  | Afecta dinero, acceso, cumplimiento o seguridad            | Cuenta activa de un trabajador retirado            |
| `TR5 — SEVERA`   | Puede producir pérdida legal, sanitaria o financiera grave | Merma sin lote o pago sin conciliación             |

---

#### 5. Clasificación del estado de evidencia

| Estado                | Significado                                         |
| --------------------- | --------------------------------------------------- |
| `CONFIRMADO`          | La pérdida fue descrita directamente                |
| `CONFIRMADO_PARCIAL`  | Existe evidencia, pero no se conoce todo su alcance |
| `INFERIDO_CONTROLADO` | Se deduce directamente de procesos ya confirmados   |
| `POR_VALIDAR`         | Debe confirmarse en `OPS-AUD-015`                   |
| `AUSENTE`             | No existe mecanismo identificado                    |
| `TRANSITORIO`         | Surge de coexistencia durante pruebas               |

---

#### 6. Inventario maestro de pérdidas

| Código     | Dominio                  | Pérdida principal                                                                     | Severidad | Estado                |
| ---------- | ------------------------ | ------------------------------------------------------------------------------------- | --------- | --------------------- |
| `LOSS-001` | Remisiones               | No existe ID común entre solicitud, producción, despacho y recepción                  | `TR4`     | `CONFIRMADO`          |
| `LOSS-002` | Remisiones               | Captura no conserva versión ni estructura del Excel                                   | `TR3`     | `CONFIRMADO`          |
| `LOSS-003` | Remisiones               | No se identifica siempre quién elaboró o modificó                                     | `TR3`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-004` | Producción               | Consolidado manual pierde desglose por sede                                           | `TR3`     | `CONFIRMADO`          |
| `LOSS-005` | Producción               | Reporte final no se relaciona con solicitud original                                  | `TR3`     | `CONFIRMADO`          |
| `LOSS-006` | Despacho                 | No se registra quién cambió cantidad o destino                                        | `TR4`     | `CONFIRMADO`          |
| `LOSS-007` | Recepción                | No existe confirmación estructurada de recibido                                       | `TR4`     | `CONFIRMADO`          |
| `LOSS-008` | Recepción                | No se distingue no producido, no cargado, no entregado o no recibido                  | `TR4`     | `CONFIRMADO`          |
| `LOSS-009` | Canastas                 | No existe historial de ubicación, custodio o estado                                   | `TR3`     | `CONFIRMADO`          |
| `LOSS-010` | Bodega                   | Retiro físico sin actor, cantidad y destino registrados                               | `TR5`     | `CONFIRMADO`          |
| `LOSS-011` | Inventario               | Stock digital no explica cada diferencia física                                       | `TR5`     | `CONFIRMADO`          |
| `LOSS-012` | Inventario               | Sobrantes permanecen en áreas sin ubicación trazable                                  | `TR4`     | `CONFIRMADO`          |
| `LOSS-013` | Merma                    | No se conserva lote, causa, aprobador ni evidencia                                    | `TR5`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-014` | Merma                    | Misma persona detecta, decide, descarta y registra                                    | `TR5`     | `CONFIRMADO`          |
| `LOSS-015` | Transferencia a Molka    | Sin origen, lote, vida útil, cantidad ni aceptación                                   | `TR5`     | `CONFIRMADO`          |
| `LOSS-016` | Compras                  | Lista, pedido y confirmación no comparten versión única                               | `TR4`     | `CONFIRMADO`          |
| `LOSS-017` | Compras                  | No se conoce siempre quién autorizó cambios de precio o cantidad                      | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-018` | Recepción proveedor      | Receptor sustituto y responsabilidad no formalizados                                  | `TR4`     | `POR_VALIDAR`         |
| `LOSS-019` | Proveedores              | Diferencia entre pedido, factura y físico no queda estructurada                       | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-020` | Contabilidad             | Soporte puede perder relación con compra, recepción y pago                            | `TR5`     | `CONFIRMADO`          |
| `LOSS-021` | Caja                     | Cuenta compartida no identifica al trabajador efectivo                                | `TR5`     | `CONFIRMADO`          |
| `LOSS-022` | Servicio                 | Pedido registrado no identifica siempre al mesero efectivo                            | `TR4`     | `CONFIRMADO`          |
| `LOSS-023` | Pago                     | Datáfono y Makos no comparten confirmación automática                                 | `TR5`     | `CONFIRMADO`          |
| `LOSS-024` | Pago                     | Aviso verbal no deja evidencia de quién procesó                                       | `TR5`     | `CONFIRMADO`          |
| `LOSS-025` | Caja                     | Diferencia de efectivo no tiene flujo documental confirmado                           | `TR5`     | `POR_VALIDAR`         |
| `LOSS-026` | Efectivo                 | Retiro registrado como gasto pierde naturaleza y custodia                             | `TR5`     | `CONFIRMADO`          |
| `LOSS-027` | Venta                    | Eliminación y sustitución no quedan vinculadas                                        | `TR4`     | `CONFIRMADO`          |
| `LOSS-028` | Comandas                 | No existe estado de recibida, iniciada, lista, recogida y entregada                   | `TR4`     | `CONFIRMADO`          |
| `LOSS-029` | Rappi                    | Pedido original y transcripción pueden divergir sin relación automática               | `TR4`     | `CONFIRMADO`          |
| `LOSS-030` | ManyChat                 | Conversación y pedido Makos no comparten ID                                           | `TR4`     | `CONFIRMADO`          |
| `LOSS-031` | Domicilios               | No existe confirmación rutinaria de entrega final                                     | `TR4`     | `CONFIRMADO`          |
| `LOSS-032` | Shopify                  | Pedido, empaque, guía, entrega y devolución no están relacionados de forma confirmada | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-033` | Turnos                   | No se conserva aceptación del trabajador                                              | `TR3`     | `CONFIRMADO`          |
| `LOSS-034` | Turnos                   | Cambios y reemplazos no tienen flujo confirmado                                       | `TR4`     | `POR_VALIDAR`         |
| `LOSS-035` | Asistencia               | Corrección de check-in no tiene trazabilidad confirmada                               | `TR4`     | `POR_VALIDAR`         |
| `LOSS-036` | Propinas                 | No se conserva cálculo base, ajuste, motivo y valor final                             | `TR5`     | `CONFIRMADO`          |
| `LOSS-037` | Nómina                   | Preparación, revisión y aprobación no están completamente documentadas                | `TR5`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-038` | Contratación             | Evaluación de prueba no queda estructurada                                            | `TR4`     | `CONFIRMADO`          |
| `LOSS-039` | Inducción                | No existe evidencia de capacidades aprendidas                                         | `TR4`     | `CONFIRMADO`          |
| `LOSS-040` | Accesos                  | Alta informal puede omitir contexto de sede, área o rol                               | `TR5`     | `CONFIRMADO`          |
| `LOSS-041` | Accesos                  | Baja laboral no dispara revocación obligatoria                                        | `TR5`     | `CONFIRMADO`          |
| `LOSS-042` | Accesos                  | No existe relación central entre empleado y todas sus cuentas                         | `TR5`     | `CONFIRMADO`          |
| `LOSS-043` | Marketing                | Solicitud, versión, aprobación y publicación no comparten registro                    | `TR3`     | `CONFIRMADO`          |
| `LOSS-044` | Soporte                  | Incidente, causa, cambio y solución no quedan registrados                             | `TR4`     | `CONFIRMADO`          |
| `LOSS-045` | Mantenimiento            | Falla, técnico, repuesto, costo y garantía no comparten historial                     | `TR4`     | `CONFIRMADO_PARCIAL`  |
| `LOSS-046` | Servicios Generales      | No existe checklist, actor de cierre ni evidencia                                     | `TR3`     | `CONFIRMADO`          |
| `LOSS-047` | Dispositivos compartidos | El sistema registra cuenta, no persona efectiva                                       | `TR5`     | `CONFIRMADO`          |
| `LOSS-048` | Aplicaciones             | Estados parciales pueden aparentar cierre completo                                    | `TR4`     | `CONFIRMADO`          |
| `LOSS-049` | Datos maestros           | Nombres y conceptos pueden variar entre herramientas                                  | `TR4`     | `INFERIDO_CONTROLADO` |
| `LOSS-050` | Excepciones              | Corrección puede borrar o reemplazar sin relación con el original                     | `TR5`     | `CONFIRMADO_PARCIAL`  |

---

#### 7. Remisiones internas

##### 7.1. Pérdida de identificación común

No existe un identificador confirmado que conecte:

```text
SOLICITUD
→ CONSOLIDACIÓN
→ PRODUCCIÓN
→ CARGA
→ TRANSPORTE
→ RECEPCIÓN
→ DIFERENCIA
```

Consecuencia:

- el reclamo no puede ubicarse en una etapa concreta;
- no se sabe quién tenía la responsabilidad cuando apareció el faltante;
- una compensación posterior no queda vinculada al faltante original.

##### 7.2. Pérdida de versión

El Excel puede modificarse después de tomar la captura.

La captura enviada puede no ser la versión vigente.

No existe:

- número de versión;
- estado de reemplazada;
- confirmación de lectura;
- aceptación por producción.

##### 7.3. Pérdida de actor

La captura enviada al grupo puede mostrar quién envió el mensaje, pero no necesariamente quién:

- calculó;
- revisó;
- autorizó;
- modificó;
- consolidó.

##### 7.4. Pérdida de cantidades intermedias

No se conservan estructuradamente:

- cantidad confirmada por producción;
- cantidad realmente producida;
- cantidad cargada;
- cantidad entregada;
- cantidad aceptada;
- saldo pendiente.

---

#### 8. Producción

##### 8.1. Consolidación sin desglose

El total registrado en tablero o teléfono puede perder la relación con:

- sede;
- solicitud;
- versión;
- fecha requerida.

##### 8.2. Resultado sin causalidad

El reporte de producción final no se vincula formalmente con:

- insumos consumidos;
- lote;
- responsable;
- remisión;
- faltante;
- sobrante;
- destino.

##### 8.3. Producto físico sin identificación suficiente

En varias áreas el producto se deja en:

- canastas;
- bandejas;
- mesones;
- cuarto frío;
- congelador.

El conductor lo reconoce por experiencia.

Puede perderse:

- área productora;
- hora de terminación;
- sede destino;
- lote;
- vida útil;
- cantidad;
- responsable.

##### 8.4. Responsabilidad distribuida

Cuando varias personas producen, empacan y mueven, no existe un registro que separe su participación.

---

#### 9. Despacho y recepción

##### 9.1. Carga sin segunda verificación

El conductor:

- localiza;
- cuenta;
- organiza;
- cambia cantidades;
- carga.

No existe revisor independiente confirmado.

##### 9.2. Cambio de destino sin registro

Un sobrante puede cambiar de sede por criterio operativo.

El cambio no conserva:

- motivo;
- autorizador;
- origen;
- destino;
- cantidad.

##### 9.3. Recepción sin aceptación formal

La sede cuenta y guarda.

No existe registro estructurado de:

- receptor efectivo;
- hora;
- condición;
- diferencia;
- rechazo;
- observación;
- fotografía.

##### 9.4. Faltante sin localización causal

Cuando la sede reclama, no se puede determinar automáticamente si:

- no se solicitó;
- no se consolidó;
- no se produjo;
- no se cargó;
- se descargó en otra sede;
- se recibió y no se ubicó;
- se consumió antes de contar.

---

#### 10. Bodega e inventario

##### 10.1. Retiro sin registro completo

La pérdida es severa porque no se conserva:

- persona;
- producto;
- presentación;
- cantidad;
- ubicación origen;
- área destino;
- motivo;
- fecha;
- turno.

##### 10.2. Inventario sin cadena de movimientos

El stock digital no puede explicarse mediante la suma completa de:

```text
INICIAL
+
RECEPCIONES
+
PRODUCCIÓN
+
TRANSFERENCIAS ENTRANTES
-
RETIROS
-
VENTAS
-
MERMAS
-
TRANSFERENCIAS SALIENTES
±
AJUSTES
```

Cuando faltan eventos, la diferencia no tiene causa verificable.

##### 10.3. Inventario distribuido

Producto retirado de Bodega puede permanecer en un área.

No se sabe si está:

- disponible;
- reservado;
- abierto;
- en uso;
- sobrante;
- dañado;
- transferido.

##### 10.4. Ajuste sin explicación suficiente

No existe procedimiento confirmado que preserve:

- stock esperado;
- conteo;
- diferencia;
- causa;
- aprobador;
- movimiento correctivo.

---

#### 11. Mermas y reasignaciones

##### 11.1. Merma

La hoja manual registra producto y cantidad, pero no se confirmó:

- lote;
- vencimiento;
- causa codificada;
- fotografía;
- costo;
- aprobador;
- método de disposición;
- vínculo al inventario.

##### 11.2. Responsabilidad concentrada

La misma persona puede decidir y ejecutar.

No puede distinguirse:

- error;
- deterioro real;
- uso indebido;
- producto recuperable;
- duplicación.

##### 11.3. Reasignación a Molka

Se pierde información crítica de seguridad y rotación:

- fecha de producción;
- origen;
- vida útil;
- lote;
- condición;
- responsable;
- fecha límite de uso.

---

#### 12. Compras y proveedores

##### 12.1. Necesidad sin origen trazable

Gerencia consulta qué hace falta.

La necesidad puede provenir de:

- aviso;
- experiencia;
- urgencia;
- inventario visual.

No siempre queda:

- área solicitante;
- motivo;
- cantidad estimada;
- fecha requerida.

##### 12.2. Pedido sin versión final consolidada

Los cambios del proveedor quedan dentro de la conversación.

No existe una orden final inequívoca con:

- líneas;
- cantidades;
- precios;
- condiciones;
- aprobador.

##### 12.3. Recepción sin vínculo integral

La factura se compara con el físico, pero no se confirmó una relación formal con el pedido original.

##### 12.4. Sustituto sin responsabilidad formal

Si recibe otra persona, no se conoce:

- designación;
- alcance;
- capacidad de aceptar;
- obligación de reportar;
- custodia del soporte.

---

#### 13. Caja, pagos y efectivo

##### 13.1. Cuenta compartida

Makos puede identificar:

- Caja;
- Servicio;
- función.

No necesariamente identifica a la persona.

Esto impide atribuir con certeza:

- eliminación;
- modificación;
- apertura;
- registro de pago;
- impresión;
- corrección.

##### 13.2. Datáfono separado de Makos

La persona que procesa puede ser distinta de quien registra.

No existe vínculo automático entre:

- comprobante;
- transacción bancaria;
- mesa;
- factura;
- cajero;
- operador del datáfono.

##### 13.3. Diferencia de Caja

No se confirmó un expediente que conserve:

- cierre esperado;
- efectivo real;
- diferencia;
- explicación;
- responsable;
- revisión;
- decisión;
- ajuste.

##### 13.4. Transferencia de custodia mal clasificada

Registrar como gasto oculta que el dinero continúa dentro del grupo bajo otra custodia.

Se pierde:

- origen;
- receptor;
- saldo bajo custodia;
- uso posterior;
- soporte de cada salida.

---

#### 14. Ventas y servicio

##### 14.1. Pedido y actor efectivo

Una cuenta compartida no permite saber quién tomó el pedido.

##### 14.2. Comanda sin estados operativos

La impresión demuestra emisión, pero no:

- recepción por estación;
- inicio;
- asignación;
- terminación;
- recogida;
- entrega.

##### 14.3. Sustitución sin relación

El producto eliminado y el nuevo producto quedan como acciones separadas.

Se pierde:

- motivo de sustitución;
- aceptación del cliente;
- diferencia de precio;
- producto originalmente solicitado.

##### 14.4. Agotado no sincronizado

El sistema puede permitir venta de un producto que no existe.

No queda evidencia de:

- momento del agotado;
- responsable de desactivarlo;
- pedidos afectados;
- duración.

---

#### 15. Rappi, ManyChat y domicilios

##### 15.1. Rappi

Se puede perder durante la transcripción:

- modificador;
- observación;
- cantidad;
- precio;
- estado;
- cancelación.

##### 15.2. ManyChat

La conversación contiene información no estructurada.

No existe ID común con Makos.

##### 15.3. Domicilio

Después de la salida no existe confirmación rutinaria de:

- entrega;
- hora;
- receptor;
- pago;
- novedad;
- devolución.

##### 15.4. Responsabilidad de entrega

No se separa claramente responsabilidad de:

- Caja;
- mensajero;
- plataforma;
- cliente.

---

#### 16. Contabilidad

##### 16.1. Soporte sin relación empresarial completa

Una factura puede llegar sin estar vinculada a:

- solicitud;
- aprobación;
- recepción;
- inventario;
- pago;
- centro de costo.

##### 16.2. Conciliación por aproximación

La relación puede reconstruirse por:

- proveedor;
- fecha;
- valor;
- memoria.

##### 16.3. Clasificación semántica

Un movimiento puede existir, pero con naturaleza incorrecta.

La pérdida no es de existencia, sino de significado.

---

#### 17. Turnos, asistencia, propinas y nómina

##### 17.1. Turno sin aceptación

Se sabe que fue publicado, pero no que el trabajador:

- lo vio;
- lo entendió;
- lo aceptó;
- solicitó cambio.

##### 17.2. Cambio sin historial confirmado

No se conoce versión anterior, solicitante, aprobador y motivo.

##### 17.3. Check-in

El evento registra asistencia, pero la corrección posterior no tiene flujo confirmado.

##### 17.4. Propinas

La liquidación manual no conserva integralmente:

- fondo total;
- criterio;
- base individual;
- días trabajados;
- ajustes;
- motivos;
- valor final;
- entrega;
- aceptación.

##### 17.5. Nómina

No está completamente documentado quién:

- prepara;
- revisa;
- autoriza;
- carga;
- ejecuta;
- corrige.

---

#### 18. Contratación, inducción y accesos

##### 18.1. Contratación

La observación de la prueba no queda en un instrumento estructurado.

Se pierde:

- criterio;
- evaluador;
- resultado;
- capacidades;
- motivo de aceptación o rechazo.

##### 18.2. Inducción

No existe evidencia de:

- contenidos;
- duración;
- responsable;
- capacidades demostradas;
- riesgos explicados;
- aprobación para operar solo.

##### 18.3. Alta de acceso

La solicitud informal puede perder:

- fecha de inicio;
- sede;
- área;
- rol;
- permisos;
- dispositivo;
- vigencia.

##### 18.4. Baja

El retiro laboral y la baja técnica no comparten un evento obligatorio.

No se puede demostrar siempre:

- cuándo terminó;
- cuándo se informó;
- cuándo se revocó;
- qué sesiones quedaron activas;
- qué acciones ocurrieron en el intervalo.

---

#### 19. Marketing

##### 19.1. Solicitud sin brief

Se pierde:

- objetivo;
- audiencia;
- canal;
- formato;
- fecha;
- responsable;
- criterio de aceptación.

##### 19.2. Versiones

No existe control confirmado de:

- versión inicial;
- comentarios;
- versión aprobada;
- publicador;
- fecha de aprobación.

##### 19.3. Historias

Pueden publicarse sin aprobación previa.

No queda separación entre:

- creador;
- revisor;
- aprobador;
- publicador.

---

#### 20. Vaila Vainilla

##### 20.1. Pedido a paquete

No se confirmó una trazabilidad integral entre:

- pedido Shopify;
- inventario;
- producto seleccionado;
- empaque;
- guía;
- mensajería.

##### 20.2. Entrega final

No se confirmó evidencia de:

- entregado;
- destinatario;
- fecha;
- devolución;
- pérdida;
- reembolso.

##### 20.3. Responsabilidad

La dependencia de Jeo y la trabajadora concentra decisiones y ejecución sin un historial empresarial completo.

---

#### 21. Soporte tecnológico

##### 21.1. Incidente

Se pierde:

- activo;
- sede;
- usuario;
- síntoma;
- prioridad;
- hora;
- causa;
- solución;
- cambio aplicado;
- resultado;
- recurrencia.

##### 21.2. Responsabilidad técnica

El Jefe de Operaciones diagnostica, cambia y cierra.

No existe:

- revisión;
- bitácora;
- aprobación del cambio;
- historial del activo.

##### 21.3. Impacto sobre desarrollo

No queda medido:

- tiempo interrumpido;
- tarea desplazada;
- costo de oportunidad;
- reincidencia.

---

#### 22. Mantenimiento

##### 22.1. Historial por activo

No existe un registro consolidado de:

- fallas;
- visitas;
- diagnóstico;
- repuestos;
- técnico;
- costo;
- garantía;
- fecha de próxima revisión.

##### 22.2. Aceptación

El equipo vuelve a funcionar, pero no queda un cierre técnico estructurado.

##### 22.3. Responsabilidad de garantía

Sin historial, es difícil determinar:

- si la falla reapareció;
- si estaba cubierta;
- quién realizó la intervención;
- qué repuesto se instaló.

---

#### 23. Canastas y activos físicos menores

##### 23.1. Canastas

Se pierde:

- propietario;
- sede;
- estado;
- ruta;
- número;
- fecha de envío;
- fecha de retorno.

##### 23.2. Limpieza

No se sabe:

- quién lavó;
- cuándo;
- estado previo;
- estado final;
- tiempo de secado.

##### 23.3. Otros activos

La misma brecha puede aplicar a:

- moldes;
- vajilla;
- utensilios;
- repuestos;
- decoraciones;
- equipos menores.

Su inventario detallado deberá quedar cubierto por las tareas funcionales y de activos posteriores.

---

#### 24. Dispositivos y cuentas compartidas

##### 24.1. Identidad funcional frente a identidad humana

```text
CUENTA: SERVICIO
→ ACCIÓN REGISTRADA

PERSONA EFECTIVA
→ NO DETERMINABLE CON CERTEZA
```

##### 24.2. Sesión persistente

Una acción puede realizarse desde una sesión iniciada por otra persona.

##### 24.3. Contexto incorrecto

Una cuenta puede estar asociada a una sede o área, pero el dispositivo puede ser utilizado por otra persona en otro contexto.

##### 24.4. Responsabilidad posterior

Cuando ocurre un error, la investigación depende de:

- turno;
- memoria;
- cámaras;
- testimonios.

No del registro de aplicación.

---

#### 25. Pérdida durante la doble digitación

Cada transcripción puede perder:

| Origen → destino              | Información vulnerable          |
| ----------------------------- | ------------------------------- |
| Excel → captura               | estructura, versión, validación |
| Captura → interpretación      | identificadores, precisión      |
| Rappi → Makos                 | observaciones, estados          |
| ManyChat → Makos              | cliente, dirección, contexto    |
| Datáfono → Makos              | referencia bancaria, operador   |
| Factura → Contabilidad        | relación con proceso            |
| VISO → cálculo manual         | reglas y vínculo de ajustes     |
| Estado laboral → aplicaciones | oportunidad y cobertura         |
| Shopify → empaque             | inventario y responsable        |

---

#### 26. Pérdidas por cierre aparente

Un proceso puede marcarse o asumirse como terminado aunque falten etapas.

| Proceso        | Cierre aparente      | Etapa no demostrada                         |
| -------------- | -------------------- | ------------------------------------------- |
| Remisión       | Vehículo salió       | Recepción completa                          |
| Domicilio      | Pedido salió         | Entrega al cliente                          |
| Vaila Vainilla | Paquete a mensajería | Entrega final                               |
| Soporte        | Equipo funciona      | Causa y solución documentadas               |
| Mantenimiento  | Equipo prende        | Aceptación y garantía                       |
| Alta           | Cuenta creada        | Acceso correcto y recibido                  |
| Baja           | Cuenta desactivada   | Todas las sesiones y aplicaciones revocadas |
| Propina        | Dinero entregado     | Cálculo verificable                         |
| Compra         | Factura recibida     | Inventario y Contabilidad conciliados       |

---

#### 27. Pérdidas de responsabilidad

##### 27.1. Sin iniciador claro

- ajustes de inventario;
- transferencias a Molka;
- lavado de canastas;
- baja de accesos.

##### 27.2. Sin aprobador claro

- remisión parcial;
- cambio de destino;
- merma;
- diferencia de proveedor;
- corrección de pago;
- diferencia de Caja.

##### 27.3. Sin custodio claro

- canastas;
- sobrantes;
- facturas en tránsito;
- equipos menores;
- algunos documentos.

##### 27.4. Sin responsable de cierre

- domicilio;
- Vaila Vainilla;
- soporte;
- mantenimiento;
- recepción de remisión;
- corrección de acceso.

##### 27.5. Responsabilidad concentrada

- Gerencia General;
- Jefe de Operaciones;
- conductor;
- responsables productivos;
- trabajador que registra merma.

---

#### 28. Consecuencias operativas

- faltantes sin causa;
- compras urgentes;
- inventario no confiable;
- imposibilidad de medir cumplimiento;
- repetición de errores;
- reclamos sin responsable;
- retrasos;
- retrabajo;
- pérdida de confianza;
- dependencia de memoria;
- decisiones tardías;
- riesgo de fraude o abuso;
- riesgo sanitario;
- accesos activos indebidamente;
- dificultad de escalar la operación.

---

#### 29. Consecuencias técnicas

- registros sin actor efectivo;
- entidades sin identificador común;
- eventos no relacionados;
- estados incompletos;
- auditoría no determinista;
- imposibilidad de reconstrucción;
- ajustes sin causalidad;
- datos incompatibles;
- fuentes de verdad múltiples;
- reportes contradictorios;
- integraciones inseguras;
- migración difícil;
- permisos imposibles de verificar correctamente.

---

#### 30. Información mínima que el TO-BE deberá preservar

Esta sección no diseña tablas ni interfaces.

##### 30.1. Identidad

- persona;
- cuenta;
- sesión;
- dispositivo;
- rol base;
- rol operativo;
- sede;
- área.

##### 30.2. Acción

- tipo;
- recurso;
- cantidad;
- unidad;
- estado anterior;
- estado posterior;
- fecha y hora.

##### 30.3. Causalidad

- proceso origen;
- solicitud;
- evento anterior;
- corrección;
- motivo;
- evidencia.

##### 30.4. Responsabilidad

- iniciador;
- ejecutor;
- revisor;
- aprobador;
- custodio;
- receptor;
- corrector.

##### 30.5. Resultado

- completado;
- parcial;
- rechazado;
- pendiente;
- cancelado;
- revertido;
- compensado.

---

#### 31. Principios futuros de trazabilidad

1. Toda acción sensible deberá tener actor efectivo.
2. La cuenta compartida no deberá eliminar la identidad individual.
3. Todo evento deberá conservar contexto.
4. Toda corrección deberá relacionarse con el original.
5. Todo movimiento físico deberá tener efecto rastreable.
6. Toda diferencia deberá tener causa o estado pendiente.
7. Toda transferencia deberá registrar origen y destino.
8. Toda custodia deberá poder reconstruirse.
9. Todo acceso deberá relacionarse con estado laboral.
10. Todo cierre deberá demostrar el resultado final real.
11. La evidencia no deberá depender únicamente de WhatsApp.
12. Los registros no deberán borrarse silenciosamente.
13. La auditoría deberá ser consultable por persona, proceso, sede, recurso y tiempo.
14. Las aplicaciones deberán compartir identificadores canónicos.
15. La trazabilidad deberá sobrevivir a reintentos, errores y contingencias.

---

#### 32. Prioridad inicial de pérdidas

##### 32.1. `P0 — Inmediata`

- accesos activos después del retiro;
- pagos sin relación automática;
- diferencias de Caja;
- inventario sin movimientos completos;
- mermas sin lote y aprobación;
- retiros de Bodega sin registro;
- efectivo mal clasificado;
- identidad efectiva ausente en cuentas compartidas.

##### 32.2. `P1 — Alta`

- remisiones sin ID común;
- recepción sin confirmación;
- transferencias a Molka;
- compras sin versión consolidada;
- facturas sin relación integral;
- producción sin lote y destino;
- domicilios sin entrega final.

##### 32.3. `P2 — Media`

- turnos sin aceptación;
- inducción sin evidencia;
- Marketing sin versiones;
- soporte sin historial;
- mantenimiento sin expediente;
- Vaila Vainilla sin trazabilidad logística completa.

##### 32.4. `P3 — Estructural`

- canastas;
- Servicios Generales;
- activos menores;
- conocimiento informal.

La prioridad deberá validarse con criticidad, frecuencia, impacto y requisitos legales.

---

#### 33. Validaciones pendientes para `OPS-AUD-015`

| Tema           | Validación requerida                     |
| -------------- | ---------------------------------------- |
| Remisiones     | Quién prepara, modifica y recibe         |
| Producción     | Lotes, responsables y reportes           |
| Despacho       | Cambios de cantidad y destino            |
| Recepción      | Evidencia y responsable                  |
| Bodega         | Personas con acceso y práctica real      |
| Merma          | Campos, revisión y archivo               |
| Compras        | Autorización de cambios                  |
| Proveedores    | Rechazo y devolución                     |
| Caja           | Diferencias, anulaciones y reimpresiones |
| Datáfono       | Referencias y operadores                 |
| Contabilidad   | Identificadores y custodios              |
| Turnos         | Cambios, reemplazos y aceptación         |
| Propinas       | Hoja o herramienta de cálculo            |
| Nómina         | Revisión y aprobación                    |
| Accesos        | Todas las plataformas involucradas       |
| Vaila Vainilla | Guía, entrega, devolución y reembolso    |
| Marketing      | Versiones y aprobación                   |
| Mantenimiento  | Factura, garantía y activo               |
| Canastas       | Cantidad, propiedad y responsables       |

---

#### 34. Relación con `OPS-AUD-014`

`OPS-AUD-014` deberá determinar cómo se preserva o pierde la trazabilidad cuando fallan:

- internet;
- red;
- energía;
- dispositivo;
- impresora;
- aplicación;
- proveedor;
- vehículo;
- técnico;
- persona clave.

La contingencia no deberá crear un registro paralelo sin reconciliación posterior.

---

#### 35. Relación con `OPS-AUD-015`

`OPS-AUD-015` deberá:

- confirmar los hallazgos con responsables reales;
- corregir supuestos;
- identificar controles no observados;
- validar campos;
- confirmar propietarios;
- cerrar dudas;
- mantener brechas con tarea futura explícita.

No deberá intentar resolver todavía el diseño TO-BE.

---

#### 36. Relación con tareas posteriores

| Necesidad                                 | Destino                                                                 |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| Definir actor efectivo                    | `PROC-ACTOR-001` a `PROC-ACTOR-003`                                     |
| Mapear capacidad y propietario            | `CAP-MAP-001` a `CAP-MAP-015`                                           |
| Definir aplicación propietaria            | `CAP-SCOPE-001` a `CAP-SCOPE-019`                                       |
| Auditar cobertura tecnológica             | `CAP-COVER-001` a `CAP-COVER-012`                                       |
| Consolidar brechas                        | `GAP-CTRL-001`                                                          |
| Vincular brecha a paquete                 | `GAP-CTRL-006`                                                          |
| Diseñar flujo TO-BE                       | BLOQUE E2                                                               |
| Diseñar eventos, IDs y auditoría          | BLOQUE E3                                                               |
| Diseñar observabilidad, evidencia y colas | BLOQUE E4                                                               |
| Diseñar transición y reconciliación       | BLOQUE E5                                                               |
| Implementar identidad y autorización      | BLOQUES H, J, R0 y R1                                                   |
| Implementar dominios funcionales          | Roadmaps de NEXO, FOGO, ORIGO, PULSO, NUMERA, VISO y demás aplicaciones |

---

#### 37. Hallazgos transversales

##### 37.1. El problema principal es la falta de relación entre hechos

Los datos existen parcialmente, pero no están conectados.

##### 37.2. La memoria humana reconstruye la operación

La empresa depende de personas para explicar:

- qué pasó;
- por qué;
- quién estaba;
- dónde quedó.

##### 37.3. La identidad técnica no siempre representa a la persona

Las cuentas compartidas degradan toda auditoría posterior.

##### 37.4. El físico prevalece sobre el sistema

Cuando existe contradicción, se confía en:

- producto;
- conteo;
- dinero;
- factura;
- observación.

##### 37.5. La corrección no siempre conserva el error original

Esto impide analizar recurrencia y responsabilidad.

##### 37.6. La trazabilidad termina antes que el proceso real

Especialmente en:

- domicilios;
- Vaila Vainilla;
- soporte;
- mantenimiento;
- remisiones.

##### 37.7. La responsabilidad puede existir en la práctica y estar ausente del registro

Una persona puede asumir el problema, pero el sistema no demuestra que era responsable.

---

#### 38. Decisiones propuestas

1. La trazabilidad se evaluará por actor, contexto, tiempo, causalidad, estado, evidencia y responsabilidad.
2. Un mensaje o documento aislado no constituye trazabilidad integral.
3. Las remisiones carecen de identificador común de extremo a extremo.
4. Producción, carga y recepción no están relacionadas formalmente.
5. Los retiros de Bodega presentan pérdida severa de identidad y cantidad.
6. El inventario digital no puede explicar todas las diferencias físicas.
7. Las mermas carecen de información crítica y segregación suficiente.
8. Las transferencias a Molka carecen de trazabilidad sanitaria y de inventario.
9. Compras, recepción, factura y Contabilidad no comparten un identificador integral.
10. Las cuentas compartidas impiden atribuir acciones a personas.
11. El datáfono y Makos no vinculan automáticamente pago, operador y factura.
12. La diferencia de Caja carece de procedimiento documentado confirmado.
13. El retiro registrado como gasto pierde significado y custodia.
14. Las sustituciones de venta no quedan vinculadas al producto original.
15. Las comandas no registran estados de ejecución y entrega.
16. Rappi, ManyChat y Makos no comparten identificadores.
17. Los domicilios no tienen cierre final rutinario.
18. Turnos y cambios no conservan aceptación e historial completo.
19. Propinas no conservan cálculo verificable.
20. La contratación e inducción no conservan evaluación suficiente.
21. El estado laboral y el acceso tecnológico no están sincronizados.
22. Marketing carece de brief, versión y aprobación estructurados.
23. Vaila Vainilla no tiene trazabilidad logística integral confirmada.
24. Soporte y mantenimiento carecen de historial por incidente o activo.
25. Canastas y activos menores no tienen custodia rastreable.
26. El TO-BE deberá preservar evento original, corrección y relación causal.
27. Ninguna decisión autoriza tablas, eventos, logs, permisos, código, migraciones o cambios en Supabase.

---

#### 39. Criterios de aceptación

`OPS-AUD-013` podrá aprobarse cuando se confirme que:

- se distinguen pérdidas de trazabilidad, información y responsabilidad;
- se cubren los procesos críticos;
- se identifican pérdidas de actor, contexto, tiempo, causalidad, versión, cantidad, motivo, custodia, estado y evidencia;
- se registran pérdidas producidas por cuentas compartidas;
- se identifican cierres aparentes;
- se identifican responsabilidades ausentes o concentradas;
- se clasifican prioridades;
- cada incertidumbre queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se ha diseñado el modelo TO-BE;
- no se ha autorizado implementación.

---

#### 40. Resultado y continuidad

Con la aprobación de `OPS-AUD-013` quedará establecida la línea base inicial de:

- pérdidas de identidad;
- pérdidas de contexto;
- pérdidas temporales;
- pérdidas de causalidad;
- pérdidas de versión;
- pérdidas de cantidades;
- pérdidas de motivos;
- pérdidas de custodia;
- pérdidas de estado;
- pérdidas de evidencia;
- pérdidas de responsabilidad;
- cierres aparentes;
- prioridades de trazabilidad.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-014
— Identificar contingencias por caída de red, energía, dispositivo o proveedor
```

`OPS-AUD-014` deberá utilizar este inventario para documentar cómo una contingencia afecta continuidad, evidencia, reconciliación y responsabilidad, sin diseñar todavía la solución técnica definitiva.



### ✅ OPS-AUD-014 — Identificar contingencias por caída de red, energía, dispositivo o proveedor

**Estado:** APROBADO  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de continuidad operativa, respuestas manuales y vacíos ante indisponibilidad  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-013`  
**Validación pendiente:** `OPS-AUD-015` para procedimientos, responsables, autonomía, equipos de respaldo o tiempos no suficientemente confirmados

---

#### 1. Propósito

Identificar qué ocurre actualmente cuando una dependencia necesaria para operar deja de estar disponible, funciona de manera degradada o responde fuera del tiempo requerido.

La tarea cubre contingencias asociadas con:

- internet;
- red local;
- energía;
- aplicaciones;
- Supabase y servicios en nube;
- computadores;
- tablets;
- celulares;
- impresoras;
- datáfonos;
- equipos de producción;
- refrigeración y congelación;
- vehículo;
- conductor;
- proveedores;
- mensajerías;
- bancos;
- técnicos;
- repuestos;
- personas clave;
- documentos y datos necesarios.

Para cada contingencia deberán identificarse:

- evento de falla;
- proceso afectado;
- actor que detecta;
- respuesta actual;
- alternativa manual;
- datos que se dejan de registrar;
- evidencia que se conserva;
- riesgo de duplicación;
- necesidad de conciliación posterior;
- condición de retorno;
- responsable de cierre;
- vacíos sin procedimiento confirmado.

```text
DEPENDENCIA FALLA
→ OPERACIÓN SE DETIENE O DEGRADA
→ SE ACTIVA RESPUESTA MANUAL O IMPROVISADA
→ SE ACUMULAN OPERACIONES PENDIENTES
→ DEPENDENCIA REGRESA
→ DEBERÍA EXISTIR RECONCILIACIÓN
```

Esta tarea documenta el estado actual.

No diseña todavía:

- modo offline;
- sincronización;
- colas;
- reintentos;
- respaldo;
- recuperación automática;
- RTO;
- RPO;
- redundancia;
- UPS;
- generadores;
- contratos de disponibilidad;
- procedimientos TO-BE;
- implementación técnica.

---

#### 2. Principio obligatorio

Una contingencia válida no puede consistir únicamente en “seguir trabajando como sea”.

Debe distinguirse entre:

```text
CONTINUIDAD
→ mantener la capacidad empresarial mínima

DEGRADACIÓN CONTROLADA
→ operar con alcance reducido y reglas explícitas

REGISTRO TEMPORAL
→ conservar datos para carga posterior

RECUPERACIÓN
→ restablecer la dependencia

RECONCILIACIÓN
→ incorporar lo ocurrido durante la caída

CIERRE
→ demostrar que no quedaron operaciones huérfanas
```

Actualmente varios procesos poseen alternativas manuales, pero no existe evidencia de que incluyan todas estas etapas.

---

#### 3. Definiciones canónicas

##### 3.1. Caída total

La dependencia queda completamente indisponible.

##### 3.2. Degradación

La dependencia funciona parcialmente, con lentitud o resultados intermitentes.

##### 3.3. Contingencia

Práctica temporal usada para continuar total o parcialmente.

##### 3.4. Operación manual temporal

Registro o ejecución fuera de la aplicación habitual.

##### 3.5. Acumulación pendiente

Operaciones realizadas o solicitadas que no han sido incorporadas al sistema.

##### 3.6. Recuperación

Restablecimiento técnico o físico de la dependencia.

##### 3.7. Reconciliación posterior

Comparación e incorporación de lo ocurrido durante la contingencia.

##### 3.8. Retorno controlado

Decisión explícita de abandonar el modo de contingencia y volver al flujo ordinario.

##### 3.9. Pérdida de operación

Acción que no pudo ejecutarse ni conservarse.

##### 3.10. Punto único de falla

Dependencia sin sustituto o alternativa suficiente.

---

#### 4. Clasificación de contingencias

| Código     | Tipo                     | Definición                                                |
| ---------- | ------------------------ | --------------------------------------------------------- |
| `CON-NET`  | Internet                 | Caída o degradación de conexión externa                   |
| `CON-LAN`  | Red local                | Falla de Wi-Fi, LAN, router, switch o direccionamiento    |
| `CON-ENE`  | Energía                  | Corte, fluctuación o pérdida eléctrica                    |
| `CON-APP`  | Aplicación               | Sistema no abre, no responde o devuelve errores           |
| `CON-DAT`  | Datos                    | Catálogo, inventario, sesión o configuración incorrectos  |
| `CON-DEV`  | Dispositivo              | Computador, tablet, celular o periférico indisponible     |
| `CON-PRN`  | Impresión                | Impresora, papel, cola o comunicación de impresión fallan |
| `CON-PAY`  | Pago                     | Datáfono, banco, transferencia o confirmación fallan      |
| `CON-COLD` | Frío                     | Refrigeración o congelación dejan de proteger producto    |
| `CON-EQP`  | Equipo operativo         | Horno, empacadora u otro equipo no funciona               |
| `CON-LOG`  | Logística                | Vehículo, conductor, ruta o canasta indisponibles         |
| `CON-SUP`  | Proveedor                | No entrega, entrega tarde o no tiene disponibilidad       |
| `CON-EXT`  | Plataforma externa       | Rappi, Shopify, ManyChat, red social o mensajería fallan  |
| `CON-PER`  | Persona clave            | Responsable crítico no está disponible                    |
| `CON-DOC`  | Documento                | Factura, cierre, guía o soporte no está disponible        |
| `CON-SEC`  | Acceso                   | Usuario, sesión, permiso o cuenta impiden operar          |
| `CON-INC`  | Incidente no clasificado | Evento que requiere evaluación manual                     |

---

#### 5. Estados de respuesta actual

| Estado                   | Significado                                   |
| ------------------------ | --------------------------------------------- |
| `MANUAL_CONFIRMADA`      | Existe una práctica manual conocida           |
| `DEGRADADA`              | Se continúa solo parcialmente                 |
| `IMPROVISADA`            | La respuesta depende del criterio del momento |
| `DEPENDIENTE_DE_PERSONA` | Solo una persona sabe resolver                |
| `PAPEL_TRANSITORIO`      | Se utiliza documento físico temporal          |
| `CANAL_ALTERNO`          | Se utiliza otra herramienta o medio           |
| `ESPERA`                 | El proceso queda detenido hasta recuperación  |
| `REPROGRAMACIÓN`         | Se aplaza para otra ventana                   |
| `SIN_RECONCILIACIÓN`     | No existe carga posterior confirmada          |
| `NO_DEFINIDA`            | No se identificó respuesta consistente        |
| `POR_VALIDAR`            | Requiere confirmación en `OPS-AUD-015`        |

---

#### 6. Escala de impacto

| Nivel            | Impacto                                            |
| ---------------- | -------------------------------------------------- |
| `IC1 — MENOR`    | Afecta comodidad o eficiencia                      |
| `IC2 — MODERADO` | Genera trabajo manual y demora controlable         |
| `IC3 — ALTO`     | Afecta un proceso o área crítica                   |
| `IC4 — CRÍTICO`  | Detiene venta, producción, logística o pago        |
| `IC5 — SEVERO`   | Riesgo sanitario, financiero, legal o de seguridad |

---

#### 7. Inventario maestro de contingencias

| Código    | Dependencia                   | Procesos afectados                                               | Respuesta actual conocida                                        | Impacto   | Estado                   |
| --------- | ----------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- | --------- | ------------------------ |
| `CNT-001` | Internet                      | WhatsApp, Rappi, ManyChat, Shopify, VISO, ANIMA, Vento OS, banca | Uso parcial de datos móviles o espera, no confirmado globalmente | `IC4`     | `POR_VALIDAR`            |
| `CNT-002` | Red local                     | Makos, impresoras LAN, computadores, tablets                     | Revisión de red, cambio de conexión o comunicación verbal        | `IC4`     | `IMPROVISADA`            |
| `CNT-003` | Energía                       | Venta, producción, frío, red, impresión, iluminación             | Operación se detiene o degrada; respaldo no confirmado           | `IC5`     | `POR_VALIDAR`            |
| `CNT-004` | Makos                         | Mesas, pedidos, Caja, facturación, comandas                      | Comunicación manual probable; procedimiento formal no confirmado | `IC5`     | `POR_VALIDAR`            |
| `CNT-005` | Impresora de comandas         | Cocina, Bar, Barra                                               | Consultar pantalla, reimprimir o comunicar verbalmente           | `IC4`     | `POR_VALIDAR`            |
| `CNT-006` | Impresora de factura          | Caja y cliente                                                   | Espera, reintento o impresión posterior                          | `IC4`     | `POR_VALIDAR`            |
| `CNT-007` | Computador de Caja            | Makos, Rappi, ManyChat, facturación                              | Uso de otro dispositivo no confirmado                            | `IC5`     | `NO_DEFINIDA`            |
| `CNT-008` | Tablet de Servicio            | Toma de pedidos                                                  | Uso de otro dispositivo o registro verbal                        | `IC3`     | `IMPROVISADA`            |
| `CNT-009` | Datáfono                      | Pagos con tarjeta                                                | Solicitar efectivo o transferencia; flujo no confirmado          | `IC5`     | `POR_VALIDAR`            |
| `CNT-010` | VISO                          | Programación y reportes                                          | Información puede comunicarse por otro canal                     | `IC3`     | `CANAL_ALTERNO` probable |
| `CNT-011` | ANIMA                         | Consulta de turno y check-in                                     | Comunicación manual y corrección posterior no confirmadas        | `IC4`     | `POR_VALIDAR`            |
| `CNT-012` | Vento OS / Supabase           | Remisiones, inventario y pruebas                                 | Papel, Excel o procesos anteriores en paralelo                   | `IC4`     | `PAPEL_TRANSITORIO`      |
| `CNT-013` | WhatsApp                      | Remisiones, compras, soporte y coordinación                      | Llamada, comunicación verbal o espera                            | `IC4`     | `IMPROVISADA`            |
| `CNT-014` | Excel o archivo               | Solicitud de remisión                                            | Reconstrucción manual o mensaje libre                            | `IC3`     | `IMPROVISADA`            |
| `CNT-015` | Cámara fría o congelación     | Conservación e inventario                                        | Reubicación o evaluación manual no documentada                   | `IC5`     | `NO_DEFINIDA`            |
| `CNT-016` | Horno de Panadería            | Producción                                                       | Reprogramar, priorizar o reducir producción                      | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-017` | Hornos de Saudo               | Pizzas y servicio                                                | Cola, retraso o reducción de capacidad                           | `IC4`     | `DEGRADADA`              |
| `CNT-018` | Empaque al vacío              | Cocina Caliente                                                  | Reprogramación o método alterno no confirmado                    | `IC4`     | `POR_VALIDAR`            |
| `CNT-019` | Vehículo                      | Remisiones y abastecimiento                                      | Reprogramar o buscar alternativa no confirmada                   | `IC5`     | `NO_DEFINIDA`            |
| `CNT-020` | Conductor                     | Apertura, alistamiento, transporte, canastas                     | Sustituto no confirmado                                          | `IC5`     | `NO_DEFINIDA`            |
| `CNT-021` | Canastas                      | Alistamiento y transporte                                        | Reutilizar disponibles o adaptar empaque                         | `IC3`     | `IMPROVISADA`            |
| `CNT-022` | Proveedor sin stock           | Compras y producción                                             | Aceptar parcial, esperar o buscar otro proveedor                 | `IC4`     | `MANUAL_CONFIRMADA`      |
| `CNT-023` | Proveedor llega tarde         | Producción                                                       | Reducir, priorizar o reprogramar producción                      | `IC4`     | `MANUAL_CONFIRMADA`      |
| `CNT-024` | Proveedor no entrega          | Producción y venta                                               | Compra urgente o producción parcial                              | `IC4`     | `IMPROVISADA`            |
| `CNT-025` | Técnico no disponible         | Mantenimiento                                                    | Esperar, buscar otro o operar parcialmente                       | `IC3-IC5` | `MANUAL_CONFIRMADA`      |
| `CNT-026` | Repuesto no disponible        | Mantenimiento                                                    | Espera o solución temporal                                       | `IC3-IC5` | `MANUAL_CONFIRMADA`      |
| `CNT-027` | Rappi                         | Pedidos externos                                                 | Canal no disponible; ventas por otros canales                    | `IC3`     | `DEGRADADA`              |
| `CNT-028` | ManyChat                      | Domicilios directos                                              | WhatsApp u otro canal, no confirmado                             | `IC3`     | `POR_VALIDAR`            |
| `CNT-029` | Shopify                       | Vaila Vainilla                                                   | Gestión por canal alterno no confirmada                          | `IC4`     | `NO_DEFINIDA`            |
| `CNT-030` | Mensajería                    | Domicilios y Vaila                                               | Espera, reasignación o reprogramación                            | `IC3-IC4` | `IMPROVISADA`            |
| `CNT-031` | Banco / portal nómina         | Pagos                                                            | Espera y reintento posterior                                     | `IC5`     | `POR_VALIDAR`            |
| `CNT-032` | Cuenta o permiso              | Aplicaciones internas                                            | Solicitar soporte a Operaciones                                  | `IC3-IC5` | `DEPENDIENTE_DE_PERSONA` |
| `CNT-033` | Gerente general               | Compras, dinero, turnos, propinas, mantenimiento                 | Decisiones se acumulan o escalan informalmente                   | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-034` | Jefe de Operaciones           | Soporte, accesos, infraestructura                                | Espera o resolución parcial por terceros                         | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-035` | Angélica                      | Repostería, Tortas y Galletería                                  | Redistribución por experiencia del equipo                        | `IC3-IC4` | `POR_VALIDAR`            |
| `CNT-036` | Valentina                     | Tortas                                                           | Reprogramación o sustituto no confirmado                         | `IC3`     | `POR_VALIDAR`            |
| `CNT-037` | Documento físico              | Recepción, Contabilidad, Caja                                    | Buscar copia o reconstruir                                       | `IC4-IC5` | `IMPROVISADA`            |
| `CNT-038` | Datos maestros incorrectos    | Inventario, compras, permisos y reportes                         | Corrección manual o bloqueo del proceso                          | `IC4`     | `DEPENDIENTE_DE_PERSONA` |
| `CNT-039` | Sesión compartida o bloqueada | Operación en dispositivo                                         | Cambiar cuenta, pedir ayuda o seguir con sesión existente        | `IC4`     | `IMPROVISADA`            |
| `CNT-040` | Cámaras                       | Seguridad y revisión posterior                                   | Sin evidencia visual hasta recuperación                          | `IC3-IC4` | `ESPERA`                 |

---

#### 8. Caída de internet

##### 8.1. Procesos afectados

- WhatsApp;
- Rappi;
- ManyChat;
- Shopify;
- VISO;
- ANIMA;
- Vento OS;
- banca;
- correo;
- soporte remoto;
- redes sociales.

##### 8.2. Respuesta actual

No existe un procedimiento empresarial único confirmado.

Posibles respuestas observables o razonables:

- usar datos móviles;
- cambiar de red;
- llamar;
- comunicar verbalmente;
- esperar;
- registrar en papel;
- ejecutar después.

Solo deberán considerarse prácticas confirmadas cuando se validen en `OPS-AUD-015`.

##### 8.3. Riesgos

- solicitudes no enviadas;
- pedidos externos no vistos;
- check-ins no registrados;
- pagos no confirmados;
- altas o bajas no ejecutadas;
- operaciones duplicadas cuando vuelve la conexión;
- pérdida del orden temporal;
- falta de evidencia.

##### 8.4. Reconciliación necesaria

Después de la recuperación debería verificarse:

- mensajes pendientes;
- pedidos recibidos durante la caída;
- check-ins faltantes;
- transacciones;
- remisiones;
- operaciones en papel;
- duplicados.

No existe un procedimiento transversal confirmado.

---

#### 9. Falla de red local

##### 9.1. Procesos afectados

- impresoras LAN;
- computadores;
- tablets;
- Makos;
- dispositivos compartidos;
- comunicación con periféricos.

##### 9.2. Estado actual

Los incidentes de impresoras y direccionamiento se resuelven técnicamente caso por caso.

La operación puede recurrir a:

- revisar IP;
- cambiar red;
- reiniciar;
- reconectar;
- imprimir desde otro medio;
- comunicar verbalmente.

##### 9.3. Riesgo específico

La red puede parecer disponible para internet y seguir sin comunicar dispositivos internos.

Por tanto:

```text
INTERNET FUNCIONA
≠
IMPRESORA O DISPOSITIVO LAN FUNCIONA
```

##### 9.4. Pérdida de evidencia

Los intentos, cambios de IP y soluciones no quedan registrados en un historial técnico.

---

#### 10. Corte o fluctuación de energía

##### 10.1. Procesos afectados

- frío;
- producción;
- hornos;
- computadores;
- red;
- impresoras;
- datáfonos;
- iluminación;
- cámaras;
- aplicaciones;
- venta.

##### 10.2. Riesgos

- detención inmediata;
- pérdida de producto;
- temperatura fuera de rango;
- producción incompleta;
- masa o preparación afectada;
- venta no registrada;
- dispositivo apagado;
- corrupción o pérdida de datos locales;
- interrupción de cadena de frío.

##### 10.3. Estado actual

No se confirmó:

- generador;
- UPS por sede;
- autonomía;
- prioridad de circuitos;
- protocolo de temperatura;
- traslado de producto;
- responsable;
- criterio de descarte;
- registro del incidente.

##### 10.4. Severidad

`IC5 — SEVERO` cuando afecta:

- refrigeración;
- congelación;
- inocuidad;
- Caja;
- facturación;
- producción crítica.

---

#### 11. Caída de Makos

##### 11.1. Procesos afectados

- mesas;
- pedidos;
- adiciones;
- comandas;
- Caja;
- medios de pago;
- facturación;
- cierres;
- reportes;
- transcripción de Rappi y domicilios.

##### 11.2. Respuesta actual no confirmada

No existe evidencia suficiente de un procedimiento único para operar sin Makos.

Podrían ocurrir:

- pedidos verbales;
- notas;
- espera;
- cálculo manual;
- registro posterior;
- emisión posterior de factura.

Estas opciones no deberán declararse aprobadas hasta `OPS-AUD-015`.

##### 11.3. Riesgos

- pedidos perdidos;
- cuentas incompletas;
- precios incorrectos;
- duplicación al cargar después;
- impuestos o factura incorrectos;
- cierre imposible;
- producto preparado sin venta registrada.

##### 11.4. Retorno

La recuperación requeriría distinguir:

- pedido ya preparado;
- pedido entregado;
- pago recibido;
- factura pendiente;
- operación ya registrada después.

No existe conciliación confirmada.

---

#### 12. Falla de impresión

##### 12.1. Comandas

Una impresora puede fallar por:

- energía;
- red;
- IP;
- papel;
- cola;
- driver;
- configuración;
- aplicación.

Respuesta probable:

- revisar Makos;
- reimprimir;
- avisar verbalmente;
- usar otra estación.

##### 12.2. Facturas y resúmenes

La falla afecta:

- presentación de cuenta;
- entrega de factura;
- cierre;
- soporte.

##### 12.3. Riesgos

- pedido no preparado;
- duplicado al reimprimir;
- estación equivocada;
- cliente esperando;
- factura pendiente;
- pérdida de orden de llegada.

##### 12.4. Estado

El procedimiento exacto debe validarse en `OPS-AUD-015`.

---

#### 13. Falla de dispositivos operativos

##### 13.1. Computador de Caja

Concentra:

- Makos;
- Rappi;
- ManyChat;
- facturación.

No se confirmó un equipo alterno preparado.

##### 13.2. Tablet de Servicio

Puede sustituirse por otro dispositivo si existe disponibilidad y sesión, pero no se ha validado una regla formal.

##### 13.3. Celular

La pérdida, descarga o falta de conectividad afecta:

- WhatsApp;
- fotografías;
- pedidos;
- coordinación;
- autenticación.

##### 13.4. Dispositivo compartido

Cuando falla, puede bloquear a varias personas y procesos simultáneamente.

##### 13.5. Riesgo de retorno

Cambiar de dispositivo puede alterar:

- cuenta;
- contexto;
- sede;
- área;
- actor efectivo;
- cola pendiente.

---

#### 14. Falla de VISO, ANIMA o acceso laboral

##### 14.1. VISO

Puede impedir:

- publicar;
- consultar;
- descargar reportes.

##### 14.2. ANIMA

Puede impedir:

- consultar turno;
- hacer check-in;
- recibir notificación.

##### 14.3. Cuenta o permiso

El trabajador puede estar presente, pero técnicamente bloqueado.

##### 14.4. Respuesta actual

Depende de contactar al Jefe de Operaciones o utilizar comunicación informal.

No se confirmó:

- registro manual de asistencia;
- evidencia aceptada;
- corrección posterior;
- aprobador;
- tiempo máximo.

##### 14.5. Riesgo

La falta técnica puede confundirse con:

- retraso;
- ausencia;
- incumplimiento;
- falta de permiso.

---

#### 15. Caída de Vento OS o Supabase

##### 15.1. Estado actual

Vento OS todavía opera parcialmente y en pruebas en varios procesos.

La contingencia conocida ha consistido en mantener:

- Excel;
- WhatsApp;
- hojas físicas;
- flujo anterior.

##### 15.2. Riesgo

La coexistencia puede crear:

- versiones distintas;
- operaciones duplicadas;
- movimientos parciales;
- inventario inválido;
- falsa sensación de cierre.

##### 15.3. Condición obligatoria futura

Una contingencia de Vento OS deberá registrar después:

- operación temporal;
- actor;
- hora real;
- origen;
- referencia;
- reconciliación;
- duplicado detectado;
- cierre.

No se implementa en esta tarea.

---

#### 16. Falla de datáfono o banco

##### 16.1. Procesos afectados

- pagos con tarjeta;
- cierre de venta;
- conciliación;
- experiencia del cliente.

##### 16.2. Alternativas probables

- efectivo;
- transferencia;
- otro datáfono;
- espera.

No se confirmó qué alternativas están autorizadas por sede.

##### 16.3. Riesgos

- comprobante no vinculado;
- transferencia sin confirmar;
- doble cobro;
- venta entregada sin pago;
- medio registrado incorrectamente;
- reverso posterior.

##### 16.4. Conciliación

Debería compararse:

```text
VENTA
↔ TRANSACCIÓN BANCARIA
↔ MEDIO REGISTRADO
↔ FACTURA
```

No existe flujo de contingencia confirmado.

---

#### 17. Falla de frío

##### 17.1. Dependencias afectadas

- cámara fría;
- congeladores;
- refrigeradores;
- preparaciones;
- insumos;
- productos terminados;
- vida útil.

##### 17.2. Riesgos

- pérdida de cadena de frío;
- deterioro;
- merma;
- riesgo sanitario;
- suspensión de despacho;
- reclasificación de producto;
- pérdida financiera.

##### 17.3. Estado actual

No se confirmó un protocolo para:

- detectar;
- medir temperatura;
- registrar hora;
- trasladar;
- aislar;
- evaluar;
- aprobar uso;
- descartar;
- informar.

##### 17.4. Severidad

`IC5 — SEVERO`.

La decisión no puede depender únicamente de percepción cuando exista riesgo de inocuidad.

---

#### 18. Falla de equipos de producción

##### 18.1. Panadería

La falla de horno o equipo puede impedir cumplir ciclos ya iniciados.

Respuesta actual:

- reprogramar;
- priorizar;
- producir menos;
- buscar reparación.

##### 18.2. Saudo

Con dos hornos, la pérdida de uno reduce capacidad.

```text
2 HORNOS
→ 1 HORNO DISPONIBLE
→ OPERACIÓN DEGRADADA
→ COLA Y DEMORA
```

##### 18.3. Cocina Caliente

Una falla de empacado, cocción o conservación puede bloquear producción o almacenamiento.

##### 18.4. Estado de contingencia

No se confirmó:

- equipo sustituto;
- capacidad degradada permitida;
- criterios de suspensión;
- comunicación al cliente o sede;
- registro de producción afectada.

---

#### 19. Falla de vehículo o indisponibilidad del conductor

##### 19.1. Vehículo

Afecta:

- remisiones;
- abastecimiento;
- canastas;
- entregas;
- retorno.

##### 19.2. Conductor

Además del transporte, el conductor participa en:

- apertura;
- alistamiento;
- conteo;
- clasificación;
- carga;
- cierre físico.

##### 19.3. Riesgo

La dependencia no se limita al manejo del vehículo.

```text
CONDUCTOR AUSENTE
→ APERTURA Y ALISTAMIENTO TAMBIÉN AFECTADOS
```

##### 19.4. Estado actual

No se confirmó:

- sustituto;
- segundo conductor;
- vehículo alterno;
- servicio contratado;
- transferencia documentada de responsabilidades;
- prioridad de entregas.

---

#### 20. Escasez de canastas o empaques

##### 20.1. Causas

- no retorno;
- suciedad;
- humedad;
- pérdida;
- uso en otra sede;
- daño;
- proveedor propietario.

##### 20.2. Respuesta actual

- buscar disponibles;
- lavar;
- reutilizar;
- adaptar otro soporte.

##### 20.3. Riesgos

- mezcla de destinos;
- daño de producto;
- retraso;
- contaminación;
- pérdida de custodia.

No existe un inventario que permita anticipar el bloqueo.

---

#### 21. Falla de proveedor

##### 21.1. Sin disponibilidad

El proveedor informa cantidad parcial o inexistencia.

Respuesta:

- aceptar parcial;
- esperar;
- buscar otro;
- cambiar producto;
- reducir producción.

##### 21.2. Entrega tardía

La producción puede:

- iniciar tarde;
- reducir cantidades;
- cambiar prioridades;
- compensar después.

##### 21.3. No entrega

Puede generar:

- compra urgente;
- remisión parcial;
- agotado;
- pérdida de venta.

##### 21.4. Dependencia de conversación

La contingencia se resuelve por WhatsApp y criterio de Gerencia.

No existe una orden actualizada y una razón estructurada confirmadas.

##### 21.5. Riesgo de sustitución

Cambiar proveedor o presentación puede afectar:

- receta;
- costo;
- unidad;
- calidad;
- inventario;
- recepción.

---

#### 22. Falla de plataformas externas

##### 22.1. Rappi

La sede puede continuar con mesas y otros canales, pero pierde ventas del canal.

Debe distinguirse:

- pedido no recibido;
- pedido recibido antes de la caída;
- cancelación;
- estado pendiente.

##### 22.2. ManyChat

Puede perderse el canal de domicilio directo.

No se confirmó migración temporal a WhatsApp.

##### 22.3. Shopify

Vaila Vainilla puede dejar de recibir o gestionar pedidos.

No existe contingencia confirmada para:

- pedido recibido pero no visible;
- pago confirmado sin preparación;
- recuperación posterior;
- duplicado.

##### 22.4. Redes sociales

Marketing y reclutamiento pueden degradarse sin detener la operación principal.

---

#### 23. Falla de mensajería

##### 23.1. Domicilios

Puede ocurrir:

- demora en asignación;
- mensajero no llega;
- rechazo;
- pérdida;
- entrega fallida.

##### 23.2. Vaila Vainilla

La acumulación de paquetes depende de la recolección.

##### 23.3. Respuesta actual

Se resuelve caso por caso.

No se confirmó:

- proveedor alterno;
- reasignación;
- tiempo máximo;
- notificación automática;
- prueba de entrega;
- devolución.

---

#### 24. Indisponibilidad de técnico o repuesto

##### 24.1. Técnico

La gerente general:

- espera;
- busca otro;
- adapta la operación.

##### 24.2. Repuesto

Puede producir:

- reparación temporal;
- equipo detenido;
- compra urgente;
- espera.

##### 24.3. Riesgos

- solución no documentada;
- equipo operando degradado;
- reincidencia;
- pérdida de garantía;
- dependencia de una relación personal.

---

#### 25. Indisponibilidad de personas clave

##### 25.1. Gerente general

Puede retrasar:

- compras;
- pagos;
- turnos;
- propinas;
- mantenimiento;
- decisiones.

##### 25.2. Jefe de Operaciones

Puede retrasar:

- soporte;
- accesos;
- infraestructura;
- desarrollo;
- recepción;
- Bodega.

##### 25.3. Conductor

Puede detener:

- apertura;
- alistamiento;
- transporte;
- canastas.

##### 25.4. Responsables productivos

Puede afectar:

- planificación;
- distribución;
- priorización;
- conocimiento técnico.

##### 25.5. Estado actual

No existe una matriz confirmada de:

- sustitutos;
- autoridad temporal;
- entrega de contexto;
- accesos;
- responsabilidades mínimas.

---

#### 26. Pérdida de documentos o información

##### 26.1. Factura

Sin factura puede fallar:

- recepción;
- pago;
- Contabilidad;
- conciliación.

##### 26.2. Cierre

Sin cierre impreso o accesible se dificulta entregar efectivo.

##### 26.3. Solicitud

Sin Excel o captura, producción no conoce necesidad.

##### 26.4. Guía

Sin guía, Vaila Vainilla puede perder trazabilidad logística.

##### 26.5. Respuesta actual

- buscar;
- pedir copia;
- reconstruir;
- consultar mensajes;
- esperar.

No existe un procedimiento transversal de recuperación documental.

---

#### 27. Falla de datos maestros o configuración

Una aplicación puede estar disponible y aun así no permitir operar porque faltan o son incorrectos:

- productos;
- presentaciones;
- unidades;
- ubicaciones;
- sedes;
- áreas;
- usuarios;
- permisos;
- impresoras;
- proveedores.

```text
SISTEMA DISPONIBLE
+
DATOS INVÁLIDOS
→ CAPACIDAD OPERATIVA INDISPONIBLE
```

Respuesta actual:

- contactar al Jefe de Operaciones;
- corregir manualmente;
- usar canal alterno;
- posponer.

---

#### 28. Contingencia y trazabilidad

Toda contingencia manual puede perder:

- actor;
- hora real;
- sede;
- producto;
- cantidad;
- precio;
- medio de pago;
- estado;
- motivo;
- evidencia.

Los principales riesgos son:

1. no registrar;
2. registrar dos veces;
3. registrar con hora de carga en vez de hora real;
4. perder el orden;
5. no vincular con el proceso original;
6. no identificar quién autorizó;
7. cerrar sin reconciliar.

---

#### 29. Registro temporal versus fuente paralela

##### 29.1. Registro temporal válido

Debe existir solo durante la caída y contener lo necesario para carga posterior.

##### 29.2. Fuente paralela peligrosa

Permanece activa sin reconciliación ni retiro.

Ejemplo:

```text
PAPEL
+
EXCEL
+
WHATSAPP
+
VENTO OS
→ TODOS PARECEN VÁLIDOS
```

##### 29.3. Regla futura

La contingencia deberá definir:

- cuándo inicia;
- quién la activa;
- qué formato se usa;
- qué número o referencia genera;
- quién custodia;
- cuándo termina;
- quién carga;
- cómo se detecta duplicado;
- quién certifica cierre.

---

#### 30. Conciliación posterior mínima

Después de una contingencia deberá poder verificarse:

##### 30.1. Operaciones

- solicitudes;
- pedidos;
- ventas;
- pagos;
- recepciones;
- retiros;
- producción;
- remisiones;
- mermas;
- transferencias.

##### 30.2. Identidad

- quién ejecutó;
- bajo qué contexto;
- con qué autorización.

##### 30.3. Tiempo

- hora real;
- hora de registro;
- duración de la caída.

##### 30.4. Resultado

- cargado;
- duplicado;
- rechazado;
- pendiente;
- corregido.

Esta capacidad corresponde al diseño futuro, no a esta tarea.

---

#### 31. Puntos actuales sin contingencia suficiente

1. caída total de Makos;
2. caída prolongada de energía;
3. pérdida de frío;
4. falla del computador principal de Caja;
5. ausencia del conductor;
6. vehículo fuera de servicio;
7. indisponibilidad de Shopify;
8. caída simultánea de internet y datos móviles;
9. corrección posterior de check-ins offline;
10. pago con tarjeta sin datáfono;
11. conciliación de ventas manuales;
12. reposición de comandas perdidas;
13. operación de inventario durante caída;
14. falla de Supabase;
15. recuperación de documentos perdidos;
16. proveedor crítico sin sustituto;
17. técnico y repuesto no disponibles;
18. baja de acceso cuando Operaciones no está disponible;
19. respaldo de programación de turnos;
20. sustitución formal de personas clave.

Todos quedan vinculados a `OPS-AUD-015` y a las tareas posteriores correspondientes.

---

#### 32. Matriz de continuidad por dominio

| Dominio        | Continuidad actual              | Reconciliación confirmada | Riesgo |
| -------------- | ------------------------------- | ------------------------- | ------ |
| Remisiones     | Excel, WhatsApp y papel         | No                        | Alto   |
| Inventario     | Físico prevalece                | No                        | Severo |
| Producción     | Experiencia y comunicación      | No                        | Alto   |
| Venta          | Alternativa no confirmada       | No                        | Severo |
| Caja           | Papel y conteo                  | Parcial                   | Severo |
| Pagos          | Medios alternos probables       | No                        | Severo |
| Turnos         | Comunicación informal           | No                        | Alto   |
| Check-in       | Corrección posterior probable   | No                        | Alto   |
| Compras        | WhatsApp y proveedores alternos | Parcial                   | Alto   |
| Contabilidad   | Soportes físicos                | Posterior                 | Severo |
| Vaila Vainilla | No confirmada                   | No                        | Alto   |
| Soporte        | Resolución manual               | No                        | Alto   |
| Mantenimiento  | Espera o adaptación             | No                        | Alto   |
| Accesos        | Dependencia de Operaciones      | No                        | Severo |

---

#### 33. Prioridad inicial

##### 33.1. `P0 — Continuidad vital`

- energía;
- frío;
- Caja y pagos;
- Makos;
- acceso y seguridad;
- inventario;
- vehículo y conductor;
- respaldo de datos esenciales.

##### 33.2. `P1 — Continuidad operativa`

- remisiones;
- producción;
- compras;
- proveedores;
- impresoras;
- red;
- internet;
- VISO y ANIMA.

##### 33.3. `P2 — Continuidad comercial`

- Rappi;
- ManyChat;
- Shopify;
- mensajerías;
- Marketing.

##### 33.4. `P3 — Continuidad de soporte`

- mantenimiento;
- soporte técnico;
- documentación;
- canastas;
- activos menores.

La prioridad deberá validarse por impacto, duración y alternativas reales.

---

#### 34. Métricas futuras necesarias

- incidentes por tipo;
- sede afectada;
- inicio;
- detección;
- recuperación;
- duración;
- operaciones afectadas;
- operaciones manuales;
- operaciones reconciliadas;
- duplicados;
- pérdidas;
- valor económico;
- producto comprometido;
- tiempo fuera de servicio;
- causa;
- responsable;
- recurrencia.

---

#### 35. Validaciones pendientes para `OPS-AUD-015`

| Tema           | Validación requerida                             |
| -------------- | ------------------------------------------------ |
| Internet       | Datos móviles, redes alternas y responsables     |
| Energía        | UPS, plantas, autonomía y circuitos              |
| Frío           | Protocolo, temperatura, traslado y descarte      |
| Makos          | Operación manual y carga posterior               |
| Impresión      | Reimpresión, duplicados y canal alterno          |
| Caja           | Equipo alterno y cierre manual                   |
| Datáfono       | Medios autorizados y conciliación                |
| ANIMA          | Check-in manual y corrección                     |
| Vento OS       | Papel actual y reconciliación                    |
| Vehículo       | Alternativa y prioridad de rutas                 |
| Conductor      | Sustituto                                        |
| Proveedores    | Proveedores alternos                             |
| Shopify        | Operación durante caída                          |
| Mensajería     | Reasignación y entrega fallida                   |
| Técnicos       | Sustitución y garantías                          |
| Personas clave | Matriz real de reemplazos                        |
| Documentos     | Copias, custodia y recuperación                  |
| Supabase       | Comportamiento actual de aplicaciones ante caída |
| Canastas       | Alternativas de empaque                          |
| Banco          | Reintento y contingencia de nómina               |

---

#### 36. Relación con tareas posteriores

| Necesidad                                    | Destino         |
| -------------------------------------------- | --------------- |
| Validar prácticas reales                     | `OPS-AUD-015`   |
| Definir criticidad y disponibilidad objetivo | `NFR-REQ-001`   |
| Definir comportamiento offline               | `NFR-REQ-004`   |
| Definir hardware, red y periféricos          | `NFR-REQ-008`   |
| Definir observabilidad y alertas             | `NFR-REQ-009`   |
| Definir respaldo, RTO y RPO                  | `NFR-REQ-010`   |
| Definir compatibilidad por dispositivo       | `NFR-REQ-011`   |
| Diseñar reanudación de procesos              | `UX-BASE-014`   |
| Auditar offline, reintentos e idempotencia   | `CODE-AUD-018`  |
| Evaluar continuidad empresarial              | `CAP-SCOPE-018` |
| Registrar dependencias y bloqueos            | `CAP-COVER-010` |
| Consolidar brechas                           | `GAP-CTRL-001`  |
| Vincular brechas a paquetes                  | `GAP-CTRL-006`  |
| Diseñar procesos TO-BE de contingencia       | BLOQUE E2       |
| Diseñar datos, eventos y reconciliación      | BLOQUE E3       |
| Diseñar colas, reintentos y observabilidad   | BLOQUE E4       |
| Diseñar piloto, rollback y cutover           | BLOQUE E5       |
| Definir contratos externos                   | BLOQUE X        |

---

#### 37. Principios obligatorios para el diseño futuro

1. Toda capacidad crítica deberá declarar su comportamiento degradado.
2. Toda contingencia deberá tener inicio y cierre explícitos.
3. Toda operación manual deberá conservar una referencia única.
4. La carga posterior deberá ser idempotente.
5. El sistema deberá distinguir hora real y hora de sincronización.
6. La recuperación no implica conciliación terminada.
7. Ningún proceso deberá aparentar cierre mientras existan pendientes offline.
8. Las operaciones financieras deberán impedir doble cobro.
9. Los movimientos de inventario deberán impedir doble aplicación.
10. La contingencia deberá conservar actor efectivo y contexto.
11. El papel deberá retirarse después de reconciliar.
12. Las colas deberán exponer errores y reintentos.
13. La pérdida de frío deberá tratarse como riesgo sanitario, no solo técnico.
14. La ausencia de una persona clave deberá tener sustitución gobernada.
15. Las aplicaciones externas deberán tener estados de indisponibilidad diferenciados.
16. El retorno deberá ser autorizado cuando exista riesgo de duplicación.
17. Toda contingencia deberá producir evidencia auditable.

---

#### 38. Hallazgos transversales

##### 38.1. Las contingencias actuales son principalmente reactivas

La respuesta comienza después de que la operación ya fue afectada.

##### 38.2. La operación manual no tiene reconciliación transversal

Se puede continuar, pero no se garantiza que lo ocurrido llegue correctamente al sistema.

##### 38.3. La continuidad depende de personas

Gerencia, Operaciones, conductor y responsables técnicos sustituyen procedimientos formales.

##### 38.4. El papel puede proteger la operación y dañar la trazabilidad

Es útil durante una caída, pero crea múltiples fuentes si no se retira correctamente.

##### 38.5. Energía y frío tienen impacto empresarial superior

No son únicamente incidentes tecnológicos.

##### 38.6. El retorno es tan riesgoso como la caída

Al restablecerse la aplicación pueden aparecer:

- duplicados;
- operaciones fuera de orden;
- pagos repetidos;
- movimientos de inventario repetidos;
- estados incompatibles.

##### 38.7. No todas las capacidades requieren la misma continuidad

El diseño posterior deberá diferenciar:

- operación vital;
- operación crítica;
- operación diferible;
- soporte administrativo.

---

#### 39. Decisiones propuestas

1. La contingencia se documentará como ciclo de detección, continuidad, recuperación, reconciliación y cierre.
2. Internet, red local y energía se tratarán como dependencias distintas.
3. La disponibilidad de una aplicación no garantiza disponibilidad operativa si faltan datos o permisos.
4. No existe un procedimiento empresarial único confirmado para caída de internet.
5. La red local puede fallar aunque internet funcione.
6. La caída de energía y frío tiene severidad potencial máxima.
7. No existe operación manual de Makos suficientemente confirmada.
8. Las fallas de impresión pueden producir omisiones y duplicados.
9. El computador de Caja constituye un punto de concentración crítica.
10. El datáfono requiere contingencia y conciliación financiera explícitas.
11. VISO y ANIMA necesitan procedimiento para registro y corrección durante indisponibilidad.
12. Vento OS utiliza coexistencia con papel, Excel o WhatsApp durante pruebas.
13. La contingencia actual de Vento OS no cuenta con reconciliación integral confirmada.
14. Vehículo y conductor son dependencias distintas y ambas críticas.
15. Proveedores se gestionan mediante aceptación parcial, espera o sustitución manual.
16. La falla de proveedor puede propagarse hasta producción, remisiones y ventas.
17. Rappi, ManyChat, Shopify y mensajerías requieren contingencia propia.
18. Técnico y repuesto son dependencias externas separadas.
19. Las personas clave constituyen puntos únicos de falla operativa.
20. La pérdida documental también constituye una contingencia.
21. El retorno deberá impedir duplicación y cierre falso.
22. Ninguna decisión autoriza modo offline, sincronización, colas, infraestructura, código, migraciones o cambios en Supabase.

---

#### 40. Criterios de aceptación

`OPS-AUD-014` podrá aprobarse cuando se confirme que:

- se identifican contingencias de red, energía, dispositivo y proveedor;
- se incluyen aplicaciones, impresión, pagos, frío, logística y terceros;
- se distingue caída total y degradación;
- se documentan respuestas actuales sin presentarlas como diseño objetivo;
- se identifican puntos sin contingencia suficiente;
- se registra el riesgo de operación paralela;
- se documenta la necesidad de reconciliación posterior;
- se identifican personas clave y puntos únicos de falla;
- cada duda queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se han definido RTO, RPO o SLA;
- no se ha diseñado el modo offline;
- no se ha autorizado implementación.

---

#### 41. Resultado y continuidad

Con la aprobación de `OPS-AUD-014` quedará establecida la línea base inicial de:

- caídas de internet;
- fallas de red local;
- cortes de energía;
- indisponibilidad de aplicaciones;
- fallas de impresión;
- fallas de dispositivos;
- fallas de pagos;
- pérdida de frío;
- fallas de equipos;
- indisponibilidad logística;
- fallas de proveedores;
- fallas de plataformas externas;
- indisponibilidad de personas clave;
- respuestas manuales;
- registros temporales;
- vacíos de reconciliación;
- riesgos de retorno.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-015
— Validar hallazgos con trabajadores, supervisores y responsables del proceso
```

`OPS-AUD-015` deberá contrastar con responsables reales todos los hallazgos, prácticas, cifras, dependencias, contingencias y dudas pendientes de `OPS-AUD-001` a `OPS-AUD-014`, corregir lo que no corresponda y cerrar la auditoría AS-IS sin diseñar todavía el proceso TO-BE.



### ✅ OPS-AUD-015 — Validar hallazgos con trabajadores, supervisores y responsables del proceso

**Estado:** APROBADA — VALIDACIÓN SUFICIENTE PARA CONTINUIDAD  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Cierre por suficiencia de evidencia de la auditoría AS-IS  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados

---

#### 1. Decisión de cierre

La validación de `OPS-AUD-001` a `OPS-AUD-014` se considera suficiente para continuar la secuencia canónica.

La decisión se sustenta en que:

- la Jefatura de Operaciones aportó evidencia directa y transversal de la operación;
- los hallazgos fueron revisados progresivamente durante el desarrollo de cada tarea;
- las tareas `OPS-AUD-001` a `OPS-AUD-014` fueron aprobadas expresamente;
- los procesos, actores, herramientas, documentos, excepciones, controles, dependencias, duplicaciones, pérdidas de trazabilidad y contingencias principales quedaron identificados;
- no se requiere resolver cada variación menor antes de avanzar;
- las dudas no bloqueantes podrán validarse durante el diseño, prototipo o piloto correspondiente.

```text
EVIDENCIA SUFICIENTE PARA DISEÑAR
≠
CONOCIMIENTO ABSOLUTO DE TODAS LAS VARIANTES
```

---

#### 2. Criterio de suficiencia aplicado

Una duda solo bloqueará el avance cuando pueda modificar materialmente:

- la propiedad funcional o técnica de un proceso;
- la fuente de verdad de un dato;
- dinero, impuestos, Contabilidad o responsabilidad legal;
- autorización, segregación de funciones o seguridad;
- el contrato entre aplicaciones;
- una transición, reversión o estado crítico;
- una migración irreversible o de alto riesgo.

Las demás incertidumbres:

1. permanecen registradas;
2. conservan su nivel de evidencia;
3. deberán resolverse antes del diseño definitivo de la capacidad afectada o durante su prototipo y piloto;
4. no justifican entrevistas masivas ni la detención de la secuencia.

---

#### 3. Validación consolidada

Se consideran suficientemente validados para continuar:

- estructura operativa actual;
- sedes y áreas principales;
- actores y responsabilidades reales;
- procesos ordinarios;
- procesos en papel, Excel, WhatsApp y herramientas externas;
- artefactos documentales;
- excepciones y correcciones;
- controles y concentraciones de funciones;
- frecuencia y criticidad inicial;
- dependencias;
- puntos de doble digitación;
- pérdidas de trazabilidad;
- contingencias principales.

La aprobación no convierte las prácticas actuales en requisitos TO-BE.

---

#### 4. Incertidumbres diferidas con propietario documental

| Incertidumbre                                | Momento obligatorio de resolución                                |
| -------------------------------------------- | ---------------------------------------------------------------- |
| Propiedad funcional y aplicación propietaria | `CAP-MAP-*`, `CAP-SCOPE-*` y BLOQUE E2                           |
| Fuente de verdad de datos                    | BLOQUE E3                                                        |
| Anulaciones, devoluciones y reversión        | `PROC-CAT-013`, `PROC-CAT-014` y dominio funcional aplicable     |
| Dinero, Caja, medios de pago y Contabilidad  | BLOQUE E2, NUMERA y PULSO antes de implementación                |
| Alta, modificación y baja de accesos         | `PROC-ACTOR-*` y bloques de autorización antes de implementación |
| Contratos entre aplicaciones                 | BLOQUE X                                                         |
| Modo offline, reintentos e idempotencia      | `NFR-REQ-004`, `CODE-AUD-018`, BLOQUES E4 y E5                   |
| Energía, red, dispositivos y recuperación    | `NFR-REQ-008`, `NFR-REQ-010` y BLOQUE E5                         |
| Variantes menores por sede, turno o persona  | Prototipo y piloto de la capacidad correspondiente               |
| Cifras no medidas                            | Instrumentación y piloto del proceso correspondiente             |

Ninguna de estas incertidumbres podrá quedar como pendiente narrativo sin tarea.

---

#### 5. Regla de validación posterior

Durante el desarrollo de una capacidad:

```text
DISEÑO O PROTOTIPO
→ PRESENTACIÓN AL USUARIO REAL
→ VALIDACIÓN DEL FLUJO
→ CORRECCIÓN
→ PILOTO
→ ACEPTACIÓN
```

Solo se consultará nuevamente a trabajadores o responsables cuando:

- exista una duda material;
- aparezca una contradicción;
- el flujo diseñado afecte su ejecución;
- se vaya a activar la capacidad en producción.

No se realizarán once paquetes de entrevistas generales antes de continuar.

---

#### 6. Resultado

Con `OPS-AUD-015` queda cerrada la auditoría inicial AS-IS con evidencia suficiente para continuar.

Queda establecido que:

- la operación real fue levantada con detalle suficiente;
- las brechas principales están identificadas;
- las incertidumbres restantes tienen momento de resolución;
- no se exige validación exhaustiva antes de avanzar;
- la validación final de cada capacidad ocurrirá durante diseño, prototipo y piloto.

---

#### 7. Continuidad

La continuidad canónica deberá realizarse exclusivamente con:

```text
OPS-ADM-001
— Documentar brecha registral y plan de regularización de la sede administrativa
```

`OPS-AUD-015` no autoriza todavía código, migraciones, cambios físicos en Supabase ni implementación de capacidades.
