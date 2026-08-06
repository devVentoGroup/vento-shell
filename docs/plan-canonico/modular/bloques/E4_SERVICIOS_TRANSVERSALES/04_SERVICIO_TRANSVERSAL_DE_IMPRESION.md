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


### [ ] PRINT-ARC-002 — Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión
### [ ] PRINT-ARC-003 — Inventariar documentos, etiquetas, comandas y comprobantes imprimibles
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
