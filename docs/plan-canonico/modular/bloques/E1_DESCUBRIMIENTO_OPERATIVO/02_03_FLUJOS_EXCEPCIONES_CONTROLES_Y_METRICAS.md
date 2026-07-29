### MINI-BLOQUE — FLUJOS EXCEPCIONES CONTROLES Y METRICAS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **flujos excepciones controles y metricas** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `OPS-AUD-007` a `OPS-AUD-010` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `OPS-AUD-007`: Documentar flujo ordinario de cada proceso
- `OPS-AUD-008`: Documentar excepciones, correcciones, anulaciones, devoluciones y reversión
- `OPS-AUD-009`: Documentar aprobaciones, segregación de funciones y controles manuales
- `OPS-AUD-010`: Medir frecuencia, volumen, criticidad, tiempos y estacionalidad
<!-- PLAN-SECTION-META:END -->

### ✅ OPS-AUD-007 — Documentar flujo ordinario de cada proceso

**Estado:** APROBADO  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Documentación AS-IS de los flujos ordinarios actuales  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-006`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando un paso, actor, artefacto o traspaso no esté suficientemente confirmado

---

#### 1. Propósito

Documentar cómo se ejecutan actualmente los procesos ordinarios de Vento Group, desde su evento de inicio hasta su resultado operativo inmediato.

Cada flujo deberá identificar:

- evento de inicio;
- actor iniciador;
- actor ejecutor;
- herramientas y artefactos;
- secuencia habitual;
- traspasos entre personas, áreas, sedes o sistemas;
- resultado;
- receptor;
- punto de cierre operativo actual;
- puntos donde el flujo depende de memoria, comunicación verbal, papel o transcripción.

Esta tarea describe el proceso ordinario.

No resuelve todavía:

- excepciones;
- anulaciones;
- devoluciones;
- reversiones;
- faltantes no ordinarios;
- aprobaciones;
- segregación de funciones;
- tiempos medidos;
- volumen;
- contingencias;
- diseño TO-BE;
- pantallas;
- datos;
- integraciones;
- implementación.

```text
FLUJO AS-IS
→ describe cómo ocurre hoy

FLUJO AS-IS
≠ flujo TO-BE obligatorio
```

---

#### 2. Convención de modelado

Cada proceso se describe con esta estructura:

```text
INICIO
→ RECEPCIÓN
→ EJECUCIÓN
→ TRASPASO
→ RESULTADO
→ CIERRE ACTUAL
```

Campos mínimos:

| Campo           | Descripción                              |
| --------------- | ---------------------------------------- |
| `process_code`  | Código provisional del proceso           |
| `process_name`  | Nombre operativo                         |
| `trigger`       | Evento que lo inicia                     |
| `initiator`     | Actor que lo origina                     |
| `executor`      | Actor que realiza la actividad principal |
| `tools`         | Herramientas y artefactos utilizados     |
| `ordinary_flow` | Secuencia habitual                       |
| `handoff`       | Traspasos entre actores o sistemas       |
| `result`        | Resultado inmediato                      |
| `receiver`      | Actor que recibe el resultado            |
| `current_close` | Condición actual de cierre               |
| `known_gap`     | Brecha conocida                          |
| `next_task`     | Tarea exacta que profundiza              |

---

#### 3. Inventario maestro de procesos ordinarios

| Código     | Proceso                              | Inicio                                         | Resultado ordinario                          |
| ---------- | ------------------------------------ | ---------------------------------------------- | -------------------------------------------- |
| `PROC-001` | Solicitud de remisión interna        | Área detecta necesidad                         | Solicitud enviada al grupo                   |
| `PROC-002` | Consolidación productiva             | Llegan solicitudes de sedes                    | Cantidad total definida por producto         |
| `PROC-003` | Preparación matutina de remisión     | Conductor inicia jornada                       | Canastas organizadas por destino             |
| `PROC-004` | Producción de Panadería y Bollería   | Plan anticipado y remisiones                   | Producto disponible para despacho            |
| `PROC-005` | Producción de Repostería             | Remisiones recibidas                           | Producto separado por sede                   |
| `PROC-006` | Producción de Tortas                 | Remisiones recibidas                           | Tortas estandarizadas terminadas             |
| `PROC-007` | Producción de Galletería             | Stock bajo y remisiones                        | Galletas disponibles por sede                |
| `PROC-008` | Producción de Cocina Caliente        | Plan semanal                                   | Preparaciones porcionadas en frío            |
| `PROC-009` | Producción semanal de Barra          | Día fijo de producción                         | Producto porcionado y almacenado             |
| `PROC-010` | Alistamiento y despacho de la tarde  | Producción deja producto terminado             | Vehículo cargado por destino                 |
| `PROC-011` | Transporte y entrega a sede          | Vehículo sale del Centro de Producción         | Productos recibidos en sede                  |
| `PROC-012` | Retorno y lavado de canastas         | Canasta vacía o sucia                          | Canasta seca y reutilizable                  |
| `PROC-013` | Recepción de proveedor               | Proveedor llega                                | Mercancía ubicada y factura firmada          |
| `PROC-014` | Retiro de insumos de Bodega          | Área necesita producto                         | Insumo trasladado al área                    |
| `PROC-015` | Compra a proveedor                   | Se detecta faltante                            | Pedido confirmado                            |
| `PROC-016` | Recepción de fruver                  | Proveedor llega a Vento Café                   | Producto recibido por área                   |
| `PROC-017` | Apertura de Vento Café               | Inicia turno                                   | Local, Caja y canales habilitados            |
| `PROC-018` | Atención de mesa en Vento Café       | Cliente ocupa mesa                             | Pedido servido y cuenta abierta              |
| `PROC-019` | Preparación en Cocina de Vento Café  | Comanda impresa                                | Plato listo en ventana                       |
| `PROC-020` | Preparación en Bar y Barra           | Comanda impresa                                | Bebida o producto listo                      |
| `PROC-021` | Pago en Vento Café                   | Cliente solicita cuenta                        | Venta cerrada y facturada                    |
| `PROC-022` | Pedido Rappi                         | Pedido entra en Rappi                          | Pedido transcrito, preparado y entregado     |
| `PROC-023` | Pedido directo o domicilio           | Pedido entra por ManyChat                      | Pedido registrado y despachado               |
| `PROC-024` | Atención ordinaria en Saudo          | Cliente pide en mesa, vitrina o canal externo  | Pedido servido y cobrado                     |
| `PROC-025` | Preparación ordinaria en Saudo       | Pedido registrado o comunicado                 | Producto listo                               |
| `PROC-026` | Atención ordinaria en Molka          | Cliente pide en mostrador                      | Pedido pagado y entregado                    |
| `PROC-027` | Cierre y relevo de Caja              | Termina turno                                  | Caja cerrada y siguiente turno abierto       |
| `PROC-028` | Entrega de efectivo a Gerencia       | Existe excedente del cierre                    | Dinero contado y recibido                    |
| `PROC-029` | Registro contable de soporte         | Gerencia recibe factura o comprobante          | Documento cargado o entregado a Contabilidad |
| `PROC-030` | Programación de turnos               | Gerencia organiza personal                     | Horario publicado en VISO                    |
| `PROC-031` | Consulta y check-in                  | Trabajador llega al turno                      | Asistencia registrada en ANIMA               |
| `PROC-032` | Revisión de asistencia               | Gerencia descarga reporte                      | Novedades identificadas                      |
| `PROC-033` | Liquidación de propinas              | Existen reportes y valor a distribuir          | Dinero entregado al trabajador               |
| `PROC-034` | Pago de nómina                       | Nómina preparada                               | Pago ejecutado por Bancolombia Nóminas       |
| `PROC-035` | Reclutamiento y contratación         | Se abre vacante                                | Trabajador contratado                        |
| `PROC-036` | Inducción operativa                  | Trabajador inicia                              | Trabajador acompaña y aprende en operación   |
| `PROC-037` | Alta de acceso                       | Gerencia solicita cuenta                       | Cuenta creada en ANIMA o Vento OS            |
| `PROC-038` | Baja de acceso                       | Jefe de Operaciones descubre retiro            | Cuenta desactivada                           |
| `PROC-039` | Solicitud y publicación de Marketing | Nathalia o Jeo solicitan contenido             | Pieza publicada                              |
| `PROC-040` | Venta y despacho de Vaila Vainilla   | Pedido entra en Shopify o canal complementario | Paquete entregado a mensajería               |
| `PROC-041` | Soporte tecnológico                  | Se reporta una falla                           | Equipo o servicio restablecido               |
| `PROC-042` | Mantenimiento correctivo             | Se detecta una falla física                    | Técnico repara                               |
| `PROC-043` | Disposición de merma                 | Trabajador detecta producto dañado             | Producto eliminado y registrado              |
| `PROC-044` | Reasignación de producto a Molka     | Producto pierde frescura comercial             | Producto recibido por Molka                  |
| `PROC-045` | Servicios Generales                  | Inicia jornada o llega instrucción             | Área o elemento limpio                       |

---

#### 4. Abastecimiento interno y remisiones

##### 4.1. Solicitud de remisión interna — `PROC-001`

**Inicio**

El área o sede determina qué productos necesita para la siguiente jornada o período inmediato.

**Actores**

- Caja o Servicio de Vento Café;
- Cocina de Vento Café;
- Barra de Vento Café;
- responsable de Saudo;
- responsable de Molka.

**Flujo ordinario**

```text
RESPONSABLE DEL ÁREA
→ REVISA NECESIDADES
→ ABRE O COMPLETA EXCEL
→ REGISTRA CANTIDADES
→ TOMA CAPTURA O FOTOGRAFÍA
→ ENVÍA AL GRUPO
→ PRODUCCIÓN Y CONDUCTOR RECIBEN
```

La solicitud suele enviarse al final del turno.

Vento Café envía solicitudes separadas por área.

Saudo y Molka envían una solicitud unificada.

**Herramientas**

- Excel;
- captura o fotografía;
- WhatsApp.

**Resultado**

Solicitud visible en el grupo operativo.

**Cierre actual**

El proceso se considera iniciado cuando la captura ha sido enviada. No existe confirmación estructurada de recepción.

**Brechas relacionadas**

- solicitud olvidada;
- versión no controlada;
- ausencia de confirmación;
- identificación individual incompleta.

Destinos: `OPS-AUD-008`, `OPS-AUD-012`, `OPS-AUD-013` y `OPS-AUD-015`.

---

##### 4.2. Consolidación por área productiva — `PROC-002`

**Inicio**

Las áreas productivas reciben varias solicitudes.

**Actores**

- responsables de Panadería;
- Repostería;
- Pastelería;
- Galletería;
- otras áreas productivas.

**Flujo ordinario**

```text
CAPTURAS DE VARIAS SEDES
→ RESPONSABLE REVISA PRODUCTOS
→ SUMA CANTIDADES
→ REGISTRA TOTAL EN TABLERO O TELÉFONO
→ DISTRIBUYE EL TRABAJO
```

**Resultado**

Cantidad total aproximada que debe producir el área.

**Cierre actual**

El responsable considera consolidada la necesidad cuando dispone de un total utilizable.

**Brecha**

El consolidado no queda necesariamente relacionado con cada solicitud original.

Destino: `OPS-AUD-012` y `OPS-AUD-013`.

---

##### 4.3. Preparación matutina de remisión — `PROC-003`

**Inicio**

El conductor llega aproximadamente a las 05:30 al Centro de Producción.

**Flujo ordinario**

```text
CONDUCTOR ABRE EL CENTRO
→ REVISA REMISIONES DEL DÍA ANTERIOR
→ RECORRE BODEGA Y COCINA CALIENTE
→ UBICA PRODUCTOS POR EXPERIENCIA
→ RETIRA CANTIDADES DISPONIBLES
→ ORGANIZA CANASTAS POR DESTINO
→ CARGA EL VEHÍCULO
```

Los productos se ubican mediante:

- memoria;
- experiencia;
- marcaciones;
- conocimiento visual.

**Resultado**

Remisiones de la mañana preparadas, principalmente para Vento Café, Saudo y Molka.

**Cierre actual**

El conductor sale con las canastas organizadas.

**Brecha**

La cantidad faltante puede no notificarse antes de la entrega.

Destino: `OPS-AUD-008`.

---

#### 5. Producción central

##### 5.1. Panadería y Bollería — `PROC-004`

**Inicio**

El flujo combina:

- planificación anticipada;
- fermentaciones;
- stock de masas;
- remisiones del día.

**Flujo ordinario**

```text
JEFE DE PANADERÍA REVISA NECESIDADES
→ DEFINE CANTIDADES POR EXPERIENCIA
→ DISTRIBUYE TAREAS
→ EQUIPO PREPARA MASAS
→ FERMENTA O REPOSA
→ HORNEA SEGÚN REMISIONES
→ EMPACA
→ DEJA PRODUCTO EN CANASTAS O BANDEJAS
```

Los productos no se separan formalmente por sede.

El conductor reconoce y distribuye.

**Resultado**

Producto terminado disponible para despacho.

**Cierre actual**

El área deja la producción en el punto acordado y puede reportar el resultado en el grupo.

**Brechas**

- reporte no controla despacho;
- faltantes sin aviso preventivo;
- prioridad cultural entre sedes.

Destinos: `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

---

##### 5.2. Repostería — `PROC-005`

**Inicio**

Angélica revisa las remisiones.

**Flujo ordinario**

```text
ANGÉLICA REVISA SOLICITUDES
→ PRIORIZA PRODUCTOS
→ DISTRIBUYE A CHELSY Y VALENTINA
→ EQUIPO PRODUCE
→ EMPACA
→ SEPARA POR SEDE
→ DEJA EN CANASTAS
```

La sede se reconoce por la combinación de productos, no por etiqueta formal.

**Resultado**

Productos de Repostería separados por sede.

**Cierre actual**

Canastas disponibles para el conductor.

---

##### 5.3. Pastelería y Tortas — `PROC-006`

**Inicio**

Angélica identifica las tortas requeridas.

**Flujo ordinario**

```text
ANGÉLICA REVISA REMISIONES
→ INSTRUYE A VALENTINA
→ VALENTINA EJECUTA PROCESO COMPLETO
→ TERMINA TORTAS ESTANDARIZADAS
→ DEJA PRODUCTO DISPONIBLE
```

Después, Valentina puede apoyar otras áreas.

**Resultado**

Tortas listas para distribución.

**Cierre actual**

El conductor identifica el destino.

**Brecha**

No existe identificación formal por sede.

Destino: `OPS-AUD-013`.

---

##### 5.4. Galletería — `PROC-007`

**Inicio**

El stock disponible disminuye o se requiere hornear para cubrir remisiones.

**Flujo ordinario**

```text
TRABAJADORA REVISA STOCK
→ CONSULTA A ANGÉLICA
→ PREPARA MASA SI SE AUTORIZA OPERATIVAMENTE
→ HORNEA CANTIDAD NECESARIA
→ SEPARA POR SEDE
```

Una o dos recetas producen aproximadamente 104 galletas.

**Resultado**

Stock disponible y producto separado por sede.

**Cierre actual**

Canastas listas para despacho.

**Pendiente**

Nombre y alcance exacto de la responsable: `OPS-AUD-015`.

---

##### 5.5. Cocina Caliente — `PROC-008`

**Inicio**

Día de producción definido por el plan semanal.

**Flujo ordinario**

```text
COCINERA REVISA PLAN Y EXISTENCIAS
→ PRIORIZA PREPARACIONES FALTANTES
→ PRODUCE
→ PORCIONA
→ EMPACA AL VACÍO
→ REFRIGERA
```

La cocinera no trabaja directamente desde la remisión.

Después:

```text
CONDUCTOR REVISA REMISIÓN
→ RETIRA MÚLTIPLOS DE LA PRESENTACIÓN
→ DESPACHA
```

**Resultado**

Preparaciones disponibles en frío.

**Cierre actual**

Producto almacenado y accesible para el conductor.

**Pendiente**

Confirmar si el plan está escrito: `OPS-AUD-015`.

---

##### 5.6. Producción semanal de Barra — `PROC-009`

**Inicio**

Llega el martes y existe una persona programada.

**Flujo ordinario**

```text
RESPONSABLE DE PROGRAMACIÓN DEFINE ROTACIÓN
→ TRABAJADOR DE VENTO CAFÉ O SAUDO ASISTE
→ PRODUCE CANTIDAD ESTÁNDAR
→ PORCIONA
→ CONGELA O REFRIGERA
→ CONDUCTOR RETIRA SEGÚN REMISIÓN
```

**Resultado**

Preparaciones de Barra almacenadas.

**Cierre actual**

Producto disponible para Vento Café o Saudo.

---

#### 6. Alistamiento, transporte y recepción

##### 6.1. Alistamiento de la tarde — `PROC-010`

**Inicio**

Las áreas productivas terminan el trabajo del día.

**Flujo ordinario**

```text
ÁREA PRODUCTIVA EMPACA
→ PRODUCTO REFRIGERADO VA A CUARTO FRÍO
→ PRODUCTO CONGELADO VA A CONGELADOR
→ PRODUCTO SECO QUEDA EN MESÓN O CANASTA
→ CONDUCTOR LLEGA APROXIMADAMENTE A LAS 17:00
→ RECOGE PRODUCCIÓN
→ COMPLETA BODEGA Y COCINA CALIENTE
→ ORGANIZA POR DESTINO
→ CARGA VEHÍCULO
```

El proceso puede tomar entre 1,5 y 2 horas.

**Resultado**

Vehículo cargado.

**Cierre actual**

El conductor sale del Centro de Producción.

---

##### 6.2. Transporte y recepción en sede — `PROC-011`

**Inicio**

El conductor llega a la sede.

**Flujo ordinario**

```text
CONDUCTOR DESCARGA CANASTAS
→ RESPONSABLE DEL ÁREA O DELEGADO RECIBE
→ CUENTA O REVISA
→ GUARDA PRODUCTOS
```

Prioridad de almacenamiento:

1. congelados;
2. refrigerados;
3. productos secos.

En momentos de carga:

- Caja o mostrador puede dejar productos en canastas o bandejas;
- Cocina y Barra pueden dejarlos temporalmente sobre mesones.

**Resultado**

Producto disponible en sede.

**Cierre actual**

El área guarda lo recibido.

**Brecha**

No existe confirmación estructurada de recepción completa o diferencia.

Destino: `OPS-AUD-008` y `OPS-AUD-013`.

---

##### 6.3. Retorno y lavado de canastas — `PROC-012`

**Inicio**

Una canasta queda vacía o se acumula suciedad.

**Flujo ordinario**

```text
SEDE ENTREGA CANASTAS VACÍAS
→ CONDUCTOR LAS RECOGE
→ REGRESA AL CENTRO DE PRODUCCIÓN
→ DEJA EN BODEGA O PASILLO
→ NATHALIA O RESPONSABLE SOLICITA LAVADO
→ SERVICIOS GENERALES LAVA
→ CANASTAS SECAN EN ZONA ABIERTA
→ CONDUCTOR VERIFICA VISUALMENTE
→ REUTILIZA
```

**Resultado**

Canasta disponible.

**Cierre actual**

El conductor considera que está seca y la usa.

**Brechas**

- sin custodio;
- sin estado;
- sin conteo;
- sin trazabilidad por sede.

Destinos: `OPS-AUD-010`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 7. Compras, proveedores y Bodega

##### 7.1. Recepción de proveedor — `PROC-013`

**Inicio**

El proveedor llega al Centro de Producción.

**Flujo ordinario confirmado cuando recibe el Jefe de Operaciones**

```text
PROVEEDOR ENTREGA MERCANCÍA
→ RECEPTOR REVISA VISUALMENTE
→ INDICA UBICACIÓN
→ SUPERVISA ORGANIZACIÓN
→ COMPARA CONTRA FACTURA
→ FIRMA
→ ENTREGA COPIA AL PROVEEDOR
→ CONSERVA SOPORTE
→ FACTURA LLEGA A GERENCIA
```

**Resultado**

Mercancía ubicada y documento firmado.

**Cierre actual**

El proveedor se retira y la factura continúa hacia Gerencia.

**Pendiente**

Flujo cuando recibe otra persona: `OPS-AUD-015`.

---

##### 7.2. Retiro de insumos de Bodega — `PROC-014`

**Inicio**

Un área necesita insumos.

**Flujo ordinario**

```text
TRABAJADOR INGRESA A BODEGA
→ IDENTIFICA PRODUCTO
→ DEFINE CANTIDAD POR RECETA, PEDIDO, SOLICITUD O EXPERIENCIA
→ RETIRA
→ LLEVA AL ÁREA
→ UTILIZA
→ SOBRANTE PERMANECE EN EL ÁREA
```

**Resultado**

Área abastecida.

**Cierre actual**

El producto queda en la estación o almacenamiento interno del área.

**Brechas**

- ingreso libre;
- sin registro completo;
- sin devolución de sobrantes;
- sin inventario confiable.

