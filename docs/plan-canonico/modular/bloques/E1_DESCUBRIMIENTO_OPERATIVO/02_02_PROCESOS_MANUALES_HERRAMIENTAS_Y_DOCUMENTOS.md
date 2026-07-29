### MINI-BLOQUE — PROCESOS MANUALES HERRAMIENTAS Y DOCUMENTOS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **procesos manuales herramientas y documentos** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `OPS-AUD-004` a `OPS-AUD-006` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `OPS-AUD-004`: Inventariar procesos ejecutados en papel
- `OPS-AUD-005`: Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas
- `OPS-AUD-006`: Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes
<!-- PLAN-SECTION-META:END -->

### ✅ OPS-AUD-004 — Inventariar procesos ejecutados en papel

**Estado:** APROBADO 
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de procesos soportados total o parcialmente en papel  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** información operativa consolidada en `OPS-AUD-001` a `OPS-AUD-003`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando la evidencia no sea suficiente

---

#### 1. Propósito

Inventariar los procesos actuales de Vento Group que utilizan papel como:

- fuente primaria de información;
- soporte operativo;
- evidencia de una transacción;
- medio de entrega entre áreas;
- respaldo temporal;
- comprobante para clientes, proveedores, Gerencia o Contabilidad.

Esta tarea no diseña el proceso objetivo ni concluye que el papel deba conservarse.

```text
PAPEL ACTUAL
→ evidencia del proceso AS-IS

PAPEL ACTUAL
≠ requisito obligatorio del sistema TO-BE
```

El inventario deberá permitir identificar posteriormente:

- qué información nace en papel;
- qué información se imprime desde un sistema;
- qué soporte se firma o entrega;
- quién conserva el documento;
- qué efecto operativo depende de ese papel;
- dónde existe doble digitación;
- dónde se pierde trazabilidad;
- qué soporte deberá digitalizarse, reemplazarse o conservarse por obligación.

---

#### 2. Alcance

Incluye:

- cierres impresos;
- facturas físicas;
- comprobantes entregados al cliente;
- resúmenes de cuenta;
- hojas manuales de merma;
- remisiones físicas utilizadas como apoyo o respaldo;
- soportes físicos de pagos y reparaciones;
- documentos trasladados entre sedes, Gerencia y Contabilidad;
- cualquier proceso cuyo avance dependa de recibir, firmar, revisar o archivar un documento físico.

No incluye todavía:

- WhatsApp, correo, Excel, Shopify, Makos, Rappi, ManyChat u otras herramientas digitales, salvo cuando producen una impresión física;
- diseño detallado de formularios;
- estructura definitiva de campos;
- flujo completo paso a paso;
- excepciones, correcciones o anulaciones;
- reglas de aprobación;
- medición de volumen;
- arquitectura documental;
- digitalización;
- implementación.

Destinos documentales:

| Tema                                               | Tarea propietaria |
| -------------------------------------------------- | ----------------- |
| Herramientas digitales y canales                   | `OPS-AUD-005`     |
| Inventario detallado de formularios y comprobantes | `OPS-AUD-006`     |
| Flujo ordinario                                    | `OPS-AUD-007`     |
| Excepciones y reversión                            | `OPS-AUD-008`     |
| Aprobaciones y controles                           | `OPS-AUD-009`     |
| Frecuencia, volumen y tiempos                      | `OPS-AUD-010`     |
| Dependencias                                       | `OPS-AUD-011`     |
| Doble digitación y conciliación                    | `OPS-AUD-012`     |
| Pérdida de trazabilidad                            | `OPS-AUD-013`     |
| Contingencias                                      | `OPS-AUD-014`     |
| Confirmación con responsables                      | `OPS-AUD-015`     |

---

#### 3. Criterios de clasificación

##### 3.1. Tipo de uso del papel

| Código         | Tipo                 | Definición                                                            |
| -------------- | -------------------- | --------------------------------------------------------------------- |
| `ORIGEN`       | Fuente primaria      | La información se registra inicialmente en papel                      |
| `SALIDA`       | Impresión de sistema | El documento se genera desde una aplicación                           |
| `SOPORTE`      | Evidencia            | Respalda una compra, pago, recepción o movimiento                     |
| `TRASPASO`     | Entrega física       | Transporta información entre personas o áreas                         |
| `CONTROL`      | Revisión manual      | Permite comparar, contar, firmar o conciliar                          |
| `ARCHIVO`      | Conservación         | Se almacena como evidencia histórica                                  |
| `CONTINGENCIA` | Respaldo temporal    | Se usa cuando el proceso digital no está disponible o no es confiable |

##### 3.2. Estado de evidencia

| Estado               | Significado                                                                      |
| -------------------- | -------------------------------------------------------------------------------- |
| `CONFIRMADO`         | Descrito directamente y con uso actual conocido                                  |
| `CONFIRMADO_PARCIAL` | Existe evidencia suficiente, pero falta precisar custodia, frecuencia o vigencia |
| `PROBABLE`           | El soporte suele existir, pero no fue confirmado de forma directa                |
| `TRANSITORIO`        | Se utiliza durante una implementación o período de coexistencia                  |
| `POR_VALIDAR`        | Debe ser confirmado en `OPS-AUD-015`                                             |

---

#### 4. Inventario consolidado de procesos ejecutados o soportados en papel

| Código   | Proceso                                       | Sede o área                     | Documento o soporte físico                                             | Uso                                         | Estado               |
| -------- | --------------------------------------------- | ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------- | -------------------- |
| `PAP-01` | Cierre diario de caja                         | Vento Café, Saudo y Molka       | Cierre impreso de Makos                                                | `SALIDA`, `CONTROL`, `TRASPASO`, `ARCHIVO`  | `CONFIRMADO`         |
| `PAP-02` | Entrega de efectivo a Gerencia                | Sedes → Gerencia General        | Cierre impreso entregado junto con el excedente de caja                | `CONTROL`, `TRASPASO`, `SOPORTE`            | `CONFIRMADO`         |
| `PAP-03` | Recepción de proveedores                      | Centro de Producción            | Factura física o documento entregado por el proveedor                  | `SOPORTE`, `CONTROL`, `TRASPASO`, `ARCHIVO` | `CONFIRMADO`         |
| `PAP-04` | Firma de recepción                            | Centro de Producción            | Factura o copia firmada por quien recibe                               | `CONTROL`, `SOPORTE`                        | `CONFIRMADO`         |
| `PAP-05` | Entrega documental a Gerencia                 | Centro de Producción → Gerencia | Factura física conservada y transportada                               | `TRASPASO`, `ARCHIVO`                       | `CONFIRMADO`         |
| `PAP-06` | Soporte de pagos realizados en efectivo       | Gerencia / Contabilidad         | Factura o comprobante físico del gasto                                 | `SOPORTE`, `CONTROL`, `ARCHIVO`             | `CONFIRMADO`         |
| `PAP-07` | Registro de mermas                            | Sedes y áreas operativas        | Hoja manual de mermas                                                  | `ORIGEN`, `CONTROL`, `ARCHIVO`              | `CONFIRMADO`         |
| `PAP-08` | Resumen de cuenta para cliente                | Vento Café y Saudo              | Resumen no fiscal impreso desde Makos                                  | `SALIDA`, `TRASPASO`                        | `CONFIRMADO`         |
| `PAP-09` | Factura legal de venta                        | Vento Café, Saudo y Molka       | Factura impresa entregada al cliente                                   | `SALIDA`, `SOPORTE`, `TRASPASO`             | `CONFIRMADO`         |
| `PAP-10` | Comandas de cocina                            | Vento Café                      | Comanda impresa desde Makos                                            | `SALIDA`, `TRASPASO`, `CONTROL`             | `CONFIRMADO`         |
| `PAP-11` | Comandas de Bar y Barra                       | Vento Café                      | Comandas impresas y separadas por estación                             | `SALIDA`, `TRASPASO`, `CONTROL`             | `CONFIRMADO`         |
| `PAP-12` | Comandas disponibles pero no utilizadas       | Saudo                           | Impresora existente, sin uso ordinario actual                          | `SALIDA` potencial                          | `CONFIRMADO`         |
| `PAP-13` | Remisión física paralela durante transición   | Producción, logística y sedes   | Hoja física de remisión utilizada junto con el sistema durante pruebas | `CONTINGENCIA`, `CONTROL`, `TRASPASO`       | `TRANSITORIO`        |
| `PAP-14` | Soporte de reparaciones y mantenimiento       | Gerencia General                | Factura o comprobante del técnico                                      | `SOPORTE`, `ARCHIVO`                        | `PROBABLE`           |
| `PAP-15` | Hojas de vida o documentos laborales impresos | Gerencia General                | Documentos físicos asociados a selección o contratación                | `SOPORTE`, `ARCHIVO`                        | `POR_VALIDAR`        |
| `PAP-16` | Etiquetas o marcaciones físicas existentes    | Centro de Producción y Bodega   | Rótulos de productos, estantes o ubicaciones                           | `CONTROL`, `TRASPASO` de información visual | `CONFIRMADO_PARCIAL` |

---

#### 5. Procesos confirmados

##### 5.1. Cierre diario y entrega de efectivo

Cada sede conserva una base de caja y entrega a la gerente general el excedente del día anterior.

El traspaso incluye:

```text
EFECTIVO
+
CIERRE IMPRESO DE MAKOS
        ↓
REVISIÓN Y CONTEO POR GERENCIA GENERAL
```

La gerente general:

- recibe el dinero;
- cuenta el efectivo;
- compara el valor con el cierre impreso;
- conserva o administra los recursos según las necesidades del grupo.

Hallazgos:

- el documento impreso funciona como soporte de conciliación;
- la entrega física no cuenta con una trazabilidad digital integral confirmada;
- algunos retiros se registran erróneamente como gasto cuando realmente representan transferencia de custodia;
- el detalle de diferencias, firma, responsable y conservación deberá desarrollarse en `OPS-AUD-006`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.2. Recepción de proveedores y facturas

Cuando el Jefe de Operaciones recibe mercancía en el Centro de Producción:

1. revisa visualmente los productos;
2. organiza o dirige su ubicación;
3. contrasta lo recibido con la factura;
4. firma el documento;
5. entrega una copia al proveedor cuando corresponde;
6. conserva la otra copia;
7. la factura física llega posteriormente a Gerencia.

El soporte físico cumple simultáneamente funciones de:

- verificación;
- aceptación;
- evidencia de recepción;
- traspaso entre Centro de Producción y Gerencia;
- soporte contable.

Brechas vinculadas:

- recepción realizada por otras personas sin procedimiento confirmado: `OPS-AUD-009` y `OPS-AUD-015`;
- ruta y custodia del documento: `OPS-AUD-011` y `OPS-AUD-013`;
- comparación detallada contra pedido y diferencias: `OPS-AUD-007` y `OPS-AUD-008`;
- posible digitación posterior al sistema contable: `OPS-AUD-012`.

##### 5.3. Soportes de pagos y gastos

Los pagos efectuados con efectivo administrado por Gerencia deberían estar respaldados por factura.

Las facturas deben llegar al sistema contable, pero el proceso actual combina:

```text
PAGO FÍSICO
→ FACTURA O COMPROBANTE
→ ENTREGA O CUSTODIA MANUAL
→ CARGA POSTERIOR AL SISTEMA CONTABLE
```

La ausencia de una factura se detecta posteriormente durante conciliación.

El papel es actualmente evidencia necesaria, pero no garantiza por sí solo:

- vinculación con el retiro de efectivo;
- identificación de quien realizó el pago;
- relación con sede, área o centro de costo;
- fecha de entrega a Contabilidad;
- estado de carga al sistema;
- detección inmediata de soportes faltantes.

Estos puntos corresponden a `OPS-AUD-006`, `OPS-AUD-009`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.4. Hoja manual de mermas

Cuando un trabajador identifica un producto dañado:

- evalúa olor, sabor, moho o defecto físico;
- decide desecharlo;
- realiza la disposición;
- registra producto y cantidad en una hoja manual de mermas.

La misma persona puede:

```text
DETECTAR
→ DECIDIR
→ DESECHAR
→ REGISTRAR
```

El papel constituye la fuente primaria del registro.

Riesgos identificados:

- ausencia de segunda validación;
- fecha, lote, causa y responsable no confirmados;
- posible pérdida o deterioro de la hoja;
- digitación posterior no confirmada;
- falta de vínculo con inventario;
- dificultad para consolidar por sede, producto o causa.

Destinos:

- estructura del formato: `OPS-AUD-006`;
- flujo ordinario: `OPS-AUD-007`;
- correcciones o anulaciones: `OPS-AUD-008`;
- segregación de funciones: `OPS-AUD-009`;
- doble digitación: `OPS-AUD-012`;
- trazabilidad: `OPS-AUD-013`.

##### 5.5. Resúmenes de cuenta y facturas al cliente

