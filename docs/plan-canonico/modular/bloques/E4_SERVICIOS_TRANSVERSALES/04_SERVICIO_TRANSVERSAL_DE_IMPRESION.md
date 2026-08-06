### SERVICIO TRANSVERSAL DE IMPRESIÓN

### ✅ PRINT-ARC-001 — Inventariar impresoras por empresa, sede, área y punto operativo

**Estado:** APROBADA  
**Tarea anterior:** `INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones` — APROBADA  
**Tarea siguiente:** `PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión` — RESERVADA  
**Tipo de tarea:** documental; inventario operativo, clasificación organizacional, ubicación funcional, estado actual, uso observado y custodia de dispositivos de impresión  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`  
**Cambios físicos autorizados:** ninguno; no instala, conecta, reubica, repara, configura ni retira impresoras

**Qué se hace:** consolidar la línea base real de impresoras de Vento Group, Vento Café, Vento Producción, Molka y Saudo, indicando dónde está cada equipo, su estado actual y el punto operativo al que sirve o la razón por la que todavía no tiene uno activo.

---

#### 1. Propósito

Establecer el inventario canónico inicial de dispositivos de impresión que participan o pueden participar en la operación del ecosistema Vento.

La tarea distingue expresamente:

- entidad jurídica o titular operativo;
- marca o establecimiento;
- sede física;
- área operativa;
- punto físico de uso;
- clase general del equipo;
- marca y modelo cuando ya son conocidos;
- estado operativo actual;
- uso actual o intención operativa conocida;
- modalidad de custodia vigente.

El resultado constituye la entrada obligatoria para `PRINT-ARC-002` a `PRINT-ARC-020`.

---

#### 2. Alcance

Esta tarea incluye:

- impresoras operativas;
- impresoras almacenadas para despliegue posterior;
- impresoras que requieren mantenimiento;
- impresoras convencionales de oficina;
- impresoras térmicas POS;
- impresoras especializadas de etiquetas;
- dispositivos sin custodio individual;
- puntos físicos distintos dentro de una misma área operativa.

Esta tarea no define todavía:

- seriales;
- direcciones IP;
- conexión USB, LAN, Bluetooth o Wi-Fi;
- protocolos;
- lenguaje de impresión;
- ancho o tipo de papel;
- resolución;
- velocidad;
- firmware;
- adaptadores;
- plantillas;
- documentos imprimibles completos;
- permisos;
- enrutamiento;
- heartbeat;
- reintentos;
- colas;
- monitoreo;
- reparación o mantenimiento ejecutado.

Esos elementos continúan en las tareas posteriores del servicio transversal de impresión.

---

#### 3. Fuentes consolidadas

La clasificación consume:

- la estructura empresarial, jurídica, comercial y física aprobada en `OPS-AUD-001`;
- la distinción entre Vento Group S.A.S., Vento Café, Vento Producción, Molka y Saudo;
- la clasificación vigente de sedes, áreas, zonas y puntos operativos;
- la confirmación operativa aportada sobre cantidad, ubicación general, estado y uso de los equipos;
- la continuidad aprobada `INT-PROD-005 → PRINT-ARC-001 → PRINT-ARC-002`.

La información no observada físicamente no se completa por inferencia.

---

#### 4. Reglas de clasificación

##### 4.1 Entidad y operación

La entidad o titular se registra conforme al plan vigente:

- Vento Group S.A.S. soporta Vento Café, Vento Producción y la sede administrativa;
- Molka corresponde al establecimiento registrado a nombre de Nathalia Carolina Ibarra Ariza;
- Saudo corresponde al establecimiento registrado a nombre de Jefersson García Urrego.

La dirección administrativa compartida del grupo no elimina la diferencia de titularidad.

##### 4.2 Área y punto operativo

Un área representa una unidad funcional. Un punto operativo identifica el lugar concreto desde el cual se imprime.

Dos dispositivos ubicados en una misma área se mantienen separados cuando atienden estaciones físicas distintas.

En Vento Café:

- `barra` corresponde al punto de bebidas calientes, incluidos cafés;
- `bar` corresponde al punto de bebidas frías;
- ambos son puntos físicos distintos dentro de la misma área operativa de Barra.

##### 4.3 Estado operativo

Se utilizan tres estados actuales:

| Estado                   | Significado                                                                                             |
| ------------------------ | ------------------------------------------------------------------------------------------------------- |
| `OPERATIVA`              | El dispositivo funciona y puede utilizarse actualmente en su punto.                                     |
| `ALMACENADA`             | El dispositivo existe y está resguardado, pero no está desplegado en un punto operativo activo.         |
| `REQUIERE_MANTENIMIENTO` | El dispositivo está identificado, pero no debe considerarse disponible hasta ser reparado y verificado. |

##### 4.4 Custodia

No existe actualmente un custodio individual asignado a cada impresora.

La condición vigente es:

```text
RESPONSABILIDAD OPERATIVA COLECTIVA
→ todos los trabajadores del punto deben cuidar el equipo
→ cualquier novedad debe ser reportada
→ ningún trabajador se considera propietario individual del dispositivo
```

La ausencia de custodio nominal se registra como condición operativa actual y no se sustituye por un nombre supuesto.

---

#### 5. Inventario canónico inicial

|  N.º | Entidad o titular              | Operación o sede                                       | Área                                       | Punto operativo o condición física                                            | Clase / modelo conocido                               | Estado actual            | Uso actual o intención conocida                                      | Custodia vigente                            |
| ---: | ------------------------------ | ------------------------------------------------------ | ------------------------------------------ | ----------------------------------------------------------------------------- | ----------------------------------------------------- | ------------------------ | -------------------------------------------------------------------- | ------------------------------------------- |
|    1 | Vento Group S.A.S.             | Vento Producción — Centro de Producción y Distribución | Producción y distribución                  | Sin punto operativo activo; equipo almacenado dentro de la sede               | Impresora de etiquetas Zebra ZD230                    | `ALMACENADA`             | Adquirida específicamente para aplicaciones operativas de etiquetado | Colectiva; sin custodio individual          |
|    2 | Vento Group S.A.S.             | Vento Producción — Centro de Producción y Distribución | Producción y distribución                  | Punto exacto no formalizado; equipo retirado de operación hasta mantenimiento | Impresora Epson convencional; modelo exacto pendiente | `REQUIERE_MANTENIMIENTO` | Impresión convencional del Centro de Producción; uso suspendido      | Colectiva; sin custodio individual          |
|    3 | Vento Group S.A.S.             | Sede administrativa de Vento Group                     | Administración compartida                  | Oficina de Vento Group                                                        | Impresora Epson convencional; modelo exacto pendiente | `OPERATIVA`              | Impresión convencional de oficina                                    | Colectiva; sin custodio individual          |
|    4 | Nathalia Carolina Ibarra Ariza | Molka — único local físico activo                      | Punto integrado de caja, mostrador y barra | Caja                                                                          | Impresora térmica POS; marca y modelo pendientes      | `OPERATIVA`              | Impresión actual de facturas; se desea habilitar también comandas    | Colectiva; todos los trabajadores del punto |
|    5 | Jefersson García Urrego        | Saudo — único local físico activo                      | Punto integrado de caja, mostrador y barra | Caja                                                                          | Impresora térmica POS; marca y modelo pendientes      | `OPERATIVA`              | Impresión actual de facturas; se desea habilitar también comandas    | Colectiva; todos los trabajadores del punto |
|    6 | Vento Group S.A.S.             | Vento Café — único local físico activo                 | Servicio / Salón                           | Caja / mostrador                                                              | Impresora térmica POS; marca y modelo pendientes      | `OPERATIVA`              | Uso documental específico pendiente de `PRINT-ARC-003`               | Colectiva; todos los trabajadores del punto |
|    7 | Vento Group S.A.S.             | Vento Café — único local físico activo                 | Barra                                      | Barra — bebidas calientes y cafés                                             | Impresora térmica POS; marca y modelo pendientes      | `OPERATIVA`              | Uso documental específico pendiente de `PRINT-ARC-003`               | Colectiva; todos los trabajadores del punto |
|    8 | Vento Group S.A.S.             | Vento Café — único local físico activo                 | Barra                                      | Bar — bebidas frías                                                           | Impresora térmica POS; marca y modelo pendientes      | `OPERATIVA`              | Uso documental específico pendiente de `PRINT-ARC-003`               | Colectiva; todos los trabajadores del punto |
|    9 | Vento Group S.A.S.             | Vento Café — único local físico activo                 | Cocina                                     | Cocina                                                                        | Impresora térmica POS; marca y modelo pendientes      | `OPERATIVA`              | Uso documental específico pendiente de `PRINT-ARC-003`               | Colectiva; todos los trabajadores del punto |

---

#### 6. Consolidado cuantitativo

##### 6.1 Por estado

| Estado                  | Cantidad |
| ----------------------- | -------: |
| Operativas              |        7 |
| Almacenadas             |        1 |
| Requieren mantenimiento |        1 |
| **Total**               |    **9** |

##### 6.2 Por clase general

| Clase                                | Cantidad |
| ------------------------------------ | -------: |
| Impresora especializada de etiquetas |        1 |
| Impresora convencional Epson         |        2 |
| Impresora térmica POS                |        6 |
| **Total**                            |    **9** |

##### 6.3 Por operación o sede

| Operación o sede                                       | Cantidad |
| ------------------------------------------------------ | -------: |
| Vento Producción — Centro de Producción y Distribución |        2 |
| Sede administrativa de Vento Group                     |        1 |
| Vento Café                                             |        4 |
| Molka                                                  |        1 |
| Saudo                                                  |        1 |
| **Total**                                              |    **9** |

##### 6.4 Por titular

| Titular                        | Cantidad |
| ------------------------------ | -------: |
| Vento Group S.A.S.             |        7 |
| Nathalia Carolina Ibarra Ariza |        1 |
| Jefersson García Urrego        |        1 |
| **Total**                      |    **9** |

---

#### 7. Decisiones canónicas

1. El universo operativo inicial queda fijado en nueve impresoras.
2. La Zebra ZD230 se registra como activo existente, almacenado y aún no desplegado.
3. La Epson del Centro de Producción se registra como equipo que requiere mantenimiento y no como impresora disponible.
4. La Epson de la sede administrativa se registra como operativa.
5. Las impresoras de Molka y Saudo se ubican en caja dentro de su punto integrado de caja, mostrador y barra.
6. La impresión de facturas en Molka y Saudo corresponde al uso actual informado.
7. La impresión de comandas en Molka y Saudo se conserva como capacidad deseada, no como capacidad ya comprobada.
8. En Vento Café, `barra` y `bar` son dos puntos físicos diferentes dentro de la misma área de Barra.
9. `barra` atiende bebidas calientes y cafés; `bar` atiende bebidas frías.
10. La responsabilidad vigente es colectiva entre los trabajadores de cada punto.
11. No se asigna un custodio individual ficticio.
12. Los modelos, seriales y capacidades faltantes no invalidan este inventario; corresponden a `PRINT-ARC-002`.
13. Las necesidades exactas de salida imprimible por operación se cerrarán en `PRINT-ARC-003`; su asignación a dispositivos corresponde a tareas posteriores.

---

#### 8. Hallazgos operativos

##### 8.1 Capacidad disponible

La operación dispone actualmente de siete impresoras funcionales distribuidas entre:

- oficina administrativa;
- Molka;
- Saudo;
- caja de Vento Café;
- barra de bebidas calientes de Vento Café;
- bar de bebidas frías de Vento Café;
- cocina de Vento Café.

##### 8.2 Capacidad no desplegada

La Zebra ZD230 representa capacidad especializada adquirida, pero todavía no operativa por encontrarse almacenada y sin punto definitivo de instalación.

##### 8.3 Capacidad degradada

La Epson del Centro de Producción representa una capacidad existente pero indisponible hasta completar mantenimiento y verificación funcional.

##### 8.4 Gobierno de custodia

El modelo colectivo permite uso compartido, pero no identifica todavía:

- responsable de inventario del activo;
- responsable de mantenimiento;
- autoridad de reubicación;
- administrador técnico;
- responsable de consumibles.

Estas responsabilidades no se inventan en `PRINT-ARC-001` y deberán resolverse en las tareas de administración, permisos, mantenimiento y soporte correspondientes.

---

#### 9. Tratamiento de datos todavía no levantados

Los siguientes datos permanecen pendientes y pasan expresamente a `PRINT-ARC-002`:

- marca y modelo exactos de las seis impresoras térmicas POS;
- modelo exacto de las dos Epson;
- serial de cada dispositivo;
- tipo de conexión;
- protocolo;
- capacidad de red;
- tamaño y tipo de papel;
- lenguaje de impresión;
- resolución y velocidad;
- interfaces y adaptadores disponibles;
- estado técnico comprobado mediante prueba de impresión.

No se interpretan como omisiones de `PRINT-ARC-001` porque pertenecen al alcance expreso de la tarea siguiente.

---

#### 10. Criterios de aceptación

`PRINT-ARC-001` queda documentalmente satisfecha cuando:

- [x] todas las impresoras informadas están representadas una sola vez;
- [x] el total consolidado coincide con las nueve unidades identificadas;
- [x] cada equipo tiene entidad o titular;
- [x] cada equipo tiene operación o sede;
- [x] cada equipo tiene área y punto, o una condición explícita que explica por qué no tiene punto activo;
- [x] se distingue equipo operativo, almacenado y pendiente de mantenimiento;
- [x] se preserva la diferencia entre `barra` y `bar` en Vento Café;
- [x] se registra el uso actual de facturas y el deseo futuro de comandas en Molka y Saudo;
- [x] se registra la custodia colectiva sin inventar responsables nominales;
- [x] los datos técnicos se reservan para `PRINT-ARC-002`;
- [x] los documentos imprimibles se reservan para `PRINT-ARC-003`;
- [x] no se declara instalación, reparación, configuración ni validación técnica ejecutada.

---

#### 11. Requisitos de prueba

La tarea no crea ni modifica requisitos de prueba.

El inventario aprobado funciona como evidencia documental de entrada para las verificaciones posteriores de:

- identidad técnica del dispositivo;
- conectividad;
- compatibilidad;
- enrutamiento;
- disponibilidad;
- reintentos;
- permisos;
- privacidad;
- operación offline;
- monitoreo;
- piloto de impresión.

---

#### 12. Continuidad

```text
ÚLTIMA TAREA APROBADA
INT-PROD-005 — Definir tratamiento de producción insuficiente para remisiones