Destinos: `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

---

##### 7.3. Compra a proveedor — `PROC-015`

**Inicio**

Un área reporta faltante o Gerencia pregunta qué hace falta.

**Flujo ordinario**

```text
ÁREAS INFORMAN NECESIDADES
→ GERENTE GENERAL CONSOLIDA
→ DEFINE CANTIDADES POR EXPERIENCIA Y URGENCIA
→ GERENTE GENERAL O LEIDY ESCRIBE AL PROVEEDOR
→ PROVEEDOR CONFIRMA DISPONIBILIDAD, PRECIO Y FECHA
→ PEDIDO QUEDA ACORDADO
→ PROVEEDOR ENTREGA
```

**Resultado**

Pedido confirmado.

**Cierre actual**

La compra continúa con la recepción física.

**Brechas**

- sin inventario confiable;
- sin orden formal confirmada;
- aprobación y comparación de precios no documentadas.

Destinos: `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-015`.

---

##### 7.4. Recepción de fruver — `PROC-016`

**Inicio**

Proveedor de fruver llega a Vento Café.

**Flujo ordinario conocido**

```text
PROVEEDOR ENTREGA
→ COCINA O BARRA RECIBE SEGÚN SOLICITANTE
→ PRODUCTO SE UTILIZA EN VENTO CAFÉ
→ PARTE PUEDE REDISTRIBUIRSE A SAUDO
```

**Resultado**

Fruver disponible para producción o servicio.

**Pendientes**

- comparación contra pedido;
- factura;
- redistribución a Saudo;
- registro de diferencia.

Destino: `OPS-AUD-015`.

---

#### 8. Vento Café

##### 8.1. Apertura — `PROC-017`

**Inicio**

Comienza el turno.

**Flujo ordinario**

```text
EQUIPO ABRE EL LOCAL
→ PREPARA ZONAS
→ CAJERO INICIA SESIÓN
→ CUENTA EFECTIVO
→ REGISTRA BASE
→ ACTIVA RAPPI
→ ABRE MANYCHAT
→ ORGANIZA VITRINA
→ MESEROS DEFINEN ZONAS
```

**Resultado**

Vento Café listo para operar.

**Cierre actual**

Canales, Caja y áreas habilitados.

---

##### 8.2. Atención de mesa — `PROC-018`

**Inicio**

Cliente ocupa una mesa.

**Flujo ordinario**

```text
MESERO ATIENDE
→ REGISTRA PEDIDO EN TABLET
→ SELECCIONA MESA
→ MAKOS ABRE CUENTA
→ IMPRIME COMANDAS POR ESTACIÓN
→ ÁREAS PREPARAN
→ MESERO DISPONIBLE RECOGE
→ ENTREGA A MESA
→ NUEVOS PEDIDOS SE AGREGAN A LA MISMA CUENTA
```

**Resultado**

Productos servidos y cuenta abierta.

**Cierre actual**

El proceso termina cuando el cliente solicita pagar.

---

##### 8.3. Cocina — `PROC-019`

**Inicio**

Se imprime una comanda.

**Flujo ordinario**

```text
COCINERO CERCANO RECOGE
→ COLOCA EN COMANDERA
→ EQUIPO DISTRIBUYE TAREAS
→ PREPARA POR ORDEN DE LLEGADA
→ COLOCA PLATO EN VENTANA
→ TOCA CAMPANA
→ DICE MESA
→ MESERO RECOGE
```

**Resultado**

Plato entregado a Servicio.

**Cierre actual**

El mesero retira el plato.

**Brecha**

No existe estado digital de listo, recogido o entregado.

---

##### 8.4. Bar y Barra — `PROC-020`

**Inicio**

Makos imprime en estación caliente o fría.

**Flujo ordinario**

```text
TRABAJADOR REVISA COMANDA
→ PREPARA POR ORDEN DE LLEGADA
→ TERMINA PRODUCTO
→ TOCA CAMPANA
→ MESERO DISPONIBLE RECOGE
```

Cuando trabajan dos personas se reparten de manera flexible.

Cuando trabaja una, cubre ambas estaciones.

**Resultado**

Bebida o producto entregado a Servicio.

---

##### 8.5. Pago — `PROC-021`

**Inicio**

Cliente solicita cuenta.

**Flujo ordinario**

```text
TRABAJADOR IMPRIME RESUMEN
→ CLIENTE REVISA
→ DEFINE MEDIO DE PAGO
```

**Efectivo**

```text
CLIENTE PAGA EN CAJA
→ CAJERO RECIBE
→ REGISTRA
→ ENTREGA CAMBIO
→ CIERRA MESA
→ IMPRIME FACTURA
```

**Tarjeta**

```text
TRABAJADOR LLEVA DATÁFONO
→ PROCESA PAGO
→ INFORMA VERBALMENTE A CAJA
→ CAJERO REGISTRA TARJETA
→ CIERRA MESA
→ IMPRIME FACTURA
```

**Resultado**

Venta cerrada.

**Brecha**

La persona que procesa físicamente la tarjeta puede ser distinta de quien registra el pago.

Destino: `OPS-AUD-009` y `OPS-AUD-013`.

---

##### 8.6. Pedido Rappi — `PROC-022`

**Inicio**

Rappi recibe un pedido.

**Flujo ordinario**

```text
CAJERO REVISA RAPPI
→ TRANSCRIBE A MAKOS
→ CLASIFICA COMO RAPPI
→ MAKOS ENVÍA A ESTACIONES
→ ÁREAS PREPARAN
→ PEDIDO SE EMPACA
→ DOMICILIARIO RECOGE
```

**Resultado**

Pedido entregado al domiciliario.

**Cierre actual**

La entrega al domiciliario cierra el proceso interno ordinario.

**Brecha**

No se confirmó conciliación automática entre estados de Rappi y Makos.

---

##### 8.7. Pedido directo o domicilio — `PROC-023`

**Inicio**

Cliente solicita por ManyChat u otro canal directo.

**Flujo ordinario**

```text
CAJERO RECIBE DATOS
→ CONFIRMA PEDIDO Y PAGO
→ TRANSCRIBE A MAKOS COMO DOMICILIO
→ SOLICITA MENSAJERO
→ ÁREAS PREPARAN
→ FACTURA INCLUYE DATOS DEL CLIENTE
→ CAJERO INDICA AL MENSAJERO SI DEBE PAGAR
→ MENSAJERO RECOGE
→ CAJERO AVISA AL CLIENTE QUE VA EN CAMINO
```

**Modalidad prepagada**

Vento paga en efectivo el valor del domicilio.

**Modalidad efectivo**

El mensajero entrega previamente a Vento el valor del pedido y después cobra al cliente pedido más domicilio.

**Resultado**

Pedido en ruta.

**Cierre actual**

No existe confirmación rutinaria de entrega; se considera cerrado salvo incidente.

---

#### 9. Saudo

##### 9.1. Atención y servicio — `PROC-024`

**Inicio**

El cliente:

- ocupa una mesa;
- compra en vitrina;
- pide por Rappi;
- solicita domicilio.

**Flujo de mesa**

```text
MESERO REGISTRA EN TABLET O CELULAR
→ ASOCIA A MESA
→ CAJA Y COCINA CONOCEN PEDIDO
→ COCINA PREPARA
→ MESERO O CAJERO ENTREGA
→ CUENTA PERMANECE ABIERTA
→ CLIENTE PAGA
```

**Flujo de vitrina**

```text
CLIENTE PIDE EN CAJA
→ CAJERO REGISTRA
→ ENTREGA O COORDINA PREPARACIÓN
→ COBRA
```

**Resultado**

Pedido servido y venta cerrada.

---

##### 9.2. Cocina de Saudo — `PROC-025`

**Inicio**

Pedido registrado o comunicado verbalmente.

**Flujo ordinario**

```text
CAJA O SERVICIO COMUNICA
→ COCINEROS CONSULTAN MAKOS CUANDO HAY VARIOS
→ COCINERO PRINCIPAL Y APOYO SE COORDINAN
→ PREPARAN
→ ANUNCIAN VERBALMENTE
→ MESERO O CAJERO ENTREGA
```

Las pizzas se preparan según capacidad de dos hornos.

**Resultado**

Producto entregado a Servicio.

**Cierre actual**

El pedido sale de Cocina.

---

#### 10. Molka

##### 10.1. Atención integral — `PROC-026`

**Inicio**

Cliente pide en mostrador.

**Flujo ordinario**

```text
TRABAJADOR RECIBE PEDIDO
→ REGISTRA EN MAKOS
→ COBRA
→ CONSULTA PEDIDO
→ PREPARA O CALIENTA
→ ENTREGA EN MOSTRADOR O MESA
```

Cuando trabajan dos personas, ambas pueden ejecutar cualquier paso y se coordinan según la carga.

**Resultado**

Pedido pagado y entregado.

**Cierre actual**

Entrega al cliente.

---

#### 11. Caja, Gerencia y Contabilidad

##### 11.1. Cierre y relevo de Caja — `PROC-027`

**Inicio**

Termina el turno del cajero.

**Flujo ordinario**

```text
CAJERO CIERRA MAKOS
→ CUENTA EFECTIVO
→ COMPARA
→ TERMINA SESIÓN
→ SIGUIENTE CAJERO CUENTA BASE
→ ABRE SU SESIÓN
```

Vento Café maneja dos cierres por día.

Otras sedes normalmente un cierre.

**Resultado**

Turnos separados operativamente.

---

##### 11.2. Entrega de efectivo a Gerencia — `PROC-028`

**Inicio**

La sede dispone del excedente del día anterior.

**Flujo ordinario**

```text
SEDE CONSERVA BASE
→ ENTREGA EXCEDENTE
→ ENTREGA CIERRE IMPRESO
→ GERENTE GENERAL CUENTA
→ COMPARA CONTRA CIERRE
→ RECIBE CUSTODIA
→ ADMINISTRA SEGÚN NECESIDADES
```

**Resultado**

Efectivo bajo custodia de Gerencia.

**Brecha**

Algunos movimientos se registran como gasto en lugar de retiro.

---

##### 11.3. Registro contable — `PROC-029`

**Inicio**

Gerencia recibe una factura o comprobante.

**Flujo ordinario**

```text
SOPORTE LLEGA A GERENCIA
→ SE ENTREGA O CARGA PARA CONTABILIDAD
→ CONTABILIDAD REGISTRA
→ CONCILIACIÓN DETECTA FALTANTES
```

**Resultado**

Transacción soportada en el sistema contable.

**Pendiente**

Ruta exacta por tipo de soporte: `OPS-AUD-015`.

---

#### 12. Programación, asistencia, propinas y nómina

##### 12.1. Programación — `PROC-030`

**Inicio**

Se requiere organizar los turnos siguientes.

**Flujo ordinario**

```text
GERENTE GENERAL + GERENTE VENTO CAFÉ
→ REVISAN NECESIDADES
→ ASIGNAN PERSONAS, HORAS Y SEDES
→ PUBLICAN EN VISO
→ ANIMA NOTIFICA
```

**Resultado**

Horario visible para el trabajador.

**Cierre actual**

Turno publicado; no requiere aceptación.

---

##### 12.2. Consulta y check-in — `PROC-031`

**Inicio**

Trabajador consulta su horario y llega a la sede.

**Flujo ordinario**

```text
TRABAJADOR ABRE ANIMA
→ CONSULTA TURNO
→ LLEGA
→ REALIZA CHECK-IN
```

**Resultado**

Asistencia registrada.

---

##### 12.3. Revisión de asistencia — `PROC-032`

**Inicio**

Gerencia necesita revisar cumplimiento.

**Flujo ordinario**

```text
GERENTE GENERAL DESCARGA REPORTE DE VISO
→ REVISA RETRASOS Y AUSENCIAS
→ IDENTIFICA NOVEDADES
→ UTILIZA INFORMACIÓN EN DECISIONES POSTERIORES
```

**Resultado**

Novedades laborales conocidas.

---

##### 12.4. Propinas — `PROC-033`

**Inicio**

Existe un valor de propinas por distribuir.

**Flujo ordinario**

```text
GERENTE GENERAL CALCULA PROMEDIO
→ DISTRIBUYE POR TRABAJADOR
→ REVISA RETRASOS O AUSENCIAS
→ APLICA AJUSTES MANUALES
→ ENTREGA EFECTIVO
```

**Resultado**

Trabajador recibe propina.

**Cierre actual**

Entrega en efectivo.

**Brecha**

No existe registro estructurado de valor original, descuento, motivo y valor final.

---

##### 12.5. Nómina — `PROC-034`

**Inicio**

Se prepara el período de nómina.

**Flujo ordinario**

```text
GERENCIA O CONTABILIDAD PREPARA INFORMACIÓN
→ CARGA EN BANCOLOMBIA NÓMINAS
→ EJECUTA PAGO CONJUNTO
```

**Resultado**

Nómina formal pagada.

---

#### 13. Gestión laboral y accesos

##### 13.1. Reclutamiento y contratación — `PROC-035`

**Inicio**

Existe una vacante.

**Flujo ordinario**

```text
VACANTE SE PUBLICA EN INSTAGRAM
→ CANDIDATOS ENVÍAN HOJA DE VIDA
→ GERENTE GENERAL FILTRA
→ LLAMA
→ ENTREVISTA
→ CANDIDATO REALIZA PRUEBA
→ ÁREA + GERENTE GENERAL + NATHALIA OBSERVAN
→ NATHALIA Y GERENTE GENERAL DECIDEN
→ INFORMACIÓN VA A ABOGADOS
→ ABOGADOS FORMALIZAN
```

**Resultado**

Trabajador contratado.

**Brecha**

La evaluación de prueba no cuenta con formato estructurado confirmado.

---

##### 13.2. Inducción — `PROC-036`

**Inicio**

Trabajador comienza.

**Flujo ordinario**

```text
TRABAJADOR SE PRESENTA
→ ACOMPAÑA A EQUIPO O PERSONA DISPONIBLE
→ OBSERVA
→ EJECUTA CON APOYO
→ APRENDE DURANTE EL TRABAJO
```

En Vento Café, la gerente de sede guía el proceso.

Saudo y Molka no tienen modelo formal confirmado.

**Resultado**

Trabajador empieza a operar.

**Cierre actual**

No existe evaluación formal de capacidades.

---

##### 13.3. Alta de acceso — `PROC-037`

**Inicio**

Gerencia informa que una persona requiere acceso.

**Flujo ordinario**

```text
GERENCIA CONTACTA AL JEFE DE OPERACIONES
→ ENVÍA DATOS
→ JEFE DE OPERACIONES CREA CUENTA
→ TRABAJADOR RECIBE ACCESO
```

Aplica a ANIMA y Vento OS.

**Resultado**

Cuenta habilitada.

---

##### 13.4. Baja de acceso — `PROC-038`

**Inicio real**

El Jefe de Operaciones descubre durante la operación que la persona se retiró.

**Flujo ordinario**

```text
RETIRO LABORAL OCURRE
→ NO HAY NOTIFICACIÓN FORMAL
→ JEFE DE OPERACIONES SE ENTERA INFORMALMENTE
→ IDENTIFICA CUENTAS
→ DESACTIVA MANUALMENTE
```

**Resultado**

Cuenta desactivada.

**Brecha crítica**

Puede existir un período en el que el ex trabajador conserve acceso.

Destinos: `OPS-AUD-009`, `OPS-AUD-011` y `OPS-AUD-013`.

---

#### 14. Marketing

##### 14.1. Solicitud y publicación — `PROC-039`

**Inicio**

Nathalia o Jeo solicitan contenido.

**Flujo ordinario**

```text
SOLICITUD VERBAL O WHATSAPP
→ TRABAJADOR INTERPRETA
→ TOMA FOTO, VIDEO O DISEÑA
→ PREPARA PIEZA
```

**Historia**

```text
PIEZA TERMINADA
→ PUBLICACIÓN NORMALMENTE DIRECTA
```

**Publicación permanente**

```text
PIEZA TERMINADA
→ NATHALIA O JEO REVISA
→ APRUEBA
→ QUIEN CREÓ PUBLICA
```

**Resultado**

Contenido publicado.

**Cierre actual**

Pieza visible en la red social.

**Pendiente**

Método de corrección cuando se rechaza: `OPS-AUD-015`.

---

#### 15. Vaila Vainilla

##### 15.1. Venta y despacho — `PROC-040`

**Inicio**

Pedido entra principalmente por Shopify o por un canal complementario.

**Flujo confirmado**

```text
JEO RECIBE Y REVISA
→ CANALIZA A TRABAJADORA DE VENTAS EN LÍNEA
→ TRABAJADORA PREPARA Y EMPACA
→ PEDIDOS SE ACUMULAN
→ MENSAJERÍA LLEGA A OFICINA
→ TRABAJADORA ENTREGA PAQUETES
```

**Resultado**

Paquete entregado al transportador.

**Cierre actual**

No está confirmado si el cierre ocurre al entregar al mensajero o al recibir prueba de entrega.

**Pendientes**

- guía;
- notificación;
- inventario;
- pago;
- devolución;
- entrega fallida.

Destino: `OPS-AUD-015`.

---

#### 16. Soporte y mantenimiento

##### 16.1. Soporte tecnológico — `PROC-041`

**Inicio**

Trabajador reporta una falla por WhatsApp o verbalmente.

**Flujo ordinario**

```text
JEFE DE OPERACIONES RECIBE
→ PRIORIZA SEGÚN IMPACTO
→ PAUSA DESARROLLO CUANDO ES NECESARIO
→ DIAGNOSTICA
→ APLICA SOLUCIÓN
→ CONFIRMA FUNCIONAMIENTO
```

**Resultado**

Equipo o servicio restablecido.

**Cierre actual**

Se considera cerrado cuando vuelve a funcionar.

**Brecha**

No se documenta causa, solución ni activo.

Destino: `OPS-AUD-013`.

---

##### 16.2. Mantenimiento correctivo — `PROC-042`

**Inicio**

Un equipo o instalación presenta una falla.

**Flujo ordinario**

```text
TRABAJADOR DETECTA
→ INFORMA A GERENTE GENERAL
→ GERENTE GENERAL CONTACTA TÉCNICO
→ TÉCNICO REVISA
→ CONSIGUE REPUESTO SI ES NECESARIO
→ REPARA
→ EQUIPO VUELVE A OPERAR
```

**Resultado**

Equipo restablecido.

**Cierre actual**

Reparación terminada.

**Bloqueos ordinarios conocidos**

- técnico no disponible;
- repuesto no disponible.

**Pendiente**

Circuito de factura: `OPS-AUD-015`.

---

#### 17. Mermas y transferencias informales

##### 17.1. Disposición de merma — `PROC-043`

**Inicio**

Trabajador detecta daño por olor, sabor, moho o defecto.

**Flujo ordinario**

```text
TRABAJADOR DETECTA
→ DECIDE DESCARTAR
→ ELIMINA PRODUCTO
→ REGISTRA PRODUCTO Y CANTIDAD EN HOJA DE MERMAS
```

**Resultado**

Producto retirado físicamente.

**Cierre actual**

Registro escrito en la hoja.

**Brechas**

- misma persona decide y registra;
- inventario no se actualiza;
- causa y lote no confirmados.

Destinos: `OPS-AUD-008`, `OPS-AUD-009` y `OPS-AUD-013`.

---

##### 17.2. Reasignación a Molka — `PROC-044`

**Inicio**

Un producto está menos fresco para la sede original, pero todavía es consumible.

**Flujo ordinario**

```text
TRABAJADOR IDENTIFICA PRODUCTO
→ DECIDE QUE PUEDE IR A MOLKA
→ ENTREGA AL CONDUCTOR
→ INFORMA VERBALMENTE QUE ESTÁ VIEJO
→ CONDUCTOR TRANSPORTA
→ MOLKA INCORPORA A SU STOCK
```

**Resultado**

Producto disponible en Molka.

**Cierre actual**

Molka lo recibe sin transferencia formal.

**Brechas**

- sin fecha;
- sin lote;
- sin cantidad documentada;
- sin origen;
- sin efecto de inventario;
- sin vida útil restante.

Destinos: `OPS-AUD-008`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 18. Servicios Generales

##### 18.1. Limpieza ordinaria — `PROC-045`

**Inicio**

Comienza la jornada, se detecta una necesidad o llega una instrucción.

**Flujo ordinario**

```text
SERVICIOS GENERALES RECIBE INSTRUCCIÓN
→ PRIORIZA PEDIDO DIRECTO
→ CONTINÚA RUTINA
→ OBSERVA NECESIDADES
→ LIMPIA ÁREAS, ZONAS O ELEMENTOS
→ RESULTADO SE VERIFICA VISUALMENTE
```

Jerarquía de prioridad:

1. Nathalia o Carlos;
2. responsables de área;
3. rutina;
4. criterio propio.

**Resultado**

Zona o elemento limpio.

**Cierre actual**

Resultado visible; no existe checklist.

---

#### 19. Traspasos ordinarios entre actores y sistemas

| Origen               | Traspaso                  | Destino                 |
| -------------------- | ------------------------- | ----------------------- |
| Área solicitante     | Captura de Excel          | Grupo operativo         |
| Grupo operativo      | Solicitud interpretada    | Área productiva         |
| Producción           | Producto terminado        | Conductor               |
| Conductor            | Canastas                  | Sede                    |
| Sede                 | Canastas vacías           | Conductor               |
| Proveedor            | Mercancía y factura       | Centro de Producción    |
| Centro de Producción | Factura                   | Gerencia                |
| Gerencia             | Soporte                   | Contabilidad            |
| Rappi                | Pedido                    | Caja                    |
| Caja                 | Transcripción             | Makos                   |
| ManyChat             | Pedido                    | Caja                    |
| Makos                | Comanda                   | Cocina, Bar o Barra     |
| Cocina               | Plato listo               | Servicio                |
| Servicio             | Aviso de pago con tarjeta | Caja                    |
| VISO                 | Turno                     | ANIMA                   |
| ANIMA                | Check-in                  | VISO                    |
| Gerencia             | Solicitud de acceso       | Jefatura de Operaciones |
| Nathalia o Jeo       | Solicitud de contenido    | Marketing               |
| Shopify              | Pedido                    | Jeo                     |
| Jeo                  | Pedido                    | Trabajadora de ventas   |
| Trabajadora          | Paquete                   | Mensajería              |

---

#### 20. Puntos ordinarios de cierre insuficiente

Un proceso puede considerarse terminado operativamente sin que exista evidencia completa.

| Proceso         | Cierre actual              | Evidencia faltante                     |
| --------------- | -------------------------- | -------------------------------------- |
| Solicitud       | Captura enviada            | Confirmación de recepción              |
| Producción      | Producto dejado en canasta | Relación exacta con solicitud          |
| Despacho        | Vehículo sale              | Lista confirmada de carga              |
| Recepción       | Producto guardado          | Confirmación y diferencia              |
| Domicilio       | Pedido sale                | Entrega al cliente                     |
| Soporte técnico | Equipo funciona            | Causa y solución                       |
| Mantenimiento   | Equipo reparado            | Historial y soporte asociado           |
| Inducción       | Trabajador empieza         | Validación de competencia              |
| Baja de acceso  | Cuenta desactivada         | Fecha de retiro y tiempo de exposición |
| Propina         | Efectivo entregado         | Cálculo y aceptación                   |
| Marketing       | Publicación visible        | Encargo, aprobación y resultado        |
| Vaila Vainilla  | Paquete al mensajero       | Entrega final                          |

Estos cierres se profundizarán en `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-011` y `OPS-AUD-013`.

---

#### 21. Hallazgos transversales

##### 21.1. Los procesos cambian de medio varias veces

```text
EXCEL
→ IMAGEN
→ WHATSAPP
→ TABLERO
→ PRODUCTO FÍSICO
→ CONTEO
```

La continuidad depende de interpretación humana.

##### 21.2. El traspaso suele ser el punto de pérdida de información

Los principales traspasos sensibles son:

- solicitud a producción;
- producción a conductor;
- conductor a sede;
- proveedor a receptor;
- receptor a Gerencia;
- Gerencia a Contabilidad;
- plataforma externa a Makos;
- trabajador a Caja;
- Gerencia a Jefatura de Operaciones.

##### 21.3. El proceso ordinario no siempre registra al actor efectivo

Esto ocurre en:

- cuentas Makos compartidas;
- tablets;
- recepción delegada;
- retiro libre de Bodega;
- registro de merma;
- cuentas de redes;
- Marketing;
- canastas;
- dispositivos compartidos.

##### 21.4. El resultado físico puede diferir del registro

Ejemplos:

- producción reportada frente a producto recogido;
- solicitud frente a cantidad enviada;
- Rappi frente a Makos;
- cierre frente a efectivo;
- inventario digital frente a inventario físico.

##### 21.5. Varios flujos terminan antes del resultado empresarial real

Ejemplos:

```text
DOMICILIO
→ termina internamente cuando sale
→ no cuando el cliente recibe