En Vento Café y Saudo cualquier trabajador autorizado operativamente puede imprimir un resumen no fiscal para el cliente.

Después del pago, Caja cierra la cuenta y genera la factura legal impresa.

```text
RESUMEN
→ INFORMACIÓN PREVIA AL PAGO

FACTURA LEGAL
→ SOPORTE POSTERIOR AL CIERRE
```

El resumen y la factura cumplen propósitos distintos y no deben tratarse como el mismo documento.

El inventario detallado de:

- contenido;
- numeración;
- copias;
- impresora;
- conservación;
- reimpresión;
- anulaciones;
- entrega al cliente;

corresponde a `OPS-AUD-006` y `OPS-AUD-008`.

##### 5.6. Comandas impresas en Vento Café

Makos imprime comandas físicas para:

- Cocina;
- Bar;
- Barra.

Las comandas:

- trasladan el pedido desde el punto de registro hacia la estación;
- permiten ordenar la preparación;
- se colocan en una comandera o cola física;
- se distribuyen por impresora según el producto.

En Cocina, el cocinero más cercano recoge la comanda y la ubica en la comandera.

En Bar y Barra, Makos divide la orden entre dos impresoras según la estación.

El papel es parte directa de la ejecución operativa.

Brechas:

- no existe confirmación digital de recepción, inicio, terminación o entrega;
- una orden puede quedar dividida entre estaciones;
- la pérdida, duplicación o falta de impresión no tiene trazabilidad confirmada;
- el tratamiento de reimpresiones y modificaciones corresponde a `OPS-AUD-008`;
- rutas y colas de impresión deberán diseñarse en BLOQUE E4, sin anticiparse en esta tarea.

##### 5.7. Impresora de comandas no utilizada en Saudo

Saudo cuenta con una impresora, pero el proceso ordinario no utiliza comandas impresas.

Los pedidos se comunican verbalmente y Cocina consulta Makos cuando existen varias órdenes.

Este caso se registra porque demuestra:

```text
INFRAESTRUCTURA FÍSICA EXISTENTE
≠
PROCESO REALMENTE UTILIZADO
```

La impresora no debe considerarse evidencia de que exista un proceso en papel activo.

La razón técnica u operativa de su no utilización corresponde a:

- `OPS-AUD-005`;
- `OPS-AUD-011`;
- `CODE-AUD-016`;
- BLOQUE E4.

##### 5.8. Remisión física paralela durante pruebas

Existe evidencia operativa de utilización de una hoja física de remisión en paralelo con la aplicación durante etapas de prueba, con el propósito de no afectar el flujo ordinario mientras el inventario digital no sea autoritativo.

Este proceso se clasifica como `TRANSITORIO` y `CONTINGENCIA`.

No se asume que siga siendo la fuente primaria actual para todas las sedes.

Debe validarse en `OPS-AUD-015`:

- si continúa vigente;
- en qué sedes;
- quién la diligencia;
- quién la firma;
- si acompaña físicamente la mercancía;
- dónde se archiva;
- si se compara contra Excel, Makos o Vento OS.

El tratamiento objetivo de transición deberá definirse en E5, no en esta tarea.

---

#### 6. Soportes probables o pendientes de confirmación

##### 6.1. Reparaciones y mantenimiento

La gerente general contacta al técnico cuando se presenta una falla.

Es probable que la factura o comprobante físico llegue a Gerencia y después a Contabilidad, pero esta ruta no fue confirmada directamente.

Estado:

```text
EXISTENCIA DEL MANTENIMIENTO
→ CONFIRMADA

CIRCUITO DEL SOPORTE FÍSICO
→ POR VALIDAR EN OPS-AUD-015
```

##### 6.2. Documentos laborales

La selección y contratación involucran:

- hojas de vida;
- período de prueba;
- remisión de información a abogados;
- formalización contractual.

No existe evidencia suficiente para afirmar qué documentos se imprimen, quién conserva originales o cómo se trasladan.

Se mantiene como `POR_VALIDAR` en `OPS-AUD-015`.

##### 6.3. Etiquetas y marcaciones físicas

En Bodega y producción existen productos, estantes o zonas marcadas físicamente.

La marcación ayuda al conductor y trabajadores a ubicar productos, pero todavía no se ha confirmado:

- si son etiquetas impresas o manuscritas;
- su estructura;
- responsable de actualización;
- relación con códigos de ubicación;
- vigencia;
- tratamiento cuando cambia un producto.

El detalle corresponde a `OPS-AUD-006` y `OPS-AUD-015`.

---

#### 7. Exclusiones expresas

No se clasifican como procesos en papel:

- solicitudes creadas en Excel y enviadas como captura;
- mensajes de WhatsApp;
- órdenes registradas únicamente en Makos;
- turnos publicados en VISO y consultados en ANIMA;
- pedidos recibidos por Shopify, Rappi o ManyChat;
- listas en teléfonos;
- información memorizada;
- tableros o pizarras de producción.

Estos elementos serán tratados principalmente en `OPS-AUD-005` y `OPS-AUD-006`.

Una captura impresa o una hoja generada desde Excel solo entrará en este inventario cuando exista evidencia de uso físico real.

---

#### 8. Hallazgos transversales

##### 8.1. El papel cumple funciones distintas

No todo papel representa el mismo problema.

```text
PAPEL COMO EVIDENCIA LEGAL
≠
PAPEL COMO COLA OPERATIVA
≠
PAPEL COMO FUENTE PRIMARIA
≠
PAPEL COMO CONTINGENCIA
```

El diseño TO-BE deberá decidir por tipo:

- conservar;
- digitalizar;
- reemplazar;
- generar desde el sistema;
- firmar electrónicamente;
- mantener como contingencia.

##### 8.2. La mayor dependencia física está en dinero, compras y producción

Los usos más críticos identificados son:

- cierre y entrega de efectivo;
- facturas de proveedores;
- soportes de pagos;
- hoja de mermas;
- comandas impresas;
- factura entregada al cliente.

##### 8.3. El papel no garantiza trazabilidad

Un documento puede existir y aun así no registrar:

- actor efectivo;
- fecha y hora exactas;
- sede;
- área;
- estado;
- aprobación;
- modificación;
- entrega;
- carga al sistema;
- pérdida o duplicación.

##### 8.4. Existen procesos híbridos

Varios procesos combinan:

```text
SISTEMA
→ IMPRESIÓN
→ EJECUCIÓN FÍSICA
→ ENTREGA MANUAL
→ REGISTRO DIGITAL POSTERIOR
```

Estos casos serán prioritarios para `OPS-AUD-012`.

##### 8.5. El papel transitorio no debe convertirse automáticamente en diseño permanente

La coexistencia entre remisión física y aplicación durante pruebas responde a una necesidad de control de riesgo.

No implica que el sistema objetivo deba conservar doble registro indefinidamente.

---

#### 9. Matriz de destino de hallazgos

| Hallazgo                                                                  | Tarea exacta                  |
| ------------------------------------------------------------------------- | ----------------------------- |
| Campos y estructura de cada documento                                     | `OPS-AUD-006`                 |
| Quién crea, firma, recibe y archiva                                       | `OPS-AUD-007` y `OPS-AUD-009` |
| Anulación, corrección, reimpresión o pérdida                              | `OPS-AUD-008`                 |
| Frecuencia y volumen de impresiones                                       | `OPS-AUD-010`                 |
| Traslado entre sedes, Gerencia y Contabilidad                             | `OPS-AUD-011`                 |
| Digitación posterior desde papel                                          | `OPS-AUD-012`                 |
| Documentos sin actor, estado o custodia                                   | `OPS-AUD-013`                 |
| Uso del papel ante caída de sistemas                                      | `OPS-AUD-014`                 |
| Vigencia real de remisiones físicas, mantenimiento y documentos laborales | `OPS-AUD-015`                 |
| Arquitectura futura de impresión                                          | BLOQUE E4                     |
| Estrategia de transición y retiro                                         | BLOQUE E5                     |

---

#### 10. Decisiones propuestas

1. El inventario de papel se limita a procesos con evidencia operativa suficiente.
2. El papel actual se considera evidencia AS-IS y no requisito automático del diseño TO-BE.
3. El cierre impreso de Makos es soporte actual de la entrega de efectivo a Gerencia.
4. Las facturas físicas soportan recepción de proveedores, pagos y archivo contable.
5. La hoja manual de mermas constituye una fuente primaria no integrada al inventario.
6. Los resúmenes de cuenta y facturas legales son documentos distintos.
7. Las comandas impresas forman parte del proceso ordinario de Vento Café.
8. La existencia de una impresora en Saudo no prueba uso efectivo de comandas.
9. La remisión física paralela se clasifica como mecanismo transitorio o de contingencia, no como modelo definitivo.
10. Los soportes de mantenimiento, documentos laborales y características de etiquetas físicas quedan expresamente vinculados a `OPS-AUD-015`.
11. Ninguna decisión de esta tarea autoriza digitalización, eliminación de documentos, cambios de proceso, código, migraciones o modificaciones en Supabase.
12. La decisión de conservar o reemplazar cada soporte se tomará después del diseño TO-BE y de revisar requisitos legales, contables y operativos.

---

#### 11. Criterios de aceptación

`OPS-AUD-004` podrá aprobarse cuando se confirme que:

- los procesos actuales soportados en papel están inventariados;
- se diferencia entre fuente primaria, impresión de sistema, soporte, traspaso, control, archivo y contingencia;
- los cierres impresos, facturas, mermas, resúmenes, facturas de venta y comandas están registrados;
- los elementos probables no se presentan como confirmados;
- el uso transitorio de remisiones físicas no se convierte en requisito permanente;
- los procesos digitales permanecen reservados para `OPS-AUD-005`;
- la estructura detallada de formularios permanece reservada para `OPS-AUD-006`;
- cada brecha y duda tiene un destino documental exacto;
- no se ha diseñado el proceso TO-BE;
- no se ha autorizado implementación.

---

#### 12. Resultado y continuidad

Con la aprobación de `OPS-AUD-004` quedará establecida la línea base inicial de:

- procesos cuyo origen está en papel;
- documentos impresos desde sistemas;
- soportes físicos de recepción, pagos y ventas;
- documentos trasladados entre sedes y Gerencia;
- registros manuales no integrados;
- papeles transitorios o de contingencia;
- documentos cuya vigencia o custodia debe validarse.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-005
— Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas
```

`OPS-AUD-005` deberá reutilizar este inventario para identificar procesos híbridos, duplicaciones entre papel y herramientas digitales y puntos de conciliación, sin modificar silenciosamente las decisiones aprobadas en `OPS-AUD-004`.



### ✅ OPS-AUD-005 — Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas

**Estado:** APROBADO  
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de procesos ejecutados total o parcialmente mediante herramientas digitales externas, aplicaciones actuales y canales no integrados  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** información consolidada en `OPS-AUD-001` a `OPS-AUD-004`  
**Validación pendiente:** únicamente mediante `OPS-AUD-015` cuando la evidencia no sea suficiente

---

#### 1. Propósito

Inventariar las herramientas digitales y canales actuales que participan en la operación de Vento Group, determinando:

- qué proceso soporta cada herramienta;
- quién la utiliza;
- qué información recibe o produce;
- si funciona como fuente primaria, apoyo, canal, registro o sistema de ejecución;
- si la información se transcribe posteriormente;
- si existe duplicación con papel u otra plataforma;
- si el proceso depende de cuentas compartidas;
- si la herramienta conserva trazabilidad suficiente;
- si el dato queda aislado, fragmentado o sin propietario claro.

Esta tarea documenta la realidad actual.

```text
HERRAMIENTA ACTUAL
→ evidencia del proceso AS-IS