TAREA ACTUAL APROBADA
PRINT-ARC-001 — Inventariar impresoras por empresa, sede, área y punto operativo

SIGUIENTE TAREA RESERVADA
PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión
```


### ✅ PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión

**Estado:** APROBADA  
**Tarea anterior:** `PRINT-ARC-001 — Inventariar impresoras por empresa, sede, área y punto operativo` — APROBADA  
**Tarea siguiente:** `PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles` — RESERVADA  
**Tipo de tarea:** documental; inventario técnico materializado de interfaces, conexión instalada, protocolos, método de impresión, medios, capacidades, lenguajes y estado de evidencia por dispositivo  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`  
**Cambios físicos autorizados:** ninguno; no instala, conecta, repara, reconfigura, actualiza firmware, asigna direcciones de red ni ejecuta pruebas sobre dispositivos

**Qué se hace:** completar el perfil técnico de las nueve impresoras inventariadas, diferenciando las capacidades declaradas por cada fabricante de la conexión realmente utilizada en cada punto operativo y de la evidencia física todavía no verificada.

---

#### 1. Propósito

Establecer la línea base técnica del servicio transversal de impresión para que las tareas posteriores puedan definir documentos, plantillas, trabajos, enrutamiento, disponibilidad, reintentos, adaptadores, monitoreo y piloto sin asumir que:

