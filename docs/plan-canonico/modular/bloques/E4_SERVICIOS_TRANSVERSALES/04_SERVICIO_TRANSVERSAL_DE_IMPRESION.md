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


### ✅ PRINT-ARC-004 — Definir aplicación propietaria de cada documento

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles` — APROBADA
**Tarea siguiente:** `PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos` — RESERVADA
**Tipo de tarea:** documental; matriz materializada de propiedad funcional, origen y consumo entre aplicaciones para cada identidad imprimible aprobada
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no implementa servicios, trabajos, plantillas, rutas, permisos, colas, adaptadores ni configuración de impresoras
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** asignar exactamente una aplicación propietaria a cada una de las cincuenta salidas aprobadas en `PRINT-ARC-003`, diferenciando la aplicación que gobierna el hecho empresarial de las aplicaciones que pueden originar una solicitud, aportar datos, consumir el resultado o ejecutar una operación relacionada.

---

#### 1. Resultado sustantivo

`PRINT-ARC-004` queda cerrada con cincuenta decisiones individuales de propiedad:

- 50 identidades recibidas;
- 50 identidades materializadas;
- 50 propietarias únicas;
- 0 identidades sin propietaria;
- 0 identidades con propiedad compartida;
- 0 identidades faltantes;
- 0 identificadores duplicados;
- 0 preguntas sustantivas abiertas dentro del alcance de esta tarea.

La aplicación propietaria gobierna el hecho empresarial representado, su identidad canónica y su ciclo de vida. El servicio transversal de impresión, el trabajo de impresión, la impresora, el adaptador y la copia física nunca se convierten por sí mismos en propietarios del hecho.

---

#### 2. Regla canónica de propiedad

Para cada identidad se aplican simultáneamente estas reglas:

1. existe exactamente una aplicación propietaria;
2. la propiedad sigue al hecho empresarial y no al dispositivo que imprime;
3. iniciar, solicitar, mostrar, transportar o consumir una salida no transfiere propiedad;
4. una aplicación consumidora no puede corregir, anular, reversionar o reemitir el hecho de otra aplicación;
5. una representación física hereda la propiedad del documento o hecho canónico que representa;
6. cuando una salida combina referencias de varios dominios, cada dato fuente conserva su propietario y la aplicación asignada gobierna únicamente la composición documental que le corresponde;
7. `PRINT-ARC-005` a `PRINT-ARC-020` deberán conservar estas propietarias, salvo corrección canónica explícita de esta tarea.

```text
APLICACION PROPIETARIA DEL HECHO
≠
APLICACION QUE SOLICITA IMPRIMIR
≠
APLICACION CONSUMIDORA
≠
SERVICIO DE IMPRESION
≠
IMPRESORA FISICA
```

---

#### 3. Alcance y límites

Esta tarea incluye:

- conservar las cincuenta identidades aprobadas;
- asignar una propietaria única por identidad;
- identificar el hecho empresarial gobernado;
- identificar la aplicación funcional que puede originar la necesidad documental;
- identificar consumidoras previstas cuando existen;
- declarar el límite de propiedad por fila;
- reconciliar cobertura, unicidad y distribución por aplicación.

Esta tarea no define:

- campos, estructura de datos, plantilla, versión, tamaño, idioma o formato;
- evento o comando exacto que crea un trabajo de impresión;
- impresora, sede, punto, estación, canal o ruta;
- dispositivo principal, alternativa, fallback o capacidad física;
- estado técnico, heartbeat, idempotencia, reintentos, confirmación, cancelación o reimpresión;
- permisos, privacidad, operación offline, adaptadores, monitoreo o piloto;
- código, contratos técnicos, SQL, migraciones, configuración o cambios en Supabase.

Esas decisiones continúan exclusivamente en `PRINT-ARC-005` a `PRINT-ARC-020` conforme a sus títulos y alcances.

---

#### 4. Aplicaciones propietarias y fronteras funcionales

| Aplicación | Hechos que gobierna en esta tarea                                                                                                        | Hechos que no adquiere por consumirlos                                                                        |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `FOGO`     | Producción, preparaciones, recetas, lotes productivos, calidad, limpieza y ejecución operativa.                                          | Pedidos, pagos, compras, inventario y activos.                                                                |
| `NEXO`     | Inventario, ubicaciones, movimientos, remisiones, reposición, activos, mantenimiento y composición de reportes operativos transversales. | Orden comercial, pago, compra, lote productivo y decisión de calidad.                                         |
| `PULSO`    | Pedidos, comandas derivadas de la orden, atención al cliente, entrega comercial, reservas y beneficios.                                  | Pago, documento fiscal, inventario, compra y ejecución productiva.                                            |
| `NUMERA`   | Pagos, caja, facturación, notas financieras, conciliaciones y reportes contables.                                                        | Pedido, reserva, inventario, compra y producción.                                                             |
| `ORIGO`    | Órdenes de compra, recepciones y devoluciones frente a proveedores.                                                                      | Inventario posterior a la recepción, pago al proveedor, producción y activos.                                 |
| `ANIMA`    | No recibe propiedad sobre ninguna de las cincuenta salidas de este inventario.                                                           | La participación de una persona, responsable o custodio no convierte la salida en un hecho de talento humano. |

---

#### 5. Matriz materializada de propiedad

##### 5.1 Etiquetas

| ID           | Salida                                                    | Aplicación propietaria | Hecho empresarial gobernado                                             | Origen funcional admitido | Aplicaciones consumidoras | Límite de propiedad                                                                                                              |
| ------------ | --------------------------------------------------------- | ---------------------- | ----------------------------------------------------------------------- | ------------------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`                 | Identidad y estado del lote de producto terminado                       | FOGO                      | NEXO                      | FOGO gobierna la creación y el ciclo de vida del lote; NEXO solo consume la identidad para existencias, traslado y trazabilidad. |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`                 | Identidad y estado del lote intermedio durante producción               | FOGO                      | NEXO                      | FOGO conserva la verdad del lote intermedio; NEXO registra o consulta sus efectos de inventario sin apropiarse del lote.         |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`                 | Preparación operativa, fecha de elaboración y vigencia de uso           | FOGO                      | NEXO                      | La preparación pertenece a ejecución productiva; cualquier consumo de inventario permanece como hecho separado de NEXO.          |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`                 | Transformación operativa y nueva condición de conservación              | FOGO                      | NEXO                      | FOGO gobierna la transformación y su trazabilidad; NEXO consume el resultado para movimientos o existencias.                     |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`                 | Condición de elaboración, riesgo y restricción de manipulación          | FOGO                      | PULSO y NEXO              | FOGO gobierna la condición técnica del producto; PULSO y NEXO pueden mostrarla o transportarla sin modificarla.                  |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`                 | Decisión de calidad sobre material, preparación o lote                  | FOGO                      | NEXO                      | FOGO autoriza el cambio de estado de calidad; NEXO aplica la restricción correspondiente sobre inventario.                       |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`                | Recepción frente a proveedor y referencia del lote recibido             | ORIGO                     | NEXO y FOGO               | ORIGO gobierna la recepción comercial; NEXO incorpora existencias y FOGO consume el material recibido.                           |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`                 | Identidad y vigencia de una ubicación física de inventario              | NEXO                      | FOGO, ORIGO y PULSO       | NEXO gobierna ubicaciones y capacidades logísticas; las demás aplicaciones solo las referencian.                                 |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`                 | Identidad operativa de artículo, insumo o unidad logística              | NEXO                      | ORIGO, FOGO y PULSO       | NEXO gobierna la identidad logística usada en inventario; los dominios consumidores conservan sus propios hechos.                |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`                 | Identidad logística del bulto y su vínculo con el movimiento autorizado | NEXO                      | PULSO y FOGO              | NEXO gobierna el bulto y el movimiento; PULSO o FOGO aportan el contexto comercial o productivo sin apropiarse del traslado.     |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`                | Identidad comercial del pedido y condición de entrega al cliente        | PULSO                     | NEXO                      | PULSO gobierna el pedido; NEXO ejecuta o registra la logística sin modificar el hecho comercial.                                 |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`                 | Identidad canónica del activo o equipo                                  | NEXO                      | NINGUNA OBLIGATORIA       | La identidad del activo pertenece a NEXO; una asignación a personas o áreas no transfiere esa propiedad.                         |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`                 | Estado técnico y restricción operativa del activo                       | NEXO                      | FOGO                      | NEXO gobierna mantenimiento y disponibilidad del activo; FOGO únicamente respeta la restricción durante la operación.            |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`                 | Ejecución y vigencia del control de limpieza o sanitización             | FOGO                      | NEXO                      | FOGO gobierna el control operativo; NEXO puede asociarlo a un activo o ubicación sin modificar su resultado.                     |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`                 | Identidad y cadena de trazabilidad de la muestra o prueba               | FOGO                      | NEXO                      | FOGO gobierna la muestra y su resultado; NEXO únicamente conserva referencias logísticas cuando apliquen.                        |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`                 | Decisión operativa que origina merma, residuo o disposición             | FOGO                      | NEXO                      | FOGO gobierna la causa y autorización operativa; NEXO registra el efecto físico sobre existencias o movimiento.                  |

##### 5.2 Comandas y tiquetes operativos

| ID           | Salida                                        | Aplicación propietaria | Hecho empresarial gobernado                                           | Origen funcional admitido | Aplicaciones consumidoras | Límite de propiedad                                                                                                        |
| ------------ | --------------------------------------------- | ---------------------- | --------------------------------------------------------------------- | ------------------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `IMP-CMD-01` | Comanda de cocina                             | `PULSO`                | Orden comercial autorizada que requiere preparación en cocina         | PULSO                     | FOGO                      | PULSO gobierna ítems, cantidades y modificaciones de la orden; FOGO ejecuta la preparación sin alterar la orden comercial. |
| `IMP-CMD-02` | Comanda de bar de bebidas frías               | `PULSO`                | Orden comercial autorizada que requiere preparación en bar            | PULSO                     | FOGO                      | PULSO gobierna la orden; FOGO recibe la instrucción física para ejecutarla.                                                |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes | `PULSO`                | Orden comercial autorizada que requiere preparación en barra          | PULSO                     | FOGO                      | PULSO gobierna la orden y sus personalizaciones; FOGO gobierna únicamente la ejecución productiva.                         |
| `IMP-CMD-04` | Comanda de preparación o mise en place        | `FOGO`                 | Solicitud y ejecución de preparación interna                          | FOGO                      | NEXO                      | FOGO gobierna la preparación; NEXO participa solo cuando debe suministrar o descontar insumos.                             |
| `IMP-CMD-05` | Tiquete de expedición o recogida              | `PULSO`                | Consolidación comercial de ítems listos para entrega o retiro         | PULSO                     | FOGO y NEXO               | PULSO gobierna la condición del pedido; FOGO y NEXO comunican preparación y entrega sin asumir propiedad comercial.        |
| `IMP-CMD-06` | Solicitud interna de reposición               | `NEXO`                 | Necesidad de reposición y movimiento interno de existencias           | FOGO o NEXO               | FOGO y NEXO               | NEXO gobierna la reposición y el movimiento; FOGO puede originar la necesidad y consumir el resultado.                     |
| `IMP-CMD-07` | Modificación o adición de comanda             | `PULSO`                | Nueva versión autorizada de una orden comercial                       | PULSO                     | FOGO                      | PULSO gobierna la modificación; FOGO recibe la versión vigente y no puede modificar la orden desde la impresión.           |
| `IMP-CMD-08` | Cancelación o anulación de comanda            | `PULSO`                | Cancelación autorizada de una orden o de sus ítems                    | PULSO                     | FOGO                      | PULSO gobierna la anulación; FOGO solo detiene o ajusta la ejecución conforme a la decisión recibida.                      |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia     | `FOGO`                 | Solicitud productiva aceptada a partir de una insuficiencia detectada | NEXO                      | NEXO y FOGO               | NEXO detecta y comunica la insuficiencia; FOGO gobierna la solicitud de producción y su ejecución conforme a INT-PROD-005. |

##### 5.3 Comprobantes para cliente y caja

| ID           | Salida                                               | Aplicación propietaria | Hecho empresarial gobernado                                                     | Origen funcional admitido | Aplicaciones consumidoras | Límite de propiedad                                                                                                     |
| ------------ | ---------------------------------------------------- | ---------------------- | ------------------------------------------------------------------------------- | ------------------------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                    | `PULSO`                | Composición comercial de consumos, descuentos, impuestos y total previo al pago | PULSO                     | NUMERA                    | PULSO gobierna la cuenta asociada a la orden; NUMERA suministra o valida hechos financieros sin apropiarse de la orden. |
| `IMP-CLI-02` | Confirmación de pedido                               | `PULSO`                | Confirmación comercial de la orden, canal y condición de entrega                | PULSO                     | NINGUNA OBLIGATORIA       | PULSO gobierna el pedido y su confirmación; la copia física no crea una segunda fuente de verdad.                       |
| `IMP-CLI-03` | Comprobante de pago                                  | `NUMERA`               | Hecho de pago, referencia, medio, valor y estado financiero                     | PULSO o NUMERA            | PULSO                     | NUMERA gobierna el pago; PULSO puede iniciarlo o asociarlo a una orden sin modificar el hecho financiero.               |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente          | `NUMERA`               | Documento fiscal o contable de venta y su estado de emisión                     | NUMERA                    | PULSO                     | NUMERA gobierna la emisión fiscal o contable; PULSO solicita o entrega la representación sin sustituirla.               |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito | `NUMERA`               | Ajuste financiero o fiscal autorizado sobre una venta o pago                    | PULSO o NUMERA            | PULSO                     | NUMERA gobierna el reverso o la nota; PULSO conserva el efecto comercial asociado.                                      |
| `IMP-CLI-06` | Resumen de recogida o entrega                        | `PULSO`                | Condición comercial de recogida o entrega del pedido                            | PULSO                     | NEXO                      | PULSO gobierna el pedido y la promesa al cliente; NEXO consume el dato para ejecutar la logística.                      |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                    | `PULSO`                | Reserva comercial y vínculo con el anticipo registrado                          | PULSO                     | NUMERA                    | PULSO gobierna la reserva; NUMERA gobierna separadamente el hecho de anticipo incorporado como referencia.              |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                | `PULSO`                | Beneficio comercial autorizado, vigencia y condiciones de uso                   | PULSO                     | NUMERA                    | PULSO gobierna el beneficio; NUMERA consume únicamente su efecto financiero cuando corresponda.                         |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja    | `NUMERA`               | Apertura, movimientos, cierre y liquidación financiera de caja                  | NUMERA                    | PULSO                     | NUMERA gobierna los totales y la liquidación; PULSO consume la disponibilidad o estado operativo de caja.               |

##### 5.4 Documentos convencionales

| ID           | Salida                                              | Aplicación propietaria | Hecho empresarial gobernado                                                             | Origen funcional admitido | Aplicaciones consumidoras | Límite de propiedad                                                                                                      |
| ------------ | --------------------------------------------------- | ---------------------- | --------------------------------------------------------------------------------------- | ------------------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `IMP-DOC-01` | Remisión o nota de despacho                         | `NEXO`                 | Movimiento, salida o entrega logística autorizada                                       | NEXO                      | PULSO, FOGO y ORIGO       | NEXO gobierna la remisión y su ciclo; las aplicaciones relacionadas aportan el motivo comercial, productivo o de compra. |
| `IMP-DOC-02` | Manifiesto de traslado interno                      | `NEXO`                 | Traslado interno de artículos entre ubicaciones o sedes                                 | NEXO                      | FOGO                      | NEXO gobierna origen, destino, contenido y estado del traslado; FOGO consume la disponibilidad resultante.               |
| `IMP-DOC-03` | Hoja de conteo de inventario                        | `NEXO`                 | Sesión de conteo físico y universo de artículos a verificar                             | NEXO                      | FOGO y ORIGO              | NEXO gobierna el conteo; las demás aplicaciones pueden aportar referencias sin modificar el resultado.                   |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario      | `NEXO`                 | Diferencia detectada y ajuste autorizado de existencias                                 | NEXO                      | FOGO y NUMERA             | NEXO gobierna la diferencia y el ajuste físico; NUMERA conserva por separado el efecto contable.                         |
| `IMP-DOC-05` | Orden de compra                                     | `ORIGO`                | Compromiso de compra autorizado frente a proveedor                                      | ORIGO                     | NUMERA y NEXO             | ORIGO gobierna la orden; NUMERA consume compromisos financieros y NEXO prepara la recepción.                             |
| `IMP-DOC-06` | Acta o comprobante de recepción                     | `ORIGO`                | Recepción de bienes o servicios frente a una compra o proveedor                         | ORIGO                     | NEXO y NUMERA             | ORIGO gobierna la conformidad de recepción; NEXO incorpora existencias y NUMERA procesa obligaciones asociadas.          |
| `IMP-DOC-07` | Devolución a proveedor                              | `ORIGO`                | Devolución comercial autorizada frente al proveedor                                     | ORIGO                     | NEXO y NUMERA             | ORIGO gobierna la devolución; NEXO ejecuta la salida física y NUMERA registra el efecto financiero.                      |
| `IMP-DOC-08` | Orden de producción o ficha de lote                 | `FOGO`                 | Autorización y ejecución de una orden o lote de producción                              | FOGO                      | NEXO                      | FOGO gobierna la orden y el lote; NEXO suministra y recibe movimientos de inventario asociados.                          |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica               | `FOGO`                 | Definición versionada de elaboración o ejecución operativa                              | FOGO                      | NEXO                      | FOGO gobierna contenido, versión y vigencia técnica; NEXO solo referencia insumos o activos relacionados.                |
| `IMP-DOC-10` | Registro de calidad o no conformidad                | `FOGO`                 | Hallazgo de calidad, decisión y seguimiento productivo                                  | FOGO                      | NEXO                      | FOGO gobierna el hallazgo y su cierre; NEXO aplica bloqueos o movimientos físicos derivados.                             |
| `IMP-DOC-11` | Orden de mantenimiento                              | `NEXO`                 | Solicitud, autorización y estado de intervención de un activo                           | NEXO                      | FOGO                      | NEXO gobierna mantenimiento y disponibilidad; FOGO comunica necesidad o consume el resultado.                            |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo    | `NEXO`                 | Custodia, condición y ubicación vigente de un activo                                    | NEXO                      | NINGUNA OBLIGATORIA       | NEXO gobierna el activo y su custodia; la persona o área receptora no se convierte en propietaria del registro.          |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico              | `NEXO`                 | Incidente técnico, impacto, diagnóstico y resolución sobre activos o servicios internos | NEXO                      | NINGUNA OBLIGATORIA       | NEXO gobierna el caso técnico y su cierre; el área afectada aporta evidencia sin asumir propiedad del incidente.         |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo | `FOGO`                 | Control periódico de limpieza, sanitización o ejecución operativa                       | FOGO                      | NEXO                      | FOGO gobierna el control y su cumplimiento; NEXO aporta referencias de ubicación o activo cuando corresponda.            |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación        | `NUMERA`               | Información contable, conciliación y liquidación financiera autorizada                  | NUMERA                    | NEXO                      | NUMERA gobierna cifras, periodos y cierres; NEXO puede consumir resúmenes para gestión sin modificar los hechos.         |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales     | `NEXO`                 | Composición y publicación del resumen transversal de gestión                            | NEXO                      | NINGUNA OBLIGATORIA       | NEXO gobierna la composición del reporte; FOGO, PULSO, NUMERA, ORIGO y NEXO conservan la propiedad de cada dato fuente.  |

---

#### 6. Reconciliación cuantitativa

##### 6.1 Cobertura por familia

| Familia                          | Esperadas | Materializadas | Sin propietaria | Propiedad compartida | Faltantes | Duplicadas | Estado        |
| -------------------------------- | --------: | -------------: | --------------: | -------------------: | --------: | ---------: | ------------- |
| Etiquetas                        |        16 |             16 |               0 |                    0 |         0 |          0 | `CERRADA`     |
| Comandas y tiquetes operativos   |         9 |              9 |               0 |                    0 |         0 |          0 | `CERRADA`     |
| Comprobantes para cliente y caja |         9 |              9 |               0 |                    0 |         0 |          0 | `CERRADA`     |
| Documentos convencionales        |        16 |             16 |               0 |                    0 |         0 |          0 | `CERRADA`     |
| **Total**                        |    **50** |         **50** |           **0** |                **0** |     **0** |      **0** | **`CERRADA`** |

##### 6.2 Distribución por aplicación propietaria

| Aplicación propietaria | Etiquetas | Comandas / tiquetes | Cliente / caja | Documentos |  Total |
| ---------------------- | --------: | ------------------: | -------------: | ---------: | -----: |
| `FOGO`                 |         9 |                   2 |              0 |          4 | **15** |
| `NEXO`                 |         5 |                   1 |              0 |          8 | **14** |
| `PULSO`                |         1 |                   6 |              5 |          0 | **12** |
| `NUMERA`               |         0 |                   0 |              4 |          1 |  **5** |
| `ORIGO`                |         1 |                   0 |              0 |          3 |  **4** |
| `ANIMA`                |         0 |                   0 |              0 |          0 |  **0** |
| **Total**              |    **16** |               **9** |          **9** |     **16** | **50** |

##### 6.3 Integridad de decisiones

```text
IDENTIDADES RECIBIDAS DE PRINT-ARC-003: 50
IDENTIDADES MATERIALIZADAS: 50
IDENTIFICADORES UNICOS: 50
IDENTIFICADORES DUPLICADOS: 0
IDENTIDADES SIN PROPIETARIA: 0
IDENTIDADES CON MAS DE UNA PROPIETARIA: 0
IDENTIDADES SIN HECHO GOBERNADO: 0
IDENTIDADES SIN LIMITE DE PROPIEDAD: 0
DECISIONES ABIERTAS DENTRO DE PRINT-ARC-004: 0
```

---

#### 7. Decisiones canónicas consolidadas

1. `FOGO` es propietaria de las salidas cuyo hecho central es producción, preparación, lote productivo, receta, calidad, limpieza o control operativo.
2. `NEXO` es propietaria de las salidas cuyo hecho central es inventario, ubicación, movimiento, remisión, reposición, activo, mantenimiento o composición de un reporte operativo transversal.
3. `PULSO` es propietaria de las salidas cuyo hecho central es pedido, comanda derivada de una orden, atención, entrega comercial, reserva o beneficio.
4. `NUMERA` es propietaria de las salidas cuyo hecho central es pago, caja, factura, nota financiera, conciliación o liquidación.
5. `ORIGO` es propietaria de las salidas cuyo hecho central es compra, recepción o devolución frente a proveedor.
6. `ANIMA` no recibe propiedad en este inventario porque ninguna de las cincuenta identidades representa como hecho principal una relación laboral, expediente de persona o proceso de talento humano.
7. `IMP-CMD-09` pertenece a `FOGO`: `NEXO` detecta la insuficiencia y origina la solicitud, pero `FOGO` gobierna la producción solicitada y su ejecución.
8. `IMP-CLI-07` pertenece a `PULSO`: la reserva es el hecho documental principal; el anticipo asociado permanece como hecho financiero propiedad de `NUMERA`.
9. `IMP-DOC-16` pertenece a `NEXO` únicamente como composición del resumen transversal; cada aplicación fuente conserva la propiedad de sus métricas y hechos subyacentes.
10. El servicio transversal de impresión no es propietario de ninguna salida y no puede alterar el hecho empresarial por medio de plantillas, colas, reintentos, rutas o dispositivos.
11. La impresión, reimpresión, cancelación del trabajo físico o falla del dispositivo no modifica por sí misma el estado del documento empresarial.
12. Ninguna tarea posterior puede cambiar silenciosamente una propietaria para simplificar implementación o enrutamiento.

---

#### 8. Handoff cerrado hacia `PRINT-ARC-005`

`PRINT-ARC-005` recibe las mismas cincuenta identidades y, para cada una, una propietaria única ya cerrada. Deberá definir plantilla, versión, tamaño y datos requeridos sin:

- fusionar o eliminar identidades;
- cambiar nombres o códigos `IMP-*`;
- transferir propiedad por conveniencia técnica;
- convertir una aplicación consumidora en fuente canónica;
- duplicar el hecho empresarial dentro del servicio de impresión;
- confundir datos fuente con propiedad de la composición documental.

La tarea siguiente podrá decidir qué campos provienen de otras aplicaciones, pero cada campo deberá conservar su fuente autorizada y la salida deberá mantener la propietaria aprobada en esta matriz.

---

#### 9. Criterios de aceptación

`PRINT-ARC-004` queda documentalmente satisfecha porque:

- [x] conserva las cincuenta identidades aprobadas en `PRINT-ARC-003`;
- [x] materializa una decisión individual para cada identidad;
- [x] asigna exactamente una aplicación propietaria por salida;
- [x] identifica el hecho empresarial gobernado por fila;
- [x] diferencia propietaria, origen funcional y consumidoras;
- [x] declara el límite de propiedad por fila;
- [x] reporta 50 esperadas, 50 materializadas, 0 faltantes y 0 duplicadas;
- [x] reporta 0 identidades sin propietaria y 0 propiedades compartidas;
- [x] reconcilia 15 salidas de `FOGO`, 14 de `NEXO`, 12 de `PULSO`, 5 de `NUMERA`, 4 de `ORIGO` y 0 de `ANIMA`;
- [x] conserva la separación entre hecho empresarial y ejecución física de impresión;
- [x] no define datos, plantillas, tamaños, versiones o idiomas;
- [x] no define impresoras, rutas, fallbacks, permisos, adaptadores o piloto;
- [x] no modifica código, contratos técnicos, datos, migraciones ni Supabase;
- [x] no deja preguntas, decisiones ni bloqueos dentro del alcance de esta tarea;
- [x] entrega un handoff completo a `PRINT-ARC-005` como única tarea siguiente reservada.

---

#### 10. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea asigna propiedad documental y fronteras funcionales a identidades ya aprobadas. No introduce eventos ejecutables, esquemas de datos, plantillas, permisos, contratos de trabajo de impresión, reglas de enrutamiento, reintentos, infraestructura ni criterios físicos de aceptación que requieran crear o modificar requisitos `TREQ-*`.

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
PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles
        ↓
TAREA ACTUAL APROBADA
PRINT-ARC-004 — Definir aplicación propietaria de cada documento
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos
```

La aprobación de `PRINT-ARC-004` no inicia, desarrolla ni aprueba `PRINT-ARC-005` y no modifica la secuencia posterior.


### ✅ PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-004 — Definir aplicación propietaria de cada documento` — APROBADA
**Tarea siguiente:** `PRINT-ARC-006 — Definir tiempo de vida y reglas de retención` — RESERVADA
**Tipo de tarea:** documental; catálogo materializado de plantillas, versiones, perfiles físicos y contratos mínimos de datos para las cincuenta identidades imprimibles aprobadas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no implementa renderizadores, adaptadores, rutas, colas, configuración de impresoras, código, SQL, migraciones ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar una plantilla versionada, un perfil físico objetivo y un contrato mínimo de datos para cada una de las cincuenta salidas aprobadas, conservando identidad, nombre y aplicación propietaria sin anticipar enrutamiento, retención, eventos, reintentos, permisos, privacidad, adaptadores o piloto.

---

#### 1. Resultado sustantivo

`PRINT-ARC-005` queda cerrada con cincuenta definiciones individuales y consumibles:

- 50 identidades recibidas de `PRINT-ARC-004`;
- 50 identidades materializadas;
- 50 identificadores únicos de plantilla;
- 50 versiones iniciales `1.0.0`;
- 6 perfiles físicos normalizados;
- 50 contratos de datos requeridos;
- 50 mínimos visibles obligatorios;
- 0 identidades sin plantilla;
- 0 identidades sin tamaño;
- 0 identidades sin datos requeridos;
- 0 faltantes;
- 0 duplicadas;
- 0 cambios de propiedad funcional;
- 0 preguntas sustantivas abiertas dentro del alcance documental.

Todas las definiciones quedan en estado `ESPECIFICADO`. Esta tarea no declara plantillas implementadas, impresiones ejecutadas ni evidencia física validada.

---

#### 2. Contrato canónico de plantilla y versión

Cada salida utiliza un identificador de plantilla estable con la forma `TPL-<ID-SALIDA>`; por ejemplo, `IMP-LBL-01` utiliza `TPL-IMP-LBL-01`.

Reglas obligatorias:

1. La versión inicial de las cincuenta plantillas es `1.0.0`.
2. La versión usa SemVer documental `MAJOR.MINOR.PATCH`.
3. `MAJOR` cambia cuando se elimina, renombra o reinterpreta un dato obligatorio, cambia el significado empresarial o se rompe compatibilidad de lectura.
4. `MINOR` cambia cuando se agrega información compatible, una sección opcional o una mejora de composición que conserva todos los datos obligatorios.
5. `PATCH` cambia por correcciones tipográficas, espaciado o ajustes visuales sin cambio semántico ni de tamaño objetivo.
6. Una versión publicada es inmutable; una corrección crea una nueva versión.
7. La solicitud de impresión deberá referenciar `salida_id`, `plantilla_id` y `plantilla_version` de forma explícita; no se permite resolver silenciosamente “la última”.
8. La aplicación propietaria gobierna los datos empresariales. El servicio de impresión solo valida presencia, compone y representa; no inventa, corrige ni completa hechos.
9. Un dato ausente no se sustituye por texto ficticio. Los campos condicionales se omiten o se marcan como no aplicables únicamente cuando el contrato de la fila lo permite.
10. El contenido se representa en español `es-CO`; las marcas de tiempo se transportan en formato RFC 3339 y se muestran en `America/Bogota`; los importes incluyen valor decimal y moneda, normalmente `COP` cuando el documento financiero así lo indique.
11. Todo texto dinámico debe envolver líneas sin invadir márgenes, códigos o campos adyacentes. No se autoriza truncar identificadores, cantidades, fechas, estados, totales, alérgenos, advertencias ni notas operativas obligatorias.

---

#### 3. Sobre común de datos `BASE-IMP-001`

Todas las filas de la matriz incluyen, además de sus datos empresariales específicos, este sobre obligatorio:

| Campo                    | Fuente autorizada                                | Regla                                                                            | Visible                                                    |
| ------------------------ | ------------------------------------------------ | -------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| `salida_id`              | catálogo canónico de impresión                   | Debe coincidir exactamente con el `IMP-*` solicitado.                            | No necesariamente; sí en metadatos de trazabilidad.        |
| `plantilla_id`           | catálogo canónico de impresión                   | Debe ser `TPL-<salida_id>`.                                                      | No necesariamente; sí en metadatos de trazabilidad.        |
| `plantilla_version`      | catálogo canónico de impresión                   | Debe existir y corresponder al contrato aprobado.                                | Sí, como texto compacto o metadato legible.                |
| `documento_id`           | aplicación propietaria                           | Identificador estable de la instancia empresarial representada.                  | Sí o codificado de forma legible por máquina en etiquetas. |
| `aplicacion_propietaria` | `PRINT-ARC-004`                                  | Debe coincidir con la propietaria de la fila.                                    | No necesariamente; obligatorio en metadatos.               |
| `empresa_id`             | contexto canónico de la aplicación propietaria   | No puede inferirse desde el dispositivo.                                         | No necesariamente.                                         |
| `sede_id`                | contexto canónico de la aplicación propietaria   | Debe representar la sede del hecho, no la ubicación de la impresora.             | Sí cuando sea operacionalmente relevante.                  |
| `emitido_en`             | aplicación propietaria                           | Marca de tiempo RFC 3339 de creación de la representación.                       | Sí.                                                        |
| `emitido_por_actor_id`   | contexto autorizado de la aplicación propietaria | Actor o principal que autorizó la emisión; admite actor de sistema identificado. | Nombre o referencia visible cuando la fila lo exige.       |
| `estado_documento`       | aplicación propietaria                           | Estado empresarial vigente al momento de emitir.                                 | Sí cuando exista estado de negocio.                        |
| `correlation_id`         | aplicación propietaria o capa transversal        | Correlación técnica estable para auditoría; no reemplaza `documento_id`.         | No; permanece en metadatos o código de trazabilidad.       |

Para etiquetas, `codigo_maquina` representa un código de barras o código 2D que contiene como mínimo `salida_id`, `documento_id` y una referencia verificable a la instancia canónica; no debe contener datos sensibles completos.

---

#### 4. Perfiles físicos normalizados

Los perfiles son objetivos documentales y no asignan impresora principal, sede, estación, ruta ni fallback. Las dimensiones de etiquetas no exceden 100 mm de ancho para permanecer dentro de la capacidad física inventariada de 104 mm; la compatibilidad real con medio cargado se valida posteriormente.

| Perfil              | Familia física                | Tamaño objetivo                   | Reglas de composición                                                                                  |
| ------------------- | ----------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `PERF-LBL-100X50-H` | Etiqueta horizontal           | 100 × 50 mm                       | Una cara; margen de seguridad mínimo de 2 mm; contenido crítico en texto y código legible por máquina. |
| `PERF-LBL-75X50-H`  | Etiqueta horizontal compacta  | 75 × 50 mm                        | Una cara; margen de seguridad mínimo de 2 mm; sin reducción automática de campos obligatorios.         |
| `PERF-LBL-100X75-H` | Etiqueta horizontal de alerta | 100 × 75 mm                       | Una cara; estado o advertencia en primera jerarquía visual; margen de seguridad mínimo de 2 mm.        |
| `PERF-TKT-80-V`     | Tiquete vertical              | Rollo de 80 mm; longitud variable | Una cara; crecimiento vertical; no cortar texto, ítems, totales ni notas obligatorias.                 |
| `PERF-A4-P`         | Documento A4 vertical         | 210 × 297 mm                      | Márgenes mínimos de 10 mm; encabezado repetible; paginación obligatoria cuando exceda una página.      |
| `PERF-A4-L`         | Documento A4 horizontal       | 297 × 210 mm                      | Márgenes mínimos de 10 mm; encabezado repetible; paginación obligatoria cuando exceda una página.      |

#### 5. Estructura mínima de las plantillas

##### 5.1 Etiquetas

- zona de identidad: nombre, referencia empresarial y código;
- zona de estado: condición vigente, advertencia o restricción cuando aplique;
- zona temporal: elaboración, emisión, vigencia o vencimiento según la fila;
- zona de trazabilidad: identificador humano y `codigo_maquina`;
- ningún dato crítico puede depender exclusivamente de color.

##### 5.2 Comandas y tiquetes operativos

- encabezado: tipo de salida, número o referencia, versión y fecha/hora;
- cuerpo: ítems o instrucciones en orden determinista, sin omitir modificadores, notas ni alertas;
- cierre: estado, responsable o autorización cuando aplique y versión de plantilla;
- la longitud crece verticalmente; no se permite cortar contenido obligatorio.

##### 5.3 Comprobantes para cliente y caja

- encabezado de identificación del documento y referencia comercial o financiera;
- detalle completo de conceptos, valores y estados aplicables;
- totales y moneda con jerarquía visual superior al detalle;
- referencias de validación o documento origen cuando apliquen;
- los datos fiscales o financieros provienen de `NUMERA`; la plantilla no recalcula impuestos, saldos o totales.

##### 5.4 Documentos convencionales

- encabezado: tipo, número, fecha, empresa, sede y estado;
- referencias de origen y partes involucradas;
- cuerpo tabular o secciones completas sin pérdida de filas;
- responsables, aprobaciones, aceptaciones o espacios de captura definidos por la fila;
- pie con `documento_id`, versión de plantilla, fecha de emisión y paginación `página n de m`.

---

#### 6. Matriz materializada de las cincuenta plantillas

La notación `APLICACION:{campo_1, campo_2}` identifica simultáneamente el dato requerido y su fuente funcional autorizada. `CAPTURA_FISICA` identifica espacios que deben existir en la plantilla para diligenciamiento controlado posterior y no datos inventados al emitir.

| ID de salida | Salida                                                    | Propietaria | Plantilla        | Versión | Perfil / tamaño     | Datos requeridos y fuente                                                                                                                                                                                                                                                                                       | Visible obligatorio                                                                                                                                                                    | Estado / bloqueo                          |
| ------------ | --------------------------------------------------------- | ----------- | ---------------- | ------- | ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `TPL-IMP-LBL-01` | `1.0.0` | `PERF-LBL-100X50-H` | BASE-IMP-001 + FOGO:{lote_id, producto_id, producto_nombre, producto_sku, fecha_produccion, fecha_vencimiento, estado_lote, cantidad, unidad}; NEXO:{ubicacion_codigo}                                                                                                                                          | producto_nombre; producto_sku; lote_id; fecha_produccion; fecha_vencimiento; estado_lote; cantidad_unidad; ubicacion_codigo; codigo_maquina                                            | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `TPL-IMP-LBL-02` | `1.0.0` | `PERF-LBL-100X50-H` | BASE-IMP-001 + FOGO:{lote_id, producto_intermedio_id, producto_intermedio_nombre, producto_sku, fecha_elaboracion, fecha_limite_uso, estado_lote, cantidad, unidad}; NEXO:{ubicacion_codigo}                                                                                                                    | producto_intermedio_nombre; producto_sku; lote_id; fecha_elaboracion; fecha_limite_uso; estado_lote; cantidad_unidad; ubicacion_codigo; codigo_maquina                                 | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `TPL-IMP-LBL-03` | `1.0.0` | `PERF-LBL-75X50-H`  | BASE-IMP-001 + FOGO:{preparacion_id, preparacion_nombre, fecha_hora_elaboracion, fecha_hora_limite_uso, responsable_nombre, estado, alergenos_resumen}; NEXO:{ubicacion_codigo}                                                                                                                                 | preparacion_nombre; preparacion_id; fecha_hora_elaboracion; fecha_hora_limite_uso; responsable_nombre; estado; alergenos_resumen; ubicacion_codigo                                     | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `TPL-IMP-LBL-04` | `1.0.0` | `PERF-LBL-75X50-H`  | BASE-IMP-001 + FOGO:{transformacion_id, producto_id, producto_nombre, lote_origen, fecha_hora_apertura, fecha_hora_limite_uso, cantidad, unidad, responsable_nombre}; NEXO:{contenedor_id, ubicacion_codigo}                                                                                                    | producto_nombre; lote_origen; transformacion_id; fecha_hora_apertura; fecha_hora_limite_uso; cantidad_unidad; responsable_nombre; contenedor_id                                        | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `TPL-IMP-LBL-05` | `1.0.0` | `PERF-LBL-100X75-H` | BASE-IMP-001 + FOGO:{objeto_id, objeto_tipo, nombre, alergenos, restricciones_manipulacion, riesgo_contacto_cruzado, estado, aprobado_por}                                                                                                                                                                      | nombre; objeto_id; alergenos; restricciones_manipulacion; riesgo_contacto_cruzado; estado; aprobado_por; codigo_maquina                                                                | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `TPL-IMP-LBL-06` | `1.0.0` | `PERF-LBL-100X75-H` | BASE-IMP-001 + FOGO:{objeto_id, objeto_tipo, estado_calidad, motivo, decision_en, decidido_por, restriccion_operativa}; NEXO:{ubicacion_codigo}                                                                                                                                                                 | estado_calidad; objeto_tipo; objeto_id; motivo; decision_en; decidido_por; restriccion_operativa; ubicacion_codigo; codigo_maquina                                                     | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `TPL-IMP-LBL-07` | `1.0.0` | `PERF-LBL-100X50-H` | BASE-IMP-001 + ORIGO:{recepcion_id, proveedor_id, proveedor_nombre, orden_compra_ref, fecha_recepcion, lote_proveedor, producto_nombre, cantidad, unidad}; NEXO:{articulo_sku, ubicacion_destino_codigo}                                                                                                        | producto_nombre; articulo_sku; lote_proveedor; proveedor_nombre; recepcion_id; fecha_recepcion; cantidad_unidad; ubicacion_destino_codigo; codigo_maquina                              | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `TPL-IMP-LBL-08` | `1.0.0` | `PERF-LBL-100X50-H` | BASE-IMP-001 + NEXO:{ubicacion_id, ubicacion_codigo, ubicacion_nombre, tipo_ubicacion, sede_codigo, capacidad_o_restriccion, estado}                                                                                                                                                                            | ubicacion_codigo; ubicacion_nombre; tipo_ubicacion; sede_codigo; capacidad_o_restriccion; estado; codigo_maquina                                                                       | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `TPL-IMP-LBL-09` | `1.0.0` | `PERF-LBL-75X50-H`  | BASE-IMP-001 + NEXO:{articulo_id, sku, articulo_nombre, unidad_base, tipo_articulo, estado}                                                                                                                                                                                                                     | articulo_nombre; sku; articulo_id; unidad_base; tipo_articulo; estado; codigo_maquina                                                                                                  | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `TPL-IMP-LBL-10` | `1.0.0` | `PERF-LBL-100X75-H` | BASE-IMP-001 + NEXO:{bulto_id, movimiento_id, origen_codigo, destino_codigo, contenido_resumen, cantidad_unidades, estado}; PULSO/FOGO/ORIGO:{documento_origen_ref}                                                                                                                                             | bulto_id; movimiento_id; origen_codigo; destino_codigo; contenido_resumen; cantidad_unidades; estado; documento_origen_ref; codigo_maquina                                             | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `TPL-IMP-LBL-11` | `1.0.0` | `PERF-LBL-100X75-H` | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, cliente_alias, canal, modalidad_entrega, fecha_hora_prometida, estado, cantidad_bultos}; NEXO:{punto_entrega_codigo}                                                                                                                                             | numero_orden; pedido_id; cliente_alias; modalidad_entrega; fecha_hora_prometida; estado; cantidad_bultos; punto_entrega_codigo; codigo_maquina                                         | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `TPL-IMP-LBL-12` | `1.0.0` | `PERF-LBL-100X50-H` | BASE-IMP-001 + NEXO:{activo_id, codigo_activo, activo_nombre, categoria, numero_serie_si_existe, sede_codigo, ubicacion_codigo, estado}                                                                                                                                                                         | codigo_activo; activo_nombre; categoria; numero_serie_si_existe; sede_codigo; ubicacion_codigo; estado; codigo_maquina                                                                 | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `TPL-IMP-LBL-13` | `1.0.0` | `PERF-LBL-100X75-H` | BASE-IMP-001 + NEXO:{activo_id, codigo_activo, estado_tecnico, tipo_intervencion, restriccion_uso, fecha_inicio, fecha_proxima_revision, responsable_o_proveedor}                                                                                                                                               | estado_tecnico; codigo_activo; tipo_intervencion; restriccion_uso; fecha_inicio; fecha_proxima_revision; responsable_o_proveedor; codigo_maquina                                       | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `TPL-IMP-LBL-14` | `1.0.0` | `PERF-LBL-75X50-H`  | BASE-IMP-001 + FOGO:{control_id, objeto_o_area, procedimiento, fecha_hora_ejecucion, fecha_hora_vigencia, resultado, responsable_nombre}; NEXO:{activo_o_ubicacion_id}                                                                                                                                          | objeto_o_area; procedimiento; fecha_hora_ejecucion; fecha_hora_vigencia; resultado; responsable_nombre; activo_o_ubicacion_id; codigo_maquina                                          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `TPL-IMP-LBL-15` | `1.0.0` | `PERF-LBL-75X50-H`  | BASE-IMP-001 + FOGO:{muestra_id, tipo_muestra, producto_o_lote_ref, fecha_hora_toma, responsable_nombre, cadena_custodia_ref, estado}; NEXO:{ubicacion_conservacion_codigo}                                                                                                                                     | muestra_id; tipo_muestra; producto_o_lote_ref; fecha_hora_toma; responsable_nombre; estado; ubicacion_conservacion_codigo; codigo_maquina                                              | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `TPL-IMP-LBL-16` | `1.0.0` | `PERF-LBL-75X50-H`  | BASE-IMP-001 + FOGO:{registro_id, tipo_registro, material_o_producto_ref, cantidad, unidad, motivo, fecha_hora, autorizado_por, disposicion}; NEXO:{movimiento_inventario_ref}                                                                                                                                  | tipo_registro; material_o_producto_ref; cantidad_unidad; motivo; fecha_hora; autorizado_por; disposicion; movimiento_inventario_ref; codigo_maquina                                    | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `TPL-IMP-CMD-01` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, version_orden, fecha_hora, modalidad_servicio, prioridad, items[{linea_id, nombre, cantidad, modificadores, notas, alergenos}], observacion_general}                                                                                                             | numero_orden; version_orden; fecha_hora; modalidad_servicio; prioridad; items completos; modificadores; notas; alergenos; observacion_general                                          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `TPL-IMP-CMD-02` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, version_orden, fecha_hora, modalidad_servicio, prioridad, items[{linea_id, nombre, cantidad, modificadores, notas, alergenos}], observacion_general}                                                                                                             | numero_orden; version_orden; fecha_hora; modalidad_servicio; prioridad; items completos; modificadores; notas; alergenos; observacion_general                                          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `TPL-IMP-CMD-03` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, version_orden, fecha_hora, modalidad_servicio, prioridad, items[{linea_id, nombre, cantidad, modificadores, notas, alergenos}], observacion_general}                                                                                                             | numero_orden; version_orden; fecha_hora; modalidad_servicio; prioridad; items completos; modificadores; notas; alergenos; observacion_general                                          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `TPL-IMP-CMD-04` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + FOGO:{solicitud_preparacion_id, preparacion_id, preparacion_nombre, cantidad, unidad, prioridad, fecha_hora_requerida, notas, solicitado_por}; NEXO:{insumos_requeridos_ref}                                                                                                                     | solicitud_preparacion_id; preparacion_nombre; cantidad_unidad; prioridad; fecha_hora_requerida; notas; solicitado_por; insumos_requeridos_ref                                          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `TPL-IMP-CMD-05` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, cliente_alias, modalidad_entrega, items_resumen, fecha_hora_compromiso, estado_pedido}; FOGO:{estado_preparacion}; NEXO:{punto_entrega_codigo}                                                                                                                   | numero_orden; cliente_alias; modalidad_entrega; items_resumen; fecha_hora_compromiso; estado_pedido; estado_preparacion; punto_entrega_codigo                                          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `TPL-IMP-CMD-06` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + NEXO:{reposicion_id, articulo_id, articulo_sku, articulo_nombre, cantidad, unidad, ubicacion_origen_codigo, ubicacion_destino_codigo, prioridad, motivo, solicitado_en, estado}; FOGO:{solicitud_operativa_ref}                                                                                  | reposicion_id; articulo_sku; articulo_nombre; cantidad_unidad; ubicacion_origen_codigo; ubicacion_destino_codigo; prioridad; motivo; solicitado_en; estado                             | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `TPL-IMP-CMD-07` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, version_orden, modificacion_id, fecha_hora, cambios_items[{linea_id, accion, cantidad, detalle}], motivo, autorizado_por}                                                                                                                                        | numero_orden; version_orden; modificacion_id; fecha_hora; cambios_items completos; motivo; autorizado_por; indicador MODIFICACION                                                      | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `TPL-IMP-CMD-08` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, version_orden, cancelacion_id, items_cancelados[{linea_id, cantidad, detalle}], motivo, fecha_hora, autorizado_por}                                                                                                                                              | numero_orden; version_orden; cancelacion_id; items_cancelados completos; motivo; fecha_hora; autorizado_por; indicador CANCELACION                                                     | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `TPL-IMP-CMD-09` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + FOGO:{solicitud_produccion_id, producto_o_preparacion_id, nombre, cantidad, unidad, prioridad, fecha_hora_requerida, motivo, estado}; NEXO:{insuficiencia_id, articulo_sku, disponibilidad_actual, ubicacion_codigo}                                                                             | solicitud_produccion_id; nombre; cantidad_unidad; prioridad; fecha_hora_requerida; motivo; estado; insuficiencia_id; articulo_sku; disponibilidad_actual                               | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `TPL-IMP-CLI-01` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, fecha_hora, items[{nombre, cantidad, valor_unitario, total_linea}], observaciones}; NUMERA:{subtotal, descuentos, impuestos, total, moneda}                                                                                                                      | numero_orden; fecha_hora; items completos; subtotal; descuentos; impuestos; total; moneda; leyenda NO ES COMPROBANTE FISCAL cuando corresponda                                         | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `TPL-IMP-CLI-02` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, fecha_hora, canal, items[{nombre, cantidad, modificadores}], estado, modalidad_entrega, fecha_hora_prometida, punto_entrega}                                                                                                                                     | numero_orden; fecha_hora; canal; items completos; estado; modalidad_entrega; fecha_hora_prometida; punto_entrega                                                                       | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `TPL-IMP-CLI-03` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + NUMERA:{pago_id, referencia_pago, fecha_hora, medio_pago, valor, moneda, estado, autorizacion_ref_si_aplica}; PULSO:{pedido_id, numero_orden}                                                                                                                                                    | pago_id; referencia_pago; fecha_hora; medio_pago; valor; moneda; estado; autorizacion_ref_si_aplica; numero_orden                                                                      | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `TPL-IMP-CLI-04` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + NUMERA:{documento_venta_id, tipo_documento, numero, prefijo_si_aplica, fecha_emision, emisor_identificacion, adquirente_identificacion_si_aplica, lineas, subtotal, descuentos, impuestos, total, moneda, medio_pago, estado, codigo_validacion_si_aplica}; PULSO:{pedido_id, numero_orden}      | tipo_documento; numero; fecha_emision; emisor; adquirente_si_aplica; lineas completas; subtotal; descuentos; impuestos; total; moneda; medio_pago; estado; codigo_validacion_si_aplica | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `TPL-IMP-CLI-05` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + NUMERA:{ajuste_id, tipo_ajuste, documento_origen_ref, fecha_hora, motivo, lineas_ajuste, impuestos_ajuste, total_ajuste, moneda, estado}; PULSO:{pedido_id, numero_orden}                                                                                                                        | ajuste_id; tipo_ajuste; documento_origen_ref; fecha_hora; motivo; lineas_ajuste; impuestos_ajuste; total_ajuste; moneda; estado; numero_orden                                          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `TPL-IMP-CLI-06` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{pedido_id, numero_orden, modalidad_entrega, fecha_hora_compromiso, punto_entrega, cliente_alias, items_o_bultos, estado}; NEXO:{entrega_o_movimiento_ref}                                                                                                                                 | numero_orden; modalidad_entrega; fecha_hora_compromiso; punto_entrega; cliente_alias; items_o_bultos; estado; entrega_o_movimiento_ref                                                 | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `TPL-IMP-CLI-07` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{reserva_id, pedido_id, numero_orden, fecha_hora_reserva, vigencia, condiciones, estado}; NUMERA:{anticipo_id, valor, moneda, estado_anticipo}                                                                                                                                             | reserva_id; numero_orden; fecha_hora_reserva; vigencia; condiciones; estado; anticipo_id; valor; moneda; estado_anticipo                                                               | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `TPL-IMP-CLI-08` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + PULSO:{beneficio_id, tipo_beneficio, codigo, descripcion, vigencia_desde, vigencia_hasta, condiciones, valor_o_porcentaje, estado, uso_ref_si_aplica}; NUMERA:{efecto_financiero_si_aplica}                                                                                                      | beneficio_id; tipo_beneficio; codigo; descripcion; vigencia; condiciones; valor_o_porcentaje; estado; uso_ref_si_aplica                                                                | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `TPL-IMP-CLI-09` | `1.0.0` | `PERF-TKT-80-V`     | BASE-IMP-001 + NUMERA:{caja_id, sesion_caja_id, tipo_evento, apertura_en, cierre_en_si_aplica, actor_responsable, saldo_inicial, totales_por_medio, ingresos, egresos, diferencia, saldo_final, estado}; PULSO:{punto_venta_id}                                                                                 | caja_id; sesion_caja_id; tipo_evento; apertura_en; cierre_en_si_aplica; actor_responsable; totales_por_medio; ingresos; egresos; diferencia; saldo_final; estado                       | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `TPL-IMP-DOC-01` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + NEXO:{remision_id, numero, fecha, origen, destino, tercero, items[{articulo_id, sku, descripcion, cantidad, unidad}], transportador_si_aplica, estado}; PULSO/FOGO/ORIGO:{documento_origen_ref}                                                                                                  | numero; fecha; origen; destino; tercero; items completos; cantidades_unidades; transportador_si_aplica; estado; documento_origen_ref; firmas_o_aceptaciones previstas                  | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `TPL-IMP-DOC-02` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + NEXO:{traslado_id, numero, fecha, origen, destino, items[{articulo_id, sku, descripcion, cantidad, unidad}], responsables, estado}                                                                                                                                                               | numero; fecha; origen; destino; items completos; cantidades_unidades; responsables; estado; campos de entrega y recepción                                                              | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `TPL-IMP-DOC-03` | `1.0.0` | `PERF-A4-L`         | BASE-IMP-001 + NEXO:{conteo_id, fecha, sede_codigo, ubicaciones, alcance, items_esperados[{articulo_id, sku, descripcion, unidad}], responsables, estado}; CAPTURA_FISICA:{cantidad_contada, observacion, firma_contador}                                                                                       | conteo_id; fecha; sede; ubicaciones; alcance; items esperados; columnas vacías de cantidad_contada y observacion; responsables; paginacion                                             | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `TPL-IMP-DOC-04` | `1.0.0` | `PERF-A4-L`         | BASE-IMP-001 + NEXO:{ajuste_id, conteo_ref, fecha, items[{articulo_id, sku, cantidad_sistema, cantidad_contada, diferencia, causa, ajuste_propuesto}], autorizacion, estado}; NUMERA:{impacto_contable_ref_si_aplica}                                                                                           | ajuste_id; conteo_ref; fecha; items y diferencias completas; causa; ajuste_propuesto; autorizacion; estado; impacto_contable_ref_si_aplica; paginacion                                 | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `TPL-IMP-DOC-05` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + ORIGO:{orden_compra_id, numero, fecha, proveedor, condiciones_comerciales, items[{articulo_ref, descripcion, cantidad, unidad, precio_unitario, impuestos, total_linea}], subtotal, impuestos_total, total, moneda, entrega_esperada, estado}; NUMERA:{centro_costo_o_presupuesto_ref_si_aplica} | numero; fecha; proveedor; condiciones; items completos; subtotal; impuestos; total; moneda; entrega_esperada; estado; centro_costo_o_presupuesto_ref_si_aplica; aprobaciones           | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `TPL-IMP-DOC-06` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + ORIGO:{recepcion_id, numero, fecha, proveedor, orden_compra_ref, items[{articulo_ref, descripcion, cantidad_esperada, cantidad_recibida, conformidad, novedad}], responsables, estado}; NEXO:{movimiento_ingreso_ref}                                                                            | numero; fecha; proveedor; orden_compra_ref; items y conformidad; novedades; responsables; estado; movimiento_ingreso_ref; firmas_o_aceptaciones                                        | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `TPL-IMP-DOC-07` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + ORIGO:{devolucion_id, numero, fecha, proveedor, recepcion_ref, items[{articulo_ref, descripcion, cantidad, unidad, motivo, condicion}], autorizado_por, estado}; NEXO:{movimiento_salida_ref}; NUMERA:{ajuste_financiero_ref_si_aplica}                                                          | numero; fecha; proveedor; recepcion_ref; items completos; motivos y condiciones; autorizado_por; estado; movimiento_salida_ref; ajuste_financiero_ref_si_aplica                        | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `TPL-IMP-DOC-08` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + FOGO:{orden_produccion_id, lote_id, producto_id, producto_nombre, version_receta, cantidad_objetivo, unidad, fecha_inicio, fecha_fin_objetivo, insumos, etapas, controles, responsables, estado}; NEXO:{reservas_o_movimientos_ref}                                                              | orden_produccion_id; lote_id; producto; version_receta; cantidad_objetivo; fechas; insumos; etapas; controles; responsables; estado; reservas_o_movimientos_ref; paginacion            | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `TPL-IMP-DOC-09` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + FOGO:{ficha_id, tipo_ficha, producto_o_proceso, version_contenido, vigencia_desde, vigencia_hasta_si_aplica, ingredientes_o_materiales, pasos, parametros, controles, alergenos, aprobado_por, estado}                                                                                           | ficha_id; tipo; producto_o_proceso; version_contenido; vigencia; ingredientes_o_materiales; pasos; parametros; controles; alergenos; aprobado_por; estado; paginacion                  | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `TPL-IMP-DOC-10` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + FOGO:{registro_calidad_id, tipo_registro, hallazgo, fecha_hora, objeto_ref, evidencia_ref, clasificacion, decision, acciones, responsable, plazo, estado}; NEXO:{bloqueo_o_movimiento_ref_si_aplica}                                                                                             | registro_calidad_id; tipo; hallazgo; fecha_hora; objeto_ref; evidencia_ref; clasificacion; decision; acciones; responsable; plazo; estado; bloqueo_o_movimiento_ref_si_aplica          | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `TPL-IMP-DOC-11` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + NEXO:{orden_mantenimiento_id, activo_id, codigo_activo, tipo_intervencion, prioridad, descripcion, fecha_solicitud, programacion, responsable_o_proveedor, restriccion_uso, estado}                                                                                                              | orden_mantenimiento_id; activo; tipo_intervencion; prioridad; descripcion; fecha_solicitud; programacion; responsable_o_proveedor; restriccion_uso; estado; campos de cierre           | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `TPL-IMP-DOC-12` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + NEXO:{acta_id, tipo_evento, activo_id, codigo_activo, condicion, origen, destino, custodio_entrega, custodio_recibe, fecha_hora, observaciones, aceptaciones}                                                                                                                                    | acta_id; tipo_evento; activo; condicion; origen; destino; custodios; fecha_hora; observaciones; aceptaciones; paginacion                                                               | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `TPL-IMP-DOC-13` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + NEXO:{incidente_id, fecha_hora, servicio_o_activo, reportado_por, impacto, sintomas, evidencia_ref, diagnostico, acciones, responsable, estado, resolucion_en_si_aplica}                                                                                                                         | incidente_id; fecha_hora; servicio_o_activo; reportado_por; impacto; sintomas; evidencia_ref; diagnostico; acciones; responsable; estado; resolucion_en_si_aplica                      | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `TPL-IMP-DOC-14` | `1.0.0` | `PERF-A4-P`         | BASE-IMP-001 + FOGO:{control_id, tipo_control, area_o_objeto, frecuencia, fecha, actividades, criterios, resultado, novedades, responsable, verificador}; NEXO:{ubicacion_o_activo_ref}                                                                                                                         | control_id; tipo; area_o_objeto; frecuencia; fecha; actividades y criterios; resultado; novedades; responsable; verificador; ubicacion_o_activo_ref; paginacion                        | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `TPL-IMP-DOC-15` | `1.0.0` | `PERF-A4-L`         | BASE-IMP-001 + NUMERA:{reporte_id, tipo_reporte, periodo, empresa, sede_si_aplica, moneda, cuentas_o_conceptos, saldos, movimientos, conciliaciones, totales, preparado_por, aprobado_por, estado}; NEXO:{referencias_operativas_si_aplican}                                                                    | reporte_id; tipo; periodo; empresa; sede_si_aplica; moneda; cuentas_o_conceptos; saldos; movimientos; conciliaciones; totales; preparado_por; aprobado_por; estado; paginacion         | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `TPL-IMP-DOC-16` | `1.0.0` | `PERF-A4-L`         | BASE-IMP-001 + NEXO:{reporte_id, periodo, alcance, fecha_corte, resumen, alertas, preparado_por}; FOGO/PULSO/NUMERA/ORIGO/NEXO:{indicadores_autorizados[{indicador_id, nombre, valor, unidad, fuente_aplicacion, fecha_corte}]}                                                                                 | reporte_id; periodo; alcance; fecha_corte; indicadores con fuente y unidad; resumen; alertas; preparado_por; paginacion                                                                | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |

---

#### 7. Reglas de datos y representación

1. Los identificadores, versiones, cantidades, unidades, fechas, estados, valores y referencias de origen son datos tipados; no se transportan como frases libres cuando exista un campo estructurado.
2. Las cantidades se entregan como valor decimal más unidad; los valores monetarios como decimal más moneda.
3. Las listas conservan orden determinista y una identidad de línea cuando el hecho empresarial la posea.
4. Los campos `*_si_aplica` son condicionales: se muestran únicamente cuando la aplicación fuente entrega un valor válido.
5. Los campos no marcados `*_si_aplica` son obligatorios. La ausencia produce rechazo de composición; no se imprime una representación parcial como si fuera válida.
6. `CAPTURA_FISICA` solo puede usarse en plantillas que explícitamente la declaren y debe dejar espacio identificable para la captura; no se registra como dato empresarial hasta que el proceso propietario lo incorpore de forma autorizada.
7. La plantilla no calcula decisiones empresariales. Puede formatear, ordenar y subtotalizar únicamente valores ya autorizados cuando el contrato técnico posterior lo permita, conservando los valores fuente.
8. El servicio de impresión no cambia propietaria, estado, documento origen ni versión por conveniencia de dispositivo.
9. No se incluye PII completa en códigos legibles por máquina. `PRINT-ARC-015` definirá la minimización y privacidad aplicables sin eliminar los datos funcionalmente obligatorios aprobados aquí.
10. `PRINT-ARC-006` podrá definir retención y vida útil sin modificar silenciosamente plantillas, tamaños o campos requeridos.

---

#### 8. Reconciliación cuantitativa

##### 8.1 Cobertura por familia

| Familia                          | Esperadas | Materializadas | Sin plantilla | Sin perfil | Sin datos | Faltantes | Duplicadas | Estado        |
| -------------------------------- | --------: | -------------: | ------------: | ---------: | --------: | --------: | ---------: | ------------- |
| Etiquetas                        |        16 |             16 |             0 |          0 |         0 |         0 |          0 | `CERRADA`     |
| Comandas y tiquetes operativos   |         9 |              9 |             0 |          0 |         0 |         0 |          0 | `CERRADA`     |
| Comprobantes para cliente y caja |         9 |              9 |             0 |          0 |         0 |         0 |          0 | `CERRADA`     |
| Documentos convencionales        |        16 |             16 |             0 |          0 |         0 |         0 |          0 | `CERRADA`     |
| **Total**                        |    **50** |         **50** |         **0** |      **0** |     **0** |     **0** |      **0** | **`CERRADA`** |

##### 8.2 Distribución por aplicación propietaria

| Aplicación | Plantillas |
| ---------- | ---------: |
| `FOGO`     |         15 |
| `NEXO`     |         14 |
| `PULSO`    |         12 |
| `NUMERA`   |          5 |
| `ORIGO`    |          4 |
| **Total**  |     **50** |

##### 8.3 Integridad

```text
IDENTIDADES RECIBIDAS DE PRINT-ARC-004: 50
IDENTIDADES MATERIALIZADAS: 50
IDENTIFICADORES IMP-* UNICOS: 50
IDENTIFICADORES DE PLANTILLA UNICOS: 50
VERSIONES INICIALES DEFINIDAS: 50
PERFILES FISICOS DEFINIDOS: 6
CONTRATOS DE DATOS DEFINIDOS: 50
IDENTIDADES SIN PLANTILLA: 0
IDENTIDADES SIN VERSION: 0
IDENTIDADES SIN TAMANO: 0
IDENTIDADES SIN DATOS REQUERIDOS: 0
IDENTIDADES DUPLICADAS: 0
CAMBIOS DE PROPIEDAD: 0
DECISIONES ABIERTAS DENTRO DE PRINT-ARC-005: 0
```

---

#### 9. Evidencia pendiente fuera del cierre documental

La ausencia de evidencia física no bloquea la definición documental, pero no puede convertirse en una validación implícita:

| Evidencia pendiente                                                   | Estado                   | Propietario documental | Insumo                                                        | Condición de salida                                                                           |
| --------------------------------------------------------------------- | ------------------------ | ---------------------- | ------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| Medio realmente cargado y disponible por impresora                    | `PENDIENTE_DE_EVIDENCIA` | `PRINT-ARC-019`        | Registro individual de cada impresora                         | Cada impresora registra medio, ancho, disponibilidad y fecha de observación.                  |
| Compatibilidad del render y del adaptador con cada perfil             | `PENDIENTE_DE_EVIDENCIA` | `PRINT-ARC-018`        | Plantillas y perfiles de esta tarea                           | Existe render reproducible sin truncamiento para los perfiles aplicables.                     |
| Medición física, legibilidad, corte y presencia de datos obligatorios | `PENDIENTE_DE_EVIDENCIA` | `PRINT-ARC-020`        | Registros de `PRINT-ARC-019` y adaptadores de `PRINT-ARC-018` | El piloto conserva tamaño, márgenes, legibilidad y campos obligatorios con evidencia fechada. |

Estas evidencias no autorizan a `PRINT-ARC-018`, `PRINT-ARC-019` o `PRINT-ARC-020` a cambiar silenciosamente nombres, propietarias, campos o versiones; una incompatibilidad deberá regresar como corrección explícita a esta tarea.

---

#### 10. Requisitos de prueba

**NO GENERA NI MODIFICA REQUISITOS `TREQ-*`.**

Justificación: esta tarea materializa el contrato documental de entrada y representación, pero no autoriza ni implementa comportamiento ejecutable, renderizadores, validadores de payload, adaptadores, rutas o pruebas físicas. Los criterios definidos aquí son entradas obligatorias para `PRINT-ARC-018`, `PRINT-ARC-019` y `PRINT-ARC-020`; los requisitos de prueba se incorporarán en la tarea que materialice el comportamiento verificable y su procedimiento de evidencia, evitando registrar como prueba una especificación que todavía no puede ejecutarse.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

No se genera copia de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` porque su contenido permanece sin cambios.

---

#### 11. Criterios de aceptación

`PRINT-ARC-005` queda documentalmente satisfecha porque:

- [x] conserva exactamente las cincuenta identidades y nombres recibidos;
- [x] conserva las propietarias aprobadas en `PRINT-ARC-004`;
- [x] asigna un identificador de plantilla único a cada identidad;
- [x] define la versión inicial de cada plantilla;
- [x] define un tamaño objetivo para cada identidad;
- [x] define datos requeridos y fuente autorizada por identidad;
- [x] define el mínimo visible por identidad;
- [x] define reglas de composición por familia;
- [x] define reglas de versionamiento e inmutabilidad;
- [x] reporta 50 esperadas, 50 materializadas, 0 faltantes y 0 duplicadas;
- [x] distingue `ESPECIFICADO` de implementación y validación;
- [x] asigna toda evidencia posterior a una tarea concreta y una condición de salida;
- [x] no asigna impresora, sede, estación, ruta, principal, alternativa o fallback;
- [x] no define retención, evento, idempotencia, reintentos, permisos, privacidad u operación offline;
- [x] no ejecuta cambios físicos, código, SQL, migraciones ni Supabase;
- [x] declara cero cambios `TREQ-*` con justificación concreta;
- [x] mantiene `PRINT-ARC-006` como única tarea siguiente reservada.

---

#### 12. Handoff cerrado hacia `PRINT-ARC-006`

`PRINT-ARC-006` recibe cincuenta identidades con propietaria, plantilla, versión inicial, perfil físico y contrato mínimo de datos cerrados. Podrá definir vida útil y retención por identidad sin:

- renombrar o fusionar identidades;
- cambiar propietarias;
- modificar plantillas, versiones, tamaños o datos requeridos;
- declarar implementación o validación inexistente;
- iniciar enrutamiento, fallback, eventos o adaptadores.

```text
TAREA ANTERIOR APROBADA
PRINT-ARC-004 — Definir aplicación propietaria de cada documento
        ↓
TAREA ACTUAL DESARROLLADA EN ARTEFACTO APROBADA
PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-006 — Definir tiempo de vida y reglas de retención
```

La aprobación de `PRINT-ARC-005` no inicia, desarrolla ni aprueba `PRINT-ARC-006`.


### ✅ PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos` — APROBADA
**Tarea siguiente:** `PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo` — RESERVADA
**Tipo de tarea:** documental; contrato materializado, versionado y consumible para representar solicitudes atómicas de impresión sobre las cincuenta identidades aprobadas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no implementa persistencia, API, colas, rutas, adaptadores, renderizadores, código, SQL, migraciones ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir la forma canónica, inmutable y versionada de un trabajo de impresión, sus campos obligatorios, fuentes autorizadas, reglas de validación, atomicidad, trazabilidad y límites frente a enrutamiento, dispositivo y ejecución, materializando su aplicación para las cincuenta salidas heredadas.

---

#### 1. Resultado sustantivo

`PRINT-ARC-006` queda cerrada documentalmente con:

- un contrato raíz `VENTO-PRINT-JOB` versión `1.0.0`;
- una unidad atómica de trabajo definida;
- un sobre inmutable de solicitud, documento, plantilla, payload y trazabilidad;
- una matriz individual para las 50 identidades `IMP-*`;
- 50 referencias exactas a plantilla `TPL-IMP-*` versión `1.0.0`;
- 50 referencias al contrato de datos aprobado en `PRINT-ARC-005`;
- una política de validación previa al enrutamiento;
- una política de versionamiento del contrato;
- cero decisiones de ruta, impresora, fallback, heartbeat, reintento, confirmación, cancelación, reimpresión, permiso, privacidad, contingencia, adaptador, monitoreo o piloto;
- cero cambios de aplicación propietaria, plantilla, perfil físico o datos requeridos;
- cero implementación y cero evidencia operativa declarada.

Todas las filas quedan en estado `ESPECIFICADO`. El contrato es objetivo documental y todavía no existe como servicio transversal implementado.

---

#### 2. Determinación canónica del alcance y contradicción heredada

Las fuentes vigentes que gobiernan la continuidad —`00_CABECERA_Y_ESTADO.md`, `active-sequence.json`, el marcador propietario y la secuencia histórica anterior a la incorporación de `PRINT-ARC-005`— coinciden en que la tarea actual es:

```text
PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión
```

El bloque aprobado de `PRINT-ARC-005` contiene dos referencias incompatibles que describen `PRINT-ARC-006` como definición de vida útil o retención. Esa descripción no coincide con el identificador y título canónicos y no se adopta como alcance de esta tarea.

| Inconsistencia                                                               | Estado                               | Propietario documental | Condición de salida                                                                                                                                                                                 |
| ---------------------------------------------------------------------------- | ------------------------------------ | ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Título y handoff incorrectos de la siguiente tarea dentro de `PRINT-ARC-005` | `PENDIENTE_DE_CORRECCION_DOCUMENTAL` | `PRINT-ARC-005`        | Sustituir las referencias a vida útil o retención por el título exacto `PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión`, sin modificar las decisiones sustantivas de plantillas. |

La inconsistencia no impide materializar este contrato porque la identidad y el título de la tarea actual son unívocos en el estado activo y en el marcador propietario. Sí impide declarar coherencia documental integral del bloque hasta corregir `PRINT-ARC-005`.

---

#### 3. Diagnóstico técnico actual verificable

La superficie existente de impresión no constituye todavía el contrato canónico definido aquí:

| Superficie actual                                                                      | Estado observado                                                                                                                     | Brecha frente al contrato objetivo                                                                                            | Tratamiento                                                                  |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `vento-nexo/src/app/printing/jobs/page.tsx`                                            | Construye una cola local desde parámetros y `localStorage`, interpreta líneas libres y envía ZPL directamente mediante BrowserPrint. | No existe `job_id`, contrato versionado, documento canónico, payload inmutable, hash ni persistencia transversal del trabajo. | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION`; se conserva sin cambios en esta tarea. |
| `vento-nexo/src/app/printing/jobs/_lib/types.ts`                                       | Modela dispositivos, presets y ajustes locales.                                                                                      | No modela el trabajo canónico ni sus fronteras con documento, plantilla, ruta y resultado.                                    | Entrada para la implementación posterior.                                    |
| `vento-nexo/src/app/printing/designer/_lib/types.ts`                                   | Modela layouts de etiqueta con dimensiones y elementos.                                                                              | La plantilla no incluye `salida_id`, versión canónica, propietaria ni contrato de datos aprobado.                             | No se corrige en fase documental.                                            |
| `vento-nexo/src/app/api/printing/layouts/route.ts` y `public.printing_label_templates` | Persisten layouts personales de NEXO como JSON.                                                                                      | No persisten trabajos de impresión y no representan el catálogo transversal de cincuenta plantillas.                          | No se altera API, tabla, RLS ni migración.                                   |

Por tanto, ningún envío actual por BrowserPrint se presenta como evidencia de conformidad con `VENTO-PRINT-JOB` `1.0.0`.

---

#### 4. Identidad, atomicidad y fronteras del trabajo

##### 4.1 Unidad atómica

Un trabajo canónico representa exactamente:

```text
UNA INSTANCIA DOCUMENTAL
+ UNA SALIDA IMP-*
+ UNA PLANTILLA Y VERSION EXPLICITAS
+ UN PERFIL FISICO
+ UN SNAPSHOT INMUTABLE DE DATOS
+ UNA CANTIDAD DE COPIAS IDENTICAS
```

Reglas:

1. Un trabajo no mezcla dos `salida_id`, dos `documento_id`, dos plantillas ni dos versiones.
2. Varias copias idénticas del mismo snapshot pertenecen al mismo trabajo mediante `request.copies`.
3. Varias instancias documentales forman trabajos separados, incluso si el adaptador posterior puede agruparlas en una transmisión física.
4. Un lote se representa mediante `trace.batch_id`; el lote agrupa trabajos, pero no sustituye sus identidades, hashes ni auditorías individuales.
5. Un documento multipágina continúa siendo un solo trabajo si conserva un único `documento_id`, plantilla, versión y snapshot.
6. La existencia del trabajo no autoriza ni modifica el hecho empresarial. La autorización debe existir antes de crear el trabajo.
7. La creación del trabajo no significa que fue enrutado, enviado, impreso, entregado o aceptado.

##### 4.2 Separación obligatoria

```text
DOCUMENTO EMPRESARIAL AUTORIZADO
→ CANDIDATO DE TRABAJO
→ VALIDACION DE CONTRATO
→ TRABAJO CANONICO INMUTABLE
→ PRINT-ARC-007: ENRUTAMIENTO
→ TAREAS POSTERIORES: EJECUCION Y RESULTADO
```

No forman parte del sobre inmutable definido aquí:

- sede o estación de impresión;
- canal de transporte;
- impresora principal o alternativa;
- dispositivo o adaptador;
- estado técnico de impresora;
- clave de idempotencia;
- intento, reintento o cola de fallos;
- confirmación de envío, impresión o entrega;
- expiración o cancelación;
- relación de reimpresión;
- decisión de permiso;
- política de privacidad o enmascaramiento;
- contingencia offline;
- telemetría o diagnóstico;
- evidencia del piloto.

---

#### 5. Contrato raíz `VENTO-PRINT-JOB` `1.0.0`

##### 5.1 Estructura normativa

```json
{
  "contract_id": "VENTO-PRINT-JOB",
  "contract_version": "1.0.0",
  "job_id": "<uuid>",
  "created_at": "<RFC3339>",
  "source": {
    "application_id": "<FOGO|NEXO|PULSO|NUMERA|ORIGO>",
    "actor_type": "<USER|SYSTEM>",
    "actor_id": "<identificador-estable>",
    "authorization_ref": "<referencia-opaca>",
    "process_ref": "<proceso-o-paso-canónico>"
  },
  "document": {
    "salida_id": "<IMP-*>",
    "documento_id": "<identificador-estable>",
    "documento_revision": "<version-o-null>",
    "aplicacion_propietaria": "<FOGO|NEXO|PULSO|NUMERA|ORIGO>",
    "empresa_id": "<identificador-estable>",
    "sede_id": "<sede-del-hecho>",
    "estado_documento": "<estado-empresarial>",
    "emitido_en": "<RFC3339>"
  },
  "template": {
    "plantilla_id": "<TPL-IMP-*>",
    "plantilla_version": "1.0.0",
    "perfil_id": "<PERF-*>",
    "locale": "es-CO",
    "timezone": "America/Bogota"
  },
  "payload": {
    "contract_ref": "PRINT-ARC-005::<IMP-*>::1.0.0",
    "data": {},
    "hash_algorithm": "SHA-256",
    "hash": "<64-hex>"
  },
  "request": {
    "operation": "PRINT",
    "copies": 1,
    "requested_at": "<RFC3339>"
  },
  "trace": {
    "correlation_id": "<identificador-estable>",
    "causation_id": "<identificador-o-null>",
    "source_event_id": "<identificador-o-null>",
    "batch_id": "<identificador-o-null>"
  }
}
```

El ejemplo anterior es una estructura normativa con marcadores tipados; no representa una ejecución ni evidencia real.

##### 5.2 Diccionario materializado de campos

| Ruta                              | Tipo                         | Obligación  | Fuente autorizada                      | Mutabilidad | Regla                                                                                  |
| --------------------------------- | ---------------------------- | ----------- | -------------------------------------- | ----------- | -------------------------------------------------------------------------------------- |
| `contract_id`                     | string literal               | requerida   | catálogo transversal                   | inmutable   | Debe ser `VENTO-PRINT-JOB`.                                                            |
| `contract_version`                | SemVer                       | requerida   | catálogo transversal                   | inmutable   | Debe ser una versión publicada y soportada.                                            |
| `job_id`                          | UUID                         | requerida   | servicio transversal de impresión      | inmutable   | Identidad única del trabajo; no es `documento_id`.                                     |
| `created_at`                      | RFC 3339                     | requerida   | servicio transversal de impresión      | inmutable   | Momento de materialización posterior a validación.                                     |
| `source.application_id`           | enum                         | requerida   | aplicación solicitante                 | inmutable   | Identifica quién solicita, no transfiere propiedad documental.                         |
| `source.actor_type`               | enum `USER` o `SYSTEM`       | requerida   | contexto autorizado                    | inmutable   | Todo actor de sistema debe tener identidad estable.                                    |
| `source.actor_id`                 | string estable               | requerida   | contexto autorizado                    | inmutable   | No admite actor anónimo.                                                               |
| `source.authorization_ref`        | string opaco                 | requerida   | decisión previa de autorización        | inmutable   | Su presencia no sustituye la validación que definirá `PRINT-ARC-015`.                  |
| `source.process_ref`              | string estable               | requerida   | catálogo de procesos y pasos           | inmutable   | Identifica el origen funcional del trabajo.                                            |
| `document.salida_id`              | enum de 50 `IMP-*`           | requerida   | `PRINT-ARC-003`                        | inmutable   | Debe existir una sola vez en la matriz vigente.                                        |
| `document.documento_id`           | string estable               | requerida   | aplicación propietaria                 | inmutable   | Identifica la instancia empresarial representada.                                      |
| `document.documento_revision`     | string o `null`              | condicional | aplicación propietaria                 | inmutable   | Se exige cuando el dominio versiona el documento; el hash siempre congela el snapshot. |
| `document.aplicacion_propietaria` | enum                         | requerida   | `PRINT-ARC-004`                        | inmutable   | Debe coincidir con la propietaria aprobada para `salida_id`.                           |
| `document.empresa_id`             | string estable               | requerida   | contexto del hecho                     | inmutable   | No se infiere desde la impresora.                                                      |
| `document.sede_id`                | string estable               | requerida   | contexto del hecho                     | inmutable   | Es la sede empresarial del documento, no la sede de destino de impresión.              |
| `document.estado_documento`       | string tipado                | requerida   | aplicación propietaria                 | inmutable   | El servicio de impresión no lo cambia.                                                 |
| `document.emitido_en`             | RFC 3339                     | requerida   | aplicación propietaria                 | inmutable   | Momento de emisión de la representación empresarial.                                   |
| `template.plantilla_id`           | enum `TPL-IMP-*`             | requerida   | `PRINT-ARC-005`                        | inmutable   | Debe ser exactamente `TPL-<salida_id>`.                                                |
| `template.plantilla_version`      | SemVer                       | requerida   | `PRINT-ARC-005`                        | inmutable   | No se permite resolver silenciosamente la última versión.                              |
| `template.perfil_id`              | enum `PERF-*`                | requerida   | `PRINT-ARC-005`                        | inmutable   | Debe coincidir con la fila materializada.                                              |
| `template.locale`                 | string literal               | requerida   | `PRINT-ARC-005`                        | inmutable   | Debe ser `es-CO` en la versión inicial.                                                |
| `template.timezone`               | string literal               | requerida   | `PRINT-ARC-005`                        | inmutable   | Debe ser `America/Bogota` en la versión inicial.                                       |
| `payload.contract_ref`            | string estable               | requerida   | `PRINT-ARC-005`                        | inmutable   | Forma `PRINT-ARC-005::<salida_id>::1.0.0`.                                             |
| `payload.data`                    | objeto JSON                  | requerida   | fuentes autorizadas de `PRINT-ARC-005` | inmutable   | Debe contener todos los campos obligatorios de la fila y ningún valor inventado.       |
| `payload.hash_algorithm`          | string literal               | requerida   | contrato transversal                   | inmutable   | Debe ser `SHA-256`.                                                                    |
| `payload.hash`                    | hexadecimal de 64 caracteres | requerida   | productor del snapshot                 | inmutable   | Se calcula sobre el JSON canónico de `payload.data`.                                   |
| `request.operation`               | string literal               | requerida   | solicitante                            | inmutable   | Debe ser `PRINT`; la reimpresión se define en `PRINT-ARC-014`.                         |
| `request.copies`                  | entero positivo              | requerida   | solicitante autorizado                 | inmutable   | Todas las copias deben ser idénticas al mismo snapshot.                                |
| `request.requested_at`            | RFC 3339                     | requerida   | solicitante                            | inmutable   | Momento en que se solicitó la impresión.                                               |
| `trace.correlation_id`            | string estable               | requerida   | aplicación o capa transversal          | inmutable   | Agrupa el trabajo con el proceso sin reemplazar `job_id`.                              |
| `trace.causation_id`              | string o `null`              | opcional    | aplicación solicitante                 | inmutable   | Identifica la causa inmediata cuando exista.                                           |
| `trace.source_event_id`           | string o `null`              | opcional    | aplicación solicitante                 | inmutable   | No crea por sí mismo un evento canónico nuevo.                                         |
| `trace.batch_id`                  | string o `null`              | opcional    | solicitante o capa transversal         | inmutable   | Agrupa trabajos atómicos sin fusionarlos.                                              |

---

#### 6. Canonicalización e inmutabilidad

1. `payload.data` se canonicaliza en UTF-8, con claves de objeto en orden lexicográfico, sin espacios insignificantes y conservando el orden de los arreglos.
2. El hash se calcula después de validar tipos, campos obligatorios y fuentes autorizadas.
3. Después de crear el trabajo no se modifican `source`, `document`, `template`, `payload`, `request` ni `trace`.
4. Una corrección de datos o plantilla no altera un trabajo existente; deberá producir una nueva solicitud conforme a las reglas que definan `PRINT-ARC-010`, `PRINT-ARC-013` y `PRINT-ARC-014`.
5. El enrutamiento y la ejecución se registrarán en estructuras separadas y no mutarán el sobre original.
6. Un adaptador puede transformar el trabajo validado a ZPL, ESC/POS, PDF u otro lenguaje soportado, pero no puede cambiar datos empresariales ni versión de plantilla.
7. La representación binaria o el comando de dispositivo no sustituye el contrato canónico ni se convierte en fuente de verdad.

---

#### 7. Validación previa al enrutamiento

Un candidato solo se convierte en trabajo canónico cuando supera, en este orden:

1. versión de contrato conocida;
2. `salida_id` existente;
3. propietaria coincidente con `PRINT-ARC-004`;
4. plantilla, versión y perfil coincidentes con `PRINT-ARC-005`;
5. campos obligatorios presentes y tipados;
6. fuentes de datos permitidas;
7. hash reproducible del payload;
8. actor, autorización y proceso de origen identificados;
9. cantidad de copias entera y positiva;
10. identificadores y tiempos con formato válido.

Motivos documentales mínimos de rechazo:

| Código                           | Condición                                                                |
| -------------------------------- | ------------------------------------------------------------------------ |
| `PRINT_JOB_UNSUPPORTED_CONTRACT` | `contract_id` o versión no soportada.                                    |
| `PRINT_JOB_UNKNOWN_OUTPUT`       | `salida_id` inexistente.                                                 |
| `PRINT_JOB_OWNER_MISMATCH`       | propietaria distinta de `PRINT-ARC-004`.                                 |
| `PRINT_JOB_TEMPLATE_MISMATCH`    | plantilla, versión o perfil distintos de `PRINT-ARC-005`.                |
| `PRINT_JOB_PAYLOAD_INVALID`      | datos faltantes, mal tipados o provenientes de una fuente no autorizada. |
| `PRINT_JOB_HASH_MISMATCH`        | hash ausente o no reproducible.                                          |
| `PRINT_JOB_ORIGIN_INVALID`       | actor, autorización o proceso de origen no identificados.                |
| `PRINT_JOB_COPIES_INVALID`       | cantidad de copias no entera o menor que uno.                            |
| `PRINT_JOB_IDENTITY_INVALID`     | identificadores o marcas de tiempo inválidos.                            |

El rechazo contractual no crea un trabajo, no envía datos a enrutamiento y no modifica el documento empresarial.

---

#### 8. Versionamiento del contrato

1. `contract_version` usa SemVer.
2. `MAJOR` cambia al eliminar, renombrar o reinterpretar un campo obligatorio, cambiar atomicidad o romper compatibilidad de validación.
3. `MINOR` cambia al agregar campos opcionales o capacidades compatibles.
4. `PATCH` cambia por aclaraciones documentales que no alteran el objeto aceptado.
5. Cada trabajo conserva su versión exacta durante toda su vida técnica.
6. Los consumidores no pueden aceptar una versión desconocida por aproximación.
7. La versión del contrato de trabajo, la versión de plantilla y la revisión del documento son identidades distintas y no se sustituyen entre sí.

---

#### 9. Matriz materializada de cobertura

| Salida       | Nombre                                                    | Propietaria | Plantilla                | Perfil              | Contrato de trabajo       | Contrato de payload                | Estado / bloqueo                          |
| ------------ | --------------------------------------------------------- | ----------- | ------------------------ | ------------------- | ------------------------- | ---------------------------------- | ----------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `TPL-IMP-LBL-01` `1.0.0` | `PERF-LBL-100X50-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-01::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `TPL-IMP-LBL-02` `1.0.0` | `PERF-LBL-100X50-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-02::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `TPL-IMP-LBL-03` `1.0.0` | `PERF-LBL-75X50-H`  | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-03::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `TPL-IMP-LBL-04` `1.0.0` | `PERF-LBL-75X50-H`  | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-04::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `TPL-IMP-LBL-05` `1.0.0` | `PERF-LBL-100X75-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-05::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `TPL-IMP-LBL-06` `1.0.0` | `PERF-LBL-100X75-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-06::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `TPL-IMP-LBL-07` `1.0.0` | `PERF-LBL-100X50-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-07::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `TPL-IMP-LBL-08` `1.0.0` | `PERF-LBL-100X50-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-08::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `TPL-IMP-LBL-09` `1.0.0` | `PERF-LBL-75X50-H`  | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-09::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `TPL-IMP-LBL-10` `1.0.0` | `PERF-LBL-100X75-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-10::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `TPL-IMP-LBL-11` `1.0.0` | `PERF-LBL-100X75-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-11::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `TPL-IMP-LBL-12` `1.0.0` | `PERF-LBL-100X50-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-12::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `TPL-IMP-LBL-13` `1.0.0` | `PERF-LBL-100X75-H` | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-13::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `TPL-IMP-LBL-14` `1.0.0` | `PERF-LBL-75X50-H`  | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-14::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `TPL-IMP-LBL-15` `1.0.0` | `PERF-LBL-75X50-H`  | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-15::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `TPL-IMP-LBL-16` `1.0.0` | `PERF-LBL-75X50-H`  | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-LBL-16::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `TPL-IMP-CMD-01` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-01::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `TPL-IMP-CMD-02` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-02::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `TPL-IMP-CMD-03` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-03::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `TPL-IMP-CMD-04` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-04::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `TPL-IMP-CMD-05` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-05::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `TPL-IMP-CMD-06` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-06::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `TPL-IMP-CMD-07` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-07::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `TPL-IMP-CMD-08` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-08::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `TPL-IMP-CMD-09` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CMD-09::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `TPL-IMP-CLI-01` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-01::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `TPL-IMP-CLI-02` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-02::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `TPL-IMP-CLI-03` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-03::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `TPL-IMP-CLI-04` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-04::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `TPL-IMP-CLI-05` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-05::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `TPL-IMP-CLI-06` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-06::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `TPL-IMP-CLI-07` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-07::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `TPL-IMP-CLI-08` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-08::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `TPL-IMP-CLI-09` `1.0.0` | `PERF-TKT-80-V`     | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-CLI-09::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `TPL-IMP-DOC-01` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-01::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `TPL-IMP-DOC-02` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-02::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `TPL-IMP-DOC-03` `1.0.0` | `PERF-A4-L`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-03::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `TPL-IMP-DOC-04` `1.0.0` | `PERF-A4-L`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-04::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `TPL-IMP-DOC-05` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-05::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `TPL-IMP-DOC-06` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-06::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `TPL-IMP-DOC-07` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-07::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `TPL-IMP-DOC-08` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-08::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `TPL-IMP-DOC-09` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-09::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `TPL-IMP-DOC-10` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-10::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `TPL-IMP-DOC-11` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-11::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `TPL-IMP-DOC-12` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-12::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `TPL-IMP-DOC-13` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-13::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `TPL-IMP-DOC-14` `1.0.0` | `PERF-A4-P`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-14::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `TPL-IMP-DOC-15` `1.0.0` | `PERF-A4-L`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-15::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `TPL-IMP-DOC-16` `1.0.0` | `PERF-A4-L`         | `VENTO-PRINT-JOB` `1.0.0` | `PRINT-ARC-005::IMP-DOC-16::1.0.0` | `ESPECIFICADO` / `SIN_BLOQUEO_DOCUMENTAL` |

---

#### 10. Reconciliación cuantitativa

##### 10.1 Cobertura por familia

| Familia                          | Esperadas | Materializadas | Sin contrato | Sin payload | Faltantes | Duplicadas | Estado        |
| -------------------------------- | --------: | -------------: | -----------: | ----------: | --------: | ---------: | ------------- |
| Etiquetas                        |        16 |             16 |            0 |           0 |         0 |          0 | `CERRADA`     |
| Comandas y tiquetes operativos   |         9 |              9 |            0 |           0 |         0 |          0 | `CERRADA`     |
| Comprobantes para cliente y caja |         9 |              9 |            0 |           0 |         0 |          0 | `CERRADA`     |
| Documentos convencionales        |        16 |             16 |            0 |           0 |         0 |          0 | `CERRADA`     |
| **Total**                        |    **50** |         **50** |        **0** |       **0** |     **0** |      **0** | **`CERRADA`** |

##### 10.2 Distribución por aplicación propietaria

| Aplicación | Trabajos cubiertos |
| ---------- | -----------------: |
| `FOGO`     |                 15 |
| `NEXO`     |                 14 |
| `PULSO`    |                 12 |
| `NUMERA`   |                  5 |
| `ORIGO`    |                  4 |
| **Total**  |             **50** |

##### 10.3 Integridad

```text
IDENTIDADES RECIBIDAS DE PRINT-ARC-005: 50
IDENTIDADES MATERIALIZADAS: 50
CONTRATOS RAIZ: 1
VERSIONES DE CONTRATO: 1
REFERENCIAS DE PLANTILLA: 50
REFERENCIAS DE PAYLOAD: 50
IDENTIFICADORES IMP-* UNICOS: 50
IDENTIDADES SIN CONTRATO: 0
IDENTIDADES SIN PLANTILLA: 0
IDENTIDADES SIN PERFIL: 0
IDENTIDADES SIN PAYLOAD: 0
IDENTIDADES DUPLICADAS: 0
CAMBIOS DE PROPIEDAD: 0
DECISIONES DE ENRUTAMIENTO: 0
DECISIONES ABIERTAS DENTRO DE PRINT-ARC-006: 0
```

---

#### 11. Reservas obligatorias para las tareas posteriores

| Alcance reservado                                     | Tarea propietaria                                       | Entrada recibida de esta tarea            | Condición de salida                                                       |
| ----------------------------------------------------- | ------------------------------------------------------- | ----------------------------------------- | ------------------------------------------------------------------------- |
| sede, área, documento, canal y dispositivo de destino | `PRINT-ARC-007`                                         | trabajo válido y contexto empresarial     | ruta determinista sin alterar el sobre inmutable                          |
| principal, alternativas y fallback                    | `PRINT-ARC-008`                                         | ruta y perfil                             | selección explícita por escenario                                         |
| estado y heartbeat de impresora                       | `PRINT-ARC-009`                                         | identidad de dispositivo                  | estado técnico verificable y fechado                                      |
| idempotencia y duplicados                             | `PRINT-ARC-010`                                         | `job_id`, documento, plantilla y hash     | reglas de identidad y deduplicación                                       |
| reintentos y fallos                                   | `PRINT-ARC-011`                                         | mismo trabajo inmutable                   | política de intentos y cola de fallo                                      |
| confirmaciones                                        | `PRINT-ARC-012`                                         | trabajo, ruta y ejecución                 | evidencias diferenciadas de envío, impresión y entrega                    |
| cancelación y expiración                              | `PRINT-ARC-013`                                         | trabajo y estado de ejecución             | transiciones y límites temporales                                         |
| reimpresión                                           | `PRINT-ARC-014`                                         | trabajo original y auditoría              | nueva acción separada y vinculada                                         |
| permisos                                              | `PRINT-ARC-015`                                         | actor, autorización y contexto            | decisiones de impresión, reimpresión y administración                     |
| privacidad                                            | `PRINT-ARC-016`                                         | payload y plantilla                       | minimización y ocultamiento por salida                                    |
| operación offline                                     | `PRINT-ARC-017`                                         | trabajo canónico y contexto local         | contingencia reconciliable                                                |
| adaptadores                                           | `PRINT-ARC-018`                                         | trabajo validado, ruta y dispositivo      | transformación reproducible a lenguaje físico                             |
| monitoreo                                             | `PRINT-ARC-019`                                         | trabajos, dispositivos e intentos         | diagnóstico por sede con evidencia                                        |
| piloto                                                | `PRINT-ARC-020`                                         | contrato implementado y tareas anteriores | aceptación física y operativa                                             |
| decisión de implementación del paquete                | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | contrato y brechas actuales               | repositorios, componentes, migraciones, pruebas y despliegues autorizados |

---

#### 12. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea materializa íntegramente el contrato documental objetivo, pero no implementa un validador, persistencia de trabajos, API, productor, consumidor, enrutador ni adaptador contra el cual ejecutar una prueba reproducible. Los futuros requisitos deberán originarse en la tarea que autorice y materialice la implementación del contrato y en las tareas `PRINT-ARC-010` a `PRINT-ARC-020`, conservando como reglas protegidas los invariantes aquí definidos. Registrar ahora requisitos como implementados o planificados produciría evidencia ficticia y asignaciones técnicas todavía no autorizadas.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

No se genera copia de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` porque el registro permanece sin cambios.

---

#### 13. Criterios de aceptación

`PRINT-ARC-006` queda documentalmente satisfecha porque:

- [x] define un contrato raíz estable y versionado;
- [x] define una unidad atómica de trabajo;
- [x] diferencia trabajo, documento, plantilla, payload, ruta, dispositivo y resultado;
- [x] materializa campos, tipos, fuentes, obligatoriedad y mutabilidad;
- [x] define canonicalización, hash e inmutabilidad;
- [x] define validación previa al enrutamiento y motivos mínimos de rechazo;
- [x] conserva las cincuenta identidades, propietarias, plantillas, versiones y perfiles aprobados;
- [x] materializa una decisión de contrato y payload por cada identidad;
- [x] reporta 50 esperadas, 50 materializadas, 0 faltantes y 0 duplicadas;
- [x] reconcilia 15 salidas de `FOGO`, 14 de `NEXO`, 12 de `PULSO`, 5 de `NUMERA` y 4 de `ORIGO`;
- [x] documenta el estado técnico actual sin presentarlo como implementación canónica;
- [x] identifica la contradicción heredada y le asigna propietario y condición de salida;
- [x] asigna cada decisión posterior a una tarea concreta;
- [x] no define enrutamiento, impresora, fallback, heartbeat, idempotencia, reintentos, confirmación, cancelación, reimpresión, permisos, privacidad, contingencia, adaptadores, monitoreo ni piloto;
- [x] no modifica código, SQL, migraciones, configuración ni Supabase;
- [x] declara cero cambios `TREQ-*` con justificación concreta;
- [x] mantiene `PRINT-ARC-007` como única tarea siguiente reservada.

---

#### 14. Handoff cerrado hacia `PRINT-ARC-007`

`PRINT-ARC-007` recibe:

- `VENTO-PRINT-JOB` `1.0.0`;
- cincuenta filas con `salida_id`, propietaria, plantilla, versión, perfil y contrato de payload;
- contexto empresarial de empresa y sede del documento;
- separación entre sobre inmutable y datos futuros de ejecución;
- trazabilidad mediante `job_id`, `correlation_id` y `batch_id`.

Deberá definir enrutamiento por sede, área, documento, canal y dispositivo sin:

- modificar el sobre original;
- cambiar propietaria, `salida_id`, plantilla, versión, perfil o payload;
- convertir la ruta en autorización empresarial;
- decidir todavía principal, alternativas o fallback;
- declarar implementación o evidencia inexistente.

```text
TAREA ANTERIOR APROBADA
PRINT-ARC-005 — Definir plantilla, versión, tamaño y datos requeridos
        ↓
TAREA ACTUAL DESARROLLADA EN ARTEFACTO APROBADA
PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo
```

La aprobación de `PRINT-ARC-006` no inicia, desarrolla ni aprueba `PRINT-ARC-007`.


### ✅ PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión` — APROBADA
**Tarea siguiente:** `PRINT-ARC-008 — Definir impresora principal, alternativas y fallback` — RESERVADA
**Tipo de tarea:** documental; contrato de resolución y matriz materializada de destinos elegibles para las cincuenta salidas y los nueve dispositivos inventariados
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no configura impresoras, direcciones, colas, adaptadores, bridges, código, SQL, migraciones ni Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir cómo un `VENTO-PRINT-JOB` validado se resuelve hacia una sede de producción física, un área, un punto, un conjunto no ordenado de canales y un conjunto no ordenado de dispositivos elegibles, preservando la separación entre el sitio del hecho empresarial, el sitio de consumo y el sitio donde se produce la copia.

---

#### 1. Resultado sustantivo

`PRINT-ARC-007` queda cerrada documentalmente con:

- un contrato de resolución `VENTO-PRINT-ROUTE` versión `1.0.0`;
- 5 sedes de enrutamiento identificadas;
- 7 áreas y 9 puntos operativos o condiciones físicas referenciados;
- 9 referencias estables de dispositivo, reconciliadas una a una con `PRINT-ARC-001` y `PRINT-ARC-002`;
- 7 clases de canal, incluidas las condiciones sin canal activo;
- 11 perfiles de ruta;
- 8 perfiles routables o routables con distribución manual;
- 3 perfiles bloqueados por estado físico o ausencia de capacidad;
- una matriz de 50 salidas con decisión explícita de rutas elegibles;
- 50 identidades recibidas y 50 materializadas;
- 0 faltantes, 0 duplicadas y 0 cambios de propietaria, plantilla, versión o perfil;
- 0 selección de impresora principal, alternativa o fallback;
- 0 implementación y 0 evidencia operativa declarada.

Todas las decisiones quedan en estado `ESPECIFICADO`. Un perfil bloqueado es una decisión de ruta completa y verificable; no equivale a una omisión ni autoriza a sustituir el perfil físico.

---

#### 2. Fronteras canónicas del enrutamiento

El enrutamiento ocurre únicamente después de que el candidato haya sido validado y materializado como `VENTO-PRINT-JOB` `1.0.0`.

```text
DOCUMENTO EMPRESARIAL AUTORIZADO
→ VENTO-PRINT-JOB INMUTABLE
→ VENTO-PRINT-ROUTE
→ PRINT-ARC-008: PRIORIDAD, ALTERNATIVAS Y FALLBACK
→ PRINT-ARC-018: ADAPTADOR FÍSICO
→ RESULTADO Y AUDITORÍA
```

Reglas obligatorias:

1. El enrutamiento no autoriza, crea, corrige, cancela ni reversiona el hecho empresarial.
2. `document.sede_id` conserva la sede del hecho. No se reemplaza por la sede de la impresora.
3. El sitio de consumo identifica dónde se necesita la copia física.
4. El sitio de producción identifica dónde se encuentra el dispositivo que generará la copia.
5. La impresión central solo se permite mediante un perfil que declare `CENTRAL_PRINT_AND_DISTRIBUTE`.
6. La distribución física posterior a una impresión central no es un envío de impresión y queda fuera del resultado técnico de esta tarea.
7. El conjunto de dispositivos y canales elegibles no tiene orden. `PRINT-ARC-008` definirá principal, alternativas y fallback.
8. Una ruta no puede cambiar `salida_id`, propietaria, plantilla, versión, perfil ni hash del trabajo.
9. Un perfil físico solo puede dirigirse a un dispositivo compatible con su familia.
10. Cero candidatos elegibles produce un resultado bloqueado explícito; no se busca una impresora de otro tamaño por aproximación.
11. Los estados `ALMACENADA` y `REQUIERE_MANTENIMIENTO` impiden declarar el dispositivo como routable.
12. Un mismo trabajo recibe una sola decisión de ruta vigente; un cambio posterior deberá conservar historial y no mutar la decisión anterior.

---

#### 3. Contrato `VENTO-PRINT-ROUTE` `1.0.0`

##### 3.1 Estructura normativa

```json
{
  "routing_contract_id": "VENTO-PRINT-ROUTE",
  "routing_contract_version": "1.0.0",
  "route_decision_id": "<uuid>",
  "job_id": "<uuid-de-VENTO-PRINT-JOB>",
  "resolved_at": "<RFC3339>",
  "requested_destination": {
    "consumption_site_id": "<SITE-*>",
    "consumption_area_id": "<AREA-*>",
    "consumption_point_id": "<POINT-*|null>",
    "distribution_mode": "<LOCAL|CENTRAL_PRINT_AND_DISTRIBUTE>"
  },
  "resolved_route": {
    "route_profile_id": "<RTE-*>",
    "production_site_id": "<SITE-*>",
    "production_area_id": "<AREA-*>",
    "production_point_id": "<POINT-*|SIN_PUNTO_COMPATIBLE>",
    "eligible_channel_ids": ["<CH-*>"],
    "eligible_device_refs": ["<PRN-*>"],
    "candidate_set_ordered": false,
    "route_state": "<ROUTABLE|ROUTABLE_WITH_MANUAL_DISTRIBUTION|BLOQUEADA_*>",
    "reason_code": "<código-normalizado>"
  },
  "trace": {
    "correlation_id": "<identificador-estable>",
    "source_route_ref": "<referencia-o-null>"
  }
}
```

La estructura es normativa y no representa una ejecución real.

##### 3.2 Diccionario de campos

| Campo                             | Obligación  | Fuente                            | Regla                                                                   |
| --------------------------------- | ----------- | --------------------------------- | ----------------------------------------------------------------------- |
| `routing_contract_id`             | requerida   | catálogo transversal              | Debe ser `VENTO-PRINT-ROUTE`.                                           |
| `routing_contract_version`        | requerida   | catálogo transversal              | Debe ser `1.0.0` en esta versión.                                       |
| `route_decision_id`               | requerida   | futuro servicio de enrutamiento   | Identidad inmutable de la decisión.                                     |
| `job_id`                          | requerida   | `PRINT-ARC-006`                   | Debe referenciar un trabajo válido e inmutable.                         |
| `resolved_at`                     | requerida   | futuro servicio de enrutamiento   | Marca RFC 3339 posterior a la creación del trabajo.                     |
| `requested_destination.*`         | requerida   | aplicación solicitante autorizada | No se infiere desde la impresora ni desde el actor.                     |
| `resolved_route.route_profile_id` | requerida   | matriz de esta tarea              | Debe ser compatible con la salida y el destino solicitado.              |
| `production_site_id`              | requerida   | perfil de ruta                    | Identifica la sede física de la impresora.                              |
| `production_area_id`              | requerida   | perfil de ruta                    | Identifica el área física de producción de la copia.                    |
| `production_point_id`             | requerida   | perfil de ruta                    | Puede representar una condición bloqueada explícita.                    |
| `eligible_channel_ids`            | requerida   | perfil de ruta                    | Conjunto no ordenado; no constituye selección de adaptador.             |
| `eligible_device_refs`            | requerida   | perfil de ruta                    | Conjunto no ordenado; puede quedar vacío solo en un perfil bloqueado.   |
| `candidate_set_ordered`           | requerida   | contrato transversal              | Debe ser `false` hasta `PRINT-ARC-008`.                                 |
| `route_state`                     | requerida   | resolución                        | Distingue ruta utilizable, distribución manual o bloqueo.               |
| `reason_code`                     | requerida   | resolución                        | Explica de forma tipada la decisión.                                    |
| `trace.correlation_id`            | requerida   | trabajo original                  | Debe conservar la correlación de `PRINT-ARC-006`.                       |
| `trace.source_route_ref`          | condicional | trabajo relacionado               | Para modificación o cancelación de comanda referencia la ruta original. |

---

#### 4. Catálogo de sedes, áreas y puntos de ruta

##### 4.1 Sedes

| ID de sede            | Nombre canónico conservado                             |
| --------------------- | ------------------------------------------------------ |
| SITE-VENTO-PRODUCCION | Vento Producción — Centro de Producción y Distribución |
| SITE-VENTO-ADMIN      | Sede administrativa de Vento Group                     |
| SITE-VENTO-CAFE       | Vento Café — único local físico activo                 |
| SITE-MOLKA            | Molka — único local físico activo                      |
| SITE-SAUDO            | Saudo — único local físico activo                      |

##### 4.2 Áreas y puntos

| ID de área                      | Sede                  | Nombre canónico conservado                 | Puntos de ruta                                             |
| ------------------------------- | --------------------- | ------------------------------------------ | ---------------------------------------------------------- |
| AREA-VP-PRODUCCION-DISTRIBUCION | SITE-VENTO-PRODUCCION | Producción y distribución                  | POINT-VP-ZEBRA-ALMACENADA / POINT-VP-EPSON-FUERA-OPERACION |
| AREA-ADMIN-COMPARTIDA           | SITE-VENTO-ADMIN      | Administración compartida                  | POINT-ADMIN-OFICINA                                        |
| AREA-MOLKA-INTEGRADA            | SITE-MOLKA            | Punto integrado de caja, mostrador y barra | POINT-MOLKA-CAJA                                           |
| AREA-SAUDO-INTEGRADA            | SITE-SAUDO            | Punto integrado de caja, mostrador y barra | POINT-SAUDO-CAJA                                           |
| AREA-VC-SERVICIO-SALON          | SITE-VENTO-CAFE       | Servicio / Salón                           | POINT-VC-CAJA-MOSTRADOR                                    |
| AREA-VC-BARRA                   | SITE-VENTO-CAFE       | Barra                                      | POINT-VC-BARRA-CALIENTES / POINT-VC-BAR-FRIAS              |
| AREA-VC-COCINA                  | SITE-VENTO-CAFE       | Cocina                                     | POINT-VC-COCINA                                            |

Los identificadores anteriores son referencias estables del contrato de impresión. No sustituyen los identificadores maestros empresariales; su enlace físico corresponde a `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y deberá conservar nombres, relaciones y alcance.

---

#### 5. Catálogo de dispositivos y canales

##### 5.1 Referencias estables de dispositivo

| Dispositivo               | Sede                  | Punto                          | Modelo                | Estado físico          | Familia compatible |
| ------------------------- | --------------------- | ------------------------------ | --------------------- | ---------------------- | ------------------ |
| PRN-VP-ZD230-01           | SITE-VENTO-PRODUCCION | POINT-VP-ZEBRA-ALMACENADA      | Zebra ZD230           | ALMACENADA             | Etiquetas          |
| PRN-VP-L5590-01           | SITE-VENTO-PRODUCCION | POINT-VP-EPSON-FUERA-OPERACION | Epson EcoTank L5590   | REQUIERE_MANTENIMIENTO | A4                 |
| PRN-ADMIN-L4260-01        | SITE-VENTO-ADMIN      | POINT-ADMIN-OFICINA            | Epson EcoTank L4260   | OPERATIVA              | A4                 |
| PRN-MOLKA-DIGE200I-01     | SITE-MOLKA            | POINT-MOLKA-CAJA               | Digital POS DIG-E200I | OPERATIVA              | Tiquete 80 mm      |
| PRN-SAUDO-DIGE200I-01     | SITE-SAUDO            | POINT-SAUDO-CAJA               | Digital POS DIG-E200I | OPERATIVA              | Tiquete 80 mm      |
| PRN-VC-CAJA-DIGE200I-01   | SITE-VENTO-CAFE       | POINT-VC-CAJA-MOSTRADOR        | Digital POS DIG-E200I | OPERATIVA              | Tiquete 80 mm      |
| PRN-VC-BARRA-DIGE200I-01  | SITE-VENTO-CAFE       | POINT-VC-BARRA-CALIENTES       | Digital POS DIG-E200I | OPERATIVA              | Tiquete 80 mm      |
| PRN-VC-BAR-DIGE200I-01    | SITE-VENTO-CAFE       | POINT-VC-BAR-FRIAS             | Digital POS DIG-E200I | OPERATIVA              | Tiquete 80 mm      |
| PRN-VC-COCINA-DIGE200I-01 | SITE-VENTO-CAFE       | POINT-VC-COCINA                | Digital POS DIG-E200I | OPERATIVA              | Tiquete 80 mm      |

##### 5.2 Canales

| Canal                         | Clase                                            | Dispositivo o conjunto                                                      | Estado    | Regla                                                                              |
| ----------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------- | --------- | ---------------------------------------------------------------------------------- |
| CH-ZEBRA-SIN-CONEXION         | Sin canal activo                                 | PRN-VP-ZD230-01                                                             | BLOQUEADO | La unidad está almacenada y su variante física no está confirmada.                 |
| CH-EPSON-L5590-SIN-CONEXION   | Sin canal operativo                              | PRN-VP-L5590-01                                                             | BLOQUEADO | La unidad requiere mantenimiento antes de definir conexión utilizable.             |
| CH-EPSON-L4260-USB            | USB mediante host o puente local                 | PRN-ADMIN-L4260-01                                                          | ELEGIBLE  | Conexión USB confirmada; adaptador se materializa en PRINT-ARC-018.                |
| CH-EPSON-L4260-WIFI           | Wi-Fi mediante red de la sede                    | PRN-ADMIN-L4260-01                                                          | ELEGIBLE  | Conexión Wi-Fi confirmada; protocolo y adaptador se materializan en PRINT-ARC-018. |
| CH-DIGE200I-USB               | USB mediante host o puente local ESC/POS         | PRN-MOLKA-DIGE200I-01; PRN-SAUDO-DIGE200I-01; PRN-VC-CAJA-DIGE200I-01       | ELEGIBLE  | Conexiones USB confirmadas.                                                        |
| CH-DIGE200I-LAN               | Red local ESC/POS                                | PRN-VC-BARRA-DIGE200I-01; PRN-VC-BAR-DIGE200I-01; PRN-VC-COCINA-DIGE200I-01 | ELEGIBLE  | Conexiones por red local confirmadas.                                              |
| CH-SIN-DISPOSITIVO-COMPATIBLE | Sin canal por ausencia de dispositivo compatible | NINGUNO                                                                     | BLOQUEADO | Vento Producción no dispone de impresora activa compatible con PERF-TKT-80-V.      |

Las referencias de canal expresan elegibilidad documental. No declaran controlador, puerto, IP, bridge o adaptador implementado; esas decisiones pertenecen a `PRINT-ARC-018`.

---

#### 6. Perfiles materializados de ruta

| Perfil                   | Aplicación                                                 | Sede de producción    | Área                            | Punto                          | Canal elegible                          | Dispositivo elegible      | Distribución                 | Estado                               |
| ------------------------ | ---------------------------------------------------------- | --------------------- | ------------------------------- | ------------------------------ | --------------------------------------- | ------------------------- | ---------------------------- | ------------------------------------ |
| RTE-LBL-VP-CENTRAL       | Etiquetas de cualquier operación                           | SITE-VENTO-PRODUCCION | AREA-VP-PRODUCCION-DISTRIBUCION | POINT-VP-ZEBRA-ALMACENADA      | CH-ZEBRA-SIN-CONEXION                   | PRN-VP-ZD230-01           | CENTRAL_PRINT_AND_DISTRIBUTE | BLOQUEADA_DISPOSITIVO_ALMACENADO     |
| RTE-TKT-MOLKA-CAJA       | Tiquetes consumidos en Molka                               | SITE-MOLKA            | AREA-MOLKA-INTEGRADA            | POINT-MOLKA-CAJA               | CH-DIGE200I-USB                         | PRN-MOLKA-DIGE200I-01     | LOCAL                        | ROUTABLE                             |
| RTE-TKT-SAUDO-CAJA       | Tiquetes consumidos en Saudo                               | SITE-SAUDO            | AREA-SAUDO-INTEGRADA            | POINT-SAUDO-CAJA               | CH-DIGE200I-USB                         | PRN-SAUDO-DIGE200I-01     | LOCAL                        | ROUTABLE                             |
| RTE-TKT-VC-CAJA          | Tiquetes de caja, cliente, expedición o reposición en caja | SITE-VENTO-CAFE       | AREA-VC-SERVICIO-SALON          | POINT-VC-CAJA-MOSTRADOR        | CH-DIGE200I-USB                         | PRN-VC-CAJA-DIGE200I-01   | LOCAL                        | ROUTABLE                             |
| RTE-TKT-VC-BARRA         | Tiquetes de bebidas calientes o trabajo de barra           | SITE-VENTO-CAFE       | AREA-VC-BARRA                   | POINT-VC-BARRA-CALIENTES       | CH-DIGE200I-LAN                         | PRN-VC-BARRA-DIGE200I-01  | LOCAL                        | ROUTABLE                             |
| RTE-TKT-VC-BAR           | Tiquetes de bebidas frías o trabajo de bar                 | SITE-VENTO-CAFE       | AREA-VC-BARRA                   | POINT-VC-BAR-FRIAS             | CH-DIGE200I-LAN                         | PRN-VC-BAR-DIGE200I-01    | LOCAL                        | ROUTABLE                             |
| RTE-TKT-VC-COCINA        | Tiquetes de cocina o preparación                           | SITE-VENTO-CAFE       | AREA-VC-COCINA                  | POINT-VC-COCINA                | CH-DIGE200I-LAN                         | PRN-VC-COCINA-DIGE200I-01 | LOCAL                        | ROUTABLE                             |
| RTE-TKT-VP-SIN-CAPACIDAD | Tiquetes de producción requeridos en Vento Producción      | SITE-VENTO-PRODUCCION | AREA-VP-PRODUCCION-DISTRIBUCION | SIN_PUNTO_COMPATIBLE           | CH-SIN-DISPOSITIVO-COMPATIBLE           | NINGUNO                   | LOCAL                        | BLOQUEADA_SIN_DISPOSITIVO_COMPATIBLE |
| RTE-A4-VP-LOCAL          | Documentos A4 consumidos en Vento Producción               | SITE-VENTO-PRODUCCION | AREA-VP-PRODUCCION-DISTRIBUCION | POINT-VP-EPSON-FUERA-OPERACION | CH-EPSON-L5590-SIN-CONEXION             | PRN-VP-L5590-01           | LOCAL                        | BLOQUEADA_MANTENIMIENTO              |
| RTE-A4-ADMIN-LOCAL       | Documentos A4 consumidos en la sede administrativa         | SITE-VENTO-ADMIN      | AREA-ADMIN-COMPARTIDA           | POINT-ADMIN-OFICINA            | CH-EPSON-L4260-USB; CH-EPSON-L4260-WIFI | PRN-ADMIN-L4260-01        | LOCAL                        | ROUTABLE                             |
| RTE-A4-ADMIN-CENTRAL     | Documentos A4 de otras operaciones impresos centralmente   | SITE-VENTO-ADMIN      | AREA-ADMIN-COMPARTIDA           | POINT-ADMIN-OFICINA            | CH-EPSON-L4260-USB; CH-EPSON-L4260-WIFI | PRN-ADMIN-L4260-01        | CENTRAL_PRINT_AND_DISTRIBUTE | ROUTABLE_WITH_MANUAL_DISTRIBUTION    |

Reglas de los perfiles:

1. `RTE-LBL-VP-CENTRAL` es la única ruta compatible con los perfiles de etiqueta aprobados. Permanece bloqueada mientras la Zebra esté almacenada y sin canal activo.
2. Las seis rutas térmicas operativas utilizan exclusivamente DIG-E200I de 80 mm.
3. `RTE-TKT-VP-SIN-CAPACIDAD` formaliza que Vento Producción no tiene actualmente un dispositivo compatible con `PERF-TKT-80-V`.
4. `RTE-A4-VP-LOCAL` permanece bloqueada mientras la Epson L5590 requiera mantenimiento.
5. `RTE-A4-ADMIN-LOCAL` y `RTE-A4-ADMIN-CENTRAL` comparten la Epson L4260, pero expresan destinos de consumo diferentes.
6. Una impresión central exige que la aplicación solicitante declare el modo de distribución; el resolver no lo activa por conveniencia.
7. Ningún perfil de esta tarea establece preferencia entre canales o dispositivos.

---

#### 7. Matriz materializada de las cincuenta salidas

| Salida | Nombre | Propietaria | Perfil físico | Perfiles de ruta elegibles | Regla de selección | Estado / bloqueo |
| ------ | ------ | ----------- | ------------- | -------------------------- | ------------------ | ---------------- |

| `IMP-LBL-01` | Etiqueta de lote de producto terminado | `FOGO` | `PERF-LBL-100X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado | `FOGO` | `PERF-LBL-100X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place | `FOGO` | `PERF-LBL-75X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque | `FOGO` | `PERF-LBL-75X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial | `FOGO` | `PERF-LBL-100X75-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado | `FOGO` | `PERF-LBL-100X75-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor | `ORIGO` | `PERF-LBL-100X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona | `NEXO` | `PERF-LBL-100X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU | `NEXO` | `PERF-LBL-75X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho | `NEXO` | `PERF-LBL-100X75-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente | `PULSO` | `PERF-LBL-100X75-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo | `NEXO` | `PERF-LBL-100X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO` | `PERF-LBL-100X75-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización | `FOGO` | `PERF-LBL-75X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-15` | Etiqueta de muestra o prueba | `FOGO` | `PERF-LBL-75X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición | `FOGO` | `PERF-LBL-75X50-H` | RTE-LBL-VP-CENTRAL | Impresión central de etiquetas; el sitio de consumo permanece en el payload o contexto de distribución. | ESPECIFICADO / RUTA_CENTRAL_BLOQUEADA |
| `IMP-CMD-01` | Comanda de cocina | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-COCINA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar por sede; en Vento Café el punto es cocina. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CMD-02` | Comanda de bar de bebidas frías | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-BAR; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar por sede; en Vento Café el punto es bar de bebidas frías. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-BARRA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar por sede; en Vento Café el punto es barra de bebidas calientes. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CMD-04` | Comanda de preparación o mise en place | `FOGO` | `PERF-TKT-80-V` | RTE-TKT-VC-COCINA; RTE-TKT-VC-BARRA; RTE-TKT-VC-BAR; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA; RTE-TKT-VP-SIN-CAPACIDAD | Seleccionar la sede y el área que ejecutará la preparación. | ESPECIFICADO / VP_BLOQUEADO_SIN_CAPACIDAD |
| `IMP-CMD-05` | Tiquete de expedición o recogida | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar el punto de entrega o recogida asociado al pedido. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CMD-06` | Solicitud interna de reposición | `NEXO` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-VC-BARRA; RTE-TKT-VC-BAR; RTE-TKT-VC-COCINA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA; RTE-TKT-VP-SIN-CAPACIDAD | Seleccionar el punto receptor de la reposición. | ESPECIFICADO / VP_BLOQUEADO_SIN_CAPACIDAD |
| `IMP-CMD-07` | Modificación o adición de comanda | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-COCINA; RTE-TKT-VC-BARRA; RTE-TKT-VC-BAR; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Resolver al mismo punto de la comanda original; no se permite cambiar de área por inferencia. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CMD-08` | Cancelación o anulación de comanda | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-COCINA; RTE-TKT-VC-BARRA; RTE-TKT-VC-BAR; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Resolver al mismo punto de la comanda original; no se permite cambiar de área por inferencia. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia | `FOGO` | `PERF-TKT-80-V` | RTE-TKT-VP-SIN-CAPACIDAD | El destino es Vento Producción; no existe dispositivo compatible activo. | ESPECIFICADO / BLOQUEADO_SIN_CAPACIDAD |
| `IMP-CLI-01` | Resumen de cuenta para el cliente | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-02` | Confirmación de pedido | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-03` | Comprobante de pago | `NUMERA` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente | `NUMERA` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito | `NUMERA` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-06` | Resumen de recogida o entrega | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-07` | Comprobante de reserva o anticipo | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio | `PULSO` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja | `NUMERA` | `PERF-TKT-80-V` | RTE-TKT-VC-CAJA; RTE-TKT-MOLKA-CAJA; RTE-TKT-SAUDO-CAJA | Seleccionar la caja de la sede comercial del documento. | ESPECIFICADO / RUTAS_OPERATIVAS |
| `IMP-DOC-01` | Remisión o nota de despacho | `NEXO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Destino local de la operación o impresión central explícita. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-02` | Manifiesto de traslado interno | `NEXO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Destino local de la operación o impresión central explícita. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-03` | Hoja de conteo de inventario | `NEXO` | `PERF-A4-L` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Seleccionar el lugar del conteo; la impresión central exige distribución manual. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario | `NEXO` | `PERF-A4-L` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Seleccionar el lugar de revisión o impresión central explícita. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-05` | Orden de compra | `ORIGO` | `PERF-A4-P` | RTE-A4-ADMIN-LOCAL; RTE-A4-VP-LOCAL; RTE-A4-ADMIN-CENTRAL | Administración para emisión; producción cuando la copia acompaña recepción. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-06` | Acta o comprobante de recepción | `ORIGO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Lugar de recepción o impresión central explícita. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-07` | Devolución a proveedor | `ORIGO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Lugar de despacho de la devolución o impresión central explícita. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-08` | Orden de producción o ficha de lote | `FOGO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-CENTRAL | Consumo en producción; la opción central exige distribución manual. | ESPECIFICADO / ADMIN_CENTRAL_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica | `FOGO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-CENTRAL | Consumo en producción u operación; la opción central exige distribución manual. | ESPECIFICADO / ADMIN_CENTRAL_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-10` | Registro de calidad o no conformidad | `FOGO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-CENTRAL | Lugar del control o impresión central explícita. | ESPECIFICADO / ADMIN_CENTRAL_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-11` | Orden de mantenimiento | `NEXO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Lugar del activo o administración; otras sedes usan impresión central. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo | `NEXO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Lugar de la transferencia o impresión central explícita. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico | `NEXO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-LOCAL; RTE-A4-ADMIN-CENTRAL | Administración o lugar del activo; otras sedes usan impresión central. | ESPECIFICADO / ADMIN_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo | `FOGO` | `PERF-A4-P` | RTE-A4-VP-LOCAL; RTE-A4-ADMIN-CENTRAL | Lugar del control; sin A4 local se usa impresión central y distribución manual. | ESPECIFICADO / ADMIN_CENTRAL_ROUTABLE; VP_BLOQUEADO |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación | `NUMERA` | `PERF-A4-L` | RTE-A4-ADMIN-LOCAL | La salida se consume en administración compartida. | ESPECIFICADO / RUTA_OPERATIVA |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales | `NEXO` | `PERF-A4-L` | RTE-A4-ADMIN-LOCAL | La salida se consume en administración compartida. | ESPECIFICADO / RUTA_OPERATIVA |

---

#### 8. Algoritmo de resolución determinista

El resolver documental aplica este orden:

1. verificar `VENTO-PRINT-JOB` `1.0.0`;
2. leer `document.salida_id` y `template.perfil_id`;
3. validar `requested_destination`;
4. obtener exclusivamente los perfiles declarados para la fila;
5. filtrar por sitio, área, punto y modo de distribución;
6. verificar compatibilidad exacta de perfil físico;
7. conservar solo canales y dispositivos declarados en el perfil;
8. devolver el conjunto no ordenado de candidatos;
9. devolver el estado bloqueado tipado cuando no exista candidato utilizable;
10. rechazar la resolución cuando más de un perfil sobreviva sin que el contexto permita diferenciarlos.

Códigos mínimos:

| Código                                      | Resultado                                                                  |
| ------------------------------------------- | -------------------------------------------------------------------------- |
| `PRINT_ROUTE_OK`                            | Existe un perfil routable y un conjunto elegible no ordenado.              |
| `PRINT_ROUTE_CENTRAL_DISTRIBUTION_REQUIRED` | La copia se produce centralmente y requiere distribución física posterior. |
| `PRINT_ROUTE_DEVICE_STORED`                 | El único dispositivo compatible está almacenado.                           |
| `PRINT_ROUTE_DEVICE_MAINTENANCE`            | El dispositivo local compatible está fuera de operación.                   |
| `PRINT_ROUTE_NO_COMPATIBLE_DEVICE`          | No existe dispositivo compatible con el perfil en el contexto solicitado.  |
| `PRINT_ROUTE_DESTINATION_NOT_ALLOWED`       | La salida no admite la sede, área o punto solicitado.                      |
| `PRINT_ROUTE_PROFILE_MISMATCH`              | El perfil del trabajo no coincide con la familia del dispositivo.          |
| `PRINT_ROUTE_AMBIGUOUS`                     | El contexto no permite resolver un único perfil de ruta.                   |
| `PRINT_ROUTE_UNKNOWN_JOB`                   | El trabajo no existe o no cumple `PRINT-ARC-006`.                          |

El resolver no envía datos a una impresora y no crea un intento de impresión.

---

#### 9. Reconciliación cuantitativa

##### 9.1 Cobertura de salidas

| Familia                          | Esperadas | Materializadas | Faltantes | Duplicadas |
| -------------------------------- | --------: | -------------: | --------: | ---------: |
| Etiquetas                        |        16 |             16 |         0 |          0 |
| Comandas y tiquetes operativos   |         9 |              9 |         0 |          0 |
| Comprobantes para cliente y caja |         9 |              9 |         0 |          0 |
| Documentos convencionales        |        16 |             16 |         0 |          0 |
| **Total**                        |    **50** |         **50** |     **0** |      **0** |

##### 9.2 Infraestructura de ruta

| Concepto                                   | Cantidad |
| ------------------------------------------ | -------: |
| Sedes                                      |        5 |
| Áreas                                      |        7 |
| Puntos o condiciones físicas               |        9 |
| Dispositivos físicos referenciados         |        9 |
| Canales definidos                          |        7 |
| Perfiles de ruta                           |       11 |
| Perfiles routables                         |        7 |
| Perfiles routables con distribución manual |        1 |
| Perfiles bloqueados                        |        3 |
| Salidas sin decisión de ruta               |        0 |

##### 9.3 Integridad

```text
SALIDAS RECIBIDAS DE PRINT-ARC-006: 50
SALIDAS MATERIALIZADAS: 50
IDENTIFICADORES IMP-* UNICOS: 50
DISPOSITIVOS HEREDADOS: 9
DISPOSITIVOS REFERENCIADOS: 9
PERFILES DE RUTA UNICOS: 11
SALIDAS SIN RUTA: 0
CAMBIOS DE PROPIEDAD: 0
CAMBIOS DE PLANTILLA: 0
CAMBIOS DE VERSION: 0
CAMBIOS DE PERFIL FISICO: 0
SELECCIONES PRINCIPALES REALIZADAS: 0
DECISIONES ABIERTAS DENTRO DE PRINT-ARC-007: 0
```

---

#### 10. Diagnóstico técnico actual

La superficie actual de NEXO permite que una persona seleccione un dispositivo BrowserPrint y envíe ZPL directamente desde el navegador. No existe todavía un resolver transversal que consuma `VENTO-PRINT-JOB`, valide sede, área, punto y perfil, o produzca `VENTO-PRINT-ROUTE`.

Por tanto:

- el código actual no se presenta como implementación de esta tarea;
- las selecciones manuales existentes no constituyen una política canónica;
- `localStorage`, parámetros de URL y selección de `uid` no sustituyen el contrato de ruta;
- no se modifica `vento-nexo` durante esta fase documental.

---

#### 11. Bloqueos cerrados y tratamiento obligatorio en `PRINT-ARC-008`

| Bloqueo materializado                      | Alcance                                                               | Decisión exigida en `PRINT-ARC-008`                                                                                                                                                             |
| ------------------------------------------ | --------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Zebra almacenada y sin canal activo        | 16 salidas de etiqueta                                                | No declarar principal routable hasta que exista dispositivo desplegado y canal elegible; si se mantiene el alcance, generar una tarea explícita de incorporación o despliegue antes del piloto. |
| Epson L5590 en mantenimiento               | Rutas A4 locales de Vento Producción                                  | No declararla principal routable mientras conserve el estado físico actual; decidir alternativa o generar tarea explícita de recuperación del activo.                                           |
| Sin impresora de 80 mm en Vento Producción | `IMP-CMD-04`, `IMP-CMD-06` e `IMP-CMD-09` cuando el consumo sea local | Definir alternativa compatible o generar una tarea explícita de incorporación de capacidad; queda prohibido degradar a A4 o etiqueta.                                                           |

Estos bloqueos no dejan incompleta `PRINT-ARC-007`: la ruta, causa, alcance y puerta siguiente están materializados. `PRINT-ARC-008` no podrá ocultarlos asignando como principal un dispositivo incompatible.

---

#### 12. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: esta tarea define el contrato documental y las decisiones objetivo de enrutamiento, pero no implementa resolver, persistencia, productores, consumidores, adaptadores ni configuración contra los que ejecutar una prueba reproducible. La implementación autorizada deberá convertir estos invariantes en pruebas contractuales, de integración y de hardware sin declarar evidencia antes de existir el componente ejecutable.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

No se genera copia de `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` porque el registro permanece sin cambios.

---

#### 13. Criterios de aceptación

`PRINT-ARC-007` queda documentalmente satisfecha porque:

- [x] consume `VENTO-PRINT-JOB` sin modificar su sobre inmutable;
- [x] diferencia sede del hecho, sede de consumo y sede de producción física;
- [x] define contrato, campos y reglas de resolución;
- [x] conserva las cinco operaciones o sedes del inventario;
- [x] materializa referencias estables para los nueve dispositivos;
- [x] conserva modelo, punto, estado y conexión conocidos;
- [x] define canales elegibles y condiciones sin canal activo;
- [x] define once perfiles de ruta;
- [x] materializa una decisión de ruta para cada una de las cincuenta salidas;
- [x] conserva las cincuenta identidades, nombres, propietarias y perfiles físicos;
- [x] reporta 50 esperadas, 50 materializadas, 0 faltantes y 0 duplicadas;
- [x] evita enrutar perfiles de etiqueta, tiquete o A4 a dispositivos incompatibles;
- [x] representa de forma explícita los tres bloqueos de capacidad actuales;
- [x] no elige impresora principal, alternativa ni fallback;
- [x] no define heartbeat, idempotencia, reintentos, confirmación, cancelación, reimpresión, permisos, privacidad, contingencia, adaptadores, monitoreo ni piloto;
- [x] no modifica código, SQL, migraciones, configuración ni Supabase;
- [x] declara cero cambios `TREQ-*` con justificación concreta;
- [x] mantiene `PRINT-ARC-008` como única tarea siguiente reservada.

---

#### 14. Handoff cerrado hacia `PRINT-ARC-008`

`PRINT-ARC-008` recibe:

- 50 salidas con perfiles de ruta explícitos;
- 11 perfiles de ruta;
- 9 dispositivos con estado y compatibilidad;
- 7 canales;
- conjuntos de candidatos no ordenados;
- 3 bloqueos de capacidad con alcance y decisión obligatoria.

Deberá definir principal, alternativas y fallback sin:

- cambiar sede, área, punto o perfiles elegibles;
- usar un dispositivo incompatible;
- volver routable un dispositivo almacenado o en mantenimiento;
- degradar el perfil físico;
- convertir impresión central en fallback silencioso;
- modificar el trabajo original;
- declarar implementación o evidencia inexistente.

```text
TAREA ANTERIOR APROBADA
PRINT-ARC-006 — Definir contrato canónico de trabajo de impresión
        ↓
TAREA ACTUAL DESARROLLADA EN ARTEFACTO APROBADA
PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-008 — Definir impresora principal, alternativas y fallback
```

La aprobación de `PRINT-ARC-007` no inicia, desarrolla ni aprueba `PRINT-ARC-008`.

### ✅ PRINT-ARC-008 — Definir impresora principal, alternativas y fallback

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo` — APROBADA
**Tarea siguiente:** `PRINT-ARC-009 — Definir estado de impresora y heartbeat` — RESERVADA
**Tipo de tarea:** documental; política materializada y ordenada de objetivos principales, canales alternativos, reruteo explícito y bloqueo seguro para las cincuenta salidas y los once perfiles de ruta aprobados
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no despliega, repara, conecta, configura ni sustituye impresoras y no modifica código, SQL, migraciones, datos o Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** convertir cada conjunto no ordenado de candidatos recibido de `PRINT-ARC-007` en una política determinista de objetivo principal, alternativas ordenadas y fallback seguro, conservando el perfil físico, el destino solicitado y los bloqueos reales de capacidad.

---

#### 1. Resultado sustantivo

`PRINT-ARC-008` queda cerrada documentalmente con:

- un contrato `VENTO-PRINT-TARGET-POLICY` versión `1.0.0`;
- 11 políticas objetivo, una por cada perfil de ruta heredado;
- 8 políticas con principal operativo documentalmente elegible;
- 3 políticas bloqueadas por almacenamiento, mantenimiento o ausencia de dispositivo compatible;
- 8 asignaciones de principal por perfil, correspondientes a 7 dispositivos físicos únicos;
- 2 alternativas de canal sobre la misma Epson L4260, una para ruta administrativa local y otra para ruta central;
- 0 dispositivos alternativos físicos actualmente disponibles dentro de un mismo perfil de ruta;
- 1 mecanismo de reruteo central explícito para A4 de Vento Producción;
- 50 salidas con políticas objetivo materializadas;
- 0 faltantes, 0 duplicadas y 0 cambios de identidad, propietaria, plantilla, versión, perfil físico o ruta elegible;
- 0 implementación y 0 evidencia operativa declarada.

La palabra `principal` identifica la primera opción normativa dentro de un perfil ya resuelto. No declara que el dispositivo esté saludable en tiempo real ni que una impresión haya ocurrido.

---

#### 2. Diagnóstico técnico actual

La superficie vigente de NEXO detecta dispositivos BrowserPrint, selecciona el primer `uid` disponible cuando no existe selección previa y permite que la persona conecte otro dispositivo. Esa conducta no consume `VENTO-PRINT-JOB`, `VENTO-PRINT-ROUTE` ni una política canónica de prioridad.

| Superficie                                                     | Comportamiento observado                                           | Brecha frente a esta tarea                                                                     | Tratamiento                                                  |
| -------------------------------------------------------------- | ------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `vento-nexo/src/app/printing/jobs/_hooks/usePrinterDevices.ts` | Usa el primer dispositivo detectado o el `uid` elegido localmente. | La enumeración del navegador y la preferencia del usuario sustituyen una política empresarial. | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION`; no se modifica código. |
| `vento-nexo/src/app/printing/jobs/page.tsx`                    | Envía ZPL al dispositivo conectado mediante BrowserPrint.          | No resuelve principal, alternativa, fallback, sede, área o perfil transversal.                 | Entrada para el futuro alcance de implementación.            |

Ninguna selección local actual se presenta como evidencia de conformidad con el contrato definido aquí.

---

#### 3. Fronteras de la decisión

```text
VENTO-PRINT-JOB VALIDADO
→ VENTO-PRINT-ROUTE RESUELTA
→ VENTO-PRINT-TARGET-POLICY ORDENADA
→ PRINT-ARC-009: ELEGIBILIDAD POR ESTADO Y HEARTBEAT
→ PRINT-ARC-018: ADAPTADOR Y ENVIO FISICO
→ RESULTADO Y AUDITORIA
```

Reglas obligatorias:

1. Esta tarea ordena candidatos; no cambia el perfil de ruta resuelto por `PRINT-ARC-007`.
2. Una impresora principal debe pertenecer al conjunto elegible de la ruta y ser compatible con el perfil físico exacto.
3. Una alternativa dentro del mismo perfil puede ser otro canal o dispositivo previamente elegible; nunca se descubre por proximidad, IP, último uso o preferencia local.
4. Un cambio entre perfiles de ruta exige una nueva resolución explícita y conserva la decisión bloqueada original.
5. La impresión central no es fallback automático; requiere `CENTRAL_PRINT_AND_DISTRIBUTE` solicitado y una ruta central permitida para la salida.
6. No existe fallback por degradación de tamaño: etiqueta, tiquete de 80 mm y A4 permanecen familias distintas.
7. No existe fallback automático entre cocina, barra, bar, caja, Molka o Saudo.
8. `ALMACENADA`, `REQUIERE_MANTENIMIENTO` o ausencia de dispositivo compatible producen bloqueo seguro, no selección optimista.
9. La disponibilidad en tiempo real y la antigüedad de la señal pertenecen a `PRINT-ARC-009`; esta tarea no inventa heartbeat.
10. El orden de candidatos no autoriza el documento empresarial, no modifica el payload y no constituye intento de impresión.

---

#### 4. Contrato `VENTO-PRINT-TARGET-POLICY` `1.0.0`

##### 4.1 Estructura normativa

```json
{
  "target_contract_id": "VENTO-PRINT-TARGET-POLICY",
  "target_contract_version": "1.0.0",
  "target_policy_id": "<TGT-*>",
  "target_decision_id": "<uuid>",
  "route_decision_id": "<uuid-de-VENTO-PRINT-ROUTE>",
  "job_id": "<uuid-de-VENTO-PRINT-JOB>",
  "route_profile_id": "<RTE-*>",
  "ordered_candidates": [
    {
      "rank": 1,
      "role": "PRIMARY",
      "device_ref": "<PRN-*|null>",
      "channel_id": "<CH-*|null>",
      "documentary_state": "<ELIGIBLE|BLOCKED>"
    }
  ],
  "fallback": {
    "mode": "<SAFE_BLOCK|SAME_DEVICE_CHANNEL|EXPLICIT_CENTRAL_REROUTE>",
    "target_policy_ref": "<TGT-*|null>",
    "requires_new_route_decision": true
  },
  "runtime_selection": {
    "selected_rank": null,
    "selected_device_ref": null,
    "selected_channel_id": null,
    "selection_state": "POLICY_ONLY"
  }
}
```

La estructura es normativa. Los campos `runtime_selection` permanecen sin valor hasta que exista implementación y una señal de elegibilidad definida por `PRINT-ARC-009`.

##### 4.2 Semántica de roles y fallback

| Concepto                   | Regla cerrada                                                                             |
| -------------------------- | ----------------------------------------------------------------------------------------- |
| `PRIMARY`                  | Primer candidato documental dentro del perfil de ruta.                                    |
| `ALTERNATIVE`              | Candidato de rango posterior ya autorizado por el mismo perfil.                           |
| `SAME_DEVICE_CHANNEL`      | Cambia el canal sobre el mismo dispositivo sin cambiar sede, punto, perfil o impresora.   |
| `EXPLICIT_CENTRAL_REROUTE` | Exige una nueva decisión de ruta hacia `RTE-A4-ADMIN-CENTRAL`; no ocurre automáticamente. |
| `SAFE_BLOCK`               | No envía el trabajo, no sustituye el medio y conserva la causa diagnosticable.            |

---

#### 5. Orden de resolución

Para un perfil de ruta ya resuelto, el orden es:

1. validar que la política `TGT-*` corresponde exactamente al `RTE-*`;
2. evaluar el principal de rango 1 con el estado permitido por `PRINT-ARC-009`;
3. si el principal no es utilizable, evaluar alternativas del mismo perfil en rango ascendente;
4. si existe alternativa de canal sobre el mismo dispositivo, conservar dispositivo, punto y payload;
5. si no existe alternativa del mismo perfil, aplicar el fallback declarado;
6. un reruteo central exige nueva solicitud o decisión con `source_route_ref` y modo de distribución explícito;
7. si el fallback no está autorizado o tampoco es utilizable, terminar en bloqueo seguro.

No se permiten rondas infinitas, selección aleatoria, afinidad por navegador, memoria de la última impresora ni elección manual fuera de la política.

---

#### 6. Políticas objetivo materializadas por perfil de ruta

| Política                   | Perfil de ruta             | Principal                                             | Canal principal               | Alternativas ordenadas                             | Fallback                                                                                   | Estado / bloqueo                                      |
| -------------------------- | -------------------------- | ----------------------------------------------------- | ----------------------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------- |
| `TGT-LBL-VP-CENTRAL`       | `RTE-LBL-VP-CENTRAL`       | `PRN-VP-ZD230-01` como objetivo principal no routable | Ninguno activo                | Ninguna                                            | `SAFE_BLOCK`; prohibido degradar a A4 o 80 mm                                              | `ESPECIFICADO / BLOQUEADA_DISPOSITIVO_ALMACENADO`     |
| `TGT-TKT-MOLKA-CAJA`       | `RTE-TKT-MOLKA-CAJA`       | `PRN-MOLKA-DIGE200I-01`                               | `CH-DIGE200I-USB`             | Ninguna                                            | `SAFE_BLOCK`; no saltar de sede                                                            | `ESPECIFICADO / PRINCIPAL_ELEGIBLE`                   |
| `TGT-TKT-SAUDO-CAJA`       | `RTE-TKT-SAUDO-CAJA`       | `PRN-SAUDO-DIGE200I-01`                               | `CH-DIGE200I-USB`             | Ninguna                                            | `SAFE_BLOCK`; no saltar de sede                                                            | `ESPECIFICADO / PRINCIPAL_ELEGIBLE`                   |
| `TGT-TKT-VC-CAJA`          | `RTE-TKT-VC-CAJA`          | `PRN-VC-CAJA-DIGE200I-01`                             | `CH-DIGE200I-USB`             | Ninguna                                            | `SAFE_BLOCK`; no saltar a barra, bar o cocina                                              | `ESPECIFICADO / PRINCIPAL_ELEGIBLE`                   |
| `TGT-TKT-VC-BARRA`         | `RTE-TKT-VC-BARRA`         | `PRN-VC-BARRA-DIGE200I-01`                            | `CH-DIGE200I-LAN`             | Ninguna                                            | `SAFE_BLOCK`; no saltar a bar, cocina o caja                                               | `ESPECIFICADO / PRINCIPAL_ELEGIBLE`                   |
| `TGT-TKT-VC-BAR`           | `RTE-TKT-VC-BAR`           | `PRN-VC-BAR-DIGE200I-01`                              | `CH-DIGE200I-LAN`             | Ninguna                                            | `SAFE_BLOCK`; no saltar a barra, cocina o caja                                             | `ESPECIFICADO / PRINCIPAL_ELEGIBLE`                   |
| `TGT-TKT-VC-COCINA`        | `RTE-TKT-VC-COCINA`        | `PRN-VC-COCINA-DIGE200I-01`                           | `CH-DIGE200I-LAN`             | Ninguna                                            | `SAFE_BLOCK`; no saltar a barra, bar o caja                                                | `ESPECIFICADO / PRINCIPAL_ELEGIBLE`                   |
| `TGT-TKT-VP-SIN-CAPACIDAD` | `RTE-TKT-VP-SIN-CAPACIDAD` | Ninguno                                               | Ninguno                       | Ninguna                                            | `SAFE_BLOCK`; prohibido degradar a A4 o etiqueta                                           | `ESPECIFICADO / BLOQUEADA_SIN_DISPOSITIVO_COMPATIBLE` |
| `TGT-A4-VP-LOCAL`          | `RTE-A4-VP-LOCAL`          | `PRN-VP-L5590-01` como objetivo principal no routable | Ninguno operativo             | Ninguna dentro del perfil                          | `EXPLICIT_CENTRAL_REROUTE` hacia `TGT-A4-ADMIN-CENTRAL`; si no se solicita, `SAFE_BLOCK`   | `ESPECIFICADO / BLOQUEADA_MANTENIMIENTO`              |
| `TGT-A4-ADMIN-LOCAL`       | `RTE-A4-ADMIN-LOCAL`       | `PRN-ADMIN-L4260-01`                                  | rango 1: `CH-EPSON-L4260-USB` | rango 2: misma impresora por `CH-EPSON-L4260-WIFI` | `SAFE_BLOCK` si el dispositivo no es utilizable                                            | `ESPECIFICADO / PRINCIPAL_Y_CANAL_ALTERNATIVO`        |
| `TGT-A4-ADMIN-CENTRAL`     | `RTE-A4-ADMIN-CENTRAL`     | `PRN-ADMIN-L4260-01`                                  | rango 1: `CH-EPSON-L4260-USB` | rango 2: misma impresora por `CH-EPSON-L4260-WIFI` | `SAFE_BLOCK` si el dispositivo no es utilizable; distribución manual permanece obligatoria | `ESPECIFICADO / PRINCIPAL_Y_CANAL_ALTERNATIVO`        |

Decisiones cerradas:

- USB es el canal principal de la Epson L4260 por conexión directa confirmada; Wi-Fi es alternativa del mismo dispositivo. La decisión no afirma mayor disponibilidad medida.
- Ninguna DIG-E200I tiene un segundo dispositivo compatible dentro de su punto aprobado.
- La Epson L4260 no se convierte en alternativa silenciosa de la L5590: solo puede utilizarse mediante ruta central explícita.
- La Zebra y la L5590 conservan identidad de objetivo principal, pero no pueden seleccionarse mientras mantengan su estado físico actual.

---

#### 7. Matriz materializada de las cincuenta salidas

| Salida       | Nombre                                                    | Propietaria | Perfil físico       | Políticas objetivo aplicables                                                                                                                        | Regla de fallback                                                                   | Estado / bloqueo                                                |
| ------------ | --------------------------------------------------------- | ----------- | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | Bloqueo seguro; prohibido degradar a A4 o tiquete.                                  | `ESPECIFICADO / PRINCIPAL_OBJETIVO_BLOQUEADO`                   |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                      | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                         | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-BARRA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                       | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`; `TGT-TKT-VP-SIN-CAPACIDAD`                    | Por ruta local: bloqueo seguro; no saltar a otro punto o sede.                      | `ESPECIFICADO / OPERATIVO_POR_CONTEXTO; VP_BLOQUEADO`           |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-VC-COCINA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`; `TGT-TKT-VP-SIN-CAPACIDAD` | Por ruta local: bloqueo seguro; no saltar a otro punto o sede.                      | `ESPECIFICADO / OPERATIVO_POR_CONTEXTO; VP_BLOQUEADO`           |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `PERF-TKT-80-V`     | `TGT-TKT-VP-SIN-CAPACIDAD`                                                                                                                           | Bloqueo seguro; no existe impresora de 80 mm elegible en Vento Producción.          | `ESPECIFICADO / BLOQUEO_SEGURO_SIN_CAPACIDAD`                   |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | Bloqueo seguro si falla el dispositivo local; no saltar entre puntos.               | `ESPECIFICADO / PRINCIPAL_LOCAL_SIN_ALTERNATIVA_FISICA`         |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `PERF-A4-L`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `PERF-A4-L`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `PERF-A4-P`         | `TGT-A4-ADMIN-LOCAL`; `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | En VP: nueva resolución central explícita; si no se autoriza, bloqueo seguro.       | `ESPECIFICADO / ADMIN_OPERATIVO; VP_REQUIERE_RERUTEO_EXPLICITO` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `PERF-A4-L`         | `TGT-A4-ADMIN-LOCAL`                                                                                                                                 | Alternar USB a Wi-Fi sobre la misma L4260; si el dispositivo falla, bloqueo seguro. | `ESPECIFICADO / PRINCIPAL_ADMIN_OPERATIVA`                      |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `PERF-A4-L`         | `TGT-A4-ADMIN-LOCAL`                                                                                                                                 | Alternar USB a Wi-Fi sobre la misma L4260; si el dispositivo falla, bloqueo seguro. | `ESPECIFICADO / PRINCIPAL_ADMIN_OPERATIVA`                      |

Las políticas múltiples no compiten entre sí: `PRINT-ARC-007` selecciona primero un único perfil por destino y modo de distribución; esta tarea ordena exclusivamente los candidatos dentro de ese perfil.

---

#### 8. Códigos de resultado

| Código                                   | Resultado                                                                                       |
| ---------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `PRINT_TARGET_PRIMARY_POLICY_READY`      | Existe principal documental para el perfil; la elegibilidad runtime depende de `PRINT-ARC-009`. |
| `PRINT_TARGET_ALTERNATIVE_CHANNEL_READY` | El canal alternativo del mismo dispositivo puede evaluarse después del principal.               |
| `PRINT_TARGET_PRIMARY_STORED`            | El principal objetivo está almacenado y la política termina en bloqueo seguro.                  |
| `PRINT_TARGET_PRIMARY_MAINTENANCE`       | El principal objetivo requiere mantenimiento y no es seleccionable.                             |
| `PRINT_TARGET_NO_COMPATIBLE_DEVICE`      | El perfil no tiene dispositivo compatible.                                                      |
| `PRINT_TARGET_EXPLICIT_REROUTE_REQUIRED` | Existe ruta central permitida, pero exige una nueva decisión explícita.                         |
| `PRINT_TARGET_NO_SAFE_ALTERNATIVE`       | No existe alternativa compatible dentro del perfil.                                             |
| `PRINT_TARGET_POLICY_MISMATCH`           | La política no corresponde al perfil de ruta resuelto.                                          |
| `PRINT_TARGET_SAFE_BLOCK`                | El trabajo permanece sin envío y conserva la causa.                                             |

---

#### 9. Bloqueos de capacidad y puerta de salida

| Bloqueo                                    | Alcance                                                           | Decisión cerrada en esta tarea                                                   | Propietario de la salida física                                                                       | Condición de salida                                                                                        |
| ------------------------------------------ | ----------------------------------------------------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Zebra ZD230 almacenada y sin canal activo  | 16 salidas de etiqueta                                            | Principal objetivo `PRN-VP-ZD230-01`; sin alternativa; `SAFE_BLOCK`.             | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`, seguido de `PRINT-ARC-018` y `PRINT-ARC-020` | Alcance de despliegue aprobado, canal y adaptador materializados, y prueba física satisfactoria.           |
| Epson L5590 en mantenimiento               | A4 local de Vento Producción                                      | Principal objetivo bloqueado; reruteo central solo por nueva decisión explícita. | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`, seguido de `PRINT-ARC-018` y `PRINT-ARC-020` | Activo recuperado o sustituto compatible incorporado, adaptador materializado y prueba A4 satisfactoria.   |
| Sin impresora de 80 mm en Vento Producción | `IMP-CMD-04`, `IMP-CMD-06` e `IMP-CMD-09` cuando el destino es VP | Sin principal ni alternativa; `SAFE_BLOCK`; prohibido cambiar de medio.          | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`, seguido de `PRINT-ARC-018` y `PRINT-ARC-020` | Capacidad de 80 mm compatible incorporada, ruta y adaptador materializados, y prueba física satisfactoria. |

Las puertas anteriores no son decisiones abiertas de `PRINT-ARC-008`: la política de principal, alternativa y fallback queda completamente definida para el estado actual.

---

#### 10. Reconciliación cuantitativa

##### 10.1 Cobertura por familia

| Familia                          | Esperadas | Materializadas | Faltantes | Duplicadas |
| -------------------------------- | --------: | -------------: | --------: | ---------: |
| Etiquetas                        |        16 |             16 |         0 |          0 |
| Comandas y tiquetes operativos   |         9 |              9 |         0 |          0 |
| Comprobantes para cliente y caja |         9 |              9 |         0 |          0 |
| Documentos convencionales        |        16 |             16 |         0 |          0 |
| **Total**                        |    **50** |         **50** |     **0** |      **0** |

##### 10.2 Distribución por aplicación propietaria

| Aplicación | Salidas |
| ---------- | ------: |
| `FOGO`     |      15 |
| `NEXO`     |      14 |
| `PULSO`    |      12 |
| `NUMERA`   |       5 |
| `ORIGO`    |       4 |
| **Total**  |  **50** |

##### 10.3 Integridad de políticas

```text
SALIDAS RECIBIDAS DE PRINT-ARC-007: 50
SALIDAS MATERIALIZADAS: 50
IDENTIFICADORES IMP-* UNICOS: 50
PERFILES DE RUTA HEREDADOS: 11
POLITICAS OBJETIVO MATERIALIZADAS: 11
POLITICAS CON PRINCIPAL ELEGIBLE: 8
POLITICAS BLOQUEADAS: 3
DISPOSITIVOS FISICOS PRINCIPALES UNICOS Y ELEGIBLES: 7
DISPOSITIVOS ALTERNATIVOS FISICOS: 0
ALTERNATIVAS DE CANAL MATERIALIZADAS: 2
RERUTEOS CENTRALES AUTOMATICOS: 0
SALIDAS SIN POLITICA: 0
CAMBIOS DE RUTA ELEGIBLE: 0
CAMBIOS DE PERFIL FISICO: 0
DECISIONES ABIERTAS DENTRO DE PRINT-ARC-008: 0
```

---

#### 11. Trazabilidad con requisitos existentes

La tarea consume sin modificar los siguientes requisitos ya vigentes en `04A`:

| Requisito existente | Cobertura aplicada                                                                                                            | Tratamiento                  |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| `TREQ-PROC-445`     | La impresión se resuelve por política de sede, área, proceso, documento, cola lógica y perfil; no por IP ni última impresora. | `CONSUMIDO_SIN_MODIFICACION` |
| `TREQ-PROC-549`     | Toda dependencia declara fallback y este no puede convertirse en bypass.                                                      | `CONSUMIDO_SIN_MODIFICACION` |
| `TREQ-PROC-651`     | Cada dependencia crítica tiene alternativa autorizada o bloqueo seguro.                                                       | `CONSUMIDO_SIN_MODIFICACION` |
| `TREQ-PROC-728`     | La ausencia de capacidad ofrece alternativa autorizada o bloqueo seguro.                                                      | `CONSUMIDO_SIN_MODIFICACION` |

No se cambia texto, estado, relación, secuencia, propietario ni momento de implementación de esas filas.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa decisiones documentales ya cubiertas por requisitos canónicos vigentes de routing, fallback, alternativa y bloqueo seguro. No introduce una regla protegida distinta, no modifica esos requisitos y no implementa resolver, heartbeat, adaptador, persistencia o ejecución contra los que crear una prueba nueva.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

No se genera copia del registro canónico porque permanece sin cambios.

---

#### 13. Criterios de aceptación

`PRINT-ARC-008` queda documentalmente satisfecha porque:

- [x] consume exclusivamente perfiles y candidatos aprobados en `PRINT-ARC-007`;
- [x] define un contrato versionado de política objetivo;
- [x] materializa una política para cada uno de los once perfiles de ruta;
- [x] define principal, alternativas y fallback por perfil;
- [x] distingue alternativa de canal, dispositivo alternativo y reruteo entre perfiles;
- [x] asigna USB como canal principal y Wi-Fi como alternativa de la Epson L4260 sin inventar métricas;
- [x] conserva bloqueadas la Zebra almacenada y la Epson L5590 en mantenimiento;
- [x] formaliza bloqueo seguro para ausencia de capacidad de 80 mm en Vento Producción;
- [x] prohíbe saltos automáticos entre sedes, áreas, puntos y familias físicas;
- [x] exige reruteo central explícito y nueva decisión de ruta;
- [x] materializa una decisión para las cincuenta salidas;
- [x] reporta 50 esperadas, 50 materializadas, 0 faltantes y 0 duplicadas;
- [x] conserva distribución de propietarias 15/14/12/5/4;
- [x] asigna cada bloqueo físico a tareas existentes y una condición de salida;
- [x] no define estados ni heartbeat de impresora;
- [x] no implementa selector, adaptador, cola, reintento o envío;
- [x] no modifica código, SQL, migraciones, datos, configuración ni Supabase;
- [x] consume requisitos existentes sin generar cambios en `04A`;
- [x] mantiene `PRINT-ARC-009` como única tarea siguiente reservada.

---

#### 14. Handoff cerrado hacia `PRINT-ARC-009`

`PRINT-ARC-009` recibe:

- 11 políticas objetivo ordenadas;
- 8 principales documentalmente elegibles y 3 políticas bloqueadas;
- dos alternativas de canal sobre la Epson L4260;
- cero dispositivos alternativos físicos disponibles;
- una regla de reruteo central explícito;
- códigos de bloqueo seguro y correspondencia completa con las cincuenta salidas.

Deberá definir estado de impresora y heartbeat sin cambiar el orden normativo, volver elegible un dispositivo almacenado o en mantenimiento, seleccionar por IP o último uso, ni iniciar `PRINT-ARC-010`.

```text
TAREA ANTERIOR APROBADA
PRINT-ARC-007 — Definir enrutamiento por sede, área, documento, canal y dispositivo
        ↓
TAREA ACTUAL DESARROLLADA EN ARTEFACTO APROBADA
PRINT-ARC-008 — Definir impresora principal, alternativas y fallback
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-009 — Definir estado de impresora y heartbeat
```

La aprobación de `PRINT-ARC-008` no inicia, desarrolla ni aprueba `PRINT-ARC-009`.


### ✅ PRINT-ARC-009 — Definir estado de impresora y heartbeat

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-008 — Definir impresora principal, alternativas y fallback` — APROBADA
**Tarea siguiente:** `PRINT-ARC-010 — Definir idempotencia y prevención de impresiones duplicadas` — RESERVADA
**Tipo de tarea:** documental; contrato de observación, taxonomía de estado, política de heartbeat y matriz materializada de elegibilidad para nueve dispositivos, once políticas objetivo y cincuenta salidas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no instala agentes, bridges, drivers, adaptadores, colas, endpoints, tablas, SQL, migraciones, configuración ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir cómo se observa cada impresora, cómo se calcula la frescura de su señal y cómo esa evidencia técnica habilita o bloquea la selección runtime sin confundir disponibilidad, recepción técnica o heartbeat con impresión física confirmada.

---

#### 1. Resultado sustantivo

`PRINT-ARC-009` queda cerrada documentalmente con:

- un contrato `VENTO-PRINT-DEVICE-HEALTH` versión `1.0.0`;
- una separación normativa entre estado administrativo, expectativa de monitoreo, frescura de heartbeat, estado del agente, estado del canal, estado del dispositivo y elegibilidad runtime;
- 9 perfiles de salud para los nueve dispositivos físicos inventariados;
- 1 condición sintética de bloqueo para la ausencia de impresora de 80 mm en Vento Producción;
- 7 dispositivos operativos con heartbeat requerido;
- 2 dispositivos con heartbeat no esperado por almacenamiento o mantenimiento;
- 8 canales activos sujetos a observación: seis canales DIG-E200I y dos canales de la Epson L4260;
- una cadencia objetivo de 30 segundos para dispositivos operativos;
- ventanas cerradas de frescura: `FRESH` hasta 60 segundos, `LATE` entre 61 y 120 segundos y `STALE` por encima de 120 segundos;
- 11 políticas objetivo vinculadas a una puerta de salud explícita;
- 50 salidas con decisión de elegibilidad materializada;
- 0 observaciones en vivo, 0 heartbeats ejecutados y 0 dispositivos declarados runtime-ready sin evidencia;
- 0 faltantes, 0 duplicados y 0 cambios de identidad, propietaria, perfil físico, ruta, principal, alternativa o fallback;
- 0 implementación y 0 evidencia operativa o física declarada.

Los siete dispositivos marcados administrativamente como `OPERATIVA` conservan esa clasificación, pero su estado runtime inicial es `NEVER_OBSERVED` hasta que `PRINT-ARC-018` materialice el adaptador correspondiente y exista una observación válida. Esta diferencia evita convertir inventario documental en disponibilidad en tiempo real.

---

#### 2. Diagnóstico técnico actual

La superficie vigente de NEXO detecta BrowserPrint y enumera dispositivos locales, pero no implementa un contrato transversal de salud.

| Superficie                                                     | Comportamiento observado                                                   | Brecha frente a esta tarea                                                                                      | Clasificación                        |
| -------------------------------------------------------------- | -------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `vento-nexo/src/app/printing/jobs/_hooks/usePrinterDevices.ts` | Detecta BrowserPrint, enumera impresoras y conserva un `uid` conectado.    | No persiste observaciones, secuencia, timestamps, frescura, estado de canal, estado del agente ni elegibilidad. | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |
| `vento-nexo/src/app/printing/jobs/_lib/types.ts`               | El tipo de dispositivo expone identidad básica, conexión y función `send`. | No contiene señales de salud, errores mecánicos, consumibles, heartbeat o estado verificable.                   | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |
| `vento-nexo/src/app/printing/jobs/page.tsx`                    | Envía ZPL al dispositivo conectado y muestra un estado local de interfaz.  | El estado local no constituye heartbeat, health check ni proyección canónica.                                   | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |

La enumeración exitosa, la presencia de BrowserPrint o la existencia de un objeto con función `send` no demuestran que el dispositivo esté listo, que el canal permanezca disponible ni que una copia física haya sido producida.

---

#### 3. Fronteras e invariantes

```text
VENTO-PRINT-JOB VALIDADO
→ VENTO-PRINT-ROUTE RESUELTA
→ VENTO-PRINT-TARGET-POLICY ORDENADA
→ VENTO-PRINT-DEVICE-HEALTH VIGENTE
→ SELECCION RUNTIME O BLOQUEO SEGURO
→ PRINT-ARC-010: IDENTIDAD DEL TRABAJO Y DEDUPLICACION
→ PRINT-ARC-018: ADAPTADOR FISICO
→ PRINT-ARC-019: MONITOREO Y DIAGNOSTICO
→ PRINT-ARC-020: VALIDACION FISICA
```

Reglas obligatorias:

1. El estado administrativo y el estado runtime son capas distintas.
2. `ALMACENADA` y `REQUIERE_MANTENIMIENTO` prevalecen sobre cualquier señal técnica y bloquean selección.
3. Un heartbeat confirma únicamente que una fuente de observación emitió una muestra dentro de la ventana; no confirma impresión, papel, tinta, corte, legibilidad ni entrega.
4. La ausencia de heartbeat no autoriza a declarar avería mecánica. Produce `UNKNOWN_STALE` y bloqueo de nuevas selecciones.
5. Una señal `FRESH` no basta por sí sola: agente, canal y dispositivo deben ser utilizables y no existir una condición bloqueante conocida.
6. Una señal no soportada se registra como `UNSUPPORTED`, no como `OK`.
7. Una observación manual puede aportar evidencia para una decisión administrativa autorizada, pero no cambia estado ni sustituye heartbeat runtime.
8. La selección conserva la política y el orden definidos en `PRINT-ARC-008`; salud no descubre impresoras nuevas ni cambia sede, punto, perfil o medio.
9. La Epson L4260 conserva salud de dispositivo común y salud de canal independiente para USB y Wi-Fi.
10. Las observaciones son inmutables; el estado actual es una proyección derivada y reproducible.
11. Una observación fuera de orden no puede hacer retroceder la proyección vigente.
12. Los timestamps de recepción del colector gobiernan la frescura; el reloj del agente se conserva para diagnóstico, no para ampliar vigencia.
13. El estado `READY` habilita evaluación de un candidato, no crea un intento de impresión.
14. Idempotencia del trabajo, reintentos, confirmaciones y resultado físico permanecen respectivamente en `PRINT-ARC-010`, `PRINT-ARC-011`, `PRINT-ARC-012` y `PRINT-ARC-020`.

---

#### 4. Contrato `VENTO-PRINT-DEVICE-HEALTH` `1.0.0`

##### 4.1 Estructura normativa

```json
{
  "health_contract_id": "VENTO-PRINT-DEVICE-HEALTH",
  "health_contract_version": "1.0.0",
  "observation_id": "<uuid>",
  "device_ref": "<PRN-*>",
  "health_profile_id": "<HLP-*>",
  "agent": {
    "agent_id": "<identidad-tecnica|null>",
    "source_kind": "<ADAPTER_USB_HEARTBEAT|ADAPTER_LAN_HEARTBEAT|ADAPTER_MULTI_CHANNEL_HEARTBEAT|NOT_EXPECTED_STORED|NOT_EXPECTED_MAINTENANCE>",
    "sequence": "<entero|null>",
    "emitted_at": "<RFC3339|null>",
    "received_at": "<RFC3339|null>",
    "agent_state": "<READY|DEGRADED|UNREACHABLE|NOT_EXPECTED>"
  },
  "heartbeat": {
    "expected": true,
    "interval_seconds": 30,
    "age_seconds": 0,
    "freshness_state": "<NEVER_OBSERVED|FRESH|LATE|STALE|NOT_EXPECTED>"
  },
  "administrative_state": "<OPERATIVA|ALMACENADA|REQUIERE_MANTENIMIENTO>",
  "channels": [
    {
      "channel_id": "<CH-*>",
      "channel_state": "<READY|DEGRADED|UNREACHABLE|UNKNOWN|UNSUPPORTED>",
      "observed_at": "<RFC3339|null>"
    }
  ],
  "device_signals": {
    "discovery_state": "<PRESENT|ABSENT|UNKNOWN|UNSUPPORTED>",
    "device_error_state": "<CLEAR|WARNING|BLOCKING|UNKNOWN|UNSUPPORTED>",
    "consumable_state": "<OK|LOW|EMPTY|UNKNOWN|UNSUPPORTED>"
  },
  "derived_state": {
    "device_state": "<READY|DEGRADED_READY|UNKNOWN_STALE|OFFLINE_BLOCKED|ERROR_BLOCKED|BLOCKED_STORED|BLOCKED_MAINTENANCE|BLOCKED_NO_DEVICE>",
    "runtime_eligibility": "<ELIGIBLE|ELIGIBLE_WITH_WARNING|INELIGIBLE>",
    "reason_codes": ["<PRINT_DEVICE_*>"]
  },
  "trace": {
    "site_id": "<SITE-*>",
    "point_id": "<POINT-*>",
    "adapter_ref": "<referencia-o-null>",
    "configuration_version": "<version-o-null>"
  }
}
```

La estructura es normativa y no representa una observación ejecutada.

##### 4.2 Diccionario mínimo

| Campo                  | Obligación                           | Regla                                                                                    |
| ---------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------- |
| `observation_id`       | requerida                            | Identidad inmutable de la muestra; no se reutiliza.                                      |
| `device_ref`           | requerida                            | Debe existir en el inventario aprobado.                                                  |
| `health_profile_id`    | requerida                            | Vincula dispositivo, fuente y umbrales sin usar IP o `uid` como identidad empresarial.   |
| `agent.agent_id`       | requerida cuando se espera heartbeat | Identifica el colector o bridge, no al trabajador.                                       |
| `agent.sequence`       | requerida                            | Monótona por agente y dispositivo; duplicados o regresiones no actualizan la proyección. |
| `emitted_at`           | requerida                            | Hora declarada por el agente; sirve para diagnóstico.                                    |
| `received_at`          | requerida                            | Hora autoritativa para calcular frescura.                                                |
| `heartbeat.expected`   | requerida                            | Es `false` para almacenamiento, mantenimiento o ausencia de dispositivo.                 |
| `interval_seconds`     | requerida cuando se espera heartbeat | Debe ser 30 en esta versión.                                                             |
| `freshness_state`      | requerida                            | Se calcula únicamente con `received_at` y el último heartbeat aceptado.                  |
| `administrative_state` | requerida                            | Conserva el estado aprobado y tiene precedencia sobre runtime.                           |
| `channels[]`           | requerida para dispositivo operativo | Mantiene una fila por canal autorizado en `PRINT-ARC-007` y `PRINT-ARC-008`.             |
| `device_signals.*`     | requerida                            | Usa `UNSUPPORTED` cuando la fuente no ofrece la señal; no inventa lectura.               |
| `device_state`         | requerida                            | Resultado determinista de precedencia y señales.                                         |
| `runtime_eligibility`  | requerida                            | Solo `ELIGIBLE` o `ELIGIBLE_WITH_WARNING` permiten evaluar el candidato.                 |
| `reason_codes`         | requerida                            | Explica cada bloqueo o degradación sin texto libre como única evidencia.                 |
| `trace.*`              | requerida                            | Conserva sitio, punto, adaptador y versión de configuración usados.                      |

---

#### 5. Taxonomía de estado

##### 5.1 Estado administrativo

| Estado                   | Efecto                                                      |
| ------------------------ | ----------------------------------------------------------- |
| `OPERATIVA`              | Permite evaluar señales runtime; no garantiza elegibilidad. |
| `ALMACENADA`             | Fuerza `BLOCKED_STORED`; heartbeat `NOT_EXPECTED`.          |
| `REQUIERE_MANTENIMIENTO` | Fuerza `BLOCKED_MAINTENANCE`; heartbeat `NOT_EXPECTED`.     |

##### 5.2 Frescura del heartbeat

| Estado           | Edad desde `received_at` | Elegibilidad para nueva selección                                               |
| ---------------- | -----------------------: | ------------------------------------------------------------------------------- |
| `NEVER_OBSERVED` |     Sin muestra aceptada | `INELIGIBLE`                                                                    |
| `FRESH`          |                 0 a 60 s | Continúa a evaluación de agente, canal y dispositivo                            |
| `LATE`           |               61 a 120 s | `INELIGIBLE`; conserva diagnóstico sin seleccionar trabajo nuevo                |
| `STALE`          |             Más de 120 s | `INELIGIBLE`; estado derivado `UNKNOWN_STALE`                                   |
| `NOT_EXPECTED`   |                No aplica | La elegibilidad se resuelve por estado administrativo o ausencia de dispositivo |

##### 5.3 Estado derivado y precedencia

| Prioridad | Condición                                                       | Estado derivado       | Elegibilidad            |
| --------: | --------------------------------------------------------------- | --------------------- | ----------------------- |
|         1 | No existe dispositivo compatible                                | `BLOCKED_NO_DEVICE`   | `INELIGIBLE`            |
|         2 | Estado administrativo `ALMACENADA`                              | `BLOCKED_STORED`      | `INELIGIBLE`            |
|         3 | Estado administrativo `REQUIERE_MANTENIMIENTO`                  | `BLOCKED_MAINTENANCE` | `INELIGIBLE`            |
|         4 | Heartbeat `NEVER_OBSERVED`, `LATE` o `STALE`                    | `UNKNOWN_STALE`       | `INELIGIBLE`            |
|         5 | Agente, canal o dispositivo `UNREACHABLE` con heartbeat fresco  | `OFFLINE_BLOCKED`     | `INELIGIBLE`            |
|         6 | Error o consumible bloqueante confirmado                        | `ERROR_BLOCKED`       | `INELIGIBLE`            |
|         7 | Señal fresca, transporte utilizable y advertencia no bloqueante | `DEGRADED_READY`      | `ELIGIBLE_WITH_WARNING` |
|         8 | Señal fresca, agente listo, canal listo y sin bloqueo conocido  | `READY`               | `ELIGIBLE`              |

La precedencia se evalúa de arriba hacia abajo. Un estado de menor prioridad no puede ocultar uno superior.

---

#### 6. Política de heartbeat y proyección

1. Los siete dispositivos operativos emiten una observación objetivo cada 30 segundos mediante el adaptador o bridge definido en `PRINT-ARC-018`.
2. `FRESH` admite como máximo dos intervalos desde la última recepción aceptada.
3. `LATE` conserva diagnóstico, pero bloquea nuevas selecciones desde el segundo intervalo vencido.
4. `STALE` comienza al superar cuatro intervalos y deriva `UNKNOWN_STALE`.
5. El heartbeat no se reenvía como intento de impresión y no consume `job_id`.
6. Cada observación se guarda como hecho inmutable; la vista actual se calcula por la última secuencia válida y `received_at`.
7. Una secuencia duplicada se ignora de forma idempotente; una secuencia menor se conserva para auditoría sin modificar la proyección.
8. Si el agente está fresco y reporta canal o dispositivo inaccesible, el estado es `OFFLINE_BLOCKED`, no `UNKNOWN_STALE`.
9. Si el agente deja de emitir, no se infiere la causa entre host, red, bridge o impresora; el estado es `UNKNOWN_STALE`.
10. Un cambio administrativo requiere una decisión de inventario o mantenimiento autorizada; ningún heartbeat puede cambiarlo.
11. La recuperación de `UNKNOWN_STALE`, `OFFLINE_BLOCKED` o `ERROR_BLOCKED` exige una observación fresca posterior que demuestre que la condición bloqueante desapareció.
12. `PRINT-ARC-019` deberá exponer edad, causa, agente, canal y dispositivo; `PRINT-ARC-020` deberá validar los estados contra hardware real.

---

#### 7. Matriz materializada de los nueve dispositivos

| Perfil de salud                 | Dispositivo                 | Modelo                | Sede / punto                                               | Familia       | Estado administrativo    | Canales observables                         | Fuente de heartbeat               | Cadencia  | Estado inicial   | Elegibilidad inicial                 | Regla cerrada                                                                                                   |
| ------------------------------- | --------------------------- | --------------------- | ---------------------------------------------------------- | ------------- | ------------------------ | ------------------------------------------- | --------------------------------- | --------- | ---------------- | ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `HLP-PRN-VP-ZD230-01`           | `PRN-VP-ZD230-01`           | Zebra ZD230           | `SITE-VENTO-PRODUCCION` / `POINT-VP-ZEBRA-ALMACENADA`      | Etiquetas     | `ALMACENADA`             | Ninguno activo                              | `NOT_EXPECTED_STORED`             | No aplica | `NOT_EXPECTED`   | `BLOCKED_STORED`                     | El estado administrativo prevalece; no se solicita heartbeat ni se habilita selección.                          |
| `HLP-PRN-VP-L5590-01`           | `PRN-VP-L5590-01`           | Epson EcoTank L5590   | `SITE-VENTO-PRODUCCION` / `POINT-VP-EPSON-FUERA-OPERACION` | A4            | `REQUIERE_MANTENIMIENTO` | Ninguno operativo                           | `NOT_EXPECTED_MAINTENANCE`        | No aplica | `NOT_EXPECTED`   | `BLOCKED_MAINTENANCE`                | El mantenimiento bloquea cualquier selección; una señal técnica no puede volverla operativa.                    |
| `HLP-PRN-ADMIN-L4260-01`        | `PRN-ADMIN-L4260-01`        | Epson EcoTank L4260   | `SITE-VENTO-ADMIN` / `POINT-ADMIN-OFICINA`                 | A4            | `OPERATIVA`              | `CH-EPSON-L4260-USB`; `CH-EPSON-L4260-WIFI` | `ADAPTER_MULTI_CHANNEL_HEARTBEAT` | 30 s      | `NEVER_OBSERVED` | `UNKNOWN_BLOCKED` hasta señal fresca | USB se evalúa primero y Wi-Fi después; ambos canales conservan estado independiente sobre el mismo dispositivo. |
| `HLP-PRN-MOLKA-DIGE200I-01`     | `PRN-MOLKA-DIGE200I-01`     | Digital POS DIG-E200I | `SITE-MOLKA` / `POINT-MOLKA-CAJA`                          | Tiquete 80 mm | `OPERATIVA`              | `CH-DIGE200I-USB`                           | `ADAPTER_USB_HEARTBEAT`           | 30 s      | `NEVER_OBSERVED` | `UNKNOWN_BLOCKED` hasta señal fresca | La ausencia del host o del dispositivo impide nuevas selecciones en Molka.                                      |
| `HLP-PRN-SAUDO-DIGE200I-01`     | `PRN-SAUDO-DIGE200I-01`     | Digital POS DIG-E200I | `SITE-SAUDO` / `POINT-SAUDO-CAJA`                          | Tiquete 80 mm | `OPERATIVA`              | `CH-DIGE200I-USB`                           | `ADAPTER_USB_HEARTBEAT`           | 30 s      | `NEVER_OBSERVED` | `UNKNOWN_BLOCKED` hasta señal fresca | La ausencia del host o del dispositivo impide nuevas selecciones en Saudo.                                      |
| `HLP-PRN-VC-CAJA-DIGE200I-01`   | `PRN-VC-CAJA-DIGE200I-01`   | Digital POS DIG-E200I | `SITE-VENTO-CAFE` / `POINT-VC-CAJA-MOSTRADOR`              | Tiquete 80 mm | `OPERATIVA`              | `CH-DIGE200I-USB`                           | `ADAPTER_USB_HEARTBEAT`           | 30 s      | `NEVER_OBSERVED` | `UNKNOWN_BLOCKED` hasta señal fresca | La señal solo habilita caja / mostrador; no habilita barra, bar ni cocina.                                      |
| `HLP-PRN-VC-BARRA-DIGE200I-01`  | `PRN-VC-BARRA-DIGE200I-01`  | Digital POS DIG-E200I | `SITE-VENTO-CAFE` / `POINT-VC-BARRA-CALIENTES`             | Tiquete 80 mm | `OPERATIVA`              | `CH-DIGE200I-LAN`                           | `ADAPTER_LAN_HEARTBEAT`           | 30 s      | `NEVER_OBSERVED` | `UNKNOWN_BLOCKED` hasta señal fresca | La señal solo habilita barra de bebidas calientes; no habilita bar, cocina ni caja.                             |
| `HLP-PRN-VC-BAR-DIGE200I-01`    | `PRN-VC-BAR-DIGE200I-01`    | Digital POS DIG-E200I | `SITE-VENTO-CAFE` / `POINT-VC-BAR-FRIAS`                   | Tiquete 80 mm | `OPERATIVA`              | `CH-DIGE200I-LAN`                           | `ADAPTER_LAN_HEARTBEAT`           | 30 s      | `NEVER_OBSERVED` | `UNKNOWN_BLOCKED` hasta señal fresca | La señal solo habilita bar de bebidas frías; no habilita barra, cocina ni caja.                                 |
| `HLP-PRN-VC-COCINA-DIGE200I-01` | `PRN-VC-COCINA-DIGE200I-01` | Digital POS DIG-E200I | `SITE-VENTO-CAFE` / `POINT-VC-COCINA`                      | Tiquete 80 mm | `OPERATIVA`              | `CH-DIGE200I-LAN`                           | `ADAPTER_LAN_HEARTBEAT`           | 30 s      | `NEVER_OBSERVED` | `UNKNOWN_BLOCKED` hasta señal fresca | La señal solo habilita cocina; no habilita barra, bar ni caja.                                                  |

Los estados iniciales representan la línea base documental verificable: no existe colector implementado ni muestra en vivo registrada. No se reinterpretan como una falla de los siete equipos operativos.

---

#### 8. Puerta de salud para las once políticas objetivo

| Política objetivo          | Perfil de salud                 | Canales evaluados          | Estados que habilitan candidato                  | Resultado en cualquier otro estado                                                |
| -------------------------- | ------------------------------- | -------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------------- |
| `TGT-LBL-VP-CENTRAL`       | `HLP-PRN-VP-ZD230-01`           | No aplica                  | `BLOCKED_STORED`                                 | El almacenamiento prevalece; no se evalúan candidatos runtime.                    |
| `TGT-TKT-MOLKA-CAJA`       | `HLP-PRN-MOLKA-DIGE200I-01`     | `CH-DIGE200I-USB`          | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Cualquier otro estado termina en `SAFE_BLOCK` local.                              |
| `TGT-TKT-SAUDO-CAJA`       | `HLP-PRN-SAUDO-DIGE200I-01`     | `CH-DIGE200I-USB`          | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Cualquier otro estado termina en `SAFE_BLOCK` local.                              |
| `TGT-TKT-VC-CAJA`          | `HLP-PRN-VC-CAJA-DIGE200I-01`   | `CH-DIGE200I-USB`          | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Cualquier otro estado termina en `SAFE_BLOCK`; no salta a otro punto.             |
| `TGT-TKT-VC-BARRA`         | `HLP-PRN-VC-BARRA-DIGE200I-01`  | `CH-DIGE200I-LAN`          | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Cualquier otro estado termina en `SAFE_BLOCK`; no salta a otro punto.             |
| `TGT-TKT-VC-BAR`           | `HLP-PRN-VC-BAR-DIGE200I-01`    | `CH-DIGE200I-LAN`          | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Cualquier otro estado termina en `SAFE_BLOCK`; no salta a otro punto.             |
| `TGT-TKT-VC-COCINA`        | `HLP-PRN-VC-COCINA-DIGE200I-01` | `CH-DIGE200I-LAN`          | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Cualquier otro estado termina en `SAFE_BLOCK`; no salta a otro punto.             |
| `TGT-TKT-VP-SIN-CAPACIDAD` | `HLP-NO-DEVICE-VP-80MM`         | No aplica                  | `BLOCKED_NO_DEVICE`                              | No existe heartbeat posible ni degradación de medio.                              |
| `TGT-A4-VP-LOCAL`          | `HLP-PRN-VP-L5590-01`           | No aplica                  | `BLOCKED_MAINTENANCE`                            | Solo admite una nueva decisión explícita hacia la política central ya autorizada. |
| `TGT-A4-ADMIN-LOCAL`       | `HLP-PRN-ADMIN-L4260-01`        | rango 1 USB; rango 2 Wi-Fi | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Si USB no es elegible se evalúa Wi-Fi; si ninguno lo es, `SAFE_BLOCK`.            |
| `TGT-A4-ADMIN-CENTRAL`     | `HLP-PRN-ADMIN-L4260-01`        | rango 1 USB; rango 2 Wi-Fi | `READY` o `DEGRADED_READY` con heartbeat `FRESH` | Misma regla de canal; conserva distribución manual explícita.                     |

Las políticas bloqueadas permanecen completamente definidas. No requieren una señal inexistente para confirmar una causa administrativa ya aprobada.

---

#### 9. Matriz materializada de las cincuenta salidas

| Salida       | Nombre                                                    | Propietaria | Perfil físico       | Políticas objetivo heredadas                                                                                                                         | Puertas de salud                                                                                                                                                                                                | Regla de elegibilidad                                                                                                                            | Estado / bloqueo                                              |
| ------------ | --------------------------------------------------------- | ----------- | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `PERF-LBL-100X50-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `PERF-LBL-100X75-H` | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `PERF-LBL-75X50-H`  | `TGT-LBL-VP-CENTRAL`                                                                                                                                 | `HLP-PRN-VP-ZD230-01`                                                                                                                                                                                           | Bloqueo administrativo `STORED`; no se espera heartbeat.                                                                                         | `ESPECIFICADO / BLOCKED_STORED`                               |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                      | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-COCINA-DIGE200I-01`                                                                                                                       | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                         | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-BAR-DIGE200I-01`                                                                                                                          | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-BARRA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                       | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-BARRA-DIGE200I-01`                                                                                                                        | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`; `TGT-TKT-VP-SIN-CAPACIDAD`                    | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-BARRA-DIGE200I-01`; `HLP-PRN-VC-BAR-DIGE200I-01`; `HLP-PRN-VC-COCINA-DIGE200I-01`; `HLP-NO-DEVICE-VP-80MM`                                | La ruta elegida gobierna: sedes con dispositivo exigen heartbeat fresco; Vento Producción queda `BLOCKED_NO_DEVICE`.                             | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_NO_DEVICE`   |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-VC-COCINA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`; `TGT-TKT-VP-SIN-CAPACIDAD` | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`; `HLP-PRN-VC-BARRA-DIGE200I-01`; `HLP-PRN-VC-BAR-DIGE200I-01`; `HLP-PRN-VC-COCINA-DIGE200I-01`; `HLP-NO-DEVICE-VP-80MM` | La ruta elegida gobierna: sedes con dispositivo exigen heartbeat fresco; Vento Producción queda `BLOCKED_NO_DEVICE`.                             | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_NO_DEVICE`   |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-BARRA-DIGE200I-01`; `HLP-PRN-VC-BAR-DIGE200I-01`; `HLP-PRN-VC-COCINA-DIGE200I-01`                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-COCINA`; `TGT-TKT-VC-BARRA`; `TGT-TKT-VC-BAR`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-BARRA-DIGE200I-01`; `HLP-PRN-VC-BAR-DIGE200I-01`; `HLP-PRN-VC-COCINA-DIGE200I-01`                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `PERF-TKT-80-V`     | `TGT-TKT-VP-SIN-CAPACIDAD`                                                                                                                           | `HLP-NO-DEVICE-VP-80MM`                                                                                                                                                                                         | Bloqueo `NO_DEVICE`; no existe heartbeat posible.                                                                                                | `ESPECIFICADO / BLOCKED_NO_DEVICE`                            |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `PERF-TKT-80-V`     | `TGT-TKT-VC-CAJA`; `TGT-TKT-MOLKA-CAJA`; `TGT-TKT-SAUDO-CAJA`                                                                                        | `HLP-PRN-MOLKA-DIGE200I-01`; `HLP-PRN-SAUDO-DIGE200I-01`; `HLP-PRN-VC-CAJA-DIGE200I-01`                                                                                                                         | La política resuelta exige heartbeat `FRESH` y estado `READY` o `DEGRADED_READY`; otro estado bloquea solo ese punto.                            | `ESPECIFICADO / HEALTH_GATE_LOCAL`                            |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `PERF-A4-L`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `PERF-A4-L`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `PERF-A4-P`         | `TGT-A4-ADMIN-LOCAL`; `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                      | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `PERF-A4-P`         | `TGT-A4-VP-LOCAL`; `TGT-A4-ADMIN-CENTRAL`                                                                                                            | `HLP-PRN-VP-L5590-01`; `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                 | La ruta resuelta gobierna: L5590 permanece bloqueada por mantenimiento; L4260 exige heartbeat fresco; el reruteo central sigue siendo explícito. | `ESPECIFICADO / HEALTH_GATE_POR_RUTA; VP_BLOCKED_MAINTENANCE` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `PERF-A4-L`         | `TGT-A4-ADMIN-LOCAL`                                                                                                                                 | `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                                        | La L4260 exige heartbeat fresco; USB se evalúa antes que Wi-Fi sobre el mismo dispositivo.                                                       | `ESPECIFICADO / HEALTH_GATE_L4260_MULTI_CHANNEL`              |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `PERF-A4-L`         | `TGT-A4-ADMIN-LOCAL`                                                                                                                                 | `HLP-PRN-ADMIN-L4260-01`                                                                                                                                                                                        | La L4260 exige heartbeat fresco; USB se evalúa antes que Wi-Fi sobre el mismo dispositivo.                                                       | `ESPECIFICADO / HEALTH_GATE_L4260_MULTI_CHANNEL`              |

La existencia de varias políticas en una fila no exige que todas estén saludables. `PRINT-ARC-007` resuelve primero una única ruta y `PRINT-ARC-008` selecciona su política; esta tarea evalúa exclusivamente la puerta de salud correspondiente a esa decisión.

---

#### 10. Algoritmo determinista de elegibilidad

Para cada candidato ordenado por `PRINT-ARC-008`:

1. validar la identidad `PRN-*`, el perfil `HLP-*` y la versión contractual;
2. comprobar si existe un dispositivo físico;
3. aplicar estado administrativo con precedencia absoluta;
4. comprobar si el perfil exige heartbeat;
5. obtener la última observación aceptada por secuencia y `received_at`;
6. calcular `NEVER_OBSERVED`, `FRESH`, `LATE` o `STALE`;
7. con heartbeat fresco, evaluar agente, canal y presencia del dispositivo;
8. evaluar únicamente señales soportadas y condiciones bloqueantes confirmadas;
9. derivar `READY`, `DEGRADED_READY`, `UNKNOWN_STALE`, `OFFLINE_BLOCKED` o `ERROR_BLOCKED`;
10. devolver `ELIGIBLE`, `ELIGIBLE_WITH_WARNING` o `INELIGIBLE` con códigos tipados;
11. si el candidato es ineligible, continuar únicamente con la alternativa ya ordenada dentro de la misma política;
12. si no existe alternativa elegible, aplicar el fallback de `PRINT-ARC-008` sin descubrir otro dispositivo;
13. conservar la decisión, la observación y los motivos usados para que `PRINT-ARC-019` pueda explicar el resultado.

El algoritmo no envía datos, no crea intentos, no consume reintentos y no modifica el trabajo original.

---

#### 11. Códigos de resultado

| Código                                  | Significado                                                                    |
| --------------------------------------- | ------------------------------------------------------------------------------ |
| `PRINT_DEVICE_READY`                    | Heartbeat fresco, agente y canal utilizables, sin bloqueo conocido.            |
| `PRINT_DEVICE_DEGRADED_READY`           | Existe advertencia no bloqueante; el candidato sigue elegible con diagnóstico. |
| `PRINT_DEVICE_HEARTBEAT_NEVER_OBSERVED` | No existe muestra aceptada; nuevas selecciones permanecen bloqueadas.          |
| `PRINT_DEVICE_HEARTBEAT_LATE`           | La señal superó 60 segundos y ya no habilita nuevas selecciones.               |
| `PRINT_DEVICE_HEARTBEAT_STALE`          | La señal superó 120 segundos; la causa técnica no se presume.                  |
| `PRINT_DEVICE_AGENT_UNREACHABLE`        | El agente reportado no está utilizable con muestra fresca.                     |
| `PRINT_DEVICE_CHANNEL_UNREACHABLE`      | El canal autorizado no está utilizable con muestra fresca.                     |
| `PRINT_DEVICE_NOT_DISCOVERED`           | El agente está activo, pero el dispositivo no aparece en la fuente autorizada. |
| `PRINT_DEVICE_ERROR_BLOCKING`           | Existe una condición de dispositivo o consumible confirmada como bloqueante.   |
| `PRINT_DEVICE_SIGNAL_UNSUPPORTED`       | La fuente no ofrece la señal; no se convierte en éxito ni en error.            |
| `PRINT_DEVICE_BLOCKED_STORED`           | El dispositivo está almacenado y no puede seleccionarse.                       |
| `PRINT_DEVICE_BLOCKED_MAINTENANCE`      | El dispositivo requiere mantenimiento y no puede seleccionarse.                |
| `PRINT_DEVICE_NO_COMPATIBLE_DEVICE`     | No existe dispositivo físico compatible para la política.                      |
| `PRINT_DEVICE_OBSERVATION_DUPLICATE`    | La secuencia ya fue aceptada; la proyección no cambia.                         |
| `PRINT_DEVICE_OBSERVATION_OUT_OF_ORDER` | La secuencia es anterior a la vigente; se conserva sin retroceder estado.      |

---

#### 12. Reconciliación cuantitativa

##### 12.1 Inventario y monitoreo

| Concepto                               | Cantidad |
| -------------------------------------- | -------: |
| Dispositivos físicos heredados         |        9 |
| Perfiles de salud físicos              |        9 |
| Dispositivos con heartbeat requerido   |        7 |
| Dispositivos con heartbeat no esperado |        2 |
| Canales activos observables            |        8 |
| Condiciones sintéticas sin dispositivo |        1 |
| Observaciones live declaradas          |        0 |
| Dispositivos declarados runtime-ready  |        0 |

##### 12.2 Cobertura de políticas y salidas

| Concepto                         | Esperadas | Materializadas | Faltantes | Duplicadas |
| -------------------------------- | --------: | -------------: | --------: | ---------: |
| Políticas objetivo               |        11 |             11 |         0 |          0 |
| Etiquetas                        |        16 |             16 |         0 |          0 |
| Comandas y tiquetes operativos   |         9 |              9 |         0 |          0 |
| Comprobantes para cliente y caja |         9 |              9 |         0 |          0 |
| Documentos convencionales        |        16 |             16 |         0 |          0 |
| **Total de salidas**             |    **50** |         **50** |     **0** |      **0** |

```text
DISPOSITIVOS HEREDADOS: 9
DISPOSITIVOS MATERIALIZADOS: 9
PERFILES DE SALUD UNICOS: 9
POLITICAS OBJETIVO HEREDADAS: 11
POLITICAS CON PUERTA DE SALUD: 11
SALIDAS HEREDADAS: 50
SALIDAS MATERIALIZADAS: 50
IDENTIFICADORES IMP-* UNICOS: 50
CAMBIOS DE PROPIEDAD: 0
CAMBIOS DE PERFIL FISICO: 0
CAMBIOS DE RUTA O TARGET: 0
OBSERVACIONES EN VIVO INVENTADAS: 0
DECISIONES ABIERTAS DENTRO DE PRINT-ARC-009: 0
```

---

#### 13. Bloqueos y condiciones de salida

| Condición                                           | Estado definido aquí                                         | Tarea responsable                                                                                                           | Condición de salida verificable                                                                                                    |
| --------------------------------------------------- | ------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Zebra almacenada                                    | `BLOCKED_STORED`; heartbeat `NOT_EXPECTED`                   | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`, `PRINT-ARC-018`, `PRINT-ARC-020`                                   | Despliegue aprobado, adaptador activo, primera señal fresca y prueba física satisfactoria.                                         |
| Epson L5590 en mantenimiento                        | `BLOCKED_MAINTENANCE`; heartbeat `NOT_EXPECTED`              | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`, `PRINT-ARC-018`, `PRINT-ARC-020`                                   | Recuperación o sustitución autorizada, adaptador activo, primera señal fresca y prueba A4 satisfactoria.                           |
| Sin impresora de 80 mm en Vento Producción          | `BLOCKED_NO_DEVICE`                                          | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`, `PRINT-ARC-007`, `PRINT-ARC-008`, `PRINT-ARC-018`, `PRINT-ARC-020` | Dispositivo compatible incorporado, ruta y target aprobados, adaptador activo, primera señal fresca y prueba física satisfactoria. |
| Siete dispositivos operativos sin colector canónico | `NEVER_OBSERVED` y `UNKNOWN_BLOCKED` como línea base runtime | `PRINT-ARC-018`, `PRINT-ARC-019`, `PRINT-ARC-020`                                                                           | Adaptador y colector implementados, monitoreo visible y ejecución física validada.                                                 |

Estas condiciones no dejan incompleta la definición: cada estado, precedencia, propietario y puerta de salida están materializados. No se declara implementación ni evidencia inexistente.

---

#### 14. Cobertura por requisitos canónicos vigentes

Las reglas de esta tarea quedan cubiertas, sin modificar su identidad ni estado, por requisitos vigentes que ya protegen:

- `TREQ-PROC-444`: separación de configuración, disponibilidad, canal, comando, resultado y conciliación del periférico;
- `TREQ-PROC-445`: routing de impresión por política y contexto, no por IP o última impresora;
- `TREQ-PROC-471`: separación entre liveness, readiness, dependencia y salud de dispositivo;
- `TREQ-PROC-474`: observación de dispositivo, estación, red, periférico, consumible y resultado físico;
- `TREQ-PROC-479`: observabilidad de destino lógico, cola, estado, receipt, resultado desconocido y conciliación;
- `TREQ-PROC-557`: validación de descubrimiento, adaptador, configuración, canal, sustituto y diagnóstico.

Todos ellos ya vinculan la arquitectura de impresión `PRINT-ARC-001` a `PRINT-ARC-020` con implementación y prueba física. Esta tarea especializa el contrato documental dentro de ese alcance y no cambia filas del registro canónico.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las reglas de salud, frescura, bloqueo seguro, separación de estados y observabilidad ya están protegidas por requisitos canónicos vigentes que abarcan el servicio completo de impresión. `PRINT-ARC-009` no crea, modifica, difiere, descarta ni vuelve obsoleto ningún requisito, por lo que el registro `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md` permanece sin cambios.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

---

#### 15. Criterios de aceptación

- [x] define un contrato raíz estable y versionado para salud de impresora;
- [x] separa estado administrativo, heartbeat, agente, canal, dispositivo, consumible y elegibilidad;
- [x] define una política de timestamps, secuencia y proyección reproducible;
- [x] define cadencia y ventanas cerradas de frescura;
- [x] impide que heartbeat, discovery o receipt se interpreten como impresión física;
- [x] conserva los nueve dispositivos y materializa una decisión para cada uno;
- [x] conserva las once políticas objetivo y materializa su puerta de salud;
- [x] conserva las cincuenta salidas, nombres, propietarias, perfiles y targets;
- [x] reporta 50 esperadas, 50 materializadas, 0 faltantes y 0 duplicadas;
- [x] reconcilia 15 salidas de FOGO, 14 de NEXO, 12 de PULSO, 5 de NUMERA y 4 de ORIGO;
- [x] conserva los bloqueos por almacenamiento, mantenimiento y ausencia de dispositivo;
- [x] evita declarar online u operativo sin una muestra fresca verificable;
- [x] evita declarar avería mecánica únicamente por pérdida de heartbeat;
- [x] define recuperación, observaciones duplicadas y observaciones fuera de orden;
- [x] asigna implementación, monitoreo y validación física a tareas exactas;
- [x] no define idempotencia del trabajo, reintentos, confirmaciones, cancelación ni reimpresión;
- [x] no implementa código, SQL, migraciones, configuración, datos ni Supabase;
- [x] declara cero cambios de requisitos con justificación concreta;
- [x] mantiene `PRINT-ARC-010` como única tarea siguiente reservada.

---

#### 16. Handoff cerrado hacia `PRINT-ARC-010`

`PRINT-ARC-010` recibe:

- `VENTO-PRINT-DEVICE-HEALTH` `1.0.0`;
- nueve perfiles físicos de salud y una condición sintética sin dispositivo;
- estados administrativos, runtime y de frescura separados;
- 11 políticas objetivo con puerta de salud;
- 50 salidas con elegibilidad materializada;
- una regla explícita de que `READY` habilita evaluación, pero no constituye intento ni resultado físico;
- observaciones identificadas, secuenciadas e inmutables que no usan `job_id` como identidad de heartbeat.

Deberá definir identidad e idempotencia del trabajo de impresión sin:

- reutilizar heartbeat como clave de trabajo;
- convertir una nueva observación de salud en un nuevo intento;
- alterar `VENTO-PRINT-JOB`, la ruta, el target o el estado administrativo;
- ocultar un resultado desconocido mediante una nueva intención;
- definir todavía reintentos, confirmaciones, cancelación o reimpresión;
- declarar implementación o evidencia inexistente.

```text
TAREA ANTERIOR APROBADA
PRINT-ARC-008 — Definir impresora principal, alternativas y fallback
        ↓
TAREA ACTUAL DESARROLLADA EN ARTEFACTO APROBADA
PRINT-ARC-009 — Definir estado de impresora y heartbeat
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-010 — Definir idempotencia y prevención de impresiones duplicadas
```

La aprobación de `PRINT-ARC-009` no inicia, desarrolla ni aprueba `PRINT-ARC-010`.


### ✅ PRINT-ARC-010 — Definir idempotencia y prevención de impresiones duplicadas

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-009 — Definir estado de impresora y heartbeat` — APROBADA
**Tarea siguiente:** `PRINT-ARC-011 — Definir reintentos automáticos y cola de fallos` — RESERVADA
**Tipo de tarea:** documental; contrato canónico de identidad de intención, huella semántica, admisión atómica, deduplicación y tratamiento de colisiones para las cincuenta salidas imprimibles
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no implementa tablas, restricciones, RPC, colas, workers, adaptadores, reintentos, envíos, migraciones, configuración ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir una identidad estable para cada intención de copia, impedir que concurrencia, doble toque, callback repetido, timeout, reconexión, fallback o una clave nueva creen una segunda copia no autorizada, y separar reintento de reimpresión.

---

#### 1. Resultado sustantivo

`PRINT-ARC-010` queda cerrada documentalmente con:

- un contrato `VENTO-PRINT-IDEMPOTENCY` versión `1.0.0`;
- una clave de idempotencia determinista por copia legítima;
- una huella semántica independiente que impide evadir deduplicación mediante una clave distinta;
- un registro de admisión append-only con decisión atómica;
- seis decisiones normalizadas de admisión;
- cuatro perfiles familiares y cinco perfiles especializados para comandas;
- cincuenta decisiones materializadas, una por cada identidad `IMP-*`;
- una regla explícita para múltiples copias autorizadas mediante `copy_slot_id`;
- una frontera cerrada entre reenvío técnico, nuevo intento empresarial y reimpresión;
- cero claves, jobs, receipts, intentos o impresiones ejecutados;
- cero cambios de identidad, nombre, propietaria, plantilla, versión, perfil físico, ruta, política objetivo o puerta de salud heredada.

La idempotencia se aplica antes de crear una segunda instancia de trabajo. Un fallo, timeout, cambio de dispositivo o cambio de canal no libera la identidad ni autoriza otra copia.

---

#### 2. Diagnóstico técnico actual

La superficie vigente de impresión de NEXO conserva una cola textual en `localStorage`, elimina únicamente líneas exactamente iguales durante una operación de append y envía ZPL directamente mediante `device.send`.

| Superficie                                  | Comportamiento observado                                                                            | Brecha frente a esta tarea                                                                                                         | Clasificación                        |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `vento-nexo/src/app/printing/jobs/page.tsx` | Persiste texto local bajo `vento-nexo:printing:queue:v1`.                                           | No existe intención durable, identidad de copia, versión empresarial ni registro autoritativo compartido.                          | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |
| `vento-nexo/src/app/printing/jobs/page.tsx` | Un `Set` evita solo añadir una línea textual idéntica en el estado local actual.                    | No protege doble toque, concurrencia, otro navegador, otra estación, reconexión, nueva clave o payload semánticamente equivalente. | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |
| `vento-nexo/src/app/printing/jobs/page.tsx` | `sendZpl` invoca directamente `device.send` y muestra `Impresión enviada.` en el callback de éxito. | No existe idempotency key, huella semántica, receipt durable, consulta de resultado ni barrera contra un segundo envío.            | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |

El comportamiento observado no se declara defectuoso por sí solo dentro de esta fase documental; se registra como brecha de implementación frente al contrato objetivo.

---

#### 3. Fronteras e invariantes

```text
INTENCION EMPRESARIAL AUTORIZADA
→ SNAPSHOT INMUTABLE VENTO-PRINT-JOB
→ IDENTIDAD SEMANTICA DE COPIA
→ ADMISION IDEMPOTENTE ATOMICA
→ JOB NUEVO O JOB EXISTENTE
→ PRINT-ARC-011: INTENTOS Y REINTENTOS
→ PRINT-ARC-012: RECEIPTS Y CONFIRMACIONES
→ PRINT-ARC-014: REIMPRESION EXPLICITA
```

Reglas obligatorias:

1. Una intención empresarial produce como máximo un `job_id` por copia legítima.
2. Repetir la misma solicitud con la misma clave y la misma huella devuelve el mismo `job_id`; no crea trabajo ni envío adicional.
3. Reutilizar una clave con contenido diferente se rechaza; nunca se actualiza el trabajo anterior.
4. Presentar una clave nueva con la misma huella semántica de copia se trata como duplicado semántico, no como intención nueva.
5. Un timeout, callback perdido, cierre del navegador o resultado desconocido conserva la clave y bloquea una segunda intención hasta conciliación.
6. El estado fallido, cancelado, expirado o bloqueado no libera la clave ni la huella histórica.
7. Un cambio de impresora, canal, heartbeat, agente, intento, posición de cola o receipt no cambia la identidad de la copia.
8. Una nueva versión empresarial, una modificación autorizada o una cancelación documentada puede producir otra salida porque cambia la identidad empresarial gobernada.
9. Varias copias originales solo son legítimas cuando el contrato propietario declara su cantidad y materializa `copy_slot_id` distintos antes de admitir trabajos.
10. La reimpresión no reutiliza ni libera la identidad original; deberá crear una acción separada vinculada conforme a `PRINT-ARC-014`.
11. Los lotes agrupan trabajos, pero no sustituyen la deduplicación individual de cada copia.
12. La deduplicación es autoritativa en servidor o almacenamiento compartido; una caché o `localStorage` solo puede optimizar y nunca decidir unicidad.
13. La admisión debe ser atómica frente a concurrencia: no se permite comprobar y crear en operaciones separadas sin restricción de unicidad.
14. La respuesta idempotente conserva el resultado conocido; no transforma un receipt técnico en evidencia física.
15. Ningún hash utiliza datos personales legibles como clave pública; las representaciones se minimizan y se almacenan como digests.

---

#### 4. Contrato `VENTO-PRINT-IDEMPOTENCY` `1.0.0`

##### 4.1 Estructura normativa

```json
{
  "idempotency_contract_id": "VENTO-PRINT-IDEMPOTENCY",
  "idempotency_contract_version": "1.0.0",
  "intent_id": "<uuid>",
  "job_id": "<uuid|null>",
  "output_id": "<IMP-*>",
  "owner_app": "<aplicacion-propietaria-heredada>",
  "source": {
    "resource_type": "<tipo-estable>",
    "resource_id": "<id-estable>",
    "resource_version": "<version-o-secuencia-estable>"
  },
  "render_snapshot": {
    "template_id": "<TPL-IMP-*>",
    "template_version": "<semver>",
    "payload_hash": "sha256:<hex>"
  },
  "copy_identity": {
    "copy_role": "ORIGINAL",
    "copy_slot_id": "<entero-positivo-o-id-estable>",
    "logical_destination": "<sede-area-punto-o-destinatario-logico>"
  },
  "semantic_fingerprint": "sha256:<hex>",
  "idempotency_key": "vpi_1_<base64url>",
  "admission": {
    "decision": "<ACCEPT_NEW|RETURN_EXISTING|REJECT_KEY_CONFLICT|REJECT_SEMANTIC_DUPLICATE|BLOCK_RESULT_UNKNOWN|REJECT_INVALID_IDENTITY>",
    "existing_job_id": "<uuid|null>",
    "decided_at": "<RFC3339>",
    "reason_code": "<PRINT_IDEMPOTENCY_* >"
  },
  "trace": {
    "correlation_id": "<id-estable>",
    "causation_id": "<id-estable>",
    "batch_id": "<uuid|null>",
    "original_job_id": null
  }
}
```

La estructura es normativa. No declara tablas, endpoints ni tecnología de persistencia.

##### 4.2 Campos que componen la huella semántica

La huella se calcula sobre JSON canónico UTF-8 con claves ordenadas, arrays en orden empresarial, números y moneda normalizados, timestamps RFC 3339 y ausencia de campos volátiles.

```text
semantic_fingerprint = SHA-256(
  contract_version
  + owner_app
  + output_id
  + source.resource_type
  + source.resource_id
  + source.resource_version
  + template_id
  + template_version
  + payload_hash
  + copy_role
  + copy_slot_id
  + logical_destination
)
```

`idempotency_key` deriva de la huella y del namespace `vpi_1`. El servicio autoritativo recalcula ambos valores y rechaza discrepancias.

##### 4.3 Campos excluidos de la identidad

No forman parte de la huella ni de la clave:

- `device_ref`;
- `channel_id`;
- `health_profile_id`;
- estado o edad del heartbeat;
- número de intento;
- worker o agente;
- posición de cola;
- timestamps de envío o recepción;
- receipt del adaptador;
- mensaje de error;
- usuario que reintenta la misma intención.

Excluirlos garantiza que fallback, reconexión o retry conserven una sola copia lógica.

---

#### 5. Canonicalización y hash de payload

1. El `payload_hash` se calcula sobre el snapshot validado de `VENTO-PRINT-JOB`, no sobre HTML, ZPL, PDF o bytes específicos del adaptador.
2. Las claves de objeto se ordenan lexicográficamente.
3. Los arrays conservan el orden empresarial aprobado; no se reordenan ítems de una comanda o documento.
4. `null`, ausencia de campo y string vacío permanecen distintos cuando el contrato de payload los diferencia.
5. Los valores monetarios incluyen moneda y precisión canónica.
6. Los timestamps se expresan en RFC 3339 con offset o UTC verificable.
7. Los identificadores se conservan exactamente; no se normalizan mayúsculas o espacios por inferencia.
8. Los campos de diagnóstico, UI, heartbeat, intento y receipt se excluyen.
9. Un cambio de snapshot exige nueva versión empresarial o nueva intención autorizada; no se sobrescribe el hash previo.
10. El render generado puede tener su propio hash técnico en `PRINT-ARC-018`, pero no reemplaza el `payload_hash` empresarial.

---

#### 6. Decisión atómica de admisión

| Condición                                       | Decisión                    | Efecto permitido                                                                        |
| ----------------------------------------------- | --------------------------- | --------------------------------------------------------------------------------------- |
| Identidad completa; clave y huella inexistentes | `ACCEPT_NEW`                | Crear exactamente un `job_id` y un registro de admisión.                                |
| Misma clave y misma huella                      | `RETURN_EXISTING`           | Retornar el `job_id`, estado y referencias existentes sin crear intento.                |
| Misma clave y huella diferente                  | `REJECT_KEY_CONFLICT`       | Rechazar y auditar reutilización incompatible.                                          |
| Clave diferente y huella original existente     | `REJECT_SEMANTIC_DUPLICATE` | Retornar referencia al trabajo existente y exigir reimpresión explícita si corresponde. |
| Trabajo existente en resultado desconocido      | `BLOCK_RESULT_UNKNOWN`      | Consultar y conciliar; prohibido crear otra intención o envío.                          |
| Falta identidad, versión, hash, destino o slot  | `REJECT_INVALID_IDENTITY`   | No crear trabajo; devolver campos faltantes tipados.                                    |

La decisión y la creación del trabajo deberán ocurrir en una única transacción o mecanismo equivalente con unicidad sobre `idempotency_key` y sobre la huella de copia original.

---

#### 7. Copias múltiples, lotes y documentos versionados

##### 7.1 Copias múltiples autorizadas

Una cantidad `N` de copias originales se materializa antes de la admisión como `N` slots estables:

```text
copy_slot_id = 1 ... N
```

Cada slot posee una huella distinta y admite un solo trabajo. Aumentar `N` después del envío requiere una nueva decisión empresarial o una reimpresión autorizada; no se inventan slots durante retry.

##### 7.2 Lotes

`batch_id` agrupa trabajos para operación o transporte. No es clave de deduplicación y no permite que un único resultado o receipt cierre todos los trabajos.

##### 7.3 Modificación y cancelación documentales

Una modificación, adición o cancelación tiene su propio identificador y versión de recurso. No reutiliza la identidad de la comanda original, pero conserva correlación y destino lógico original.

##### 7.4 Reimpresión

Una reimpresión futura deberá usar:

- `copy_role = REPRINT`;
- `original_job_id` obligatorio;
- `reprint_action_id` generado por `PRINT-ARC-014`;
- actor, motivo y autorización;
- nueva huella y nueva clave derivadas de esa acción.

Esta tarea no autoriza ni ejecuta reimpresiones.

---

#### 8. Matriz materializada de las cincuenta salidas

Las denominaciones y propietarias permanecen exactamente como fueron aprobadas. Esta matriz materializa exclusivamente el perfil de identidad y deduplicación.

| Salida       | Perfil de idempotencia              | Identidad empresarial mínima                       | Ámbito de copia legítima                        | Resultado documental                 |
| ------------ | ----------------------------------- | -------------------------------------------------- | ----------------------------------------------- | ------------------------------------ |
| `IMP-LBL-01` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-02` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-03` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-04` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-05` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-06` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-07` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-08` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-09` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-10` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-11` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-12` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-13` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-14` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-15` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-LBL-16` | `IDP-RESOURCE-VERSION`              | `resource_type + resource_id + resource_version`   | `logical_destination + copy_slot_id`            | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-01` | `IDP-ORDER-VERSION-DESTINATION`     | `pedido_id + version_orden`                        | `preparation_destination + copy_slot_id`        | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-02` | `IDP-ORDER-VERSION-DESTINATION`     | `pedido_id + version_orden`                        | `preparation_destination + copy_slot_id`        | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-03` | `IDP-ORDER-VERSION-DESTINATION`     | `pedido_id + version_orden`                        | `preparation_destination + copy_slot_id`        | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-04` | `IDP-PREPARATION-REQUEST-VERSION`   | `solicitud_preparacion_id + resource_version`      | `execution_destination + copy_slot_id`          | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-05` | `IDP-FULFILLMENT-SNAPSHOT`          | `pedido_id + fulfillment_snapshot_version`         | `pickup_or_dispatch_destination + copy_slot_id` | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-06` | `IDP-REPLENISHMENT-REQUEST-VERSION` | `reposicion_id + resource_version`                 | `receiving_destination + copy_slot_id`          | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-07` | `IDP-ORDER-MODIFICATION`            | `modificacion_id + version_orden`                  | `original_command_destination + copy_slot_id`   | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-08` | `IDP-ORDER-CANCELLATION`            | `cancelacion_id + version_orden`                   | `original_command_destination + copy_slot_id`   | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CMD-09` | `IDP-PRODUCTION-REQUEST-VERSION`    | `solicitud_produccion_id + resource_version`       | `production_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-01` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-02` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-03` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-04` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-05` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-06` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-07` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-08` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-CLI-09` | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `business_document_id + business_document_version` | `delivery_destination + copy_slot_id`           | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-01` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-02` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-03` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-04` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-05` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-06` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-07` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-08` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-09` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-10` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-11` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-12` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-13` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-14` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-15` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |
| `IMP-DOC-16` | `IDP-DOCUMENT-SNAPSHOT`             | `document_or_report_id + snapshot_version`         | `authorized_destination + copy_slot_id`         | `ESPECIFICADO / DEDUP_SCOPE_CERRADO` |

**Control de cobertura:** 50 esperadas, 50 materializadas, 50 identificadores únicos, 0 faltantes y 0 duplicados.

---

#### 9. Códigos de resultado

| Código                                 | Significado                                                    |
| -------------------------------------- | -------------------------------------------------------------- |
| `PRINT_IDEMPOTENCY_ACCEPTED_NEW`       | La copia legítima fue admitida y recibió un único trabajo.     |
| `PRINT_IDEMPOTENCY_RETURN_EXISTING`    | La repetición coincide y recibe el trabajo existente.          |
| `PRINT_IDEMPOTENCY_KEY_CONFLICT`       | La misma clave fue presentada con otra huella.                 |
| `PRINT_IDEMPOTENCY_SEMANTIC_DUPLICATE` | Otra clave intenta crear la misma copia original.              |
| `PRINT_IDEMPOTENCY_RESULT_UNKNOWN`     | Existe trabajo sin resultado resuelto; se bloquea duplicación. |
| `PRINT_IDEMPOTENCY_INVALID_IDENTITY`   | Faltan campos obligatorios para calcular identidad.            |
| `PRINT_IDEMPOTENCY_REPRINT_REQUIRED`   | La copia adicional debe tramitarse como reimpresión separada.  |

---

#### 10. Requisitos existentes consumidos

Esta tarea especializa sin modificar requisitos vigentes sobre:

- resultado desconocido y consulta por clave y receipt;
- conservación de la misma clave durante retries;
- separación entre intención, routing, receipt, aceptación y evidencia física;
- estados independientes de periférico y conciliación;
- identidad, payload hash, intento, cola y receipt del trabajo físico;
- deduplicación de toques, callbacks y retries repetidos.

Referencias consumidas: `TREQ-PROC-278`, `TREQ-PROC-279`, `TREQ-PROC-284`, `TREQ-PROC-444`, `TREQ-PROC-446` y `TREQ-PROC-611`.

---

#### 11. Destinos documentales de implementación y evidencia

| Elemento no ejecutado en esta tarea                                                  | Propietario                                             | Condición de salida                                                                                                                          |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Persistencia autoritativa, constraints, transacción de admisión y consulta por clave | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | El alcance de implementación identifica repositorio, modelo físico, consumidores, migración en `vento-shell`, rollback y pruebas aplicables. |
| Política de intentos, backoff y cola de fallos                                       | `PRINT-ARC-011`                                         | Cada estado admitido tiene reglas de intento sin crear otra intención ni liberar la clave.                                                   |
| Receipts y confirmaciones diferenciadas                                              | `PRINT-ARC-012`                                         | Envío, aceptación, impresión física y entrega conservan evidencias separadas y correlacionadas.                                              |
| Cancelación y expiración                                                             | `PRINT-ARC-013`                                         | Se definen límites de transición sin reutilizar identidades ni ocultar resultados desconocidos.                                              |
| Reimpresión separada                                                                 | `PRINT-ARC-014`                                         | Existe acción con actor, motivo, autorización, vínculo original y nueva identidad.                                                           |
| Integración con adaptadores                                                          | `PRINT-ARC-018`                                         | Cada adaptador propaga job, intento, clave, huella y receipt sin reinterpretarlos.                                                           |
| Validación física de ausencia de duplicados                                          | `PRINT-ARC-020`                                         | Escenarios concurrentes, timeout, callback perdido y recuperación demuestran una sola copia o una conciliación explícita.                    |

No quedan pendientes narrativos sin tarea propietaria ni condición de salida.

---

#### Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el contrato documental especializa comportamientos de idempotencia, deduplicación, resultado desconocido y periféricos que ya están registrados en requisitos canónicos vigentes. No se crea ni modifica comportamiento ejecutable, prueba, estado del registro ni evidencia en esta fase.

---

#### 12. Criterios de aceptación

- [x] define contrato y versión estables;
- [x] distingue intención, trabajo, intento, receipt y copia física;
- [x] define clave de idempotencia y huella semántica independientes;
- [x] impide evasión mediante una clave nueva;
- [x] define canonicalización y hash del snapshot empresarial;
- [x] excluye impresora, canal, heartbeat e intento de la identidad de copia;
- [x] define admisión atómica y seis decisiones cerradas;
- [x] conserva identidad después de fallo, timeout, cancelación o expiración;
- [x] materializa slots para copias múltiples legítimas;
- [x] separa retry de reimpresión;
- [x] materializa las cincuenta salidas una sola vez;
- [x] conserva 16 etiquetas, 9 comandas, 9 comprobantes y 16 documentos;
- [x] reporta 0 faltantes y 0 duplicados;
- [x] asigna toda implementación y evidencia a tareas existentes con salida verificable;
- [x] declara cero cambios de requisitos con justificación concreta;
- [x] no modifica código, SQL, migraciones, datos, configuración ni Supabase;
- [x] mantiene `PRINT-ARC-011` como única tarea siguiente reservada.

---

#### 13. Handoff cerrado hacia `PRINT-ARC-011`

`PRINT-ARC-011` recibe:

- `VENTO-PRINT-IDEMPOTENCY` `1.0.0`;
- cincuenta perfiles de deduplicación materializados;
- `idempotency_key`, `semantic_fingerprint`, `job_id`, `intent_id` y `copy_slot_id` estables;
- decisiones `ACCEPT_NEW`, `RETURN_EXISTING`, `REJECT_KEY_CONFLICT`, `REJECT_SEMANTIC_DUPLICATE`, `BLOCK_RESULT_UNKNOWN` y `REJECT_INVALID_IDENTITY`;
- la regla de que retry conserva intención, trabajo, clave y huella;
- la prohibición de liberar una identidad por fallo o timeout;
- la frontera que reserva toda copia adicional legítima para `PRINT-ARC-014`.

`PRINT-ARC-011` podrá definir intentos automáticos y cola de fallos sin crear otra intención, otro trabajo o una segunda copia lógica.

```text
TAREA ACTUAL DESARROLLADA EN ARTEFACTO APROBADA
PRINT-ARC-010 — Definir idempotencia y prevención de impresiones duplicadas
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-011 — Definir reintentos automáticos y cola de fallos
```

La preparación de este artefacto no inicia, desarrolla ni aprueba `PRINT-ARC-011`.


### ✅ PRINT-ARC-011 — Definir reintentos automáticos y cola de fallos

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-010 — Definir idempotencia y prevención de impresiones duplicadas` — APROBADA
**Tarea siguiente:** `PRINT-ARC-012 — Definir confirmación de envío, impresión y entrega cuando sea verificable` — RESERVADA
**Tipo de tarea:** documental; contrato de reintento seguro, ciclo de intento, clasificación de fallos, programación determinista, carriles lógicos de trabajo, dead-letter y matriz materializada para cincuenta salidas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no crea workers, tablas, colas persistentes, endpoints, adaptadores, migraciones, configuración, despliegues ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir cuándo una impresión puede reintentarse automáticamente, cuándo debe bloquearse por resultado desconocido, cuándo termina en cola de fallos y cómo se conserva una sola intención empresarial durante todos los intentos técnicos.

---

#### 1. Resultado sustantivo

`PRINT-ARC-011` queda cerrada documentalmente con:

- el contrato `VENTO-PRINT-RETRY-QUEUE` versión `1.0.0`;
- una separación normativa entre trabajo, entrada de cola, lease de ejecución, intento técnico, recepción del adaptador, posible aceptación del periférico, resultado desconocido, reintento programado y fallo terminal;
- 11 estados de intento y 6 estados de entrada de cola;
- 8 clases canónicas de fallo y una decisión determinista para cada clase;
- 6 perfiles de reintento materializados;
- 5 carriles lógicos del servicio de impresión;
- una partición de despacho con concurrencia inicial máxima de una ejecución por dispositivo y canal;
- 50 salidas con perfil, prioridad e identidad de deduplicación preservados;
- 16 etiquetas, 9 comandas o tiquetes operativos, 9 comprobantes para cliente o caja y 16 documentos convencionales;
- distribución propietaria intacta: FOGO 15, NEXO 14, PULSO 12, NUMERA 5 y ORIGO 4;
- cero nuevos trabajos creados por reintento, cero liberaciones de idempotencia por timeout y cero replays automáticos desde dead-letter;
- cero implementación y cero evidencia operativa o física declarada.

La cola definida aquí es un componente lógico interno del servicio transversal de impresión. No activa ni presupone el grupo general `QUEUE_CONDITIONAL`, que permanece fuera del alcance de esta etapa prioritaria.

---

#### 2. Diagnóstico técnico actual

La superficie vigente de impresión en NEXO conserva una cola de texto en `localStorage`, construye ZPL y llama directamente `device.send`. El callback exitoso presenta “Impresión enviada” y el callback de error muestra el mensaje recibido.

| Superficie                                  | Comportamiento observado                                                          | Brecha frente a esta tarea                                                                                                                | Clasificación                        |
| ------------------------------------------- | --------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `vento-nexo/src/app/printing/jobs/page.tsx` | Conserva líneas locales bajo `vento-nexo:printing:queue:v1`.                      | No existe entrada canónica de cola, lease, intento numerado, deadline, programación ni dead-letter.                                       | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |
| `vento-nexo/src/app/printing/jobs/page.tsx` | Evita repetir una línea idéntica únicamente durante la operación local de append. | La comparación textual local no sustituye la idempotencia transversal ni sobrevive entre actores, dispositivos o aplicaciones.            | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |
| `vento-nexo/src/app/printing/jobs/page.tsx` | Invoca `device.send` con callback de éxito o error.                               | No distingue rechazo anterior al envío, aceptación del adaptador, posible aceptación del periférico, timeout ambiguo ni resultado físico. | `FUERA_DE_ALCANCE_DE_IMPLEMENTACION` |
| Superficie transversal                      | No existe worker o registro persistente de fallos verificado.                     | No hay reintento automático seguro, presupuesto, backoff, conciliación ni cola de fallos consultable.                                     | `NO_IMPLEMENTADO`                    |

El comportamiento actual no se presenta como conforme. Esta tarea define el objetivo documental consumible por el alcance de implementación posterior.

---

#### 3. Frontera e invariantes

```text
VENTO-PRINT-JOB VALIDADO
→ RUTA, POLITICA OBJETIVO Y SALUD RESUELTAS
→ VENTO-PRINT-IDEMPOTENCY ADMITIDA
→ VENTO-PRINT-RETRY-QUEUE ENCOLADA
→ LEASE EXCLUSIVO
→ INTENTO TECNICO
→ RECEIPT O RESULTADO DESCONOCIDO
→ REINTENTO SEGURO, CONCILIACION O COLA DE FALLOS
→ PRINT-ARC-012: CONFIRMACIONES Y RECEIPTS
```

Reglas obligatorias:

1. Un reintento conserva exactamente `job_id`, `intent_id`, `copy_slot_id`, `idempotency_key` y `semantic_fingerprint`.
2. Un reintento no cambia payload, hash, plantilla, versión, perfil físico ni destino lógico.
3. El dispositivo o canal físico puede cambiar únicamente si la política y el fallback ya aprobados lo permiten; ese cambio no crea una copia nueva.
4. Cada envío técnico utiliza un `attempt_id` único y un `attempt_number` entero, monotónico y sin reutilización.
5. El contador de intentos aumenta al entrar en `DISPATCHING`, no al esperar salud, adquirir un lease o permanecer bloqueado antes del envío.
6. Un bloqueo de ruta, salud, dispositivo almacenado, mantenimiento o ausencia de capacidad no consume intentos.
7. Solo se reintenta automáticamente cuando existe evidencia de que el comando no pudo haber sido aceptado, o cuando el periférico emitió un rechazo explícito y seguro.
8. Si el comando pudo haber sido aceptado, la pérdida de callback, timeout o desconexión produce `RESULT_UNKNOWN`; queda prohibido el reintento ciego.
9. `ADAPTER_ACCEPTED` y `PERIPHERAL_ACCEPTED` son hitos técnicos, no prueba de impresión física correcta.
10. El presupuesto automático pertenece al trabajo y no se reinicia por reinicio de proceso, reconexión, cambio de worker, cambio de dispositivo permitido o intervención manual.
11. La expiración de un lease anterior a `DISPATCHING` permite reclamar la misma entrada sin consumir intento. Después de `DISPATCHING`, una expiración sin resultado produce `RESULT_UNKNOWN`.
12. Solo puede existir un lease activo por `job_id` y una ejecución `DISPATCHING` por partición física.
13. La partición inicial es `device_ref + channel_id`; su concurrencia canónica inicial es uno.
14. La prioridad no puede violar causalidad, adelantar una cancelación antes de la comanda relacionada ni enviar una versión obsoleta después de una versión posterior confirmada.
15. Un fallo de contrato o payload no se corrige mutando el trabajo. La corrección exige una nueva versión empresarial y un nuevo trabajo.
16. Un fallo de autorización no se reintenta automáticamente; exige una nueva acción autorizada.
17. Una entrada en dead-letter no se reproduce sola. Toda salida requiere decisión explícita, razón, actor y trazabilidad.
18. El replay manual de un trabajo fallido conserva su identidad y no equivale a reimpresión.
19. Una copia adicional legítima posterior al resultado físico pertenece a `PRINT-ARC-014` y debe crear la identidad de copia autorizada correspondiente.
20. Cancelación y expiración pertenecen a `PRINT-ARC-013`; esta tarea conserva sus puntos de integración sin definir sus reglas finales.
21. Confirmación de envío, aceptación, impresión y entrega pertenece a `PRINT-ARC-012`; esta tarea no inventa receipts o evidencia todavía inexistentes.
22. La implementación física, adaptadores y workers permanece condicionada por `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`.

---

#### 4. Contrato `VENTO-PRINT-RETRY-QUEUE` `1.0.0`

##### 4.1 Estructura normativa

```json
{
  "retry_contract_id": "VENTO-PRINT-RETRY-QUEUE",
  "retry_contract_version": "1.0.0",
  "queue_entry_id": "<uuid>",
  "queue_lane": "<PRINT_READY|PRINT_DELAYED|PRINT_BLOCKED|PRINT_RECONCILIATION_REQUIRED|PRINT_DEAD_LETTER>",
  "queue_state": "<QUEUED|LEASED|BLOCKED|RETRY_SCHEDULED|RECONCILIATION_REQUIRED|DEAD_LETTERED>",
  "identity": {
    "job_id": "<uuid>",
    "intent_id": "<string>",
    "copy_slot_id": "<string>",
    "idempotency_key": "<sha256>",
    "semantic_fingerprint": "<sha256>"
  },
  "document": {
    "output_id": "<IMP-*>",
    "owner_application": "<FOGO|NEXO|PULSO|NUMERA|ORIGO>",
    "payload_hash": "<sha256>",
    "template_id": "<TPL-*>",
    "template_version": "<semver>",
    "logical_destination": "<destino-logico>"
  },
  "policy": {
    "retry_profile_id": "<RTP-*>",
    "priority": "<P0_URGENT|P1_HIGH|P2_STANDARD|P3_BACKGROUND>",
    "max_attempts": 4,
    "retry_delays_seconds": [5, 15, 45],
    "retry_window_seconds": 120,
    "lease_seconds": 30
  },
  "execution": {
    "attempt_count": 0,
    "next_attempt_at": "<RFC3339|null>",
    "retry_window_expires_at": "<RFC3339>",
    "causal_key": "<string>",
    "dispatch_partition_key": "<device_ref+channel_id|null>",
    "selected_target_policy_id": "<TGT-*|null>",
    "device_ref": "<PRN-*|null>",
    "channel_id": "<CH-*|null>"
  },
  "lease": {
    "lease_id": "<uuid|null>",
    "worker_id": "<string|null>",
    "acquired_at": "<RFC3339|null>",
    "expires_at": "<RFC3339|null>"
  },
  "last_failure": {
    "failure_code": "<PRINT_RETRY_*|null>",
    "failure_class": "<SAFE_TRANSIENT|RECOVERABLE_DEVICE|RESULT_UNKNOWN|TERMINAL_CONTRACT|TERMINAL_AUTHORIZATION|TERMINAL_COMPATIBILITY|BUDGET_EXHAUSTED|PRE_DISPATCH_BLOCK|null>",
    "failure_phase": "<PRE_DISPATCH|DISPATCH|ADAPTER|PERIPHERAL|POST_ACCEPTANCE|null>",
    "command_may_have_been_accepted": false,
    "observed_at": "<RFC3339|null>"
  },
  "timestamps": {
    "created_at": "<RFC3339>",
    "updated_at": "<RFC3339>",
    "first_dispatched_at": "<RFC3339|null>",
    "last_dispatched_at": "<RFC3339|null>",
    "dead_lettered_at": "<RFC3339|null>"
  },
  "trace": {
    "correlation_id": "<string>",
    "causation_id": "<string|null>",
    "batch_id": "<string|null>"
  }
}
```

##### 4.2 Registro inmutable de intento

Cada entrada en `DISPATCHING` genera un registro append-only:

```json
{
  "attempt_id": "<uuid>",
  "job_id": "<uuid>",
  "attempt_number": 1,
  "lease_id": "<uuid>",
  "worker_id": "<string>",
  "target_policy_id": "<TGT-*>",
  "device_ref": "<PRN-*>",
  "channel_id": "<CH-*>",
  "payload_hash": "<sha256>",
  "started_at": "<RFC3339>",
  "finished_at": "<RFC3339|null>",
  "attempt_state": "<DISPATCHING|ADAPTER_ACCEPTED|PERIPHERAL_ACCEPTED|RESULT_UNKNOWN|SUCCEEDED|FAILED_RETRYABLE|FAILED_TERMINAL|DEAD_LETTERED>",
  "receipt_ref": "<string|null>",
  "failure_code": "<string|null>"
}
```

El registro no se sobrescribe. Los cambios de estado se conservan como eventos o revisiones ordenadas; la proyección vigente debe poder reconstruirse.

---

#### 5. Estados y transiciones

##### 5.1 Estados de entrada de cola

| Estado                    | Significado                                                                | Transiciones permitidas                                                                  |
| ------------------------- | -------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `QUEUED`                  | Trabajo admitido y listo para evaluar ruta, salud y lease.                 | `LEASED`, `BLOCKED`, `DEAD_LETTERED` por fallo terminal previo al envío.                 |
| `LEASED`                  | Un worker posee temporalmente el derecho exclusivo de evaluar y despachar. | `QUEUED` si expira antes del envío; `BLOCKED`; `RETRY_SCHEDULED`; inicio de intento.     |
| `BLOCKED`                 | Falta una precondición previa al envío. No existe intento activo.          | `QUEUED` cuando cambia la evidencia; `DEAD_LETTERED` si la condición se vuelve terminal. |
| `RETRY_SCHEDULED`         | Existe fallo seguro y un `next_attempt_at` dentro del presupuesto.         | `QUEUED` al vencer el delay; `DEAD_LETTERED` al expirar ventana o presupuesto.           |
| `RECONCILIATION_REQUIRED` | El comando pudo haber sido aceptado y no existe resultado autoritativo.    | Resultado definido por `PRINT-ARC-012`; nunca vuelve automáticamente a `QUEUED`.         |
| `DEAD_LETTERED`           | El trabajo agotó presupuesto o tiene fallo terminal.                       | Solo revisión y decisión explícita; sin replay automático.                               |

##### 5.2 Estados de intento

| Estado                | Significado                                                                               | Regla                                                                           |
| --------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `READY`               | Entrada elegible antes de asignar intento.                                                | No consume intento.                                                             |
| `LEASED`              | Worker seleccionado antes del envío.                                                      | No consume intento.                                                             |
| `DISPATCHING`         | Se inició la operación de envío.                                                          | Asigna `attempt_id` y aumenta `attempt_number`.                                 |
| `ADAPTER_ACCEPTED`    | El adaptador aceptó el comando.                                                           | No demuestra aceptación del periférico ni impresión.                            |
| `PERIPHERAL_ACCEPTED` | Existe acuse técnico verificable del periférico.                                          | No demuestra resultado físico correcto.                                         |
| `RESULT_UNKNOWN`      | El comando pudo producir efecto, pero el resultado no es conocido.                        | Bloquea reintento y exige conciliación.                                         |
| `RETRY_SCHEDULED`     | El intento terminó con fallo seguro y existe presupuesto.                                 | Conserva la identidad completa del trabajo.                                     |
| `SUCCEEDED`           | Existe la confirmación que `PRINT-ARC-012` defina como suficiente para cerrar el intento. | No equivale por anticipado a entrega física; depende del nivel de confirmación. |
| `FAILED_RETRYABLE`    | Fallo clasificado como seguro para reintento.                                             | Programa el delay del perfil.                                                   |
| `FAILED_TERMINAL`     | Contrato, autorización o compatibilidad impiden continuar.                                | Pasa a dead-letter.                                                             |
| `DEAD_LETTERED`       | No quedan intentos automáticos o existe fallo terminal.                                   | Requiere intervención explícita.                                                |

---

#### 6. Taxonomía de fallos y decisión determinista

| Clase                    | Ejemplos canónicos                                                                                                                 |                                              ¿Consume intento? | Decisión automática                                                            | Carril resultante                     |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------: | ------------------------------------------------------------------------------ | ------------------------------------- |
| `PRE_DISPATCH_BLOCK`     | Ruta sin dispositivo, salud no fresca, equipo almacenado, mantenimiento, lease ocupado.                                            |                                                             No | Esperar cambio de evidencia; no usar backoff de envío.                         | `PRINT_BLOCKED`                       |
| `SAFE_TRANSIENT`         | Adaptador no disponible antes de transmitir, conexión rechazada antes de enviar bytes, worker interrumpido antes de `DISPATCHING`. |                             Sí solo si ya inició `DISPATCHING` | Reintentar según perfil cuando esté demostrado que el comando no fue aceptado. | `PRINT_DELAYED`                       |
| `RECOVERABLE_DEVICE`     | Rechazo explícito por papel, tapa, atasco o condición recuperable antes de aceptar el trabajo.                                     |                                                             Sí | Esperar salud recuperada y reintentar con la misma identidad.                  | `PRINT_DELAYED` o `PRINT_BLOCKED`     |
| `RESULT_UNKNOWN`         | Timeout tras posible envío, callback perdido, lease vencido después de `DISPATCHING`, desconexión después de aceptación.           |                                                             Sí | Prohibido reintentar; solicitar conciliación.                                  | `PRINT_RECONCILIATION_REQUIRED`       |
| `TERMINAL_CONTRACT`      | Payload, hash, plantilla, versión o esquema inválidos.                                                                             | No si se detecta antes de envío; sí si aparece durante intento | No mutar el trabajo; exigir nueva versión empresarial y nuevo trabajo.         | `PRINT_DEAD_LETTER`                   |
| `TERMINAL_AUTHORIZATION` | Actor, permiso o referencia de autorización inválidos o vencidos.                                                                  |                                No si se detecta antes de envío | No reintentar; exigir nueva acción autorizada.                                 | `PRINT_DEAD_LETTER`                   |
| `TERMINAL_COMPATIBILITY` | Formato, medio, resolución, lenguaje o destino incompatibles sin candidato aprobado.                                               |                                No si se detecta antes de envío | Bloqueo o dead-letter según permanencia; no degradar formato.                  | `PRINT_BLOCKED` o `PRINT_DEAD_LETTER` |
| `BUDGET_EXHAUSTED`       | Se alcanzó `max_attempts` o venció `retry_window_expires_at`.                                                                      |                                               Ya contabilizado | Finalizar reintento automático.                                                | `PRINT_DEAD_LETTER`                   |

##### 6.1 Códigos mínimos

| Código                               | Clase                    | Condición                                                    |
| ------------------------------------ | ------------------------ | ------------------------------------------------------------ |
| `PRINT_RETRY_ADAPTER_UNAVAILABLE`    | `SAFE_TRANSIENT`         | Adaptador no disponible antes de transmitir.                 |
| `PRINT_RETRY_CONNECTION_REFUSED`     | `SAFE_TRANSIENT`         | Conexión rechazada con evidencia de cero aceptación.         |
| `PRINT_RETRY_DEVICE_RECOVERABLE`     | `RECOVERABLE_DEVICE`     | Periférico rechaza explícitamente por condición recuperable. |
| `PRINT_RETRY_RESULT_UNKNOWN`         | `RESULT_UNKNOWN`         | Posible aceptación sin resultado autoritativo.               |
| `PRINT_RETRY_PAYLOAD_INVALID`        | `TERMINAL_CONTRACT`      | Datos o hash incompatibles con el trabajo.                   |
| `PRINT_RETRY_TEMPLATE_INVALID`       | `TERMINAL_CONTRACT`      | Plantilla o versión no válida.                               |
| `PRINT_RETRY_UNAUTHORIZED`           | `TERMINAL_AUTHORIZATION` | Falta autoridad vigente.                                     |
| `PRINT_RETRY_FORMAT_INCOMPATIBLE`    | `TERMINAL_COMPATIBILITY` | No existe destino compatible aprobado.                       |
| `PRINT_RETRY_BUDGET_EXHAUSTED`       | `BUDGET_EXHAUSTED`       | Se agotaron intentos o ventana.                              |
| `PRINT_RETRY_MANUAL_REVIEW_REQUIRED` | terminal o desconocido   | La clasificación automática no es suficiente.                |

Un código no puede cambiar de clase por conveniencia del worker. Los mapeos de error de cada adaptador deberán versionarse en `PRINT-ARC-018`.

---

#### 7. Perfiles canónicos de reintento

Los delays se calculan desde la finalización del intento anterior. `max_attempts` incluye el intento inicial. No se aplica jitter aleatorio: la programación debe ser reproducible. Los trabajos que comparten timestamp se ordenan por causalidad, `next_attempt_at`, prioridad, `created_at` y `job_id`.

| Perfil                | Alcance                                        | Prioridad       | Intentos máximos | Delays posteriores    | Ventana total | Lease | Resultado al agotar |
| --------------------- | ---------------------------------------------- | --------------- | ---------------: | --------------------- | ------------: | ----: | ------------------- |
| `RTP-LBL-STANDARD`    | Etiquetas `IMP-LBL-*`.                         | `P2_STANDARD`   |                3 | 15 s, 60 s            |         300 s |  60 s | `PRINT_DEAD_LETTER` |
| `RTP-CMD-PREPARATION` | Comandas de preparación y ejecución.           | `P1_HIGH`       |                4 | 5 s, 15 s, 45 s       |         120 s |  30 s | `PRINT_DEAD_LETTER` |
| `RTP-CMD-LOGISTICS`   | Expedición, reposición y solicitud productiva. | `P1_HIGH`       |                4 | 10 s, 30 s, 60 s      |         300 s |  45 s | `PRINT_DEAD_LETTER` |
| `RTP-CMD-CORRECTIVE`  | Modificación y cancelación de comanda.         | `P0_URGENT`     |                5 | 3 s, 10 s, 30 s, 60 s |         180 s |  30 s | `PRINT_DEAD_LETTER` |
| `RTP-CLI-RECEIPT`     | Comprobantes para cliente y caja.              | `P2_STANDARD`   |                3 | 10 s, 30 s            |         300 s |  45 s | `PRINT_DEAD_LETTER` |
| `RTP-DOC-A4`          | Documentos convencionales A4.                  | `P3_BACKGROUND` |                3 | 30 s, 120 s           |         900 s | 120 s | `PRINT_DEAD_LETTER` |

Los valores son objetivos documentales iniciales. Su ajuste posterior exige versión nueva del contrato y evidencia operativa; una implementación no puede cambiarlos mediante constantes locales silenciosas.

---

#### 8. Carriles lógicos, orden y concurrencia

| Carril                          | Contenido                                                                      | Regla de entrada                                               | Regla de salida                                                    |
| ------------------------------- | ------------------------------------------------------------------------------ | -------------------------------------------------------------- | ------------------------------------------------------------------ |
| `PRINT_READY`                   | Entradas cuya hora de ejecución llegó y cuyas precondiciones pueden evaluarse. | Idempotencia admitida y `next_attempt_at <= now`.              | Lease o bloqueo documentado.                                       |
| `PRINT_DELAYED`                 | Reintentos seguros pendientes de backoff.                                      | Fallo `SAFE_TRANSIENT` o `RECOVERABLE_DEVICE` con presupuesto. | Pasa a `PRINT_READY` en `next_attempt_at`.                         |
| `PRINT_BLOCKED`                 | Trabajos sin precondición de ruta, salud, dispositivo o capacidad.             | Bloqueo previo al envío.                                       | Solo al cambiar evidencia o decisión canónica aplicable.           |
| `PRINT_RECONCILIATION_REQUIRED` | Trabajos con posible efecto físico y resultado desconocido.                    | `command_may_have_been_accepted = true`.                       | Únicamente por resultado autoritativo definido en `PRINT-ARC-012`. |
| `PRINT_DEAD_LETTER`             | Fallos terminales o presupuesto agotado.                                       | Clasificación terminal o agotamiento.                          | Revisión explícita; nunca replay automático.                       |

Reglas de scheduling:

1. Un predecesor causal no resuelto bloquea sus dependientes.
2. Dentro de una misma `causal_key`, se conserva orden de versión y creación.
3. La prioridad solo ordena entradas causalmente elegibles.
4. Entre entradas de igual prioridad, se usa `next_attempt_at`, luego `created_at` y finalmente `job_id` ascendente.
5. Una entrada antigua ya elegible no puede ser desplazada por otra más nueva de la misma prioridad.
6. La partición `device_ref + channel_id` permite una sola ejecución simultánea por defecto.
7. El cambio de USB a Wi-Fi de la misma Epson L4260 conserva el trabajo y genera un nuevo intento solo cuando el envío anterior terminó con fallo seguro.
8. La falta de capacidad en Vento Producción no activa polling agresivo ni consume presupuesto; permanece en `PRINT_BLOCKED`.

---

#### 9. Cola de fallos y dead-letter

Cada entrada de dead-letter conserva como mínimo:

| Campo                       | Obligación                                                                                                            |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `failure_record_id`         | Identidad inmutable del registro.                                                                                     |
| Identidad completa          | `job_id`, `intent_id`, `copy_slot_id`, clave y huella semántica.                                                      |
| Contexto documental         | Salida, propietaria, payload hash, plantilla, versión y destino lógico.                                               |
| Contexto de ejecución       | Perfil, intentos usados, primer y último intento, target, dispositivo y canal.                                        |
| Clasificación               | Código, clase, fase y marca de posible aceptación.                                                                    |
| Evidencia                   | Receipts, errores estructurados y referencias de observación disponibles; nunca datos inventados.                     |
| Próxima acción              | Conciliar, corregir contrato mediante nueva versión, restaurar dispositivo, obtener autorización o cerrar sin replay. |
| Actor y razón               | Obligatorios para cualquier decisión manual.                                                                          |
| Owner y condición de salida | Tarea o componente responsable y evidencia concreta requerida.                                                        |

Reglas:

- dead-letter es un estado terminal del presupuesto automático, no eliminación;
- no se elimina el trabajo ni se libera su clave de idempotencia;
- un replay manual no reinicia el contador automático y registra `manual_replay_count` por separado;
- un replay manual seguro conserva la misma identidad del trabajo;
- si cambia payload, plantilla o versión empresarial, se crea un trabajo nuevo y el anterior permanece trazable;
- si el resultado es desconocido, el replay manual también está prohibido hasta conciliación;
- cerrar una entrada como no reproducible exige actor, razón, evidencia y estado final, sin declarar impresión fallida o exitosa por inferencia.

---

#### 10. Matriz materializada de las cincuenta salidas

Las denominaciones, propietarias e identidades de deduplicación permanecen intactas. La matriz asigna únicamente política de reintento y prioridad.

| Salida       | Nombre                                                    | Propietaria | Perfil de idempotencia heredado     | Perfil de reintento   | Prioridad       | Resultado documental                 |
| ------------ | --------------------------------------------------------- | ----------- | ----------------------------------- | --------------------- | --------------- | ------------------------------------ |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `IDP-RESOURCE-VERSION`              | `RTP-LBL-STANDARD`    | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `IDP-ORDER-VERSION-DESTINATION`     | `RTP-CMD-PREPARATION` | `P1_HIGH`       | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `IDP-ORDER-VERSION-DESTINATION`     | `RTP-CMD-PREPARATION` | `P1_HIGH`       | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `IDP-ORDER-VERSION-DESTINATION`     | `RTP-CMD-PREPARATION` | `P1_HIGH`       | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `IDP-PREPARATION-REQUEST-VERSION`   | `RTP-CMD-PREPARATION` | `P1_HIGH`       | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `IDP-FULFILLMENT-SNAPSHOT`          | `RTP-CMD-LOGISTICS`   | `P1_HIGH`       | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `IDP-REPLENISHMENT-REQUEST-VERSION` | `RTP-CMD-LOGISTICS`   | `P1_HIGH`       | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `IDP-ORDER-MODIFICATION`            | `RTP-CMD-CORRECTIVE`  | `P0_URGENT`     | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `IDP-ORDER-CANCELLATION`            | `RTP-CMD-CORRECTIVE`  | `P0_URGENT`     | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `IDP-PRODUCTION-REQUEST-VERSION`    | `RTP-CMD-LOGISTICS`   | `P1_HIGH`       | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `IDP-CUSTOMER-DOCUMENT-VERSION`     | `RTP-CLI-RECEIPT`     | `P2_STANDARD`   | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `IDP-DOCUMENT-SNAPSHOT`             | `RTP-DOC-A4`          | `P3_BACKGROUND` | `ESPECIFICADO / RETRY_SCOPE_CERRADO` |

**Control de cobertura:** 50 esperadas, 50 materializadas, 50 identificadores únicos, 0 faltantes y 0 duplicados.

##### 10.1 Reconciliación cuantitativa

| Dimensión                        | Resultado |
| -------------------------------- | --------: |
| Etiquetas                        |        16 |
| Comandas y tiquetes operativos   |         9 |
| Comprobantes para cliente y caja |         9 |
| Documentos convencionales        |        16 |
| **Total**                        |    **50** |

| Propietaria | Cantidad |
| ----------- | -------: |
| `FOGO`      |       15 |
| `NEXO`      |       14 |
| `PULSO`     |       12 |
| `NUMERA`    |        5 |
| `ORIGO`     |        4 |
| **Total**   |   **50** |

| Perfil de reintento   | Cantidad |
| --------------------- | -------: |
| `RTP-LBL-STANDARD`    |       16 |
| `RTP-CMD-PREPARATION` |        4 |
| `RTP-CMD-LOGISTICS`   |        3 |
| `RTP-CMD-CORRECTIVE`  |        2 |
| `RTP-CLI-RECEIPT`     |        9 |
| `RTP-DOC-A4`          |       16 |
| **Total**             |   **50** |

---

#### 11. Tratamiento de bloqueos heredados

| Bloqueo                                               | Tratamiento en esta tarea                                           | Propietario de resolución                                                                                                                | Condición de salida                                                                                       |
| ----------------------------------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| Zebra ZD230 almacenada para las 16 etiquetas          | `PRINT_BLOCKED`; cero intentos y cero backoff de envío.             | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`, con materialización técnica en `PRINT-ARC-018` y validación en `PRINT-ARC-020`. | Dispositivo desplegado, estado administrativo habilitado, adaptador disponible y salud elegible.          |
| Epson L5590 en mantenimiento                          | `PRINT_BLOCKED`; no intentar el destino local de Vento Producción.  | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`; comprobación física en `PRINT-ARC-020`.                                         | Reparación completada, estado administrativo actualizado y prueba física aprobada.                        |
| Sin impresora compatible de 80 mm en Vento Producción | `PRINT_BLOCKED`; no degradar a A4 ni usar otra sede por inferencia. | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`.                                                                                 | Dispositivo compatible aprobado o nueva decisión canónica de ruta y target.                               |
| Heartbeat `LATE`, `STALE` o `NEVER_OBSERVED`          | Bloqueo previo al envío; no consume intento.                        | Implementación de health/adaptador en `PRINT-ARC-018`; observabilidad en `PRINT-ARC-019`.                                                | Observación `FRESH` y estado elegible según `PRINT-ARC-009`.                                              |
| Resultado de envío ambiguo                            | `PRINT_RECONCILIATION_REQUIRED`; no reintentar.                     | `PRINT-ARC-012`.                                                                                                                         | Receipt o consulta autoritativa que determine resultado conocido.                                         |
| Presupuesto agotado                                   | `PRINT_DEAD_LETTER`; sin replay automático.                         | Operación autorizada conforme a `PRINT-ARC-015`, soporte y monitoreo de `PRINT-ARC-019`.                                                 | Causa resuelta, decisión explícita, actor, razón y evidencia; si es copia nueva, aplicar `PRINT-ARC-014`. |

---

#### 12. Responsabilidades reservadas y condición de salida

| Decisión reservada                                                 | Tarea propietaria                                       | Condición de salida                                                                 |
| ------------------------------------------------------------------ | ------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Semántica de receipts y niveles de confirmación                    | `PRINT-ARC-012`                                         | Contrato que determine qué evidencia cierra envío, aceptación, impresión o entrega. |
| Cancelación, expiración y carreras con trabajos en curso           | `PRINT-ARC-013`                                         | Estados, precedencia y efectos definidos sin liberar identidad incorrectamente.     |
| Reimpresión y copia adicional legítima                             | `PRINT-ARC-014`                                         | Contrato de razón, actor, copia y relación con el original.                         |
| Permisos para replay, conciliación y administración de dead-letter | `PRINT-ARC-015`                                         | Capacidades y alcance autorizativo definidos.                                       |
| Privacidad del payload, errores y evidencias                       | `PRINT-ARC-016`                                         | Política de minimización, acceso y retención aplicada.                              |
| Persistencia offline, reconexión y drenaje local                   | `PRINT-ARC-017`                                         | Política offline por operación y mecanismo de reanudación definido.                 |
| Mapeo de errores, adaptadores, workers y leases físicos            | `PRINT-ARC-018`                                         | Implementación seleccionada y contratos de adaptador materializados.                |
| Métricas, alertas, backlog, edad y dead-letter                     | `PRINT-ARC-019`                                         | Señales y umbrales operativos definidos e implementables.                           |
| Evidencia física de no duplicación y recuperación                  | `PRINT-ARC-020`                                         | Piloto controlado con dispositivos reales y resultados reproducibles.               |
| Autorización del paquete físico de implementación                  | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | Decisión explícita de repositorios, componentes, Supabase, hardware y despliegue.   |

---

#### 13. Criterios de aceptación

`PRINT-ARC-011` queda documentalmente satisfecha cuando:

- [x] existe un contrato versionado de reintento y cola de fallos;
- [x] trabajo, entrada de cola, lease e intento tienen identidades separadas;
- [x] cada reintento conserva la identidad completa definida en `PRINT-ARC-010`;
- [x] el contador solo aumenta cuando empieza un envío técnico;
- [x] los bloqueos previos al envío no consumen intentos;
- [x] se impide reintentar automáticamente un resultado desconocido;
- [x] se distinguen fallos seguros, recuperables, desconocidos y terminales;
- [x] existen presupuestos, delays, ventanas y leases explícitos para seis perfiles;
- [x] dead-letter no elimina trabajos ni libera idempotencia;
- [x] replay manual y reimpresión permanecen diferenciados;
- [x] se materializan las 50 salidas sin faltantes ni duplicados;
- [x] se conservan nombres, propietarias y perfiles de idempotencia;
- [x] la distribución 15/14/12/5/4 permanece intacta;
- [x] se preservan los bloqueos de dispositivo y salud heredados;
- [x] cada decisión posterior tiene tarea propietaria y condición de salida;
- [x] no se declara worker, cola persistente, envío, retry, receipt, conciliación ni prueba física implementados.

---

#### 14. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea especializa documentalmente comportamientos ya cubiertos por el registro canónico vigente: preservación de identidad durante reintentos, resultado desconocido, orden causal, dead-letter, observabilidad de backlog y separación entre acuse técnico y efecto físico. No implementa cola, worker, adaptador, persistencia, scheduler, receipt o dispositivo contra los cuales producir evidencia nueva. Por ello crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 15. Handoff cerrado hacia `PRINT-ARC-012`

`PRINT-ARC-012` recibe:

- `VENTO-PRINT-RETRY-QUEUE` `1.0.0`;
- 50 salidas con perfil de reintento y prioridad materializados;
- seis perfiles con presupuestos y delays deterministas;
- once estados de intento y seis estados de cola;
- cinco carriles lógicos;
- separación entre `ADAPTER_ACCEPTED`, `PERIPHERAL_ACCEPTED`, `RESULT_UNKNOWN` y resultado exitoso todavía no definido;
- prohibición de reintento ciego ante posible aceptación;
- obligación de resolver `PRINT_RECONCILIATION_REQUIRED` mediante evidencia autoritativa;
- dead-letter inmutable y sin replay automático;
- bloqueos heredados que no consumen intento.

`PRINT-ARC-012` deberá definir qué receipt o evidencia es suficiente para cada nivel de confirmación, cómo se consulta el resultado autoritativo y cómo se cierra o reconcilia una entrada sin inventar impresión física ni entrega.

La aprobación de `PRINT-ARC-011` no inicia, desarrolla ni aprueba `PRINT-ARC-012`.


### ✅ PRINT-ARC-012 — Definir confirmación de envío, impresión y entrega cuando sea verificable

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-011 — Definir reintentos automáticos y cola de fallos` — APROBADA
**Tarea siguiente:** `PRINT-ARC-013 — Definir cancelación y expiración` — RESERVADA
**Tipo de tarea:** documental; contrato de confirmaciones, jerarquía de receipts y evidencia, resolución autoritativa, conciliación, cierre y matriz materializada para cincuenta salidas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no crea adaptadores, workers, tablas, colas, endpoints, migraciones, configuración, despliegues ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** establecer qué puede afirmarse de forma verificable sobre un trabajo de impresión, qué evidencia sostiene cada afirmación y cuándo una entrada puede cerrarse, permanecer pendiente o pasar a conciliación sin confundir recepción técnica, impresión física y entrega.

---

#### 1. Resultado sustantivo

`PRINT-ARC-012` queda cerrada documentalmente con:

- el contrato `VENTO-PRINT-CONFIRMATION` versión `1.0.0`;
- siete niveles no equivalentes de confirmación, desde admisión hasta entrega;
- diez clases de evidencia admisible y campos mínimos de integridad;
- ocho estados globales de resolución;
- siete resultados autoritativos de conciliación;
- seis perfiles de confirmación materializados;
- una regla de cierre por nivel exigido, no por timeout ni por callback genérico;
- separación estricta entre impresión física y entrega;
- cincuenta salidas con decisión explícita de confirmación y cierre;
- dieciséis etiquetas, nueve comandas o tiquetes operativos, nueve comprobantes para cliente o caja y dieciséis documentos convencionales;
- distribución propietaria intacta: FOGO 15, NEXO 14, PULSO 12, NUMERA 5 y ORIGO 4;
- cero implementación y cero evidencia operativa o física declarada.

---

#### 2. Alcance y frontera

Esta tarea define:

- el vocabulario canónico para confirmar admisión, cola, envío, aceptación técnica, impresión física y entrega;
- los receipts y evidencias que pueden respaldar cada nivel;
- el resultado mínimo exigido por perfil de salida;
- la consulta autoritativa por identidad de trabajo e intento;
- el tratamiento de evidencia ausente, contradictoria o tardía;
- la interacción con reintentos, resultado desconocido y dead-letter;
- el cierre lógico de una entrada sin borrar su historia;
- la decisión materializada para cada salida `IMP-*`.

Esta tarea no define:

- cancelación o expiración, reservadas para `PRINT-ARC-013`;
- reimpresión, reservada para `PRINT-ARC-014`;
- permisos, privacidad, contingencia, adaptadores, monitoreo o piloto;
- instalación o reparación de dispositivos;
- tecnología concreta de persistencia;
- una garantía física que el hardware actual no pueda demostrar;
- aplicación de una etiqueta sobre un recurso, consumo humano de una comanda o validez empresarial del documento impreso.

La confirmación del servicio de impresión describe exclusivamente el trabajo físico y su entrega cuando existe evidencia. No modifica el estado empresarial gobernado por FOGO, NEXO, PULSO, NUMERA u ORIGO.

---

#### 3. Diagnóstico técnico actual

La superficie vigente de NEXO construye ZPL y usa `device.send`. El callback exitoso muestra “Impresión enviada”. Ese callback constituye, como máximo, una señal técnica del adaptador; no demuestra aceptación del periférico, salida de papel, contenido correcto ni entrega.

| Hecho observado                           | Alcance demostrable                                           | Afirmación prohibida                | Estado                                  |
| ----------------------------------------- | ------------------------------------------------------------- | ----------------------------------- | --------------------------------------- |
| Trabajo admitido por idempotencia         | Existe una intención única y un `job_id`.                     | “Enviado”, “impreso” o “entregado”. | `ESPECIFICADO`                          |
| Entrada persistida en cola                | El servicio conserva trabajo pendiente.                       | “Enviado al dispositivo”.           | `ESPECIFICADO`                          |
| Callback exitoso de `device.send`         | El adaptador reportó aceptación o finalización de su llamada. | “Impresión física confirmada”.      | `NO_IMPLEMENTADO_COMO_RECEIPT_CANONICO` |
| Heartbeat `READY`                         | El dispositivo estaba elegible antes del despacho.            | “El trabajo se imprimió”.           | `ESPECIFICADO`                          |
| Estado online del navegador, agente o red | Existe conectividad parcial.                                  | “El periférico recibió el trabajo”. | `NO_ES_EVIDENCIA_DE_RESULTADO`          |
| Observación física no correlacionada      | Se vio una hoja o tiquete, sin identidad demostrada.          | Cerrar un `job_id` concreto.        | `EVIDENCIA_INSUFICIENTE`                |

El comportamiento actual no se presenta como conforme. La implementación posterior deberá emitir receipts tipados y conservar evidencia correlacionada.

---

#### 4. Frontera e invariantes

```text
VENTO-PRINT-JOB
→ VENTO-PRINT-IDEMPOTENCY
→ VENTO-PRINT-RETRY-QUEUE
→ INTENTO TECNICO
→ RECEIPTS TIPADOS
→ VENTO-PRINT-CONFIRMATION
→ CIERRE, ESPERA O CONCILIACION
```

Reglas obligatorias:

1. Admisión, cola, envío, aceptación del adaptador, aceptación del periférico, impresión y entrega son hechos distintos.
2. Un nivel inferior nunca implica automáticamente un nivel superior.
3. `ADAPTER_ACCEPTED` no equivale a `PERIPHERAL_ACCEPTED`.
4. `PERIPHERAL_ACCEPTED` no equivale a `PRINTED_VERIFIED`.
5. `PRINTED_VERIFIED` no equivale a `DELIVERED_VERIFIED`.
6. Heartbeat, conectividad, ausencia de error y tiempo transcurrido no son evidencia de impresión.
7. Un timeout no convierte una operación en fallida ni exitosa; si pudo existir efecto, produce `RESULT_UNKNOWN`.
8. Toda evidencia se vincula a `job_id`, `attempt_id`, `copy_slot_id`, dispositivo, canal, payload o render y tiempo verificable.
9. Un receipt sin identidad completa no cierra el trabajo y se conserva solo como diagnóstico.
10. La evidencia tardía puede resolver un resultado desconocido, pero no borra intentos, fallos ni decisiones previas.
11. Evidencias contradictorias producen `EVIDENCE_CONFLICT`; nunca se aplica “último valor gana”.
12. El nivel exigido se resuelve por perfil y ruta antes del cierre.
13. Una salida centralizada que requiere distribución no queda completa al imprimir en administración.
14. Una salida local sin handoff explícito no inventa entrega; la entrega se marca `NOT_APPLICABLE`.
15. Imprimir una etiqueta no demuestra que fue aplicada al recurso correcto.
16. Imprimir una comanda no demuestra que el trabajador la leyó o ejecutó.
17. Entregar una representación física no cambia por sí sola pago, factura, inventario, producción, custodia o cualquier otro hecho empresarial.
18. La misma copia lógica conserva su identidad durante consulta, conciliación y retry.
19. Una evidencia física de una copia no puede cerrar otra copia, otro slot, otro destino ni otro trabajo del lote.
20. Un batch no admite cierre agregado sin evidencia individual por trabajo.
21. Los bloqueos previos al despacho no generan confirmación de envío ni consumen intento.
22. Una vez confirmada la impresión, una entrega pendiente no autoriza reenvío automático a la impresora.
23. Dead-letter conserva historia inmutable; una resolución posterior se enlaza, no la sobrescribe.
24. La implementación física permanece condicionada por `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`.

---

#### 5. Contrato `VENTO-PRINT-CONFIRMATION` `1.0.0`

##### 5.1 Estructura normativa

```json
{
  "confirmation_contract_id": "VENTO-PRINT-CONFIRMATION",
  "confirmation_contract_version": "1.0.0",
  "confirmation_record_id": "<uuid>",
  "job_identity": {
    "job_id": "<uuid>",
    "intent_id": "<string>",
    "output_id": "<IMP-*>",
    "copy_slot_id": "<string>",
    "idempotency_key": "<sha256>",
    "semantic_fingerprint": "<sha256>",
    "payload_hash": "<sha256>"
  },
  "resolved_profile": {
    "confirmation_profile_id": "<CFM-*>",
    "required_terminal_level": "<PRINTED_VERIFIED|DELIVERED_VERIFIED|NONE>",
    "delivery_requirement": "<REQUIRED|NOT_APPLICABLE>",
    "route_profile_id": "<RTE-*>",
    "target_policy_id": "<TGT-*|null>"
  },
  "latest_attempt": {
    "attempt_id": "<uuid|null>",
    "attempt_number": 0,
    "device_ref": "<PRN-*|null>",
    "channel_id": "<CH-*|null>"
  },
  "levels": {
    "admission": {"state": "<CONFIRMED|NOT_OBSERVED|CONFLICT>", "evidence_ref": "<string|null>"},
    "queue": {"state": "<CONFIRMED|NOT_OBSERVED|CONFLICT>", "evidence_ref": "<string|null>"},
    "send": {"state": "<CONFIRMED|REJECTED|NOT_OBSERVED|RESULT_UNKNOWN|CONFLICT>", "evidence_ref": "<string|null>"},
    "adapter": {"state": "<CONFIRMED|REJECTED|NOT_OBSERVED|RESULT_UNKNOWN|CONFLICT>", "evidence_ref": "<string|null>"},
    "peripheral": {"state": "<CONFIRMED|REJECTED|NOT_OBSERVED|RESULT_UNKNOWN|CONFLICT>", "evidence_ref": "<string|null>"},
    "print": {"state": "<CONFIRMED|CONFIRMED_NOT_OCCURRED|NOT_OBSERVED|RESULT_UNKNOWN|CONFLICT>", "evidence_ref": "<string|null>"},
    "delivery": {"state": "<CONFIRMED|CONFIRMED_NOT_OCCURRED|NOT_APPLICABLE|NOT_OBSERVED|RESULT_UNKNOWN|CONFLICT>", "evidence_ref": "<string|null>"}
  },
  "resolution": {
    "state": "<OPEN_NO_ATTEMPT|OPEN_IN_PROGRESS|OPEN_RESULT_UNKNOWN|OPEN_AWAITING_DELIVERY|BLOCKED_PRE_DISPATCH|CONFLICT_REQUIRES_REVIEW|CLOSED_REQUIRED_LEVEL_CONFIRMED|CLOSED_TERMINAL_FAILURE>",
    "highest_confirmed_level": "<NONE|JOB_ADMITTED|QUEUE_PERSISTED|SEND_STARTED|ADAPTER_ACCEPTED|PERIPHERAL_ACCEPTED|PRINTED_VERIFIED|DELIVERED_VERIFIED>",
    "reason_code": "<PRINT_CONFIRMATION_*>",
    "resolved_at": "<RFC3339|null>",
    "resolution_evidence_refs": ["<string>"]
  },
  "trace": {
    "correlation_id": "<string>",
    "causation_id": "<string|null>",
    "batch_id": "<string|null>"
  }
}
```

La estructura es normativa y no prescribe tablas, endpoints, proveedor de colas ni mecanismo criptográfico concreto.

##### 5.2 Receipt o evidencia mínima

Todo receipt que participe en una decisión deberá contener:

- `evidence_id` único;
- `evidence_type` tipado;
- `job_id`;
- `attempt_id` cuando existe intento;
- `copy_slot_id`;
- `output_id`;
- `payload_hash` o `render_hash` correlacionable;
- `device_ref` y `channel_id` cuando participa un periférico;
- `source_system`, `source_instance` y versión;
- `observed_at` con tiempo verificable;
- resultado explícito y código de razón;
- referencia de secuencia, contador o evento cuando la fuente lo proporcione;
- actor, estación y destino cuando la evidencia sea humana o de handoff;
- mecanismo de integridad o huella de la evidencia;
- clasificación de autoridad.

La ausencia de estos campos no elimina el evento, pero impide usarlo como prueba autoritativa de un trabajo específico.

---

#### 6. Niveles de confirmación y evidencia admisible

| Nivel | Estado canónico       | Qué demuestra                                                        | Evidencia mínima admisible                                                                                | Qué no demuestra                                               |
| ----: | --------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
|     1 | `JOB_ADMITTED`        | La intención y copia fueron admitidas de forma idempotente.          | `SERVER_ADMISSION_RECORD`.                                                                                | Cola, envío, impresión o entrega.                              |
|     2 | `QUEUE_PERSISTED`     | La entrada quedó persistida y consultable.                           | `QUEUE_PERSISTENCE_RECORD`.                                                                               | Despacho al adaptador.                                         |
|     3 | `SEND_STARTED`        | Se inició un intento técnico identificable.                          | `ATTEMPT_DISPATCH_RECORD`.                                                                                | Aceptación del adaptador o periférico.                         |
|     4 | `ADAPTER_ACCEPTED`    | El adaptador aceptó el comando o finalizó su llamada según contrato. | `ADAPTER_ACCEPTANCE_RECEIPT`.                                                                             | Recepción del periférico o salida física.                      |
|     5 | `PERIPHERAL_ACCEPTED` | Spooler o dispositivo aceptó un trabajo correlacionado.              | `SPOOLER_OR_DEVICE_ACCEPTANCE_RECEIPT`.                                                                   | Impresión correcta o entrega.                                  |
|     6 | `PRINTED_VERIFIED`    | Existe evidencia correlacionada de efecto físico de impresión.       | `DEVICE_COMPLETION_RECEIPT`, `CORRELATED_DEVICE_COUNTER_DELTA` o `CONTROLLED_PHYSICAL_PRINT_ATTESTATION`. | Entrega, lectura, aplicación o ejecución empresarial.          |
|     7 | `DELIVERED_VERIFIED`  | La copia física fue entregada al destino o receptor definido.        | `DESTINATION_SCAN`, `HANDOFF_ACKNOWLEDGEMENT` o `CONTROLLED_DELIVERY_ATTESTATION`.                        | Aceptación empresarial, pago, firma sustantiva o uso correcto. |

##### 6.1 Diez clases de evidencia

| Evidencia                                                     | Autoridad máxima      | Restricción                                                                   |
| ------------------------------------------------------------- | --------------------- | ----------------------------------------------------------------------------- |
| `SERVER_ADMISSION_RECORD`                                     | `JOB_ADMITTED`        | Debe provenir del servicio autoritativo de idempotencia.                      |
| `QUEUE_PERSISTENCE_RECORD`                                    | `QUEUE_PERSISTED`     | Debe ser consultable fuera de la memoria del proceso.                         |
| `ATTEMPT_DISPATCH_RECORD`                                     | `SEND_STARTED`        | Debe existir antes o al iniciar el envío y asignar `attempt_id`.              |
| `ADAPTER_ACCEPTANCE_RECEIPT`                                  | `ADAPTER_ACCEPTED`    | Su semántica debe declarar si significa recepción, escritura o callback.      |
| `SPOOLER_OR_DEVICE_ACCEPTANCE_RECEIPT`                        | `PERIPHERAL_ACCEPTED` | Debe identificar trabajo o secuencia del dispositivo.                         |
| `DEVICE_COMPLETION_RECEIPT`                                   | `PRINTED_VERIFIED`    | Solo cuando el proveedor documenta finalización física y se valida en piloto. |
| `CORRELATED_DEVICE_COUNTER_DELTA`                             | `PRINTED_VERIFIED`    | Requiere ventana exclusiva o correlación que descarte otros trabajos.         |
| `CONTROLLED_PHYSICAL_PRINT_ATTESTATION`                       | `PRINTED_VERIFIED`    | Requiere actor, estación, hora, identidad visible y política de evidencia.    |
| `DESTINATION_SCAN`                                            | `DELIVERED_VERIFIED`  | El código debe vincular copia, destino y receptor o estación.                 |
| `HANDOFF_ACKNOWLEDGEMENT` o `CONTROLLED_DELIVERY_ATTESTATION` | `DELIVERED_VERIFIED`  | Requiere actor, destino, hora y referencia de copia; no puede ser prefirmado. |

Las clases anteriores son formatos admisibles. Esta tarea no afirma que los dispositivos actuales soporten alguna clase concreta hasta que se implemente y valide.

---

#### 7. Perfiles de confirmación

| Perfil                        | Aplicación                                             | Nivel terminal exigido | Entrega          | Regla de cierre                                                                                |
| ----------------------------- | ------------------------------------------------------ | ---------------------- | ---------------- | ---------------------------------------------------------------------------------------------- |
| `CFM-LABEL-PHYSICAL`          | Etiquetas especializadas.                              | `PRINTED_VERIFIED`     | `NOT_APPLICABLE` | Cerrar solo con evidencia física correlacionada; aplicar la etiqueta queda fuera del servicio. |
| `CFM-TICKET-POINT`            | Comandas, tiquetes operativos y control local.         | `PRINTED_VERIFIED`     | `NOT_APPLICABLE` | Cerrar al verificar salida física en el punto; lectura o ejecución no se infiere.              |
| `CFM-TICKET-HANDOFF`          | Comprobantes físicos entregados a cliente o receptor.  | `DELIVERED_VERIFIED`   | `REQUIRED`       | Después de imprimir, mantener `OPEN_AWAITING_DELIVERY` hasta handoff verificable.              |
| `CFM-A4-LOCAL`                | Documento A4 consumido en el mismo punto de impresión. | `PRINTED_VERIFIED`     | `NOT_APPLICABLE` | Cerrar al verificar impresión física local.                                                    |
| `CFM-A4-CENTRAL-DISTRIBUTION` | Documento A4 impreso centralmente y distribuido.       | `DELIVERED_VERIFIED`   | `REQUIRED`       | La impresión central no cierra; exige entrega al destino autorizado.                           |
| `CFM-BLOCKED-NO-DISPATCH`     | Ruta sin capacidad, equipo almacenado o mantenimiento. | `NONE`                 | `NOT_APPLICABLE` | Mantener `BLOCKED_PRE_DISPATCH`; no crear receipt de envío ni intento.                         |

La ruta y la política objetivo se resuelven antes del perfil final. Una salida que admite varias rutas utiliza exactamente un perfil por `job_id`.

---

#### 8. Estados globales y reglas de transición

| Estado                            | Significado                                                     | Salida permitida                                                   |
| --------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------ |
| `OPEN_NO_ATTEMPT`                 | Trabajo admitido o en cola, sin despacho.                       | Intento, bloqueo o fallo terminal.                                 |
| `OPEN_IN_PROGRESS`                | Existe intento y evidencia parcial no contradictoria.           | Nivel superior, fallo seguro o resultado desconocido.              |
| `OPEN_RESULT_UNKNOWN`             | El comando pudo generar efecto y falta resultado autoritativo.  | Solo conciliación; no retry ciego.                                 |
| `OPEN_AWAITING_DELIVERY`          | Impresión verificada; el perfil exige handoff.                  | Entrega confirmada, no entrega confirmada o conciliación.          |
| `BLOCKED_PRE_DISPATCH`            | Una precondición impide intentar.                               | Revaluación de salud, ruta o capacidad; no consume intento.        |
| `CONFLICT_REQUIRES_REVIEW`        | Dos evidencias autoritativas son incompatibles.                 | Resolución explícita con evidencia superior o investigación.       |
| `CLOSED_REQUIRED_LEVEL_CONFIRMED` | El nivel terminal exigido por perfil está confirmado.           | Solo auditoría; una copia adicional requiere reimpresión separada. |
| `CLOSED_TERMINAL_FAILURE`         | Se confirmó imposibilidad terminal sin efecto físico pendiente. | Revisión o nueva intención empresarial; no mutar trabajo cerrado.  |

Reglas:

1. Las transiciones son monotónicas respecto a hechos confirmados; una evidencia posterior puede resolver incertidumbre, no borrar historia.
2. `PRINTED_VERIFIED` con perfil de handoff produce `OPEN_AWAITING_DELIVERY`, no cierre.
3. Una no entrega confirmada no habilita reimpresión automática si la impresión ya fue verificada.
4. `CLOSED_REQUIRED_LEVEL_CONFIRMED` exige evidencia individual del `copy_slot_id`.
5. Un receipt de lote solo acelera consulta; cada trabajo conserva resolución propia.
6. Cancelación y expiración no se definen aquí y quedan como puntos de integración para la tarea siguiente.

---

#### 9. Consulta autoritativa y conciliación

##### 9.1 Orden de consulta

La resolución se ejecuta por `job_id` o `idempotency_key` y consulta, en orden:

1. admisión y huella de copia;
2. entrada de cola y estado vigente;
3. intentos append-only;
4. receipts del adaptador;
5. receipts del spooler o periférico;
6. evidencia de efecto físico;
7. evidencia de handoff cuando el perfil la exige;
8. eventos de cancelación o expiración únicamente cuando `PRINT-ARC-013` los defina.

`localStorage`, texto de interfaz, estado online y memoria del worker no son fuentes autoritativas.

##### 9.2 Reglas de correlación

Una evidencia solo participa si coincide con:

- `job_id` y `copy_slot_id`;
- `attempt_id` para eventos de intento;
- `payload_hash` o `render_hash` compatible;
- dispositivo y canal resueltos;
- destino lógico autorizado;
- secuencia temporal posible;
- fuente y versión conocidas.

Una evidencia de otra copia, un receipt sin identidad o una observación fuera de ventana se conserva como diagnóstico y no eleva el nivel.

##### 9.3 Resultados de conciliación

| Resultado                        | Interpretación                                              | Efecto                                                             |
| -------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------ |
| `CONFIRMED_NOT_SENT`             | El intento no transmitió el comando.                        | Puede aplicar retry seguro dentro del presupuesto.                 |
| `CONFIRMED_SENT_NOT_ACCEPTED`    | Hubo envío, pero adaptador o periférico rechazó sin efecto. | Puede aplicar retry seguro según clasificación.                    |
| `CONFIRMED_ACCEPTED_NOT_PRINTED` | El periférico aceptó y existe prueba de que no imprimió.    | Retry solo si la política lo permite y no existe efecto parcial.   |
| `CONFIRMED_PRINTED`              | La copia física se imprimió y está correlacionada.          | Cierra perfiles de impresión; perfiles de handoff esperan entrega. |
| `CONFIRMED_DELIVERED`            | La copia fue entregada al destino definido.                 | Cierra perfiles con entrega obligatoria.                           |
| `UNRESOLVED`                     | La evidencia disponible no determina el resultado.          | Permanece en conciliación; retry prohibido.                        |
| `EVIDENCE_CONFLICT`              | Evidencias autoritativas se contradicen.                    | Revisión explícita; no cierre ni retry automático.                 |

Cada conciliación registra actor o sistema, evidencias evaluadas, regla aplicada, resultado, tiempo y razón. Ningún resultado se decide solo por antigüedad.

---

#### 10. Cierre de cola, intento y entrega

1. Un intento técnico alcanza `SUCCEEDED` únicamente cuando el perfil confirma el nivel físico requerido para el intento de impresión.
2. Una entrada se considera cerrada por éxito solo con `CLOSED_REQUIRED_LEVEL_CONFIRMED`.
3. Para `CFM-TICKET-HANDOFF` y `CFM-A4-CENTRAL-DISTRIBUTION`, la impresión verificada cierra el intento de impresora, pero no el trabajo de confirmación.
4. En `OPEN_AWAITING_DELIVERY` queda prohibido reenviar a la impresora automáticamente.
5. Un fallo de entrega se atiende sobre el handoff de la copia ya impresa; no crea otra copia.
6. `RESULT_UNKNOWN` conserva la entrada en `PRINT_RECONCILIATION_REQUIRED` hasta resolución autoritativa.
7. Una entrada dead-letter no se elimina ni cambia de historia al recibir evidencia tardía; se enlaza una resolución posterior.
8. Un bloqueo previo al despacho permanece sin intento y sin receipt de envío.
9. La ausencia de evidencia de nivel terminal después de un deadline no produce éxito ni fallo por inferencia.
10. El servicio conserva el nivel más alto confirmado, la evidencia y cualquier nivel pendiente.

---

#### 11. Matriz materializada de las cincuenta salidas

Las denominaciones, propietarias, identidades, plantillas, perfiles físicos y rutas aprobadas permanecen intactas. La matriz materializa exclusivamente el perfil de confirmación y el nivel de cierre.

| Salida       | Nombre                                                    | Propietaria | Perfil aplicable                                                         | Nivel terminal       | Entrega                        | Resultado / bloqueo                                    |
| ------------ | --------------------------------------------------------- | ----------- | ------------------------------------------------------------------------ | -------------------- | ------------------------------ | ------------------------------------------------------ |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `CFM-LABEL-PHYSICAL`; `CFM-BLOCKED-NO-DISPATCH`                          | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `CFM-TICKET-POINT`                                                       | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `CFM-TICKET-POINT`                                                       | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `CFM-TICKET-POINT`                                                       | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `CFM-TICKET-POINT`; `CFM-BLOCKED-NO-DISPATCH`                            | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / SEGUN_RUTA; VP_BLOQUEADO_SIN_80MM`     |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `CFM-TICKET-POINT`                                                       | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `CFM-TICKET-POINT`; `CFM-BLOCKED-NO-DISPATCH`                            | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / SEGUN_RUTA; VP_BLOQUEADO_SIN_80MM`     |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `CFM-TICKET-POINT`                                                       | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `CFM-TICKET-POINT`                                                       | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `CFM-TICKET-POINT`; `CFM-BLOCKED-NO-DISPATCH`                            | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_VP_SIN_80MM`     |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `CFM-TICKET-HANDOFF`                                                     | `DELIVERED_VERIFIED` | `REQUIRED_WHEN_HANDOFF_OCCURS` | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `CFM-TICKET-POINT`                                                       | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / CONTROL_LOCAL_DE_CAJA`                 |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH`                 | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH`                 | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH`                 | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `CFM-A4-LOCAL`; `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH` | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `CFM-A4-CENTRAL-DISTRIBUTION`; `CFM-BLOCKED-NO-DISPATCH`                 | `ROUTE_DEPENDENT`    | `ROUTE_DEPENDENT`              | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `CFM-A4-LOCAL`                                                           | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ADMIN_LOCAL_CONFIRMABLE`               |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `CFM-A4-LOCAL`                                                           | `PRINTED_VERIFIED`   | `NOT_APPLICABLE`               | `ESPECIFICADO / ADMIN_LOCAL_CONFIRMABLE`               |


**Control de cobertura:** 50 esperadas, 50 materializadas, 50 identificadores únicos, 0 faltantes y 0 duplicados.

##### 11.1 Reconciliación cuantitativa

| Grupo                           | Esperadas | Materializadas | Faltantes | Duplicadas |
| ------------------------------- | --------: | -------------: | --------: | ---------: |
| Etiquetas `IMP-LBL-*`           |        16 |             16 |         0 |          0 |
| Comandas y tiquetes `IMP-CMD-*` |         9 |              9 |         0 |          0 |
| Comprobantes `IMP-CLI-*`        |         9 |              9 |         0 |          0 |
| Documentos `IMP-DOC-*`          |        16 |             16 |         0 |          0 |
| **Total**                       |    **50** |         **50** |     **0** |      **0** |

| Propietaria | Cantidad heredada | Cantidad materializada | Diferencia |
| ----------- | ----------------: | ---------------------: | ---------: |
| FOGO        |                15 |                     15 |          0 |
| NEXO        |                14 |                     14 |          0 |
| PULSO       |                12 |                     12 |          0 |
| NUMERA      |                 5 |                      5 |          0 |
| ORIGO       |                 4 |                      4 |          0 |
| **Total**   |            **50** |                 **50** |      **0** |

---

#### 12. Bloqueos y carryovers con propietario

| ID                  | Bloqueo o brecha                                                                                                              | Propietario documental o de implementación                                                                     | Condición de salida                                                                                                       |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `BLK-PRINT-012-001` | El callback actual de BrowserPrint no está tipado como receipt canónico y solo muestra “Impresión enviada”.                   | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y el paquete propietario que implemente el adaptador.  | Emitir `ADAPTER_ACCEPTANCE_RECEIPT` con semántica documentada, identidad completa y pruebas de pérdida de callback.       |
| `BLK-PRINT-012-002` | No se ha verificado qué dispositivos o spoolers pueden probar finalización física.                                            | `PRINT-ARC-018` y `PRINT-ARC-020`.                                                                             | Matriz por dispositivo y canal, receipts observados y prueba física controlada que determine el nivel máximo demostrable. |
| `BLK-PRINT-012-003` | La Zebra ZD230 está almacenada y sin canal activo; las dieciséis etiquetas no pueden producir evidencia de envío o impresión. | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y el paquete de habilitación física correspondiente.   | Dispositivo desplegado, canal configurado, heartbeat válido y prueba correlacionada de impresión.                         |
| `BLK-PRINT-012-004` | La Epson L5590 de Vento Producción requiere mantenimiento.                                                                    | Paquete de mantenimiento e implementación definido en `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`. | Mantenimiento cerrado, salud verificada y prueba A4 correlacionada antes de habilitar `CFM-A4-LOCAL`.                     |
| `BLK-PRINT-012-005` | Vento Producción no tiene impresora 80 mm compatible activa.                                                                  | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete de incorporación de activo.                  | Dispositivo compatible incorporado, ruta y política actualizadas, heartbeat válido y prueba de impresión controlada.      |
| `BLK-PRINT-012-006` | La evidencia humana de impresión o handoff aún no tiene superficie, identidad ni controles de autorización definidos.         | `EVID-ARC-001` a `EVID-ARC-010`, `PRINT-ARC-015`, `PRINT-ARC-016` y el paquete de implementación aplicable.    | Contrato de evidencia, actor autorizado, minimización, integridad, retención y prueba de correlación aprobados.           |

Ningún bloqueo se interpreta como pendiente sin dueño. Ninguno autoriza iniciar las tareas responsables desde esta tarea.

---

#### 13. Criterios de aceptación

`PRINT-ARC-012` queda documentalmente satisfecha cuando:

- [x] existe un contrato consumible de confirmación;
- [x] admisión, cola, envío, adaptador, periférico, impresión y entrega están separados;
- [x] cada nivel declara evidencia admisible y límites de interpretación;
- [x] el callback actual no se presenta como impresión física;
- [x] se define el nivel terminal por perfil;
- [x] se define `OPEN_AWAITING_DELIVERY` sin reimpresión automática;
- [x] `RESULT_UNKNOWN` exige conciliación y bloquea retry ciego;
- [x] la consulta autoritativa y la correlación están especificadas;
- [x] existen siete resultados de conciliación;
- [x] el cierre conserva historia e identidad de copia;
- [x] las cincuenta salidas tienen decisión explícita;
- [x] los totales y propietarias heredados concilian sin diferencias;
- [x] los bloqueos vigentes tienen propietario y condición de salida;
- [x] no se define cancelación, expiración o reimpresión por anticipado;
- [x] no se declara implementación ni evidencia física ejecutada.

---

#### 14. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: el registro canónico vigente ya protege la separación entre acuse técnico, aceptación del periférico, efecto físico, resultado desconocido, idempotencia y conciliación. Esta tarea especializa esas reglas para el servicio de impresión sin crear comportamiento de prueba adicional, cambiar responsables ni declarar evidencia implementada. Por tanto, crea 0, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0 requisitos.

---

#### 15. Handoff cerrado hacia `PRINT-ARC-013`

`PRINT-ARC-013` recibe:

- `VENTO-PRINT-CONFIRMATION` `1.0.0`;
- siete niveles de confirmación;
- seis perfiles de cierre;
- ocho estados globales;
- siete resultados de conciliación;
- la regla de no inferir éxito o fallo por timeout;
- estados abiertos que podrán recibir cancelación o expiración sin borrar receipts;
- cincuenta salidas con nivel terminal materializado.

`PRINT-ARC-013` deberá definir cuándo una intención todavía puede cancelarse, cómo se registra una solicitud tardía, qué expira sin negar un efecto físico posible y cómo interactúa con `RESULT_UNKNOWN`, impresión confirmada y entrega pendiente.

La aprobación de `PRINT-ARC-012` no inicia, desarrolla ni aprueba `PRINT-ARC-013`.


### ✅ PRINT-ARC-013 — Definir cancelación y expiración

**Estado:** APROBADA
**Tarea anterior:** `PRINT-ARC-012 — Definir confirmación de envío, impresión y entrega cuando sea verificable` — APROBADA
**Tarea siguiente:** `PRINT-ARC-014 — Definir reimpresión como acción separada y auditable` — RESERVADA
**Tipo de tarea:** documental; contrato de cancelación y expiración, decisiones por estado observado, carreras de despacho, efectos tardíos, disposición física y matriz materializada para cincuenta salidas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no crea endpoints, workers, temporizadores, tablas, migraciones, adaptadores, configuración, despliegues ni cambios en Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** fijar cuándo un trabajo de impresión todavía puede detenerse, qué significa que una solicitud llegue tarde, cómo vence el derecho a despachar o entregar una copia y cómo se conservan y concilian los efectos físicos posibles o confirmados.

---

#### 1. Resultado sustantivo

`PRINT-ARC-013` queda cerrada documentalmente con:

- el contrato `VENTO-PRINT-CANCELLATION-EXPIRATION` versión `1.0.0`;
- siete estados de solicitud de cancelación;
- cinco estados de expiración;
- siete resoluciones integradas del trabajo;
- ocho decisiones canónicas de cancelación;
- tres referencias temporales separadas;
- seis perfiles de cancelación y expiración;
- una regla atómica para resolver la carrera entre cancelación y despacho;
- tratamiento explícito de `RESULT_UNKNOWN`, impresión confirmada, entrega pendiente y efectos tardíos;
- cincuenta salidas con perfil y decisión materializados;
- dieciséis etiquetas, nueve comandas o tiquetes operativos, nueve comprobantes para cliente o caja y dieciséis documentos convencionales;
- distribución propietaria intacta: FOGO 15, NEXO 14, PULSO 12, NUMERA 5 y ORIGO 4;
- cero implementación y cero cancelaciones o expiraciones operativas declaradas.

---

#### 2. Alcance y frontera

Esta tarea define:

- la diferencia entre cancelación explícita y expiración temporal;
- el alcance `DISPATCH_ONLY`, `DELIVERY_ONLY` o `DISPATCH_AND_DELIVERY`;
- el momento hasta el cual puede detenerse el envío sin negar hechos ocurridos;
- la resolución según el nivel de confirmación observado;
- la interacción con cola, lease, intento, retry, dead-letter y conciliación;
- la expiración del despacho y la expiración del handoff como hechos distintos;
- el tratamiento de una copia ya impresa pero todavía no entregada;
- el tratamiento de receipts o efectos tardíos después de cancelar o expirar;
- la decisión materializada para cada salida `IMP-*`.

Esta tarea no define:

- la cancelación empresarial del pedido, comanda, factura, remisión, pago, lote o recurso que originó la salida;
- una reversión de efectos empresariales;
- una copia adicional o reimpresión, reservada para `PRINT-ARC-014`;
- el catálogo detallado de permisos, reservado para `PRINT-ARC-015`;
- privacidad, contingencia, adaptadores, monitoreo o piloto;
- tiempos numéricos inventados cuando la aplicación propietaria todavía no los ha suministrado;
- eliminación física automática de una copia impresa;
- implementación de timers, abortos, locks, persistencia o conciliadores.

Cancelar un `VENTO-PRINT-JOB` detiene únicamente acciones futuras del servicio de impresión dentro del alcance confirmado. No cambia por sí sola la versión ni el estado del documento empresarial propietario.

---

#### 3. Diagnóstico técnico actual

La superficie vigente de NEXO mantiene texto en `localStorage` bajo `vento-nexo:printing:queue:v1` y llama directamente `device.send`. Limpiar el texto local, cerrar la pestaña o recibir un error de interfaz no constituye cancelación canónica.

| Hecho observado                                      | Alcance real                                          | Brecha frente al contrato                                                                  | Clasificación                          |
| ---------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------------- |
| Eliminación de una línea o vaciado de `localStorage` | Modifica únicamente el estado local del navegador.    | No identifica `job_id`, actor, razón, versión, alcance ni resultado físico.                | `NO_ES_CANCELACION_CANONICA`           |
| Cierre o recarga de la pestaña                       | Interrumpe la interfaz local.                         | No demuestra que el adaptador o periférico haya detenido un comando.                       | `RESULTADO_NO_DETERMINADO`             |
| Llamada directa `device.send`                        | Inicia una operación técnica local.                   | No existe gate autoritativo de cancelación o expiración inmediatamente antes del despacho. | `NO_IMPLEMENTADO`                      |
| Callback “Impresión enviada.”                        | Informa un resultado del adaptador según su callback. | No prueba que una cancelación tardía haya evitado el efecto físico.                        | `EVIDENCIA_INSUFICIENTE_PARA_CANCELAR` |
| Cola local sin deadline                              | Conserva texto hasta que el navegador lo retire.      | No existen `dispatch_deadline_at`, `delivery_deadline_at` ni evento de expiración.         | `NO_IMPLEMENTADO`                      |

El comportamiento actual no se presenta como conforme. Esta tarea define el objetivo documental y no modifica el código.

---

#### 4. Invariantes

1. Cancelación y expiración son hechos distintos y se registran por separado.
2. Una cancelación es una solicitud explícita, atribuible y autorizada para detener acciones futuras.
3. Una expiración es una decisión determinista basada en una referencia temporal o invalidez autoritativa ya declarada.
4. Ninguna de las dos borra `job_id`, `intent_id`, `copy_slot_id`, idempotency key, intentos, receipts, errores, evidencia ni auditoría.
5. Cancelar un trabajo no libera su identidad para crear otra copia equivalente.
6. La expiración del presupuesto de retry no demuestra que el trabajo no se imprimió.
7. Un timeout, cierre de interfaz, pérdida de callback o lease vencido después de `DISPATCHING` produce conciliación, no cancelación exitosa.
8. Antes de `SEND_STARTED`, una cancelación o expiración autoritativa puede cerrar el trabajo sin crear intento.
9. Después de `SEND_STARTED`, solo la evidencia `CONFIRMED_NOT_SENT` o `CONFIRMED_SENT_NOT_ACCEPTED` permite afirmar que el efecto fue evitado.
10. `OPEN_RESULT_UNKNOWN` bloquea retry, reemplazo y cierre por cancelación hasta obtener resultado autoritativo.
11. `PRINTED_VERIFIED` hace imposible cancelar la impresión ya ocurrida.
12. `DELIVERED_VERIFIED` hace imposible cancelar la impresión y la entrega ya ocurridas.
13. Cuando existe impresión verificada y entrega pendiente, solo puede detenerse el handoff; la copia física exige disposición controlada.
14. Una solicitud tardía se conserva aunque sea rechazada; no se descarta ni reescribe el resultado original.
15. Un receipt tardío puede demostrar un efecto posterior a cancelación o expiración y deberá producir conciliación de efecto tardío.
16. El batch no se cancela de forma agregada: cada `job_id` y `copy_slot_id` recibe decisión individual.
17. Un worker revalida cancelación y expiración después de adquirir lease e inmediatamente antes de `DISPATCHING`.
18. Todo retry vuelve a evaluar cancelación, expiración, validez empresarial, ruta, salud y presupuesto.
19. La precedencia se determina por eventos autoritativos y secuencia persistida, no por la hora del cliente.
20. Una cancelación de entrega no autoriza imprimir otra copia.
21. La corrección de una comanda o documento ya impreso exige una nueva versión empresarial y una salida distinta, no mutar el trabajo anterior.
22. `IMP-CMD-08 — Cancelación o anulación de comanda` es una salida empresarial propia; no equivale a cancelar el trabajo técnico que la imprime.
23. Una entrada dead-letter conserva su historia; una cancelación solo puede cerrar trabajo futuro todavía posible y nunca borrar el fallo.
24. La implementación física permanece condicionada por `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`.

---

#### 5. Contrato `VENTO-PRINT-CANCELLATION-EXPIRATION` `1.0.0`

##### 5.1 Estructura normativa

```json
{
  "cancellation_expiration_contract_id": "VENTO-PRINT-CANCELLATION-EXPIRATION",
  "cancellation_expiration_contract_version": "1.0.0",
  "record_id": "<uuid>",
  "job_identity": {
    "job_id": "<uuid>",
    "intent_id": "<string>",
    "output_id": "<IMP-*>",
    "copy_slot_id": "<string>",
    "idempotency_key": "<sha256>",
    "semantic_fingerprint": "<sha256>",
    "payload_hash": "<sha256>"
  },
  "policy": {
    "cancellation_expiration_profile_id": "<CXP-*>",
    "dispatch_deadline_at": "<RFC3339>",
    "delivery_deadline_at": "<RFC3339|null>",
    "retry_window_expires_at": "<RFC3339>",
    "deadline_source": "<OWNER_PROCESS|VERSIONED_POLICY>",
    "policy_version": "<semver>"
  },
  "cancellation": {
    "request_id": "<uuid|null>",
    "scope": "<DISPATCH_ONLY|DELIVERY_ONLY|DISPATCH_AND_DELIVERY|null>",
    "state": "<NOT_REQUESTED|REQUESTED|ACCEPTED_BEFORE_DISPATCH|PENDING_RECONCILIATION|REJECTED_ALREADY_PRINTED|REJECTED_ALREADY_DELIVERED|REJECTED_TERMINAL_OR_UNAUTHORIZED>",
    "reason_code": "<PRINT_CANCEL_*|null>",
    "requested_at": "<RFC3339|null>",
    "requested_by": {
      "principal_id": "<string|null>",
      "actor_id": "<string|null>",
      "source_application": "<FOGO|NEXO|PULSO|NUMERA|ORIGO|null>"
    }
  },
  "expiration": {
    "state": "<ACTIVE|EXPIRED_BEFORE_DISPATCH|EXPIRED_PENDING_RECONCILIATION|DELIVERY_EXPIRED_AFTER_PRINT|NOT_APPLICABLE>",
    "reason_code": "<PRINT_EXPIRATION_*|null>",
    "evaluated_at": "<RFC3339>",
    "authoritative_time_source": "<string>"
  },
  "observation": {
    "confirmation_state": "<estado-heredado-de-VENTO-PRINT-CONFIRMATION>",
    "highest_confirmed_level": "<NONE|JOB_ADMITTED|QUEUE_PERSISTED|SEND_STARTED|ADAPTER_ACCEPTED|PERIPHERAL_ACCEPTED|PRINTED_VERIFIED|DELIVERED_VERIFIED>",
    "latest_attempt_id": "<uuid|null>",
    "result_unknown": false,
    "evidence_refs": ["<string>"]
  },
  "resolution": {
    "state": "<OPEN|CLOSED_CANCELLED|CLOSED_EXPIRED|RECONCILIATION_REQUIRED|DISPOSITION_REQUIRED|EFFECT_CONFIRMED_UNCHANGED|LATE_EFFECT_RECONCILIATION_REQUIRED>",
    "decision_code": "<PRINT_CXP_*>",
    "resolved_at": "<RFC3339|null>",
    "resolution_evidence_refs": ["<string>"]
  },
  "trace": {
    "correlation_id": "<string>",
    "causation_id": "<string|null>",
    "batch_id": "<string|null>"
  }
}
```

La estructura es normativa y no prescribe almacenamiento, proveedor de cola, sistema de locks ni API concreta.

##### 5.2 Registro de solicitud

Toda solicitud de cancelación deberá incluir:

- identidad completa del trabajo y de la copia;
- scope solicitado;
- actor humano o principal técnico real;
- aplicación de origen;
- motivo tipado;
- versión observada del trabajo;
- instante autoritativo de recepción;
- nivel de confirmación conocido al solicitar;
- correlación con la decisión empresarial que motiva detener la impresión;
- evidencia de autorización, cuya definición detallada pertenece a `PRINT-ARC-015`.

Una solicitud incompleta se registra como intento rechazado y no altera la ejecución.

---

#### 6. Estados de cancelación y decisiones canónicas

##### 6.1 Estados de la solicitud

| Estado                              | Significado                                                          | Efecto permitido                                                             |
| ----------------------------------- | -------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `NOT_REQUESTED`                     | No existe solicitud autoritativa.                                    | El trabajo sigue su política normal.                                         |
| `REQUESTED`                         | La solicitud fue recibida y espera decisión atómica.                 | Pausar nueva adquisición o despacho mientras se resuelve.                    |
| `ACCEPTED_BEFORE_DISPATCH`          | Se confirmó que no comenzó un envío con posible efecto.              | Cerrar sin intento nuevo y retirar de carriles ejecutables.                  |
| `PENDING_RECONCILIATION`            | El comando pudo haber sido enviado o aceptado.                       | Bloquear retry y consultar evidencia autoritativa.                           |
| `REJECTED_ALREADY_PRINTED`          | La impresión está confirmada.                                        | Mantener el resultado; opcionalmente detener entrega.                        |
| `REJECTED_ALREADY_DELIVERED`        | Impresión y entrega están confirmadas.                               | Mantener resultado y auditoría; no existe acción física futura del servicio. |
| `REJECTED_TERMINAL_OR_UNAUTHORIZED` | El trabajo está cerrado, la identidad no coincide o falta autoridad. | No alterar cola, intento, evidencia ni cierre.                               |

##### 6.2 Ocho decisiones de cancelación

| Decisión                                 | Condición autoritativa                                                 | Resolución                                   |
| ---------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------------- |
| `ACCEPT_CANCEL_BEFORE_DISPATCH`          | No existe `SEND_STARTED` y el gate atómico conserva la misma versión.  | `CLOSED_CANCELLED`.                          |
| `ACCEPT_CANCEL_CONFIRMED_NOT_SENT`       | Existe intento, pero conciliación confirma que no transmitió.          | `CLOSED_CANCELLED`.                          |
| `ACCEPT_CANCEL_CONFIRMED_NOT_ACCEPTED`   | Hubo envío, pero existe rechazo seguro sin efecto.                     | `CLOSED_CANCELLED`.                          |
| `REQUIRE_RECONCILIATION_POSSIBLE_EFFECT` | Existe `SEND_STARTED`, aceptación posible, timeout o callback perdido. | `RECONCILIATION_REQUIRED`.                   |
| `ACCEPT_STOP_DELIVERY_AFTER_PRINT`       | `PRINTED_VERIFIED`, entrega requerida y no confirmada.                 | `DISPOSITION_REQUIRED`; no reimprimir.       |
| `REJECT_CANCEL_ALREADY_PRINTED`          | `PRINTED_VERIFIED` y no existe acción de entrega aplicable.            | `EFFECT_CONFIRMED_UNCHANGED`.                |
| `REJECT_CANCEL_ALREADY_DELIVERED`        | `DELIVERED_VERIFIED`.                                                  | `EFFECT_CONFIRMED_UNCHANGED`.                |
| `REJECT_CANCEL_INVALID`                  | Identidad, versión, autoridad, scope o estado terminal incompatibles.  | Mantener el estado previo y auditar rechazo. |

---

#### 7. Expiración y referencias temporales

##### 7.1 Tres referencias distintas

| Referencia                | Propósito                                                                                    | Regla                                                                                    |
| ------------------------- | -------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `dispatch_deadline_at`    | Último instante permitido para comenzar un nuevo despacho.                                   | Si se alcanza sin `SEND_STARTED`, el trabajo expira antes del efecto.                    |
| `delivery_deadline_at`    | Último instante permitido para entregar una copia ya impresa cuando el perfil exige handoff. | No revierte la impresión; detiene entrega y exige disposición.                           |
| `retry_window_expires_at` | Fin del presupuesto de reintentos automáticos heredado de `VENTO-PRINT-RETRY-QUEUE`.         | Agota retries, pero no demuestra ausencia de impresión ni sustituye los otros deadlines. |

Los valores de despacho y entrega provienen de la aplicación propietaria o de una política versionada. El servicio no inventa un default silencioso. Cuando un perfil exige deadline y este falta, el trabajo queda `BLOCKED_PRE_DISPATCH` con `PRINT_EXPIRATION_REQUIRED_DEADLINE_MISSING`.

##### 7.2 Estados de expiración

| Estado                           | Condición                                                                | Resolución                           |
| -------------------------------- | ------------------------------------------------------------------------ | ------------------------------------ |
| `ACTIVE`                         | El deadline aplicable no se ha alcanzado.                                | Continúa evaluación normal.          |
| `EXPIRED_BEFORE_DISPATCH`        | Deadline alcanzado sin `SEND_STARTED`.                                   | `CLOSED_EXPIRED`; no crear intento.  |
| `EXPIRED_PENDING_RECONCILIATION` | Deadline alcanzado después de un envío con resultado no resuelto.        | `RECONCILIATION_REQUIRED`; no retry. |
| `DELIVERY_EXPIRED_AFTER_PRINT`   | Impresión verificada, handoff pendiente y deadline de entrega alcanzado. | `DISPOSITION_REQUIRED`.              |
| `NOT_APPLICABLE`                 | El perfil no gobierna entrega o la salida ya alcanzó su nivel terminal.  | No genera transición adicional.      |

##### 7.3 Tiempo autoritativo

1. La evaluación usa tiempo de servidor o fuente técnica verificable.
2. El reloj del navegador no puede cancelar, prolongar ni expirar un trabajo.
3. Los límites se evalúan como intervalos semiabiertos: al alcanzar exactamente el deadline ya no comienza una nueva acción.
4. Un intento iniciado antes del deadline conserva su investigación; el paso del tiempo no permite afirmar que no produjo efecto.
5. La evidencia tardía se ordena por `occurred_at`, `received_at` y secuencia autoritativa cuando existan.

---

#### 8. Matriz de interacción con confirmación

| Estado observado                                   | Cancelación o expiración                                                      | Resultado obligatorio                                             |
| -------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `OPEN_NO_ATTEMPT`                                  | Puede aceptarse o expirar si el gate atómico confirma que no inició despacho. | `CLOSED_CANCELLED` o `CLOSED_EXPIRED`.                            |
| `BLOCKED_PRE_DISPATCH`                             | Puede cerrarse sin consumir intento.                                          | Retirar de carril ejecutable y conservar causa del bloqueo.       |
| `OPEN_IN_PROGRESS` antes de aceptación demostrable | Conciliar si existe cualquier posibilidad de transmisión.                     | Solo cerrar cuando se confirme que no se envió o no fue aceptado. |
| `OPEN_RESULT_UNKNOWN`                              | La solicitud se registra como tardía.                                         | `RECONCILIATION_REQUIRED`; retry y reemplazo prohibidos.          |
| `OPEN_AWAITING_DELIVERY`                           | La impresión no puede cancelarse; puede detenerse el handoff.                 | `DISPOSITION_REQUIRED`.                                           |
| `CONFLICT_REQUIRES_REVIEW`                         | No resolver automáticamente.                                                  | Conservar conflicto y solicitud; revisión con evidencia superior. |
| `CLOSED_REQUIRED_LEVEL_CONFIRMED`                  | Rechazar cancelación de hechos ya confirmados.                                | `EFFECT_CONFIRMED_UNCHANGED`.                                     |
| `CLOSED_TERMINAL_FAILURE` sin efecto posible       | La solicitud no cambia el cierre.                                             | Auditar como `REJECT_CANCEL_INVALID`.                             |

---

#### 9. Carrera entre cancelación, expiración y despacho

La decisión deberá usar una operación atómica o mecanismo equivalente sobre la versión vigente del trabajo.

```text
ADQUIRIR LEASE
→ LEER VERSION, CANCELACION, DEADLINES Y CONFIRMACION
→ REVALIDAR AUTORIDAD Y RUTA
→ GATE ATOMICO PRE-DISPATCH
→ CREAR ATTEMPT_ID Y SEND_STARTED
→ ENVIAR
```

Reglas:

1. Si la cancelación o expiración queda secuenciada antes de `SEND_STARTED`, el despacho deberá ser rechazado.
2. Si `SEND_STARTED` queda secuenciado antes o simultáneamente sin orden demostrable, la cancelación pasa a conciliación.
3. Un worker no puede depender de una lectura antigua realizada al adquirir el lease.
4. La expiración de un lease antes de `SEND_STARTED` permite cerrar por cancelación o expiración sin intento.
5. La expiración de un lease después de `SEND_STARTED` produce resultado desconocido.
6. La pérdida de conexión entre el gate y el callback no convierte la cancelación en exitosa.
7. Toda decisión registra versión leída, versión escrita, secuencia y razón.

---

#### 10. Efectos tardíos y disposición física

##### 10.1 Efecto tardío

Si después de `CLOSED_CANCELLED` o `CLOSED_EXPIRED` aparece evidencia correlacionada de envío, aceptación, impresión o entrega:

- el evento no se descarta;
- el cierre histórico no se reescribe;
- la resolución vigente pasa a `LATE_EFFECT_RECONCILIATION_REQUIRED`;
- se registra el punto de control que permitió el efecto;
- se bloquea cualquier retry o copia sustituta;
- se conserva la relación con la solicitud y el deadline;
- se abre diagnóstico al propietario de implementación y monitoreo.

##### 10.2 Copia impresa no entregada

Cuando la impresión está verificada y el handoff se cancela o expira, la copia deberá terminar en una disposición tipada:

- `RETURNED_TO_CONTROLLED_CUSTODY`;
- `VOIDED_AND_MARKED`;
- `DESTROYED_UNDER_CONTROL`;
- `RETAINED_AS_EVIDENCE`;
- `DISPOSITION_PENDING`.

La disposición requiere copia, actor, estación, razón, momento y evidencia. Sus permisos, privacidad y retención se completarán en `PRINT-ARC-015`, `PRINT-ARC-016` y `EVID-ARC-001` a `EVID-ARC-010`. Mientras falte evidencia, el trabajo permanece `DISPOSITION_REQUIRED`.

---

#### 11. Perfiles de cancelación y expiración

| Perfil                    | Aplicación                                                  | Deadline obligatorio                          | Cancelación después de impresión                                                                  | Resultado terminal seguro                                                |
| ------------------------- | ----------------------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `CXP-LABEL`               | Etiquetas especializadas.                                   | `dispatch_deadline_at`.                       | Rechazar cancelación de impresión; la aplicación o disposición de la etiqueta se gobierna aparte. | Cancelada o expirada antes del despacho, o efecto confirmado sin cambio. |
| `CXP-TICKET-POINT`        | Comandas, tiquetes operativos y control local.              | `dispatch_deadline_at`.                       | Rechazar; una modificación o cancelación empresarial genera otra salida versionada.               | Cancelada o expirada antes del despacho.                                 |
| `CXP-TICKET-HANDOFF`      | Comprobantes entregables a cliente o receptor.              | Despacho y entrega.                           | Puede detenerse el handoff; exige disposición de la copia.                                        | Cancelada antes de imprimir o cerrada después de disposición.            |
| `CXP-A4-LOCAL`            | A4 consumido en el mismo punto.                             | `dispatch_deadline_at`.                       | Rechazar cancelación de impresión; no hay handoff gobernado por el servicio.                      | Cancelada o expirada antes del despacho.                                 |
| `CXP-A4-ROUTE-DEPENDENT`  | A4 local o central según ruta.                              | Despacho; entrega cuando la ruta sea central. | En ruta central puede detenerse distribución y exigir disposición.                                | Depende del perfil resuelto por `job_id`.                                |
| `CXP-BLOCKED-NO-DISPATCH` | Ruta sin capacidad, dispositivo almacenado o mantenimiento. | Deadline o invalidez del recurso propietario. | No aplica mientras no exista intento.                                                             | Puede cerrarse sin consumir intento.                                     |

---

#### 12. Matriz materializada de las cincuenta salidas

Las denominaciones, propietarias, identidades, plantillas, perfiles físicos, rutas y niveles de confirmación aprobados permanecen intactos. Esta matriz materializa exclusivamente cancelación, expiración y tratamiento del efecto tardío.

| Salida       | Nombre                                                    | Propietaria | Perfil                   | Referencia de expiración                                                 | Regla después de efecto posible o confirmado                                                                               | Resultado / bloqueo                                    |
| ------------ | --------------------------------------------------------- | ----------- | ------------------------ | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `CXP-LABEL`              | `dispatch_deadline_at`                                                   | Cancelar o expirar solo antes del efecto; después de `PRINTED_VERIFIED` la impresión no se revierte.                       | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_ZD230_SIN_CANAL` |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / SEGUN_RUTA; VP_BLOQUEADO_SIN_80MM`     |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / RUTA_LOCAL_CONFIRMABLE`                |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / SEGUN_RUTA; VP_BLOQUEADO_SIN_80MM`     |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / ACTUALMENTE_BLOQUEADO_VP_SIN_80MM`     |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `CXP-TICKET-HANDOFF`     | `dispatch_deadline_at + delivery_deadline_at`                            | Antes de imprimir puede cerrarse; después de imprimir solo puede detenerse el handoff y exigir disposición.                | `ESPECIFICADO / IMPRESION_Y_ENTREGA_SEPARADAS`         |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `CXP-TICKET-POINT`       | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de imprimir, cualquier corrección exige otra salida empresarial versionada. | `ESPECIFICADO / CONTROL_LOCAL_DE_CAJA`                 |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / ADMIN_CONFIRMABLE; VP_MANTENIMIENTO`   |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `CXP-A4-ROUTE-DEPENDENT` | `dispatch_deadline_at + delivery_deadline_at cuando la ruta sea central` | Antes de imprimir puede cerrarse; después de impresión central solo se detiene distribución y se exige disposición.        | `ESPECIFICADO / CENTRAL_CONFIRMABLE; VP_MANTENIMIENTO` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `CXP-A4-LOCAL`           | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de `PRINTED_VERIFIED` no existe handoff gobernado por impresión.            | `ESPECIFICADO / ADMIN_LOCAL_CONFIRMABLE`               |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `CXP-A4-LOCAL`           | `dispatch_deadline_at`                                                   | Cancelar o expirar antes del despacho; después de `PRINTED_VERIFIED` no existe handoff gobernado por impresión.            | `ESPECIFICADO / ADMIN_LOCAL_CONFIRMABLE`               |

**Control de cobertura:** 50 esperadas, 50 materializadas, 50 identificadores únicos, 0 faltantes y 0 duplicados.

##### 12.1 Reconciliación cuantitativa

| Grupo                           | Esperadas | Materializadas | Faltantes | Duplicadas |
| ------------------------------- | --------: | -------------: | --------: | ---------: |
| Etiquetas `IMP-LBL-*`           |        16 |             16 |         0 |          0 |
| Comandas y tiquetes `IMP-CMD-*` |         9 |              9 |         0 |          0 |
| Comprobantes `IMP-CLI-*`        |         9 |              9 |         0 |          0 |
| Documentos `IMP-DOC-*`          |        16 |             16 |         0 |          0 |
| **Total**                       |    **50** |         **50** |     **0** |      **0** |

| Propietaria | Cantidad heredada | Cantidad materializada | Diferencia |
| ----------- | ----------------: | ---------------------: | ---------: |
| FOGO        |                15 |                     15 |          0 |
| NEXO        |                14 |                     14 |          0 |
| PULSO       |                12 |                     12 |          0 |
| NUMERA      |                 5 |                      5 |          0 |
| ORIGO       |                 4 |                      4 |          0 |
| **Total**   |            **50** |                 **50** |      **0** |

| Perfil                   | Salidas asignadas |
| ------------------------ | ----------------: |
| `CXP-LABEL`              |                16 |
| `CXP-TICKET-POINT`       |                10 |
| `CXP-TICKET-HANDOFF`     |                 8 |
| `CXP-A4-ROUTE-DEPENDENT` |                14 |
| `CXP-A4-LOCAL`           |                 2 |
| **Total materializado**  |            **50** |

`CXP-BLOCKED-NO-DISPATCH` actúa como condición adicional de ruta sobre las salidas ya identificadas; no agrega ni duplica filas.

---

#### 13. Bloqueos y carryovers con propietario

| ID                  | Bloqueo o brecha                                                                                                               | Propietario documental o de implementación                                                                                                                        | Condición de salida                                                                                                                     |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `BLK-PRINT-013-001` | La cola vigente en NEXO es texto local y no conserva solicitud, deadline, versión ni resolución autoritativa.                  | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y el paquete propietario del servicio de impresión.                                                       | Persistir el contrato, usar identidad canónica, aplicar gate atómico y probar carrera entre cancelación y despacho.                     |
| `BLK-PRINT-013-002` | Los comandos propietarios todavía no materializan `dispatch_deadline_at` y, cuando aplica, `delivery_deadline_at` por trabajo. | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`; los contratos propietarios de FOGO, NEXO, PULSO, NUMERA y ORIGO se materializan dentro de esa instancia. | Cada comando productor suministra deadline, fuente, versión y timezone; el servicio rechaza perfiles que los requieran y no los tengan. |
| `BLK-PRINT-013-003` | No se ha verificado si BrowserPrint, spoolers o dispositivos permiten abortar de forma demostrable después de iniciar envío.   | `PRINT-ARC-018` y `PRINT-ARC-020`.                                                                                                                                | Matriz por adaptador, canal y dispositivo que determine punto de no retorno y evidencia de aborto o imposibilidad.                      |
| `BLK-PRINT-013-004` | No existe superficie controlada para disposición de copias impresas cuyo handoff fue cancelado o expiró.                       | `EVID-ARC-001` a `EVID-ARC-010`, `PRINT-ARC-015`, `PRINT-ARC-016` y el paquete aplicable.                                                                         | Estados de disposición, actores autorizados, evidencia, privacidad, retención y prueba de correlación implementados.                    |
| `BLK-PRINT-013-005` | No existe detección ni alerta de efectos tardíos después de un cierre por cancelación o expiración.                            | `PRINT-ARC-019` y el paquete propietario de observabilidad.                                                                                                       | Métrica y alerta correlacionadas por `job_id`, diagnóstico del gate incumplido y procedimiento de conciliación operativo.               |

Ningún bloqueo autoriza iniciar las tareas responsables desde esta tarea.

---

#### 14. Cobertura existente de requisitos de prueba

La decisión consume comportamientos ya protegidos por el registro canónico vigente, en particular:

- `TREQ-PROC-065`, que separa cancelación de rechazo, retiro, vencimiento, imposibilidad y abandono;
- `TREQ-PROC-186`, que exige tiempo, vencimiento, cancelación, retry e idempotencia para trabajo asíncrono;
- `TREQ-PROC-292`, que exige probar cancelación real, expiración, resultados parciales y efectos tardíos conciliados;
- `TREQ-PROC-309`, que bloquea retry o nueva intención mientras el resultado sea desconocido;
- `TREQ-PROC-314`, que conserva separados estados de backend, integración y periférico;
- `TREQ-PROC-361`, que exige hechos enlazados y no destructivos para cancelación y corrección.

Esta tarea especializa esas reglas para impresión sin cambiar su alcance, propietario o estado.

---

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la cancelación, expiración, idempotencia, resultado desconocido, efecto tardío y conciliación de jobs ya están protegidos por requisitos vigentes. La tarea los especializa documentalmente para impresión, sin introducir una necesidad de prueba distinta ni modificar comportamiento ejecutable. Crea 0, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0 requisitos.

---

#### 16. Criterios de aceptación

`PRINT-ARC-013` queda documentalmente satisfecha cuando:

- [x] cancelación y expiración están diferenciadas;
- [x] existe un contrato consumible y versionado;
- [x] una solicitud declara identidad, scope, actor, motivo, versión y tiempo autoritativo;
- [x] existen decisiones explícitas antes del despacho, durante resultado incierto y después del efecto físico;
- [x] se prohíbe afirmar cancelación exitosa cuando el comando pudo producir efecto;
- [x] `OPEN_RESULT_UNKNOWN` exige conciliación y bloquea retry;
- [x] se distinguen deadline de despacho, deadline de entrega y ventana de retry;
- [x] no se inventan duraciones numéricas no aprobadas;
- [x] la carrera entre cancelación y despacho tiene gate atómico;
- [x] los efectos tardíos se conservan y reconcilian;
- [x] la copia impresa no entregada exige disposición controlada;
- [x] la cancelación técnica no se confunde con cancelación empresarial;
- [x] las cincuenta salidas tienen perfil y regla explícitos;
- [x] los totales y propietarias heredados concilian sin diferencias;
- [x] todos los bloqueos tienen propietario y condición de salida;
- [x] no se define reimpresión por anticipado;
- [x] no se declara implementación, cancelación operativa ni prueba física ejecutada.

---

#### 17. Handoff cerrado hacia `PRINT-ARC-014`

`PRINT-ARC-014` recibe:

- `VENTO-PRINT-CANCELLATION-EXPIRATION` `1.0.0`;
- siete estados de cancelación;
- cinco estados de expiración;
- siete resoluciones integradas;
- ocho decisiones de cancelación;
- tres referencias temporales separadas;
- seis perfiles;
- cincuenta salidas con política materializada;
- la prohibición de liberar identidad, duplicar o imprimir una copia sustituta por cancelación, expiración o pérdida de evidencia;
- la regla de que una copia adicional exige acción separada, actor, motivo, autorización, correlación e identidad nueva.

`PRINT-ARC-014` deberá definir la reimpresión como una acción vinculada e independiente, sin reutilizar la identidad original ni convertir retry, cancelación o expiración en una copia adicional implícita.

La aprobación de `PRINT-ARC-013` no inicia, desarrolla ni aprueba `PRINT-ARC-014`.


### ✅ PRINT-ARC-014 — Definir reimpresión como acción separada y auditable

**Estado:** APROBADA

#### 1. Resultado sustantivo

`PRINT-ARC-014` queda cerrada documentalmente con:

- el contrato `VENTO-PRINT-REPRINT` versión `1.0.0`;
- una acción de reimpresión deliberada, independiente y auditable;
- una identidad nueva por solicitud, trabajo, copia y ejecución;
- nueve estados de reimpresión y nueve decisiones normalizadas;
- ocho causas admitidas y seis señales expresamente no admitidas como causa;
- siete perfiles de tratamiento más un bloqueo transversal de despacho;
- una decisión materializada para las cincuenta salidas canónicas;
- controles de idempotencia, concurrencia, autorización, marcación, handoff y disposición física;
- separación cerrada frente a retry, replay, deduplicación, cancelación, expiración, reroute y cambio de versión;
- cero implementación física, cero migraciones, cero cambios de Supabase y cero evidencia operativa inventada.

El contrato gobierna una **copia física adicional legítima**. No autoriza a repetir un envío incierto, ocultar un duplicado, emitir un nuevo documento empresarial, reescribir la copia anterior ni convertir un fallo técnico en una nueva intención.

---

#### 2. Alcance y contratos heredados

Esta tarea conserva sin modificación las identidades, propietarias, nombres, rutas, políticas objetivo, perfiles físicos, salud, prioridades y decisiones de las cincuenta salidas. Consume:

| Contrato                              | Versión | Uso en esta tarea                                                      |
| ------------------------------------- | ------- | ---------------------------------------------------------------------- |
| `VENTO-PRINT-JOB`                     | `1.0.0` | Identidad y snapshot del trabajo original.                             |
| `VENTO-PRINT-ROUTE-TARGET`            | `1.0.0` | Revalidación de destino y restricciones territoriales.                 |
| `VENTO-PRINT-DEVICE-HEALTH`           | `1.0.0` | Elegibilidad del dispositivo antes del nuevo despacho.                 |
| `VENTO-PRINT-IDEMPOTENCY`             | `1.0.0` | Admisión atómica de una nueva copia legítima sin duplicar solicitudes. |
| `VENTO-PRINT-RETRY-QUEUE`             | `1.0.0` | Retry técnico dentro de la misma copia reimpresa.                      |
| `VENTO-PRINT-CONFIRMATION`            | `1.0.0` | Resolución previa de la copia original y confirmación de la nueva.     |
| `VENTO-PRINT-CANCELLATION-EXPIRATION` | `1.0.0` | Tratamiento de cancelación, expiración y efectos tardíos.              |

La reimpresión no altera el contrato empresarial del recurso impreso. Cuando el contenido, la versión, las cantidades, el destinatario, el periodo, el precio, la identidad fiscal o cualquier dato material cambian, corresponde un nuevo trabajo documental o empresarial; no una reimpresión.

---

#### 3. Definiciones y fronteras obligatorias

| Concepto            | Definición                                                                                                           | Identidad conservada o nueva                                                           |
| ------------------- | -------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `RETRY`             | Nuevo intento técnico para completar la misma copia.                                                                 | Conserva trabajo, intención, copia y clave idempotente; crea intento técnico.          |
| `REPLAY`            | Repetición idéntica de un comando ya admitido.                                                                       | Devuelve o reconcilia el resultado anterior.                                           |
| `DUPLICATE`         | Solicitud equivalente sin autorización para copia adicional.                                                         | Se suprime o se rechaza; no crea copia.                                                |
| `REPRINT`           | Comando deliberado para producir una copia física adicional del mismo snapshot, después de resolver la copia previa. | Crea solicitud, trabajo, copia, secuencia y ejecuciones nuevas, enlazadas al original. |
| `REROUTE`           | Cambio autorizado de destino técnico para una copia todavía no resuelta.                                             | Conserva la copia; no crea reimpresión.                                                |
| `CHANNEL_SWITCH`    | Cambio USB, LAN, Wi-Fi u otro canal del mismo dispositivo para la misma copia.                                       | Conserva la copia; crea intento técnico.                                               |
| `CANCEL`            | Detención del trabajo futuro permitido por el estado real.                                                           | No crea copia ni deshace una impresión.                                                |
| `EXPIRE`            | Cierre por vencimiento de una ventana autorizada.                                                                    | No crea copia ni demuestra ausencia de impresión.                                      |
| `CORRECTED_VERSION` | Documento o contenido materialmente cambiado.                                                                        | Crea versión y trabajo nuevos; no se etiqueta como reimpresión.                        |

Invariantes:

1. Toda reimpresión es una nueva copia; ningún retry es una reimpresión.
2. `RESULT_UNKNOWN`, timeout, callback perdido, dead-letter o agotamiento de retries bloquean la reimpresión hasta conciliar la copia previa.
3. Una copia impresa no se deshace por cancelar, expirar o reimprimir.
4. Una reimpresión no emite otra venta, pago, factura, nota, movimiento, lote, remisión, cierre o hecho empresarial.
5. El snapshot reimpreso debe ser exactamente el mismo; cualquier cambio material crea un trabajo nuevo.
6. La copia original permanece inmutable y consultable.
7. La reimpresión requiere causa, alcance, cantidad, actor o principal, autorización, timestamp y vínculo causal.
8. La salud recuperada, el heartbeat o el cambio de ruta nunca crean una reimpresión automática.
9. La reimpresión no se autoriza por nombre de rol, aplicación, sede, dispositivo o posesión del documento.
10. Ningún estado técnico se presenta como evidencia de impresión física sin el nivel de confirmación aplicable.

---

#### 4. Contrato `VENTO-PRINT-REPRINT` `1.0.0`

##### 4.1 Estructura normativa

```json
{
  "reprint_contract_id": "VENTO-PRINT-REPRINT",
  "reprint_contract_version": "1.0.0",
  "reprint_request_id": "<uuid>",
  "reprint_sequence": "<integer>=1",
  "root_print_job_id": "<uuid>",
  "parent_print_job_id": "<uuid>",
  "original_copy_id": "<uuid>",
  "prior_confirmation_record_id": "<uuid>",
  "prior_reconciliation_ref": "<string|null>",
  "new_print_job_id": "<uuid>",
  "new_intent_id": "<string>",
  "new_copy_id": "<uuid>",
  "new_copy_slot_id": "<string>",
  "output_id": "<IMP-*>",
  "owner_app": "<FOGO|NEXO|PULSO|NUMERA|ORIGO>",
  "resource_ref": "<type:id>",
  "resource_version": "<string>",
  "render_snapshot_hash": "<sha256>",
  "template_id": "<string>",
  "template_version": "<string>",
  "reason_code": "<RPR_REASON_*>",
  "reason_note_ref": "<string|null>",
  "requested_copy_count": "<integer>=1",
  "copy_ordinal_from": "<integer>=2",
  "requester": {
    "principal_id": "<uuid>",
    "effective_actor_id": "<uuid|null>",
    "application_id": "<string>",
    "site_id": "<string|null>",
    "area_id": "<string|null>",
    "device_id": "<string|null>",
    "context_version": "<string>"
  },
  "authorization": {
    "permission_id": "<string>",
    "decision_id": "<uuid>",
    "decision": "ALLOW",
    "approved_by_actor_id": "<uuid|null>",
    "segregation_mode": "<NONE|REQUIRED>",
    "authorized_copy_count": "<integer>"
  },
  "state": "<REQUESTED|AWAITING_ORIGINAL_RECONCILIATION|REJECTED|AUTHORIZED|DISPATCHED|COMPLETED|CANCELLED|EXPIRED|FAILED_RECONCILIATION_REQUIRED>",
  "decision": "<RPR_*>",
  "created_at": "<RFC3339>",
  "authorized_at": "<RFC3339|null>",
  "dispatch_deadline_at": "<RFC3339|null>",
  "completed_at": "<RFC3339|null>",
  "correlation_id": "<string>",
  "causation_id": "<string>",
  "audit_event_refs": ["<string>"],
  "physical_disposition_ref": "<string|null>"
}
```

##### 4.2 Identidades no reutilizables

Cada reimpresión crea valores nuevos para:

- `reprint_request_id`;
- `new_print_job_id`;
- `new_intent_id`;
- `new_copy_id`;
- `new_copy_slot_id`;
- cada `queue_entry_id`, lease e `attempt_id`;
- cada registro de confirmación, cancelación, expiración o disposición propio de la nueva copia.

Queda prohibido reutilizar `print_job_id`, `intent_id`, `copy_id`, `copy_slot_id`, `execution_id`, `attempt_id`, `queue_entry_id`, `confirmation_record_id` o `cancellation_request_id` de la copia previa.

La relación se conserva mediante `root_print_job_id`, `parent_print_job_id`, `original_copy_id`, `correlation_id`, `causation_id`, el snapshot y la secuencia de reimpresión.

---

#### 5. Condiciones de admisión

Una solicitud solo puede avanzar a `AUTHORIZED` cuando se cumplen conjuntamente:

1. `output_id`, propietaria, recurso y versión son resolubles.
2. La copia original existe y su identidad es íntegra.
3. El snapshot original y su hash están disponibles sin reconstrucción ambigua.
4. El estado de la copia previa fue conciliado por `VENTO-PRINT-CONFIRMATION`.
5. No existe `RESULT_UNKNOWN`, envío activo, retry pendiente, conciliación pendiente ni evento tardío sin clasificar sobre la copia previa.
6. La causa pertenece al catálogo admitido y es coherente con la evidencia disponible.
7. El solicitante y, cuando aplica, el aprobador están identificados y autorizados por permiso exacto.
8. La cantidad solicitada es positiva, explícita y no supera la cantidad autorizada.
9. El destino, ruta, dispositivo, canal y salud se revalidan para el nuevo despacho.
10. La ventana de despacho de la nueva copia permanece vigente.
11. No existe un claim concurrente incompatible sobre el mismo original, alcance y secuencia.
12. El tratamiento del perfil aplicable está disponible; si requiere controles de sensibilidad aún no definidos, queda bloqueado.

La ausencia de cualquier dato obligatorio produce denegación o espera tipada; nunca un `ALLOW` por defecto.

---

#### 6. Catálogo de causas

##### 6.1 Causas admitidas

| Código                                     | Uso                                                                   | Evidencia mínima                                              |
| ------------------------------------------ | --------------------------------------------------------------------- | ------------------------------------------------------------- |
| `RPR_REASON_ORIGINAL_NOT_RECEIVED`         | La copia confirmada no llegó al destinatario o punto requerido.       | Resultado de entrega o conciliación y destinatario aplicable. |
| `RPR_REASON_ORIGINAL_DAMAGED`              | La copia quedó físicamente dañada.                                    | Observación controlada o referencia de disposición.           |
| `RPR_REASON_ORIGINAL_ILLEGIBLE`            | La impresión existe, pero no cumple legibilidad.                      | Evidencia o verificación controlada de legibilidad.           |
| `RPR_REASON_ORIGINAL_LOST`                 | La copia confirmada se extravió bajo custodia conocida.               | Última custodia y registro del extravío.                      |
| `RPR_REASON_ORIGINAL_DESTROYED_CONTROLLED` | La copia fue destruida mediante disposición autorizada.               | Referencia de disposición y actor.                            |
| `RPR_REASON_ADDITIONAL_OPERATIONAL_COPY`   | Se requiere una copia adicional para operación permitida.             | Propósito, punto de uso y cantidad autorizada.                |
| `RPR_REASON_ADDITIONAL_CUSTOMER_COPY`      | El destinatario solicita una copia adicional permitida.               | Relación, destinatario y handoff revalidado.                  |
| `RPR_REASON_LEGAL_OR_AUDIT_COPY`           | Se requiere copia para obligación legal, fiscal, auditoría o control. | Finalidad, autoridad y alcance.                               |

##### 6.2 Señales que no constituyen causa de reimpresión

| Señal             | Tratamiento correcto                                        |
| ----------------- | ----------------------------------------------------------- |
| `RESULT_UNKNOWN`  | Conciliar la copia previa; no crear intención nueva.        |
| `RETRY_EXHAUSTED` | Dead-letter o conciliación; no crear copia automáticamente. |
| `CONTENT_CHANGED` | Crear nueva versión y nuevo trabajo empresarial.            |
| `VERSION_CHANGED` | Crear nuevo trabajo; no denominarlo reimpresión.            |
| `ROUTE_CHANGED`   | Revalidar o reroutear la misma copia cuando sea seguro.     |
| `DEVICE_CHANGED`  | Crear otro intento o reroute de la misma copia.             |

---

#### 7. Estados y decisiones

##### 7.1 Estados de la acción

| Estado                             | Significado                                                                 | Puede despachar                       |
| ---------------------------------- | --------------------------------------------------------------------------- | ------------------------------------- |
| `REQUESTED`                        | Solicitud registrada, todavía no evaluada.                                  | No.                                   |
| `AWAITING_ORIGINAL_RECONCILIATION` | La copia previa no tiene resultado autoritativo suficiente.                 | No.                                   |
| `REJECTED`                         | La solicitud no cumple identidad, causa, autorización, cantidad o política. | No.                                   |
| `AUTHORIZED`                       | Solicitud válida, con copia nueva y alcance congelados.                     | Sí, si ruta y salud siguen elegibles. |
| `DISPATCHED`                       | La nueva copia comenzó ejecución técnica.                                   | Ya iniciado; aplica confirmación.     |
| `COMPLETED`                        | La nueva copia alcanzó su nivel terminal exigido.                           | No aplica.                            |
| `CANCELLED`                        | La nueva copia fue cancelada conforme a su estado real.                     | No.                                   |
| `EXPIRED`                          | La nueva copia venció antes del despacho permitido o en su handoff.         | No.                                   |
| `FAILED_RECONCILIATION_REQUIRED`   | Falló o quedó incierta y exige conciliación; no habilita otra reimpresión.  | No.                                   |

##### 7.2 Decisiones normalizadas

| Decisión                            | Resultado                                                 |
| ----------------------------------- | --------------------------------------------------------- |
| `RPR_ACCEPT_NEW_COPY`               | Admite una copia nueva legítima.                          |
| `RPR_RETURN_EXISTING_REQUEST`       | Repite la respuesta de la misma solicitud idempotente.    |
| `RPR_BLOCK_ORIGINAL_RESULT_UNKNOWN` | Bloquea hasta resolver la copia previa.                   |
| `RPR_REJECT_NOT_A_REPRINT`          | El contenido o versión cambió; corresponde trabajo nuevo. |
| `RPR_REJECT_REASON`                 | Causa ausente, inválida o incompatible.                   |
| `RPR_REJECT_AUTHORIZATION`          | Falta permiso, alcance o segregación.                     |
| `RPR_REJECT_QUANTITY`               | Cantidad inválida o superior a la autorizada.             |
| `RPR_REJECT_CONCURRENCY`            | Existe claim o solicitud incompatible en curso.           |
| `RPR_BLOCK_POLICY_OR_DEVICE`        | La política, sensibilidad, ruta o salud impiden despacho. |

---

#### 8. Idempotencia y concurrencia

1. `reprint_request_id` es la clave de repetición de la solicitud; repetirlo con el mismo contenido devuelve el resultado existente.
2. El mismo identificador con contenido incompatible produce conflicto auditable.
3. La huella semántica incluye original, output, snapshot, causa, cantidad, alcance, destinatario, propósito y versión contractual.
4. Dos solicitudes distintas con huella equivalente compiten por un claim atómico sobre original, alcance y siguiente secuencia.
5. Solo una puede crear la misma secuencia; la otra devuelve conflicto o la solicitud existente.
6. Copias adicionales independientes requieren cantidad y autorización explícitas; no se crean mediante múltiples solicitudes concurrentes.
7. Cada copia autorizada recibe ordinal propio y estado propio.
8. La deduplicación no puede suprimir una reimpresión legítima porque la nueva acción declara causa, autorización y secuencia distintas.
9. La reimpresión no libera ni recicla la clave de la copia original.
10. Un retry de la copia reimpresa conserva su nuevo trabajo, intención, copia y clave; solo crea otro intento.

---

#### 9. Autorización, segregación y cantidad

- La aplicación propietaria determina el permiso exacto y el alcance.
- La interfaz no puede inferir autorización desde rol, cargo, sede, dispositivo, punto de venta o posesión del impreso.
- El servidor revalida principal, actor efectivo, contexto, territorio, recurso, estado, causa, cantidad y vigencia.
- `requested_copy_count` y `authorized_copy_count` son obligatorios; cada unidad genera una identidad de copia individual.
- El sistema registra `copy_ordinal_from` y `reprint_sequence`; quedan prohibidos lotes físicos anónimos.
- Para documentos financieros, fiscales, legales, de caja, sensibles o de control, puede exigirse aprobador distinto del solicitante.
- La política detallada por sensibilidad pertenece a `PRINT-ARC-015`; hasta su aprobación, cualquier caso que requiera una clasificación adicional queda `RPR_BLOCK_POLICY_OR_DEVICE`.
- La aprobación nunca corrige un snapshot inválido ni convierte una versión cambiada en reimpresión.

---

#### 10. Marcación, handoff y disposición física

| Perfil                     | Marcación mínima                                                                | Regla material                                                                                                      |
| -------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `RPR-LABEL-CONTROLLED`     | `REIMPRESIÓN #n`, referencia original y timestamp cuando el formato lo permita. | Si ambas etiquetas existen, debe decidirse cuál permanece válida y registrar disposición o coexistencia autorizada. |
| `RPR-POINT-OPERATIONAL`    | `REIMPRESIÓN #n`, hora y referencia de comanda o tiquete.                       | Mantiene el destino original; no crea otra orden ni duplica preparación.                                            |
| `RPR-CUSTOMER-HANDOFF`     | `COPIA` o `REIMPRESIÓN #n`.                                                     | Revalida destinatario, canal y entrega; imprimir y entregar siguen siendo hechos separados.                         |
| `RPR-FINANCIAL-CONTROLLED` | `COPIA` o equivalente legal permitido, con secuencia.                           | Conserva identidad fiscal, económica y transaccional original; no genera otra operación.                            |
| `RPR-CASH-CONTROLLED`      | `COPIA DE CONTROL #n`.                                                          | Conserva turno, caja, cierre, periodo y propósito; no modifica valores.                                             |
| `RPR-A4-CONTROLLED`        | `COPIA` o `REIMPRESIÓN #n`, referencia y versión.                               | Conserva snapshot, periodo y firmas originales según aplicabilidad.                                                 |
| `RPR-SENSITIVITY-GATED`    | La definida por la política de sensibilidad aplicable.                          | Bloquea hasta contar con clasificación, minimización, custodia, retención y disposición suficientes.                |
| `RPR-BLOCKED-NO-DISPATCH`  | No aplica.                                                                      | No se crea ejecución cuando no existe dispositivo, ruta, salud o política habilitante.                              |

Reglas de disposición:

1. La aparición posterior de la copia original no borra ni invalida silenciosamente la reimpresión.
2. Ambas copias se reconcilian por identidad y custodia.
3. Si una copia debe destruirse, se registra actor, motivo, método, momento y evidencia proporcional.
4. Una copia vencida, cancelada o sensible no puede abandonarse en bandeja, estación o dispositivo compartido.
5. La disposición física no altera el hecho de que la copia fue impresa.

---

#### 11. Ruta, retry y confirmación de la nueva copia

```text
COPIA ORIGINAL RESUELTA
→ SOLICITUD DE REIMPRESIÓN
→ IDEMPOTENCIA Y CLAIM ATÓMICO
→ AUTORIZACIÓN Y CANTIDAD
→ NUEVO TRABAJO Y NUEVA COPIA
→ RUTA, OBJETIVO Y SALUD REVALIDADOS
→ RETRY-QUEUE DE LA NUEVA COPIA
→ INTENTOS TÉCNICOS
→ CONFIRMACIÓN DE LA NUEVA COPIA
→ HANDOFF O DISPOSICIÓN CUANDO APLIQUE
```

- Un cambio de canal dentro del mismo dispositivo conserva la nueva copia.
- Un reroute permitido conserva la nueva copia y su secuencia.
- Ningún reroute se ejecuta cuando la copia original o la nueva copia están en `RESULT_UNKNOWN` y el cambio puede producir duplicidad.
- El callback de adaptador solo acredita el nivel tipado que realmente demuestre.
- `PRINTED_VERIFIED` y `DELIVERED_VERIFIED` permanecen separados.
- Cancelar o expirar la reimpresión aplica el contrato de `PRINT-ARC-013` sobre esta nueva copia; no modifica la original.
- Agotar retries de la reimpresión no autoriza otra reimpresión encadenada.

---

#### 12. Auditoría append-only

Cada acción conserva, sin sobrescritura:

- identidad de solicitud, raíz, padre, copia original y copia nueva;
- `output_id`, propietaria, recurso, versión, plantilla y hash del snapshot;
- causa, cantidad solicitada, cantidad autorizada y ordinales;
- principal, actor efectivo, aplicación, dispositivo, sede, área y versión de contexto;
- permiso, decisión de autorización, aprobador y segregación;
- confirmación y conciliación de la copia original;
- ruta, política objetivo, dispositivo, canal, cola, leases e intentos de la copia nueva;
- timestamps de solicitud, autorización, despacho, confirmación, entrega, cancelación, expiración y disposición;
- correlación, causalidad, resultado, conflictos y eventos tardíos;
- referencia de handoff o disposición física cuando corresponda.

La auditoría usa referencias y allowlists. No copia payloads, documentos, PIN, firmas, datos personales o contenido sensible innecesario.

---

#### 13. Diagnóstico del código vigente

La superficie actual de impresión NEXO:

- conserva una cola de texto en almacenamiento local;
- construye ZPL desde presets o layouts;
- selecciona una impresora BrowserPrint;
- invoca directamente `send`;
- muestra estados locales de envío y error.

No materializa todavía:

- `reprint_request_id`;
- linaje entre copia original y copia nueva;
- causa, cantidad u ordinal de reimpresión;
- autorización server-side ni segregación;
- confirmación previa de la copia original;
- claim de concurrencia;
- auditoría append-only;
- marcación canónica por perfil;
- disposición física o handoff reconciliado.

Este diagnóstico no modifica código ni declara implementación.

---

#### 14. Matriz materializada de las cincuenta salidas

| Salida       | Nombre                                                    | Propietaria | Perfil                     | Marcación                      | Condición de autoridad                                                     | Resultado o bloqueo vigente                                    |
| ------------ | --------------------------------------------------------- | ----------- | -------------------------- | ------------------------------ | -------------------------------------------------------------------------- | -------------------------------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `RPR-LABEL-CONTROLLED`     | REIMPRESIÓN #n + ref. original | Permiso exacto; original conciliado; control de coexistencia y disposición | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL; VP_BLOQUEADO_SIN_80MM` |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL; VP_BLOQUEADO_SIN_80MM` |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `RPR-POINT-OPERATIONAL`    | REIMPRESIÓN #n + hora          | Permiso exacto; razón; mismo destino y snapshot; original conciliado       | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL; VP_BLOQUEADO_SIN_80MM` |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `RPR-CUSTOMER-HANDOFF`     | COPIA / REIMPRESIÓN #n         | Permiso exacto; destinatario y handoff revalidados                         | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `RPR-CUSTOMER-HANDOFF`     | COPIA / REIMPRESIÓN #n         | Permiso exacto; destinatario y handoff revalidados                         | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `RPR-FINANCIAL-CONTROLLED` | COPIA / REIMPRESIÓN #n         | Permiso financiero exacto; no crea otra transacción ni identidad fiscal    | `ESPECIFICADO / HANDOFF_REVALIDADO`                            |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `RPR-FINANCIAL-CONTROLLED` | COPIA / REIMPRESIÓN #n         | Permiso financiero exacto; no crea otra transacción ni identidad fiscal    | `ESPECIFICADO / HANDOFF_REVALIDADO`                            |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `RPR-FINANCIAL-CONTROLLED` | COPIA / REIMPRESIÓN #n         | Permiso financiero exacto; no crea otra transacción ni identidad fiscal    | `ESPECIFICADO / HANDOFF_REVALIDADO`                            |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `RPR-CUSTOMER-HANDOFF`     | COPIA / REIMPRESIÓN #n         | Permiso exacto; destinatario y handoff revalidados                         | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `RPR-CUSTOMER-HANDOFF`     | COPIA / REIMPRESIÓN #n         | Permiso exacto; destinatario y handoff revalidados                         | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `RPR-CUSTOMER-HANDOFF`     | COPIA / REIMPRESIÓN #n         | Permiso exacto; destinatario y handoff revalidados                         | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `RPR-CASH-CONTROLLED`      | COPIA DE CONTROL #n            | Permiso de caja exacto; turno/cierre y propósito auditados                 | `ESPECIFICADO / CONTROL_LOCAL`                                 |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `RPR-FINANCIAL-CONTROLLED` | COPIA / REIMPRESIÓN #n         | Permiso financiero exacto; snapshot y periodo inmutables                   | `ESPECIFICADO / ADMIN_LOCAL_CONFIRMABLE`                       |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `RPR-A4-CONTROLLED`        | COPIA / REIMPRESIÓN #n         | Permiso exacto; snapshot y propósito; ruta revalidada                      | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |

**Control de cobertura:** 50 esperadas, 50 materializadas, 50 identificadores únicos, 0 faltantes y 0 duplicados.

##### 14.1 Reconciliación cuantitativa

| Grupo                           | Esperadas | Materializadas | Faltantes | Duplicadas |
| ------------------------------- | --------: | -------------: | --------: | ---------: |
| Etiquetas `IMP-LBL-*`           |        16 |             16 |         0 |          0 |
| Comandas y tiquetes `IMP-CMD-*` |         9 |              9 |         0 |          0 |
| Comprobantes `IMP-CLI-*`        |         9 |              9 |         0 |          0 |
| Documentos `IMP-DOC-*`          |        16 |             16 |         0 |          0 |
| **Total**                       |    **50** |         **50** |     **0** |      **0** |

| Propietaria | Cantidad heredada | Cantidad materializada | Diferencia |
| ----------- | ----------------: | ---------------------: | ---------: |
| FOGO        |                15 |                     15 |          0 |
| NEXO        |                14 |                     14 |          0 |
| PULSO       |                12 |                     12 |          0 |
| NUMERA      |                 5 |                      5 |          0 |
| ORIGO       |                 4 |                      4 |          0 |
| **Total**   |            **50** |                 **50** |      **0** |

##### 14.2 Reconciliación por perfil principal

| Perfil                     | Salidas |
| -------------------------- | ------: |
| `RPR-LABEL-CONTROLLED`     |      16 |
| `RPR-POINT-OPERATIONAL`    |       9 |
| `RPR-CUSTOMER-HANDOFF`     |       5 |
| `RPR-FINANCIAL-CONTROLLED` |       4 |
| `RPR-CASH-CONTROLLED`      |       1 |
| `RPR-A4-CONTROLLED`        |      15 |
| **Total**                  |  **50** |

`RPR-SENSITIVITY-GATED` y `RPR-BLOCKED-NO-DISPATCH` operan como controles transversales; no sustituyen el perfil principal ni alteran el conteo de identidades.

---

#### 15. Cobertura canónica de prueba existente

La política se encuentra cubierta por requisitos vigentes que ya protegen:

- `TREQ-PROC-065`: cancelación distinta de efectos ya ejecutados;
- `TREQ-PROC-279`: una intención nueva requiere acción y clave nuevas;
- `TREQ-PROC-284`: separación de intención, routing, receipts y efecto físico sin copias duplicadas;
- `TREQ-PROC-292`: cancelación, expiración y efectos tardíos conciliados;
- `TREQ-PROC-309`: resultado desconocido bloquea una intención nueva;
- `TREQ-PROC-314`: estados separados entre backend, integración y periférico;
- `TREQ-PROC-361`: hechos nuevos enlazados, historia no destructiva e idempotencia;
- `TREQ-PROC-362`: correlación y causalidad extremo a extremo;
- `TREQ-PROC-363`: replay idempotente y conflicto de contenido;
- `TREQ-PROC-366`: auditoría de impresión y acceso sensible;
- `TREQ-INTEGRATION-171`: cancelación, nulidad y sustitución no se reinterpretan como compensación automática.

La especialización de esas reglas para reimpresión no cambia su comportamiento protegido, responsables, estado ni evidencia requerida.

---

#### 16. Bloqueos y carryovers con propietario

| ID                  | Bloqueo o brecha                                                                                              | Propietario                                                                                         | Condición de salida                                                                                                         |
| ------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `BLK-PRINT-014-001` | El código vigente no persiste solicitudes, linaje, autorización, cantidad, causa ni auditoría de reimpresión. | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete propietario de impresión.         | Implementar contrato, almacenamiento, autorización, API, tipos, pruebas e interfaz sin alterar las decisiones documentales. |
| `BLK-PRINT-014-002` | El callback BrowserPrint vigente no constituye receipt canónico ni prueba impresión física.                   | Paquete de adaptador; `PRINT-ARC-018`; `PRINT-ARC-020`.                                             | Emitir receipts tipados, observar capacidades reales y completar prueba física controlada.                                  |
| `BLK-PRINT-014-003` | La Zebra ZD230 está almacenada y sin canal activo; las dieciséis etiquetas no pueden despacharse.             | Paquete de habilitación física definido en `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`. | Desplegar dispositivo, configurar canal, validar salud y ejecutar prueba correlacionada.                                    |
| `BLK-PRINT-014-004` | La Epson L5590 de Vento Producción requiere mantenimiento.                                                    | Paquete de mantenimiento e implementación aplicable.                                                | Cerrar mantenimiento, validar salud y ejecutar prueba A4 correlacionada.                                                    |
| `BLK-PRINT-014-005` | Vento Producción no tiene impresora 80 mm compatible activa.                                                  | Paquete de incorporación de activo definido en el alcance de implementación.                        | Incorporar dispositivo, actualizar ruta y salud, y ejecutar prueba controlada.                                              |
| `BLK-PRINT-014-006` | Los controles detallados para documentos sensibles aún no están definidos.                                    | `PRINT-ARC-015`.                                                                                    | Aprobar clasificación, autorización reforzada, minimización, custodia, retención y disposición por sensibilidad.            |
| `BLK-PRINT-014-007` | Las superficies y evidencias de handoff, custodia y disposición física no están implementadas.                | `EVID-ARC-001` a `EVID-ARC-010` y paquete de implementación aplicable.                              | Implementar evidencia proporcional, identidad del actor, integridad, retención y reconciliación.                            |
| `BLK-PRINT-014-008` | No existen observaciones reales ni validación física de reimpresión.                                          | `PRINT-ARC-018`, `PRINT-ARC-020` y paquete E5 correspondiente.                                      | Ejecutar escenarios autorizados en hardware representativo y conservar evidencia reproducible.                              |

Ningún bloqueo inicia por sí mismo la tarea responsable ni autoriza cambios físicos.

---

#### 17. Criterios de aceptación

`PRINT-ARC-014` queda documentalmente satisfecha cuando:

- [x] existe un contrato consumible de reimpresión;
- [x] reimpresión, retry, replay, duplicado, reroute, cancelación, expiración y nueva versión están separados;
- [x] cada reimpresión crea identidades nuevas y linaje resoluble;
- [x] el resultado de la copia previa debe conciliarse antes de una copia adicional;
- [x] existe catálogo cerrado de causas admitidas y señales no admitidas;
- [x] se definen estados, decisiones, cantidad, ordinales y concurrencia;
- [x] la autorización usa permiso exacto y segregación cuando aplica;
- [x] se definen marcación, handoff y disposición física;
- [x] una copia financiera o fiscal no crea otra transacción o identidad documental;
- [x] cada una de las cincuenta salidas tiene decisión explícita;
- [x] los totales y propietarias heredados concilian sin diferencias;
- [x] los bloqueos tienen propietario y condición de salida;
- [x] no se declara código, Supabase, despliegue ni evidencia física ejecutados;
- [x] el tratamiento detallado de sensibilidad queda reservado exclusivamente a la siguiente tarea.

---

#### 18. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: el registro canónico vigente ya protege la acción nueva e idempotente, la separación entre intención, retry y efecto físico, la prohibición de crear otra intención con resultado desconocido, la historia enlazada y no destructiva, la correlación, la auditoría y el tratamiento de cancelación o expiración. Esta tarea especializa esas reglas para la copia física adicional sin crear comportamiento de prueba nuevo ni cambiar responsables o estados. En consecuencia, crea 0, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0 requisitos.

---

#### 19. Handoff cerrado hacia `PRINT-ARC-015`

`PRINT-ARC-015` recibe:

- `VENTO-PRINT-REPRINT` `1.0.0`;
- nueve estados y nueve decisiones de reimpresión;
- ocho causas admitidas y seis señales excluidas;
- seis perfiles principales y dos controles transversales;
- linaje obligatorio entre copia original y copia nueva;
- marcación y disposición base por familia;
- matriz completa de cincuenta salidas;
- el bloqueo `RPR-SENSITIVITY-GATED` para especialización.

`PRINT-ARC-015` queda **RESERVADA** para definir tratamiento de documentos sensibles. No se desarrolla ni modifica desde esta tarea.


### ✅ PRINT-ARC-015 — Definir permisos de impresión, reimpresión y administración

**Estado:** APROBADA

**Tarea anterior:** `PRINT-ARC-014 — Definir reimpresión como acción separada y auditable` — APROBADA
**Tarea siguiente:** `PRINT-ARC-016 — Definir tratamiento de datos sensibles y PII en impresión` — RESERVADA
**Tipo de tarea:** documental; autorización, catálogo objetivo de capacidades, fronteras de servicio y matriz materializada
**Repositorio propietario:** `vento-shell`
**Implementación física autorizada:** ninguna; no crea código, migraciones, cambios de Supabase, asignaciones de rol ni despliegues

---

#### 1. Resultado sustantivo

`PRINT-ARC-015` queda cerrada documentalmente con:

- el contrato `VENTO-PRINT-AUTHORIZATION` versión `1.0.0`;
- tres planos de autoridad no intercambiables: autoridad del recurso empresarial, autoridad de la acción física y administración técnica del servicio;
- catorce claves de permiso objetivo bajo la convención `app.module.resource.action`;
- dos claves ya presentes en el catálogo canónico y doce capacidades objetivo pendientes de materialización controlada;
- ocho perfiles de autorización;
- diez decisiones positivas y ocho códigos de denegación normalizados;
- seis perfiles de alcance territorial y de recurso;
- revalidación obligatoria en admisión, acción manual, reimpresión, predespacho y administración;
- separación entre impresión original, retry, reimpresión, conciliación, cancelación y configuración;
- segregación reforzada para copias financieras, fiscales, de caja y controles equivalentes;
- una decisión explícita para las cincuenta salidas canónicas;
- cero asignaciones implícitas por nombre de rol, dispositivo, aplicación, sede o posesión del documento;
- cero implementación física, cero migraciones, cero cambios de Supabase y cero evidencia operativa inventada.

La autorización definida aquí no reemplaza la autorización empresarial que originó el documento. El servicio solo ejecuta o administra acciones físicas sobre un recurso y snapshot ya resolubles.

---

#### 2. Continuidad y contradicción heredada

Las fuentes vigentes asignan inequívocamente a `PRINT-ARC-015` la definición de permisos y reservan privacidad y PII para `PRINT-ARC-016`. El cierre aprobado de `PRINT-ARC-014` conserva una frase heredada que denomina erróneamente a `PRINT-ARC-015` como tratamiento de documentos sensibles.

| Elemento                         | Valor vigente                                                       | Decisión                                                    |
| -------------------------------- | ------------------------------------------------------------------- | ----------------------------------------------------------- |
| `active-sequence.json`           | `PRINT-ARC-015` = permisos; `PRINT-ARC-016` = datos sensibles y PII | Fuente de continuidad vigente.                              |
| Registro global de tareas        | `PRINT-ARC-015` = permisos                                          | Confirma identidad y título.                                |
| Marcador del archivo propietario | `PRINT-ARC-015` = permisos                                          | Confirma el bloque que debe materializarse.                 |
| Frase final de `PRINT-ARC-014`   | `PRINT-ARC-015` = documentos sensibles                              | Etiqueta heredada obsoleta; no cambia la identidad vigente. |

La inconsistencia no bloquea esta tarea porque las fuentes actuales de continuidad, registro y propiedad coinciden. Su propietario documental es la incorporación de `PRINT-ARC-015` en `vento-shell`; la condición de salida es que el bloque aprobado sustituya el marcador vigente y los verificadores de continuidad dejen una única secuencia `PRINT-ARC-014 → PRINT-ARC-015 → PRINT-ARC-016`.

---

#### 3. Contratos heredados y frontera

| Contrato                              | Versión | Uso                                                           |
| ------------------------------------- | ------- | ------------------------------------------------------------- |
| `VENTO-PRINT-JOB`                     | `1.0.0` | Identidad, propietaria y snapshot del trabajo.                |
| `VENTO-PRINT-ROUTE-TARGET`            | `1.0.0` | Destino lógico, política territorial y restricciones de ruta. |
| `VENTO-PRINT-DEVICE-HEALTH`           | `1.0.0` | Elegibilidad técnica previa al despacho.                      |
| `VENTO-PRINT-IDEMPOTENCY`             | `1.0.0` | Admisión única de cada copia legítima.                        |
| `VENTO-PRINT-RETRY-QUEUE`             | `1.0.0` | Ejecución, leases, intentos y cola de fallos.                 |
| `VENTO-PRINT-CONFIRMATION`            | `1.0.0` | Receipts, evidencia, resultado conocido o desconocido.        |
| `VENTO-PRINT-CANCELLATION-EXPIRATION` | `1.0.0` | Cancelación, expiración, efectos tardíos y disposición.       |
| `VENTO-PRINT-REPRINT`                 | `1.0.0` | Copia adicional deliberada, vinculada e independiente.        |

Frontera obligatoria:

```text
AUTORIZACIÓN EMPRESARIAL DEL RECURSO
→ AUTORIZACIÓN DE LA ACCIÓN DE IMPRESIÓN
→ ADMISIÓN IDEMPOTENTE DE LA COPIA
→ RUTA, POLÍTICA Y SALUD
→ DESPACHO POR PRINCIPAL TÉCNICO LIMITADO
→ RECEIPT, RESULTADO Y AUDITORÍA
```

La cola no concede autoridad empresarial. La impresora, el adaptador, el dispositivo compartido, la interfaz, el callback o un principal técnico tampoco pueden crear una impresión o reimpresión por sí mismos.

---

#### 4. Principios normativos

1. `ROL ≠ AUTORIZACIÓN`; toda decisión usa permiso exacto, actor efectivo, contexto, recurso real, alcance y denegaciones.
2. El permiso de la acción empresarial fuente no autoriza automáticamente cualquier impresión futura del recurso.
3. Una impresión original automática puede heredar una decisión fuente únicamente mediante referencia verificable, alcance congelado y snapshot correlacionado.
4. Una impresión original iniciada manualmente exige permiso explícito de creación del trabajo y autoridad sobre el recurso fuente.
5. Toda reimpresión exige permiso propio; nunca se hereda de `jobs.create`, `jobs.retry`, acceso a la pantalla ni posesión de una copia.
6. Un retry conserva la misma copia y usa permiso de operación de cola; no usa permiso de reimpresión.
7. `RESULT_UNKNOWN` bloquea retry manual, reroute con riesgo de duplicado y reimpresión hasta conciliación.
8. Cancelar un trabajo de impresión no cancela el hecho empresarial fuente ni deshace una copia física.
9. Configurar impresoras, plantillas, rutas o políticas no concede permiso para imprimir, reimprimir, consultar payloads o resolver evidencia.
10. Consultar trabajos no concede mutación; consultar evidencia o auditoría requiere capacidad separada.
11. El principal técnico del servicio solo ejecuta trabajos ya autorizados dentro de una delegación mínima, trazable y vigente.
12. El principal técnico no puede aprobar reimpresiones, ampliar cantidad, cambiar snapshot ni sustituir al actor humano requerido.
13. La autorización se revalida en servidor antes de la mutación y nuevamente en el gate predespacho cuando cambie contexto, recurso, política o vigencia.
14. La sede seleccionada, la última impresora, una IP, la estación visible o el área enviada por el cliente no determinan alcance.
15. La identidad del recurso, su territorio, versión, estado y relaciones se resuelven desde fuentes autoritativas.
16. Las acciones administrativas sensibles permanecen online; la contingencia offline se reserva para `PRINT-ARC-017`.
17. La política de campos, ocultamiento, PII y contenido sensible se reserva para `PRINT-ARC-016`; hasta entonces no se amplía visibilidad.
18. Toda denegación conserva código, regla evaluada, recurso, alcance y decisión sin registrar contenido protegido innecesario.

---

#### 5. Contrato `VENTO-PRINT-AUTHORIZATION` `1.0.0`

```json
{
  "authorization_contract_id": "VENTO-PRINT-AUTHORIZATION",
  "authorization_contract_version": "1.0.0",
  "authorization_decision_id": "<uuid>",
  "action": "<SOURCE_DELEGATED_PRINT|DIRECT_PRINT|REPRINT_REQUEST|REPRINT_APPROVAL|JOB_VIEW|JOB_CANCEL|JOB_RETRY|JOB_RECONCILE|ADMIN_READ|ADMIN_UPDATE>",
  "authority_plane": "<BUSINESS_SOURCE|PRINT_ACTION|SERVICE_ADMINISTRATION>",
  "required_permission_key": "<canonical-permission-key|null>",
  "principal": {
    "principal_type": "<PERSON|DEVICE|SERVICE>",
    "principal_id": "<uuid>",
    "effective_actor_id": "<uuid|null>",
    "delegation_id": "<uuid|null>"
  },
  "context": {
    "context_version": "<string>",
    "authorization_lane": "<BASE|OPERATIONAL|BASE_OR_OPERATIONAL|BASE_AND_OPERATIONAL|SERVICE_DELEGATION>",
    "site_id": "<string|null>",
    "area_id": "<string|null>",
    "station_id": "<string|null>",
    "device_id": "<string|null>",
    "shift_id": "<string|null>",
    "check_in_id": "<string|null>"
  },
  "resource": {
    "resource_type": "<PRINT_JOB|REPRINT_REQUEST|PRINT_TEMPLATE|PRINTER|ROUTING_POLICY|PRINT_EVIDENCE|PRINT_AUDIT>",
    "resource_id": "<string>",
    "source_app": "<FOGO|NEXO|PULSO|NUMERA|ORIGO|null>",
    "source_resource_ref": "<type:id|null>",
    "source_resource_version": "<string|null>",
    "output_id": "<IMP-*|null>",
    "job_id": "<uuid|null>",
    "copy_id": "<uuid|null>",
    "reprint_request_id": "<uuid|null>"
  },
  "source_authorization": {
    "decision_id": "<uuid|null>",
    "permission_key": "<string|null>",
    "authorized_actor_id": "<uuid|null>",
    "authorized_resource_ref": "<string|null>",
    "authorized_resource_version": "<string|null>",
    "authorized_output_id": "<IMP-*|null>",
    "authorized_copy_count": "<integer|null>",
    "valid_until": "<RFC3339|null>"
  },
  "scope": {
    "scope_profile_id": "<SCOPE-*>",
    "organization_id": "<string|null>",
    "site_ids": ["<string>"],
    "area_ids": ["<string>"],
    "station_ids": ["<string>"],
    "printer_ids": ["<string>"],
    "queue_lane_ids": ["<string>"],
    "recipient_ref": "<string|null>"
  },
  "segregation": {
    "mode": "<NONE|POLICY_CONDITIONAL|DISTINCT_ACTOR_REQUIRED>",
    "approver_decision_id": "<uuid|null>",
    "approver_actor_id": "<uuid|null>"
  },
  "decision": {
    "result": "<ALLOW|DENY|INDETERMINATE>",
    "decision_code": "<PRINT_AUTH_*>",
    "reason_codes": ["<PRINT_AUTH_REASON_*>"]
  },
  "validity": {
    "evaluated_at": "<RFC3339>",
    "expires_at": "<RFC3339|null>",
    "must_revalidate_before_dispatch": true
  },
  "trace": {
    "correlation_id": "<string>",
    "causation_id": "<string|null>",
    "audit_event_ref": "<string>"
  }
}
```

La estructura es normativa. No prescribe tabla, RPC, proveedor de colas, lenguaje, framework ni topología de despliegue.

---

#### 6. Tres planos de autoridad

| Plano                    | Autoridad necesaria                                                                                  | Puede                                                                                             | No puede                                                                                            |
| ------------------------ | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `BUSINESS_SOURCE`        | Decisión vigente de la aplicación propietaria sobre el recurso, estado, versión y efecto.            | Autorizar que un output previsto origine su primera copia mediante delegación correlacionada.     | Administrar cola, crear copias adicionales o configurar dispositivos.                               |
| `PRINT_ACTION`           | Permiso exacto de impresión, reimpresión o acción de trabajo, más autoridad sobre el recurso fuente. | Crear trabajo manual, solicitar/aprobar reimpresión, cancelar, retry o conciliar según capacidad. | Modificar el hecho empresarial, ampliar territorio o alterar el snapshot.                           |
| `SERVICE_ADMINISTRATION` | Permiso técnico exacto sobre impresora, plantilla, ruta, política, evidencia o auditoría.            | Consultar o actualizar configuración dentro del scope concedido.                                  | Imprimir, reimprimir o aprobar un recurso empresarial por el solo hecho de administrar el servicio. |

Una acción que cruza planos exige la intersección de todas las autoridades aplicables. Ningún permiso técnico compensa la ausencia de autoridad empresarial.

---

#### 7. Catálogo objetivo de permisos

El módulo canónico es `nexo.printing` porque la superficie y los permisos de impresión actualmente catalogados pertenecen a NEXO. Esta decisión no convierte a NEXO en fuente de verdad de documentos, ventas, producción, finanzas o compras de otras aplicaciones; el recurso fuente conserva su propietaria.

| Clave objetivo                          | Estado documental    | Recurso           | Acción protegida                                                     | Frontera                                                                                      |
| --------------------------------------- | -------------------- | ----------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `nexo.printing.jobs.view`               | `EXISTING_CANONICAL` | `PRINT_JOB`       | Consultar trabajo y estado permitido.                                | Filtrado por relación, territorio y política de campos.                                       |
| `nexo.printing.jobs.create`             | `TARGET_ADDITION`    | `PRINT_JOB`       | Crear manualmente la primera copia de un snapshot autorizado.        | Exige autoridad vigente sobre recurso fuente; no crea reimpresión.                            |
| `nexo.printing.jobs.cancel`             | `TARGET_ADDITION`    | `PRINT_JOB`       | Solicitar cancelación técnica conforme al estado real.               | No cancela el hecho empresarial ni afirma ausencia de efecto.                                 |
| `nexo.printing.jobs.retry`              | `TARGET_ADDITION`    | `PRINT_JOB`       | Reintentar la misma copia cuando la política lo permite.             | Conserva job, copy, intención y clave; bloqueado en resultado desconocido.                    |
| `nexo.printing.jobs.reconcile`          | `TARGET_ADDITION`    | `PRINT_JOB`       | Resolver resultado desconocido o conflicto con evidencia autorizada. | No crea copia ni altera evidencia previa.                                                     |
| `nexo.printing.reprints.request`        | `TARGET_ADDITION`    | `REPRINT_REQUEST` | Solicitar una copia adicional vinculada.                             | Exige causa, cantidad, original resuelto, recurso y scope.                                    |
| `nexo.printing.reprints.approve`        | `TARGET_ADDITION`    | `REPRINT_REQUEST` | Aprobar una reimpresión cuando el perfil exige segregación.          | Debe ser actor distinto cuando el modo sea dual.                                              |
| `nexo.printing.printers.view`           | `TARGET_ADDITION`    | `PRINTER`         | Consultar inventario, estado y configuración permitida.              | No permite despachar trabajos.                                                                |
| `nexo.printing.printers.update`         | `TARGET_ADDITION`    | `PRINTER`         | Modificar configuración administrable y versionada.                  | Online, auditada, sin credenciales expuestas ni selección libre por usuario.                  |
| `nexo.printing.routing_policies.view`   | `TARGET_ADDITION`    | `ROUTING_POLICY`  | Consultar política y alcance aplicables.                             | No cambia ruta ni concede autoridad de impresión.                                             |
| `nexo.printing.routing_policies.update` | `TARGET_ADDITION`    | `ROUTING_POLICY`  | Crear o modificar política versionada de routing.                    | Requiere alcance administrativo; no modifica trabajos ya congelados sin transición explícita. |
| `nexo.printing.templates.update`        | `EXISTING_CANONICAL` | `PRINT_TEMPLATE`  | Actualizar plantilla versionada.                                     | No permite imprimir ni consultar datos fuente por sí sola.                                    |
| `nexo.printing.evidence.view`           | `TARGET_ADDITION`    | `PRINT_EVIDENCE`  | Consultar evidencia mínima permitida.                                | Field policy y finalidad obligatorias; privacidad se especializa en `PRINT-ARC-016`.          |
| `nexo.printing.audit.view`              | `TARGET_ADDITION`    | `PRINT_AUDIT`     | Consultar trazabilidad de decisiones y acciones.                     | Lectura separada, finalidad registrada y sin mutación del historial.                          |

Reconciliación del catálogo objetivo:

| Métrica                                           | Cantidad |
| ------------------------------------------------- | -------: |
| Claves objetivo                                   |       14 |
| Claves canónicas existentes consumidas sin cambio |        2 |
| Capacidades objetivo por materializar             |       12 |
| Permisos amplios `manage` creados                 |        0 |
| Asignaciones de rol realizadas                    |        0 |
| Cambios de Supabase realizados                    |        0 |

La materialización posterior deberá usar el proceso canónico de catálogo, aliases, tipos, consumidores y migraciones de `vento-shell`. Esta tarea no declara que las doce capacidades nuevas ya existan en runtime.

---

#### 8. Perfiles de autorización

| Perfil                      | Acción                                                                      | Permisos y autoridad                                                                                             | Segregación                                                             | Resultado habilitado                                             |
| --------------------------- | --------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `PAUTH-SOURCE-DELEGATED`    | Primera copia automática prevista por el proceso.                           | Decisión fuente verificable, output permitido, snapshot y cantidad congelados; principal técnico delegado.       | `NONE`; la decisión fuente ya identifica la autoridad empresarial.      | `PRINT_AUTH_ALLOW_SOURCE_DELEGATED_JOB`.                         |
| `PAUTH-DIRECT-OPERATIONAL`  | Primera copia iniciada manualmente.                                         | `nexo.printing.jobs.create` + autoridad de lectura/acción sobre recurso fuente + scope exacto.                   | Según política fuente; nunca por rol implícito.                         | `PRINT_AUTH_ALLOW_DIRECT_JOB`.                                   |
| `PAUTH-REPRINT-OPERATIONAL` | Copia adicional operativa de bajo alcance.                                  | `nexo.printing.reprints.request`, original conciliado, causa, cantidad, mismo recurso y destino permitido.       | `NONE`; el actor solicitante asume la decisión dentro del scope.        | `PRINT_AUTH_ALLOW_REPRINT_REQUEST`.                              |
| `PAUTH-REPRINT-CONTROLLED`  | Copia adicional con custodia, coexistencia, entrega o documento controlado. | `reprints.request`; `reprints.approve` cuando la política fuente, cantidad, coexistencia o disposición lo exija. | `POLICY_CONDITIONAL`.                                                   | Solicitud autorizada o espera de aprobación.                     |
| `PAUTH-REPRINT-DUAL`        | Copia financiera, fiscal, caja, legal o control equivalente.                | `reprints.request` + `reprints.approve` + autoridad sobre recurso fuente.                                        | `DISTINCT_ACTOR_REQUIRED`; solicitante y aprobador no pueden coincidir. | `PRINT_AUTH_ALLOW_REPRINT_APPROVED`.                             |
| `PAUTH-QUEUE-OPERATOR`      | Vista, cancelación, retry o conciliación.                                   | Permiso exacto `jobs.view`, `jobs.cancel`, `jobs.retry` o `jobs.reconcile` y scope de cola/recurso.              | Acción por acción; no existe `queue.manage`.                            | Decisión específica de trabajo.                                  |
| `PAUTH-SERVICE-ADMIN`       | Vista o actualización de impresoras, rutas, políticas y plantillas.         | Permiso exacto del recurso administrativo y scope asignado.                                                      | Cambios críticos sujetos a aprobación/configuración canónica externa.   | `PRINT_AUTH_ALLOW_ADMIN_READ` o `PRINT_AUTH_ALLOW_ADMIN_UPDATE`. |
| `PAUTH-AUDITOR`             | Evidencia o auditoría.                                                      | `evidence.view` o `audit.view`, finalidad y field policy.                                                        | Solo lectura; administración privilegiada también se audita.            | `PRINT_AUTH_ALLOW_ADMIN_READ`.                                   |

---

#### 9. Decisiones y denegaciones

##### 9.1 Decisiones positivas

| Código                                  | Condición                                                                         |
| --------------------------------------- | --------------------------------------------------------------------------------- |
| `PRINT_AUTH_ALLOW_SOURCE_DELEGATED_JOB` | Decisión fuente, snapshot, output, cantidad y delegación son íntegros y vigentes. |
| `PRINT_AUTH_ALLOW_DIRECT_JOB`           | Actor humano, permiso `jobs.create`, recurso y contexto autorizados.              |
| `PRINT_AUTH_ALLOW_REPRINT_REQUEST`      | Solicitud operativa válida sin aprobación separada exigida.                       |
| `PRINT_AUTH_ALLOW_REPRINT_APPROVED`     | Solicitud controlada con aprobación válida y segregación satisfecha.              |
| `PRINT_AUTH_ALLOW_JOB_VIEW`             | Trabajo dentro del alcance y campos permitidos.                                   |
| `PRINT_AUTH_ALLOW_JOB_CANCEL`           | Estado cancelable y permiso exacto vigente.                                       |
| `PRINT_AUTH_ALLOW_JOB_RETRY`            | Misma copia, fallo retryable, sin resultado desconocido y dentro de presupuesto.  |
| `PRINT_AUTH_ALLOW_JOB_RECONCILE`        | Actor autorizado y evidencia suficiente para una resolución tipada.               |
| `PRINT_AUTH_ALLOW_ADMIN_READ`           | Recurso técnico dentro del scope y field policy.                                  |
| `PRINT_AUTH_ALLOW_ADMIN_UPDATE`         | Mutación administrativa versionada, online y auditada.                            |

##### 9.2 Códigos de denegación

| Código                                | Condición y efecto                                                                       |
| ------------------------------------- | ---------------------------------------------------------------------------------------- |
| `PRINT_AUTH_DENY_MISSING_PERMISSION`  | Falta la clave exacta; no se evalúa por nombre de rol.                                   |
| `PRINT_AUTH_DENY_EFFECTIVE_ACTOR`     | Acción humana sin actor efectivo resoluble o actor inactivo.                             |
| `PRINT_AUTH_DENY_RESOURCE_UNRESOLVED` | Recurso, versión, propietaria, output o relación fuente no resolubles.                   |
| `PRINT_AUTH_DENY_CONTEXT_SCOPE`       | Sede, área, estación, dispositivo, cola, destinatario o territorio incompatibles.        |
| `PRINT_AUTH_DENY_STATE_OR_VERSION`    | Estado o versión no admite la acción.                                                    |
| `PRINT_AUTH_DENY_SEGREGATION`         | Aprobador ausente, no autorizado o igual al solicitante cuando debe ser distinto.        |
| `PRINT_AUTH_DENY_RESULT_UNKNOWN`      | Existe efecto posible no conciliado; bloquea retry y reimpresión.                        |
| `PRINT_AUTH_DENY_TECHNICAL_PRINCIPAL` | Dispositivo o servicio intenta crear autoridad empresarial, aprobar o ampliar una copia. |

Una denegación no libera identidad, no modifica la cola, no crea intento y no transforma la acción en contingencia manual.

---

#### 10. Perfiles de alcance

| Perfil            | Recurso y territorio obligatorio                                                              | Restricciones adicionales                                                                  |
| ----------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `SCOPE-LABEL`     | Recurso exacto, versión, sede, área, estación, destino físico y tipo de etiqueta.             | Coexistencia, disposición y cantidad; una reimpresión no crea identidad empresarial nueva. |
| `SCOPE-POINT`     | Orden, comanda o solicitud exacta; sede, área, punto y destino original.                      | No puede cambiar la orden ni enviar a otro punto sin reroute autorizado de la misma copia. |
| `SCOPE-CUSTOMER`  | Documento, pedido o beneficio exacto; sede, destinatario y handoff.                           | Imprimir y entregar son hechos separados; destinatario se revalida.                        |
| `SCOPE-FINANCIAL` | Documento/transacción original, identidad económica o fiscal, organización, sede y finalidad. | Doble control, snapshot inmutable y prohibición de crear otra transacción.                 |
| `SCOPE-CASH`      | Caja, turno, cierre/periodo, sede, estación y propósito de control.                           | Doble control y límites de cantidad; no modifica apertura, cierre o valores.               |
| `SCOPE-A4`        | Documento y versión exactos; territorio del recurso, ruta, destino y periodo cuando aplique.  | La política fuente determina aprobación adicional; una ruta central no amplía lectura.     |

---

#### 11. Gates de autorización

| Gate                | Momento                                                 | Regla                                                                                  |
| ------------------- | ------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `GATE-SOURCE`       | Antes de crear la primera copia automática.             | Verificar decisión fuente, output permitido, snapshot, cantidad y delegación.          |
| `GATE-DIRECT`       | Antes de una primera copia manual.                      | Resolver actor, `jobs.create`, recurso, estado, contexto y scope.                      |
| `GATE-REPRINT`      | Antes de admitir una copia adicional.                   | Resolver original, causa, cantidad, `reprints.request`, aprobación y resultado previo. |
| `GATE-JOB-ACTION`   | Antes de view/cancel/retry/reconcile.                   | Evaluar permiso exacto, trabajo, estado, versión, evidencia y alcance.                 |
| `GATE-PRE-DISPATCH` | Justo antes de `SEND_STARTED`.                          | Revalidar vigencia, cancelación, expiración, contexto, ruta, salud y denegaciones.     |
| `GATE-ADMIN`        | Antes de cambiar impresora, plantilla, ruta o política. | Exigir recurso administrativo, versión, permiso, alcance, online y auditoría.          |

Si el gate no puede resolver un dato obligatorio, el resultado es `DENY` o `INDETERMINATE` de simulación; nunca `ALLOW` por default.

---

#### 12. Separación entre acciones

| Acción solicitada          | Permiso aplicable                                    | Identidad de copia          | Afirmación prohibida                                                 |
| -------------------------- | ---------------------------------------------------- | --------------------------- | -------------------------------------------------------------------- |
| Primera copia automática   | Decisión fuente delegada.                            | Nueva copia original.       | Que el worker tiene autoridad empresarial propia.                    |
| Primera copia manual       | `jobs.create`.                                       | Nueva copia original.       | Que `jobs.view` o la pantalla autorizan imprimir.                    |
| Retry                      | `jobs.retry`.                                        | Conserva la misma copia.    | Que es una reimpresión o copia adicional.                            |
| Reimpresión                | `reprints.request` y, si aplica, `reprints.approve`. | Crea copia nueva vinculada. | Que un timeout, fallo o callback perdido es causa suficiente.        |
| Cancelación técnica        | `jobs.cancel`.                                       | No crea copia.              | Que cancela venta, pago, documento o proceso fuente.                 |
| Conciliación               | `jobs.reconcile`.                                    | Conserva historia y copia.  | Que permite editar evidencia o escoger arbitrariamente el resultado. |
| Configuración de impresora | `printers.update`.                                   | No aplica.                  | Que permite imprimir o consultar payload.                            |
| Configuración de routing   | `routing_policies.update`.                           | No aplica.                  | Que permite cambiar un trabajo congelado sin transición.             |
| Configuración de plantilla | `templates.update`.                                  | No aplica.                  | Que permite acceder a todos los datos utilizados por la plantilla.   |

---

#### 13. Matriz materializada de las cincuenta salidas

Para toda fila, la primera copia se autoriza mediante `PAUTH-SOURCE-DELEGATED` o, cuando existe una acción manual legítima, `PAUTH-DIRECT-OPERATIONAL`. La columna de reimpresión materializa la autoridad adicional específica; ningún perfil sustituye la autorización del recurso fuente.

| Salida       | Nombre                                                    | Propietaria | Autoridad de primera copia | Perfil de reimpresión       | Scope             | Resultado o bloqueo vigente                                    |
| ------------ | --------------------------------------------------------- | ----------- | -------------------------- | --------------------------- | ----------------- | -------------------------------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | `ORIGO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-LABEL`     | `ESPECIFICADO / BLOQUEADO_ZD230_SIN_CANAL`                     |
| `IMP-CMD-01` | Comanda de cocina                                         | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-02` | Comanda de bar de bebidas frías                           | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes             | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-04` | Comanda de preparación o mise en place                    | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL; VP_BLOQUEADO_SIN_80MM` |
| `IMP-CMD-05` | Tiquete de expedición o recogida                          | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-06` | Solicitud interna de reposición                           | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL; VP_BLOQUEADO_SIN_80MM` |
| `IMP-CMD-07` | Modificación o adición de comanda                         | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-08` | Cancelación o anulación de comanda                        | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL`                        |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia                 | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-OPERATIONAL` | `SCOPE-POINT`     | `ESPECIFICADO / MISMO_DESTINO_ORIGINAL; VP_BLOQUEADO_SIN_80MM` |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                         | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-CUSTOMER`  | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-02` | Confirmación de pedido                                    | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-CUSTOMER`  | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-03` | Comprobante de pago                                       | `NUMERA`    | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-DUAL`        | `SCOPE-FINANCIAL` | `ESPECIFICADO / HANDOFF_REVALIDADO`                            |
| `IMP-CLI-04` | Factura o comprobante de venta para cliente               | `NUMERA`    | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-DUAL`        | `SCOPE-FINANCIAL` | `ESPECIFICADO / HANDOFF_REVALIDADO`                            |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito      | `NUMERA`    | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-DUAL`        | `SCOPE-FINANCIAL` | `ESPECIFICADO / HANDOFF_REVALIDADO`                            |
| `IMP-CLI-06` | Resumen de recogida o entrega                             | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-CUSTOMER`  | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                         | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-CUSTOMER`  | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                     | `PULSO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-CUSTOMER`  | `ESPECIFICADO / ENTREGA_SEPARADA`                              |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja         | `NUMERA`    | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-DUAL`        | `SCOPE-CASH`      | `ESPECIFICADO / CONTROL_LOCAL`                                 |
| `IMP-DOC-01` | Remisión o nota de despacho                               | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-02` | Manifiesto de traslado interno                            | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-03` | Hoja de conteo de inventario                              | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario            | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-05` | Orden de compra                                           | `ORIGO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-06` | Acta o comprobante de recepción                           | `ORIGO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-07` | Devolución a proveedor                                    | `ORIGO`     | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-08` | Orden de producción o ficha de lote                       | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica                     | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-10` | Registro de calidad o no conformidad                      | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-11` | Orden de mantenimiento                                    | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo          | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico                    | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo       | `FOGO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación              | `NUMERA`    | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-DUAL`        | `SCOPE-FINANCIAL` | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales           | `NEXO`      | `SOURCE_OR_DIRECT`         | `PAUTH-REPRINT-CONTROLLED`  | `SCOPE-A4`        | `ESPECIFICADO / SEGÚN_RUTA; VP_MANTENIMIENTO`                  |

##### 13.1 Reconciliación cuantitativa

| Grupo                           | Esperadas | Materializadas | Faltantes | Duplicadas |
| ------------------------------- | --------: | -------------: | --------: | ---------: |
| Etiquetas `IMP-LBL-*`           |        16 |             16 |         0 |          0 |
| Comandas y tiquetes `IMP-CMD-*` |         9 |              9 |         0 |          0 |
| Comprobantes `IMP-CLI-*`        |         9 |              9 |         0 |          0 |
| Documentos `IMP-DOC-*`          |        16 |             16 |         0 |          0 |
| **Total**                       |    **50** |         **50** |     **0** |      **0** |

| Propietaria | Esperadas | Materializadas | Diferencia |
| ----------- | --------: | -------------: | ---------: |
| FOGO        |        15 |             15 |          0 |
| NEXO        |        14 |             14 |          0 |
| PULSO       |        12 |             12 |          0 |
| NUMERA      |         5 |              5 |          0 |
| ORIGO       |         4 |              4 |          0 |
| **Total**   |    **50** |         **50** |      **0** |

| Perfil de reimpresión       | Salidas |
| --------------------------- | ------: |
| `PAUTH-REPRINT-OPERATIONAL` |       9 |
| `PAUTH-REPRINT-CONTROLLED`  |      36 |
| `PAUTH-REPRINT-DUAL`        |       5 |
| **Total**                   |  **50** |

`PAUTH-SOURCE-DELEGATED`, `PAUTH-DIRECT-OPERATIONAL`, `PAUTH-QUEUE-OPERATOR`, `PAUTH-SERVICE-ADMIN` y `PAUTH-AUDITOR` operan por acción; no sustituyen el perfil de reimpresión ni agregan filas.

---

#### 14. Principales casos de decisión

| Caso                                                                            | Resultado obligatorio                                                                                      |
| ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Proceso autorizado emite su output previsto con snapshot y cantidad congelados. | `ALLOW_SOURCE_DELEGATED_JOB`; el worker usa delegación mínima.                                             |
| Usuario abre la pantalla de impresión sin `jobs.create`.                        | `DENY_MISSING_PERMISSION`; la visibilidad no autoriza.                                                     |
| Usuario con `jobs.view` intenta imprimir.                                       | Denegar; lectura no implica creación.                                                                      |
| Operador solicita retry de un fallo retryable conocido.                         | Evaluar `jobs.retry`; conservar la misma copia.                                                            |
| Operador intenta retry con `RESULT_UNKNOWN`.                                    | `DENY_RESULT_UNKNOWN`; exigir conciliación.                                                                |
| Actor solicita reimpresión con original conciliado, causa y scope válidos.      | Evaluar `reprints.request` y el perfil aplicable.                                                          |
| Solicitud dual aprobada por el mismo actor.                                     | `DENY_SEGREGATION`.                                                                                        |
| Administrador de impresoras intenta reimprimir.                                 | Denegar si no posee `reprints.request` y autoridad fuente.                                                 |
| Servicio técnico intenta aumentar `authorized_copy_count`.                      | `DENY_TECHNICAL_PRINCIPAL`.                                                                                |
| Cambio de routing durante un job congelado.                                     | Usar transición/reroute gobernado; `routing_policies.update` no reescribe el job.                          |
| Evidencia tardía resuelve una impresión antes incierta.                         | Conciliar con `jobs.reconcile`; conservar historia y bloquear copia nueva hasta cerrar.                    |
| Dispositivo compartido pierde actor humano.                                     | Ocultar y denegar acciones empresariales; el principal técnico solo conserva capacidades técnicas mínimas. |

---

#### 15. Auditoría y minimización

Toda decisión y acción conserva:

- permiso exacto solicitado y versión del catálogo;
- principal autenticado, actor efectivo y delegación cuando exista;
- carril base, operativo o técnico;
- recurso, versión, propietaria, output, job, copia y solicitud de reimpresión;
- resolución de organización, sede, área, estación, dispositivo, cola, destinatario y ruta aplicables;
- decisión fuente y snapshot cuando la primera copia sea delegada;
- solicitud, aprobador y segregación de reimpresión;
- estado leído, versión, gate, resultado y códigos de razón;
- correlación, causalidad, vigencia y evento de auditoría.

La auditoría no copia por defecto payload, documento, firma, credencial, PIN, PII o contenido completo. La política detallada de campos, máscaras y retención corresponde a `PRINT-ARC-016`.

---

#### 16. Diagnóstico del código vigente

La superficie vigente de NEXO conserva una cola de texto en `localStorage`, una bandera cliente de habilitación y envío directo mediante BrowserPrint. No se observa allí una decisión de autorización canónica en servidor, identidad autoritativa de trabajo, separación de permisos, aprobación de reimpresión, principal técnico limitado ni auditoría append-only.

El callback de `device.send` solo actualiza un mensaje de interfaz. No constituye autorización ni evidencia física suficiente. Este diagnóstico no modifica código ni afirma que el contrato esté implementado.

---

#### 17. Bloqueos y carryovers con propietario

| ID                  | Brecha                                                                                                             | Propietario                                                                                                                                    | Condición de salida                                                                                                                                           |
| ------------------- | ------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BLK-PRINT-015-001` | Las doce capacidades objetivo nuevas no están materializadas en catálogo runtime, aliases, tipos ni migraciones.   | Proceso canónico de catálogo `AUTH-CAT-017` a `AUTH-CAT-019`, contratos compartidos y `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`. | Catálogo versionado contiene las claves, migración desde `vento-shell`, aliases seguros, tipos y consumidores pasan pruebas de paridad sin ampliar autoridad. |
| `BLK-PRINT-015-002` | La superficie actual envía desde cliente sin gate autoritativo de impresión.                                       | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete propietario del servicio.                                                    | API/servicio evalúa `VENTO-PRINT-AUTHORIZATION`, persiste decisión, aplica gates y prueba denegaciones antes de crear o despachar jobs.                       |
| `BLK-PRINT-015-003` | No existe principal de servicio limitado y delegación verificable para despacho.                                   | Paquete de identidad técnica, dispositivos compartidos y servicio de impresión.                                                                | Principal técnico separado, credencial revocable, scope mínimo, delegación vinculada a job y pruebas de intento de escalamiento.                              |
| `BLK-PRINT-015-004` | Cola operativa, conciliación y configuración técnica no tienen superficies separadas implementadas.                | Paquete NEXO de impresión y contratos de pantallas `VSCREEN-0144`/`VSCREEN-0177`.                                                              | Acciones de cola consumen permisos de job; configuración consume permisos de impresora/routing/plantilla; pruebas impiden cruces.                             |
| `BLK-PRINT-015-005` | No existe flujo ejecutable de aprobación separada para `PAUTH-REPRINT-DUAL`.                                       | Motor canónico de autorización, paquete de impresión y aplicación propietaria del recurso.                                                     | Solicitud y aprobación persisten actores distintos, versiones, scope y decisión atómica; pruebas bloquean autoaprobación y carreras.                          |
| `BLK-PRINT-015-006` | Los campos sensibles, PII, máscaras, custodia, retención y disposición por tipo de output no están especializados. | `PRINT-ARC-016`.                                                                                                                               | Matriz aprobada de sensibilidad por las cincuenta salidas, field policies, ocultamiento, evidencia, retención y disposición.                                  |
| `BLK-PRINT-015-007` | La autoridad en operación offline y contingencia manual aún no está definida.                                      | `PRINT-ARC-017`.                                                                                                                               | Política aprobada de capacidades offline, actor, dispositivo, vigencia, revalidación, sincronización, formularios y conciliación.                             |
| `BLK-PRINT-015-008` | Adaptadores, receipts y hardware representativo no han probado los gates físicos.                                  | `PRINT-ARC-018`, `PRINT-ARC-020` y paquete de implementación.                                                                                  | Adaptadores implementados, receipts tipados, fallas inyectadas, pruebas de autorización y evidencia física correlacionada en piloto.                          |

Ningún carryover concede permiso provisional ni inicia por sí mismo su tarea propietaria.

---

#### 18. Cobertura canónica de prueba existente

La decisión consume requisitos vigentes que ya protegen:

- `TREQ-PROC-444`, separación entre configuración, cola, comando, efecto, resultado desconocido y conciliación;
- `TREQ-PROC-445`, routing por política de recurso y territorio, no por IP o última impresora;
- `TREQ-PROC-446`, identidad del job y reimpresión con razón y actor;
- `TREQ-PROC-479`, observabilidad de destino, cola, idempotencia, reimpresión y conciliación;
- `TREQ-PROC-764`, autorización, privacidad, correlación y prevención de duplicados en copias y routing;
- `TREQ-UX-941`, separación entre acciones operativas de cola y configuración de impresoras;
- `TREQ-UX-1301`, autoridad propia para reimpresión;
- `TREQ-NEXO-005`, conservación del trabajo hasta conocer el resultado y prevención de pérdida o duplicado.

Esta tarea especializa esos comportamientos para el servicio de impresión sin cambiar alcance, estado, propietario ni evidencia exigida.

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro canónico vigente ya protege autorización exacta, separación de funciones, autoridad propia de reimpresión, operación de cola, administración técnica, resultado desconocido, correlación, auditoría y prevención de duplicados. La tarea define la especialización documental y el catálogo objetivo de capacidades sin modificar comportamiento ejecutable ni el estado de los requisitos. Crea 0, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0 requisitos.

---

#### 20. Criterios de aceptación

`PRINT-ARC-015` queda documentalmente satisfecha cuando:

- [x] existe un contrato versionado de autorización de impresión;
- [x] autoridad empresarial, acción física y administración técnica están separadas;
- [x] se materializan catorce claves objetivo sin permisos amplios `manage`;
- [x] se conservan las dos claves canónicas existentes sin reinterpretarlas;
- [x] impresión original automática y manual tienen gates diferentes;
- [x] retry y reimpresión consumen permisos distintos y conservan identidades correctas;
- [x] resultado desconocido bloquea retry manual y reimpresión;
- [x] existe segregación obligatoria para cinco salidas financieras, fiscales o de caja;
- [x] la cola operativa no administra dispositivos, rutas o plantillas;
- [x] el principal técnico no crea autoridad empresarial;
- [x] cada una de las cincuenta salidas tiene perfil y scope explícitos;
- [x] los totales, familias y propietarias heredados concilian sin diferencias;
- [x] todos los bloqueos tienen propietario y condición de salida;
- [x] privacidad y PII permanecen reservadas para `PRINT-ARC-016`;
- [x] no se declara código, migración, Supabase, asignación de rol, despliegue ni evidencia física ejecutados.

---

#### 21. Handoff cerrado hacia `PRINT-ARC-016`

`PRINT-ARC-016` recibe:

- `VENTO-PRINT-AUTHORIZATION` `1.0.0`;
- catorce claves objetivo, con dos existentes y doce pendientes de materialización;
- tres planos de autoridad;
- ocho perfiles de autorización;
- seis perfiles de scope;
- diez decisiones positivas y ocho denegaciones;
- matriz completa de cincuenta salidas;
- los permisos separados de evidencia y auditoría;
- el bloqueo `BLK-PRINT-015-006` para especializar campos sensibles, PII, máscaras, custodia, retención y disposición.

`PRINT-ARC-016` permanece reservada. La aprobación de esta tarea no la inicia, desarrolla ni modifica.


### ✅ PRINT-ARC-016 — Definir privacidad y ocultamiento de datos sensibles

**Estado:** APROBADA  
**Tarea anterior:** `PRINT-ARC-015 — Definir permisos de impresión, reimpresión y administración` — APROBADA  
**Tarea siguiente:** `PRINT-ARC-017 — Definir operación offline y contingencia manual` — RESERVADA  
**Tipo de tarea:** documental; privacidad, minimización, ocultamiento, retención y tratamiento de datos sensibles en impresión  
**Repositorio propietario:** `vento-shell`  
**Implementación física autorizada:** ninguna; no crea código, migraciones, cambios de Supabase, adaptadores ni despliegues

**Qué se hace:** definir el contrato canónico que limita qué datos pueden incorporarse a cada salida física, cómo deben minimizarse u ocultarse antes del renderizado y qué evidencias pueden conservarse sin exponer contenido protegido.

---

#### 1. Propósito y alcance

Esta tarea define el contrato documental de privacidad aplicable a la preparación, renderizado, encolado, envío, confirmación, reimpresión, evidencia, observabilidad, soporte y disposición de las 50 salidas físicas canónicas del servicio transversal de impresión. No implementa código, migraciones, adaptadores ni cambios en Supabase.

El contrato resultante se denomina `VENTO-PRINT-PRIVACY` y queda aprobado en versión `1.0.0`. Hereda sin reemplazar `VENTO-PRINT-JOB`, `VENTO-PRINT-IDEMPOTENCY`, `VENTO-PRINT-RETRY-QUEUE`, `VENTO-PRINT-CONFIRMATION`, las reglas de cancelación/expiración, reimpresión y autorización aprobadas en `PRINT-ARC-001` a `PRINT-ARC-015`.

---

#### 2. Corrección de integridad canónica

- `IMP-LBL-06` conserva la propietaria canónica `FOGO`; no pertenece a `NEXO`.
- Las salidas de cliente/caja con propietaria `NUMERA` son `IMP-CLI-03`, `IMP-CLI-04`, `IMP-CLI-05` e `IMP-CLI-09`.
- La distribución materializada es `FOGO=15`, `NEXO=14`, `PULSO=12`, `NUMERA=5`, `ORIGO=4`.
- La nomenclatura documental canónica termina en `IMP-DOC-14` Lista de limpieza, sanitización o control operativo; `IMP-DOC-15` Reporte contable, conciliación o liquidación; `IMP-DOC-16` Resumen de indicadores operativos o gerenciales.

---

#### 3. Principios normativos

- **Minimización antes de renderizar:** solo se incorpora el dato estrictamente necesario para el propósito, destino, copia y actor autorizados.
- **Propósito y contexto vinculantes:** una autorización de lectura no implica autorización de impresión; imprimir exige propósito, salida, sede, destino, dispositivo y copia autorizados.
- **Secretos nunca imprimibles:** contraseñas, tokens, claves privadas, secretos de API, códigos de recuperación, CVV, datos completos de tarjeta y credenciales equivalentes se omiten o bloquean antes del renderizado.
- **Enmascaramiento irreversible en el artefacto:** la versión enviada al adaptador ya debe estar saneada; el dispositivo o el spooler no son una frontera de privacidad.
- **No degradación por reintento, reimpresión u operación offline:** ningún flujo alterno puede recuperar campos omitidos ni relajar la política aplicada.
- **Evidencia mínima:** colas, recibos, auditoría, métricas, errores, capturas y paquetes de soporte conservan referencias, clasificaciones, versiones y huellas, no el contenido sensible completo.
- **Códigos también son datos:** QR, códigos de barras, enlaces y payloads embebidos quedan sujetos a las mismas reglas y no pueden transportar secretos reutilizables.
- **No inferencia por conectividad:** disponibilidad del backend, adaptador o impresora no demuestra que el contenido haya sido tratado de forma privada.
- **Separación entre impresión y entrega:** confirmar impresión no autoriza exposición posterior; la custodia física y entrega aplican una segunda frontera.
- **Bloqueo seguro:** cuando el sistema no puede determinar o aplicar con certeza la política, el trabajo queda `BLOCKED_PRE_DISPATCH`; no se imprime una versión potencialmente excesiva.
- **Sin último escritor gana:** conflictos entre política, autorización, plantilla o snapshot se resuelven por versión autoritativa y regla más restrictiva, nunca por orden de llegada.
- **Registro inmutable de decisión:** la política aplicada, sus reglas, el actor, el propósito y la huella del contenido saneado deben quedar correlacionados con el trabajo y la copia.

---

#### 4. Clasificación de datos

| Clase                      | Descripción                                                                        | Tratamiento por defecto                                           |
| -------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `D0_PUBLIC_OPERATIONAL`    | `Dato operativo sin impacto material de privacidad`                                | `Permitir cuando sea necesario.`                                  |
| `D1_INTERNAL_OPERATIONAL`  | `Ubicaciones, SKU, lotes, estados y referencias internas`                          | `Minimizar y limitar al destino autorizado.`                      |
| `D2_PERSONAL`              | `Nombre, teléfono, correo, dirección, firma, identificador de persona`             | `Enmascarar u omitir salvo necesidad explícita.`                  |
| `D3_FINANCIAL_FISCAL`      | `Importes, saldos, cuentas, referencias de pago o identificación fiscal`           | `Restringir por rol y propósito; truncar o tokenizar.`            |
| `D4_CONFIDENTIAL_BUSINESS` | `Precios, fórmulas, recetas, acuerdos, indicadores o decisiones restringidas`      | `Restringir, agregar u omitir según perfil.`                      |
| `D5_SECURITY_SECRET`       | `Contraseña, token, clave, CVV, secreto de API o credencial`                       | `Bloqueo absoluto; nunca renderizar, registrar ni imprimir.`      |
| `D6_SENSITIVE_EVIDENCE`    | `Adjuntos, capturas, diagnósticos, notas libres o evidencia de incidentes/calidad` | `Sustituir por referencia; depurar antes de cualquier inclusión.` |

---

#### 5. Acciones de política sobre campos

| Acción        | Semántica obligatoria                                                                               |
| ------------- | --------------------------------------------------------------------------------------------------- |
| `ALLOW`       | Campo permitido sin transformación únicamente dentro del propósito aprobado.                        |
| `MINIMIZE`    | Reducir precisión, longitud o granularidad al mínimo útil.                                          |
| `MASK`        | Ocultar parcialmente manteniendo utilidad operacional, por ejemplo teléfono o referencia truncados. |
| `ALIAS`       | Sustituir identidad por rol, iniciales, código o alias autorizado.                                  |
| `AGGREGATE`   | Presentar totales o grupos sin registros fuente individualizados.                                   |
| `TOKENIZE`    | Sustituir el valor por referencia no reversible para el receptor físico.                            |
| `OMIT`        | Excluir el campo del snapshot de renderizado.                                                       |
| `BLOCK_PRINT` | Impedir la admisión o despacho cuando no existe transformación segura y verificable.                |

---

#### 6. Perfiles de privacidad

| Perfil                      | Alcance                                                                                                               |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `PRV-OPS-MINIMAL`           | Operación interna con identificadores de proceso mínimos; excluye identidad de cliente, datos financieros y secretos. |
| `PRV-TRACEABILITY`          | Trazabilidad de lote, movimiento o documento con referencias necesarias y minimización de personas/contactos.         |
| `PRV-CUSTOMER`              | Datos personales limitados al propósito de pedido, recogida o entrega; aplica enmascaramiento por tramo.              |
| `PRV-FINANCIAL`             | Información fiscal, contable o de pago restringida; prohíbe credenciales y datos completos de instrumentos.           |
| `PRV-ASSET-CUSTODY`         | Identificación de activos, estado y custodia; minimiza identidad de custodios y técnicos.                             |
| `PRV-QUALITY-RESTRICTED`    | Calidad, incidentes, fórmulas o evidencia operativa restringida por rol y propósito.                                  |
| `PRV-MANAGEMENT-AGGREGATED` | Indicadores agregados para gestión; impide exposición de registros fuente o personas.                                 |
| `PRV-BLOCKED-SECRETS`       | Bloqueo absoluto cuando el contenido contiene secretos, credenciales o datos que no pueden sanearse con certeza.      |

`PRV-BLOCKED-SECRETS` prevalece sobre cualquier perfil de salida. Una salida normalmente permitida queda bloqueada si su snapshot contiene una clase `D5_SECURITY_SECRET` o si una regla de saneamiento obligatoria no puede ejecutarse o verificarse.

---

#### 7. Snapshot autoritativo de privacidad

Cada trabajo admitido debe vincular un `privacy_snapshot` inmutable con, como mínimo: `privacy_contract_version`, `policy_id`, `policy_version`, `output_id`, `purpose_code`, `tenant_id`, `site_id`, `actor_id_or_alias`, `authorization_decision_id`, `destination_class`, `copy_slot_id`, `field_decisions[]`, `render_digest`, `created_at_authoritative`, `expires_at_if_applicable` y `decision_result`.

La huella cubre exclusivamente el contenido ya saneado. No se permite almacenar una huella como sustituto de aplicar la política, ni conservar el contenido original sensible en dead-letter, telemetría o evidencia para poder “reconstruirlo” después.

##### 7.1 Precedencia y carreras

1. La política se evalúa después de resolver salida, propósito, actor, destino y copia, pero antes de renderizar y persistir el payload despachable.
2. Un cambio de política más restrictivo antes de `SEND_STARTED` invalida el snapshot previo y exige reevaluación o bloqueo.
3. Un cambio menos restrictivo nunca se aplica retroactivamente a un trabajo ya admitido sin nueva intención autorizada.
4. Después de `SEND_STARTED`, la política aplicada permanece registrada; cualquier posible exposición se gestiona como incidente y no se “corrige” mediante reintento ciego.
5. `RESULT_UNKNOWN` conserva el mismo snapshot saneado; la reconciliación no puede consultar ni reinyectar el contenido original.

---

#### 8. Matriz materializada de las 50 salidas

| ID           | Salida canónica                                              | Propietaria | Perfil                      | Datos relevantes                                | Regla de visibilidad                                                                                       | Evidencia y logs                                                      |
| ------------ | ------------------------------------------------------------ | ----------- | --------------------------- | ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `IMP-LBL-01` | `Etiqueta de lote de producto terminado`                     | `FOGO`      | `PRV-TRACEABILITY`          | `Identificadores de lote, fechas, producto`     | `Mostrar identificadores operativos; omitir datos personales no necesarios`                                | `Referencia de trabajo, huella y resultado; nunca contenido completo` |
| `IMP-LBL-02` | `Etiqueta de producto intermedio o semielaborado`            | `FOGO`      | `PRV-TRACEABILITY`          | `Lote, etapa, fechas, producto`                 | `Mostrar trazabilidad mínima; omitir personas salvo rol operativo indispensable`                           | `Referencia de trabajo, huella y resultado`                           |
| `IMP-LBL-03` | `Etiqueta de preparación diaria o mise en place`             | `FOGO`      | `PRV-OPS-MINIMAL`           | `Preparación, fecha, vigencia`                  | `Mostrar preparación y vigencia; usar alias de operador si se exige trazabilidad`                          | `Sin contenido renderizado`                                           |
| `IMP-LBL-04` | `Etiqueta de apertura, fraccionamiento o reempaque`          | `FOGO`      | `PRV-TRACEABILITY`          | `Lote origen, fecha, vigencia`                  | `Mostrar lote y vigencia; minimizar responsable`                                                           | `Referencia y digest verificable`                                     |
| `IMP-LBL-05` | `Etiqueta de alérgenos o manipulación especial`              | `FOGO`      | `PRV-QUALITY-RESTRICTED`    | `Alérgenos, advertencias de salud operacional`  | `Mostrar advertencia necesaria; prohibido incluir diagnósticos o datos clínicos de personas`               | `Evento mínimo y versión de política`                                 |
| `IMP-LBL-06` | `Etiqueta de cuarentena, liberado o rechazado`               | `FOGO`      | `PRV-QUALITY-RESTRICTED`    | `Estado de calidad, lote, decisión`             | `Mostrar estado y lote; minimizar aprobador a rol o alias autorizado`                                      | `Referencia de decisión; no evidencia adjunta`                        |
| `IMP-LBL-07` | `Etiqueta de recepción de materia prima o lote de proveedor` | `ORIGO`     | `PRV-TRACEABILITY`          | `Proveedor, lote, recepción`                    | `Mostrar proveedor comercial y lote; ocultar contactos personales, teléfonos y correos`                    | `Referencia de recepción y huella`                                    |
| `IMP-LBL-08` | `Etiqueta de ubicación, estante, contenedor o zona`          | `NEXO`      | `PRV-OPS-MINIMAL`           | `Ubicación física interna`                      | `Mostrar código de ubicación; omitir información de seguridad o acceso`                                    | `Referencia de ubicación; sin mapa sensible`                          |
| `IMP-LBL-09` | `Etiqueta de artículo, insumo o SKU`                         | `NEXO`      | `PRV-OPS-MINIMAL`           | `SKU, descripción, unidad`                      | `Mostrar datos de inventario; omitir costos y proveedor si no son necesarios`                              | `Referencia de artículo y versión`                                    |
| `IMP-LBL-10` | `Etiqueta de bulto de traslado, remisión o despacho`         | `NEXO`      | `PRV-TRACEABILITY`          | `Remisión, origen, destino, bulto`              | `Mostrar códigos operativos; enmascarar dirección o contacto cuando no sea necesario`                      | `Referencia de movimiento y huella`                                   |
| `IMP-LBL-11` | `Etiqueta de pedido, recogida o entrega a cliente`           | `PULSO`     | `PRV-CUSTOMER`              | `Nombre/contacto/dirección del cliente, pedido` | `Mostrar solo dato imprescindible para entrega; enmascarar teléfono y dirección fuera del tramo logístico` | `Referencia de pedido; nunca contacto completo`                       |
| `IMP-LBL-12` | `Etiqueta de identificación de activo o equipo`              | `NEXO`      | `PRV-ASSET-CUSTODY`         | `Activo, serial, ubicación`                     | `Mostrar código interno; serial completo solo si el propósito lo exige`                                    | `Referencia de activo y versión`                                      |
| `IMP-LBL-13` | `Etiqueta de mantenimiento, inspección o fuera de servicio`  | `NEXO`      | `PRV-ASSET-CUSTODY`         | `Activo, estado, restricción`                   | `Mostrar estado y activo; minimizar técnico o proveedor a rol/alias`                                       | `Referencia de orden; sin notas libres completas`                     |
| `IMP-LBL-14` | `Etiqueta de limpieza o sanitización`                        | `FOGO`      | `PRV-OPS-MINIMAL`           | `Control operativo, fecha`                      | `Mostrar control y vigencia; minimizar responsables`                                                       | `Referencia de control`                                               |
| `IMP-LBL-15` | `Etiqueta de muestra o prueba`                               | `FOGO`      | `PRV-QUALITY-RESTRICTED`    | `Muestra, prueba, lote`                         | `Usar código de muestra; prohibido incorporar datos personales no requeridos`                              | `Referencia de muestra y cadena de custodia mínima`                   |
| `IMP-LBL-16` | `Etiqueta de merma, residuo o disposición`                   | `FOGO`      | `PRV-TRACEABILITY`          | `Tipo, cantidad, disposición`                   | `Mostrar trazabilidad del residuo; omitir personas salvo rol autorizado`                                   | `Referencia de evento y huella`                                       |
| `IMP-CMD-01` | `Comanda de cocina`                                          | `PULSO`     | `PRV-OPS-MINIMAL`           | `Pedido, preparaciones, notas`                  | `Usar número de pedido; omitir nombre, teléfono, dirección y datos de pago`                                | `Referencia de pedido y resultado`                                    |
| `IMP-CMD-02` | `Comanda de bar o bebidas frías`                             | `PULSO`     | `PRV-OPS-MINIMAL`           | `Pedido, bebidas, notas`                        | `Usar número de pedido; omitir datos del cliente y de pago`                                                | `Referencia de pedido y resultado`                                    |
| `IMP-CMD-03` | `Comanda de barra de cafés o bebidas calientes`              | `PULSO`     | `PRV-OPS-MINIMAL`           | `Pedido, bebidas, notas`                        | `Usar número de pedido; omitir datos del cliente y de pago`                                                | `Referencia de pedido y resultado`                                    |
| `IMP-CMD-04` | `Comanda de preparación o mise en place`                     | `FOGO`      | `PRV-OPS-MINIMAL`           | `Preparación, cantidades, turno`                | `Mostrar necesidad operativa; minimizar nombres de personal`                                               | `Referencia de orden interna`                                         |
| `IMP-CMD-05` | `Comanda de expedición o recogida`                           | `PULSO`     | `PRV-CUSTOMER`              | `Pedido, nombre abreviado, canal`               | `Mostrar nombre abreviado o código; contacto solo si es indispensable`                                     | `Referencia de pedido; contacto enmascarado`                          |
| `IMP-CMD-06` | `Comanda de reposición interna`                              | `NEXO`      | `PRV-OPS-MINIMAL`           | `Artículo, cantidad, origen/destino`            | `Mostrar inventario y ubicación; omitir costos y datos personales`                                         | `Referencia de movimiento`                                            |
| `IMP-CMD-07` | `Comanda de modificación o adición`                          | `PULSO`     | `PRV-OPS-MINIMAL`           | `Pedido, cambios, notas`                        | `Mostrar solo cambio operativo; omitir identidad y pago`                                                   | `Referencia de versión del pedido`                                    |
| `IMP-CMD-08` | `Comanda de cancelación o anulación`                         | `PULSO`     | `PRV-OPS-MINIMAL`           | `Pedido, ítems anulados, motivo controlado`     | `Mostrar código de motivo; omitir texto libre sensible y datos del cliente`                                | `Referencia de cancelación y actor autorizado`                        |
| `IMP-CMD-09` | `Comanda de producción por insuficiencia`                    | `FOGO`      | `PRV-OPS-MINIMAL`           | `Producto, cantidad, causa`                     | `Mostrar necesidad productiva; omitir datos comerciales o personales`                                      | `Referencia de necesidad y resultado`                                 |
| `IMP-CLI-01` | `Resumen de cuenta del cliente`                              | `PULSO`     | `PRV-CUSTOMER`              | `Consumos, cliente, mesa/pedido`                | `Mostrar consumos y total; nombre abreviado; nunca credenciales ni datos completos de pago`                | `Referencia de cuenta y huella`                                       |
| `IMP-CLI-02` | `Confirmación de pedido`                                     | `PULSO`     | `PRV-CUSTOMER`              | `Pedido, cliente, entrega`                      | `Mostrar solo identificación y contacto necesarios; enmascarar resto`                                      | `Referencia de pedido; sin payload completo`                          |
| `IMP-CLI-03` | `Comprobante de pago`                                        | `NUMERA`    | `PRV-FINANCIAL`             | `Importe, medio, referencia transaccional`      | `Mostrar referencia truncada; prohibidos PAN completo, CVV, claves, tokens o credenciales`                 | `Referencia financiera tokenizada y huella`                           |
| `IMP-CLI-04` | `Factura o comprobante de venta`                             | `NUMERA`    | `PRV-FINANCIAL`             | `Identificación fiscal, dirección, importes`    | `Mostrar campos fiscales obligatorios según contexto; enmascarar datos no exigidos`                        | `Referencia fiscal y huella; no copia íntegra en logs`                |
| `IMP-CLI-05` | `Devolución, reverso o nota crédito`                         | `NUMERA`    | `PRV-FINANCIAL`             | `Documento origen, importe, motivo`             | `Mostrar referencias e importes; ocultar datos de pago y texto libre sensible`                             | `Referencia financiera y actor autorizado`                            |
| `IMP-CLI-06` | `Confirmación de recogida o entrega`                         | `PULSO`     | `PRV-CUSTOMER`              | `Cliente, contacto, dirección, aceptación`      | `Mostrar solo datos necesarios para el tramo; enmascarar después de entrega`                               | `Referencia de entrega y aceptación mínima`                           |
| `IMP-CLI-07` | `Reserva o anticipo`                                         | `PULSO`     | `PRV-CUSTOMER`              | `Cliente, fecha, anticipo`                      | `Mostrar contacto mínimo y estado; ocultar medio de pago y referencias completas`                          | `Referencia de reserva y pago tokenizada`                             |
| `IMP-CLI-08` | `Vale, cortesía, promoción o beneficio`                      | `PULSO`     | `PRV-CUSTOMER`              | `Código, beneficio, beneficiario`               | `Mostrar código parcial o de un solo uso; no imprimir secretos reutilizables`                              | `Referencia de beneficio; nunca secreto completo`                     |
| `IMP-CLI-09` | `Apertura, cierre o liquidación de caja`                     | `NUMERA`    | `PRV-FINANCIAL`             | `Saldos, movimientos, responsables`             | `Acceso restringido; mostrar cifras autorizadas; minimizar identificadores personales`                     | `Referencia de cierre, huella y autorización`                         |
| `IMP-DOC-01` | `Remisión o nota de despacho`                                | `NEXO`      | `PRV-TRACEABILITY`          | `Origen, destino, artículos, receptor`          | `Mostrar trazabilidad; enmascarar contacto/dirección cuando no sea imprescindible`                         | `Referencia documental y digest`                                      |
| `IMP-DOC-02` | `Manifiesto de traslado interno`                             | `NEXO`      | `PRV-TRACEABILITY`          | `Ubicaciones, artículos, custodios`             | `Mostrar códigos y custodios por alias/rol; omitir datos personales adicionales`                           | `Referencia de traslado y huella`                                     |
| `IMP-DOC-03` | `Hoja de conteo de inventario`                               | `NEXO`      | `PRV-OPS-MINIMAL`           | `Artículos, ubicaciones, cantidades`            | `Mostrar inventario; omitir costos, credenciales y datos personales`                                       | `Referencia de sesión de conteo`                                      |
| `IMP-DOC-04` | `Reporte de diferencias o ajustes de inventario`             | `NEXO`      | `PRV-TRACEABILITY`          | `Diferencias, motivos, responsables`            | `Mostrar hechos y códigos de motivo; restringir notas libres y minimizar actor`                            | `Referencia de ajuste, autorización y huella`                         |
| `IMP-DOC-05` | `Orden de compra`                                            | `ORIGO`     | `PRV-FINANCIAL`             | `Proveedor, precios, condiciones, contactos`    | `Acceso restringido; mostrar contacto comercial necesario; ocultar cuentas bancarias no requeridas`        | `Referencia de orden y versión; sin contenido completo`               |
| `IMP-DOC-06` | `Acta o comprobante de recepción`                            | `ORIGO`     | `PRV-TRACEABILITY`          | `Proveedor, entrega, receptor, hallazgos`       | `Mostrar trazabilidad; minimizar contactos y responsables`                                                 | `Referencia de recepción y huella`                                    |
| `IMP-DOC-07` | `Devolución a proveedor`                                     | `ORIGO`     | `PRV-TRACEABILITY`          | `Proveedor, artículos, motivo, transporte`      | `Mostrar datos comerciales mínimos; enmascarar contactos personales`                                       | `Referencia de devolución y autorización`                             |
| `IMP-DOC-08` | `Orden de producción o ficha de lote`                        | `FOGO`      | `PRV-TRACEABILITY`          | `Receta, lote, cantidades, responsables`        | `Mostrar datos técnicos autorizados; minimizar personal; proteger información propietaria restringida`     | `Referencia de lote, versión y huella`                                |
| `IMP-DOC-09` | `Receta, ficha técnica o guía práctica`                      | `FOGO`      | `PRV-QUALITY-RESTRICTED`    | `Fórmula, proceso, aprobaciones`                | `Restringir por rol; mostrar versión vigente; omitir secretos comerciales fuera del propósito`             | `Referencia de versión y autorización`                                |
| `IMP-DOC-10` | `Registro de calidad o no conformidad`                       | `FOGO`      | `PRV-QUALITY-RESTRICTED`    | `Hallazgo, evidencia, responsables, decisiones` | `Minimizar personas; excluir datos clínicos y adjuntos sensibles; usar referencias`                        | `Referencia de caso y evidencia, no evidencia íntegra`                |
| `IMP-DOC-11` | `Orden de mantenimiento`                                     | `NEXO`      | `PRV-ASSET-CUSTODY`         | `Activo, técnico/proveedor, diagnóstico`        | `Mostrar activo y trabajo; minimizar contacto y notas sensibles`                                           | `Referencia de orden y autorización`                                  |
| `IMP-DOC-12` | `Acta de entrega, devolución o traslado de activo`           | `NEXO`      | `PRV-ASSET-CUSTODY`         | `Activo, custodios, firmas/aceptaciones`        | `Mostrar custodios mínimos y aceptación; ocultar identificadores personales adicionales`                   | `Referencia de acta y aceptación verificable`                         |
| `IMP-DOC-13` | `Reporte de incidente o soporte técnico`                     | `NEXO`      | `PRV-QUALITY-RESTRICTED`    | `Incidente, usuario, evidencia, diagnóstico`    | `Redactar secretos, tokens, correos, teléfonos y datos del usuario; adjuntos solo por referencia`          | `Referencia del incidente; nunca logs o capturas sin depurar`         |
| `IMP-DOC-14` | `Lista de limpieza, sanitización o control operativo`        | `FOGO`      | `PRV-OPS-MINIMAL`           | `Control, área, responsables`                   | `Mostrar control y resultado; responsables por rol/alias cuando sea suficiente`                            | `Referencia de control y versión`                                     |
| `IMP-DOC-15` | `Reporte contable, conciliación o liquidación`               | `NUMERA`    | `PRV-FINANCIAL`             | `Cuentas, saldos, movimientos, aprobadores`     | `Acceso restringido; agregación por defecto; ocultar cuentas, identificadores y referencias no necesarias` | `Referencia de reporte, periodo y huella`                             |
| `IMP-DOC-16` | `Resumen de indicadores operativos o gerenciales`            | `NEXO`      | `PRV-MANAGEMENT-AGGREGATED` | `Indicadores de varias aplicaciones, alertas`   | `Mostrar agregados autorizados; suprimir celdas pequeñas, personas y datos fuente sensibles`               | `Referencia de reporte, fuentes y versión`                            |

**Control de cobertura:** 50 salidas esperadas, 50 materializadas, 50 identificadores únicos, distribución `FOGO=15`, `NEXO=14`, `PULSO=12`, `NUMERA=5`, `ORIGO=4`.

---

#### 9. Reglas transversales por etapa

##### 9.1 Admisión y preparación
- La solicitud debe declarar propósito y perfil esperado; valores libres no autorizan campos adicionales.
- La autorización de `PRINT-ARC-015` se evalúa antes de exponer datos al generador de plantilla.
- Plantillas, datos y reglas deben referenciar versiones compatibles. Una plantilla desconocida o no certificada bloquea el trabajo.
- Los campos libres se consideran `D6_SENSITIVE_EVIDENCE` hasta ser depurados mediante regla explícita.

##### 9.2 Renderizado, spool y adaptadores
- Solo el snapshot saneado puede llegar al motor de renderizado, spooler o adaptador.
- Archivos temporales deben usar almacenamiento protegido y eliminación verificable cuando la plataforma lo permita.
- Nombres de archivo, títulos de trabajo y metadata del spool también se minimizan; no deben revelar cliente, diagnóstico, saldo o secreto.
- El adaptador no puede enriquecer el contenido con datos de origen ni registrar el payload completo.

##### 9.3 Reintentos, reimpresiones y dead-letter
- Todo reintento conserva `job_id`, clave de idempotencia, fingerprint y `privacy_snapshot` aplicable.
- La reimpresión usa la misma política o una más restrictiva. Si el dato ya expiró o la autorización cambió, se bloquea y exige nueva intención.
- Dead-letter conserva metadatos, causas, referencias y digest; nunca el documento o etiqueta sensible íntegros.
- El replay automático queda prohibido si la política expiró, cambió o no puede verificarse.

##### 9.4 Confirmación, entrega y custodia física
- Los recibos de impresión y entrega no incluyen el contenido; identifican trabajo, copia, destino, actor, nivel confirmado y huella.
- Salidas `PRV-CUSTOMER`, `PRV-FINANCIAL`, `PRV-QUALITY-RESTRICTED` y `PRV-ASSET-CUSTODY` no pueden quedar expuestas en bandejas compartidas sin control operativo definido.
- La entrega a una persona no autorizada no se considera confirmación válida y debe abrir incidente.
- Una copia abandonada, defectuosa o sustituida requiere disposición segura; romper, triturar o custodiar según sensibilidad y capacidad local aprobada.

##### 9.5 Observabilidad, soporte y auditoría
- Métricas usan contadores y categorías, no contenido ni identificadores personales directos.
- Mensajes de error no concatenan payloads, notas, direcciones, teléfonos, referencias financieras ni secretos.
- Capturas, exportaciones y paquetes de soporte deben pasar saneamiento explícito antes de salir del entorno autorizado.
- La auditoría registra decisiones `ALLOW/MASK/OMIT/BLOCK_PRINT`, versión de política y actor, sin duplicar valores sensibles.

---

#### 10. Retención y disposición

| Objeto                          | Política aprobada                                                                                                   | Estado de plazo                                 |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| Snapshot renderizado temporal   | Retener solo durante la ventana operativa indispensable; eliminar tras cierre cuando no exista obligación superior. | Duración exacta diferida con dueño explícito.   |
| Registro de trabajo y decisión  | Conservar identificadores, versiones, estado, digest y trazabilidad mínima.                                         | Duración exacta diferida con dueño explícito.   |
| Evidencia de impresión/entrega  | Conservar recibo mínimo correlacionado, sin contenido completo.                                                     | Duración exacta según clase y obligación.       |
| Dead-letter                     | Conservar causa y referencias; prohibido conservar payload sensible íntegro.                                        | Duración exacta diferida.                       |
| Copia física fallida o sobrante | Custodia temporal y destrucción segura proporcional a sensibilidad.                                                 | Procedimiento local pendiente de formalización. |

La ausencia de un plazo definitivo no autoriza retención indefinida. Hasta que exista una tabla aprobada, cada implementación debe usar el menor plazo técnicamente viable y quedar bloqueada para producción si no puede demostrar eliminación o control equivalente.

---

#### 11. Mensajes y límites de interfaz

| Situación                        | Mensaje operativo permitido                                                  | Acción                                                 |
| -------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------ |
| Campo sensible saneado           | `Se ocultaron datos no necesarios para esta impresión.`                      | Continuar con snapshot saneado.                        |
| Secreto detectado                | `Impresión bloqueada: el contenido contiene datos que no pueden imprimirse.` | Corregir origen; no ofrecer “imprimir de todos modos”. |
| Política o autorización expirada | `La autorización o política ya no es válida. Genere una nueva solicitud.`    | Nueva intención autorizada.                            |
| Conflicto de versión             | `La impresión requiere revisión porque cambió la política aplicable.`        | Reevaluar antes de despacho.                           |
| Evidencia insuficiente           | `No se puede verificar el tratamiento seguro del documento.`                 | Bloquear o escalar; no asumir éxito.                   |
| Reimpresión solicitada           | `La reimpresión volverá a aplicar privacidad y autorización vigentes.`       | Evaluar `PRINT-ARC-014` y `PRINT-ARC-015`.             |

La interfaz no debe mostrar el valor que causó un bloqueo de secreto. El detalle técnico queda reducido a clase, regla y referencia de campo, accesible únicamente a soporte autorizado.

---

#### 12. Casos de prueba documentales mínimos

1. Una comanda de cocina con teléfono y dirección del cliente elimina ambos antes del renderizado.
2. Un comprobante de pago con PAN completo o CVV queda bloqueado; no se permite enmascarar después del spool.
3. Una factura conserva solo los datos fiscales exigidos por el contexto y omite datos no requeridos.
4. Una etiqueta de entrega enmascara teléfono y limita dirección al tramo logístico autorizado.
5. Un incidente con token en notas libres se bloquea o depura antes de renderizar; el token no aparece en error ni auditoría.
6. Un reintento utiliza exactamente el mismo snapshot saneado y no consulta el payload original.
7. Una reimpresión posterior a cambio restrictivo de política se reevalúa y no replica automáticamente la copia previa.
8. Un trabajo `RESULT_UNKNOWN` se reconcilia por recibos y digest sin revelar contenido.
9. Una política expirada durante cola bloquea antes de `SEND_STARTED`.
10. Un cambio menos restrictivo no amplía automáticamente un trabajo ya admitido.
11. Un QR con secreto reutilizable activa `PRV-BLOCKED-SECRETS`.
12. Una métrica, captura o paquete de soporte no contiene nombres, teléfonos, direcciones, saldos ni payload completo.
13. Una salida gerencial agrega datos y evita revelar registros fuente o grupos identificables.
14. Una copia financiera abandonada genera incidente y disposición segura, no una confirmación de entrega.
15. La operación offline aplica la misma versión o una más restrictiva y bloquea si no puede verificarla.

---

#### 13. Brechas, responsables y condiciones de salida

| ID                  | Brecha diferida                                                                                         | Dueño documental o de implementación                                                      | Condición de salida                                                                                                                   |
| ------------------- | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `BLK-PRINT-016-001` | `No existe todavía tabla aprobada de plazos exactos por clase de dato y evidencia.`                     | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`                                   | `Matriz aprobada de plazo, base, evento de inicio, suspensión, eliminación y evidencia de borrado.`                                   |
| `BLK-PRINT-016-002` | `El saneamiento previo al renderizado no está implementado de forma verificable para las 50 salidas.`   | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`                                   | `Motor de política versionado, pruebas positivas/negativas por perfil y prueba de que spool/adaptador reciben solo snapshot saneado.` |
| `BLK-PRINT-016-003` | `La capacidad de borrado seguro de temporales, spool y dispositivo no está verificada por canal.`       | `PRINT-ARC-018`                                                                           | `Matriz por adaptador/dispositivo con ubicación de temporales, limpieza, límites y prueba controlada de disposición.`                 |
| `BLK-PRINT-016-004` | `No existe procedimiento físico uniforme para copias sensibles fallidas, sobrantes o abandonadas.`      | `EVID-ARC-001` a `EVID-ARC-010` y `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` | `Procedimiento por sede, responsables, contenedores o destrucción, registro mínimo y auditoría de cumplimiento.`                      |
| `BLK-PRINT-016-005` | `La observabilidad vigente puede no garantizar saneamiento de errores, capturas y paquetes de soporte.` | `PRINT-ARC-019`                                                                           | `Esquema de eventos aprobado, lista de campos permitidos/prohibidos y pruebas de fuga en logs, métricas, alertas y soporte.`          |
| `BLK-PRINT-016-006` | `La frontera offline aún no demuestra vigencia y disponibilidad de políticas sin degradación.`          | `PRINT-ARC-017`                                                                           | `Contrato offline con caché protegida, expiración, verificación de versión y bloqueo seguro cuando la política no sea comprobable.`   |

---

#### 14. Reconciliación con requisitos de prueba

- TREQ creados: `0`.
- TREQ modificados: `0`.
- TREQ diferidos: `0`.
- TREQ descartados: `0`.
- TREQ obsoletos: `0`.
- No se genera copia de `04A`: esta tarea materializa reglas dentro del alcance documental de impresión y entrega sus pruebas a la implementación futura; no altera el registro canónico vigente.

---

#### 15. Entrega a PRINT-ARC-017

`PRINT-ARC-017 — Definir operación offline y contingencia manual` recibe como entradas obligatorias:

- `VENTO-PRINT-PRIVACY 1.0.0`;
- los ocho perfiles de privacidad y la precedencia de `PRV-BLOCKED-SECRETS`;
- la matriz completa de 50 salidas;
- el snapshot autoritativo y sus reglas de carrera;
- la prohibición de degradar privacidad por caché, reconexión, reintento o falta de conectividad;
- la exigencia de bloquear cuando no pueda comprobarse política, autorización, plantilla o expiración;
- `BLK-PRINT-016-006` con su condición de salida.

`PRINT-ARC-017` queda **RESERVADA**. `PRINT-ARC-018`, `PRINT-ARC-019` y `PRINT-ARC-020` conservan sus alcances propios; esta tarea no los desarrolla anticipadamente.

---

#### 16. Cierre

`PRINT-ARC-016` queda documentalmente cerrada con un contrato de privacidad versionado, reglas de minimización y bloqueo, matriz materializada de 50 salidas, controles por etapa, fronteras de evidencia, retención y disposición, casos de prueba y seis brechas con dueño y condición de salida. No se afirma implementación técnica ni cumplimiento operativo actual.

---


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