VAILA VAINILLA
→ termina al entregar al mensajero
→ entrega final no confirmada

SOPORTE
→ termina cuando funciona
→ causa no queda registrada
```

##### 21.6. La polivalencia es parte del flujo ordinario

En Saudo, Molka, Servicio, Bar, Barra y soporte:

- la misma persona puede cambiar de función;
- la función depende de la carga;
- el cargo fijo no describe toda la ejecución.

---

#### 22. Separación frente a tareas siguientes

##### 22.1. `OPS-AUD-008`

Deberá documentar:

- solicitud olvidada;
- faltante;
- parcial;
- sustitución;
- rechazo;
- producto dañado;
- corrección;
- anulación;
- devolución;
- reimpresión;
- entrega fallida;
- reversión de pago;
- cancelación externa.

##### 22.2. `OPS-AUD-009`

Deberá definir el estado AS-IS de:

- aprobadores;
- custodios;
- doble control;
- segregación;
- acciones sensibles;
- responsabilidad de dinero;
- acceso;
- compra;
- merma;
- transferencia;
- publicación.

##### 22.3. `OPS-AUD-010`

Deberá medir:

- frecuencia;
- volumen;
- duración;
- carga;
- estacionalidad;
- criticidad;
- ventanas de corte.

##### 22.4. `OPS-AUD-011`

Deberá modelar dependencias entre:

- sedes;
- áreas;
- sistemas;
- personas;
- proveedores;
- mensajerías;
- técnicos;
- abogados;
- bancos.

##### 22.5. `OPS-AUD-012`

Deberá identificar conciliaciones entre:

- Excel y captura;
- captura y producción;
- producción y despacho;
- despacho y recepción;
- Rappi y Makos;
- ManyChat y Makos;
- cierre y efectivo;
- factura y sistema contable;
- asistencia y propina;
- inventario físico y digital.

##### 22.6. `OPS-AUD-013`

Deberá consolidar pérdida de:

- actor;
- fecha;
- versión;
- estado;
- custodia;
- origen;
- destino;
- causa;
- evidencia;
- responsabilidad.

---

#### 23. Decisiones propuestas

1. El flujo ordinario se documenta desde el evento de inicio hasta el cierre operativo actual.
2. La solicitud de remisión inicia en el área y se ejecuta mediante Excel, captura y WhatsApp.
3. La consolidación productiva ocurre manualmente por área.
4. El conductor prepara las remisiones matutinas por experiencia y disponibilidad física.
5. La producción central combina planes anticipados, stock y solicitudes.
6. El alistamiento de la tarde depende de que cada área deje producto en puntos conocidos.
7. La recepción en sede se confirma físicamente, pero no mediante un registro estructurado.
8. Las canastas retornan y se lavan sin trazabilidad.
9. La recepción de proveedores se soporta en revisión física y factura.
10. Los retiros de Bodega se realizan sin control completo.
11. Las compras nacen de faltantes reportados y se acuerdan por WhatsApp.
12. Vento Café opera con comandas impresas y coordinación verbal.
13. Saudo opera con Makos, comunicación verbal y capacidad física limitada.
14. Molka opera con personal polivalente y pago previo.
15. Rappi y ManyChat requieren transcripción manual.
16. El cierre de Caja y la entrega de efectivo son procesos distintos.
17. VISO y ANIMA cubren programación y asistencia, pero no aceptación, reemplazo ni consecuencias económicas completas.
18. La propina se liquida manualmente fuera de los sistemas.
19. La contratación y la inducción carecen de evaluación estructurada confirmada.
20. La baja de acceso inicia tarde porque no existe notificación formal.
21. Marketing opera por encargos informales.
22. Vaila Vainilla cierra internamente al entregar a mensajería, sin prueba final confirmada.
23. Soporte y mantenimiento cierran cuando el activo vuelve a funcionar, sin historial consolidado.
24. La merma y la reasignación a Molka carecen de integración con inventario.
25. Ningún flujo AS-IS se adopta automáticamente como flujo TO-BE.
26. Ninguna decisión autoriza pantallas, tablas, código, migraciones, integraciones ni cambios en Supabase.

---

#### 24. Criterios de aceptación

`OPS-AUD-007` podrá aprobarse cuando se confirme que:

- los principales procesos ordinarios tienen inicio, ejecución, traspaso, resultado y cierre;
- se cubren remisiones, producción, logística, compras, venta, Caja, trabajo, Marketing, soporte, mantenimiento, merma y Vaila Vainilla;
- se identifican herramientas y artefactos;
- se documentan los traspasos;
- se separan hechos confirmados de pendientes;
- las excepciones permanecen reservadas para `OPS-AUD-008`;
- las aprobaciones permanecen reservadas para `OPS-AUD-009`;
- las mediciones permanecen reservadas para `OPS-AUD-010`;
- cada incertidumbre tiene destino exacto;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 25. Resultado y continuidad

Con la aprobación de `OPS-AUD-007` quedará establecida la línea base inicial de:

- flujos ordinarios;
- actores;
- eventos de inicio;
- herramientas;
- artefactos;
- traspasos;
- resultados;
- cierres actuales;
- puntos de pérdida;
- procesos híbridos;
- dependencias humanas y manuales.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-008
— Documentar excepciones, correcciones, anulaciones, devoluciones y reversión
```

`OPS-AUD-008` deberá utilizar estos flujos como línea base y documentar únicamente las desviaciones del camino ordinario, sin rediseñar todavía el proceso TO-BE.



### ✅ OPS-AUD-008 — Documentar excepciones, correcciones, anulaciones, devoluciones y reversión

**Estado:** APROBADA 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Documentación AS-IS de desviaciones frente al flujo ordinario  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-007`  
**Validación pendiente:** exclusivamente mediante `OPS-AUD-015` cuando una excepción, responsable, criterio o mecanismo de reversión no esté suficientemente confirmado

---

#### 1. Propósito

Documentar qué ocurre actualmente cuando un proceso no sigue su camino ordinario y requiere:

- corrección;
- modificación;
- anulación;
- rechazo;
- devolución;
- sustitución;
- reintento;
- regularización;
- reversión;
- compensación;
- cierre manual;
- escalamiento;
- aceptación parcial.

La tarea deberá identificar:

- evento que rompe el flujo ordinario;
- actor que detecta la desviación;
- actor que decide;
- acción correctiva actual;
- herramienta o soporte utilizado;
- efecto físico, financiero, documental o de inventario;
- punto donde se pierde trazabilidad;
- existencia o ausencia de reversión real;
- tarea posterior responsable de controles, medición o diseño.

```text
FLUJO ORDINARIO
→ DESVIACIÓN
→ RESPUESTA ACTUAL
→ EFECTO
→ CIERRE O PENDIENTE
```

Esta tarea documenta cómo se atienden hoy las desviaciones.

No define todavía:

- política objetivo;
- catálogo definitivo de motivos;
- permisos;
- niveles de aprobación;
- estados de base de datos;
- compensaciones automáticas;
- reglas contables;
- contratos entre aplicaciones;
- diseño de pantallas;
- implementación.

---

#### 2. Principio obligatorio

Una excepción no deberá confundirse con una nueva versión silenciosa del proceso.

```text
SOLICITADO
≠
CONFIRMADO
≠
PRODUCIDO
≠
DESPACHADO
≠
RECIBIDO
≠
ACEPTADO
```

Cuando una cantidad, actor, estado, documento o resultado cambia, el sistema objetivo deberá poder conservar:

- valor anterior;
- valor nuevo;
- causa;
- actor;
- fecha;
- evidencia;
- aprobación, cuando corresponda;
- efecto derivado.

`OPS-AUD-008` únicamente registra dónde esa capacidad existe, es manual, parcial o está ausente.

---

#### 3. Clasificación canónica de desviaciones

##### 3.1. Tipo de desviación

| Código | Tipo                | Definición                                                     |
| ------ | ------------------- | -------------------------------------------------------------- |
| `OMI`  | Omisión             | Una acción obligatoria no se realizó                           |
| `ERR`  | Error               | Se registró, preparó, cobró o entregó algo incorrecto          |
| `PAR`  | Parcial             | Se completa solo una parte                                     |
| `FAL`  | Faltante            | No existe cantidad suficiente                                  |
| `SOB`  | Sobrante            | Existe cantidad adicional                                      |
| `SUS`  | Sustitución         | Se reemplaza un producto, actor o recurso                      |
| `MOD`  | Modificación        | Se cambia una instrucción o registro vigente                   |
| `ANU`  | Anulación           | Se invalida una operación antes o después de ejecutarse        |
| `REC`  | Rechazo             | El receptor no acepta total o parcialmente                     |
| `DEV`  | Devolución          | Un bien o documento regresa al origen o a otro responsable     |
| `REV`  | Reversión           | Se deshace formalmente un efecto previo                        |
| `AJU`  | Ajuste              | Se corrige una diferencia sin repetir todo el proceso          |
| `REI`  | Reintento           | Se ejecuta nuevamente una acción fallida                       |
| `COM`  | Compensación        | Se crea una acción posterior para corregir el efecto           |
| `ESC`  | Escalamiento        | La decisión pasa a un responsable superior                     |
| `CAN`  | Cancelación externa | Cliente, proveedor o tercero cancela                           |
| `EXP`  | Expiración          | El proceso pierde vigencia por tiempo o vencimiento            |
| `INC`  | Incumplimiento      | El resultado no satisface cantidad, calidad, plazo o condición |
| `CON`  | Contingencia        | Se usa un camino alterno temporal                              |

##### 3.2. Naturaleza del efecto

| Código         | Efecto                                                |
| -------------- | ----------------------------------------------------- |
| `FISICO`       | Producto, insumo, activo o dinero cambia físicamente  |
| `INVENTARIO`   | Debería cambiar una existencia                        |
| `FINANCIERO`   | Afecta cobro, pago, caja, gasto o conciliación        |
| `DOCUMENTAL`   | Cambia, invalida o reemplaza un soporte               |
| `OPERATIVO`    | Cambia secuencia, prioridad o responsable             |
| `LABORAL`      | Afecta turno, asistencia, acceso o pago al trabajador |
| `COMERCIAL`    | Afecta cliente, venta, pedido o promesa               |
| `CONTABLE`     | Requiere clasificación o asiento diferente            |
| `SEGURIDAD`    | Afecta acceso, identidad o autorización               |
| `TRAZABILIDAD` | Pierde actor, estado, causa o relación entre eventos  |

##### 3.3. Estado de respuesta actual

| Estado             | Significado                                            |
| ------------------ | ------------------------------------------------------ |
| `RESUELTA_MANUAL`  | Existe una práctica manual conocida                    |
| `RESUELTA_PARCIAL` | Se corrige una parte, pero quedan efectos sin resolver |
| `ESCALADA`         | Se consulta a Gerencia, propietario o responsable      |
| `COMPENSADA`       | Se corrige con una operación posterior                 |
| `SIN_REVERSIÓN`    | El efecto original no se deshace formalmente           |
| `SIN_REGISTRO`     | La respuesta ocurre, pero no queda evidencia           |
| `NO_DEFINIDA`      | No existe práctica consistente                         |
| `POR_VALIDAR`      | La respuesta real debe confirmarse en `OPS-AUD-015`    |

---

#### 4. Inventario maestro de excepciones

| Código    | Proceso               | Excepción                                   | Respuesta actual                                             | Estado             |
| --------- | --------------------- | ------------------------------------------- | ------------------------------------------------------------ | ------------------ |
| `EXC-001` | Solicitud de remisión | Solicitud olvidada                          | Conductor o producción pregunta; se envía tarde              | `RESUELTA_MANUAL`  |
| `EXC-002` | Solicitud de remisión | Cambio después del envío                    | Mensaje o nueva captura                                      | `SIN_REGISTRO`     |
| `EXC-003` | Producción            | Cantidad producida inferior                 | Se deja lo alcanzado                                         | `RESUELTA_PARCIAL` |
| `EXC-004` | Producción            | Cantidad producida superior                 | Se informa ocasionalmente y se redistribuye                  | `RESUELTA_MANUAL`  |
| `EXC-005` | Despacho              | Producto faltante                           | Conductor envía parcial, normalmente sin aviso               | `SIN_REGISTRO`     |
| `EXC-006` | Recepción             | Sede detecta faltante                       | Consulta posteriormente al conductor                         | `RESUELTA_PARCIAL` |
| `EXC-007` | Recepción             | Producto incorrecto o calidad inadecuada    | No existe flujo confirmado                                   | `POR_VALIDAR`      |
| `EXC-008` | Bodega                | Retiro no registrado                        | Inventario queda desactualizado                              | `SIN_REVERSIÓN`    |
| `EXC-009` | Inventario            | Conteo digital difiere del físico           | Sistema deja de ser confiable                                | `NO_DEFINIDA`      |
| `EXC-010` | Producción            | Insumo no llega                             | Se produce menos o se prioriza otro producto                 | `RESUELTA_MANUAL`  |
| `EXC-011` | Panadería             | Capacidad o tiempo insuficiente             | Se distribuye lo disponible por prioridad                    | `RESUELTA_MANUAL`  |
| `EXC-012` | Cocina Caliente       | Stock insuficiente                          | Se envía lo disponible y se repone después                   | `COMPENSADA`       |
| `EXC-013` | Barra central         | Producto insuficiente                       | Se envía menos sin aviso                                     | `SIN_REGISTRO`     |
| `EXC-014` | Venta                 | Producto agotado después de ordenar         | Caja elimina con comentario y se agrega reemplazo            | `RESUELTA_MANUAL`  |
| `EXC-015` | Venta                 | Cliente cambia producto                     | Se agrega nuevo pedido; eliminación depende de Caja          | `RESUELTA_MANUAL`  |
| `EXC-016` | Pago                  | Tarjeta aprobada pero Caja no ha registrado | Aviso verbal al cajero                                       | `SIN_REGISTRO`     |
| `EXC-017` | Pago                  | Error de medio de pago                      | Corrección en Makos no documentada                           | `POR_VALIDAR`      |
| `EXC-018` | Rappi                 | Diferencia entre Rappi y Makos              | Corrección manual                                            | `RESUELTA_MANUAL`  |
| `EXC-019` | Domicilio             | Cliente cancela o cambia pedido             | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-020` | Domicilio             | Entrega tardía o fallida                    | Caja atiende el incidente                                    | `RESUELTA_MANUAL`  |
| `EXC-021` | Caja                  | Diferencia entre efectivo y cierre          | Se cuenta y revisa; resolución exacta no confirmada          | `POR_VALIDAR`      |
| `EXC-022` | Caja/Gerencia         | Retiro registrado como gasto                | Debe reinterpretarse como transferencia de custodia          | `RESUELTA_PARCIAL` |
| `EXC-023` | Compra                | Proveedor no tiene cantidad completa        | Confirma disponibilidad parcial                              | `RESUELTA_MANUAL`  |
| `EXC-024` | Compra                | Precio o fecha cambia                       | Se acuerda por conversación                                  | `SIN_REGISTRO`     |
| `EXC-025` | Recepción proveedor   | Diferencia entre factura y físico           | No se han presentado casos confirmados; flujo no definido    | `POR_VALIDAR`      |
| `EXC-026` | Recepción proveedor   | Recibe persona distinta                     | Procedimiento desconocido                                    | `POR_VALIDAR`      |
| `EXC-027` | Factura               | Soporte no llega a Contabilidad             | Se detecta en conciliación posterior                         | `RESUELTA_PARCIAL` |
| `EXC-028` | Merma                 | Producto dañado                             | Se desecha y registra manualmente                            | `RESUELTA_MANUAL`  |
| `EXC-029` | Merma                 | Registro errado o duplicado                 | No existe reversión confirmada                               | `SIN_REVERSIÓN`    |
| `EXC-030` | Transferencia a Molka | Producto envejecido pero consumible         | Se transfiere verbalmente                                    | `SIN_REGISTRO`     |
| `EXC-031` | Transferencia a Molka | Producto se deteriora allí                  | Se elimina como merma                                        | `RESUELTA_MANUAL`  |
| `EXC-032` | Canastas              | Canasta sucia                               | Se solicita lavado                                           | `RESUELTA_MANUAL`  |
| `EXC-033` | Canastas              | Canasta no disponible o no retorna          | No existe control                                            | `NO_DEFINIDA`      |
| `EXC-034` | Turnos                | Cambio de turno                             | Mecanismo exacto no confirmado                               | `POR_VALIDAR`      |
| `EXC-035` | Asistencia            | Check-in faltante                           | Se refleja como ausencia o novedad; corrección no confirmada | `POR_VALIDAR`      |
| `EXC-036` | Propinas              | Retraso o ausencia                          | Ajuste manual sobre propina                                  | `RESUELTA_MANUAL`  |
| `EXC-037` | Accesos               | Trabajador se retira sin aviso              | Se desactiva cuando se descubre                              | `RESUELTA_PARCIAL` |
| `EXC-038` | Accesos               | Cambio de sede, área o función              | Ajuste manual no formalizado                                 | `POR_VALIDAR`      |
| `EXC-039` | Marketing             | Pieza no satisface expectativa              | Se corrige por retroalimentación informal                    | `POR_VALIDAR`      |
| `EXC-040` | Vaila Vainilla        | Entrega fallida o devolución                | Flujo desconocido                                            | `POR_VALIDAR`      |
| `EXC-041` | Soporte técnico       | Solución inicial falla                      | Se reintenta o busca otra alternativa                        | `RESUELTA_MANUAL`  |
| `EXC-042` | Mantenimiento         | Técnico no disponible                       | Se espera o adapta la operación                              | `CON`              |
| `EXC-043` | Mantenimiento         | Repuesto no disponible                      | Se posterga o aplica solución temporal                       | `CON`              |
| `EXC-044` | Servicios Generales   | Limpieza insuficiente                       | Responsable vuelve a solicitar                               | `RESUELTA_MANUAL`  |
| `EXC-045` | Makos                 | Comanda no impresa o perdida                | Reimpresión o comunicación verbal no confirmada              | `POR_VALIDAR`      |
| `EXC-046` | Makos                 | Pedido duplicado                            | Corrección o anulación no confirmada                         | `POR_VALIDAR`      |
| `EXC-047` | Facturación           | Factura requiere anulación o corrección     | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-048` | Nómina                | Archivo o pago rechazado                    | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-049` | Shopify               | Pedido cancelado                            | Flujo no confirmado                                          | `POR_VALIDAR`      |
| `EXC-050` | Producción            | Producto ya terminado cambia de destino     | Conductor redistribuye según necesidad                       | `SIN_REGISTRO`     |

---

#### 5. Remisiones internas

##### 5.1. Solicitud olvidada — `EXC-001`

**Desviación**

El área no envía la solicitud al final del turno.

**Detección**

- conductor;
- área productiva;
- responsable que nota la ausencia.

**Respuesta actual**

```text
NO EXISTE SOLICITUD
→ CONDUCTOR O PRODUCCIÓN PREGUNTA
→ ÁREA PREPARA EXCEL
→ ENVÍA CAPTURA TARDE
→ SE INTENTA ATENDER
```

**Efecto**

- preparación tardía;
- posible salida incompleta;
- alteración de prioridades;
- riesgo de omitir productos.

**Registro**

La evidencia queda dispersa en mensajes.

**Reversión**

No aplica reversión formal; se compensa enviando la solicitud tarde.

**Destino**

`OPS-AUD-010`, `OPS-AUD-011`, `OPS-AUD-013`.

---

##### 5.2. Modificación después del envío — `EXC-002`

**Desviación**

La cantidad o producto cambia después de enviar la captura.

**Respuesta probable**

- mensaje adicional;
- nueva captura;
- instrucción verbal.

No existe evidencia de:

- versión cancelada;
- versión vigente;
- confirmación de quien prepara;
- diferencia frente al original.

**Estado**

`POR_VALIDAR` en `OPS-AUD-015`.

---

##### 5.3. Preparación parcial — `EXC-005`

**Desviación**

No existe cantidad suficiente para completar la remisión.

**Respuesta actual**

```text
CONDUCTOR ENCUENTRA MENOS
→ TOMA LO DISPONIBLE
→ ENVÍA PARCIAL
→ NORMALMENTE NO AVISA
```

**Efecto**

