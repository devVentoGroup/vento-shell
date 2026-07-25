# Registro vivo de preguntas y pendientes

**Archivo independiente:** no forma parte del plan canónico compilado  
**Última actualización:** 2026-07-25  
**Propósito:** mostrar primero todo lo que todavía requiere respuesta, comprobación o resolución y conservar después el archivo histórico de lo ya cerrado.

> **Regla de lectura:** todo lo ubicado antes de **ARCHIVO HISTÓRICO** requiere seguimiento. Lo archivado no debe volver a preguntarse salvo que aparezca evidencia contradictoria o cambie la operación.

---

# 1. Resumen ejecutivo de pendientes

| Grupo                                   | Cantidad | Tratamiento                                                                   |
| --------------------------------------- | -------: | ----------------------------------------------------------------------------- |
| Preguntas sin respuesta                 |       13 | Requieren respuesta directa de Gerencia, Contabilidad, Mercadeo u Operaciones |
| Respuestas incompletas                  |        4 | Existía respuesta, pero no permite cerrar el dato                             |
| Datos por comprobar                     |        1 | Existe respuesta aproximada sin precisión suficiente                          |
| Pregunta condicionada                   |        1 | Solo aplica si `ACT-09` confirma que existe equipo pendiente                  |
| Dudas diferidas con tarea de resolución |        9 | Se resolverán en diseño, implementación o piloto                              |
| Comprobaciones técnicas pendientes      |        0 | `TEC-01` a `TEC-19` están cerradas                                            |
| Preguntas exclusivas para el usuario    |        0 | No hay decisiones nuevas reservadas exclusivamente al usuario                 |

**Pendientes de atención inmediata:** 18  
**Pendiente condicionado:** 1  
**Pendientes diferidos:** 9

---

# 2. Pendientes activos para responder o comprobar

## 2.1 Prioridad P1 — información faltante

| ID       | Pregunta                                                                            | Responsable             | Respuesta esperada                         | Estado      | Origen                        |
| -------- | ----------------------------------------------------------------------------------- | ----------------------- | ------------------------------------------ | ----------- | ----------------------------- |
| `ADM-01` | ¿Cuál es la dirección física completa de Oficina 1?                                 | Gerencia                | una dirección completa                     | `PENDIENTE` | `OPS-ADM-001`                 |
| `ADM-07` | ¿Qué nombre aparece como titular del inmueble o del contrato de Oficina 1?          | Gerencia                | un nombre o `NO SÉ`                        | `PENDIENTE` | `OPS-ADM-001`                 |
| `ADM-08` | ¿Qué nombre de empresa aparece en los documentos de Oficina 1?                      | Contabilidad            | un nombre o `NO SÉ`                        | `PENDIENTE` | `OPS-ADM-001`                 |
| `ADM-09` | ¿A Oficina 1 llegan cartas o notificaciones dirigidas oficialmente a la empresa?    | Gerencia                | `SÍ`, `NO` o `NO SÉ`                       | `PENDIENTE` | `OPS-ADM-001`                 |
| `GOV-13` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Vento Café?     | Contabilidad            | empresa o persona titular                  | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `GOV-14` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Saudo?          | Contabilidad            | empresa o persona titular                  | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `GOV-15` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Molka?          | Contabilidad            | empresa o persona titular                  | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `GOV-16` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Vaila Vainilla? | Contabilidad            | empresa o persona titular                  | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `GOV-17` | ¿A nombre de quién está la cuenta principal que recibe el dinero de catering?       | Contabilidad            | empresa, persona o `NO EXISTE`             | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `GOV-18` | ¿A nombre de quién está la cuenta comercial de Rappi?                               | Gerencia o Contabilidad | empresa o persona titular                  | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `GOV-19` | ¿A nombre de quién está la cuenta comercial de Shopify?                             | Gerencia o Contabilidad | empresa o persona titular                  | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `GOV-20` | ¿A nombre de quién está la cuenta comercial de ManyChat?                            | Gerencia o Mercadeo     | empresa o persona titular                  | `PENDIENTE` | `OPS-GOV-001`, `CAP-MAP-003`  |
| `DAT-15` | ¿Dónde se conserva el resultado final del pago laboral?                             | Contabilidad            | archivo, aplicación, proveedor o ubicación | `PENDIENTE` | `OPS-PLAN-001`, `CAP-MAP-004` |