- todos los equipos utilizan la misma tecnología;
- una interfaz soportada por el modelo está instalada o activa en el equipo concreto;
- una conexión física confirma por sí sola el protocolo de aplicación;
- una impresora de oficina entiende lenguajes de impresoras POS o de etiquetas;
- una impresora almacenada o pendiente de mantenimiento está disponible;
- la especificación comercial equivale a evidencia de instalación, configuración o prueba funcional.

La tarea conserva las nueve identidades aprobadas en `PRINT-ARC-001` y materializa una decisión técnica por cada una.

---

#### 2. Alcance

Esta tarea incluye:

- marca y modelo de cada impresora;
- tecnología y método de impresión;
- interfaces soportadas por la familia o variante documentada;
- conexión actualmente utilizada o condición de ausencia de conexión;
- equipo o red a la que está vinculada la impresora cuando fue confirmado;
- protocolos de impresión o emulación publicados por el fabricante;
- resolución, velocidad y ancho de impresión cuando están documentados;
- tamaños y tipos de papel o material soportados;
- capacidades relevantes para documentos, etiquetas, facturas y comandas;
- clasificación de la evidencia por dispositivo;
- bloqueo operativo cuando el equipo no está disponible;
- destino documental de la evidencia física todavía no levantada.

Esta tarea no:

- decide qué documento se imprime en cada punto;
- define plantillas, versiones o datos obligatorios;
- asigna impresoras principales o alternativas;
- define reglas de enrutamiento;
- configura direcciones IP, colas, controladores o puertos;
- instala adaptadores;
- ejecuta impresiones de prueba;
- certifica calidad, velocidad real, corte real o estabilidad de red;
- repara la Epson L5590;
- despliega la Zebra ZD230;
- modifica código, configuración, datos, migraciones o Supabase.

Los documentos imprimibles continúan en `PRINT-ARC-003`; la selección de adaptadores continúa en `PRINT-ARC-018`; el monitoreo y diagnóstico continúan en `PRINT-ARC-019`; y la prueba física controlada continúa en `PRINT-ARC-020`.

---

#### 3. Fuentes y jerarquía de evidencia

La tarea consume:

1. el inventario de nueve dispositivos aprobado en `PRINT-ARC-001`;
2. la estructura de empresas, sedes, áreas y puntos operativos aprobada en `OPS-AUD-001`;
3. la confirmación operativa de los modelos instalados;
4. la confirmación operativa de las conexiones actualmente utilizadas;
5. las fichas y manuales oficiales de Zebra, Epson y Digital POS vigentes al momento del levantamiento;
6. la continuidad aprobada `PRINT-ARC-001 → PRINT-ARC-002 → PRINT-ARC-003`.

Se aplican cuatro estados de evidencia:

| Estado                              | Significado                                                                                                                                             |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CONFIRMADO_POR_OPERACION`          | Dato aportado sobre ubicación, modelo o conexión utilizada actualmente.                                                                                 |
| `ESPECIFICACION_OFICIAL_DEL_MODELO` | Capacidad publicada por el fabricante para el modelo o una variante declarada. No demuestra por sí sola la configuración física de la unidad instalada. |
| `PENDIENTE_DE_EVIDENCIA_FISICA`     | Dato que requiere etiqueta del equipo, página de configuración, prueba o inspección directa.                                                            |
| `NO_APLICA_EN_ESTADO_ACTUAL`        | La conexión o validación no corresponde mientras el equipo permanezca almacenado o fuera de servicio.                                                   |

Regla obligatoria:

```text
CAPACIDAD DEL MODELO
≠
INTERFAZ PRESENTE EN LA UNIDAD
≠
CONEXIÓN CONFIGURADA
≠
CONEXIÓN VALIDADA
≠
IMPRESIÓN OPERATIVA CERTIFICADA
```

---

#### 4. Perfiles técnicos oficiales por modelo

##### 4.1 Zebra ZD230

| Dimensión                 | Especificación oficial de la familia ZD230                                                       | Tratamiento en Vento                                                                        |
| ------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| Método                    | Transferencia térmica o térmica directa, según variante                                          | La variante física de la unidad almacenada permanece `PENDIENTE_DE_EVIDENCIA_FISICA`.       |
| Resolución                | 203 ppp / 8 puntos por mm                                                                        | Capacidad del modelo.                                                                       |
| Velocidad                 | Hasta 152 mm/s                                                                                   | Capacidad nominal; no validada físicamente.                                                 |
| Ancho máximo de impresión | 104 mm                                                                                           | Capacidad del modelo.                                                                       |
| Ancho de material         | 25,4 a 112 mm                                                                                    | Rango soportado; el material que utilizará Vento continúa sin certificación física.         |
| Materiales                | Rollo o zigzag; troquelado o continuo; con o sin marca negra; tags, recibo continuo y brazaletes | `PRINT-ARC-003` definirá los documentos y `PRINT-ARC-005` la plantilla y tamaño aplicables. |
| Lenguajes                 | ZPL II, EPL2 y XML                                                                               | Lenguajes canónicos soportados por la familia.                                              |
| Interfaz estándar         | USB                                                                                              | Capacidad de la familia; no existe conexión activa en Vento.                                |
| Variantes de comunicación | USB + Ethernet; USB + Bluetooth 4.1; o USB + Wi-Fi 802.11ac + Bluetooth 4.1                      | No se selecciona una variante instalada sin inspección de la unidad.                        |
| Opcionales                | Despegador o cortador de fábrica                                                                 | Presencia física no comprobada.                                                             |

La Zebra ZD230 de Vento Producción se clasifica como `ALMACENADA`, sin punto ni conexión activos. Ninguna interfaz soportada se presenta como instalada o configurada hasta verificar la unidad.

##### 4.2 Epson EcoTank L5590

| Dimensión               | Especificación oficial                                                                                                                                      | Tratamiento en Vento                                                                                  |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Clase                   | Multifuncional de inyección de tinta a color, cuatro funciones                                                                                              | Imprime, copia, escanea y envía fax según el modelo.                                                  |
| Método                  | Epson Heat-Free PrecisionCore                                                                                                                               | Capacidad del modelo.                                                                                 |
| Alimentación documental | ADF de 30 páginas                                                                                                                                           | Capacidad del modelo; no validada después de la avería.                                               |
| Alimentación de papel   | Bandeja posterior de hasta 100 hojas                                                                                                                        | Capacidad del modelo.                                                                                 |
| Papel                   | A4, A6, carta, legal, México-oficio, oficio 9, 8,5 × 13, ejecutivo, media carta, fotografía, sobres y tamaño personalizado de 54 × 86 mm a 215,9 × 1.200 mm | Papel actualmente cargado no verificado.                                                              |
| Interfaces              | USB, Wi-Fi, Wi-Fi Direct y Ethernet                                                                                                                         | Capacidad del modelo. La unidad de Vento no tiene conexión operativa mientras requiere mantenimiento. |
| Red                     | Admite red inalámbrica y red Ethernet                                                                                                                       | No se asignan IP, MAC ni protocolo activo sin evidencia de configuración.                             |
| Lenguaje operativo      | Impresión administrada mediante controlador y servicios de impresión Epson                                                                                  | No se clasifica como dispositivo ZPL, EPL o ESC/POS.                                                  |
| Estado                  | El modelo soporta impresión de oficina y red                                                                                                                | La unidad concreta permanece `REQUIERE_MANTENIMIENTO`.                                                |

La Epson L5590 del Centro de Producción no se considera disponible. Sus capacidades oficiales no sustituyen la reparación ni una prueba posterior.

##### 4.3 Epson EcoTank L4260

| Dimensión                      | Especificación oficial                                                                                                                                               | Tratamiento en Vento                                 |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| Clase                          | Multifuncional de inyección de tinta a color, tres funciones                                                                                                         | Impresión, copia y escaneo.                          |
| Resolución máxima              | Hasta 5.760 × 1.440 dpi optimizados                                                                                                                                  | Capacidad nominal.                                   |
| Doble cara                     | Impresión automática a doble cara en A4 y carta                                                                                                                      | Capacidad del modelo.                                |
| Interfaces                     | USB 2.0, Wi-Fi 4 y Wi-Fi Direct                                                                                                                                      | La operación confirmó uso actual por USB y Wi-Fi.    |
| Protocolos de impresión en red | LPD, PORT9100 y WSD                                                                                                                                                  | Protocolos disponibles sobre la conexión Wi-Fi.      |
| Gestión de red                 | SNMP, HTTP, DHCP, APIPA, PING, DDNS, mDNS, SLP, WSD y LLTD                                                                                                           | La configuración concreta no fue leída físicamente.  |
| Papel                          | Normal, papeles especiales Epson y sobres; A4, carta, oficios, folio, ejecutivo, media carta, A6, fotografía y tamaño personalizado de 54 × 86 mm a 215,9 × 1.200 mm | Papel actualmente cargado no verificado.             |
| Capacidad                      | Alimentador posterior de hasta 100 hojas A4/carta/oficio                                                                                                             | Capacidad nominal.                                   |
| Lenguaje operativo             | Impresión administrada mediante controlador Epson y protocolos de impresión de red                                                                                   | No se clasifica como dispositivo ZPL, EPL o ESC/POS. |

La Epson L4260 de la sede administrativa utiliza actualmente dos vías de impresión: USB y Wi-Fi. Wi-Fi Direct es capacidad del modelo, pero no fue declarado como conexión operativa vigente.

##### 4.4 Digital POS DIG-E200I

| Dimensión           | Especificación oficial                                           | Tratamiento en Vento                                                                    |
| ------------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| Método              | Térmica directa                                                  | Aplica a las seis unidades.                                                             |
| Papel               | Rollo de 80 mm                                                   | Medio nominal para las seis unidades; el lote o la marca del consumible no se inventan. |
| Ancho de impresión  | 72 mm                                                            | Capacidad nominal.                                                                      |
| Resolución          | 203 dpi                                                          | Capacidad nominal.                                                                      |
| Velocidad           | 200 mm/s                                                         | Capacidad nominal; no certificada mediante prueba Vento.                                |
| Interfaces          | Variante USB o variante USB + LAN                                | La conexión real permite clasificar tres unidades por USB y tres por red local.         |
| Emulación           | ESC/POS                                                          | Lenguaje de impresión canónico de las seis térmicas.                                    |
| Corte               | Autocortador parcial                                             | Capacidad del modelo; operación real no probada en esta tarea.                          |
| Códigos             | Códigos 1D, QR y PDF417                                          | Capacidad del modelo.                                                                   |
| Cajón               | Salida de cajón monedero de 24 V / 1 A                           | Presencia y uso del cable de cajón no comprobados.                                      |
| Sistemas soportados | Windows, Linux, Android y macOS; SDK para iOS, Android y Windows | No equivale a controlador instalado o integración implementada.                         |

---

#### 5. Matriz técnica materializada por dispositivo

|  N.º | Operación y punto                               | Modelo                | Estado actual            | Conexión instalada confirmada | Destino de conexión                                | Protocolo o lenguaje                                                         | Método y medio                                                                              | Capacidades relevantes                                                                      | Estado de evidencia / bloqueo                                                                                                                                                                  |
| ---: | ----------------------------------------------- | --------------------- | ------------------------ | ----------------------------- | -------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    1 | Vento Producción — equipo almacenado            | Zebra ZD230           | `ALMACENADA`             | Ninguna conexión activa       | No aplica                                          | ZPL II, EPL2 y XML como capacidad del modelo                                 | Transferencia térmica o térmica directa según variante; material de 25,4 a 112 mm           | 203 ppp, hasta 152 mm/s, ancho imprimible de 104 mm; variantes USB/Ethernet/Bluetooth/Wi-Fi | Modelo confirmado. Variante, serial, modo térmico, interfaces físicas, accesorios y material objetivo: `PENDIENTE_DE_EVIDENCIA_FISICA`. No bloquea el inventario; bloquea despliegue y piloto. |
|    2 | Vento Producción — equipo fuera de operación    | Epson EcoTank L5590   | `REQUIERE_MANTENIMIENTO` | Ninguna conexión operativa    | No aplica hasta reparación                         | Controlador y servicios Epson; capacidad USB, Wi-Fi, Wi-Fi Direct y Ethernet | Inyección de tinta a color; hojas y sobres hasta 215,9 × 1.200 mm                           | Impresión, copia, escaneo, fax, ADF de 30 páginas y alimentación posterior                  | Modelo y ubicación confirmados. Falla, serial, firmware, interfaz que se usará y prueba: `PENDIENTE_DE_EVIDENCIA_FISICA`. Reparación y validación bloquean disponibilidad.                     |
|    3 | Sede administrativa de Vento Group — oficina    | Epson EcoTank L4260   | `OPERATIVA`              | USB y Wi-Fi                   | Computador de oficina y red inalámbrica de la sede | Controlador Epson; LPD, PORT9100 y WSD por red                               | Inyección de tinta a color; A4, carta, oficios, fotografía, sobres y tamaños personalizados | Impresión, copia, escaneo, dúplex automático y alimentador de hasta 100 hojas               | Modelo y vías de conexión: `CONFIRMADO_POR_OPERACION`. IP, MAC, firmware, serial, cola y prueba controlada: `PENDIENTE_DE_EVIDENCIA_FISICA`.                                                   |
|    4 | Molka — caja                                    | Digital POS DIG-E200I | `OPERATIVA`              | USB                           | Computador de caja de Molka                        | ESC/POS                                                                      | Térmica directa; rollo de 80 mm; ancho imprimible de 72 mm                                  | 203 dpi, 200 mm/s, autocortador parcial, códigos 1D/QR/PDF417                               | Modelo y conexión: `CONFIRMADO_POR_OPERACION`. Serial, firmware, controlador, puerto lógico, corte y prueba: `PENDIENTE_DE_EVIDENCIA_FISICA`.                                                  |
|    5 | Saudo — caja                                    | Digital POS DIG-E200I | `OPERATIVA`              | USB                           | Computador de caja de Saudo                        | ESC/POS                                                                      | Térmica directa; rollo de 80 mm; ancho imprimible de 72 mm                                  | 203 dpi, 200 mm/s, autocortador parcial, códigos 1D/QR/PDF417                               | Modelo y conexión: `CONFIRMADO_POR_OPERACION`. Serial, firmware, controlador, puerto lógico, corte y prueba: `PENDIENTE_DE_EVIDENCIA_FISICA`.                                                  |
|    6 | Vento Café — caja / mostrador                   | Digital POS DIG-E200I | `OPERATIVA`              | USB                           | Computador de caja de Vento Café                   | ESC/POS                                                                      | Térmica directa; rollo de 80 mm; ancho imprimible de 72 mm                                  | 203 dpi, 200 mm/s, autocortador parcial, códigos 1D/QR/PDF417                               | Modelo y conexión: `CONFIRMADO_POR_OPERACION`. Serial, firmware, controlador, puerto lógico, corte y prueba: `PENDIENTE_DE_EVIDENCIA_FISICA`.                                                  |
|    7 | Vento Café — barra de bebidas calientes y cafés | Digital POS DIG-E200I | `OPERATIVA`              | Red local                     | Infraestructura de red de Vento Café               | ESC/POS transportado por la interfaz LAN de la variante USB + LAN            | Térmica directa; rollo de 80 mm; ancho imprimible de 72 mm                                  | 203 dpi, 200 mm/s, autocortador parcial, códigos 1D/QR/PDF417                               | Modelo y conexión por red: `CONFIRMADO_POR_OPERACION`. Cableado, IP, MAC, puerto, DHCP/estática, firmware y prueba: `PENDIENTE_DE_EVIDENCIA_FISICA`.                                           |
|    8 | Vento Café — bar de bebidas frías               | Digital POS DIG-E200I | `OPERATIVA`              | Red local                     | Infraestructura de red de Vento Café               | ESC/POS transportado por la interfaz LAN de la variante USB + LAN            | Térmica directa; rollo de 80 mm; ancho imprimible de 72 mm                                  | 203 dpi, 200 mm/s, autocortador parcial, códigos 1D/QR/PDF417                               | Modelo y conexión por red: `CONFIRMADO_POR_OPERACION`. Cableado, IP, MAC, puerto, DHCP/estática, firmware y prueba: `PENDIENTE_DE_EVIDENCIA_FISICA`.                                           |
|    9 | Vento Café — cocina                             | Digital POS DIG-E200I | `OPERATIVA`              | Red local                     | Infraestructura de red de Vento Café               | ESC/POS transportado por la interfaz LAN de la variante USB + LAN            | Térmica directa; rollo de 80 mm; ancho imprimible de 72 mm                                  | 203 dpi, 200 mm/s, autocortador parcial, códigos 1D/QR/PDF417                               | Modelo y conexión por red: `CONFIRMADO_POR_OPERACION`. Cableado, IP, MAC, puerto, DHCP/estática, firmware y prueba: `PENDIENTE_DE_EVIDENCIA_FISICA`.                                           |

---

#### 6. Reconciliación cuantitativa

##### 6.1 Cobertura de identidades

| Concepto                                  | Cantidad |
| ----------------------------------------- | -------: |
| Dispositivos heredados de `PRINT-ARC-001` |        9 |
| Dispositivos materializados en esta tarea |        9 |
| Identidades faltantes                     |        0 |
| Identidades duplicadas                    |        0 |
| Filas sin decisión técnica                |        0 |

##### 6.2 Distribución por modelo

| Modelo                | Cantidad |
| --------------------- | -------: |
| Zebra ZD230           |        1 |
| Epson EcoTank L5590   |        1 |
| Epson EcoTank L4260   |        1 |
| Digital POS DIG-E200I |        6 |
| **Total**             |    **9** |

##### 6.3 Distribución por conexión actual

| Conexión actual                          | Cantidad |
| ---------------------------------------- | -------: |
| USB                                      |        3 |
| Red local                                |        3 |
| USB y Wi-Fi                              |        1 |
| Sin conexión activa por almacenamiento   |        1 |
| Sin conexión operativa por mantenimiento |        1 |
| **Total**                                |    **9** |

Una unidad con USB y Wi-Fi se cuenta una sola vez como dispositivo con conectividad dual; no se duplica en el total.

##### 6.4 Distribución por familia de lenguaje

| Familia                                                          | Dispositivos        | Cantidad |
| ---------------------------------------------------------------- | ------------------- | -------: |
| Lenguajes de etiquetas `ZPL II / EPL2 / XML`                     | Zebra ZD230         |        1 |
| Emulación POS `ESC/POS`                                          | Seis DIG-E200I      |        6 |
| Impresión administrada por controlador Epson y protocolos de red | Epson L5590 y L4260 |        2 |
| **Total**                                                        |                     |    **9** |

##### 6.5 Distribución por estado operativo

| Estado                  | Cantidad |
| ----------------------- | -------: |
| Operativas              |        7 |
| Almacenadas             |        1 |
| Requieren mantenimiento |        1 |
| **Total**               |    **9** |

---

#### 7. Decisiones canónicas

1. El universo técnico queda fijado en las mismas nueve identidades aprobadas en `PRINT-ARC-001`.
2. La Epson L5590 corresponde al Centro de Producción y permanece fuera de operación hasta mantenimiento y prueba posterior.
3. La Epson L4260 corresponde a la oficina de Vento Group y utiliza actualmente USB y Wi-Fi.
4. Las impresoras de Molka, Saudo y caja de Vento Café utilizan USB hacia el computador de caja de cada operación.
5. Las impresoras de barra, bar y cocina de Vento Café utilizan la red local.
6. Las tres DIG-E200I conectadas por red requieren la variante con LAN; la identificación de puerto, IP, MAC y configuración se conserva pendiente de evidencia física.
7. La capacidad Wi-Fi Direct de la Epson L4260 no se presenta como conexión activa porque no fue confirmada como vía de uso actual.
8. La Zebra ZD230 no recibe una variante de comunicación, método térmico, cortador o dispensador por inferencia; esos datos se obtendrán de la unidad física antes del despliegue.
9. Las seis DIG-E200I comparten perfil nominal de impresión térmica directa, rollo de 80 mm, ancho de 72 mm, 203 dpi, 200 mm/s y emulación ESC/POS.
10. La Epson L5590 y la L4260 se tratan como impresoras administradas por controlador, no como impresoras POS ni de lenguaje ZPL/EPL.
11. Las capacidades nominales del fabricante no equivalen a prueba funcional ejecutada en Vento.
12. Los seriales, firmware, direcciones, controladores instalados, colas, material cargado y resultados de prueba permanecen como evidencia de implementación y piloto, no como vacío de decisión de esta tarea.

---

#### 8. Datos físicos pendientes y destino obligatorio

| Evidencia pendiente                                                 | Equipos afectados                              | Estado                          | Tarea responsable / condición de salida                                                  |
| ------------------------------------------------------------------- | ---------------------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------- |
| Serial y etiqueta exacta de variante                                | 9                                              | `PENDIENTE_DE_EVIDENCIA_FISICA` | `PRINT-ARC-019`; inventario técnico visible para diagnóstico por sede.                   |
| Variante, modo térmico, interfaces y accesorios físicos de la Zebra | Zebra ZD230                                    | `PENDIENTE_DE_EVIDENCIA_FISICA` | `PRINT-ARC-018`; selección del adaptador y conexión real antes del piloto.               |
| Reparación y causa de falla                                         | Epson L5590                                    | `BLOQUEADO`                     | Mantenimiento del activo y posterior `PRINT-ARC-020`; impresión de prueba satisfactoria. |
| IP, MAC, puerto, DHCP o reserva                                     | Tres DIG-E200I por red y Epson L4260 por Wi-Fi | `PENDIENTE_DE_EVIDENCIA_FISICA` | `PRINT-ARC-019`; diagnóstico de red materializado por dispositivo.                       |
| Controlador, versión y puerto lógico instalados                     | Epson y DIG-E200I                              | `PENDIENTE_DE_EVIDENCIA_FISICA` | `PRINT-ARC-018`; adaptador y configuración de host documentados.                         |
| Papel o etiqueta realmente cargados                                 | 9                                              | `PENDIENTE_DE_EVIDENCIA_FISICA` | `PRINT-ARC-005`; plantilla, versión y tamaño aprobados para cada documento.              |
| Prueba de impresión, corte y legibilidad                            | 9                                              | `PENDIENTE_DE_EVIDENCIA_FISICA` | `PRINT-ARC-020`; piloto ejecutado con evidencia y criterio de aceptación.                |
| Necesidades de salida imprimible por operación                      | Operaciones y puntos pendientes                | `RESERVADO`                     | `PRINT-ARC-003`; inventario de necesidades y evidencia, sin asignación de dispositivo.   |

Cada punto pendiente tiene bloqueo, propietario documental y condición de salida explícitos.

---

#### 9. Criterios de aceptación

`PRINT-ARC-002` queda documentalmente satisfecha cuando:

- [x] conserva las nueve identidades de `PRINT-ARC-001`;
- [x] asigna un modelo exacto a cada dispositivo;
- [x] distingue conexión soportada de conexión instalada;
- [x] documenta la conexión actual de los nueve equipos;
- [x] registra tres térmicas por USB y tres por red local;
- [x] registra la Epson L4260 por USB y Wi-Fi;
- [x] registra la Zebra almacenada y la Epson L5590 sin conexión operativa;
- [x] documenta método, papel, resolución, velocidad y ancho cuando están publicados oficialmente;
- [x] documenta ZPL II, EPL2, XML y ESC/POS sin atribuirlos a equipos incompatibles;
- [x] evita asumir variante, serial, firmware, IP, MAC, accesorios o prueba funcional;
- [x] reconcilia 9 esperadas, 9 materializadas, 0 faltantes y 0 duplicados;
- [x] asigna todo pendiente a una tarea y condición de salida concretas;
- [x] no ejecuta configuración, reparación, instalación ni validación física.

---

#### 10. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea materializa evidencia técnica de entrada, pero no incorpora un comportamiento nuevo, una obligación de implementación, un permiso, una regla de enrutamiento ni un criterio operativo nuevo que requiera crear o modificar una fila `TREQ-*`.

Los criterios verificables de conectividad, adaptadores, diagnóstico y piloto se definirán o consumirán en las tareas posteriores propietarias de esas decisiones. Esta tarea no modifica texto, estado, relaciones ni secuencia de requisitos existentes.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

---

#### 11. Handoff hacia necesidades imprimibles

`PRINT-ARC-003` deberá utilizar las nueve identidades técnicas únicamente como contexto de capacidad existente y levantar, por operación:

- salidas actualmente impresas y evidencia disponible;
- necesidades futuras confirmadas por la operación;
- nombre provisional y propósito de cada salida;
- familia documental general;
- candidatos pendientes de confirmar, fusionar o descartar;
- puntos cuyo uso documental todavía no ha sido levantado.

`PRINT-ARC-003` no definirá aplicación propietaria, datos, plantilla, punto de emisión, impresora, original, copia o reimpresión. Esas decisiones pertenecen respectivamente a `PRINT-ARC-004`, `PRINT-ARC-005`, `PRINT-ARC-007`, `PRINT-ARC-008` y `PRINT-ARC-014`.

La capacidad técnica no autoriza un documento. Que una impresora pueda producir texto, códigos o etiquetas no demuestra qué necesita imprimir la operación.

---

#### 12. Continuidad

```text
ÚLTIMA TAREA APROBADA
PRINT-ARC-001 — Inventariar impresoras por empresa, sede, área y punto operativo
        ↓