HERRAMIENTA ACTUAL
≠ arquitectura obligatoria del sistema TO-BE
```

La existencia de WhatsApp, Excel, Makos, Shopify, Rappi, ManyChat, VISO, ANIMA u otra plataforma no implica que:

- deba conservarse como fuente de verdad;
- deba integrarse de forma permanente;
- pueda sustituir al propietario empresarial del proceso;
- sus cuentas compartidas sean aceptables en el modelo objetivo;
- sus estados sean suficientes para Vento OS.

---

#### 2. Alcance

Incluye:

- WhatsApp;
- correo electrónico;
- Excel;
- Makos;
- Rappi;
- ManyChat;
- Shopify;
- VISO;
- ANIMA;
- sistema contable;
- Bancolombia Nóminas;
- Instagram y otras redes sociales;
- notas, fotografías, capturas y archivos en teléfonos;
- herramientas técnicas utilizadas para soporte o coordinación;
- cualquier plataforma externa o interna que reciba, transforme, almacene o transmita información operativa.

No incluye todavía:

- estructura detallada de formularios o archivos;
- campos exactos de cada Excel;
- diseño de mensajes;
- flujo completo paso a paso;
- excepciones, anulaciones o reversiones;
- definición de integraciones;
- selección de herramientas futuras;
- contratos de API;
- propiedad definitiva de datos;
- arquitectura TO-BE;
- implementación.

Destinos documentales:

| Tema                                                    | Tarea propietaria |
| ------------------------------------------------------- | ----------------- |
| Formularios, archivos, remisiones, etiquetas y reportes | `OPS-AUD-006`     |
| Flujo ordinario                                         | `OPS-AUD-007`     |
| Excepciones, correcciones y reversión                   | `OPS-AUD-008`     |
| Aprobaciones y segregación                              | `OPS-AUD-009`     |
| Frecuencia, volumen, tiempos y criticidad               | `OPS-AUD-010`     |
| Dependencias entre herramientas y actores               | `OPS-AUD-011`     |
| Doble digitación y conciliación                         | `OPS-AUD-012`     |
| Pérdida de trazabilidad                                 | `OPS-AUD-013`     |
| Contingencias por caída o indisponibilidad              | `OPS-AUD-014`     |
| Validación con responsables                             | `OPS-AUD-015`     |
| Contratos de integración                                | BLOQUE X          |
| Servicios de colas, impresión y notificaciones          | BLOQUE E4         |
| Paquetes de transición, piloto y rollback               | BLOQUE E5         |

---

#### 3. Criterios de clasificación

##### 3.1. Función de la herramienta

| Código          | Función                 | Definición                                              |
| --------------- | ----------------------- | ------------------------------------------------------- |
| `CAPTURA`       | Registro inicial        | La información nace en la herramienta                   |
| `CANAL`         | Comunicación            | Transmite instrucciones, solicitudes o novedades        |
| `EJECUCIÓN`     | Operación               | El proceso se ejecuta directamente en la herramienta    |
| `FUENTE`        | Fuente de verdad actual | La operación consulta el dato como referencia principal |
| `CONSOLIDACIÓN` | Agrupación              | Reúne información de varias personas o áreas            |
| `EVIDENCIA`     | Soporte                 | Conserva prueba o histórico parcial                     |
| `NOTIFICACIÓN`  | Aviso                   | Informa un evento o cambio                              |
| `PAGO`          | Ejecución financiera    | Permite realizar o registrar pagos                      |
| `PUBLICACIÓN`   | Canal externo           | Publica contenido o información a clientes              |
| `SOPORTE`       | Atención técnica        | Se utiliza para reportar o resolver incidentes          |

##### 3.2. Estado de integración

| Estado        | Significado                                                      |
| ------------- | ---------------------------------------------------------------- |
| `AISLADA`     | No comparte datos automáticamente                                |
| `MANUAL`      | Requiere transcripción o copia                                   |
| `PARCIAL`     | Existe alguna conexión, pero el proceso sigue incompleto         |
| `INTEGRADA`   | Intercambio automático confirmado                                |
| `DESCONOCIDA` | No existe evidencia suficiente                                   |
| `LEGACY`      | Herramienta vigente, pero contractual o técnicamente provisional |

##### 3.3. Identidad del usuario

| Estado          | Significado                                     |
| --------------- | ----------------------------------------------- |
| `INDIVIDUAL`    | La cuenta identifica a una persona concreta     |
| `COMPARTIDA`    | Varias personas utilizan la misma cuenta        |
| `MIXTA`         | Combina cuentas individuales y compartidas      |
| `NO_CONFIRMADA` | No se conoce con precisión                      |
| `EXTERNA`       | La identidad pertenece a un tercero o proveedor |

---

#### 4. Inventario maestro de herramientas

| Código   | Herramienta                                           | Procesos principales                                                                                | Función                                                 | Integración                        | Identidad                                  |
| -------- | ----------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------- | ------------------------------------------ |
| `DIG-01` | WhatsApp                                              | Remisiones, compras, proveedores, marketing, soporte, personal, mantenimiento, coordinación general | `CANAL`, `CAPTURA`, `NOTIFICACIÓN`, `EVIDENCIA` parcial | `MANUAL`                           | `MIXTA`                                    |
| `DIG-02` | Excel                                                 | Solicitudes de remisión, consolidaciones, reportes administrativos y apoyo de control               | `CAPTURA`, `CONSOLIDACIÓN`, `EVIDENCIA`                 | `AISLADA` / `MANUAL`               | `INDIVIDUAL` o `NO_CONFIRMADA`             |
| `DIG-03` | Makos                                                 | POS, mesas, pedidos, caja, cierres, facturas, comandas y reportes                                   | `EJECUCIÓN`, `FUENTE`, `EVIDENCIA`                      | `LEGACY`, mayormente `AISLADA`     | `COMPARTIDA` por función                   |
| `DIG-04` | Rappi                                                 | Pedidos externos                                                                                    | `CAPTURA`, `CANAL`, `EJECUCIÓN` externa                 | `MANUAL` hacia Makos               | `NO_CONFIRMADA`                            |
| `DIG-05` | ManyChat                                              | Pedidos directos y atención por mensajería                                                          | `CAPTURA`, `CANAL`                                      | `MANUAL` hacia Makos               | `COMPARTIDA` o `NO_CONFIRMADA`             |
| `DIG-06` | Shopify                                               | Ventas de Vaila Vainilla                                                                            | `CAPTURA`, `EJECUCIÓN`, `FUENTE` comercial              | `AISLADA` respecto a Vento OS      | `INDIVIDUAL` / `NO_CONFIRMADA`             |
| `DIG-07` | VISO                                                  | Programación, consulta administrativa y reportes de asistencia                                      | `CAPTURA`, `EJECUCIÓN`, `FUENTE`, `CONSOLIDACIÓN`       | `PARCIAL` con ANIMA                | `INDIVIDUAL`                               |
| `DIG-08` | ANIMA                                                 | Consulta de turnos y check-in                                                                       | `EJECUCIÓN`, `FUENTE`, `NOTIFICACIÓN`                   | `PARCIAL` con VISO y Vento OS      | `INDIVIDUAL`                               |
| `DIG-09` | Sistema contable                                      | Registro financiero, tributario, laboral y bancario                                                 | `EJECUCIÓN`, `FUENTE`, `CONSOLIDACIÓN`, `EVIDENCIA`     | `MANUAL` desde soportes y reportes | `INDIVIDUAL`                               |
| `DIG-10` | Bancolombia Nóminas                                   | Pago de nómina formal                                                                               | `PAGO`, `EJECUCIÓN`, `EVIDENCIA`                        | `MANUAL` desde cálculo previo      | `INDIVIDUAL`                               |
| `DIG-11` | Instagram y redes sociales                            | Vacantes, marketing, ventas y comunicación comercial                                                | `PUBLICACIÓN`, `CANAL`, `CAPTURA`                       | `AISLADA`                          | `COMPARTIDA` / `MIXTA`                     |
| `DIG-12` | Correo electrónico                                    | Intercambio administrativo, legal o contable                                                        | `CANAL`, `EVIDENCIA`                                    | `DESCONOCIDA`                      | `INDIVIDUAL` / `NO_CONFIRMADA`             |
| `DIG-13` | Fotografías y capturas                                | Evidencia de remisiones, producción, faltantes, productos y novedades                               | `CAPTURA`, `CANAL`, `EVIDENCIA` parcial                 | `MANUAL`                           | Depende del teléfono personal o compartido |
| `DIG-14` | Notas en teléfono                                     | Totales, recordatorios y consolidación informal                                                     | `CAPTURA`, `CONSOLIDACIÓN`                              | `AISLADA`                          | `INDIVIDUAL`                               |
| `DIG-15` | Herramientas de soporte técnico                       | Diagnóstico y resolución de computadores, impresoras, cámaras, sonido y redes                       | `SOPORTE`, `EJECUCIÓN`                                  | `AISLADA`                          | `INDIVIDUAL`                               |
| `DIG-16` | Vento OS en pruebas                                   | Remisiones, inventario y procesos operativos parciales                                              | `EJECUCIÓN`, `EVIDENCIA` experimental                   | `PARCIAL` / `LEGACY`               | `INDIVIDUAL` y dispositivos compartidos    |
| `DIG-17` | Aplicación de inventario en tablet o kiosco           | Registro experimental de retiros                                                                    | `CAPTURA`, `EJECUCIÓN` experimental                     | `PARCIAL`                          | `COMPARTIDA` o por trabajador              |
| `DIG-18` | Sistemas o portales de terceros jurídicos y laborales | Contratos y formalización                                                                           | `CANAL`, `EVIDENCIA`, `EJECUCIÓN` externa               | `DESCONOCIDA`                      | `EXTERNA`                                  |

---

#### 5. WhatsApp

##### 5.1. Uso general

WhatsApp funciona actualmente como la principal capa informal de coordinación transversal.

Se utiliza para:

- enviar solicitudes;
- recibir fotografías;
- reportar faltantes;
- coordinar producción;
- realizar pedidos a proveedores;
- confirmar disponibilidad y fechas;
- solicitar domicilios;
- comunicar incidentes;
- pedir soporte técnico;
- solicitar contenido de Marketing;
- informar novedades laborales;
- contactar técnicos;
- coordinar entregas y recolecciones;
- comunicar decisiones operativas.

```text
OPERACIÓN REAL
→ MENSAJE O GRUPO DE WHATSAPP
→ INTERPRETACIÓN HUMANA
→ ACCIÓN MANUAL
```

##### 5.2. Remisiones y producción

Cada área o sede prepara una solicitud en Excel y envía una fotografía o captura al grupo correspondiente.

Participan:

- Servicio de Vento Café;
- Cocina de Vento Café;
- Barra de Vento Café;
- Saudo;
- Molka;
- áreas productivas del Centro de Producción;
- conductor;
- responsables o supervisores.

Las áreas productivas consultan capturas y consolidan cantidades manualmente.

En algunos casos se envían fotografías de:

- cantidades producidas;
- productos extra;
- novedades;
- faltantes;
- productos dejados en frío o mesón.

Hallazgos:

- WhatsApp no estructura el estado de una solicitud;
- no diferencia claramente solicitado, confirmado, producido, despachado y recibido;
- una fotografía puede quedar desactualizada después de un cambio;
- la búsqueda histórica depende del grupo, fecha y memoria;
- no existe vínculo automático con productos, presentaciones, sedes o inventario;
- el silencio no permite distinguir entre leído, aceptado, omitido o rechazado.

Destinos: `OPS-AUD-006`, `OPS-AUD-007`, `OPS-AUD-008`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.3. Compras y proveedores

La gerente general o Leidy realizan pedidos a proveedores mediante WhatsApp.

El proveedor confirma:

- disponibilidad;
- cantidades;
- precios;
- fecha estimada.

La necesidad de compra proviene de:

- preguntas a las áreas;
- avisos de faltantes;
- experiencia;
- urgencias.

Hallazgos:

- el mensaje puede actuar simultáneamente como solicitud, cotización y confirmación;
- no existe separación confirmada entre propuesta, aprobación y orden definitiva;
- no existe vínculo automático con inventario;
- el pedido no se convierte automáticamente en recepción;
- cambios del proveedor pueden quedar dispersos en la conversación;
- el soporte debe reconciliarse posteriormente con factura física.

Destinos: `OPS-AUD-007`, `OPS-AUD-008`, `OPS-AUD-009`, `OPS-AUD-011`, `OPS-AUD-012` y `OPS-AUD-013`.

##### 5.4. Soporte técnico

Los incidentes tecnológicos se reportan normalmente por WhatsApp o verbalmente.

El Jefe de Operaciones recibe solicitudes relacionadas con:

- computadores;
- impresoras;
- cámaras;
- sonido;
- redes;
- dispositivos;
- aplicaciones.

Después de resolver, no queda un ticket estructurado con:

- activo;
- sede;
- síntoma;
- causa;
- acción aplicada;
- repuesto;
- tiempo;
- responsable;
- resultado.

WhatsApp funciona como canal de entrada, pero no como sistema de gestión de incidentes.

Destino principal: `OPS-AUD-013`.

##### 5.5. Marketing

Nathalia o Jeo solicitan contenido por WhatsApp o verbalmente.

Normalmente no se estructura:

- objetivo;
- audiencia;
- formato;
- prioridad;
- fecha;
- criterio de aprobación;
- responsable;
- estado;
- retroalimentación.

El mensaje puede quedar como instrucción ambigua y la expectativa creativa se completa por interpretación.

Destinos: `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-010`, `OPS-AUD-013` y `OPS-AUD-015`.

##### 5.6. Personal y accesos

Gerencia solicita al Jefe de Operaciones crear cuentas de ANIMA o Vento OS mediante comunicación informal.

No existe un flujo estructurado de:

- alta;
- cambio de cargo;
- cambio de sede;
- cambio de área;
- suspensión;
- retiro;
- baja de accesos.

La ausencia de notificación formal provoca que el retiro pueda descubrirse durante la operación.

Destinos: `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-011`, `OPS-AUD-013` y `OPS-AUD-015`.

##### 5.7. Mantenimiento

La falla se informa a la gerente general y ella contacta al técnico.

WhatsApp puede intervenir para:

- describir la falla;
- enviar fotografías;
- coordinar visita;
- consultar repuestos;
- confirmar disponibilidad.

No existe historial consolidado del activo ni de la reparación.

Destinos: `OPS-AUD-011`, `OPS-AUD-013` y `OPS-AUD-015`.

---

#### 6. Excel

##### 6.1. Solicitudes de remisión

Excel se utiliza como formato de solicitud por sede o área.

Proceso conocido:

```text
TRABAJADOR RESPONSABLE
→ ABRE O EDITA EXCEL
→ REGISTRA CANTIDADES
→ TOMA CAPTURA O FOTOGRAFÍA
→ ENVÍA AL GRUPO
```

Vento Café separa solicitudes de:

- Servicio;
- Cocina;
- Barra.

Saudo y Molka realizan una solicitud única por sede.

Hallazgos:

- el archivo no es necesariamente el artefacto que recibe producción; con frecuencia se recibe una imagen;
- la versión definitiva puede no estar identificada;
- no existe control automático de producto, presentación o cantidad mínima;
- no existe confirmación de recepción;
- la consolidación se realiza manualmente;
- el dato no afecta inventario;
- el archivo no acompaña automáticamente el estado posterior.

##### 6.2. Reportes y consolidaciones administrativas

Gerencia y Contabilidad reciben o utilizan Excel para reportes y consolidaciones.

Se ha confirmado la recepción de:

- archivos o reportes operativos;
- información combinada con cierres de Makos;
- necesidades de compra;
- información administrativa.

No se ha confirmado un catálogo único de archivos, propietarios, ubicaciones o versiones.

Destino: `OPS-AUD-006` y `OPS-AUD-015`.

##### 6.3. Limitaciones transversales de Excel

- archivos duplicados;
- copias locales;
- versiones no identificadas;
- uso de capturas en lugar del archivo;
- ausencia de validaciones maestras;
- nombres escritos de forma variable;
- consolidación manual;
- dificultad de auditoría;
- ausencia de relación con IDs canónicos;
- posibilidad de sobrescritura;
- dependencia de conocimiento del usuario.

La estructura de cada archivo se inventariará en `OPS-AUD-006`.

---

#### 7. Makos

##### 7.1. Funciones actuales

Makos soporta:

- apertura y cierre de caja;
- base inicial;
- registro de ventas;
- mesas;
- pedidos adicionales;
- cuentas abiertas;
- medios de pago;
- facturas;
- resúmenes;
- comandas;
- reportes;
- pedidos clasificados como Rappi o Domicilio.

##### 7.2. Uso por sede

**Vento Café**

- Caja utiliza una cuenta operativa.
- Servicio utiliza una cuenta compartida.
- Los meseros registran mesas desde tablet.
- Makos imprime comandas de Cocina, Bar y Barra.
- Caja registra el pago y cierra la cuenta.

**Saudo**

- El mesero utiliza tablet o celular.
- Cocina consulta Makos.
- La comunicación principal con Cocina es verbal.
- Existe impresora, pero no se utiliza ordinariamente.

**Molka**

- La persona registra, cobra y luego consulta Makos para preparar.
- No existen comandas impresas como flujo ordinario.

##### 7.3. Identidad y cuentas compartidas

Makos no identifica de forma consistente al trabajador efectivo.

La configuración exacta debe validarse, pero se conoce que:

- existen cuentas operativas compartidas;
- una cuenta puede representar Caja o Servicio;
- el registro permite atribuir una acción a una función, no necesariamente a una persona;
- varios trabajadores pueden utilizar el mismo dispositivo o sesión.

Esto produce:

```text
ACCIÓN REGISTRADA
→ FUNCIÓN O CUENTA OPERATIVA CONOCIDA