## 2.2 Prioridad P2 — respuestas incompletas

| ID       | Pregunta o comprobación                                                                                    | Responsable                | Respuesta esperada                                 | Estado          | Motivo                                                  |
| -------- | ---------------------------------------------------------------------------------------------------------- | -------------------------- | -------------------------------------------------- | --------------- | ------------------------------------------------------- |
| `ACT-07` | ¿Cuántas canastas de transporte existen actualmente?                                                       | Bodega u Operaciones       | un número exacto                                   | `POR_COMPLETAR` | la respuesta anterior fue `NO SÉ`                       |
| `ACT-09` | ¿Existe algún equipo pendiente de instalar?                                                                | Operaciones                | `SÍ` o `NO`; si se desconoce, comprobar inventario | `POR_COMPLETAR` | la respuesta anterior fue `NO SÉ`                       |
| `ACT-10` | ¿Qué equipo está pendiente de instalar?                                                                    | Operaciones                | una descripción                                    | `CONDICIONADA`  | solo se responde si `ACT-09 = SÍ`                       |
| `DAT-16` | ¿Qué empresa externa conserva las inspecciones de seguridad y salud y dónde quedan disponibles para Vento? | Responsable SST o Gerencia | nombre de empresa + medio de acceso                | `POR_COMPLETAR` | la respuesta anterior solo indicó “una empresa externa” |
| `DAT-22` | ¿Cuál es el nombre y la ubicación del archivo donde se registra cómo se repartieron las propinas?          | Gerencia o Contabilidad    | nombre del archivo + ubicación                     | `POR_COMPLETAR` | la respuesta anterior solo indicó “un archivo”          |

## 2.3 Prioridad P3 — dato por comprobar

| ID       | Pregunta                                           | Responsable            | Respuesta esperada                | Estado          | Motivo                                               |
| -------- | -------------------------------------------------- | ---------------------- | --------------------------------- | --------------- | ---------------------------------------------------- |
| `DAT-02` | ¿Cuál es la fecha más antigua disponible en Makos? | Administrador de Makos | fecha exacta o al menos mes y año | `POR_COMPROBAR` | la respuesta anterior indicó “desde febrero” sin año | desde mayo de este año |

## 2.4 Formato de respuesta

```text
ADM-01: [dirección completa]
GOV-13: [titular de la cuenta]
ACT-07: [número exacto]
DAT-02: [mes y año o fecha exacta]
```

Se admiten `NO EXISTE`, `NO APLICA`, `NO TENGO ACCESO` o `NO SÉ`. Sin embargo, `NO SÉ` no cierra la pregunta: la mueve a comprobación o asignación a otra persona.

---

# 3. Pendientes diferidos con dueño documental

Estas dudas no deben convertirse ahora en cuestionarios. Cada una tiene un momento de resolución definido.

| ID       | Duda                                                              | Momento o tarea de resolución                   | Estado     |
| -------- | ----------------------------------------------------------------- | ----------------------------------------------- | ---------- |
| `DIF-04` | Definir reversión de anulaciones y devoluciones                   | dominio funcional y catálogo de procesos        | `DIFERIDA` |
| `DIF-05` | Definir funcionamiento sin internet                               | requisitos no funcionales y piloto              | `DIFERIDA` |
| `DIF-06` | Definir reintentos e idempotencia                                 | diseño técnico e integración                    | `DIFERIDA` |
| `DIF-07` | Definir recuperación por caída de energía, red o dispositivo      | BLOQUE AC — continuidad operativa y piloto      | `DIFERIDA` |
| `DIF-08` | Medir volúmenes y tiempos que todavía no tienen cifras confiables | instrumentación y piloto                        | `DIFERIDA` |
| `DIF-09` | Resolver variantes menores por sede o turno                       | prototipo con usuarios reales                   | `DIFERIDA` |
| `DIF-10` | Definir el propietario objetivo del soporte tecnológico           | diseño de capacidades de tecnología             | `DIFERIDA` |
| `DIF-14` | Definir reglas de imputación de costos compartidos                | `OPS-CST-001` y NUMERA                          | `DIFERIDA` |
| `DIF-15` | Definir el modelo objetivo de catering y ventas B2B               | `OPS-CAN-001`, `OPS-B2B-001` y diseño comercial | `DIFERIDA` |