TAREA ACTUAL APROBADA
PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles
```


### ✅ PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión` — APROBADA
**Tarea siguiente:** `PRINT-ARC-004 — Definir aplicación propietaria de cada documento` — RESERVADA
**Tipo de tarea:** documental; inventario canónico materializado de las clases de salidas físicas que debe soportar el ecosistema Vento, con identidad estable, familia, propósito operativo, procesos relacionados y estado documental por registro
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no compra, instala, conecta, repara, configura, asigna ni prueba impresoras
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** cerrar el inventario documental de **qué salidas físicas debe poder producir la operación y para qué propósito**, sin decidir todavía la aplicación propietaria, los datos, la plantilla, el tamaño, la impresora, el enrutamiento ni la implementación.

---

#### 1. Resultado sustantivo

`PRINT-ARC-003` queda cerrada con un inventario canónico de cincuenta identidades de salida imprimible:

- 16 etiquetas;
- 9 comandas o tiquetes operativos;
- 9 comprobantes para cliente o caja;
- 16 documentos convencionales operativos o administrativos.

Cada identidad queda materializada con:

- identificador único y estable;
- nombre de la salida;
- propósito operativo;
- procesos relacionados;
- familia documental;
- estado documental explícito;
- ausencia de bloqueo dentro del alcance de esta tarea.