PERSONA EFECTIVA
→ NO SIEMPRE DETERMINABLE
```

Destino: `OPS-AUD-009`, `OPS-AUD-013` y `OPS-AUD-015`.

##### 7.4. Limitaciones conocidas

- no refleja correctamente productos agotados;
- Rappi y ManyChat requieren transcripción;
- el pago con datáfono puede comunicarse verbalmente;
- no registra listo, recogido y entregado;
- no identifica al mesero efectivo;
- no integra inventario confiable;
- no registra el flujo interno completo;
- no reemplaza las necesidades de Vento OS;
- su papel futuro debe definirse mediante BLOQUE X y el contrato temporal de POS externo.

---

#### 8. Rappi y ManyChat

##### 8.1. Rappi

Rappi recibe el pedido del cliente.

Caja:

1. consulta el pedido;
2. lo transcribe manualmente a Makos;
3. lo clasifica como Rappi;
4. coordina la preparación;
5. entrega al domiciliario.

No existe integración automática confirmada.

Riesgos:

- doble digitación;
- diferencia entre pedido original y pedido transcrito;
- cambios o cancelaciones no sincronizados;
- estados distintos entre plataformas;
- conciliación manual;
- identidad del operador no siempre individual.

##### 8.2. ManyChat

ManyChat se mantiene abierto en el computador de Caja para recibir pedidos directos.

Caja transcribe el pedido a Makos como Domicilio.

El proceso puede incluir:

- datos del cliente;
- dirección;
- teléfono;
- método de pago;
- coordinación de mensajería;
- aviso de salida.

No existe evidencia de integración automática con Makos, inventario o logística.

Destinos comunes: `OPS-AUD-007`, `OPS-AUD-008`, `OPS-AUD-011`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 9. Shopify y operación de Vaila Vainilla

Shopify es el canal principal de venta de Vaila Vainilla.

Jeo recibe, revisa y gestiona los pedidos.

La trabajadora de ventas en línea:

- empaca;
- agrupa pedidos;
- entrega paquetes a la mensajería.

Información no confirmada:

- fuente real de inventario;
- descuento de stock;
- generación de guía;
- sincronización con mensajería;
- notificación al cliente;
- tratamiento de devoluciones;
- conciliación de pagos;
- exportación a Contabilidad.

Estos puntos se mantienen en `OPS-AUD-015`.

Shopify se clasifica como fuente comercial actual de Vaila Vainilla, pero no como fuente canónica aprobada de inventario, clientes o finanzas para todo Vento Group.

---

#### 10. VISO y ANIMA

##### 10.1. VISO

VISO se utiliza para:

- crear o publicar horarios;
- consultar información administrativa;
- obtener reportes de asistencia;
- apoyar la gestión de trabajadores.

La gerente general y la gerente de Vento Café definen los horarios.

##### 10.2. ANIMA

ANIMA permite al trabajador:

- recibir notificación;
- consultar turno;
- ver sede y horario;
- realizar check-in.

El trabajador no confirma formalmente la aceptación del turno.

##### 10.3. Relación actual

```text
GERENCIA
→ PUBLICA EN VISO
→ TRABAJADOR CONSULTA EN ANIMA
→ REALIZA CHECK-IN
→ GERENCIA DESCARGA REPORTE
```

La relación es parcial y no cubre integralmente:

- aceptación;
- cambio de turno;
- ausencia justificada;
- reemplazo;
- baja laboral;
- baja de acceso;
- efecto económico de propinas;
- rol operativo efectivo;
- dispositivo compartido.

Los contratos objetivo deberán definirse en BLOQUES F, G, H2 y X.

---

#### 11. Sistema contable y Bancolombia Nóminas

##### 11.1. Sistema contable

El sistema contable recibe información:

- financiera;
- tributaria;
- laboral;
- bancaria;
- facturas;
- soportes de gastos;
- datos de cierre.

La carga depende de documentos, Excel, reportes de Makos y procesos manuales.

No existe evidencia de integración automática completa con:

- Makos;
- inventario;
- compras;
- producción;
- Vento OS;
- propinas.

##### 11.2. Bancolombia Nóminas

La nómina formal se carga y paga mediante Bancolombia Nóminas.

El sistema ejecuta el pago, pero el cálculo y preparación ocurren previamente.

Las propinas permanecen fuera de este flujo y se liquidan manualmente.

Destinos: `OPS-AUD-007`, `OPS-AUD-011`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 12. Redes sociales

Instagram y otras redes se utilizan para:

- publicar vacantes;
- publicar contenido;
- recibir contactos;
- promocionar marcas;
- dirigir conversaciones comerciales;
- apoyar ventas.

Las cuentas pueden ser gestionadas por Nathalia, Jeo o Marketing.

No existe un flujo único para:

- solicitud;
- creación;
- aprobación;
- publicación;
- conservación de archivos;
- respuesta;
- conversión a pedido;
- medición de resultado.

La publicación de vacantes inicia el proceso de selección, pero las hojas de vida y entrevistas se administran posteriormente por Gerencia.

Destinos: `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-010`, `OPS-AUD-011` y `OPS-AUD-015`.

---

#### 13. Correo electrónico

No se identificó un proceso operativo ordinario cuya fuente principal confirmada sea el correo electrónico.

Es probable que participe en:

- comunicación contable;
- contratos;
- abogados;
- proveedores;
- facturación;
- documentos administrativos;
- accesos a plataformas.

No deberá inventariarse como canal crítico confirmado sin evidencia.

Estado:

```text
USO ADMINISTRATIVO GENERAL
→ PROBABLE

PROCESO OPERATIVO ESPECÍFICO
→ POR VALIDAR EN OPS-AUD-015
```

---

#### 14. Fotografías, capturas y notas en teléfono

##### 14.1. Fotografías y capturas

Se utilizan para:

- enviar remisiones;
- mostrar cantidades producidas;
- evidenciar productos extra;
- informar novedades;
- mostrar daños;
- documentar equipos;
- comunicar productos o canastas;
- apoyar solicitudes.

Una imagen suele perder:

- estructura;
- identificadores;
- versión;
- autor;
- relación con proceso;
- capacidad de búsqueda;
- validación automática.

##### 14.2. Notas en teléfono

Algunas áreas consolidan cantidades en el teléfono.

El registro:

- depende de una persona;
- puede no compartirse;
- no tiene formato común;
- puede eliminarse;
- no se relaciona con productos canónicos;
- no produce un historial empresarial.

Destinos: `OPS-AUD-006`, `OPS-AUD-012` y `OPS-AUD-013`.

---

#### 15. Vento OS y herramientas experimentales

##### 15.1. Registro de remisiones en paralelo

Vento OS ha sido utilizado en pruebas para registrar eventos y movimientos, manteniendo en paralelo soportes físicos o procesos actuales.

Durante esta etapa, el sistema no debe considerarse fuente autoritativa cuando:

- no registra todas las recepciones;
- no registra producción completa;
- no registra todos los retiros;
- no concilia stock físico;
- las sedes continúan usando Excel o papel.

##### 15.2. Kiosco o tablet de retiros

Se realizó una prueba en la que:

- se tomó conteo inicial;
- trabajadores registraron retiros;
- las entradas y otros movimientos no se registraron completamente;
- el inventario dejó de ser confiable en pocos días.

Hallazgo:

```text
REGISTRAR SOLO SALIDAS
SIN REGISTRAR ENTRADAS, PRODUCCIÓN Y AJUSTES
→ INVENTARIO DIGITAL INVÁLIDO
```

Destinos: `OPS-AUD-007`, `OPS-AUD-012`, `OPS-AUD-013`, E3 y paquetes posteriores de NEXO.

---

#### 16. Procesos híbridos principales

| Proceso                      | Herramientas combinadas                                                      |
| ---------------------------- | ---------------------------------------------------------------------------- |
| Remisión                     | Excel → captura → WhatsApp → interpretación manual → preparación física      |
| Producción                   | Captura de remisión → tablero o teléfono → producción → fotografía o mensaje |
| Compra                       | Aviso de faltante → WhatsApp → proveedor → factura física → sistema contable |
| Venta Rappi                  | Rappi → transcripción a Makos → comanda → entrega                            |
| Venta directa por mensajería | ManyChat → transcripción a Makos → mensajería externa                        |
| Caja                         | Makos → cierre impreso → efectivo → Gerencia → sistema contable              |
| Asistencia                   | VISO → ANIMA → reporte → cálculo manual de consecuencias                     |
| Propinas                     | Reporte de asistencia → cálculo manual → efectivo                            |
| Soporte técnico              | WhatsApp o verbal → diagnóstico → solución sin historial                     |
| Accesos                      | Solicitud informal → creación manual → retiro descubierto informalmente      |
| Vaila Vainilla               | Shopify/redes → gestión humana → empaque → mensajería                        |

---

#### 17. Hallazgos transversales

##### 17.1. WhatsApp funciona como bus operativo informal

Conecta prácticamente todas las áreas, pero no ofrece por sí solo:

- estados canónicos;
- validaciones;
- propietarios de datos;
- control de versiones;
- segregación;
- auditoría confiable;
- integración con inventario.

##### 17.2. Excel funciona como formulario, base y reporte al mismo tiempo

Esto dificulta distinguir:

- dato original;
- versión vigente;
- consolidación;
- aprobación;
- histórico;
- fuente de verdad.

##### 17.3. Makos es crítico pero no cubre el proceso empresarial completo

Registra venta y caja, pero deja fuera:

- identidad efectiva;
- inventario real;
- preparación detallada;
- entrega;
- logística;
- producción;
- compras;
- contexto laboral.

##### 17.4. Existen múltiples fuentes parciales

```text
WHATSAPP
+
EXCEL
+
MAKOS
+
PAPEL
+
MEMORIA
+
OBSERVACIÓN FÍSICA
        ↓