- sede recibe menos;
- solicitud queda aparentemente abierta solo en la memoria;
- producción puede intentar compensar al día siguiente si recuerda;
- si no llega una nueva solicitud, el faltante puede no producirse.

**Reversión**

No existe una reversión; el efecto se compensa, a veces, mediante una producción posterior.

**Brecha**

No existe saldo pendiente estructurado.

---

##### 5.4. Diferencia detectada en sede — `EXC-006`

**Desviación**

La sede nota que falta producto después de solicitarlo repetidamente.

**Respuesta actual**

```text
SEDE REVISA
→ PREGUNTA AL CONDUCTOR
→ CONDUCTOR INDICA QUE NO SABE O NO HABÍA
→ SE GENERA FRUSTRACIÓN
```

**Efecto**

- pérdida de confianza;
- incertidumbre sobre dónde ocurrió la diferencia;
- no existe evidencia de si no se produjo, no se cargó o no se entregó.

**Cierre**

Generalmente queda como conversación, sin cierre formal.

---

##### 5.5. Producto incorrecto, dañado o rechazado — `EXC-007`

No se confirmó un flujo ordinario para:

- producto equivocado;
- cantidad excesiva;
- empaque dañado;
- temperatura inadecuada;
- rechazo por calidad;
- devolución desde sede.

Se vincula a `OPS-AUD-015`.

---

#### 6. Producción

##### 6.1. Producción inferior — `EXC-003`

**Desviación**

El área no alcanza la cantidad solicitada.

**Causas conocidas**

- falta de insumos;
- llegada tardía;
- falta de tiempo;
- capacidad física;
- proceso técnico;
- fermentación;
- prioridad de otra producción.

**Respuesta actual**

```text
ÁREA PRODUCE LO POSIBLE
→ DEJA CANTIDAD LOGRADA
→ NO AVISA PREVENTIVAMENTE
→ EXPLICA SI LA SEDE RECLAMA
```

**Efecto**

El faltante se descubre tarde.

**Reversión**

No existe; puede compensarse en otra jornada.

---

##### 6.2. Producción superior — `EXC-004`

**Desviación**

Quedan unidades adicionales.

**Respuesta actual**

- se informa en algunos casos;
- se envía fotografía;
- se reasigna a Saudo o Molka;
- se conserva como stock.

Ejemplo conocido: cinco panes adicionales distribuidos entre Saudo y Molka.

**Brecha**

No se registra formalmente:

- origen del excedente;
- cantidad;
- destino;
- inventario;
- decisión.

---

##### 6.3. Prioridad entre sedes — `EXC-011`

Cuando la cantidad no alcanza, la distribución conocida es:

1. Vento Café;
2. Saudo;
3. Molka.

La prioridad fue definida por Nathalia y se entiende culturalmente.

**Riesgo**

La prioridad no está representada como regla documentada, vigente y configurable.

**Destino**

`OPS-AUD-009` y diseño TO-BE posterior.

---

##### 6.4. Reposición posterior — `EXC-012`

Cocina Caliente repone según disponibilidad.

```text
STOCK INSUFICIENTE
→ CONDUCTOR ENVÍA LO DISPONIBLE
→ INFORMA A COCINERA
→ COCINERA PRIORIZA FALTANTE
→ PRODUCE CUANDO PUEDE
```

No existe plazo formal ni saldo pendiente confirmado.

---

##### 6.5. Cambio de destino — `EXC-050`

Cuando existe sobrante o una sede tiene mayor necesidad, el conductor puede redistribuir.

No existe registro formal de:

- decisión;
- origen;
- destino;
- cantidad;
- responsable;
- aceptación.

---

#### 7. Compras y proveedores

##### 7.1. Disponibilidad parcial — `EXC-023`

**Desviación**

El proveedor no dispone de todo lo solicitado.

**Respuesta actual**

El proveedor confirma por WhatsApp:

- cantidad disponible;
- precio;
- fecha estimada.

Gerencia acepta o ajusta mediante conversación.

**Brecha**

No existe una versión consolidada de la orden final confirmada.

---

##### 7.2. Cambio de precio o fecha — `EXC-024`

El proveedor puede modificar:

- precio;
- cantidad;
- fecha;
- presentación.

La decisión queda en la conversación.

No se confirmó:

- quién puede aceptar;
- cuándo requiere aprobación;
- cómo se actualiza el total esperado;
- cómo se compara con factura.

---

##### 7.3. Diferencia en recepción — `EXC-025`

No se han presentado casos confirmados de faltante o sobrante cuando recibe el Jefe de Operaciones.

No existe evidencia suficiente del procedimiento para:

- cantidad menor;
- cantidad mayor;
- producto distinto;
- calidad deficiente;
- precio distinto;
- factura incorrecta;
- rechazo;
- devolución al proveedor.

Debe validarse en `OPS-AUD-015`.

---

##### 7.4. Recepción por sustituto — `EXC-026`

Cuando Carlos no está, puede recibir:

- conductor;
- otro trabajador considerado capaz.

No se confirmó:

- criterio de designación;
- revisión;
- firma;
- entrega de factura;
- reporte de diferencia;
- responsabilidad.

---

##### 7.5. Soporte faltante — `EXC-027`

La falta de factura o comprobante se detecta posteriormente en conciliación.

**Respuesta actual**

- se busca el documento;
- se consulta a quien pagó o recibió;
- se regulariza si se encuentra.

El mecanismo exacto no fue confirmado.

---

#### 8. Inventario, merma y transferencias

##### 8.1. Retiro no registrado — `EXC-008`

**Desviación**

Un trabajador retira producto sin registrarlo.

**Efecto**

El inventario digital queda por encima del físico.

**Respuesta actual**

No existe corrección inmediata.

La diferencia aparece en conteos posteriores o el sistema pierde credibilidad.

**Reversión**

No existe una reversión del retiro físico; corresponde registrar un movimiento compensatorio, pero hoy no ocurre de forma sistemática.

---

##### 8.2. Inventario digital inválido — `EXC-009`

El piloto registró retiros, pero no todas las entradas, producciones y transferencias.

Resultado:

```text
MOVIMIENTOS INCOMPLETOS
→ STOCK DIGITAL INCORRECTO
→ TRABAJADORES DEJAN DE CONFIAR
→ PRUEBA PIERDE UTILIDAD
```

No existe proceso estructurado de:

- congelar;
- conciliar;
- ajustar;
- reabrir;
- certificar.

---

##### 8.3. Merma — `EXC-028`

**Desviación**

Producto no apto.

**Respuesta**

```text
TRABAJADOR DETECTA
→ DECIDE
→ DESCARTA
→ ANOTA PRODUCTO Y CANTIDAD
```

**Problemas**

- misma persona ejecuta todo;
- no existe aprobación confirmada;
- no se descuenta inventario;
- no se conserva lote;
- no existe evidencia fotográfica obligatoria;
- no se confirma causa estructurada.

---

##### 8.4. Corrección de merma — `EXC-029`

No existe procedimiento confirmado para:

- registro duplicado;
- cantidad equivocada;
- producto equivocado;
- merma anotada y luego recuperada;
- anulación de una hoja.

Estado: `SIN_REVERSIÓN`.

---

##### 8.5. Transferencia a Molka — `EXC-030`

**Desviación frente al abastecimiento normal**

Producto con menor frescura comercial se envía a Molka.

**Respuesta**

```text
TRABAJADOR ENTREGA AL CONDUCTOR
→ INDICA VERBALMENTE QUE ESTÁ VIEJO
→ CONDUCTOR TRANSPORTA
→ MOLKA INCORPORA
```

**Ausencias**

- transferencia;
- cantidad;
- fecha;
- vida útil;
- origen;
- lote;
- responsable;
- aceptación;
- efecto de inventario.

---

##### 8.6. Producto se daña en Molka — `EXC-031`

Se descarta y pasa a hoja de merma.

No existe vínculo entre la transferencia original y la merma final.

---

#### 9. Venta, comandas y productos agotados

##### 9.1. Producto agotado — `EXC-014`

**Desviación**

Makos permite registrar un producto que ya no está físicamente disponible.

**Detección**

- visual antes de ordenar;
- área productiva después de recibir la comanda;
- cliente informado posteriormente.

**Respuesta actual**

```text
CAJA ELIMINA PRODUCTO
→ ESCRIBE COMENTARIO OBLIGATORIO
→ MESERO ACUERDA REEMPLAZO
→ AGREGA PRODUCTO NUEVO COMO PEDIDO ADICIONAL
```

**Efectos**

- historial dividido;
- sustitución no vinculada formalmente;
- precio puede cambiar;
- cliente recibe explicación;
- no existe agotado automático.

---

##### 9.2. Modificación del pedido — `EXC-015`

El cliente puede cambiar o adicionar productos.

Las adiciones se registran como una nueva comanda en la misma cuenta.

Las eliminaciones dependen de Caja.

No se confirmó:

- quién puede anular;
- cuándo requiere comentario;
- si queda producto preparado;
- efecto sobre Cocina;
- reversión de inventario;
- tratamiento de descuentos.

---

##### 9.3. Comanda no impresa — `EXC-045`

No existe evidencia confirmada del procedimiento cuando:

- impresora está apagada;
- papel se acaba;
- impresión falla;
- comanda se pierde;
- comanda se duplica;
- se imprime en estación incorrecta.

Posibles respuestas:

- revisar Makos;
- reimprimir;
- informar verbalmente.

Debe validarse en `OPS-AUD-015`.

---

##### 9.4. Pedido duplicado — `EXC-046`

No se confirmó cómo se diferencia entre:

- pedido adicional legítimo;
- doble toque;
- doble transcripción;
- reimpresión;
- pedido duplicado por plataforma.

---

##### 9.5. Factura anulada o corregida — `EXC-047`

No se confirmó el flujo actual para:

- factura emitida con error;
- cambio de medio de pago;
- devolución;
- nota crédito;
- anulación fiscal;
- reimpresión;
- cierre incorrecto.

Se vincula a `OPS-AUD-015`, `OPS-AUD-009` y posteriormente NUMERA/PULSO.

---

#### 10. Pagos y Caja

##### 10.1. Pago con tarjeta no registrado aún — `EXC-016`

**Desviación**

El datáfono fue operado por un trabajador distinto al cajero.

**Respuesta**

```text
TRABAJADOR PROCESA
→ AVISA VERBALMENTE
→ CAJERO REGISTRA
```

**Riesgo**

- olvido;
- medio de pago incorrecto;
- mesa abierta;
- duplicación;
- falta de comprobante vinculado.

No existe confirmación digital entre datáfono y Makos.

---

##### 10.2. Error de medio de pago — `EXC-017`

No se confirmó el procedimiento para corregir:

- efectivo registrado como tarjeta;
- tarjeta registrada como efectivo;
- pago dividido;
- pago duplicado;
- transacción rechazada;
- reversión del datáfono.

---

##### 10.3. Diferencia de Caja — `EXC-021`

La gerente general cuenta el efectivo y compara con el cierre.

No se confirmó:

- tolerancia;
- responsable;
- acta;
- descuento;
- ajuste;
- investigación;
- aprobación;
- registro contable.

Destino: `OPS-AUD-009`, `OPS-AUD-012`, `OPS-AUD-015`.

---

##### 10.4. Retiro clasificado como gasto — `EXC-022`

**Desviación**

Dinero entregado a Gerencia se registra como gasto.

**Realidad operativa**

Es una transferencia de custodia.

**Efecto**

- gasto inflado;
- caja reducida;
- responsabilidad del efectivo no representada;
- conciliación confusa.

**Corrección actual**

Interpretación manual posterior.

**Reversión**

No se confirmó cómo se reclasifica en Makos o Contabilidad.

---

#### 11. Pedidos externos y domicilios

##### 11.1. Diferencia entre plataforma y Makos — `EXC-018`

Puede ocurrir por:

- transcripción;
- producto omitido;
- cantidad distinta;
- observación no copiada;
- precio diferente;
- modificación posterior.

**Respuesta actual**

Corrección manual en una o ambas plataformas, según disponibilidad.

No existe reconciliación automática.

---

##### 11.2. Cancelación o cambio del cliente — `EXC-019`

No se confirmó qué ocurre cuando el cliente:

- cancela antes de preparar;
- cancela después de preparar;
- cambia dirección;
- cambia medio de pago;
- agrega producto;
- solicita devolución.

Debe validarse en `OPS-AUD-015`.

---

##### 11.3. Entrega tardía o fallida — `EXC-020`

**Detección**

El cliente contacta o surge un incidente.

**Respuesta**

Caja atiende:

- retraso;
- conflicto con mensajero;
- dirección;
- pago;
- pedido faltante.

No existe seguimiento rutinario después de salida.

**Cierre**

Se resuelve caso por caso.

---

#### 12. Turnos, asistencia, propinas y accesos

##### 12.1. Cambio de turno — `EXC-034`

No se confirmó el mecanismo para:

- intercambio entre trabajadores;
- cambio de sede;
- reemplazo;
- ausencia anticipada;
- modificación después de publicar.

Debe validarse en `OPS-AUD-015`.

---

##### 12.2. Check-in faltante o incorrecto — `EXC-035`

No se confirmó:

- solicitud de corrección;
- evidencia;
- aprobador;
- modificación de hora;
- diferencia entre olvido y ausencia;
- registro posterior.

---

##### 12.3. Descuento de propina — `EXC-036`

La gerente general aplica ajustes manuales por retrasos o ausencias.

No queda registro estructurado de:

- regla;
- valor base;
- motivo;
- aprobación;
- valor descontado;
- aceptación del trabajador;
- reversión si la asistencia se corrige.

---

##### 12.4. Retiro sin baja inmediata — `EXC-037`

**Desviación**

El trabajador deja la empresa, pero no existe notificación formal a quien administra accesos.

**Respuesta**

```text
RETIRO
→ ACCESO PUEDE SEGUIR ACTIVO
→ JEFE DE OPERACIONES SE ENTERA
→ DESACTIVA MANUALMENTE
```

**Efecto**

Riesgo de seguridad y trazabilidad.

**Reversión**

No es posible revertir un acceso indebido ya utilizado; se requiere revocación y auditoría.

---

##### 12.5. Cambio de función — `EXC-038`

No existe flujo confirmado para modificar:

- sede asignada;
- área;
- cargo;
- rol operativo;
- permisos;
- turno;
- dispositivo.

Estado: `POR_VALIDAR`.

---

#### 13. Marketing

##### 13.1. Pieza rechazada o corregida — `EXC-039`

**Desviación**

La pieza no cumple la expectativa de Nathalia o Jeo.

**Respuesta probable**

```text
SE COMUNICA INCONFORMIDAD
→ TRABAJADOR INTERPRETA CAMBIO
→ EDITA O REPITE
→ SOLICITA NUEVA REVISIÓN
```

No se confirmó:

- canal;
- criterio;
- versión;
- responsable;
- aprobación final;
- archivo de versiones.

---

##### 13.2. Publicación errónea

No se confirmó el proceso para:

- eliminar publicación;
- corregir texto;
- reemplazar imagen;
- responder reclamo;
- conservar evidencia;
- aprobar una corrección urgente.

Debe validarse en `OPS-AUD-015`.

---

#### 14. Vaila Vainilla

##### 14.1. Entrega fallida, devolución o cancelación — `EXC-040`, `EXC-049`

No se confirmó el tratamiento de:

- pedido cancelado;
- dirección incorrecta;
- cliente ausente;
- paquete devuelto;
- producto dañado;
- pérdida;
- reenvío;
- reembolso;
- reintegro al stock.

Todos permanecen en `OPS-AUD-015`.

---

#### 15. Soporte técnico y mantenimiento

##### 15.1. Reintento técnico — `EXC-041`

Cuando una solución no funciona:

```text
JEFE DE OPERACIONES PRUEBA OTRA CONFIGURACIÓN
→ CAMBIA EQUIPO, RED, DRIVER O MÉTODO
→ VUELVE A PROBAR
```

No existe registro de intentos fallidos.

---

##### 15.2. Técnico no disponible — `EXC-042`

Respuesta:

- esperar;
- contactar otro;
- operar parcialmente;
- adaptar temporalmente el proceso.

La decisión depende de Gerencia.

No existe contingencia general documentada.

---

##### 15.3. Repuesto no disponible — `EXC-043`

Respuesta:

- buscar otro proveedor;
- esperar;
- aplicar reparación temporal;
- dejar equipo fuera de servicio.

No se registra impacto acumulado ni fecha comprometida.

---

#### 16. Servicios Generales y canastas

##### 16.1. Limpieza insuficiente — `EXC-044`

El resultado se verifica visualmente.

Si no cumple:

- Nathalia;
- Carlos;
- responsable de área;

solicita repetir.

No existe inspección, evidencia o cierre formal.

---

##### 16.2. Canasta sucia — `EXC-032`

La limpieza se solicita después de:

- queja;
- acumulación;
- observación visual.

No existe frecuencia ni estado.

---

##### 16.3. Canasta faltante — `EXC-033`

No se conoce:

- sede;
- custodio;
- ruta;
- fecha;
- pérdida;
- proveedor propietario.

No existe mecanismo actual de búsqueda o compensación.

---

#### 17. Tipos de reversión requeridos por el dominio

Esta sección no diseña la implementación; identifica categorías que el modelo TO-BE deberá resolver.

##### 17.1. Reversión documental

Aplicable a:

- factura;
- remisión;
- cierre;
- hoja de merma;
- pedido;
- reporte;
- turno.

Debe conservar original y corrección.

##### 17.2. Reversión de inventario

Aplicable a:

- retiro errado;
- recepción errada;
- merma errada;
- transferencia errada;
- devolución;
- producto rechazado.

No debe borrar el movimiento original; deberá existir movimiento compensatorio en el diseño posterior.

##### 17.3. Reversión financiera

Aplicable a:

- medio de pago incorrecto;
- cobro duplicado;
- devolución;
- retiro mal clasificado;
- gasto errado;
- pago rechazado.

##### 17.4. Reversión de autorización

Aplicable a:

- cuenta creada por error;
- baja tardía;
- permiso incorrecto;
- cambio de sede;
- sesión compartida.

La revocación futura debe impedir nuevas acciones y conservar auditoría de las anteriores.

##### 17.5. Reversión operativa

Aplicable a:

- pedido cancelado;
- producción ya iniciada;
- destino modificado;
- entrega rechazada;
- turno cambiado;
- publicación retirada.

---

#### 18. Excepciones sin procedimiento confirmado

Quedan expresamente para `OPS-AUD-015`:

1. rechazo de proveedor;
2. factura con diferencia;
3. devolución a proveedor;
4. devolución de cliente;
5. nota crédito;
6. anulación fiscal;
7. corrección de medio de pago;
8. diferencia de Caja;
9. reimpresión de comanda;
10. pedido duplicado;
11. cambio de turno;
12. corrección de check-in;
13. pago de nómina rechazado;
14. pedido Shopify cancelado;
15. devolución de Vaila Vainilla;
16. publicación errónea;
17. recepción por sustituto;
18. producto incorrecto recibido en sede;
19. deterioro durante transporte;
20. pérdida o robo de canasta;
21. corrección de hoja de merma;
22. cambio de acceso por traslado interno.

Estos pendientes no bloquean la continuidad documental porque tienen propietario explícito en `OPS-AUD-015`.

---

#### 19. Matriz de pérdida de control por excepción

| Excepción             | Control que falta                  |
| --------------------- | ---------------------------------- |
| Solicitud tardía      | corte, alerta y confirmación       |
| Cantidad parcial      | saldo pendiente y motivo           |
| Sobrante              | destino y movimiento               |
| Cambio de pedido      | versión y aprobación               |
| Producto agotado      | disponibilidad y sustitución       |
| Pago verbal           | confirmación vinculada             |
| Retiro como gasto     | naturaleza y custodia              |
| Factura faltante      | trazabilidad documental            |
| Merma                 | aprobación, lote y movimiento      |
| Transferencia a Molka | origen, destino y vida útil        |
| Baja tardía           | evento obligatorio de revocación   |
| Cambio de turno       | solicitud, aprobación y versión    |
| Pieza rechazada       | criterio y versiones               |
| Entrega fallida       | estado, responsable y compensación |
| Repuesto ausente      | contingencia y seguimiento         |

---

#### 20. Relación con `OPS-AUD-009`

`OPS-AUD-009` deberá identificar quién puede:

- aprobar una compra modificada;
- aceptar un precio distinto;
- autorizar una anulación;
- corregir un medio de pago;
- aceptar una diferencia de Caja;
- aprobar una merma;
- autorizar transferencia entre sedes;
- cambiar un turno;
- corregir asistencia;
- aplicar descuento;
- aprobar publicación;
- crear o revocar acceso;
- aceptar una devolución;
- cerrar una diferencia.

`OPS-AUD-008` no asigna todavía permisos ni autoridad definitiva.

---

#### 21. Relación con `OPS-AUD-012`

Deberán conciliarse especialmente:

```text
SOLICITUD ORIGINAL
↔ SOLICITUD MODIFICADA
↔ PRODUCIDO
↔ DESPACHADO
↔ RECIBIDO
```

```text
RAPPI
↔ MAKOS
↔ FACTURA
↔ PAGO
```

```text
CIERRE
↔ EFECTIVO
↔ RETIROS
↔ GASTOS
↔ CONTABILIDAD
```

```text
INVENTARIO FÍSICO
↔ MOVIMIENTOS DIGITALES
↔ MERMAS
↔ TRANSFERENCIAS
```

---

#### 22. Hallazgos transversales

##### 22.1. La mayoría de excepciones se resuelve por conversación

WhatsApp y comunicación verbal sustituyen:

- motivo;
- estado;
- responsable;
- aprobación;
- evidencia;
- cierre.

##### 22.2. La compensación reemplaza a la reversión

Ejemplos:

- producir al día siguiente;
- enviar otro producto;
- registrar otro pedido;
- corregir en Contabilidad;
- desactivar acceso tarde.

Esto corrige parcialmente el resultado, pero no deshace ni documenta el hecho original.

##### 22.3. El sistema actual permite corregir sin vincular

Una eliminación en Makos y un nuevo pedido pueden resolver al cliente, pero no conservar una relación explícita de sustitución.