El inventario define el alcance documental vigente. No afirma que las cincuenta salidas estén implementadas, que se impriman actualmente, que deban usar un dispositivo determinado ni que representen el universo perpetuo de necesidades futuras. Una necesidad nueva deberá incorporarse mediante una corrección o tarea canónica posterior, sin alterar silenciosamente estas identidades.

---

#### 2. Regla de separación entre inventario y diseño

Esta tarea responde exclusivamente:

```text
¿QUÉ SALIDA FÍSICA DEBE SOPORTAR EL ECOSISTEMA Y PARA QUÉ?
```

Las siguientes preguntas pertenecen a tareas posteriores y no constituyen brechas de `PRINT-ARC-003`:

| Decisión                                                                               | Tarea propietaria                 |
| -------------------------------------------------------------------------------------- | --------------------------------- |
| Aplicación propietaria, originadores y consumidores                                    | `PRINT-ARC-004`                   |
| Datos, plantilla, versión, formato, tamaño e idioma                                    | `PRINT-ARC-005`                   |
| Contrato canónico del trabajo de impresión                                             | `PRINT-ARC-006`                   |
| Sede, punto, canal, estación y destino                                                 | `PRINT-ARC-007`                   |
| Dispositivo principal, alternativas, fallback y capacidad física                       | `PRINT-ARC-008`                   |
| Estado, heartbeat, idempotencia, reintentos, confirmaciones, cancelación y reimpresión | `PRINT-ARC-009` a `PRINT-ARC-014` |
| Permisos, privacidad y operación offline                                               | `PRINT-ARC-015` a `PRINT-ARC-017` |
| Adaptadores, conexión, monitoreo y diagnóstico                                         | `PRINT-ARC-018` y `PRINT-ARC-019` |
| Alcance, métricas y aceptación del piloto                                              | `PRINT-ARC-020`                   |

Regla obligatoria:

```text
SALIDA INVENTARIADA
≠
APLICACION PROPIETARIA
≠
DATOS O PLANTILLA
≠
PUNTO O IMPRESORA
≠
TRABAJO IMPLEMENTADO
≠
IMPRESION VALIDADA
```

---

#### 3. Definiciones canónicas

