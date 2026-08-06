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
13. Los documentos exactos que debe producir cada dispositivo se cerrarán en `PRINT-ARC-003`.

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
| Documento exacto por punto                                          | 9                                              | `RESERVADO`                     | `PRINT-ARC-003`; inventario de documentos materializado.                                 |

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

#### 11. Handoff hacia documentos imprimibles

`PRINT-ARC-003` deberá consumir exactamente estas nueve identidades y definir, por cada una:

- documentos actualmente impresos;
- documentos deseados;
- documento autorizado frente a documento meramente posible;
- proceso empresarial originador;
- aplicación propietaria;
- punto de emisión;
- copia, original o reimpresión;
- necesidad de datos fiscales, operativos, de producción o de trazabilidad.

La capacidad técnica no autoriza un documento. Que una impresora pueda producir texto, códigos o etiquetas no decide qué debe imprimirse.

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
**Tipo de tarea:** documental; inventario materializado del portafolio actual y objetivo de salidas imprimibles, con identidad, propósito, proceso originador previsto, familia de dispositivo, estado, bloqueo y destino documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md`
**Cambios físicos autorizados:** ninguno; no compra, instala, conecta, repara, configura ni prueba impresoras
- Requisitos de prueba creados o modificados: 0

**Qué se hace:** definir qué debe poder imprimir el ecosistema ideal de aplicaciones Vento, incluyendo el uso futuro de la Zebra para todas las familias de etiquetas, las comandas por estación, los comprobantes para clientes y los documentos operativos y administrativos, sin limitar el diseño a los usos actuales.

---

#### 1. Objetivo

Establecer el inventario canónico de salidas imprimibles que deberá soportar el servicio transversal de impresión, separando:

- lo que existe físicamente;
- lo que hoy puede estar siendo impreso sin integración canónica demostrada;
- lo que la solución objetivo deberá generar;
- la familia de dispositivo adecuada para cada salida;
- las capacidades adicionales requeridas para operar el modelo futuro;
- las decisiones que corresponden a tareas posteriores sobre propiedad, plantilla, contrato, enrutamiento, permisos, privacidad, contingencia, adaptadores y piloto.

La tarea no reproduce únicamente la situación actual. Define el portafolio objetivo que deben habilitar las aplicaciones de Vento y conserva como evidencia separada aquello que todavía no está implementado o validado.

---

#### 2. Definiciones canónicas

| Término                       | Definición                                                                                                                                 |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `SALIDA_IMPRIMIBLE`           | Representación física generada a partir de una operación empresarial ya autorizada. Puede ser etiqueta, comanda, comprobante o documento.  |
| `IDENTIDAD_DE_DOCUMENTO`      | Código estable asignado en esta tarea a una clase de salida imprimible. No equivale a plantilla, versión ni trabajo de impresión.          |
| `PORTAFOLIO_OBJETIVO`         | Conjunto completo de salidas que el ecosistema ideal deberá poder producir, aunque hoy no exista integración o dispositivo activo.         |
| `SITUACION_ACTUAL`            | Evidencia disponible sobre la impresión vigente. La ausencia de evidencia no se convierte en afirmación de implementación.                 |
| `DOMINIO_ORIGINADOR_PREVISTO` | Dominio funcional que probablemente origina la operación. La propiedad canónica de aplicación se decide exclusivamente en `PRINT-ARC-004`. |
| `FAMILIA_DE_SALIDA`           | `ETIQUETA`, `COMANDA`, `CLIENTE_CAJA` o `DOCUMENTO_A4`.                                                                                    |
| `CAPACIDAD_ADICIONAL`         | Recurso físico todavía inexistente o no incorporado al inventario aprobado, pero requerido por el modelo objetivo.                         |
| `ESPECIFICADO`                | La identidad, propósito y destino técnico objetivo quedan definidos documentalmente; no implica implementación.                            |
| `IMPLEMENTADO`                | Existe integración técnica materializada. Esta tarea no atribuye este estado sin evidencia técnica.                                        |
| `VALIDADO`                    | Existe prueba operativa o física verificable. Esta tarea no atribuye este estado.                                                          |
| `BLOQUEADO`                   | La ejecución física objetivo depende de un insumo concreto todavía no disponible.                                                          |
| `PENDIENTE_DE_EVIDENCIA`      | Puede existir uso actual, pero no hay evidencia suficiente para declararlo implementado o validado.                                        |

Regla obligatoria:

```text
DOCUMENTO INVENTARIADO
≠
PLANTILLA APROBADA
≠
APLICACION PROPIETARIA
≠
TRABAJO DE IMPRESION IMPLEMENTADO
≠
IMPRESION FISICA VALIDADA
```

---

#### 3. Alcance y límites

Esta tarea:

- inventaría todas las clases de salida objetivo identificadas para producción, inventario, activos, compras, ventas, caja, servicio, calidad, mantenimiento y administración;
- asigna una identidad estable a cada salida;
- define su propósito y proceso originador previsto;
- indica la familia de impresora adecuada;
- distingue situación actual y estado objetivo;
- materializa la necesidad de dos puntos térmicos adicionales para resúmenes de cuenta y comprobantes de clientes en Vento Café;
- conserva las nueve impresoras aprobadas en `PRINT-ARC-001` y perfiladas en `PRINT-ARC-002`;
- registra bloqueo, propietario documental y condición de salida para cada brecha.

Esta tarea no:

- decide la aplicación propietaria definitiva;
- define campos, diseño, tamaño exacto, versión, marca gráfica o idioma de cada plantilla;
- autoriza operaciones empresariales;
- define cuándo se genera cada trabajo;
- decide impresora principal, alternativa o fallback;
- configura colas, IP, controladores, adaptadores o puertos;
- ejecuta compras, mantenimiento, instalación o pruebas físicas;
- define permisos, privacidad, retención, reimpresión o contingencia;
- modifica código, configuración, datos, migraciones o Supabase.

Esas decisiones permanecen en las tareas `PRINT-ARC-004` a `PRINT-ARC-020` según su alcance canónico.

---

#### 4. Decisiones

1. El servicio de impresión se diseña sobre un portafolio objetivo y no sobre la fotografía operativa actual.
2. La Zebra ZD230 queda destinada como plataforma principal de etiquetas para producción, inventario, logística, activos, mantenimiento, calidad y pedidos, una vez sea desplegada y validada.
3. Las seis DIG-E200I existentes constituyen la base de comandas y comprobantes térmicos de 80 mm.
4. Las impresoras de barra, bar y cocina de Vento Café se orientan a comandas por estación.
5. Las impresoras de caja de Molka, Saudo y Vento Café se orientan a salidas de cliente y caja, sin impedir que el enrutamiento posterior defina usos auxiliares autorizados.
6. Vento Café requiere dos puntos térmicos adicionales para entregar resúmenes de cuenta, comprobantes y copias de atención al cliente sin depender de una sola impresora de caja.
7. Las dos capacidades adicionales no se presentan como equipos existentes; su ubicación exacta, modelo, compra, conexión y alta en inventario son prerrequisitos del piloto.
8. La Epson L4260 de oficina se orienta a documentación administrativa y operativa A4.
9. La Epson L5590 del Centro de Producción se orienta a documentación A4 de producción, calidad, recepción y despacho una vez sea reparada y validada.
10. Ninguna salida se considera implementada o validada por quedar inventariada.
11. `PRINT-ARC-004` deberá decidir la aplicación propietaria de cada identidad sin alterar el inventario aquí aprobado, salvo corrección explícita.
12. `PRINT-ARC-005` deberá decidir plantilla, versión, tamaño y datos requeridos por identidad.

---

#### 5. Inventario materializado de salidas imprimibles

##### 5.1 Etiquetas objetivo

Las dieciséis identidades de esta familia se orientan principalmente a la Zebra ZD230. Su ejecución permanece `BLOQUEADO` hasta que el equipo sea desplegado, conectado mediante el adaptador definido en `PRINT-ARC-018` y validado en `PRINT-ARC-020`.

| ID           | Salida imprimible                                         | Propósito objetivo                                                      | Dominio originador previsto | Proceso relacionado                | Dispositivo o familia objetivo | Situación actual                                                     | Estado objetivo / destino                                                                                                           |
| ------------ | --------------------------------------------------------- | ----------------------------------------------------------------------- | --------------------------- | ---------------------------------- | ------------------------------ | -------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `IMP-LBL-01` | Etiqueta de lote de producto terminado                    | Identificar producto, lote, fecha, vencimiento y trazabilidad de salida | FOGO / NEXO                 | VPROC-0034, VPROC-0035, VPROC-0024 | Zebra ZD230                    | La Zebra está almacenada y no existe integración canónica demostrada | `ESPECIFICADO`; ejecución física `BLOQUEADA`; propiedad en `PRINT-ARC-004`, plantilla en `PRINT-ARC-005`, piloto en `PRINT-ARC-020` |
| `IMP-LBL-02` | Etiqueta de lote de producto intermedio o semielaborado   | Mantener identidad y trazabilidad entre etapas de producción            | FOGO / NEXO                 | VPROC-0034, VPROC-0024             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; mismas condiciones de salida de la familia                                            |
| `IMP-LBL-03` | Etiqueta de preparación diaria o mise en place            | Identificar preparación, responsable, fecha y ventana de uso            | FOGO                        | VPROC-0033, VPROC-0034, VPROC-0035 | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; plantilla y datos en `PRINT-ARC-005`                                                  |
| `IMP-LBL-04` | Etiqueta de apertura, fraccionamiento o reempaque         | Registrar apertura, reempaque y nueva condición de conservación         | FOGO / NEXO                 | VPROC-0034, VPROC-0037, VPROC-0024 | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; regla de generación en tareas de contrato y enrutamiento                              |
| `IMP-LBL-05` | Etiqueta de alérgenos y manipulación especial             | Advertir riesgos, restricciones y condiciones de uso                    | FOGO                        | VPROC-0033, VPROC-0038             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; datos sensibles y advertencias en `PRINT-ARC-005` y `PRINT-ARC-016`                   |
| `IMP-LBL-06` | Etiqueta de cuarentena, liberado o rechazado              | Evidenciar estado de calidad y evitar uso no autorizado                 | FOGO / NEXO                 | VPROC-0038, VPROC-0024             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; permisos y estado autorizado en `PRINT-ARC-015`                                       |
| `IMP-LBL-07` | Etiqueta de recepción de materia prima o lote proveedor   | Vincular recepción, proveedor, lote, fecha y condición                  | ORIGO / NEXO                | VPROC-0012, VPROC-0021, VPROC-0037 | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; propiedad en `PRINT-ARC-004`                                                          |
| `IMP-LBL-08` | Etiqueta de ubicación, estante, contenedor o zona         | Identificar ubicaciones físicas para inventario y reposición            | NEXO                        | VPROC-0021, VPROC-0023             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; códigos y tamaño en `PRINT-ARC-005`                                                   |
| `IMP-LBL-09` | Etiqueta de artículo, insumo o SKU                        | Identificar unidad logística o referencia de inventario                 | NEXO                        | VPROC-0021, VPROC-0023             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; contrato de datos en `PRINT-ARC-005` y `PRINT-ARC-006`                                |
| `IMP-LBL-10` | Etiqueta de bulto para traslado, remisión o despacho      | Vincular paquete físico con traslado o remisión autorizada              | NEXO                        | VPROC-0021                         | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; enrutamiento por sede en `PRINT-ARC-007`                                              |
| `IMP-LBL-11` | Etiqueta de pedido, recogida o entrega a cliente          | Identificar paquete, orden y condición de entrega                       | PULSO / NEXO                | VPROC-0018, VPROC-0021             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; privacidad en `PRINT-ARC-016`                                                         |
| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | Asignar identidad física visible y código escaneable a equipos          | NEXO                        | VPROC-0022, VPROC-0057             | Zebra ZD230                    | No existe impresión canónica demostrada para activos                 | `ESPECIFICADO`; ejecución física `BLOQUEADA`; datos mínimos en `PRINT-ARC-005`                                                      |
| `IMP-LBL-13` | Etiqueta de mantenimiento, inspección o fuera de servicio | Mostrar estado técnico y restricción de uso del equipo                  | NEXO                        | VPROC-0022, VPROC-0057             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; permisos y vigencia en `PRINT-ARC-015` y `PRINT-ARC-005`                              |
| `IMP-LBL-14` | Etiqueta de limpieza o sanitización                       | Mostrar estado, fecha, responsable y próxima intervención               | FOGO / NEXO                 | VPROC-0036, VPROC-0038             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; plantilla en `PRINT-ARC-005`                                                          |
| `IMP-LBL-15` | Etiqueta de muestra o prueba                              | Mantener identidad y cadena de trazabilidad de muestras                 | FOGO / NEXO                 | VPROC-0038, VPROC-0024             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; privacidad y retención en `PRINT-ARC-016`                                             |
| `IMP-LBL-16` | Etiqueta de merma, residuo o disposición                  | Identificar material retirado, causa y destino                          | FOGO / NEXO                 | VPROC-0036, VPROC-0024             | Zebra ZD230                    | Sin impresión integrada verificada                                   | `ESPECIFICADO`; ejecución física `BLOQUEADA`; datos y autorización en tareas posteriores                                            |

##### 5.2 Comandas y tiquetes operativos objetivo

Las nueve identidades de esta familia se orientan a las DIG-E200I de cocina, bar, barra, caja o apoyo según la regla que se apruebe en `PRINT-ARC-007`. La presencia física de impresoras no demuestra integración con la aplicación.

| ID           | Salida imprimible                             | Propósito objetivo                                                    | Dominio originador previsto | Proceso relacionado    | Punto o familia objetivo                                                           | Situación actual                                                                                                   | Estado objetivo / destino                                                    |
| ------------ | --------------------------------------------- | --------------------------------------------------------------------- | --------------------------- | ---------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------- |
| `IMP-CMD-01` | Comanda de cocina                             | Enviar productos, cantidades, observaciones y prioridad a cocina      | PULSO / FOGO                | VPROC-0035             | DIG-E200I de cocina Vento Café y caja integrada de Molka o Saudo según sede        | En Molka y Saudo la comanda es capacidad deseada; en Vento Café la integración y el contenido no están verificados | `ESPECIFICADO`; contrato en `PRINT-ARC-006`, enrutamiento en `PRINT-ARC-007` |
| `IMP-CMD-02` | Comanda de bar de bebidas frías               | Enviar bebidas y modificaciones al bar                                | PULSO / FOGO                | VPROC-0035             | DIG-E200I de bar Vento Café y caja integrada de Molka o Saudo cuando corresponda   | En Molka y Saudo es capacidad deseada; en Vento Café la integración no está verificada                             | `ESPECIFICADO`; mismas condiciones de la familia                             |
| `IMP-CMD-03` | Comanda de barra de cafés y bebidas calientes | Enviar bebidas calientes, tamaños y personalizaciones                 | PULSO / FOGO                | VPROC-0035             | DIG-E200I de barra Vento Café y caja integrada de Molka o Saudo cuando corresponda | En Molka y Saudo es capacidad deseada; en Vento Café la integración no está verificada                             | `ESPECIFICADO`; mismas condiciones de la familia                             |
| `IMP-CMD-04` | Comanda de preparación o mise en place        | Solicitar producción previa o reposición interna                      | FOGO                        | VPROC-0034, VPROC-0035 | DIG-E200I de cocina o estación autorizada                                          | Uso actual no confirmado                                                                                           | `ESPECIFICADO`; regla y destino en `PRINT-ARC-007`                           |
| `IMP-CMD-05` | Tiquete de expedición o recogida              | Consolidar ítems listos para entrega o retiro                         | PULSO / FOGO                | VPROC-0018, VPROC-0035 | DIG-E200I de expedición o caja                                                     | Uso actual no confirmado                                                                                           | `ESPECIFICADO`; punto definitivo en `PRINT-ARC-007`                          |
| `IMP-CMD-06` | Solicitud interna de reposición               | Pedir insumos o producto a otra estación o almacén                    | FOGO / NEXO                 | VPROC-0021, VPROC-0037 | DIG-E200I de estación receptora                                                    | Uso actual no confirmado                                                                                           | `ESPECIFICADO`; autorización y trazabilidad en tareas posteriores            |
| `IMP-CMD-07` | Modificación o adición de comanda             | Comunicar cambio posterior sin ocultar la versión anterior            | PULSO / FOGO                | VPROC-0035             | Misma estación de la comanda original                                              | No existe evidencia de versionado impreso                                                                          | `ESPECIFICADO`; idempotencia y versión en `PRINT-ARC-010`                    |
| `IMP-CMD-08` | Cancelación o anulación de comanda            | Comunicar cancelación autorizada y auditable                          | PULSO / FOGO                | VPROC-0035             | Misma estación de la comanda original                                              | No existe evidencia de cancelación impresa                                                                         | `ESPECIFICADO`; cancelación en `PRINT-ARC-013`, permisos en `PRINT-ARC-015`  |
| `IMP-CMD-09` | Solicitud de producción por insuficiencia     | Activar producción por faltante detectado en una remisión u operación | NEXO / FOGO                 | VPROC-0021, VPROC-0034 | Estación o Centro de Producción definido por enrutamiento                          | No existe integración de impresión demostrada                                                                      | `ESPECIFICADO`; debe respetar `INT-PROD-005`, contrato en `PRINT-ARC-006`    |

##### 5.3 Comprobantes para clientes y caja objetivo

Las nueve identidades de esta familia deben estar disponibles en Molka, Saudo y Vento Café según el proceso que las origine. En Vento Café, el modelo objetivo requiere dos capacidades térmicas adicionales para atención al cliente, además de la DIG-E200I ya inventariada en caja.

| ID           | Salida imprimible                                    | Propósito objetivo                                                         | Dominio originador previsto | Proceso relacionado                | Punto o familia objetivo                                           | Situación actual                                                                                                                       | Estado objetivo / destino                                                                    |
| ------------ | ---------------------------------------------------- | -------------------------------------------------------------------------- | --------------------------- | ---------------------------------- | ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `IMP-CLI-01` | Resumen de cuenta para el cliente                    | Mostrar consumos, cantidades, descuentos, impuestos y total antes del pago | PULSO / NUMERA              | VPROC-0018, VPROC-0020             | DIG-E200I de caja y dos capacidades adicionales en Vento Café      | Impresión actual no documentada de forma canónica                                                                                      | `ESPECIFICADO`; prioridad del modelo objetivo solicitado por operación                       |
| `IMP-CLI-02` | Confirmación de pedido                               | Entregar resumen de orden, canal, entrega y referencia                     | PULSO                       | VPROC-0018                         | DIG-E200I de caja o punto de atención                              | Uso actual no confirmado                                                                                                               | `ESPECIFICADO`; datos y versión en `PRINT-ARC-005`                                           |
| `IMP-CLI-03` | Comprobante de pago                                  | Confirmar medio, valor, fecha, referencia y estado de pago                 | NUMERA / PULSO              | VPROC-0020, VPROC-0060             | DIG-E200I de caja o punto de atención                              | Uso actual no confirmado                                                                                                               | `ESPECIFICADO`; privacidad y datos fiscales en tareas posteriores                            |
| `IMP-CLI-04` | Representación impresa de factura electrónica        | Entregar copia legible de un documento fiscal ya emitido                   | NUMERA                      | VPROC-0020, VPROC-0060             | DIG-E200I o Epson según formato aprobado                           | La impresión actual de facturas está confirmada en Molka y Saudo; aplicación, plantilla y validez fiscal no se verifican en esta tarea | `ESPECIFICADO`; no sustituye emisión fiscal; plantilla en `PRINT-ARC-005`                    |
| `IMP-CLI-05` | Comprobante de devolución, reverso o nota de crédito | Entregar constancia de ajuste autorizado                                   | NUMERA / PULSO              | VPROC-0020, VPROC-0060             | DIG-E200I de caja                                                  | Uso actual no confirmado                                                                                                               | `ESPECIFICADO`; permisos en `PRINT-ARC-015`                                                  |
| `IMP-CLI-06` | Resumen de recogida o entrega                        | Identificar pedido, receptor, ventana y estado de entrega                  | PULSO / NEXO                | VPROC-0018, VPROC-0021             | DIG-E200I de atención o expedición                                 | Uso actual no confirmado                                                                                                               | `ESPECIFICADO`; privacidad en `PRINT-ARC-016`                                                |
| `IMP-CLI-07` | Comprobante de reserva o anticipo                    | Confirmar reserva, anticipo y saldo esperado                               | PULSO / NUMERA              | VPROC-0018, VPROC-0060             | DIG-E200I de atención                                              | Uso actual no confirmado                                                                                                               | `ESPECIFICADO`; datos y vigencia en `PRINT-ARC-005`                                          |
| `IMP-CLI-08` | Vale, cortesía, promoción o beneficio                | Entregar beneficio autorizado con vigencia y condiciones                   | PULSO                       | VPROC-0018                         | DIG-E200I de atención                                              | Uso actual no confirmado                                                                                                               | `ESPECIFICADO`; autorización y prevención de duplicados en `PRINT-ARC-010` y `PRINT-ARC-015` |
| `IMP-CLI-09` | Resumen de apertura, cierre o liquidación de caja    | Dejar constancia operativa del turno y sus totales                         | NUMERA                      | VPROC-0019, VPROC-0020, VPROC-0060 | DIG-E200I de caja y Epson para copia administrativa cuando aplique | Uso actual no confirmado                                                                                                               | `ESPECIFICADO`; acceso restringido en `PRINT-ARC-015` y privacidad en `PRINT-ARC-016`        |

##### 5.4 Documentos A4 operativos y administrativos objetivo

Las dieciséis identidades de esta familia se orientan a la Epson L4260 de oficina y, para procesos de producción, recepción, calidad y despacho, a la Epson L5590 una vez sea reparada.

| ID           | Salida imprimible                                   | Propósito objetivo                                               | Dominio originador previsto  | Proceso relacionado                | Dispositivo objetivo                       | Situación actual                       | Estado objetivo / destino                                                                  |
| ------------ | --------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------- | ---------------------------------- | ------------------------------------------ | -------------------------------------- | ------------------------------------------------------------------------------------------ |
| `IMP-DOC-01` | Remisión o nota de despacho                         | Acompañar una salida o entrega autorizada                        | NEXO                         | VPROC-0021                         | Epson L5590; L4260 como alternativa futura | Tipos impresos actuales no confirmados | `ESPECIFICADO`; enrutamiento y fallback en `PRINT-ARC-007` y `PRINT-ARC-008`               |
| `IMP-DOC-02` | Manifiesto de traslado interno                      | Consolidar artículos, cantidades, origen, destino y responsables | NEXO                         | VPROC-0021                         | Epson L5590                                | L5590 fuera de servicio                | `ESPECIFICADO`; ejecución física `BLOQUEADA`; mantenimiento y piloto físico                |
| `IMP-DOC-03` | Hoja de conteo de inventario                        | Facilitar conteo controlado y conciliación                       | NEXO                         | VPROC-0021, VPROC-0023             | Epson L4260 o L5590                        | Uso actual no confirmado               | `ESPECIFICADO`; privacidad y versión en tareas posteriores                                 |
| `IMP-DOC-04` | Reporte de diferencias o ajustes de inventario      | Documentar variaciones y aprobación del ajuste                   | NEXO                         | VPROC-0021                         | Epson L4260                                | Uso actual no confirmado               | `ESPECIFICADO`; permisos en `PRINT-ARC-015`                                                |
| `IMP-DOC-05` | Orden de compra                                     | Formalizar compra autorizada para proveedor                      | ORIGO                        | VPROC-0012, VPROC-0069             | Epson L4260                                | Uso actual no confirmado               | `ESPECIFICADO`; propiedad final en `PRINT-ARC-004`                                         |
| `IMP-DOC-06` | Acta o comprobante de recepción                     | Registrar recepción, cantidades, condición y diferencias         | ORIGO / NEXO                 | VPROC-0012, VPROC-0021             | Epson L5590                                | L5590 fuera de servicio                | `ESPECIFICADO`; ejecución física `BLOQUEADA`; reparación y piloto                          |
| `IMP-DOC-07` | Devolución a proveedor                              | Registrar artículos, causa, autorización y entrega               | ORIGO / NEXO                 | VPROC-0012, VPROC-0021             | Epson L4260 o L5590                        | Uso actual no confirmado               | `ESPECIFICADO`; enrutamiento por sede en `PRINT-ARC-007`                                   |
| `IMP-DOC-08` | Orden de producción o ficha de lote                 | Autorizar y documentar una ejecución de producción               | FOGO                         | VPROC-0034, VPROC-0035             | Epson L5590                                | L5590 fuera de servicio                | `ESPECIFICADO`; ejecución física `BLOQUEADA`; reparación y piloto                          |
| `IMP-DOC-09` | Receta, ficha técnica o guía práctica               | Proveer instrucciones versionadas de elaboración                 | FOGO                         | VPROC-0031, VPROC-0032, VPROC-0033 | Epson L5590 o L4260                        | Uso actual no confirmado               | `ESPECIFICADO`; versión y datos en `PRINT-ARC-005`                                         |
| `IMP-DOC-10` | Registro de calidad o no conformidad                | Documentar hallazgo, decisión, responsable y seguimiento         | FOGO / NEXO                  | VPROC-0038, VPROC-0024             | Epson L5590                                | L5590 fuera de servicio                | `ESPECIFICADO`; ejecución física `BLOQUEADA`; mantenimiento y piloto                       |
| `IMP-DOC-11` | Orden de mantenimiento                              | Autorizar diagnóstico, intervención y cierre de un activo        | NEXO                         | VPROC-0022, VPROC-0057             | Epson L4260 o L5590                        | Uso actual no confirmado               | `ESPECIFICADO`; propiedad en `PRINT-ARC-004`                                               |
| `IMP-DOC-12` | Acta de entrega, devolución o traslado de activo    | Evidenciar custodia, condición y ubicación del activo            | NEXO                         | VPROC-0022, VPROC-0057             | Epson L4260                                | Uso actual no confirmado               | `ESPECIFICADO`; firmas y privacidad se deciden después                                     |
| `IMP-DOC-13` | Reporte de incidente o soporte técnico              | Documentar falla, impacto, diagnóstico y resolución              | NEXO / ANIMA                 | VPROC-0039, VPROC-0057             | Epson L4260                                | Uso actual no confirmado               | `ESPECIFICADO`; información sensible en `PRINT-ARC-016`                                    |
| `IMP-DOC-14` | Lista de limpieza, sanitización o control operativo | Guiar y registrar controles periódicos                           | FOGO / NEXO                  | VPROC-0036, VPROC-0038             | Epson L5590                                | L5590 fuera de servicio                | `ESPECIFICADO`; ejecución física `BLOQUEADA`; mantenimiento y plantilla en `PRINT-ARC-005` |
| `IMP-DOC-15` | Reporte contable, conciliación o liquidación        | Presentar información financiera autorizada                      | NUMERA                       | VPROC-0020, VPROC-0060             | Epson L4260                                | Uso actual no confirmado               | `ESPECIFICADO`; permisos y privacidad en `PRINT-ARC-015` y `PRINT-ARC-016`                 |
| `IMP-DOC-16` | Resumen de indicadores operativos o gerenciales     | Facilitar seguimiento y toma de decisiones                       | NUMERA / NEXO / FOGO / PULSO | VPROC-0014, VPROC-0050             | Epson L4260                                | Uso actual no confirmado               | `ESPECIFICADO`; origen y versión se deciden en tareas posteriores                          |

---

#### 6. Reconciliación cuantitativa

##### 6.1 Cobertura del portafolio

| Familia                           | Identidades esperadas | Identidades materializadas | Faltantes | Duplicadas |
| --------------------------------- | --------------------: | -------------------------: | --------: | ---------: |
| Etiquetas                         |                    16 |                         16 |         0 |          0 |
| Comandas y tiquetes operativos    |                     9 |                          9 |         0 |          0 |
| Comprobantes para clientes y caja |                     9 |                          9 |         0 |          0 |
| Documentos A4                     |                    16 |                         16 |         0 |          0 |
| **Total**                         |                **50** |                     **50** |     **0** |      **0** |

##### 6.2 Estado documental y bloqueos físicos

| Estado documental        | Cantidad | Interpretación                                                                                     |
| ------------------------ | -------: | -------------------------------------------------------------------------------------------------- |
| `ESPECIFICADO`           |       50 | Identidad y propósito objetivo definidos; implementación y prueba pertenecen a tareas posteriores. |
| `IMPLEMENTADO`           |        0 | Esta tarea no recibió evidencia técnica suficiente para declarar integración.                      |
| `VALIDADO`               |        0 | Esta tarea no ejecuta pruebas físicas u operativas.                                                |
| **Total del portafolio** |   **50** |                                                                                                    |

| Bloqueo físico asociado                                  | Identidades afectadas | Condición de salida                                                                                                                                           |
| -------------------------------------------------------- | --------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Zebra ZD230 almacenada y sin integración                 |                    16 | Despliegue, adaptador, conexión y piloto aprobados.                                                                                                           |
| Epson L5590 fuera de servicio                            |                     5 | Mantenimiento cerrado y prueba satisfactoria.                                                                                                                 |
| Capacidad adicional de atención al cliente en Vento Café |                     9 | Dos térmicas adicionales incorporadas antes del piloto; las salidas pueden conservar temporalmente el punto de caja existente según el enrutamiento aprobado. |

Una identidad puede estar documentalmente `ESPECIFICADA` y, al mismo tiempo, tener su ejecución física `BLOQUEADA`. Estos ejes no se suman entre sí.

##### 6.3 Cobertura de dispositivos existentes y capacidad futura

| Recurso                     | Estado                               | Portafolio objetivo asociado                                                         | Decisión                                                                                               |
| --------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| Zebra ZD230                 | Existente, almacenada                | 16 etiquetas                                                                         | Debe convertirse en impresora principal de etiquetas tras conexión y piloto.                           |
| Epson L5590                 | Existente, requiere mantenimiento    | 7 documentos A4 de producción, recepción, calidad y despacho                         | Debe repararse antes de declararse disponible.                                                         |
| Epson L4260                 | Existente, operativa por USB y Wi-Fi | Documentos A4 administrativos y alternativa futura                                   | Debe conservar ambas vías y recibir enrutamiento controlado.                                           |
| DIG-E200I Molka caja        | Existente, operativa por USB         | Facturas y comprobantes actuales; comandas del punto integrado en el modelo objetivo | Uso exacto y fallback se decide en `PRINT-ARC-007` y `PRINT-ARC-008`.                                  |
| DIG-E200I Saudo caja        | Existente, operativa por USB         | Facturas y comprobantes actuales; comandas del punto integrado en el modelo objetivo | Uso exacto y fallback se decide en tareas posteriores.                                                 |
| DIG-E200I Vento Café caja   | Existente, operativa por USB         | Comprobantes de cliente y caja de Vento Café                                         | No debe ser el único punto de salida de resúmenes de cuenta.                                           |
| DIG-E200I Vento Café barra  | Existente, operativa por red         | Comandas de cafés y bebidas calientes                                                | Estación objetivo definida; reglas posteriores.                                                        |
| DIG-E200I Vento Café bar    | Existente, operativa por red         | Comandas de bebidas frías                                                            | Estación objetivo definida; reglas posteriores.                                                        |
| DIG-E200I Vento Café cocina | Existente, operativa por red         | Comandas de cocina, preparación y solicitudes internas                               | Estación objetivo definida; reglas posteriores.                                                        |
| `CAPACIDAD-VENTO-CLIENTE-A` | Requerida, no existente              | Resúmenes de cuenta y comprobantes de atención                                       | Debe incorporarse como térmica de 80 mm antes del piloto. Ubicación exacta en `PRINT-ARC-007`.         |
| `CAPACIDAD-VENTO-CLIENTE-B` | Requerida, no existente              | Resúmenes de cuenta y comprobantes de atención                                       | Debe incorporarse como segunda térmica de 80 mm antes del piloto. Ubicación exacta en `PRINT-ARC-007`. |

Reconciliación:

```text
IMPRESORAS EXISTENTES HEREDADAS: 9
IMPRESORAS EXISTENTES MATERIALIZADAS: 9
IDENTIDADES EXISTENTES FALTANTES: 0
IDENTIDADES EXISTENTES DUPLICADAS: 0
CAPACIDADES FISICAS ADICIONALES REQUERIDAS: 2
TOTAL DE PUNTOS DE IMPRESION DEL MODELO OBJETIVO: 11
```

Las dos capacidades adicionales no reciben marca, modelo, serial, conexión ni ubicación física inventados. La condición de salida es que `PRINT-ARC-020` no inicie el piloto de comprobantes de cliente en Vento Café hasta que existan dos equipos térmicos adicionales inventariados, conectados y asociados al enrutamiento aprobado.

---

#### 7. Brechas, responsables y condiciones de salida

| Brecha                                                   | Estado                   | Responsable documental                     | Condición de salida                                                                    |
| -------------------------------------------------------- | ------------------------ | ------------------------------------------ | -------------------------------------------------------------------------------------- |
| Aplicación propietaria de cada una de las 50 identidades | `ESPECIFICADO`           | `PRINT-ARC-004`                            | Cada identidad tiene una aplicación dueña y consumidores definidos.                    |
| Plantilla, versión, tamaño y datos                       | `ESPECIFICADO`           | `PRINT-ARC-005`                            | Cada identidad tiene contrato visual y de datos aprobado.                              |
| Contrato de trabajo de impresión                         | `ESPECIFICADO`           | `PRINT-ARC-006`                            | Cada salida puede convertirse en un trabajo idempotente y auditable.                   |
| Enrutamiento por sede, estación y documento              | `ESPECIFICADO`           | `PRINT-ARC-007`                            | Cada identidad tiene destino principal según operación.                                |
| Principal, alternativas y fallback                       | `ESPECIFICADO`           | `PRINT-ARC-008`                            | Se conoce qué ocurre cuando el destino principal no está disponible.                   |
| Zebra ZD230 sin despliegue                               | `BLOQUEADO`              | `PRINT-ARC-018` y `PRINT-ARC-020`          | Adaptador seleccionado, conexión materializada y etiquetas piloto legibles.            |
| Epson L5590 fuera de servicio                            | `BLOQUEADO`              | Mantenimiento del activo y `PRINT-ARC-020` | Reparación cerrada y prueba satisfactoria con documentos A4 objetivo.                  |
| Dos térmicas adicionales en Vento Café                   | `BLOQUEADO`              | `PRINT-ARC-020`                            | Dos equipos disponibles, inventariados, conectados y listos para el piloto de cliente. |
| Uso actual de cada documento                             | `PENDIENTE_DE_EVIDENCIA` | `PRINT-ARC-020`                            | Prueba por identidad priorizada y por punto operativo con evidencia.                   |
| Permisos y privacidad                                    | `ESPECIFICADO`           | `PRINT-ARC-015` y `PRINT-ARC-016`          | Acciones y datos sensibles quedan protegidos por rol y contexto.                       |
| Operación offline y contingencia                         | `ESPECIFICADO`           | `PRINT-ARC-017`                            | Existe procedimiento y comportamiento degradado aprobado.                              |

No queda una brecha sin propietario documental o condición de salida.

---

#### 8. Handoff

`PRINT-ARC-004` deberá consumir las cincuenta identidades sin reducirlas ni fusionarlas silenciosamente y decidir, para cada una:

- aplicación propietaria;
- aplicación o dominio originador;
- aplicaciones consumidoras;
- actor que autoriza la operación;
- actor que solicita la impresión;
- separación entre documento empresarial y copia física;
- tratamiento cuando la salida representa información fiscal, financiera, personal, operacional o de trazabilidad.

Las dos capacidades térmicas adicionales de Vento Café permanecen como requisito de capacidad del portafolio, no como dispositivos ya adquiridos.

---

#### 9. Criterios de aceptación

`PRINT-ARC-003` queda documentalmente satisfecha cuando:

- [x] define un portafolio objetivo y no se limita a la situación actual;
- [x] materializa 50 identidades imprimibles con códigos únicos;
- [x] materializa 16 etiquetas, 9 comandas, 9 comprobantes de cliente y caja, y 16 documentos A4;
- [x] asigna propósito, dominio originador previsto, proceso y familia de dispositivo por identidad;
- [x] incluye etiquetas de producción, lotes, inventario, activos, mantenimiento, calidad y pedidos;
- [x] incluye comandas diferenciadas para cocina, bar y barra;
- [x] incluye resúmenes de cuenta y comprobantes para clientes;
- [x] conserva las nueve impresoras existentes sin faltantes ni duplicados;
- [x] define dos capacidades térmicas adicionales para Vento Café sin presentarlas como equipos existentes;
- [x] distingue especificación documental, implementación y validación;
- [x] asigna cada bloqueo y pendiente a una tarea o propietario con condición de salida;
- [x] reserva propiedad de aplicación para `PRINT-ARC-004`;
- [x] no ejecuta compras, instalación, configuración, mantenimiento o pruebas físicas.

---

#### 10. Requisitos de prueba

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea crea identidades documentales y define el portafolio objetivo, pero no incorpora todavía comportamiento ejecutable, disparadores, permisos, plantillas, contratos de trabajo, enrutamiento, reintentos, privacidad, operación offline ni criterios de éxito físico. Esas obligaciones verificables pertenecen a las tareas posteriores que materialicen cada decisión.

```text
TREQ creados: 0
TREQ modificados: 0
TREQ diferidos: 0
TREQ descartados: 0
TREQ obsoletos: 0
```

---

#### 11. Continuidad

```text
ÚLTIMA TAREA APROBADA
PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión
        ↓
TAREA ACTUAL APROBADA
PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles
        ↓
SIGUIENTE TAREA RESERVADA
PRINT-ARC-004 — Definir aplicación propietaria de cada documento
```


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