VERDAD OPERATIVA FRAGMENTADA
```

##### 17.5. La información se mueve por transcripción

Los principales puntos conocidos son:

- Excel a captura;
- captura a interpretación;
- Rappi a Makos;
- ManyChat a Makos;
- factura física a sistema contable;
- asistencia a cálculo manual de propinas;
- pedido de proveedor a recepción;
- soporte técnico a memoria del responsable.

##### 17.6. Las cuentas compartidas impiden atribución individual

Especialmente en:

- Makos Servicio;
- Makos Caja según configuración;
- tablets;
- cuentas de redes;
- herramientas de mensajería;
- dispositivos operativos.

##### 17.7. La herramienta no define el propietario del proceso

Makos, WhatsApp, Shopify, VISO o ANIMA pueden registrar o transmitir, pero la responsabilidad continúa perteneciendo a actores empresariales.

---

#### 18. Matriz de destino de hallazgos

| Hallazgo                                                     | Tarea exacta  |
| ------------------------------------------------------------ | ------------- |
| Archivos, campos, grupos, reportes y formatos                | `OPS-AUD-006` |
| Secuencia entre herramientas y actores                       | `OPS-AUD-007` |
| Cambios, cancelaciones, mensajes perdidos y reintentos       | `OPS-AUD-008` |
| Quién puede ordenar, aprobar, registrar o corregir           | `OPS-AUD-009` |
| Volumen de mensajes, pedidos y archivos                      | `OPS-AUD-010` |
| Dependencias entre plataformas, sedes y terceros             | `OPS-AUD-011` |
| Transcripciones y conciliaciones                             | `OPS-AUD-012` |
| Falta de autor, estado, versión o custodia                   | `OPS-AUD-013` |
| Caída de internet, plataforma o dispositivo                  | `OPS-AUD-014` |
| Correo, Shopify, cuentas Makos y herramientas no confirmadas | `OPS-AUD-015` |
| Integraciones internas y externas                            | BLOQUE X      |
| Colas, notificaciones, impresión y evidencia                 | BLOQUE E4     |
| Transición, piloto y retiro de herramientas legacy           | BLOQUE E5     |

---

#### 19. Decisiones propuestas

1. WhatsApp se reconoce como el principal canal operativo informal actual.
2. Excel se reconoce como fuente primaria de solicitudes de remisión y herramienta de consolidación manual.
3. Las capturas de Excel son un artefacto distinto del archivo original y pueden perder versión y estructura.
4. Makos es la plataforma actual de venta, caja y comandas, pero no representa el proceso empresarial completo.
5. Rappi y ManyChat requieren transcripción manual a Makos.
6. Shopify es la fuente comercial actual de Vaila Vainilla, pero su relación con inventario, mensajería y Contabilidad queda pendiente de validación.
7. VISO y ANIMA soportan programación y asistencia de forma parcial.
8. El sistema contable recibe información desde múltiples fuentes manuales.
9. Bancolombia Nóminas ejecuta pagos formales, pero no incluye propinas.
10. Instagram y redes sociales participan en Marketing, ventas y reclutamiento sin un flujo único.
11. El correo electrónico no se clasificará como canal operativo crítico sin validación.
12. Las fotografías, capturas y notas de teléfono son evidencia débil y no estructurada.
13. Vento OS en pruebas no puede considerarse fuente autoritativa mientras los movimientos estén incompletos.
14. Ninguna herramienta actual se convierte automáticamente en propietaria canónica del dato o proceso.
15. Ninguna decisión autoriza integraciones, reemplazos, código, migraciones o cambios en Supabase.

---

#### 20. Criterios de aceptación

`OPS-AUD-005` podrá aprobarse cuando se confirme que:

- las herramientas operativas actuales están inventariadas;
- se distingue su función, integración e identidad;
- WhatsApp, Excel, Makos, Rappi, ManyChat, Shopify, VISO, ANIMA, sistema contable y Bancolombia Nóminas están cubiertos;
- se identifican los procesos híbridos;
- se registran cuentas compartidas;
- se separan hechos confirmados de usos probables;
- el correo no se presenta como crítico sin evidencia;
- cada brecha tiene destino documental exacto;
- no se ha diseñado todavía la integración TO-BE;
- no se ha autorizado implementación.

---

#### 21. Resultado y continuidad

Con la aprobación de `OPS-AUD-005` quedará establecida la línea base inicial de:

- herramientas digitales actuales;
- canales informales;
- procesos ejecutados en plataformas externas;
- transcripciones manuales;
- cuentas compartidas;
- fuentes de verdad parciales;
- procesos híbridos papel-digital;
- herramientas experimentales;
- brechas de integración y trazabilidad.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-006
— Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes
```

`OPS-AUD-006` deberá convertir los artefactos detectados en un inventario documental estructurado, sin diseñar todavía las pantallas, tablas o integraciones definitivas.



### ✅ OPS-AUD-006 — Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Naturaleza:** Inventario AS-IS de artefactos documentales, operativos y de evidencia  
**Implementación técnica:** No autorizada en esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Fuente de evidencia:** información consolidada en `OPS-AUD-001` a `OPS-AUD-005`  
**Validación pendiente:** exclusivamente mediante `OPS-AUD-015` cuando el contenido, custodio, vigencia o uso real no esté suficientemente confirmado

---

#### 1. Propósito

Inventariar los artefactos utilizados actualmente para iniciar, ejecutar, controlar, demostrar o cerrar procesos de Vento Group.

Se consideran artefactos:

- formularios;
- remisiones;
- solicitudes;
- órdenes;
- facturas;
- comprobantes;
- cierres;
- comandas;
- reportes;
- hojas manuales;
- etiquetas;
- rótulos;
- fotografías;
- capturas;
- archivos de Excel;
- registros emitidos por plataformas;
- documentos laborales;
- guías de transporte;
- cualquier evidencia que permita reconstruir parcial o totalmente una operación.

Esta tarea identifica **qué artefactos existen y para qué se utilizan**.

No define todavía:

- el formulario definitivo;
- la pantalla futura;
- la tabla o esquema de base de datos;
- el contrato de API;
- la integración;
- el flujo completo;
- las reglas de aprobación;
- la conservación legal definitiva;
- el mecanismo de firma;
- la arquitectura de impresión;
- la eliminación o reemplazo de documentos actuales.

```text
ARTEFACTO AS-IS
→ evidencia de una necesidad, decisión, movimiento o resultado actual

ARTEFACTO AS-IS
≠ formulario TO-BE obligatorio
```

---

#### 2. Relación con las tareas anteriores

`OPS-AUD-004` identificó los procesos soportados en papel.

`OPS-AUD-005` identificó las herramientas y canales que producen, reciben o transmiten información.

`OPS-AUD-006` convierte esa evidencia en un inventario estructurado de artefactos.

```text
PROCESO
+
HERRAMIENTA
+
DOCUMENTO, REGISTRO O EVIDENCIA
        ↓
INVENTARIO DOCUMENTAL AS-IS
```

La tarea no deberá duplicar el flujo detallado de `OPS-AUD-007` ni resolver anticipadamente:

- excepciones de `OPS-AUD-008`;
- aprobaciones de `OPS-AUD-009`;
- volúmenes y tiempos de `OPS-AUD-010`;
- dependencias de `OPS-AUD-011`;
- conciliaciones de `OPS-AUD-012`;
- trazabilidad de `OPS-AUD-013`;
- contingencias de `OPS-AUD-014`;
- validación de `OPS-AUD-015`.

---

#### 3. Clasificación canónica de artefactos

##### 3.1. Familia documental

| Código | Familia           | Definición                                                          |
| ------ | ----------------- | ------------------------------------------------------------------- |
| `SOL`  | Solicitud         | Expresa una necesidad o requerimiento                               |
| `ORD`  | Orden             | Comunica una instrucción de compra, producción, entrega o ejecución |
| `REM`  | Remisión          | Relaciona productos solicitados, preparados, enviados o recibidos   |
| `REC`  | Recepción         | Evidencia entrega de proveedor o ingreso físico                     |
| `VEN`  | Venta             | Registra pedido, cuenta, pago o factura a cliente                   |
| `PRD`  | Producción        | Registra necesidad, cantidad, resultado o novedad productiva        |
| `INV`  | Inventario        | Registra conteo, retiro, movimiento, merma o ajuste                 |
| `LOG`  | Logística         | Identifica carga, destino, transporte, guía o entrega               |
| `FIN`  | Financiero        | Soporta efectivo, gasto, cierre, pago o conciliación                |
| `LAB`  | Laboral           | Registra vacante, candidato, contrato, turno, asistencia o nómina   |
| `MKT`  | Marketing         | Registra solicitud, pieza, aprobación o publicación                 |
| `MNT`  | Mantenimiento     | Registra falla, diagnóstico, reparación, repuesto o factura         |
| `TEC`  | Soporte técnico   | Registra incidente tecnológico, diagnóstico o solución              |
| `ETQ`  | Etiqueta o rótulo | Identifica producto, ubicación, recipiente, activo o destino        |
| `REP`  | Reporte           | Consolida datos, resultados, estados o indicadores                  |
| `EVI`  | Evidencia         | Fotografía, captura, archivo o soporte auxiliar                     |

##### 3.2. Medio actual

| Código       | Medio                                                                                       |
| ------------ | ------------------------------------------------------------------------------------------- |
| `PAPEL`      | Documento físico manuscrito o impreso                                                       |
| `EXCEL`      | Libro, hoja o formato de Excel                                                              |
| `IMAGEN`     | Fotografía o captura de pantalla                                                            |
| `WHATSAPP`   | Mensaje, archivo o conversación                                                             |
| `MAKOS`      | Registro o salida del POS                                                                   |
| `VISO`       | Registro o reporte administrativo                                                           |
| `ANIMA`      | Registro laboral del trabajador                                                             |
| `SHOPIFY`    | Registro comercial de Vaila Vainilla                                                        |
| `RAPPI`      | Pedido o estado de plataforma externa                                                       |
| `MANYCHAT`   | Conversación o pedido directo                                                               |
| `CONTABLE`   | Registro del sistema contable                                                               |
| `BANCO`      | Registro o archivo de plataforma bancaria                                                   |
| `RED_SOCIAL` | Publicación, mensaje o formulario externo                                                   |
| `TELEFONO`   | Nota, lista o archivo local                                                                 |
| `TABLERO`    | Registro temporal en pizarra o superficie física                                            |
| `VERBAL`     | Información sin artefacto persistente; se registra solo para evidenciar ausencia documental |

##### 3.3. Función dentro del proceso

| Código         | Función                                      |
| -------------- | -------------------------------------------- |
| `INICIA`       | Origina el proceso                           |
| `INSTRUYE`     | Comunica qué debe ejecutarse                 |
| `EJECUTA`      | Se utiliza durante la ejecución              |
| `CONTROLA`     | Permite verificar o comparar                 |
| `TRANSFIERE`   | Acompaña el traspaso entre actores o áreas   |
| `CONFIRMA`     | Evidencia aceptación o terminación           |
| `FACTURA`      | Formaliza una venta o compra                 |
| `CONCILIA`     | Permite comparar fuentes o cantidades        |
| `AUDITA`       | Permite reconstruir la operación             |
| `ARCHIVA`      | Conserva evidencia histórica                 |
| `NOTIFICA`     | Comunica un evento o novedad                 |
| `CONTINGENCIA` | Sustituye temporalmente un sistema o proceso |

##### 3.4. Estado de evidencia

| Estado               | Significado                                              |
| -------------------- | -------------------------------------------------------- |
| `CONFIRMADO`         | Existencia y uso actual suficientemente descritos        |
| `CONFIRMADO_PARCIAL` | Existe, pero faltan campos, custodio, vigencia o alcance |
| `TRANSITORIO`        | Utilizado durante pruebas o coexistencia                 |
| `PROBABLE`           | Razonablemente esperado, pero no confirmado              |
| `POR_VALIDAR`        | Requiere confirmación en `OPS-AUD-015`                   |
| `AUSENTE`            | El proceso ocurre sin artefacto persistente conocido     |
| `NO_APLICA`          | No corresponde al proceso actual                         |

---

#### 4. Contrato mínimo de inventario