| Término                  | Definición                                                                                                                                              |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SALIDA_IMPRIMIBLE`      | Clase estable de representación física requerida por una operación empresarial autorizada.                                                              |
| `IDENTIDAD_DE_SALIDA`    | Código `IMP-*` único que identifica una salida dentro del servicio transversal de impresión.                                                            |
| `ETIQUETA`               | Salida física destinada principalmente a identificación, trazabilidad, estado o advertencia sobre un objeto, lote, ubicación o material.                |
| `COMANDA_TIQUETE`        | Salida física destinada a comunicar o controlar una acción operativa de preparación, expedición, reposición, modificación o cancelación.                |
| `CLIENTE_CAJA`           | Salida física destinada a informar, confirmar o dejar constancia de una operación de cliente, venta, pago, entrega, beneficio o caja.                   |
| `DOCUMENTO_CONVENCIONAL` | Salida física operativa o administrativa que conserva información estructurada de una operación, control, autorización, reporte o seguimiento.          |
| `INVENTARIADA`           | La identidad, el nombre, el propósito y la relación funcional quedan aprobados dentro de esta tarea. No equivale a implementación ni validación física. |
| `ACTUAL_Y_OBJETIVO`      | Existe evidencia de uso actual para la clase general de salida y, además, forma parte del inventario objetivo.                                          |
| `OBJETIVO_CANONICO`      | La salida forma parte del inventario objetivo aprobado, independientemente de que exista uso actual demostrado.                                         |
| `SIN_BLOQUEO_DOCUMENTAL` | La identidad está completamente decidida para el alcance de `PRINT-ARC-003` y puede pasar a la tarea propietaria siguiente.                             |

---

#### 4. Fuentes y decisiones heredadas

La tarea conserva y consume:

1. las nueve identidades de impresoras aprobadas en `PRINT-ARC-001`, únicamente como contexto de existencia del servicio;
2. los perfiles técnicos aprobados en `PRINT-ARC-002`, sin convertir capacidad técnica en asignación documental;
3. la impresión actual de facturas informada para Molka y Saudo;
4. la necesidad de habilitar comandas informada para Molka y Saudo;
5. las identidades `IMP-*`, nombres y relaciones de proceso ya materializadas en la versión aprobada de `PRINT-ARC-003`;
6. la corrección de alcance que separa el inventario documental de la propiedad, plantilla, enrutamiento, dispositivos, capacidad y piloto.

Decisiones consolidadas:

- se conservan las cincuenta identidades `IMP-*`;
- todas quedan aprobadas como salidas del inventario objetivo vigente;
- ninguna identidad se asigna a una marca, modelo, sede, punto o impresora;
- no se crean capacidades físicas adicionales ni obligaciones de compra;
- no se define un total objetivo de puntos de impresión;
- no se bloquea el piloto por adquisiciones no aprobadas;
- no se declara implementación o validación física;
- no quedan preguntas sustantivas abiertas dentro del alcance de esta tarea.

---

#### 5. Inventario canónico materializado

##### 5.1 Etiquetas

| ID           | Salida inventariada                                       | Propósito operativo                                                                                          | Procesos relacionados              | Condición documental | Estado / bloqueo                          |
| ------------ | --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ---------------------------------- | -------------------- | ----------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | Identificar el producto terminado y conservar la trazabilidad del lote, las fechas y la condición de salida. | VPROC-0034, VPROC-0035, VPROC-0024 | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | Mantener identidad y trazabilidad entre etapas de producción.                                                | VPROC-0034, VPROC-0024             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | Identificar la preparación, la fecha de elaboración y su ventana operativa de uso.                           | VPROC-0033, VPROC-0034, VPROC-0035 | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | Registrar una apertura, fraccionamiento, reempaque o cambio de condición de conservación.                    | VPROC-0034, VPROC-0037, VPROC-0024 | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | Advertir riesgos, restricciones y condiciones especiales de manipulación.                                    | VPROC-0033, VPROC-0038             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | Hacer visible el estado de calidad y prevenir el uso no autorizado.                                          | VPROC-0038, VPROC-0024             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | Vincular una recepción física con el proveedor, el lote y la condición recibida.                             | VPROC-0012, VPROC-0021, VPROC-0037 | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | Identificar ubicaciones físicas utilizadas por inventario, almacenamiento y reposición.                      | VPROC-0021, VPROC-0023             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | Identificar una referencia, unidad logística o insumo controlado.                                            | VPROC-0021, VPROC-0023             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | Vincular un paquete físico con su movimiento, traslado o despacho autorizado.                                | VPROC-0021                         | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | Identificar un paquete, pedido u orden durante la recogida o entrega.                                        | VPROC-0018, VPROC-0021             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | Asignar una identidad física visible a un activo o equipo.                                                   | VPROC-0022, VPROC-0057             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | Comunicar el estado técnico, la inspección o la restricción de uso de un activo.                             | VPROC-0022, VPROC-0057             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | Comunicar la ejecución y vigencia de una limpieza o sanitización.                                            | VPROC-0036, VPROC-0038             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | Conservar la identidad y trazabilidad de una muestra o prueba.                                               | VPROC-0038, VPROC-0024             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | Identificar material retirado, su causa y su destino.                                                        | VPROC-0036, VPROC-0024             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |

##### 5.2 Comandas y tiquetes operativos

| ID           | Salida inventariada                           | Propósito operativo                                                                                     | Procesos relacionados  | Condición documental                                                                      | Estado / bloqueo                          |
| ------------ | --------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ---------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------- |
| `IMP-CMD-01` | Comanda de cocina                             | Comunicar productos, cantidades, observaciones y prioridad al punto de preparación de cocina.           | VPROC-0035             | `OBJETIVO_CANONICO`; la necesidad general de comandas está confirmada para Molka y Saudo. | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-02` | Comanda de bar de bebidas frías               | Comunicar bebidas frías, cantidades y modificaciones al punto de preparación correspondiente.           | VPROC-0035             | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes | Comunicar bebidas calientes, tamaños y personalizaciones al punto de preparación correspondiente.       | VPROC-0035             | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-04` | Comanda de preparación o mise en place        | Solicitar producción previa, preparación interna o reposición operativa.                                | VPROC-0034, VPROC-0035 | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-05` | Tiquete de expedición o recogida              | Consolidar los ítems listos para entrega, retiro o expedición.                                          | VPROC-0018, VPROC-0035 | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-06` | Solicitud interna de reposición               | Comunicar una solicitud de insumos o producto entre áreas operativas.                                   | VPROC-0021, VPROC-0037 | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-07` | Modificación o adición de comanda             | Comunicar un cambio posterior sin sustituir silenciosamente la versión anterior.                        | VPROC-0035             | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-08` | Cancelación o anulación de comanda            | Comunicar una cancelación autorizada y auditable.                                                       | VPROC-0035             | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia     | Comunicar un faltante que requiere activar producción conforme a la decisión de insuficiencia aprobada. | VPROC-0021, VPROC-0034 | `OBJETIVO_CANONICO`                                                                       | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |

##### 5.3 Comprobantes para cliente y caja

| ID           | Salida inventariada                                  | Propósito operativo                                                                                    | Procesos relacionados              | Condición documental                                                                   | Estado / bloqueo                          |
| ------------ | ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ---------------------------------- | -------------------------------------------------------------------------------------- | ----------------------------------------- |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                    | Mostrar consumos, cantidades, descuentos, impuestos y total antes del cierre del pago.                 | VPROC-0018, VPROC-0020             | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-02` | Confirmación de pedido                               | Entregar un resumen identificable de la orden, el canal y la condición de entrega.                     | VPROC-0018                         | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-03` | Comprobante de pago                                  | Confirmar el medio, el valor, la fecha, la referencia y el estado de un pago.                          | VPROC-0020, VPROC-0060             | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente          | Entregar la constancia física autorizada de una venta sin sustituir la emisión fiscal que corresponda. | VPROC-0020, VPROC-0060             | `ACTUAL_Y_OBJETIVO`; la impresión actual de facturas está confirmada en Molka y Saudo. | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito | Entregar constancia de un ajuste, reverso o devolución autorizados.                                    | VPROC-0020, VPROC-0060             | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-06` | Resumen de recogida o entrega                        | Identificar el pedido, el receptor y la condición de una recogida o entrega.                           | VPROC-0018, VPROC-0021             | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                    | Confirmar una reserva, un anticipo y el saldo asociado.                                                | VPROC-0018, VPROC-0060             | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                | Entregar constancia de un beneficio autorizado y controlable.                                          | VPROC-0018                         | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja    | Dejar constancia operativa de un turno y de sus totales de caja.                                       | VPROC-0019, VPROC-0020, VPROC-0060 | `OBJETIVO_CANONICO`                                                                    | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |

##### 5.4 Documentos convencionales operativos y administrativos