##### 22.4. Las excepciones afectan varios dominios al mismo tiempo

Una remisión parcial afecta:

- producción;
- inventario;
- logística;
- sede;
- venta futura;
- compras;
- planeación.

##### 22.5. Una excepción no documentada se convierte en conocimiento informal

El aprendizaje queda en personas y no en el sistema.

##### 22.6. Borrar no equivale a revertir

El diseño objetivo deberá privilegiar:

```text
EVENTO ORIGINAL
+
EVENTO CORRECTIVO
+
RELACIÓN ENTRE AMBOS
```

No eliminación silenciosa.

---

#### 23. Matriz de destino de hallazgos

| Hallazgo                                         | Tarea exacta   |
| ------------------------------------------------ | -------------- |
| Quién detecta, decide, autoriza y ejecuta        | `OPS-AUD-009`  |
| Frecuencia, impacto y tiempo de recuperación     | `OPS-AUD-010`  |
| Dependencia de áreas, sedes, terceros y sistemas | `OPS-AUD-011`  |
| Reconciliación entre original y corrección       | `OPS-AUD-012`  |
| Pérdida de causa, actor, versión y evidencia     | `OPS-AUD-013`  |
| Respuesta ante indisponibilidad tecnológica      | `OPS-AUD-014`  |
| Procedimientos no confirmados                    | `OPS-AUD-015`  |
| Consolidación de brechas                         | `GAP-CTRL-001` |
| Vinculación a diseño y paquete de implementación | `GAP-CTRL-006` |
| Procesos TO-BE de reversión                      | BLOQUE E2      |
| Arquitectura de eventos y datos                  | BLOQUE E3      |
| Colas, reintentos y evidencia                    | BLOQUE E4      |
| Piloto, rollback y cutover                       | BLOQUE E5      |

---

#### 24. Decisiones propuestas

1. Toda diferencia frente al flujo ordinario deberá conservarse como excepción explícita.
2. Las solicitudes olvidadas se resuelven hoy mediante seguimiento manual.
3. Las cantidades parciales no generan saldo pendiente estructurado.
4. Los sobrantes se redistribuyen sin movimiento formal.
5. Los faltantes se descubren con frecuencia en la sede.
6. Producción compensa faltantes en jornadas posteriores solo cuando existe memoria o nueva solicitud.
7. Las prioridades entre sedes son culturales y no están configuradas formalmente.
8. Los cambios de compra quedan en conversaciones con proveedores.
9. No existe procedimiento confirmado para diferencias de recepción de proveedor.
10. Los retiros no registrados invalidan el inventario digital.
11. Las mermas no tienen reversión ni aprobación estructurada confirmada.
12. Las transferencias a Molka carecen de registro.
13. Los agotados en Makos se corrigen eliminando y agregando productos.
14. Los pagos con tarjeta dependen de confirmación verbal.
15. No existe flujo confirmado de corrección fiscal o de medio de pago.
16. Los incidentes de domicilio se resuelven caso por caso.
17. Las diferencias de Caja no tienen procedimiento suficientemente documentado.
18. Los ajustes de propinas no dejan evidencia completa.
19. Las bajas de acceso pueden ocurrir tarde.
20. Marketing corrige mediante retroalimentación informal.
21. Vaila Vainilla no tiene devoluciones o entregas fallidas documentadas.
22. Soporte y mantenimiento utilizan reintentos y contingencias manuales.
23. La corrección actual suele compensar, pero no revertir formalmente.
24. El diseño futuro deberá conservar evento original y evento correctivo.
25. Ninguna decisión autoriza estados, permisos, código, migraciones, RPC, RLS o cambios en Supabase.

---

#### 25. Criterios de aceptación

`OPS-AUD-008` podrá aprobarse cuando se confirme que:

- se inventariaron las principales desviaciones;
- se distinguen omisión, error, parcial, faltante, sobrante, modificación, anulación, rechazo, devolución, reversión, ajuste y compensación;
- se documentan respuestas actuales;
- se identifican efectos físicos, financieros, operativos, laborales y de seguridad;
- se separan prácticas confirmadas de procedimientos pendientes;
- cada incertidumbre está vinculada a `OPS-AUD-015`;
- cada brecha tiene destino exacto;
- no se han definido aprobaciones propias de `OPS-AUD-009`;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 26. Resultado y continuidad

Con la aprobación de `OPS-AUD-008` quedará establecida la línea base inicial de:

- excepciones operativas;
- correcciones manuales;
- cantidades parciales;
- faltantes y sobrantes;
- sustituciones;
- cambios de pedido;
- anulaciones pendientes de validar;
- devoluciones;
- compensaciones;
- reintentos;
- contingencias;
- reversión ausente o parcial;
- efectos derivados;
- excepciones sin procedimiento confirmado.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-009
— Documentar aprobaciones, segregación de funciones y controles manuales
```

`OPS-AUD-009` deberá utilizar este inventario para identificar quién inicia, ejecuta, revisa, aprueba, custodia y corrige cada acción sensible, sin convertir todavía esas responsabilidades en roles o permisos técnicos.



### ✅ OPS-AUD-009 — Documentar aprobaciones, segregación de funciones y controles manuales

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Documentación AS-IS de aprobaciones, separación de responsabilidades y controles actuales  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-008`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando el aprobador, custodio, sustituto o control real no esté suficientemente confirmado

---

#### 1. Propósito

Documentar cómo se autorizan, revisan, controlan y custodian actualmente las acciones sensibles de Vento Group.

La tarea deberá distinguir, para cada proceso:

- quién inicia;
- quién ejecuta;
- quién revisa;
- quién aprueba;
- quién custodia;
- quién recibe;
- quién corrige;
- qué control manual existe;
- qué evidencia queda;
- qué funciones se encuentran concentradas en una misma persona;
- qué acciones se realizan sin aprobación explícita;
- qué controles dependen de memoria, confianza, presencia física o comunicación verbal.

```text
RESPONSABILIDAD OPERATIVA
≠
APROBACIÓN
≠
CUSTODIA
≠
PERMISO DE SOFTWARE
```

Esta tarea documenta el modelo actual.

No define todavía:

- matriz RACI objetivo;
- catálogo de cargos;
- roles base;
- roles operativos;
- permisos;
- reglas de autorización;
- políticas RLS;
- flujos de aprobación digitales;
- límites monetarios;
- niveles jerárquicos futuros;
- implementación técnica.

---

#### 2. Principios obligatorios

##### 2.1. Ejecutar no implica aprobar

Una persona puede realizar una acción sin tener autoridad para decidirla.

Ejemplos:

- un trabajador prepara una producción, pero la prioridad puede provenir de Nathalia;
- Leidy puede enviar un pedido, pero la necesidad y cantidad son consolidadas por Gerencia;
- un mesero lleva el datáfono, pero Caja registra el pago;
- un trabajador desecha una merma, aunque no exista aprobación separada.

##### 2.2. Aprobar no implica custodiar

Quien autoriza una compra no necesariamente:

- recibe la mercancía;
- conserva la factura;
- registra Contabilidad;
- custodia el producto;
- paga.

##### 2.3. El control manual puede existir sin ser suficiente

Ejemplos:

- comparar factura contra mercancía;
- contar efectivo contra cierre;
- exigir comentario al eliminar un producto en Makos;
- observar visualmente una canasta;
- revisar una pieza de Marketing.

El control deberá registrarse aunque sea informal, incompleto o no deje evidencia.

##### 2.4. La concentración de funciones es un hallazgo, no una autorización

Cuando una persona:

```text
INICIA
→ EJECUTA
→ APRUEBA
→ CUSTODIA
→ CORRIGE
```

la tarea deberá registrarlo como concentración AS-IS.

No deberá presentarse como modelo objetivo.

##### 2.5. La confianza personal no sustituye la segregación

La práctica de permitir una acción porque una persona “sabe hacerlo” o “es de confianza” constituye una regla operativa informal, no un control verificable.

---

#### 3. Tipos de participación de control

| Código | Participación         | Definición                                             |
| ------ | --------------------- | ------------------------------------------------------ |
| `INI`  | Iniciador             | Origina la necesidad, solicitud o evento               |
| `EJE`  | Ejecutor              | Realiza materialmente la acción                        |
| `REV`  | Revisor               | Comprueba cantidades, documentos o resultado           |
| `APR`  | Aprobador             | Autoriza que la acción continúe o se confirme          |
| `CUS`  | Custodio              | Conserva dinero, bienes, documentos o accesos          |
| `REG`  | Registrador           | Incorpora la operación a un sistema o soporte          |
| `REC`  | Receptor              | Recibe el resultado o continúa el proceso              |
| `COR`  | Corrector             | Modifica, ajusta o revierte                            |
| `SUP`  | Supervisor            | Vigila cumplimiento general                            |
| `ESC`  | Escalamiento          | Resuelve una situación fuera de la autoridad ordinaria |
| `AUD`  | Verificador posterior | Revisa después mediante conciliación o auditoría       |

Una misma persona puede ocupar varios tipos de participación.

---

#### 4. Clasificación de controles manuales

##### 4.1. Tipo de control

| Código | Control                 | Ejemplo                                       |
| ------ | ----------------------- | --------------------------------------------- |
| `VIS`  | Inspección visual       | Revisar mercancía, vitrina o producto         |
| `CON`  | Conteo                  | Contar efectivo, producto o canastas          |
| `CMP`  | Comparación             | Factura contra físico; cierre contra efectivo |
| `FIR`  | Firma                   | Firmar recepción o documento                  |
| `COM`  | Comentario obligatorio  | Justificar eliminación en Makos               |
| `DOB`  | Doble intervención      | Una persona ejecuta y otra registra           |
| `JER`  | Escalamiento jerárquico | Consultar a Nathalia, Jeo o Gerencia          |
| `PRE`  | Presencia física        | Control depende de estar en el lugar          |
| `MEM`  | Memoria o experiencia   | Decisión basada en conocimiento práctico      |
| `CUL`  | Regla cultural          | Prioridad conocida por costumbre              |
| `DOC`  | Soporte documental      | Factura, cierre, hoja o reporte               |
| `SIS`  | Restricción del sistema | Campo obligatorio, sesión o estado            |
| `POS`  | Revisión posterior      | La diferencia se detecta después              |
| `VER`  | Comunicación verbal     | Confirmación entre trabajadores               |
| `MSG`  | Evidencia en mensaje    | WhatsApp o chat                               |
| `SIN`  | Sin control confirmado  | No existe evidencia suficiente                |

##### 4.2. Estado del control

| Estado                   | Significado                                            |
| ------------------------ | ------------------------------------------------------ |
| `CONFIRMADO`             | Existe y se utiliza de forma conocida                  |
| `IMPLÍCITO`              | Se aplica por costumbre, criterio o jerarquía informal |
| `PARCIAL`                | Cubre una parte, pero deja riesgos abiertos            |
| `POSTERIOR`              | Detecta después de ocurrido el efecto                  |
| `DEPENDIENTE_DE_PERSONA` | Depende de experiencia o presencia de alguien          |
| `AUSENTE`                | No existe control identificado                         |
| `POR_VALIDAR`            | Debe confirmarse en `OPS-AUD-015`                      |

---

#### 5. Inventario maestro de acciones sensibles

| Código    | Proceso                  | Acción sensible                | Ejecuta                                      | Aprueba o decide                          | Control actual                  | Estado                              |
| --------- | ------------------------ | ------------------------------ | -------------------------------------------- | ----------------------------------------- | ------------------------------- | ----------------------------------- |
| `CTL-001` | Remisiones               | Crear solicitud                | Responsable de área                          | Implícito en la responsabilidad del área  | Excel + envío al grupo          | `PARCIAL`                           |
| `CTL-002` | Remisiones               | Cambiar solicitud              | Responsable de área                          | No confirmado                             | Mensaje o nueva captura         | `POR_VALIDAR`                       |
| `CTL-003` | Producción               | Definir cantidades             | Responsable productivo                       | Criterio propio y remisiones              | Experiencia + consolidado       | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-004` | Producción               | Priorizar sedes                | Área productiva o conductor                  | Regla definida por Nathalia               | Regla cultural                  | `IMPLÍCITO`                         |
| `CTL-005` | Despacho                 | Enviar parcial                 | Conductor / producción                       | No existe aprobación separada             | Disponibilidad física           | `AUSENTE`                           |
| `CTL-006` | Despacho                 | Cambiar destino                | Conductor o responsable                      | Criterio operativo                        | Comunicación verbal             | `IMPLÍCITO`                         |
| `CTL-007` | Recepción interna        | Aceptar mercancía              | Responsable de área o delegado               | No confirmado                             | Conteo físico                   | `PARCIAL`                           |
| `CTL-008` | Bodega                   | Retirar insumos                | Cualquier trabajador                         | No confirmado                             | Acceso físico libre             | `AUSENTE`                           |
| `CTL-009` | Bodega                   | Conservar sobrantes en área    | Trabajador del área                          | Decisión local                            | Control visual                  | `IMPLÍCITO`                         |
| `CTL-010` | Compras                  | Consolidar necesidad           | Gerente general                              | Gerente general                           | Preguntas + experiencia         | `CONFIRMADO`                        |
| `CTL-011` | Compras                  | Enviar pedido                  | Gerente general o Leidy                      | Gerente general o criterio no formalizado | WhatsApp                        | `PARCIAL`                           |
| `CTL-012` | Compras                  | Aceptar precio/cambio          | Gerente general                              | Gerente general                           | Conversación con proveedor      | `PARCIAL`                           |
| `CTL-013` | Proveedores              | Recibir mercancía              | Carlos u otro trabajador capaz               | No confirmado                             | Visual + factura                | `PARCIAL`                           |
| `CTL-014` | Proveedores              | Firmar recepción               | Receptor                                     | El mismo receptor                         | Firma física                    | `CONFIRMADO`                        |
| `CTL-015` | Proveedores              | Rechazar diferencia            | No confirmado                                | No confirmado                             | Sin procedimiento conocido      | `POR_VALIDAR`                       |
| `CTL-016` | Merma                    | Declarar producto no apto      | Trabajador que detecta                       | El mismo trabajador                       | Evaluación sensorial            | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-017` | Merma                    | Desechar producto              | Mismo trabajador                             | Mismo trabajador                          | Hoja manual posterior           | `PARCIAL`                           |
| `CTL-018` | Transferencia a Molka    | Autorizar reasignación         | Trabajador o responsable                     | No formalizado                            | Aviso verbal                    | `AUSENTE`                           |
| `CTL-019` | Caja                     | Abrir turno                    | Cajero                                       | Rol operativo de Caja                     | Conteo de base + Makos          | `CONFIRMADO`                        |
| `CTL-020` | Caja                     | Cerrar turno                   | Cajero                                       | Cajero                                    | Cierre Makos + conteo           | `CONFIRMADO`                        |
| `CTL-021` | Caja                     | Eliminar producto              | Cajero                                       | Cajero                                    | Comentario obligatorio en Makos | `PARCIAL`                           |
| `CTL-022` | Caja                     | Corregir medio de pago         | No confirmado                                | No confirmado                             | Flujo desconocido               | `POR_VALIDAR`                       |
| `CTL-023` | Pago                     | Procesar tarjeta               | Cualquier trabajador disponible              | Cliente autoriza pago                     | Datáfono                        | `PARCIAL`                           |
| `CTL-024` | Pago                     | Registrar tarjeta en Makos     | Cajero                                       | Cajero                                    | Aviso verbal del trabajador     | `PARCIAL`                           |
| `CTL-025` | Efectivo                 | Entregar excedente             | Cajero o sede                                | Gerencia recibe                           | Cierre impreso + conteo         | `CONFIRMADO`                        |
| `CTL-026` | Efectivo                 | Custodiar excedente            | Gerente general                              | Gerente general                           | Conteo físico                   | `CONFIRMADO`                        |
| `CTL-027` | Efectivo                 | Usar recursos                  | Gerente general                              | Según necesidades del grupo               | Factura esperada                | `PARCIAL`                           |
| `CTL-028` | Contabilidad             | Registrar soporte              | Contabilidad                                 | Procedimiento contable                    | Factura/comprobante             | `CONFIRMADO_PARCIAL`                |
| `CTL-029` | Turnos                   | Crear horario                  | Gerente general y gerente de Vento Café      | Ambas según operación                     | Publicación en VISO             | `CONFIRMADO`                        |
| `CTL-030` | Turnos                   | Cambiar horario                | No confirmado                                | No confirmado                             | Flujo pendiente                 | `POR_VALIDAR`                       |
| `CTL-031` | Asistencia               | Registrar check-in             | Trabajador                                   | Sistema acepta                            | ANIMA                           | `CONFIRMADO`                        |
| `CTL-032` | Asistencia               | Corregir check-in              | No confirmado                                | No confirmado                             | Flujo pendiente                 | `POR_VALIDAR`                       |
| `CTL-033` | Propinas                 | Calcular distribución          | Gerente general                              | Gerente general                           | Cálculo manual                  | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-034` | Propinas                 | Aplicar descuento              | Gerente general                              | Gerente general                           | Retrasos/ausencias              | `PARCIAL`                           |
| `CTL-035` | Nómina                   | Preparar información           | Gerencia/Contabilidad                        | Gerencia/Contabilidad                     | Revisión previa                 | `CONFIRMADO_PARCIAL`                |
| `CTL-036` | Nómina                   | Ejecutar pago                  | Usuario bancario autorizado                  | Autoridad bancaria interna                | Bancolombia Nóminas             | `CONFIRMADO`                        |
| `CTL-037` | Contratación             | Filtrar candidatos             | Gerente general                              | Gerente general                           | Revisión de hojas de vida       | `CONFIRMADO`                        |
| `CTL-038` | Contratación             | Aprobar candidato              | Nathalia y gerente general                   | Nathalia y gerente general                | Observación de prueba           | `CONFIRMADO_PARCIAL`                |
| `CTL-039` | Contratación             | Formalizar                     | Abogados externos                            | Decisión previa interna                   | Documentos contractuales        | `CONFIRMADO`                        |
| `CTL-040` | Accesos                  | Solicitar alta                 | Gerencia                                     | Gerencia                                  | Solicitud informal              | `PARCIAL`                           |
| `CTL-041` | Accesos                  | Crear cuenta                   | Jefe de Operaciones                          | Solicitud de Gerencia                     | Creación manual                 | `PARCIAL`                           |
| `CTL-042` | Accesos                  | Solicitar baja                 | No existe flujo obligatorio                  | No definido                               | Descubrimiento informal         | `AUSENTE`                           |
| `CTL-043` | Accesos                  | Desactivar cuenta              | Jefe de Operaciones                          | Decisión derivada del retiro              | Acción manual                   | `POSTERIOR`                         |
| `CTL-044` | Marketing                | Solicitar contenido            | Nathalia o Jeo                               | Nathalia o Jeo                            | WhatsApp/verbal                 | `CONFIRMADO`                        |
| `CTL-045` | Marketing                | Publicar historia              | Quien crea la pieza                          | Normalmente sin aprobación previa         | Criterio del creador            | `IMPLÍCITO`                         |
| `CTL-046` | Marketing                | Aprobar publicación permanente | Nathalia o Jeo                               | Nathalia o Jeo                            | Revisión informal               | `CONFIRMADO_PARCIAL`                |
| `CTL-047` | Vaila Vainilla           | Gestionar pedido               | Jeo                                          | Jeo                                       | Shopify + coordinación humana   | `CONFIRMADO`                        |
| `CTL-048` | Vaila Vainilla           | Empacar y entregar             | Trabajadora de ventas                        | Jeo o flujo implícito                     | Pedido + revisión               | `PARCIAL`                           |
| `CTL-049` | Soporte técnico          | Priorizar incidente            | Jefe de Operaciones                          | Criterio por impacto                      | Experiencia                     | `DEPENDIENTE_DE_PERSONA`            |
| `CTL-050` | Soporte técnico          | Aplicar cambio                 | Jefe de Operaciones                          | El mismo ejecutor                         | Prueba de funcionamiento        | `PARCIAL`                           |
| `CTL-051` | Mantenimiento            | Contratar técnico              | Gerente general                              | Gerente general                           | Contacto directo                | `CONFIRMADO`                        |
| `CTL-052` | Mantenimiento            | Aceptar reparación             | Gerente general o usuario                    | No formalizado                            | Funcionamiento visible          | `PARCIAL`                           |
| `CTL-053` | Servicios Generales      | Priorizar limpieza             | Nathalia, Carlos, responsables o trabajadora | Jerarquía informal                        | Instrucción directa             | `IMPLÍCITO`                         |
| `CTL-054` | Servicios Generales      | Aceptar resultado              | Quien observa                                | Quien solicitó                            | Revisión visual                 | `PARCIAL`                           |
| `CTL-055` | Dispositivos compartidos | Ejecutar acción                | Trabajador presente                          | Cuenta funcional ya abierta               | Sesión compartida               | `AUSENTE` para identidad individual |

---

#### 6. Remisiones, producción y logística

##### 6.1. Creación de solicitudes

La responsabilidad de elaborar la solicitud recae en el área.

No existe una aprobación separada confirmada antes de enviarla.

```text
ÁREA IDENTIFICA NECESIDAD
→ MISMA ÁREA DEFINE CANTIDAD
→ MISMA ÁREA ENVÍA
```

Control actual:

- experiencia del responsable;
- conocimiento de consumo;
- revisión visual;
- formato de Excel.

Riesgos:

- sobrepedido;
- subpedido;
- solicitud tardía;
- duplicación;
- producto incorrecto;
- ausencia de responsable individual.

##### 6.2. Consolidación productiva

El responsable del área productiva:

- recibe solicitudes;
- suma cantidades;
- decide ejecución;
- distribuye trabajo;
- informa resultado.

En varios casos no existe segunda revisión.

```text
CONSOLIDA
+
PLANIFICA
+
ASIGNA
+
REPORTA
```

Esta concentración debe conservarse como hallazgo AS-IS.

##### 6.3. Prioridad entre sedes

La prioridad conocida fue definida por Nathalia:

1. Vento Café;
2. Saudo;
3. Molka.

Actualmente funciona como una regla cultural.

No existe evidencia de:

- documento vigente;
- condiciones de excepción;
- fecha de aprobación;
- criterio cuantitativo;
- responsable de modificarla.

##### 6.4. Preparación y despacho

El conductor:

- consulta solicitudes;
- localiza productos;
- define disponibilidad física;
- organiza canastas;
- puede enviar parciales;
- distribuye por destino;
- carga;
- transporta.

Control actual:

- experiencia;
- conteo;
- conocimiento de productos;
- marcaciones visuales.

No existe un revisor independiente confirmado de la carga.

##### 6.5. Recepción en sede

Recibe:

- responsable del área;
- trabajador disponible;
- delegado.

Control:

- conteo;
- revisión visual;
- almacenamiento.

No existe evidencia de:

- firma;
- aprobación;
- aceptación estructurada;
- registro de diferencia;
- separación entre recibir y custodiar.

---

#### 7. Bodega e inventario

##### 7.1. Acceso a Bodega

Cualquier trabajador puede entrar y retirar insumos.

No existe una aprobación obligatoria confirmada.

```text
NECESIDAD
→ INGRESO
→ RETIRO
→ USO
```

Control actual:

- ubicación física;
- conocimiento de producto;
- presencia ocasional de Carlos;
- revisión posterior cuando falta inventario.

Estado: `AUSENTE` como segregación formal.

##### 7.2. Custodia de inventario

La responsabilidad habitual de Bodega existe, pero su titular está vacante.

Carlos cubre parcialmente:

- recepción;
- organización;
- supervisión;
- soporte.

El conductor cubre:

- apertura;
- retiro;
- alistamiento;
- carga;
- cierre.

Las áreas conservan sobrantes.

Resultado:

```text
CUSTODIA
→ DISTRIBUIDA
→ TEMPORAL
→ SIN ÚNICO RESPONSABLE EFECTIVO TODO EL DÍA
```

##### 7.3. Conteos y ajustes

No existe procedimiento confirmado para aprobar:

- conteo inicial;
- diferencia;
- ajuste;
- reapertura;
- corrección;
- regularización.

El piloto permitió movimientos incompletos y perdió confiabilidad.

---

#### 8. Compras y recepción de proveedores

##### 8.1. Necesidad de compra

Las áreas informan faltantes.

La gerente general consolida y define cantidades.

Control:

- experiencia;
- urgencia;
- consulta directa;
- conocimiento de compras previas.

No existe cálculo confiable desde inventario.

##### 8.2. Envío del pedido

La gerente general o Leidy envían el pedido.

Debe distinguirse:

```text
GERENTE GENERAL
→ CONSOLIDA Y DECIDE