Cada artefacto deberá poder describirse posteriormente con los siguientes campos mínimos:

| Campo                  | Descripción                           |
| ---------------------- | ------------------------------------- |
| `artifact_code`        | Código provisional de este inventario |
| `artifact_name`        | Nombre operativo conocido             |
| `artifact_family`      | Familia documental                    |
| `process_reference`    | Proceso donde participa               |
| `company_or_brand`     | Empresa, marca o unidad               |
| `site`                 | Sede o punto operativo                |
| `area`                 | Área responsable o usuaria            |
| `medium`               | Papel, Excel, sistema, imagen u otro  |
| `created_by`           | Actor que lo genera                   |
| `received_by`          | Actor que lo recibe                   |
| `purpose`              | Función del artefacto                 |
| `source_data`          | Origen de la información              |
| `current_fields_known` | Datos observados o confirmados        |
| `status`               | Estado de evidencia                   |
| `custody`              | Responsable o lugar de conservación   |
| `downstream_use`       | Uso posterior                         |
| `validation_task`      | Tarea exacta que valida pendientes    |
| `gap_task`             | Tarea exacta que recibe la brecha     |

Este contrato no constituye todavía una tabla, interfaz ni esquema físico.

---

#### 5. Inventario maestro de artefactos

| Código    | Artefacto                                                  | Familia             | Medio                                         | Proceso principal                     | Estado                    |
| --------- | ---------------------------------------------------------- | ------------------- | --------------------------------------------- | ------------------------------------- | ------------------------- |
| `ART-001` | Solicitud de remisión por área o sede                      | `SOL`, `REM`        | `EXCEL`                                       | Abastecimiento interno                | `CONFIRMADO`              |
| `ART-002` | Captura o fotografía de la solicitud de remisión           | `REM`, `EVI`        | `IMAGEN`, `WHATSAPP`                          | Envío de solicitud                    | `CONFIRMADO`              |
| `ART-003` | Hoja física de remisión paralela                           | `REM`               | `PAPEL`                                       | Prueba y contingencia de remisiones   | `TRANSITORIO`             |
| `ART-004` | Consolidado manual por área productiva                     | `PRD`, `REP`        | `TABLERO`, `TELEFONO`                         | Planificación inmediata de producción | `CONFIRMADO_PARCIAL`      |
| `ART-005` | Reporte o mensaje de producción terminada                  | `PRD`, `REP`, `EVI` | `WHATSAPP`, `IMAGEN`                          | Supervisión de producción             | `CONFIRMADO`              |
| `ART-006` | Aviso de producto extra                                    | `PRD`, `EVI`        | `WHATSAPP`, `IMAGEN`                          | Redistribución o despacho             | `CONFIRMADO`              |
| `ART-007` | Aviso o explicación de faltante                            | `PRD`, `REM`, `EVI` | `WHATSAPP`, `VERBAL`                          | Gestión de parciales                  | `CONFIRMADO_PARCIAL`      |
| `ART-008` | Lista de compra consolidada                                | `SOL`, `ORD`        | `EXCEL`, `WHATSAPP`, `TELEFONO`               | Compras                               | `CONFIRMADO_PARCIAL`      |
| `ART-009` | Pedido enviado al proveedor                                | `ORD`               | `WHATSAPP`                                    | Compra a proveedor                    | `CONFIRMADO`              |
| `ART-010` | Confirmación del proveedor                                 | `ORD`, `EVI`        | `WHATSAPP`                                    | Disponibilidad, precio y fecha        | `CONFIRMADO`              |
| `ART-011` | Factura o remisión del proveedor                           | `REC`, `FIN`        | `PAPEL`                                       | Recepción y Contabilidad              | `CONFIRMADO`              |
| `ART-012` | Copia firmada de recepción                                 | `REC`, `EVI`        | `PAPEL`                                       | Aceptación de entrega                 | `CONFIRMADO`              |
| `ART-013` | Soporte contable de compra o gasto                         | `FIN`, `EVI`        | `PAPEL`, `CONTABLE`                           | Registro contable                     | `CONFIRMADO`              |
| `ART-014` | Hoja manual de mermas                                      | `INV`, `EVI`        | `PAPEL`                                       | Baja física de producto               | `CONFIRMADO`              |
| `ART-015` | Conteo inicial de inventario                               | `INV`, `REP`        | Vento OS / tablet                             | Piloto de inventario                  | `CONFIRMADO`              |
| `ART-016` | Registro experimental de retiro                            | `INV`               | Vento OS / kiosco                             | Salida de Bodega                      | `CONFIRMADO`              |
| `ART-017` | Cierre impreso de Makos                                    | `FIN`, `REP`        | `MAKOS`, `PAPEL`                              | Cierre y entrega de efectivo          | `CONFIRMADO`              |
| `ART-018` | Registro de apertura de caja                               | `FIN`               | `MAKOS`                                       | Inicio de turno de Caja               | `CONFIRMADO`              |
| `ART-019` | Resumen no fiscal de cuenta                                | `VEN`, `REP`        | `MAKOS`, `PAPEL`                              | Presentación de cuenta al cliente     | `CONFIRMADO`              |
| `ART-020` | Factura legal de venta                                     | `VEN`, `FIN`        | `MAKOS`, `PAPEL`                              | Cierre de venta                       | `CONFIRMADO`              |
| `ART-021` | Comanda de Cocina                                          | `VEN`, `ORD`        | `MAKOS`, `PAPEL`                              | Preparación en Cocina                 | `CONFIRMADO`              |
| `ART-022` | Comanda de Bar                                             | `VEN`, `ORD`        | `MAKOS`, `PAPEL`                              | Preparación caliente                  | `CONFIRMADO`              |
| `ART-023` | Comanda de Barra                                           | `VEN`, `ORD`        | `MAKOS`, `PAPEL`                              | Preparación fría                      | `CONFIRMADO`              |
| `ART-024` | Pedido de mesa en Makos                                    | `VEN`, `ORD`        | `MAKOS`                                       | Servicio de salón                     | `CONFIRMADO`              |
| `ART-025` | Pedido Rappi                                               | `VEN`, `ORD`        | `RAPPI`                                       | Venta por plataforma                  | `CONFIRMADO`              |
| `ART-026` | Pedido transcrito como Rappi en Makos                      | `VEN`, `ORD`        | `MAKOS`                                       | Ejecución interna del pedido          | `CONFIRMADO`              |
| `ART-027` | Conversación o pedido por ManyChat                         | `VEN`, `SOL`        | `MANYCHAT`                                    | Venta directa y domicilio             | `CONFIRMADO`              |
| `ART-028` | Pedido transcrito como Domicilio en Makos                  | `VEN`, `ORD`        | `MAKOS`                                       | Ejecución interna del domicilio       | `CONFIRMADO`              |
| `ART-029` | Datos de cliente para domicilio                            | `VEN`, `LOG`        | `MANYCHAT`, `MAKOS`, `WHATSAPP`               | Entrega a cliente                     | `CONFIRMADO_PARCIAL`      |
| `ART-030` | Comprobante de transferencia del cliente                   | `FIN`, `EVI`        | `IMAGEN`, `BANCO`, `WHATSAPP`                 | Confirmación de pago                  | `CONFIRMADO_PARCIAL`      |
| `ART-031` | Registro de pago con datáfono                              | `FIN`, `EVI`        | Datáfono / Makos                              | Pago con tarjeta                      | `CONFIRMADO_PARCIAL`      |
| `ART-032` | Pedido Shopify                                             | `VEN`, `ORD`        | `SHOPIFY`                                     | Venta Vaila Vainilla                  | `CONFIRMADO`              |
| `ART-033` | Guía o etiqueta de envío Vaila Vainilla                    | `LOG`, `ETQ`        | Plataforma o impresión                        | Despacho de venta en línea            | `POR_VALIDAR`             |
| `ART-034` | Confirmación o notificación al cliente Vaila Vainilla      | `VEN`, `LOG`, `EVI` | `SHOPIFY`, `WHATSAPP`, correo u otro          | Seguimiento de envío                  | `POR_VALIDAR`             |
| `ART-035` | Horario publicado                                          | `LAB`, `REP`        | `VISO`                                        | Programación laboral                  | `CONFIRMADO`              |
| `ART-036` | Notificación y consulta de turno                           | `LAB`, `EVI`        | `ANIMA`                                       | Comunicación al trabajador            | `CONFIRMADO`              |
| `ART-037` | Registro de check-in                                       | `LAB`, `EVI`        | `ANIMA`                                       | Asistencia                            | `CONFIRMADO`              |
| `ART-038` | Reporte de asistencia                                      | `LAB`, `REP`        | `VISO`                                        | Revisión de retrasos y ausencias      | `CONFIRMADO`              |
| `ART-039` | Cálculo manual de propinas                                 | `LAB`, `FIN`, `REP` | Herramienta no confirmada                     | Liquidación de propinas               | `CONFIRMADO_PARCIAL`      |
| `ART-040` | Archivo o carga de nómina                                  | `LAB`, `FIN`        | `BANCO`                                       | Pago de nómina formal                 | `CONFIRMADO`              |
| `ART-041` | Hoja de vida                                               | `LAB`, `EVI`        | `RED_SOCIAL`, correo, archivo digital o papel | Reclutamiento                         | `CONFIRMADO_PARCIAL`      |
| `ART-042` | Registro de entrevista o evaluación de prueba              | `LAB`, `REP`        | `VERBAL` o medio no confirmado                | Selección                             | `AUSENTE` / `POR_VALIDAR` |
| `ART-043` | Contrato y documentos laborales                            | `LAB`, `EVI`        | Abogados / papel / digital                    | Formalización                         | `CONFIRMADO_PARCIAL`      |
| `ART-044` | Solicitud de creación de acceso                            | `LAB`, `TEC`        | `WHATSAPP`, `VERBAL`                          | Alta de ANIMA y Vento OS              | `CONFIRMADO_PARCIAL`      |
| `ART-045` | Solicitud de baja de acceso                                | `LAB`, `TEC`        | No existe flujo formal                        | Retiro laboral                        | `AUSENTE`                 |
| `ART-046` | Solicitud de contenido de Marketing                        | `MKT`, `SOL`        | `WHATSAPP`, `VERBAL`                          | Producción de contenido               | `CONFIRMADO`              |
| `ART-047` | Pieza de historia                                          | `MKT`, `EVI`        | `RED_SOCIAL` / archivo digital                | Publicación temporal                  | `CONFIRMADO`              |
| `ART-048` | Pieza de publicación permanente                            | `MKT`, `EVI`        | `RED_SOCIAL` / archivo digital                | Publicación permanente                | `CONFIRMADO`              |
| `ART-049` | Aprobación de publicación permanente                       | `MKT`, `EVI`        | `WHATSAPP`, `VERBAL` u otro                   | Autorización de publicación           | `CONFIRMADO_PARCIAL`      |
| `ART-050` | Reporte de incidente tecnológico                           | `TEC`, `SOL`        | `WHATSAPP`, `VERBAL`                          | Soporte técnico                       | `CONFIRMADO`              |
| `ART-051` | Registro de diagnóstico y solución técnica                 | `TEC`, `REP`        | No existe registro consolidado                | Historial de soporte                  | `AUSENTE`                 |
| `ART-052` | Reporte de falla de infraestructura o equipo               | `MNT`, `SOL`        | `WHATSAPP`, `VERBAL`, `IMAGEN`                | Mantenimiento correctivo              | `CONFIRMADO_PARCIAL`      |
| `ART-053` | Factura o comprobante de reparación                        | `MNT`, `FIN`, `EVI` | `PAPEL`                                       | Soporte contable                      | `PROBABLE`                |
| `ART-054` | Etiqueta o rótulo de producto o estante                    | `ETQ`, `INV`        | `PAPEL` / adhesivo / marcación                | Ubicación visual                      | `CONFIRMADO_PARCIAL`      |
| `ART-055` | Identificación de canasta por marca o propietario          | `ETQ`, `LOG`, `INV` | Rótulo físico                                 | Gestión visual de canastas            | `CONFIRMADO`              |
| `ART-056` | Registro de lavado o estado de canasta                     | `LOG`, `REP`        | No existe                                     | Limpieza y disponibilidad             | `AUSENTE`                 |
| `ART-057` | Registro de transferencia de producto a Molka              | `INV`, `LOG`        | `VERBAL`                                      | Reasignación de producto              | `AUSENTE`                 |
| `ART-058` | Registro de fecha, lote o vida útil de producto reasignado | `INV`, `ETQ`        | No existe                                     | Control de vencimiento                | `AUSENTE`                 |
| `ART-059` | Registro de recepción en sede                              | `REC`, `REM`        | Conteo físico y comunicación informal         | Confirmación de entrega               | `CONFIRMADO_PARCIAL`      |
| `ART-060` | Registro de diferencia de recepción                        | `REC`, `REM`, `EVI` | `VERBAL`, `WHATSAPP` o inexistente            | Reclamo de faltante                   | `CONFIRMADO_PARCIAL`      |