---

# 4. Reglas de mantenimiento

1. Toda pregunta nueva debe ser atómica y tener responsable, formato de respuesta y origen.
2. Antes de crearla se revisan auditorías, tareas aprobadas, código, configuración, datos y este registro.
3. Una respuesta `NO SÉ` o imprecisa no se archiva como cerrada: pasa a `POR_COMPLETAR` o `POR_COMPROBAR`.
4. Al resolverse, el elemento se elimina de las secciones 2 o 3 y se incorpora al archivo histórico con fecha y evidencia.
5. Toda brecha o decisión diferida debe quedar vinculada a una tarea canónica concreta; no se permiten pendientes narrativos sin dueño.
6. Las comprobaciones que involucren Supabase se ejecutan desde `vento-shell`.

---

# ARCHIVO HISTÓRICO — NO REQUIERE ACCIÓN

Las secciones siguientes conservan respuestas, comprobaciones y decisiones ya incorporadas. No deben mezclarse con la lista operativa de pendientes.

## 5. Respuestas operativas archivadas

### 5.1 Oficina 1 y situación administrativa

| ID       | Respuesta incorporada                                                      |
| -------- | -------------------------------------------------------------------------- |
| `ADM-02` | La dirección registral de Vento Group corresponde al Centro de Producción. |
| `ADM-03` | Oficina 1 y Vento Café están dentro del mismo inmueble.                    |
| `ADM-04` | No existe entrada interna directa desde Vento Café.                        |
| `ADM-05` | No comparte la entrada pública de Vento Café.                              |
| `ADM-06` | No comparte servicios públicos con Vento Café.                             |
| `ADM-10` | Trabajan habitualmente 6 personas.                                         |
| `ADM-11` | Propietario, gerente general, gerente de Vento Café, contador y Marketing. |
| `ADM-12` | Sí se guarda efectivo.                                                     |
| `ADM-13` | Sí se guardan documentos empresariales originales.                         |

### 5.2 Titulares y facturación

| ID       | Respuesta incorporada                                                                                                                    |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `GOV-02` | RUT de Vento Café: Vento Group S.A.S.                                                                                                    |
| `GOV-03` | RUT de Saudo: Jefersson García — persona natural.                                                                                        |
| `GOV-04` | RUT de Molka: Nathalia Carolina Ibarra Ariza — persona natural.                                                                          |
| `GOV-05` | Vaila Vainilla no tiene RUT propio actualmente.                                                                                          |
| `GOV-06` | Centro de Producción: Vento Group S.A.S. — establecimiento Vento Producción.                                                             |
| `GOV-08` | Facturas de Vento Café: Vento Group S.A.S.                                                                                               |
| `GOV-09` | Facturas de Saudo: Jefersson García.                                                                                                     |
| `GOV-10` | Facturas de Molka: Nathalia Ibarra.                                                                                                      |
| `GOV-11` | Vaila Vainilla factura principalmente mediante Nathalia Ibarra/Dataico; según el pedido puede usar Jefersson García o Vento Group S.A.S. |
| `GOV-12` | Catering factura a nombre de Vento Group S.A.S.                                                                                          |

### 5.3 Vaila Vainilla y catering