LEIDY
→ PUEDE EJECUTAR EL ENVÍO
```

No se confirmó si Leidy puede modificar cantidades o aceptar cambios sin consultar.

Se vincula a `OPS-AUD-015`.

##### 8.3. Aceptación de precio y condiciones

La gerente general concentra actualmente la decisión.

Control:

- conversación con proveedor;
- experiencia;
- conocimiento de urgencia.

No existe comparación formal confirmada entre varias cotizaciones.

##### 8.4. Recepción física

Cuando recibe Carlos:

```text
RECIBE
→ REVISA
→ COMPARA
→ FIRMA
→ CUSTODIA SOPORTE TEMPORALMENTE
```

La misma persona ejecuta revisión y aceptación.

No existe segundo control confirmado.

##### 8.5. Recepción por sustituto

Puede recibir el conductor u otra persona capaz.

No se conoce:

- quién lo designa;
- qué puede firmar;
- qué diferencias puede aceptar;
- cuándo debe escalar;
- quién responde por el soporte.

---

#### 9. Merma y disposición

##### 9.1. Concentración actual

El trabajador puede:

```text
DETECTAR
→ EVALUAR
→ DECIDIR
→ DESECHAR
→ REGISTRAR
```

No existe aprobación separada confirmada.

Control:

- inspección sensorial;
- hoja manual de merma.

Riesgos:

- abuso;
- error;
- merma duplicada;
- falta de lote;
- falta de evidencia;
- inventario no actualizado.

##### 9.2. Transferencia de producto a Molka

La decisión puede tomarla el trabajador que considera que el producto ya no tiene la frescura comercial esperada.

No existe:

- aprobación formal;
- registro de transferencia;
- aceptación de Molka;
- fecha de vencimiento;
- límite de vida útil;
- control de inventario.

---

#### 10. Caja, ventas y pagos

##### 10.1. Apertura y cierre

El cajero:

- cuenta la base;
- abre;
- opera;
- cierra;
- cuenta efectivo.

Makos separa sesiones o turnos.

Control:

- conteo;
- cierre impreso;
- comparación posterior.

La persona que ejecuta el turno realiza también su cierre.

##### 10.2. Eliminación de productos

Makos exige comentario al eliminar un producto.

Este es un control de sistema actual.

Sin embargo:

- el cajero ejecuta y justifica;
- no se confirmó revisión posterior;
- no se vincula formalmente con el reemplazo;
- no se confirma efecto en producción o inventario.

##### 10.3. Pago con tarjeta

Cualquier trabajador puede llevar el datáfono.

Después informa al cajero.

Segregación actual:

```text
TRABAJADOR
→ EJECUTA PAGO FÍSICO

CAJERO
→ REGISTRA Y CIERRA
```

Este doble paso podría ser un control, pero depende de comunicación verbal y no de confirmación automática.

##### 10.4. Efectivo

El cajero entrega excedente y cierre.

La gerente general:

- recibe;
- cuenta;
- compara;
- custodia;
- administra.

Existe separación entre Caja y custodia posterior, pero Gerencia concentra:

- recepción;
- verificación;
- custodia;
- uso posterior.

##### 10.5. Diferencia de Caja

No se confirmó:

- quién investiga;
- quién aprueba ajuste;
- quién asume;
- si hay tolerancia;
- cómo se documenta;
- si puede afectar propina o nómina.

---

#### 11. Contabilidad y soportes

##### 11.1. Facturas y comprobantes

Control actual:

```text
PAGO O RECEPCIÓN
→ FACTURA
→ ENTREGA A GERENCIA
→ CARGA A CONTABILIDAD
→ CONCILIACIÓN POSTERIOR
```

La conciliación posterior detecta faltantes.

Es un control `POSTERIOR`, no preventivo.

##### 11.2. Clasificación de movimientos

El caso de retiros registrados como gastos demuestra que:

- existe registro;
- la clasificación económica puede ser incorrecta;
- el control se realiza mediante interpretación posterior.

No se confirmó quién puede reclasificar ni qué evidencia requiere.

---

#### 12. Turnos y asistencia

##### 12.1. Programación

La gerente general y la gerente de Vento Café elaboran horarios.

La participación exacta puede variar:

- Vento Café aporta conocimiento de personal operativo;
- Gerencia coordina el conjunto.

Control:

- revisión conjunta;
- publicación en VISO.

No existe aceptación obligatoria del trabajador.

##### 12.2. Check-in

El trabajador registra su propia asistencia.

El sistema conserva el evento.

No se confirmó un supervisor que valide presencia física en cada caso.

##### 12.3. Correcciones

No se conoce:

- quién solicita;
- quién aprueba;
- qué evidencia se exige;
- quién modifica;
- cómo afecta reportes y propinas.

Se vincula a `OPS-AUD-015`.

---

#### 13. Propinas y nómina

##### 13.1. Propinas

La gerente general:

- calcula;
- aplica ajustes;
- entrega dinero.

Concentración:

```text
CALCULA
+
DECIDE AJUSTE
+
CUSTODIA
+
ENTREGA
```

No existe control separado confirmado.

Los retrasos y ausencias actúan como insumo, pero no se conserva:

- cálculo inicial;
- regla;
- descuento;
- motivo;
- aprobación;
- aceptación.

##### 13.2. Nómina

La preparación involucra a Gerencia y Contabilidad.

Bancolombia Nóminas controla el pago bancario mediante credenciales autorizadas.

No se confirmó:

- quién prepara;
- quién revisa;
- quién autoriza definitivamente;
- si existe doble aprobación bancaria.

---

#### 14. Contratación, inducción y accesos

##### 14.1. Contratación

Participaciones conocidas:

```text
GERENTE GENERAL
→ PUBLICA, FILTRA, LLAMA, ENTREVISTA

RESPONSABLE DE ÁREA
→ OBSERVA PRUEBA

NATHALIA + GERENTE GENERAL
→ DECIDEN

ABOGADOS
→ FORMALIZAN
```

Existe separación entre evaluación interna y formalización jurídica.

No existe una ficha de evaluación confirmada.

##### 14.2. Inducción

La realiza quien esté disponible.

En Vento Café participa la gerente.

No existe:

- responsable único;
- lista de capacidades;
- firma;
- evaluación;
- aprobación de habilitación.

##### 14.3. Alta de accesos

Gerencia solicita.

Jefe de Operaciones ejecuta.

Esto separa parcialmente:

```text
NECESIDAD Y AUTORIZACIÓN
→ GERENCIA

CREACIÓN TÉCNICA
→ JEFE DE OPERACIONES
```

Pero la solicitud es informal y puede carecer de:

- sede;
- área;
- rol;
- fecha;
- vencimiento;
- responsable;
- evidencia.

##### 14.4. Baja de accesos

No existe iniciador obligatorio.

El Jefe de Operaciones:

- descubre;
- decide que corresponde desactivar;
- ejecuta.

No existe control preventivo ni SLA.

Este es uno de los principales riesgos de seguridad detectados.

---

#### 15. Marketing

##### 15.1. Solicitud

Nathalia o Jeo actúan como iniciadores y autoridades de negocio.

##### 15.2. Historias

Quien crea puede publicar sin aprobación previa.

Concentración:

```text
CREA
→ REVISA PROPIAMENTE
→ PUBLICA
```

##### 15.3. Publicaciones permanentes

Nathalia o Jeo aprueban.

Quien creó la pieza publica.

Existe separación parcial entre:

- creador;
- aprobador;
- publicador.

Sin embargo, la evidencia de aprobación no está estructurada.

##### 15.4. Correcciones

No se confirmó:

- quién decide versión final;
- cuántas revisiones;
- cuándo una pieza se considera aprobada;
- cómo se conserva la decisión.

---

#### 16. Vaila Vainilla

Jeo concentra:

- recepción;
- administración;
- priorización;
- coordinación.

La trabajadora de ventas:

- empaca;
- custodia temporalmente;
- entrega a mensajería.

No se confirmó:

- segundo control de contenido del paquete;
- validación de pago;
- conciliación de inventario;
- autorización de devolución;
- aprobación de reembolso;
- control de entrega final.

---

#### 17. Soporte tecnológico

##### 17.1. Priorización

El Jefe de Operaciones recibe el incidente y decide prioridad según impacto.

No existe cola ni supervisor separado.

##### 17.2. Ejecución y cierre

La misma persona:

- diagnostica;
- modifica;
- prueba;
- declara resuelto.

Control:

- funcionamiento visible;
- confirmación informal del usuario.

No existe revisión independiente ni historial técnico.

Esta concentración es operativamente comprensible, pero debe registrarse como riesgo y dependencia personal.

---

#### 18. Mantenimiento

La gerente general:

- recibe reporte;
- decide contactar técnico;
- selecciona o usa proveedor conocido;
- coordina;
- puede aceptar el resultado.

El técnico:

- diagnostica;
- propone;
- repara.

No existe registro confirmado de:

- cotización;
- aprobación de costo;
- orden;
- recepción técnica;
- garantía;
- repuesto retirado;
- evidencia de cierre.

---

#### 19. Servicios Generales

La prioridad se define mediante una jerarquía informal:

1. Nathalia o Carlos;
2. responsables de área;
3. rutina;
4. criterio propio.

La misma trabajadora ejecuta y autoevalúa inicialmente.

El solicitante puede pedir repetición.

No existe checklist ni supervisor formal permanente.

---

#### 20. Dispositivos y cuentas compartidas

##### 20.1. Makos Servicio

La cuenta identifica una función, no necesariamente a la persona.

##### 20.2. Tablets y celulares

Varias personas pueden ejecutar:

- pedidos;
- consultas;
- impresión;
- cambios.

##### 20.3. Redes y canales

Las cuentas pueden ser compartidas.

##### 20.4. Efecto sobre segregación

Aunque la operación física separe actores, el sistema puede registrar una sola identidad.

```text
PERSONA A EJECUTA
→ CUENTA COMPARTIDA

PERSONA B CORRIGE
→ MISMA CUENTA

AUDITORÍA
→ NO DISTINGUE
```

Esta brecha deberá alimentar:

- `CAP-MAP-006`;
- `PROC-ACTOR-001`;
- `PROC-ACTOR-002`;
- `PROC-ACTOR-003`;
- diseño de actor efectivo;
- dispositivos compartidos;
- autorización posterior.

---

#### 21. Concentraciones críticas de funciones

| Código     | Concentración                                                  | Riesgo                                    |
| ---------- | -------------------------------------------------------------- | ----------------------------------------- |
| `CONC-001` | Trabajador detecta, decide, desecha y registra merma           | Pérdida o abuso sin revisión              |
| `CONC-002` | Gerente general calcula, ajusta y entrega propinas             | Falta de transparencia                    |
| `CONC-003` | Gerente general recibe, cuenta, custodia y usa efectivo        | Custodia centralizada                     |
| `CONC-004` | Jefe de Operaciones diagnostica, cambia y cierra soporte       | Dependencia personal y falta de auditoría |
| `CONC-005` | Conductor localiza, alista, cambia cantidades, carga y entrega | Diferencias sin segunda revisión          |
| `CONC-006` | Responsable productivo consolida, asigna y reporta             | Producción sin verificación independiente |
| `CONC-007` | Cajero elimina producto y registra sustitución                 | Corrección sin aprobación separada        |
| `CONC-008` | Trabajador puede retirar libremente de Bodega                  | Inventario sin custodia                   |
| `CONC-009` | Jefe de Operaciones descubre y ejecuta baja de acceso          | Revocación tardía                         |
| `CONC-010` | Creador publica historias sin aprobación previa                | Riesgo reputacional                       |
| `CONC-011` | Jeo administra pedido y decisión comercial de Vaila            | Dependencia de una persona                |
| `CONC-012` | Gerente general concentra compras y proveedores                | Cuello de botella y poca trazabilidad     |

---

#### 22. Segregaciones existentes aunque sean informales

No todo el modelo actual carece de separación.

##### 22.1. Pago con tarjeta

- trabajador opera datáfono;
- cajero registra y cierra.

##### 22.2. Contratación

- Gerencia filtra;
- área observa;
- Nathalia y Gerencia deciden;
- abogados formalizan.

##### 22.3. Alta de acceso

- Gerencia solicita;
- Jefe de Operaciones crea.

##### 22.4. Publicación permanente

- creador produce;
- Nathalia o Jeo aprueba;
- creador publica.

##### 22.5. Contabilidad

- operación produce soporte;
- Gerencia recibe;
- Contabilidad registra.

##### 22.6. Entrega de efectivo

- sede entrega;
- Gerencia recibe y cuenta.

Estas separaciones deberán evaluarse después para determinar si son suficientes, redundantes o deben formalizarse.

---

#### 23. Controles posteriores

Los siguientes controles detectan el problema después de ocurrido:

| Control posterior                 | Problema detectado                      |
| --------------------------------- | --------------------------------------- |
| Conteo de efectivo contra cierre  | Diferencia de Caja                      |
| Conciliación contable             | Factura faltante o clasificación errada |
| Conteo físico                     | Inventario digital incorrecto           |
| Reclamo de sede                   | Faltante de remisión                    |
| Reclamo del cliente               | Entrega fallida o pedido incorrecto     |
| Descubrimiento del retiro laboral | Cuenta aún activa                       |
| Queja por suciedad                | Canasta requiere lavado                 |
| Equipo vuelve a fallar            | Solución técnica incompleta             |
| Producto se daña                  | Reasignación o vida útil inadecuada     |

El control posterior no evita el efecto inicial.

---

#### 24. Acciones sensibles sin control suficiente confirmado

1. retirar insumos de Bodega;
2. enviar remisión parcial;
3. cambiar destino de producto;
4. transferir producto a Molka;
5. desechar merma;
6. corregir una merma;
7. aceptar diferencia de proveedor;
8. recibir cuando Carlos no está;
9. corregir medio de pago;
10. anular factura;
11. resolver diferencia de Caja;
12. cambiar turno;
13. corregir check-in;
14. aplicar descuento de propina;
15. revocar accesos al retiro;
16. aprobar devolución de Vaila Vainilla;
17. aprobar reparación y costo;
18. retirar una publicación errónea;
19. ajustar inventario;
20. declarar una remisión completamente recibida.

Todos quedan vinculados a `OPS-AUD-015` cuando el procedimiento actual deba confirmarse.

---

#### 25. Relación con autorización futura

La transformación posterior deberá seguir esta secuencia:

```text
ACCIÓN SENSIBLE AS-IS
→ PROCESO TO-BE
→ RESPONSABILIDAD OBJETIVO
→ APROBACIÓN OBJETIVO
→ ROL BASE
+
ROL OPERATIVO
+
CONTEXTO
+
PERMISO
+
AUDITORÍA
```

No deberá realizarse la conversión automática:

```text
PERSONA QUE HOY LO HACE
→ PERSONA QUE DEBE PODER HACERLO SIEMPRE
```

Tampoco:

```text
APROBADOR EMPRESARIAL
→ ROL TÉCNICO CON ACCESO ILIMITADO
```

---

#### 26. Matriz de validaciones pendientes

| Tema                  | Validación requerida                          |
| --------------------- | --------------------------------------------- |
| Cambios de remisión   | Quién puede modificar y hasta cuándo          |
| Parciales             | Quién puede aceptar o cerrar saldo            |
| Recepción en sede     | Quién firma o acepta diferencias              |
| Leidy en compras      | Alcance de decisión y modificación            |
| Recepción sustituta   | Designación, firma y responsabilidad          |
| Diferencias proveedor | Rechazo, devolución y aprobación              |
| Ajustes de inventario | Iniciador, aprobador y evidencia              |
| Merma                 | Si existe revisión superior                   |
| Caja                  | Corrección de medios de pago y diferencias    |
| Facturación           | Anulación, nota crédito y reimpresión         |
| Turnos                | Cambio, reemplazo y aprobación                |
| Check-in              | Corrección y evidencia                        |
| Nómina                | Preparación, revisión y autorización bancaria |
| Propinas              | Regla, revisión y reclamo                     |
| Accesos               | Alta, modificación, suspensión y baja         |
| Marketing             | Evidencia y correcciones                      |
| Vaila Vainilla        | Devoluciones, reembolsos y entrega fallida    |
| Mantenimiento         | Aprobación de costo y aceptación              |
| Canastas              | Responsable de custodia y pérdida             |

Destino: `OPS-AUD-015`.

---

#### 27. Matriz de destino de hallazgos

| Hallazgo                                                  | Tarea exacta          |
| --------------------------------------------------------- | --------------------- |
| Frecuencia y criticidad de controles                      | `OPS-AUD-010`         |
| Dependencias de personas, sedes y terceros                | `OPS-AUD-011`         |
| Conciliaciones y doble intervención                       | `OPS-AUD-012`         |
| Pérdida de actor, aprobación y custodia                   | `OPS-AUD-013`         |
| Controles ante caída tecnológica                          | `OPS-AUD-014`         |
| Aprobadores y procedimientos no confirmados               | `OPS-AUD-015`         |
| Iniciador, ejecutor, supervisor y aprobador por capacidad | `CAP-MAP-006`         |
| Vinculación con roles base                                | `PROC-ACTOR-001`      |
| Vinculación con roles operativos                          | `PROC-ACTOR-002`      |
| Separación de iniciador, ejecutor, supervisor y aprobador | `PROC-ACTOR-003`      |
| Consolidación de brechas                                  | `GAP-CTRL-001`        |
| Vinculación a tarea y paquete futuro                      | `GAP-CTRL-006`        |
| Diseño TO-BE de aprobaciones                              | BLOQUE E2             |
| Implementación física de autorización                     | BLOQUES H, J, R0 y R1 |

---

#### 28. Decisiones propuestas

1. La documentación separa iniciador, ejecutor, revisor, aprobador, custodio, registrador y corrector.
2. La operación actual combina controles visuales, conteos, comparaciones, firmas, comentarios y escalamiento informal.
3. Varias aprobaciones son implícitas o culturales.
4. El conductor concentra alistamiento, ajuste, carga, transporte y entrega.
5. Las áreas productivas concentran consolidación, asignación y reporte.
6. Los retiros de Bodega no tienen aprobación ni registro completo.
7. La gerente general concentra consolidación y decisión de compras.
8. El alcance de Leidy al ordenar compras debe validarse.
9. La recepción de proveedor concentra revisión y firma en el receptor.
10. La merma concentra detección, decisión, disposición y registro en una persona.
11. La transferencia a Molka carece de aprobación y control formal.
12. Makos exige comentario al eliminar productos, pero no una aprobación separada.
13. El pago con tarjeta tiene doble intervención, pero depende de comunicación verbal.
14. La entrega de efectivo separa sede y Gerencia, aunque Gerencia concentra verificación, custodia y uso.
15. La conciliación contable es principalmente posterior.
16. La programación de turnos se comparte entre Gerencia General y Gerencia de Vento Café.
17. El trabajador registra su propio check-in.
18. La propina concentra cálculo, ajuste, custodia y entrega en Gerencia General.
19. La contratación separa evaluación interna y formalización jurídica.
20. La inducción no tiene responsable ni aprobación de competencia formal.
21. El alta de accesos separa solicitud y ejecución técnica.
22. La baja de accesos carece de iniciador obligatorio.
23. Las historias pueden publicarse sin aprobación previa.
24. Las publicaciones permanentes requieren aprobación de Nathalia o Jeo.
25. Soporte tecnológico depende del criterio y ejecución del Jefe de Operaciones.
26. Mantenimiento depende de Gerencia General y técnicos externos.
27. Las cuentas compartidas invalidan parte de la segregación real al nivel de auditoría.
28. Las concentraciones AS-IS no se convierten automáticamente en diseño objetivo.
29. Ninguna decisión autoriza roles, permisos, RLS, RPC, código, migraciones o cambios en Supabase.

---

#### 29. Criterios de aceptación

`OPS-AUD-009` podrá aprobarse cuando se confirme que:

- las acciones sensibles principales están inventariadas;
- se distinguen ejecución, aprobación, revisión, custodia y registro;
- los controles manuales actuales están descritos;
- se identifican controles preventivos y posteriores;
- se documentan concentraciones de funciones;
- se documentan segregaciones existentes;
- se registran cuentas y dispositivos compartidos;
- las acciones sin control suficiente quedan explícitas;
- cada duda tiene propietario en `OPS-AUD-015`;
- cada brecha tiene destino documental exacto;
- no se han creado roles ni permisos;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 30. Resultado y continuidad

Con la aprobación de `OPS-AUD-009` quedará establecida la línea base inicial de:

- aprobaciones actuales;
- controles manuales;
- custodios;
- revisores;
- ejecutores;
- correctores;
- escalamiento;
- concentraciones de funciones;
- segregaciones informales;
- controles posteriores;
- acciones sensibles sin control;
- riesgos de cuentas compartidas;
- dependencias de personas clave.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-010
— Medir frecuencia, volumen, criticidad, tiempos y estacionalidad
```