---

#### 6. Solicitudes y remisiones internas

##### 6.1. Solicitud de remisión por sede o área — `ART-001`

La solicitud se crea actualmente en Excel.

Emisores conocidos:

- Caja o Servicio de Vento Café;
- Cocina de Vento Café;
- Barra de Vento Café;
- responsable de Saudo;
- responsable de Molka.

Distribución conocida:

```text
VENTO CAFÉ
├── Servicio
├── Cocina
└── Barra

SAUDO
└── solicitud unificada

MOLKA
└── solicitud unificada
```

Datos observados o inferidos con suficiente base:

- productos;
- cantidades solicitadas;
- sede o área solicitante;
- momento de envío;
- presentación o unidad utilizada según el producto.

Datos todavía no confirmados:

- identificador único;
- fecha requerida;
- solicitante individual;
- versión;
- estado;
- prioridad;
- observaciones estructuradas;
- motivo;
- sustituciones;
- cantidad confirmada;
- cantidad producida;
- cantidad despachada;
- cantidad recibida.

Los campos exactos deben validarse mediante `OPS-AUD-015`.

##### 6.2. Captura de la solicitud — `ART-002`

La captura o fotografía suele convertirse en el artefacto que realmente recibe producción.

Consecuencias:

- pierde fórmulas y validaciones del Excel;
- no permite distinguir fácilmente versión anterior y final;
- no es consultable por producto;
- no conserva IDs;
- puede ser recortada;
- depende de legibilidad;
- no se actualiza si cambia el archivo original.

La divergencia entre archivo y captura deberá documentarse en `OPS-AUD-012`.

##### 6.3. Remisión física transitoria — `ART-003`

La hoja física se ha utilizado en paralelo durante pruebas para evitar que una falla del sistema afecte la operación.

Estado:

- no se declara como documento permanente;
- no se presume vigente en todas las sedes;
- su formato exacto queda pendiente;
- su relación con Excel y Vento OS deberá validarse.

Destino: `OPS-AUD-015`.

##### 6.4. Recepción y diferencias — `ART-059` y `ART-060`

En la sede, la persona responsable del área o su delegado recibe, cuenta y guarda.

No existe un artefacto estructurado confirmado que registre:

- quién recibió;
- hora;
- cantidad recibida;
- diferencia;
- estado del producto;
- rechazo;
- observación;
- evidencia;
- cierre de la remisión.

Cuando falta producto, la sede lo descubre y consulta posteriormente.

Esto no se resuelve en esta tarea; deberá detallarse en `OPS-AUD-007`, `OPS-AUD-008` y `OPS-AUD-013`.

---

#### 7. Artefactos de producción

##### 7.1. Consolidado por área — `ART-004`

Las áreas productivas agregan cantidades de varias sedes.

El consolidado puede quedar:

- en tablero;
- en teléfono;
- en memoria;
- en una nota temporal.

No se confirmó un formato único.

Riesgos:

- ausencia de versión;
- falta de vínculo con cada solicitud;
- totales sin desglose;
- modificación sin evidencia;
- pérdida al borrar el tablero o la nota.

##### 7.2. Reporte de producción terminada — `ART-005`

El equipo publica cantidades finales en un grupo, principalmente para supervisión.

El conductor no utiliza necesariamente ese reporte para el despacho; cuenta físicamente.

Por tanto:

```text
REPORTE DIGITAL
≠
FUENTE OPERATIVA DEL DESPACHO
```

La diferencia entre producción reportada, producto disponible y producto cargado deberá tratarse en `OPS-AUD-012`.

##### 7.3. Productos extra y faltantes — `ART-006` y `ART-007`

Los productos extra pueden informarse mediante fotografía o mensaje.

Los faltantes no siempre se informan preventivamente.

No existe una razón estructurada confirmada.

Causas conocidas:

- falta de insumos;
- llegada tardía del proveedor;
- tiempo insuficiente;
- limitación técnica;
- producción no alcanzada.

La clasificación definitiva de motivos corresponde a `OPS-AUD-008`.

---

#### 8. Artefactos de compra y recepción

##### 8.1. Lista de compra — `ART-008`

La gerente general reúne necesidades a partir de:

- avisos de faltantes;
- preguntas a las áreas;
- experiencia;
- urgencia.

No se confirmó un formato único.

Puede existir como:

- lista en WhatsApp;
- nota;
- Excel;
- consolidación mental.

Campos no confirmados:

- producto canónico;
- presentación;
- cantidad solicitada;
- existencias;
- consumo esperado;
- proveedor;
- precio objetivo;
- prioridad;
- fecha requerida;
- aprobación.

##### 8.2. Pedido al proveedor — `ART-009`

El pedido se envía normalmente por WhatsApp.

Puede contener:

- producto;
- cantidad;
- presentación;
- sede de entrega;
- fecha;
- observación.

No existe una orden de compra formal confirmada con:

- número;
- versión;
- estado;
- aprobador;
- total esperado;
- impuestos;
- centro de costo;
- condiciones de pago.

La ausencia de una orden formal no implica que deba crearse todavía una estructura TO-BE; esa decisión dependerá del diseño posterior.

##### 8.3. Confirmación del proveedor — `ART-010`

El proveedor responde disponibilidad, cantidades, precios y fecha estimada.

La conversación puede modificar el pedido original sin crear una versión consolidada.

La comparación entre:

```text
SOLICITADO
→ CONFIRMADO
→ FACTURADO
→ RECIBIDO
```

deberá analizarse en `OPS-AUD-007`, `OPS-AUD-008` y `OPS-AUD-012`.

##### 8.4. Factura y copia firmada — `ART-011` y `ART-012`

Cuando recibe el Jefe de Operaciones:

- compara físicamente;
- firma;
- entrega una copia;
- conserva otra para Gerencia.

Datos esperables, pero no todos confirmados:

- proveedor;
- fecha;
- número;
- productos;
- cantidades;
- precios;
- impuestos;
- total;
- receptor;
- firma;
- observaciones.

El contenido exacto depende del documento del proveedor y se validará en `OPS-AUD-015`.

---

#### 9. Artefactos de inventario y merma

##### 9.1. Hoja de mermas — `ART-014`

El mismo trabajador puede:

- detectar el daño;
- decidir la baja;
- desechar;
- registrar producto y cantidad.

Campos confirmados:

- producto;
- cantidad.

Campos no confirmados:

- fecha;
- hora;
- sede;
- área;
- lote;
- vencimiento;
- causa;
- estado;
- fotografía;
- responsable;
- aprobador;
- método de disposición;
- costo;
- efecto en inventario.

Los campos no se asumirán como existentes.

##### 9.2. Conteo inicial y retiro experimental — `ART-015` y `ART-016`

El piloto registró:

- conteo inicial;
- retiros posteriores.

No registró integralmente:

- recepciones;
- producción terminada;
- transferencias;
- devoluciones;
- ajustes;
- mermas;
- conversiones.

El artefacto digital perdió confiabilidad en pocos días.

Este hallazgo deberá alimentar `OPS-AUD-012` y `OPS-AUD-013`.

##### 9.3. Reasignación a Molka — `ART-057` y `ART-058`

Los productos menos frescos, pero todavía consumibles, pueden enviarse a Molka.

La decisión se comunica verbalmente.

No existe artefacto confirmado para:

- origen;
- destino;
- producto;
- cantidad;
- fecha;
- vida útil restante;
- lote;
- causa;
- responsable;
- aceptación;
- efecto sobre inventarios.

La ausencia queda registrada y deberá profundizarse en `OPS-AUD-007`, `OPS-AUD-008` y `OPS-AUD-013`.

---

#### 10. Artefactos de venta y Caja

##### 10.1. Apertura y cierre — `ART-018` y `ART-017`

Makos registra la apertura de Caja y genera el cierre impreso.

El cierre se utiliza para:

- comparar efectivo;
- separar turnos;
- entregar excedente a Gerencia;
- respaldar el recaudo.

No se confirmó:

- firma de quien entrega;
- firma de quien recibe;
- registro de diferencia;
- identificación del retiro;
- destino posterior;
- relación con gastos;
- archivo final.

##### 10.2. Resumen y factura — `ART-019` y `ART-020`

**Resumen no fiscal**

- se imprime antes del pago;
- puede imprimirlo un trabajador de Servicio;
- informa el valor de la cuenta.

**Factura legal**

- se genera después de registrar el pago;
- la emite Caja;
- se entrega al cliente.

No deben consolidarse como un único artefacto.

##### 10.3. Comandas — `ART-021` a `ART-023`

Vento Café utiliza:

- comanda de Cocina;
- comanda de Bar;
- comanda de Barra.

Datos previsibles:

- mesa;
- productos;
- cantidades;
- observaciones;
- hora;
- número de pedido.

No se confirmará ningún campo específico que no haya sido observado directamente hasta `OPS-AUD-015`.

Saudo cuenta con impresora, pero no utiliza la comanda como artefacto operativo ordinario.

##### 10.4. Pedido registrado — `ART-024`

Makos conserva la mesa y sus pedidos adicionales hasta el pago.

La cuenta puede contener varias rondas.

La cuenta de Servicio es compartida, por lo que el artefacto no identifica necesariamente al mesero efectivo.

---

#### 11. Pedidos externos y domicilios

##### 11.1. Rappi — `ART-025` y `ART-026`

Existen dos registros del mismo pedido:

```text
PEDIDO ORIGINAL EN RAPPI
→ TRANSCRIPCIÓN EN MAKOS
```

El pedido de Makos se clasifica como Rappi.

Los campos y diferencias deberán compararse en `OPS-AUD-012`.

##### 11.2. ManyChat — `ART-027` y `ART-028`

La conversación o pedido directo contiene información que Caja transcribe como Domicilio en Makos.

Posibles datos:

- nombre;
- dirección;
- teléfono;
- productos;
- método de pago;
- observaciones.

Solo se considerarán confirmados después de revisar el formato real en `OPS-AUD-015`.

##### 11.3. Pago y mensajería — `ART-029` a `ART-031`

En domicilios pueden existir:

- datos de contacto;
- comprobante de transferencia;
- indicación de pago anticipado o efectivo;
- factura;
- instrucciones verbales al mensajero.

No existe un comprobante estructurado confirmado que conecte:

```text
PEDIDO
→ PAGO
→ MENSAJERO
→ ENTREGA
→ CIERRE
```

El flujo corresponde a `OPS-AUD-007`.

---

#### 12. Vaila Vainilla

##### 12.1. Pedido Shopify — `ART-032`

Shopify registra el pedido comercial.

Campos concretos deberán validarse con Jeo o la responsable.

##### 12.2. Guía, etiqueta y notificación — `ART-033` y `ART-034`

La operación utiliza mensajería externa, pero no se confirmó:

- quién genera la guía;
- plataforma utilizada;
- impresión de etiqueta;
- asociación con el pedido;
- número de seguimiento;
- notificación al cliente;
- prueba de entrega;
- devolución.

Todos quedan vinculados a `OPS-AUD-015`.

---

#### 13. Artefactos laborales

##### 13.1. Horario — `ART-035` y `ART-036`

Gerencia publica en VISO y el trabajador consulta en ANIMA.

El artefacto digital comunica:

- turno;
- sede;
- horario;
- otros datos operativos disponibles.

No existe aceptación del trabajador.

##### 13.2. Check-in y reporte — `ART-037` y `ART-038`

El check-in constituye el registro oficial de asistencia.

Gerencia descarga un reporte de:

- retrasos;
- ausencias;
- novedades disponibles.

El detalle exacto del reporte debe revisarse en `OPS-AUD-015`.

##### 13.3. Propinas — `ART-039`

La gerente general calcula manualmente promedios y ajustes.

No existe un artefacto canónico confirmado que muestre por trabajador:

- valor base;
- criterio;
- días;
- retrasos;
- descuentos;
- motivo;
- aprobación;
- valor final;
- entrega;
- firma o aceptación.

Se registra como `CONFIRMADO_PARCIAL`.

##### 13.4. Nómina — `ART-040`

La nómina formal se carga en Bancolombia Nóminas.

No se documenta en esta tarea la estructura del archivo bancario.

##### 13.5. Selección y contratación — `ART-041` a `ART-043`

Existen hojas de vida y contratos.

No existe evidencia de un formato estructurado de:

- entrevista;
- evaluación de prueba;
- decisión;
- capacidades;
- inducción;
- aprobación final.

La evaluación puede ser verbal.

##### 13.6. Altas y bajas de acceso — `ART-044` y `ART-045`

El alta se solicita informalmente.

La baja no tiene un artefacto obligatorio y puede depender de que el Jefe de Operaciones descubra el retiro.

Esta ausencia es crítica y deberá profundizarse en `OPS-AUD-007`, `OPS-AUD-009`, `OPS-AUD-011` y `OPS-AUD-013`.