| ID       | Respuesta incorporada                                                        |
| -------- | ---------------------------------------------------------------------------- |
| `COM-01` | El inventario vendido sale de la Oficina de Vento Group.                     |
| `COM-02` | Los pedidos se empacan en la Oficina de Vento Group.                         |
| `COM-03` | Chelsea, responsable de ventas en línea, recibe y decide sobre devoluciones. |
| `COM-04` | El gerente general autoriza una venta de catering.                           |
| `COM-05` | Existe contrato o cotización estándar para catering.                         |

### 5.4 Activos, vehículo y custodia

| ID                  | Respuesta incorporada                                                                                                                                                                              |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ACT-01` a `ACT-06` | Existe un vehículo principal identificado como VAN, a nombre de Nathalia Ibarra, operativo y con alternativa disponible; las llaves las custodia el celador del apartamento de la gerente general. |
| `ACT-08`            | Las canastas permanecen normalmente en la VAN, Centro de Producción y Vento Café.                                                                                                                  |
| `ACT-11` a `ACT-13` | Existe decoración de temporadas guardada externamente.                                                                                                                                             |
| `ACT-14`            | Los documentos originales los guarda la gerente general o la contadora.                                                                                                                            |
| `ACT-15`            | El efectivo recibido desde las sedes lo custodia la gerente general.                                                                                                                               |

### 5.5 Fuentes de información y registros

| ID                  | Respuesta incorporada                                                                                                 |
| ------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `DAT-01`, `DAT-03`  | Makos permite exportar ventas y muestra productos vendidos por separado.                                              |
| `DAT-04`, `DAT-05`  | No existe una fuente operativa única de inventario por producto y sede.                                               |
| `DAT-06`, `DAT-07`  | No existe un repositorio único de compras ni registro histórico completo de cantidades recibidas.                     |
| `DAT-08`            | Sí se conservan solicitudes de remisión.                                                                              |
| `DAT-09` a `DAT-13` | No se conservan de forma estructurada remisiones despachadas/recibidas, conteos, producción diaria ni hojas manuales. |
| `DAT-14`            | El pago laboral se calcula en TNS.                                                                                    |
| `DAT-17`            | La empresa externa de SST registra hallazgos y entrega informe a la propietaria.                                      |
| `DAT-18`, `DAT-19`  | Las instrucciones suelen quedar en WhatsApp y no existe mecanismo formal de corrección.                               |
| `DAT-20`, `DAT-21`  | Vaila Vainilla acompaña el pedido con factura y confirma entrega por WhatsApp.                                        |
| `DAT-23`            | Las ventas anuladas se registran en Makos.                                                                            |
| `DAT-24` a `DAT-26` | No existe registro formal de devoluciones, compensaciones ni correcciones de cantidades.                              |
| `DAT-27`            | Las mermas se registran en el “Formato de mermas”.                                                                    |

### 5.6 Lugares y operación

| ID                 | Respuesta incorporada                                                              |
| ------------------ | ---------------------------------------------------------------------------------- |
| `OPE-01`           | El frío se almacena en cuarto frío, cuarto de congelación y neveras horizontales.  |
| `OPE-02`, `OPE-03` | Vento Café acepta reservas; actualmente ninguna sede realiza eventos.              |
| `OPE-04`           | No existe autorización definida para cambiar una solicitud de remisión ya enviada. |
| `OPE-05`, `OPE-06` | El gerente general decide rechazo de mercancía y correcciones de inventario.       |
| `OPE-07`           | No existe autorización definida para corregir un medio de pago.                    |
| `OPE-08`           | El gerente general autoriza cambios de horarios publicados.                        |
| `OPE-09`           | No existe autorización definida para corregir marcaciones de asistencia.           |
| `OPE-10`, `OPE-11` | La propietaria decide devoluciones y compensaciones a clientes.                    |

### 5.7 Validaciones profesionales o externas

| ID                  | Respuesta incorporada                                                                                                     |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `EXT-01` a `EXT-05` | No se requiere actualizar o registrar Oficina 1 ante Cámara de Comercio, RUT, banco, aseguradora ni como establecimiento. |
| `EXT-06` a `EXT-09` | No existe documento vigente identificado para el uso de las marcas Vento Café, Saudo, Molka o Vaila Vainilla.             |

## 6. Comprobaciones técnicas cerradas

**Evidencia detallada:** `AUDITORIA_TECNICA_TEC-01_A_TEC-18_2026-07-23.md`.

| ID                  | Resultado archivado                                                                                    |
| ------------------- | ------------------------------------------------------------------------------------------------------ |
| `TEC-01` a `TEC-03` | AURA no tiene repositorio, pantallas ni capacidades funcionales; `aura.access` es reserva de catálogo. |
| `TEC-04`            | No aparece “Oficina 1” en sistemas; Supabase conserva dirección de sede administrativa.                |
| `TEC-05` a `TEC-09` | Se identificaron las fuentes actuales de ventas, inventario, compras, producción y finanzas.           |
| `TEC-10`            | PULSO importa manualmente Excel de Makos; no existe integración automática.                            |
| `TEC-11` a `TEC-13` | No se encontraron integraciones automáticas con Shopify, Rappi o ManyChat.                             |
| `TEC-14`            | VISO y ANIMA editan horarios; VISO puede exigir republicación.                                         |
| `TEC-15`            | Ningún sistema corrige la hora de asistencia; ANIMA solo modifica la nota de incidencia.               |
| `TEC-16`            | No existe corrección manual auditable de medios de pago comprobada en PULSO.                           |
| `TEC-17`            | NEXO, VISO, ANIMA, ORIGO y FOGO tienen exportaciones parciales; PULSO y NUMERA presentan brechas.      |
| `TEC-18`            | Existen estructuras y contratos duplicados entre aplicaciones.                                         |
| `TEC-19`            | La exportación temporal de inventario fue eliminada de `vento-os-dev` el 2026-07-23 y verificada.      |

## 7. Dudas diferidas ya resueltas

| ID       | Resolución archivada                                                                       |
| -------- | ------------------------------------------------------------------------------------------ |
| `DIF-01` | Fuente de verdad funcional resuelta en `CAP-MAP-008`; ubicación física queda para E3.      |
| `DIF-02` | Contratos funcionales resueltos en `CAP-MAP-009`; mecanismo técnico queda para BLOQUE X.   |
| `DIF-03` | Permisos y segregación resueltos funcionalmente en `CAP-MAP-010`.                          |
| `DIF-11` | Traslado interno y entrega al cliente quedaron separados en `CAP-MAP-007` a `CAP-MAP-009`. |
| `DIF-12` | Propiedad documental quedó separada por hecho respaldado.                                  |
| `DIF-13` | Hechos operativos y análisis consolidado quedaron separados funcionalmente.                |

## 8. Historial de decisiones relacionadas

Las decisiones `DEC-*` y aprobaciones `CODE-AUD-*` permanecen como evidencia histórica en el plan canónico y en su control documental. Este registro no las presenta como pendientes ni las duplica íntegramente.

Decisiones históricas relevantes: `DEC-POS-001`, `DEC-CAP-013-001`, `DEC-CAP-014-001`, `DEC-TALENTO-001`, `DEC-VITAL-001`, `DEC-BRECHAS-001`, `DEC-CAP-015-001`, `DEC-CAP-015-002`, `DEC-CODE-001-001` a `DEC-CODE-006-001`.

---

# Control de incorporación

Cuando aparezca una duda nueva:

1. buscar posibles duplicados en este archivo;
2. revisar auditorías y decisiones aprobadas;
3. asignar responsable y prioridad;
4. formular una sola pregunta;
5. indicar el formato de respuesta;
6. asignar el siguiente código de su categoría;
7. registrar respuesta, fecha y evidencia cuando se resuelva;
8. actualizar la tarea o diseño afectado;
9. mover el elemento al archivo histórico.