`OPS-AUD-010` deberá utilizar estos procesos, excepciones y controles para establecer qué ocurre con mayor frecuencia, qué moviliza más trabajo, qué es más crítico y qué requiere ventanas, capacidad o respuesta prioritaria, sin diseñar todavía la solución TO-BE.



### ✅ OPS-AUD-010 — Medir frecuencia, volumen, criticidad, tiempos y estacionalidad

**Estado:** APROBADA  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Línea base AS-IS de carga operativa, frecuencia, tiempos, criticidad y variación temporal  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** `OPS-AUD-001` a `OPS-AUD-009`  
**Método:** consolidación de datos confirmados, intervalos aproximados aportados por responsables y clasificación cualitativa cuando todavía no existe medición confiable  
**Validación pendiente:** `OPS-AUD-015` para cifras, frecuencias o temporadas no confirmadas

---

#### 1. Propósito

Establecer una línea base inicial de:

- frecuencia de ejecución;
- volumen operativo;
- duración;
- hora o ventana crítica;
- tiempo máximo tolerable;
- criticidad;
- estacionalidad;
- concentración de carga;
- dependencia de capacidad física o humana.

Esta tarea deberá diferenciar expresamente entre:

```text
DATO MEDIDO O CONFIRMADO
≠
ESTIMACIÓN OPERATIVA
≠
CLASIFICACIÓN CUALITATIVA
≠
DATO TODAVÍA DESCONOCIDO
```

El objetivo no es producir cifras artificiales.

Cuando no exista evidencia suficiente, el resultado correcto será:

- declarar el dato como no medido;
- clasificar su relevancia;
- definir la unidad que deberá medirse;
- vincular la validación a una tarea concreta.

---

#### 2. Alcance

Incluye los procesos ordinarios y excepciones identificados en:

- abastecimiento interno;
- remisiones;
- producción;
- Bodega;
- compras;
- proveedores;
- transporte;
- recepción;
- ventas;
- Caja;
- domicilios;
- Contabilidad;
- turnos;
- asistencia;
- propinas;
- nómina;
- contratación;
- accesos;
- Marketing;
- Vaila Vainilla;
- soporte tecnológico;
- mantenimiento;
- mermas;
- transferencias;
- Servicios Generales.

No define todavía:

- SLA objetivo;
- capacidad futura;
- dotación óptima;
- turnos objetivo;
- stock mínimo;
- punto de reorden;
- frecuencia TO-BE;
- programación automática;
- colas;
- alertas;
- dimensionamiento de infraestructura;
- arquitectura de datos;
- implementación.

---

#### 3. Escala de evidencia

| Código | Estado de evidencia | Uso                                                   |
| ------ | ------------------- | ----------------------------------------------------- |
| `M`    | Medido              | Existe una duración o cantidad observada directamente |
| `C`    | Confirmado          | El responsable confirmó frecuencia, horario o volumen |
| `A`    | Aproximado          | Existe un intervalo razonable aportado por operación  |
| `Q`    | Cualitativo         | Solo puede clasificarse como alto, medio o bajo       |
| `N`    | No medido           | No existe evidencia suficiente                        |
| `V`    | Por validar         | Debe confirmarse en `OPS-AUD-015`                     |

Toda cifra aproximada deberá mantener términos como:

- aproximadamente;
- normalmente;
- entre;
- cerca de;
- al menos;
- según carga.

---

#### 4. Escala de frecuencia

| Código       | Frecuencia                                | Definición                                   |
| ------------ | ----------------------------------------- | -------------------------------------------- |
| `CONT`       | Continua                                  | Ocurre repetidamente durante toda la jornada |
| `INTRA`      | Varias veces al día                       | Se repite dentro de una jornada              |
| `DIARIA`     | Una o más veces cada día operativo        |
| `SEMANAL`    | Una o varias veces por semana             |
| `QUINCENAL`  | Aproximadamente cada dos semanas          |
| `MENSUAL`    | Una o varias veces por mes                |
| `POR_TURNO`  | Una vez por turno                         |
| `POR_PEDIDO` | Cada vez que existe una venta o solicitud |
| `POR_EVENTO` | Solo cuando ocurre una condición          |
| `ESTACIONAL` | Se concentra en fechas o temporadas       |
| `IRREGULAR`  | Sin frecuencia estable                    |
| `NO_MEDIDA`  | Frecuencia desconocida                    |

---

#### 5. Escala cualitativa de volumen

El volumen se clasifica según carga operativa relativa, no según ingresos.

| Nivel            | Interpretación                                       |
| ---------------- | ---------------------------------------------------- |
| `V1 — MUY BAJO`  | Casos excepcionales o esporádicos                    |
| `V2 — BAJO`      | Pocos eventos por período                            |
| `V3 — MEDIO`     | Carga recurrente controlable                         |
| `V4 — ALTO`      | Muchas transacciones, productos o intervenciones     |
| `V5 — MUY ALTO`  | Flujo continuo o concentrado que domina la operación |
| `VN — NO MEDIDO` | No existe evidencia suficiente                       |

La clasificación deberá validarse posteriormente mediante conteos reales.

---

#### 6. Escala de criticidad

| Nivel            | Descripción                                                        | Consecuencia típica                  |
| ---------------- | ------------------------------------------------------------------ | ------------------------------------ |
| `CR1 — BAJA`     | Puede esperar sin afectar operación principal                      | Retraso administrativo menor         |
| `CR2 — MODERADA` | Afecta eficiencia o experiencia, pero existe alternativa           | Trabajo manual adicional             |
| `CR3 — ALTA`     | Afecta un área, sede o proceso relevante                           | Retraso, reproceso o pérdida parcial |
| `CR4 — CRÍTICA`  | Detiene venta, producción, despacho, pago o acceso                 | Interrupción operativa importante    |
| `CR5 — SEVERA`   | Puede producir pérdida financiera, sanitaria, legal o de seguridad | Riesgo empresarial inmediato         |

La criticidad no equivale a frecuencia.

```text
POCO FRECUENTE
+
ALTO IMPACTO
→ PUEDE SER CRÍTICO
```

---

#### 7. Escala de sensibilidad temporal

| Código | Tolerancia aproximada AS-IS         |
| ------ | ----------------------------------- |
| `T0`   | Debe resolverse inmediatamente      |
| `T1`   | Menos de 15 minutos                 |
| `T2`   | Durante la hora                     |
| `T3`   | Durante el turno                    |
| `T4`   | Antes del siguiente ciclo operativo |
| `T5`   | Durante el día                      |
| `T6`   | Durante la semana                   |
| `T7`   | Puede programarse                   |
| `TN`   | No definida                         |

Esta escala no constituye un SLA objetivo.

---

#### 8. Ventanas operativas confirmadas

| Código    | Ventana o duración                                                                        | Evidencia       | Proceso                                                  |
| --------- | ----------------------------------------------------------------------------------------- | --------------- | -------------------------------------------------------- |
| `TMP-001` | Conductor llega aproximadamente a las **05:30**                                           | `A`             | Apertura del Centro de Producción y remisiones matutinas |
| `TMP-002` | Jefatura de Operaciones está habitualmente de **08:00 a 12:00** y de **14:00 a 17:00**    | `C`             | Recepción de proveedores, Bodega y soporte               |
| `TMP-003` | Conductor regresa aproximadamente a las **17:00**                                         | `A`             | Recolección de producción y carga                        |
| `TMP-004` | Alistamiento y carga de la tarde toma aproximadamente **1,5 a 2 horas**                   | `A`             | Despacho interno                                         |
| `TMP-005` | Vento Café tiene **dos turnos y dos cierres de Caja diarios**                             | `C`             | Caja                                                     |
| `TMP-006` | Producción central de Barra ocurre los **martes**                                         | `C`             | Producción semanal de Barra                              |
| `TMP-007` | Una o dos recetas de Galletería producen aproximadamente **104 galletas**                 | `A`             | Producción de Galletería                                 |
| `TMP-008` | Esa producción suele cubrir aproximadamente **una semana**                                | `A`             | Stock de Galletería                                      |
| `TMP-009` | Panadería utiliza procesos de **varios días** por fermentación y reposo                   | `C` cualitativo | Panadería y Bollería                                     |
| `TMP-010` | Las solicitudes suelen prepararse al **final del turno** y a veces en la mañana siguiente | `C` cualitativo | Remisiones                                               |
| `TMP-011` | Compras principales tienen comportamiento **semanal**, con urgencias adicionales          | `C` cualitativo | Compras                                                  |
| `TMP-012` | Servicios Generales opera durante la jornada con rutina y solicitudes variables           | `C` cualitativo | Limpieza                                                 |
| `TMP-013` | Soporte y mantenimiento son reactivos, sin agenda fija                                    | `C`             | Tecnología y mantenimiento                               |

---

#### 9. Volumen mínimo conocido de solicitudes internas

Cuando todas las unidades operativas envían solicitud en el mismo ciclo, existe al menos la siguiente estructura:

| Origen                                       | Solicitudes diferenciadas |
| -------------------------------------------- | ------------------------: |
| Vento Café — Servicio                        |                         1 |
| Vento Café — Cocina                          |                         1 |
| Vento Café — Barra                           |                         1 |
| Saudo                                        |                         1 |
| Molka                                        |                         1 |
| **Total mínimo conocido por ciclo completo** |                     **5** |

Este total:

- representa conjuntos de solicitud, no líneas de producto;
- no incluye compras;
- no incluye solicitudes extraordinarias;
- no implica que todas se envíen todos los días;
- debe validarse por día de operación en `OPS-AUD-015`.

El volumen real de líneas, productos, presentaciones y cantidades no está medido.

---

#### 10. Matriz maestra de frecuencia, volumen y criticidad

| Código     | Proceso                      | Frecuencia AS-IS                        | Volumen          | Criticidad | Sensibilidad          |
| ---------- | ---------------------------- | --------------------------------------- | ---------------- | ---------- | --------------------- |
| `PROC-001` | Solicitud de remisión        | `DIARIA` / fin de turno                 | `V4` estimado    | `CR4`      | `T4`                  |
| `PROC-002` | Consolidación productiva     | `DIARIA`                                | `V4`             | `CR4`      | `T4`                  |
| `PROC-003` | Preparación matutina         | `DIARIA`                                | `V4`             | `CR4`      | `T2`                  |
| `PROC-004` | Panadería y Bollería         | `DIARIA` + ciclos multiday              | `V4`             | `CR4`      | `T4`                  |
| `PROC-005` | Repostería                   | `DIARIA` según remisión                 | `V3`             | `CR3`      | `T4`                  |
| `PROC-006` | Tortas estandarizadas        | `POR_PEDIDO` / remisión                 | `V2-V3`          | `CR3`      | `T4`                  |
| `PROC-007` | Galletería                   | `SEMANAL` aproximada                    | `V2`             | `CR2`      | `T6`                  |
| `PROC-008` | Cocina Caliente              | `SEMANAL` planificada + retiros diarios | `V3`             | `CR4`      | `T4`                  |
| `PROC-009` | Producción de Barra          | `SEMANAL`, martes                       | `V2-V3`          | `CR3`      | `T4`                  |
| `PROC-010` | Alistamiento de la tarde     | `DIARIA`                                | `V4`             | `CR4`      | `T2`                  |
| `PROC-011` | Transporte y recepción       | `DIARIA`                                | `V4`             | `CR4`      | `T3`                  |
| `PROC-012` | Retorno y lavado de canastas | `DIARIA` / `POR_EVENTO`                 | `V3`             | `CR2`      | `T5`                  |
| `PROC-013` | Recepción de proveedor       | `IRREGULAR` / frecuente                 | `VN`             | `CR4`      | `T2`                  |
| `PROC-014` | Retiro de Bodega             | `CONT` / `INTRA`                        | `V5` estimado    | `CR4`      | `T1-T3`               |
| `PROC-015` | Compra a proveedor           | `SEMANAL` + urgencias                   | `V3`             | `CR4`      | `T4-T6`               |
| `PROC-016` | Recepción de fruver          | `NO_MEDIDA`                             | `VN`             | `CR3`      | `T2`                  |
| `PROC-017` | Apertura de Vento Café       | `DIARIA`                                | `V2`             | `CR4`      | `T0`                  |
| `PROC-018` | Atención de mesa Vento Café  | `CONT`                                  | `V5`             | `CR4`      | `T0-T1`               |
| `PROC-019` | Cocina Vento Café            | `CONT`                                  | `V5`             | `CR4`      | `T1-T2`               |
| `PROC-020` | Bar y Barra Vento Café       | `CONT`                                  | `V5`             | `CR4`      | `T1-T2`               |
| `PROC-021` | Pago Vento Café              | `POR_PEDIDO`                            | `V5`             | `CR5`      | `T0-T1`               |
| `PROC-022` | Pedido Rappi                 | `POR_PEDIDO`                            | `VN`             | `CR4`      | `T1-T2`               |
| `PROC-023` | Domicilio directo            | `POR_PEDIDO`                            | `VN`             | `CR4`      | `T1-T3`               |
| `PROC-024` | Atención Saudo               | `CONT`                                  | `V4-V5`          | `CR4`      | `T0-T1`               |
| `PROC-025` | Cocina Saudo                 | `CONT`                                  | `V4`             | `CR4`      | `T1-T2`               |
| `PROC-026` | Atención Molka               | `CONT`                                  | `V3-V4`          | `CR4`      | `T0-T2`               |
| `PROC-027` | Cierre y relevo de Caja      | `POR_TURNO`                             | `V2`             | `CR5`      | `T3`                  |
| `PROC-028` | Entrega de efectivo          | `DIARIA`                                | `V2`             | `CR5`      | `T5`                  |
| `PROC-029` | Registro contable            | `DIARIA` / `SEMANAL`                    | `VN`             | `CR5`      | `T5-T6`               |
| `PROC-030` | Programación de turnos       | `SEMANAL`                               | `V3`             | `CR4`      | `T6`                  |
| `PROC-031` | Consulta y check-in          | `POR_TURNO`                             | `V4`             | `CR4`      | `T0-T1`               |
| `PROC-032` | Revisión de asistencia       | `DIARIA` / periódica                    | `V3`             | `CR3`      | `T5`                  |
| `PROC-033` | Liquidación de propinas      | `NO_MEDIDA`                             | `VN`             | `CR4`      | `T6`                  |
| `PROC-034` | Pago de nómina               | Periódica, frecuencia no confirmada     | `V3`             | `CR5`      | `T0` en fecha de pago |
| `PROC-035` | Reclutamiento                | `POR_EVENTO`                            | `V2`             | `CR3`      | `T7`                  |
| `PROC-036` | Inducción                    | `POR_EVENTO`                            | `V2`             | `CR4`      | `T3-T6`               |
| `PROC-037` | Alta de acceso               | `POR_EVENTO`                            | `V2`             | `CR5`      | `T3-T5`               |
| `PROC-038` | Baja de acceso               | `POR_EVENTO`                            | `V2`             | `CR5`      | `T0`                  |
| `PROC-039` | Marketing                    | `IRREGULAR`                             | `V3`             | `CR2-CR3`  | `TN`                  |
| `PROC-040` | Vaila Vainilla               | `POR_PEDIDO` / por lote de despacho     | `VN`             | `CR4`      | `T3-T5`               |
| `PROC-041` | Soporte tecnológico          | `POR_EVENTO`, reactivo                  | `V3` cualitativo | `CR2-CR5`  | `T0-T5`               |
| `PROC-042` | Mantenimiento                | `POR_EVENTO`, reactivo                  | `V2`             | `CR3-CR5`  | `T0-T7`               |
| `PROC-043` | Merma                        | `POR_EVENTO`                            | `VN`             | `CR4`      | `T2-T5`               |
| `PROC-044` | Reasignación a Molka         | `POR_EVENTO`                            | `V1-V2`          | `CR3`      | `T3-T5`               |
| `PROC-045` | Servicios Generales          | `DIARIA` / `CONT`                       | `V4`             | `CR3-CR4`  | `T2-T5`               |

Las bandas `V`, `CR` y `T` representan una primera clasificación AS-IS y deberán recalibrarse con observación real.

---

#### 11. Remisiones y abastecimiento interno

##### 11.1. Frecuencia

La solicitud de remisión tiene comportamiento predominantemente diario.

Se prepara:

- al final del turno;
- excepcionalmente en la mañana siguiente.

La recepción tardía reduce el tiempo disponible para:

- consolidar;
- producir;
- alistar;
- transportar.

##### 11.2. Volumen

El volumen mínimo conocido por ciclo completo es de cinco solicitudes diferenciadas.

No se conoce todavía:

- número promedio de líneas por solicitud;
- número de productos únicos;
- unidades solicitadas;
- frecuencia de repetición;
- número de correcciones;
- porcentaje de solicitudes tardías;
- porcentaje de faltantes.

##### 11.3. Criticidad

`CR4 — CRÍTICA`.

Una solicitud ausente o tardía puede afectar:

- producción;
- abastecimiento;
- ventas;
- disponibilidad de producto;
- carga del conductor;
- compras urgentes.

##### 11.4. Ventana crítica

La ventana más sensible es:

```text
CIERRE DE LA SEDE
→ ENVÍO DE SOLICITUD
→ PREPARACIÓN O PRODUCCIÓN ANTES DEL DESPACHO
```

No existe hora de corte formal confirmada.

##### 11.5. Métricas futuras mínimas

- solicitudes esperadas por día;
- solicitudes recibidas;
- hora de envío;
- líneas por solicitud;
- correcciones;
- faltantes;
- cumplimiento total;
- tiempo hasta confirmación;
- tiempo hasta recepción.

---

#### 12. Producción central

##### 12.1. Panadería y Bollería

**Frecuencia:** diaria, con ciclos que pueden comenzar varios días antes.

**Restricción temporal:**

- fermentación;
- reposo;
- horneado;
- disponibilidad de horno;
- anticipación.

**Criticidad:** `CR4`.

Un faltante no siempre puede recuperarse el mismo día.

**Estacionalidad conocida:** no cuantificada.

Debe medirse:

- lotes diarios;
- unidades por referencia;
- horas de fermentación;
- capacidad de horno;
- utilización;
- reproceso;
- cumplimiento por sede.

##### 12.2. Repostería

**Frecuencia:** diaria según remisiones.

**Volumen:** `V3` inicial.

**Criticidad:** `CR3`.

Debe medirse:

- referencias por día;
- unidades;
- personas asignadas;
- tiempo por familia;
- cumplimiento;
- productos dejados sin identificación.

##### 12.3. Pastelería y Tortas

**Frecuencia:** por remisión o necesidad.

**Dependencia:** una ejecutora habitual.

**Criticidad:** `CR3`, con riesgo de capacidad por persona única.

Debe medirse:

- tortas diarias;
- tiempo estándar;
- carga por ejecutora;
- anticipación requerida;
- fallos;
- demanda por sede.

##### 12.4. Galletería

Datos aproximados:

- una o dos recetas;
- aproximadamente 104 galletas;
- cobertura cercana a una semana.

Este es uno de los pocos procesos con una relación inicial entre lote y duración de stock.

Debe validarse:

- cantidad por receta;
- merma;
- consumo por sede;
- punto de reposición;
- duración real.

##### 12.5. Cocina Caliente

**Frecuencia:** producción planificada semanalmente.

**Consumo:** retiro diario o según remisión.

**Criticidad:** `CR4`.

Debe medirse:

- presentaciones producidas;
- inventario inicial y final;
- días de cobertura;
- tiempo de reposición;
- productos críticos;
- frecuencia de stock insuficiente.

##### 12.6. Producción de Barra

**Frecuencia confirmada:** semanal, los martes.

**Volumen:** cantidad estandarizada, no medida.

**Criticidad:** `CR3`.

Debe medirse:

- referencias;
- porciones;
- tiempo;
- consumo semanal;
- sobrantes;
- faltantes antes del siguiente martes.

---

#### 13. Alistamiento y logística

##### 13.1. Alistamiento de la tarde

Duración aproximada confirmada:

- entre 1,5 y 2 horas.

Inicio aproximado:

- conductor regresa cerca de las 17:00.

El trabajo incluye:

- recoger producción;
- completar Bodega;
- completar Cocina Caliente;
- separar destinos;
- cargar.

**Criticidad:** `CR4`.

**Cuello de botella:** una persona concentra múltiples actividades.

##### 13.2. Transporte

La frecuencia es diaria, pero no se conocen:

- número de recorridos;
- kilómetros;
- duración por ruta;
- orden de sedes;
- tiempo de descarga;
- retrasos;
- capacidad del vehículo;
- ocupación.