---

#### 14. Artefactos de Marketing

##### 14.1. Solicitud de contenido — `ART-046`

Puede llegar por WhatsApp o verbalmente.

No existe formato confirmado con:

- marca;
- objetivo;
- audiencia;
- canal;
- formato;
- fecha;
- prioridad;
- referencia;
- responsable;
- aprobación.

##### 14.2. Pieza y aprobación — `ART-047` a `ART-049`

Las historias suelen publicarse sin aprobación previa.

Las publicaciones permanentes requieren aprobación de Nathalia o Jeo.

La aprobación puede quedar:

- en WhatsApp;
- verbalmente;
- implícita.

El método exacto deberá validarse en `OPS-AUD-015`.

---

#### 15. Soporte técnico y mantenimiento

##### 15.1. Incidente tecnológico — `ART-050` y `ART-051`

El reporte llega por WhatsApp o verbalmente.

No existe un registro consolidado posterior.

Por tanto, faltan artefactos persistentes de:

- ticket;
- activo;
- sede;
- prioridad;
- diagnóstico;
- causa;
- solución;
- repuesto;
- tiempo;
- evidencia;
- cierre.

La ausencia se asigna a `OPS-AUD-013`.

##### 15.2. Mantenimiento correctivo — `ART-052` y `ART-053`

La falla se comunica a la gerente general.

Es probable que exista factura o comprobante del técnico, pero no se confirmó el circuito.

Destino: `OPS-AUD-015`.

---

#### 16. Etiquetas, rótulos y marcaciones

##### 16.1. Producto o estante — `ART-054`

El conductor ubica productos mediante experiencia, visualización y marcaciones existentes.

No se confirmó:

- formato;
- código;
- responsable;
- fecha;
- actualización;
- relación con ubicación canónica;
- material;
- impresora.

##### 16.2. Canastas — `ART-055`

Existen canastas identificadas visualmente por:

- Vento;
- Saudo;
- proveedores o marcas como Colanta;
- color, forma o etiqueta.

La identificación no constituye un sistema de custodia ni seguimiento.

##### 16.3. Estado de lavado — `ART-056`

No existe etiqueta o registro que diferencie:

- sucia;
- pendiente;
- lavada;
- húmeda;
- seca;
- disponible;
- asignada;
- en ruta.

El conductor verifica visualmente.

##### 16.4. Lotes y vida útil — `ART-058`

Los productos reasignados a Molka no llevan una etiqueta confirmada de:

- fecha;
- origen;
- lote;
- vida útil;
- vencimiento.

La necesidad futura de etiquetado no se diseña aquí. La brecha será vinculada por `GAP-CTRL-006` con la tarea funcional exacta correspondiente y deberá considerar `OPS-TRZ-001`.

---

#### 17. Reportes actuales identificados

| Código    | Reporte                  | Fuente                | Uso                                |
| --------- | ------------------------ | --------------------- | ---------------------------------- |
| `REP-001` | Cierre de Caja           | Makos                 | Conciliación y entrega de efectivo |
| `REP-002` | Producción final         | Mensaje o fotografía  | Supervisión                        |
| `REP-003` | Reporte de asistencia    | VISO                  | Retrasos y ausencias               |
| `REP-004` | Reportes administrativos | Excel / Makos         | Gerencia y Contabilidad            |
| `REP-005` | Reporte contable         | Sistema contable      | Gestión financiera y tributaria    |
| `REP-006` | Estado de pedido         | Rappi                 | Operación del canal                |
| `REP-007` | Estado de pedido         | Shopify               | Operación Vaila Vainilla           |
| `REP-008` | Conteo inicial           | Vento OS experimental | Piloto de inventario               |
| `REP-009` | Registro de retiros      | Kiosco experimental   | Piloto de inventario               |
| `REP-010` | Reporte de propinas      | No confirmado         | Liquidación manual                 |

No se asume que todos sean exportables, archivados o utilizados sistemáticamente.

---

#### 18. Artefactos ausentes relevantes

La ausencia de un artefacto también constituye un hallazgo.

| Código    | Artefacto ausente                                         | Consecuencia                                            |
| --------- | --------------------------------------------------------- | ------------------------------------------------------- |
| `AUS-001` | Confirmación estructurada de remisión recibida            | No se prueba recepción completa                         |
| `AUS-002` | Registro de faltante antes del despacho                   | La sede descubre la diferencia tarde                    |
| `AUS-003` | Transferencia de producto entre sedes                     | Inventario y responsabilidad no trazables               |
| `AUS-004` | Registro de canastas                                      | No se conoce custodia, estado o ubicación               |
| `AUS-005` | Alta y baja formal de accesos                             | Riesgo de cuentas activas                               |
| `AUS-006` | Ticket de soporte técnico                                 | Se pierde historial                                     |
| `AUS-007` | Registro de mantenimiento por activo                      | No existe historial preventivo o correctivo consolidado |
| `AUS-008` | Evaluación estructurada de período de prueba              | Decisión laboral no reconstruible                       |
| `AUS-009` | Liquidación trazable de propina                           | No se prueba cálculo ni descuento                       |
| `AUS-010` | Aprobación estructurada de Marketing                      | Criterio y decisión ambiguos                            |
| `AUS-011` | Estado de producto preparado: listo, recogido y entregado | No existe trazabilidad de servicio                      |
| `AUS-012` | Estado de canasta lavada o disponible                     | Uso depende de revisión visual                          |
| `AUS-013` | Etiqueta de fecha/lote/origen en reasignaciones           | Riesgo de vencimiento y pérdida de origen               |

Estas ausencias se profundizarán en `OPS-AUD-007` a `OPS-AUD-015` y serán consolidadas en `GAP-CTRL-001`.

---

#### 19. Matriz de duplicación documental

| Información           | Artefactos duplicados o paralelos                                          |
| --------------------- | -------------------------------------------------------------------------- |
| Solicitud de remisión | Excel + captura + WhatsApp + posible hoja física + Vento OS                |
| Pedido Rappi          | Rappi + Makos                                                              |
| Pedido directo        | ManyChat + Makos                                                           |
| Venta                 | Makos + resumen + factura                                                  |
| Caja                  | Makos + cierre impreso + efectivo + sistema contable                       |
| Compra                | Lista informal + WhatsApp proveedor + factura + sistema contable           |
| Producción            | Captura de remisión + tablero/teléfono + reporte por grupo + conteo físico |
| Asistencia            | VISO + ANIMA + reporte descargado + cálculo manual                         |
| Inventario piloto     | Conteo inicial + retiros, sin resto de movimientos                         |
| Mantenimiento         | WhatsApp/verbal + factura probable, sin historial                          |
| Accesos               | Solicitud informal + creación manual, sin baja formal                      |

La duplicación y conciliación pertenecen a `OPS-AUD-012`.

---

#### 20. Hallazgos transversales

##### 20.1. El artefacto que inicia no siempre es el que ejecuta

Ejemplo:

```text
EXCEL
→ CAPTURA
→ WHATSAPP
→ TABLERO O TELÉFONO
→ CONTEO FÍSICO
```

El proceso cambia de soporte varias veces.

##### 20.2. Varios artefactos no tienen identificador común

No existe una clave confirmada que conecte:

- solicitud;
- producción;
- despacho;
- recepción;
- faltante;
- movimiento de inventario;
- factura;
- pago.

##### 20.3. La firma física no equivale a trazabilidad integral

Una factura firmada puede confirmar recepción general, pero no necesariamente:

- diferencias;
- condición;
- ubicación;
- responsable final;
- ingreso a inventario;
- carga contable.

##### 20.4. Las imágenes sustituyen datos estructurados

Las capturas facilitan comunicación inmediata, pero eliminan capacidad de:

- validar;
- buscar;
- relacionar;
- calcular;
- versionar;
- auditar automáticamente.

##### 20.5. Existen artefactos críticos ausentes

Las ausencias más sensibles afectan:

- acceso de trabajadores;
- inventario;
- remisiones;
- mermas;
- dinero;
- soporte técnico;
- mantenimiento;
- propinas.

##### 20.6. El diseño futuro deberá distinguir documento, registro y evento

```text
DOCUMENTO
→ representación legible

REGISTRO
→ dato persistente

EVENTO
→ hecho ocurrido

EVIDENCIA
→ prueba asociada
```

No deberán tratarse como equivalentes.

---

#### 21. Matriz de destino de hallazgos

| Hallazgo                                                   | Tarea exacta   |
| ---------------------------------------------------------- | -------------- |
| Secuencia de creación, uso y cierre                        | `OPS-AUD-007`  |
| Corrección, anulación, reimpresión, devolución y reversión | `OPS-AUD-008`  |
| Firma, aprobación, custodio y segregación                  | `OPS-AUD-009`  |
| Frecuencia, cantidad, tamaño y retención operativa         | `OPS-AUD-010`  |
| Traspasos entre sedes, áreas, herramientas y terceros      | `OPS-AUD-011`  |
| Duplicación entre artefactos y conciliación                | `OPS-AUD-012`  |
| Falta de ID, actor, versión, estado y custodia             | `OPS-AUD-013`  |
| Artefactos de contingencia y operación offline             | `OPS-AUD-014`  |
| Campos, formatos, cuentas y usos no confirmados            | `OPS-AUD-015`  |
| Consolidación retrospectiva de brechas                     | `GAP-CTRL-001` |
| Vinculación con tareas y paquetes futuros                  | `GAP-CTRL-006` |
| Etiquetado y trazabilidad operativa                        | `OPS-TRZ-001`  |

---

#### 22. Decisiones propuestas

1. El inventario incluye documentos físicos, registros digitales, imágenes, reportes y ausencias documentales relevantes.
2. La solicitud de remisión en Excel y su captura se consideran artefactos distintos.
3. La remisión física paralela se clasifica como transitoria.
4. El consolidado productivo en tablero o teléfono no se considera registro empresarial confiable.
5. Los mensajes de producción final no sustituyen el conteo de despacho.
6. El pedido de proveedor por WhatsApp no equivale a una orden de compra formal.
7. La factura del proveedor y la copia firmada cumplen funciones diferentes.
8. La hoja de mermas es actualmente una fuente primaria manual.
9. El cierre, el resumen y la factura de Makos son artefactos distintos.
10. Las comandas se inventarían por estación.
11. El pedido original de Rappi y su transcripción en Makos son registros duplicados.
12. La conversación de ManyChat y el pedido Domicilio de Makos son registros distintos.
13. El check-in de ANIMA y el reporte de VISO no sustituyen la liquidación de propinas.
14. El alta de accesos tiene una solicitud informal; la baja carece de artefacto obligatorio.
15. Soporte técnico y mantenimiento carecen de historial estructurado.
16. Las canastas tienen identificación visual, pero no trazabilidad.
17. Las transferencias informales de producto a Molka carecen de registro y etiqueta de origen o vida útil.
18. Los artefactos no confirmados permanecen vinculados a `OPS-AUD-015`.
19. Ningún artefacto AS-IS se adopta automáticamente como formulario TO-BE.
20. Ninguna decisión autoriza creación de tablas, pantallas, integraciones, impresiones, código, migraciones o cambios en Supabase.

---

#### 23. Criterios de aceptación

`OPS-AUD-006` podrá aprobarse cuando se confirme que:

- existe un inventario estructurado de formularios, remisiones, órdenes, etiquetas, comprobantes y reportes;
- los artefactos están clasificados por familia, medio, función y evidencia;
- se cubren solicitudes, producción, compras, inventario, venta, domicilios, trabajo, Marketing, soporte, mantenimiento y etiquetas;
- se distinguen documentos físicos, registros digitales, imágenes y artefactos ausentes;
- se separan artefactos duplicados;
- no se presentan campos inferidos como confirmados;
- cada incertidumbre tiene destino en `OPS-AUD-015`;
- cada brecha tiene destino exacto;
- no se ha diseñado el flujo detallado de `OPS-AUD-007`;
- no se han definido aprobaciones de `OPS-AUD-009`;
- no se ha diseñado el modelo TO-BE;
- no se ha autorizado implementación.

---

#### 24. Resultado y continuidad

Con la aprobación de `OPS-AUD-006` quedará establecida la línea base inicial de:

- solicitudes;
- remisiones;
- órdenes;
- documentos de recepción;
- facturas y comprobantes;
- artefactos de producción;
- registros de inventario y merma;
- documentos de venta;
- pedidos externos;
- reportes laborales;
- documentos de Marketing;
- soportes de mantenimiento;
- etiquetas y rótulos;
- reportes actuales;
- artefactos ausentes;
- duplicaciones documentales.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-AUD-007
— Documentar flujo ordinario de cada proceso
```

`OPS-AUD-007` deberá utilizar este inventario para describir cómo cada artefacto nace, cambia de actor, cambia de herramienta, produce un efecto y termina, sin diseñar todavía el proceso TO-BE.