| ID           | Salida inventariada                                 | Propósito operativo                                                                   | Procesos relacionados              | Condición documental | Estado / bloqueo                          |
| ------------ | --------------------------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------- | -------------------- | ----------------------------------------- |
| `IMP-DOC-01` | Remisión o nota de despacho                         | Acompañar una salida, traslado o entrega autorizada.                                  | VPROC-0021                         | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-02` | Manifiesto de traslado interno                      | Consolidar artículos, cantidades, origen, destino y responsables de un traslado.      | VPROC-0021                         | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-03` | Hoja de conteo de inventario                        | Facilitar un conteo controlado y su conciliación posterior.                           | VPROC-0021, VPROC-0023             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario      | Documentar variaciones de inventario y la decisión sobre su ajuste.                   | VPROC-0021                         | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-05` | Orden de compra                                     | Formalizar una compra autorizada para un proveedor.                                   | VPROC-0012, VPROC-0069             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-06` | Acta o comprobante de recepción                     | Registrar cantidades, condición y diferencias de una recepción.                       | VPROC-0012, VPROC-0021             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-07` | Devolución a proveedor                              | Registrar artículos, causa, autorización y entrega de una devolución.                 | VPROC-0012, VPROC-0021             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-08` | Orden de producción o ficha de lote                 | Autorizar y documentar una ejecución de producción.                                   | VPROC-0034, VPROC-0035             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica               | Proveer instrucciones versionadas de elaboración u operación.                         | VPROC-0031, VPROC-0032, VPROC-0033 | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                | Documentar un hallazgo, su decisión y el seguimiento asociado.                        | VPROC-0038, VPROC-0024             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-11` | Orden de mantenimiento                              | Autorizar y documentar el diagnóstico o la intervención de un activo.                 | VPROC-0022, VPROC-0057             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo    | Evidenciar custodia, condición y ubicación de un activo.                              | VPROC-0022, VPROC-0057             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico              | Documentar una falla, su impacto, diagnóstico y resolución.                           | VPROC-0039, VPROC-0057             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo | Guiar y registrar controles periódicos de limpieza, sanitización u operación.         | VPROC-0036, VPROC-0038             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación        | Presentar información financiera autorizada para control y conciliación.              | VPROC-0020, VPROC-0060             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales     | Facilitar el seguimiento y la toma de decisiones mediante una salida física resumida. | VPROC-0014, VPROC-0050             | `OBJETIVO_CANONICO`  | `INVENTARIADA` / `SIN_BLOQUEO_DOCUMENTAL` |

---

#### 6. Reconciliación cuantitativa

##### 6.1 Cobertura por familia

| Familia                          | Esperadas por el alcance aprobado | Materializadas | Faltantes | Duplicadas | Estado        |
| -------------------------------- | --------------------------------: | -------------: | --------: | ---------: | ------------- |
| Etiquetas                        |                                16 |             16 |         0 |          0 | `CERRADA`     |
| Comandas y tiquetes operativos   |                                 9 |              9 |         0 |          0 | `CERRADA`     |
| Comprobantes para cliente y caja |                                 9 |              9 |         0 |          0 | `CERRADA`     |
| Documentos convencionales        |                                16 |             16 |         0 |          0 | `CERRADA`     |
| **Total**                        |                            **50** |         **50** |     **0** |      **0** | **`CERRADA`** |

##### 6.2 Integridad de identidades

```text
IDENTIDADES ESPERADAS POR EL ALCANCE APROBADO: 50
IDENTIDADES MATERIALIZADAS: 50
IDENTIFICADORES UNICOS: 50
IDENTIFICADORES DUPLICADOS: 0
IDENTIDADES FALTANTES: 0
IDENTIDADES SIN PROPOSITO: 0
IDENTIDADES SIN ESTADO: 0
IDENTIDADES CON BLOQUEO DOCUMENTAL: 0
```

La completitud se declara respecto del alcance documental aprobado en esta tarea. No se deduce de la cantidad de impresoras ni impide que una necesidad nueva sea incorporada mediante control de cambios.

---

#### 7. Correcciones consolidadas frente a la versión anterior

1. Se conserva el inventario de cincuenta identidades sin tratarlas como asignaciones de hardware.
2. Se elimina la designación anticipada de una impresora específica para cada familia.
3. Se elimina la obligación de incorporar dos impresoras térmicas adicionales.
4. Se elimina el total objetivo de once puntos de impresión.
5. Se elimina cualquier prerrequisito de compra atribuido al piloto.
6. Se elimina la asignación anticipada de aplicación propietaria.
7. Se elimina la definición anticipada de tamaño, papel, plantilla, datos, ruta y fallback.
8. Se conserva únicamente la relación funcional necesaria para explicar qué se imprime y para qué.
9. Todas las identidades quedan cerradas documentalmente y sin preguntas internas de `PRINT-ARC-003`.
10. Las decisiones posteriores se entregan a su tarea propietaria como alcance reservado, no como omisiones o bloqueos de esta tarea.

---

#### 8. Handoff cerrado hacia `PRINT-ARC-004`

`PRINT-ARC-004` recibe exactamente cincuenta identidades aprobadas y deberá materializar una decisión de propiedad por cada una, sin reducirlas, fusionarlas, renombrarlas ni descartarlas silenciosamente.

Por cada identidad recibe:

- código estable `IMP-*`;
- nombre de la salida;
- familia documental;
- propósito operativo;
- procesos relacionados;
- condición documental;
- estado `INVENTARIADA`;
- bloqueo documental `SIN_BLOQUEO_DOCUMENTAL`.

No recibe decisiones sobre:

- aplicación propietaria o consumidores;
- estructura de datos;
- plantilla, versión, tamaño o idioma;
- punto, sede, estación, canal o impresora;
- principal, alternativa o fallback;
- cantidad de equipos;
- adaptadores o conexión;
- implementación, prueba o piloto.

---

#### 9. Criterios de aceptación

`PRINT-ARC-003` queda documentalmente satisfecha porque:

- [x] responde qué salidas físicas debe soportar el ecosistema y para qué propósito;
- [x] materializa cincuenta identidades únicas y estables;
- [x] materializa 16 etiquetas, 9 comandas o tiquetes, 9 salidas de cliente o caja y 16 documentos convencionales;
- [x] asigna nombre, propósito, procesos relacionados, condición documental, estado y bloqueo por identidad;
- [x] reporta 50 esperadas, 50 materializadas, 0 faltantes y 0 duplicadas;
- [x] no asigna aplicaciones propietarias;
- [x] no define campos, plantilla, tamaño, idioma ni versión;
- [x] no asigna impresoras, sedes, puntos, canales o estaciones;
- [x] no crea obligaciones de compra ni capacidades físicas adicionales;
- [x] no define enrutamiento, principal, alternativa o fallback;
- [x] no declara implementación ni validación física;
- [x] no deja preguntas, decisiones o bloqueos dentro de su alcance;
- [x] entrega un handoff completo y consumible a `PRINT-ARC-004`;
- [x] mantiene `PRINT-ARC-004` como única tarea siguiente reservada.

---

#### 10. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea materializa un inventario documental de identidades y propósitos. No introduce comportamiento ejecutable, eventos, permisos, datos, plantillas, contratos de trabajo, enrutamiento, reintentos, obligaciones de infraestructura ni criterios físicos de aceptación que requieran crear o modificar requisitos `TREQ-*`.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

---

#### 11. Cierre y continuidad

```text
TAREA ANTERIOR APROBADA
PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión
        ↓
TAREA CORREGIDA Y APROBADA
PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-004 — Definir aplicación propietaria de cada documento
```

La corrección de `PRINT-ARC-003` no inicia, desarrolla ni aprueba `PRINT-ARC-004` y no modifica la secuencia posterior.


### [ ] PRINT-ARC-004 — Definir aplicación propietaria de cada documento
### [ ] PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos
### [ ] PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión
### [ ] PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo
### [ ] PRINT-ARC-008 — Definir impresora principal, alternativas y fallback
### [ ] PRINT-ARC-009 — Definir estado de impresora y heartbeat
### [ ] PRINT-ARC-010 — Definir idempotencia y prevención de impresiones duplicadas
### [ ] PRINT-ARC-011 — Definir reintentos automáticos y cola de fallos
### [ ] PRINT-ARC-012 — Definir confirmación de envío, impresión y entrega cuando sea verificable
### [ ] PRINT-ARC-013 — Definir cancelación y expiración
### [ ] PRINT-ARC-014 — Definir reimpresión como acción separada y auditable
### [ ] PRINT-ARC-015 — Definir permisos de impresión, reimpresión y administración
### [ ] PRINT-ARC-016 — Definir privacidad y ocultamiento de datos sensibles
### [ ] PRINT-ARC-017 — Definir operación offline y contingencia manual
### [ ] PRINT-ARC-018 — Definir adaptadores LAN, USB, Bluetooth o puente local
### [ ] PRINT-ARC-019 — Definir monitoreo y diagnóstico por sede
### [ ] PRINT-ARC-020 — Definir alcance, prerrequisitos, métricas y criterios de aceptación del piloto de impresión

Flujo mínimo:

```text
PROCESO EMPRESARIAL
→ DOCUMENTO VERSIONADO
→ PRINT JOB
→ ROUTING
→ PRINTER ADAPTER
→ RESULTADO Y AUDITORÍA
```

La cola de impresión no autoriza la operación empresarial que originó el
documento. Solo ejecuta un trabajo ya autorizado.