##### 13.3. Recepción

La recepción ocurre en cada entrega.

No se conocen:

- minutos por sede;
- líneas contadas;
- diferencias;
- tiempo para refrigerar;
- porcentaje de recepción parcial;
- productos dejados temporalmente fuera de almacenamiento.

##### 13.4. Canastas

El retorno es recurrente.

No existe conteo de:

- canastas por sede;
- canastas en tránsito;
- canastas sucias;
- canastas lavadas;
- canastas perdidas;
- tiempo de ciclo;
- utilización.

---

#### 14. Bodega e inventario

##### 14.1. Retiros

Los retiros ocurren varias veces durante la jornada y pueden ser continuos.

**Volumen estimado:** `V5`.

**Criticidad:** `CR4`.

La ausencia de registro significa que el volumen real es desconocido.

##### 14.2. Recepciones

Las recepciones de proveedor son irregulares y dependen de programación externa.

No existe conteo confirmado de:

- proveedores por día;
- líneas;
- unidades;
- duración;
- diferencias;
- rechazos.

##### 14.3. Conteo físico

No existe periodicidad estable confirmada después del piloto inicial.

##### 14.4. Métricas prioritarias

- retiros por hora;
- productos por retiro;
- actor;
- área;
- entradas;
- movimientos;
- ajustes;
- exactitud;
- diferencias;
- duración del conteo;
- productos sin ubicación;
- movimientos fuera de horario.

---

#### 15. Compras

##### 15.1. Frecuencia

Las compras principales presentan comportamiento semanal.

Existen compras urgentes por:

- faltantes;
- inventario desconocido;
- cambios de consumo;
- proveedor;
- producción.

##### 15.2. Volumen

No se conoce:

- número de órdenes;
- líneas;
- proveedores;
- monto;
- compras urgentes;
- entregas parciales.

##### 15.3. Criticidad

`CR4`.

Una compra tardía puede detener producción y abastecimiento.

##### 15.4. Tiempo

Debe medirse:

```text
NECESIDAD DETECTADA
→ PEDIDO ENVIADO
→ CONFIRMACIÓN
→ ENTREGA
→ RECEPCIÓN
```

##### 15.5. Estacionalidad

No existe estacionalidad cuantificada.

Es razonable esperar variaciones comerciales, pero no se registrarán como hecho hasta `OPS-AUD-015`.

---

#### 16. Ventas y servicio

##### 16.1. Vento Café

Los procesos de:

- toma de pedido;
- preparación;
- servicio;
- pago;

ocurren continuamente durante la apertura.

**Volumen:** `V5`.

**Criticidad:** `CR4-CR5`.

No se conocen:

- ventas por hora;
- mesas;
- tiempo de espera;
- tiempo de Cocina;
- tiempo de Barra;
- tiempo de pago;
- pedidos por mesero;
- capacidad de asientos;
- ocupación.

##### 16.2. Saudo

**Volumen:** `V4-V5`.

Cuello de botella confirmado:

- dos hornos napolitanos.

Debe medirse:

- pizzas por hora;
- tiempo por pizza;
- ocupación de horno;
- cola;
- pedidos simultáneos;
- tiempo hasta entrega.

##### 16.3. Molka

**Volumen:** `V3-V4`.

Cuello de botella conocido:

- acumulación de clientes;
- bebidas calientes;
- personal polivalente.

Debe medirse:

- pedidos por hora;
- tiempo de cobro;
- tiempo de preparación;
- personas activas;
- cola máxima;
- porcentaje de entrega en mesa.

##### 16.4. Estacionalidad comercial

No está cuantificada.

Deberán distinguirse posteriormente:

- día de semana;
- hora;
- quincena;
- fin de mes;
- festivos;
- vacaciones;
- temporadas;
- campañas;
- clima;
- eventos.

---

#### 17. Rappi, ManyChat y domicilios

##### 17.1. Frecuencia

`POR_PEDIDO`, sin volumen confirmado.

##### 17.2. Trabajo adicional

Cada pedido requiere transcripción manual.

Debe medirse:

- pedidos por canal;
- tiempo de transcripción;
- errores;
- cancelaciones;
- tiempo de mensajería;
- entregas fallidas;
- conciliación de pagos.

##### 17.3. Criticidad

`CR4`.

La demora afecta:

- promesa al cliente;
- temperatura;
- calidad;
- reputación;
- carga de Caja.

##### 17.4. Ventana

La sensibilidad es intraturno.

No existe seguimiento rutinario después de que sale el pedido.

---

#### 18. Caja, efectivo y Contabilidad

##### 18.1. Apertura y cierre

Vento Café realiza dos cierres diarios.

Saudo y Molka operan normalmente con un cierre diario, pendiente de confirmación formal.

##### 18.2. Pago

El pago es un evento de sensibilidad inmediata.

**Criticidad:** `CR5`.

Debe medirse:

- pagos por medio;
- tiempo;
- reversos;
- diferencias;
- mesas cerradas tarde;
- pagos comunicados verbalmente;
- fallos de datáfono.

##### 18.3. Entrega de efectivo

Ocurre diariamente para el excedente del día anterior.

Debe medirse:

- valor;
- hora;
- responsable;
- diferencia;
- retiros;
- gastos;
- tiempo hasta registro contable.

##### 18.4. Registro contable

No existe tiempo medido entre:

- compra o pago;
- recepción del soporte;
- entrega;
- carga;
- conciliación.

**Criticidad:** `CR5`.

---

#### 19. Turnos, asistencia, propinas y nómina

##### 19.1. Programación

Frecuencia: semanal.

Debe medirse:

- trabajadores;
- turnos;
- cambios;
- reemplazos;
- horas;
- sedes;
- errores;
- tiempo de elaboración.

##### 19.2. Check-in

Frecuencia: por trabajador y turno.

Debe medirse:

- check-ins esperados;
- realizados;
- tardíos;
- ausentes;
- corregidos;
- fallidos;
- duración del proceso.

##### 19.3. Propinas

Frecuencia y período de liquidación no confirmados.

Debe medirse:

- valor total;
- trabajadores;
- ajustes;
- descuentos;
- tiempo de cálculo;
- tiempo de entrega;
- reclamos.

##### 19.4. Nómina

La frecuencia de pago no se documentará sin confirmación.

**Criticidad:** `CR5` en la fecha de pago.

Debe medirse:

- empleados;
- novedades;
- correcciones;
- archivo rechazado;
- tiempo de preparación;
- aprobación;
- pago fallido.

---

#### 20. Contratación, inducción y accesos

##### 20.1. Contratación

Frecuencia: por vacante.

Volumen actual no medido.

Debe medirse:

- vacantes;
- hojas de vida;
- entrevistas;
- pruebas;
- tiempo de cobertura;
- candidatos rechazados;
- rotación.

##### 20.2. Inducción

Frecuencia: por ingreso.

**Criticidad:** `CR4`.

Debe medirse:

- horas de acompañamiento;
- responsable;
- capacidades;
- errores iniciales;
- tiempo hasta autonomía.

##### 20.3. Altas y bajas

Frecuencia: por evento.

**Baja de acceso:** `CR5`, `T0`.

Debe medirse:

- tiempo desde contratación hasta acceso;
- tiempo desde retiro hasta revocación;
- cuentas activas sin empleado;
- cambios internos;
- errores de permisos.

---

#### 21. Marketing

##### 21.1. Frecuencia

Irregular y reactiva.

##### 21.2. Volumen

No existe calendario ni conteo confirmado.

Debe medirse:

- solicitudes;
- piezas;
- historias;
- publicaciones;
- revisiones;
- tiempo de producción;
- rechazos;
- fecha solicitada frente a publicación.

##### 21.3. Criticidad

Generalmente `CR2-CR3`.

Puede aumentar en:

- lanzamiento;
- evento;
- promoción;
- crisis;
- publicación errónea.

##### 21.4. Estacionalidad

Probablemente vinculada a campañas y fechas comerciales, pero no está documentada.

---

#### 22. Vaila Vainilla

##### 22.1. Frecuencia

Por pedido, con acumulación por lotes antes de la recolección.

##### 22.2. Volumen

No medido.

Debe medirse:

- pedidos;
- unidades;
- tiempo hasta empaque;
- pedidos por lote;
- frecuencia de mensajería;
- entregas;
- devoluciones;
- cancelaciones;
- stock.

##### 22.3. Criticidad

`CR4`.

La falta de guía, seguimiento e inventario puede afectar cliente y dinero.

##### 22.4. Estacionalidad

No confirmada.

---

#### 23. Soporte tecnológico

##### 23.1. Frecuencia

Reactiva, por evento.

Se considera cualitativamente recurrente porque interrumpe el desarrollo.

No existe conteo histórico.

##### 23.2. Criticidad variable

| Tipo de incidente                | Criticidad probable |
| -------------------------------- | ------------------- |
| Impresora de comandas o Caja     | `CR4`               |
| Red o internet operativo         | `CR4-CR5`           |
| Equipo administrativo secundario | `CR2-CR3`           |
| Cámara                           | `CR2-CR4`           |
| Sonido                           | `CR2-CR3`           |
| Aplicación central               | `CR4-CR5`           |
| Dispositivo de check-in o acceso | `CR3-CR5`           |

##### 23.3. Tiempos

No se registran:

- apertura;
- diagnóstico;
- espera;
- intervención;
- resolución;
- recurrencia.

##### 23.4. Impacto

Cada incidente puede desplazar trabajo de desarrollo.

Debe medirse:

- incidentes por sede;
- horas;
- activo;
- causa;
- reincidencia;
- tiempo perdido de desarrollo.

---

#### 24. Mantenimiento

##### 24.1. Frecuencia

Correctiva y por evento.

No existe plan preventivo confirmado.

##### 24.2. Criticidad

Varía entre `CR3` y `CR5`.

Depende de:

- activo;
- impacto;
- alternativa;
- repuesto;
- técnico.

##### 24.3. Tiempos críticos

```text
FALLA
→ REPORTE
→ CONTACTO
→ VISITA
→ DIAGNÓSTICO
→ REPUESTO
→ REPARACIÓN
```

Los principales retrasos conocidos son:

- técnico no disponible;
- repuesto difícil de conseguir.

##### 24.4. Métricas

- fallas por activo;
- tiempo fuera de servicio;
- espera de técnico;
- espera de repuesto;
- costo;
- repetición;
- pérdida operativa.

---

#### 25. Mermas y reasignaciones

##### 25.1. Frecuencia

No medida.

##### 25.2. Volumen

No medido por:

- producto;
- sede;
- causa;
- cantidad;
- costo.

##### 25.3. Criticidad

`CR4`.

Afecta:

- seguridad alimentaria;
- inventario;
- costo;
- calidad;
- responsabilidad.

##### 25.4. Tiempo

La decisión es inmediata cuando se detecta deterioro.

El registro se realiza manualmente.

##### 25.5. Estacionalidad

No confirmada.

Puede depender de demanda, temperatura y rotación, pero no se asumirá sin evidencia.

---

#### 26. Servicios Generales

##### 26.1. Frecuencia

Diaria y continua.

##### 26.2. Volumen

`V4` cualitativo.

Incluye:

- rutina;
- instrucciones;
- necesidades observadas;
- canastas;
- zonas comunes;
- apoyos.

##### 26.3. Criticidad

`CR3-CR4`.

Aumenta cuando afecta:

- inocuidad;
- producción;
- atención al cliente;
- apertura;
- equipos;
- canastas.

##### 26.4. Tiempo

No existe checklist ni duración estándar.

---

#### 27. Estacionalidad: estado actual

No existe una medición empresarial consolidada de estacionalidad.

Se deben distinguir cinco tipos futuros:

| Tipo       | Ejemplo                           |
| ---------- | --------------------------------- |
| Intradía   | apertura, almuerzo, tarde, cierre |
| Semanal    | lunes frente a fin de semana      |
| Mensual    | quincena, fin de mes              |
| Calendario | festivos, vacaciones, Navidad     |
| Comercial  | campañas, lanzamientos, eventos   |

Información confirmada actualmente:

- Producción de Barra tiene estacionalidad semanal: martes.
- Galletería opera por ciclos aproximados de una semana.
- Compras principales tienen comportamiento semanal.
- Programación de turnos tiene comportamiento semanal.
- La demanda comercial cambia, pero no se han cuantificado patrones.
- Soporte y mantenimiento no son estacionales; son reactivos.

No se deberán crear pronósticos hasta contar con datos.

---

#### 28. Procesos de mayor criticidad inicial

##### 28.1. `CR5 — SEVERA`

- pago y cierre;
- efectivo y Contabilidad;
- nómina;
- baja de accesos;
- incidentes tecnológicos que detienen operación;
- riesgos sanitarios de merma o producto no apto.

##### 28.2. `CR4 — CRÍTICA`

- remisiones;
- producción;
- alistamiento;
- transporte;
- recepción;
- Bodega;
- compras;
- ventas;
- Cocina;
- Barra;
- turnos;
- check-in;
- Vaila Vainilla;
- inducción.

##### 28.3. `CR3 — ALTA`

- Marketing permanente;
- limpieza no sanitaria;
- mantenimiento con alternativa;
- Repostería y Tortas según producto;
- reasignaciones.

Estas clasificaciones deberán validarse con impacto real y no solo con percepción.

---

#### 29. Picos operativos conocidos o previsibles

| Pico                            | Evidencia actual                                |
| ------------------------------- | ----------------------------------------------- |
| Inicio de jornada del conductor | Confirmado aproximadamente a las 05:30          |
| Cierre de solicitudes           | Confirmado al final del turno, sin hora fija    |
| Retorno del conductor           | Aproximadamente a las 17:00                     |
| Alistamiento y carga            | 1,5 a 2 horas                                   |
| Apertura y cierre de Caja       | Por turno                                       |
| Producción de Barra             | Martes                                          |
| Preparación de Panadería        | Condicionada por fermentación y ciclos multiday |
| Demanda de restaurantes         | Existe variación, no cuantificada               |
| Incidentes tecnológicos         | Reactivos y capaces de interrumpir desarrollo   |

---

#### 30. Vacíos de medición prioritarios

1. líneas por remisión;
2. cumplimiento de remisiones;
3. faltantes y sobrantes;
4. producción por referencia;
5. tiempo por lote;
6. capacidad por estación;
7. carga del conductor;
8. tiempo por ruta;
9. diferencias de recepción;
10. retiros de Bodega;
11. exactitud de inventario;
12. compras urgentes;
13. entregas de proveedores;
14. ventas por hora;
15. tiempos de Cocina y Barra;
16. capacidad de hornos;
17. domicilios por canal;
18. errores de transcripción;
19. diferencias de Caja;
20. tiempo de registro contable;
21. cambios de turno;
22. check-ins fallidos;
23. liquidación de propinas;
24. altas y bajas de acceso;
25. producción de Marketing;
26. pedidos Vaila Vainilla;
27. incidentes técnicos;
28. tiempo fuera de servicio;
29. mermas;
30. ciclo de canastas.

Todos deberán convertirse en métricas concretas durante el diseño TO-BE o los pilotos correspondientes.

---

#### 31. Instrumentación futura mínima

Esta sección no autoriza implementación. Define qué deberá poder medirse después.

##### 31.1. Para todo proceso

- `started_at`;
- `completed_at`;
- `actor_id`;
- `site_id`;
- `area_id`;
- `status`;
- `outcome`;
- `exception_code`;
- `source_channel`.

##### 31.2. Para cantidades

- solicitado;
- confirmado;
- producido;
- cargado;
- recibido;
- aceptado;
- rechazado;
- pendiente;
- desperdiciado.

##### 31.3. Para colas

- entrada;
- inicio;
- espera;
- ejecución;
- cierre;
- reintento;
- cancelación.

##### 31.4. Para criticidad

- impacto;
- urgencia;
- sede afectada;
- capacidad afectada;
- personas afectadas;
- valor comprometido;
- riesgo sanitario o de seguridad.

La estructura definitiva corresponde a E2, E3 y E4.

---

#### 32. Reglas para no convertir estimaciones en hechos

1. Una clasificación `V4` no significa que exista una cifra exacta.
2. Una duración aproximada no debe tratarse como estándar contractual.
3. Una frecuencia semanal no implica un día fijo, salvo confirmación.
4. La ausencia de datos no implica baja frecuencia.
5. La baja frecuencia no implica baja criticidad.
6. La frecuencia observada no define la frecuencia TO-BE.
7. Los picos percibidos deberán contrastarse con datos.
8. La estacionalidad no deberá inferirse únicamente por experiencia.
9. Las métricas futuras deberán conservar contexto de sede, área, producto y canal.
10. Toda métrica deberá tener un propietario y una decisión asociada.

---

#### 33. Validaciones pendientes para `OPS-AUD-015`

| Tema           | Validación                                 |
| -------------- | ------------------------------------------ |
| Remisiones     | Días, hora de corte, líneas y correcciones |
| Producción     | Volumen por área y tiempos                 |
| Conductor      | Rutas, frecuencia y duración               |
| Proveedores    | Entregas por día y duración                |
| Fruver         | Frecuencia y volumen                       |
| Bodega         | Retiros diarios                            |
| Vento Café     | Ventas, mesas y tiempos                    |
| Saudo          | Capacidad real de hornos y picos           |
| Molka          | Pedidos y tiempo de bebidas                |
| Rappi/ManyChat | Pedidos por canal                          |
| Caja           | Cierres de Saudo y Molka                   |
| Contabilidad   | Tiempo de carga y conciliación             |
| Turnos         | Ciclo de publicación y cambios             |
| Propinas       | Periodicidad                               |
| Nómina         | Frecuencia y responsables                  |
| Marketing      | Volumen de piezas                          |
| Vaila Vainilla | Lotes y frecuencia de mensajería           |
| Soporte        | Incidentes y horas                         |
| Mantenimiento  | Fallas y tiempos                           |
| Mermas         | Frecuencia y costo                         |
| Canastas       | Cantidades y ciclo                         |

---

#### 34. Matriz de destino de hallazgos

| Hallazgo                                    | Tarea exacta                      |
| ------------------------------------------- | --------------------------------- |
| Dependencias que explican tiempos y picos   | `OPS-AUD-011`                     |
| Conciliaciones que consumen tiempo          | `OPS-AUD-012`                     |
| Falta de datos y pérdida de medición        | `OPS-AUD-013`                     |
| Tiempos ante caídas y contingencias         | `OPS-AUD-014`                     |
| Confirmación de cifras y períodos           | `OPS-AUD-015`                     |
| Mapa de capacidades críticas                | `CAP-MAP-001` a `CAP-MAP-015`     |
| Brechas de cobertura                        | `CAP-COVER-001` a `CAP-COVER-012` |
| Consolidación de brechas                    | `GAP-CTRL-001`                    |
| Vinculación a paquetes                      | `GAP-CTRL-006`                    |
| Definición de SLA, estados y métricas TO-BE | BLOQUE E2                         |
| Modelo de eventos y métricas                | BLOQUE E3                         |
| Colas, observabilidad y alertas             | BLOQUE E4                         |
| Pilotos y criterios de aceptación           | BLOQUE E5                         |

---

#### 35. Decisiones propuestas

1. La tarea distingue datos medidos, confirmados, aproximados, cualitativos y no medidos.
2. No se inventan cifras para completar la matriz.
3. Las remisiones tienen comportamiento predominantemente diario.
4. Existe un mínimo estructural conocido de cinco solicitudes diferenciadas por ciclo completo.
5. El conductor inicia aproximadamente a las 05:30.
6. El alistamiento de la tarde comienza cerca de las 17:00 y toma entre 1,5 y 2 horas.
7. Vento Café realiza dos cierres de Caja diarios.
8. Producción de Barra ocurre semanalmente los martes.
9. Galletería produce aproximadamente 104 unidades por una o dos recetas y suele cubrir cerca de una semana.
10. Panadería depende de ciclos de varios días.
11. Las compras principales tienen comportamiento semanal, con urgencias adicionales.
12. Los retiros de Bodega son frecuentes, pero no están medidos.
13. Ventas y preparación son procesos continuos de alto volumen relativo.
14. Los pagos, efectivo, nómina, accesos y riesgos sanitarios tienen criticidad severa.
15. Las bajas de acceso requieren respuesta inmediata.
16. Soporte y mantenimiento son reactivos.
17. No existe medición consolidada de estacionalidad.
18. No se establecerán SLA, dotación, capacidad o stock objetivo en esta tarea.
19. La instrumentación futura deberá medir inicio, espera, ejecución, cierre, resultado y excepción.
20. Ninguna decisión autoriza código, tablas, métricas físicas, alertas, integraciones, migraciones o cambios en Supabase.

---

#### 36. Criterios de aceptación

`OPS-AUD-010` podrá aprobarse cuando se confirme que:

- existe una escala explícita de evidencia;
- se documentan frecuencia, volumen, criticidad y sensibilidad temporal;
- los tiempos conocidos se presentan como confirmados o aproximados;
- no se inventan cifras;
- se identifican ventanas y picos;
- se clasifican procesos críticos;
- se registran vacíos de medición;
- se describe el estado de estacionalidad;
- se define qué deberá medirse posteriormente;
- cada incertidumbre queda vinculada a `OPS-AUD-015`;
- cada brecha tiene destino exacto;
- no se han definido SLA ni capacidad objetivo;
- no se ha diseñado el TO-BE;
- no se ha autorizado implementación.

---

#### 37. Resultado y continuidad

Con la aprobación de `OPS-AUD-010` quedará establecida la línea base inicial de:

- frecuencias;
- volúmenes cualitativos;
- tiempos confirmados;
- ventanas críticas;
- sensibilidad temporal;
- criticidad;
- cuellos de botella;
- picos;
- estacionalidad conocida;
- métricas ausentes;
- necesidades de instrumentación.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-011
— Identificar dependencias entre áreas, sedes, aplicaciones y terceros
```

`OPS-AUD-011` deberá utilizar esta línea base para explicar qué procesos dependen de otros actores, capacidades, herramientas, horarios, instalaciones o terceros, y cómo una falla se propaga por la operación.
