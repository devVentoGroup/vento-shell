# Registro vivo de preguntas pendientes

**Archivo independiente:** no forma parte del plan canónico compilado  
**Corte inicial:** tareas aprobadas hasta `CAP-MAP-006`  
**Última actualización:** 2026-07-23  
**Propósito:** reunir en un solo lugar las preguntas, comprobaciones técnicas e información faltante que continúan abiertas

---

## 1. Cómo responder

Cada código corresponde a una sola pregunta.

La respuesta puede enviarse así:

```text
GOV-03: [titular documental]
ACT-06: NO
OPE-04: Responsable de sede
```

Respuestas permitidas cuando no se conoce el dato:

```text
NO SÉ
NO EXISTE
NO APLICA
NO TENGO ACCESO
```

No es necesario responder todo al mismo tiempo.

La pregunta se puede copiar y enviar directamente por WhatsApp.  
La columna **Qué debe escribir** indica exactamente el tipo de respuesta esperado.

Cuando se pregunte **quién**, la persona debe escribir el nombre del cargo o de la persona que realiza la acción. Ejemplo:

```text
OPE-04: Gerente de sede
```

No se usarán expresiones como “qué función autoriza”, “actor”, “fuente de verdad” o “resultado informativo” en preguntas dirigidas a trabajadores.

---

## 2. Estados

| Estado                 | Significado                                              |
| ---------------------- | -------------------------------------------------------- |
| `PENDIENTE`            | todavía no existe respuesta suficiente                   |
| `RESPONDIDA`           | existe una respuesta incorporada                         |
| `POR_COMPROBAR`        | hay una respuesta, pero falta evidencia                  |
| `NO_SE_PUDO_COMPROBAR` | se intentó y no fue posible obtener evidencia            |
| `NO_APLICA`            | se confirmó que la pregunta no corresponde               |
| `DIFERIDA`             | solo puede resolverse durante diseño, prototipo o piloto |

---

## 3. Reglas para añadir preguntas nuevas

Antes de añadir una pregunta se debe revisar:

1. si el usuario ya la respondió;
2. si una auditoría o tarea aprobada contiene la respuesta;
3. si puede comprobarse mediante documentos, código, configuración o datos;
4. si puede responderla un trabajador o responsable funcional;
5. si cambia alguna decisión real.

No se añadirán:

- preguntas duplicadas;
- preguntas con dos dudas mezcladas;
- preguntas técnicas dirigidas al usuario;
- preguntas cuya respuesta ya esté documentada;
- preguntas que no cambien ninguna decisión;
- preguntas generales como “explique el proceso”.

Cada pregunta nueva deberá indicar responsable, formato de respuesta y origen.
Además, deberá poder copiarse y enviarse por WhatsApp sin explicación adicional.

---

# A. Preguntas listas para responder

## A1. Oficina 1 y situación administrativa

| ID       | Pregunta                                                                                | Responde                | Qué debe escribir    | Estado       | Respuesta                                                                |
| -------- | --------------------------------------------------------------------------------------- | ----------------------- | -------------------- | ------------ | ------------------------------------------------------------------------ |
| `ADM-01` | ¿Cuál es la dirección física completa de Oficina 1?                                     | Gerencia                | una dirección        | `PENDIENTE`  |                                                                          |
| `ADM-02` | ¿Qué dirección de Vento Group aparece actualmente en el RUT o en la Cámara de Comercio? | Contabilidad            | una dirección        | `RESPONDIDA` | La dirección del Centro de Producción                                    |
| `ADM-03` | ¿Oficina 1 y Vento Café están dentro del mismo inmueble?                                | Gerencia                | `SÍ`, `NO` o `NO SÉ` | `PENDIENTE`  |                                                                          |
| `ADM-04` | ¿Oficina 1 tiene una entrada interna directa desde Vento Café?                          | Gerencia                | `SÍ`, `NO` o `NO SÉ` | `RESPONDIDA` | `NO`                                                                     |
| `ADM-05` | ¿Oficina 1 comparte la entrada pública de Vento Café?                                   | Gerencia                | `SÍ`, `NO` o `NO SÉ` | `RESPONDIDA` | `NO`                                                                     |
| `ADM-06` | ¿Oficina 1 comparte servicios públicos con Vento Café?                                  | Gerencia                | `SÍ`, `NO` o `NO SÉ` | `RESPONDIDA` | `NO`                                                                     |
| `ADM-07` | ¿Qué nombre aparece como titular del inmueble o del contrato de Oficina 1?              | Gerencia                | un nombre o `NO SÉ`  | `PENDIENTE`  |                                                                          |
| `ADM-08` | ¿Qué nombre de empresa aparece en los documentos de Oficina 1?                          | Contabilidad            | un nombre o `NO SÉ`  | `PENDIENTE`  |                                                                          |
| `ADM-09` | ¿A Oficina 1 llegan cartas o notificaciones dirigidas oficialmente a la empresa?        | Gerencia                | `SÍ`, `NO` o `NO SÉ` | `PENDIENTE`  |                                                                          |
| `ADM-10` | ¿Cuántas personas trabajan habitualmente en Oficina 1?                                  | Gerencia                | un número            | `RESPONDIDA` | 6                                                                        |
| `ADM-11` | ¿Qué cargos trabajan habitualmente en Oficina 1?                                        | Gerencia                | una lista de cargos  | `RESPONDIDA` | PROPIETARIO, GERENTE GENERAL, GERENTE DE VENTO CAFÉ, CONTADOR, MARKETING |
| `ADM-12` | ¿Se guarda efectivo habitualmente en Oficina 1?                                         | Gerencia                | `SÍ`, `NO` o `NO SÉ` | `RESPONDIDA` | `SÍ`                                                                     |
| `ADM-13` | ¿Se guardan documentos empresariales originales en Oficina 1?                           | Gerencia o Contabilidad | `SÍ`, `NO` o `NO SÉ` | `RESPONDIDA` | `SÍ`                                                                     |

**Origen:** `OPS-ADM-001`.

---

## A2. Titulares, facturación y recaudo

### Nombre que aparece en los documentos de cada negocio

| ID       | Pregunta                                                                     | Responde     | Qué debe escribir | Estado       | Respuesta                                             |
| -------- | ---------------------------------------------------------------------------- | ------------ | ----------------- | ------------ | ----------------------------------------------------- |
| `GOV-02` | ¿Qué nombre de empresa o persona aparece en el RUT de Vento Café?            | Contabilidad | un nombre         | `RESPONDIDA` | Vento Group S.A.S.                                    |
| `GOV-03` | ¿Qué nombre de empresa o persona aparece en el RUT de Saudo?                 | Contabilidad | un nombre         | `RESPONDIDA` | Jefersson García — persona natural                    |
| `GOV-04` | ¿Qué nombre de empresa o persona aparece en el RUT de Molka?                 | Contabilidad | un nombre         | `RESPONDIDA` | Nathalia Carolina Ibarra Ariza — persona natural      |
| `GOV-05` | ¿Qué nombre de empresa o persona aparece en el RUT de Vaila Vainilla?        | Contabilidad | un nombre         | `RESPONDIDA` | No tiene actualmente                                  |
| `GOV-06` | ¿Qué nombre de empresa o persona aparece en el RUT del Centro de Producción? | Contabilidad | un nombre         | `RESPONDIDA` | Vento Group S.A.S. — establecimiento Vento Producción |

### Nombre que aparece en las facturas

| ID       | Pregunta                                                                    | Responde     | Qué debe escribir       | Estado       | Respuesta                                                                                                                                                                                                                                     |
| -------- | --------------------------------------------------------------------------- | ------------ | ----------------------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `GOV-08` | ¿Qué nombre de empresa o persona aparece en las facturas de Vento Café?     | Contabilidad | un nombre               | `RESPONDIDA` | Vento Group S.A.S.                                                                                                                                                                                                                            |
| `GOV-09` | ¿Qué nombre de empresa o persona aparece en las facturas de Saudo?          | Contabilidad | un nombre               | `RESPONDIDA` | Jefersson garcia                                                                                                                                                                                                                              |
| `GOV-10` | ¿Qué nombre de empresa o persona aparece en las facturas de Molka?          | Contabilidad | un nombre               | `RESPONDIDA` | Nathalia Ibarra                                                                                                                                                                                                                               |
| `GOV-11` | ¿Qué nombre de empresa o persona aparece en las facturas de Vaila Vainilla? | Contabilidad | un nombre o `NO EXISTE` | `RESPONDIDA` | Está depende ahorita Nathalia Ibarra a través de dataico, pero puede facturar a nombre de jeo, si es un pedido grande que sea necesario por empresa se factura por vento group sas, es dependiendo ya que no tiene camara de comercio ni nada |
| `GOV-12` | ¿Qué nombre de empresa o persona aparece en las facturas de catering?       | Contabilidad | un nombre o `NO EXISTE` | `RESPONDIDA` | vento group sas                                                                                                                                                                                                                               |

### Cuenta donde entra el dinero de cada negocio

| ID       | Pregunta                                                                            | Responde     | Qué debe escribir                           | Estado      | Respuesta |
| -------- | ----------------------------------------------------------------------------------- | ------------ | ------------------------------------------- | ----------- | --------- |
| `GOV-13` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Vento Café?     | Contabilidad | un nombre de empresa o persona              | `PENDIENTE` |           |
| `GOV-14` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Saudo?          | Contabilidad | un nombre de empresa o persona              | `PENDIENTE` |           |
| `GOV-15` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Molka?          | Contabilidad | un nombre de empresa o persona              | `PENDIENTE` |           |
| `GOV-16` | ¿A nombre de quién está la cuenta principal que recibe el dinero de Vaila Vainilla? | Contabilidad | un nombre de empresa o persona              | `PENDIENTE` |           |
| `GOV-17` | ¿A nombre de quién está la cuenta principal que recibe el dinero de catering?       | Contabilidad | un nombre de empresa, persona o `NO EXISTE` | `PENDIENTE` |           |

### Cuentas externas

| ID       | Pregunta                                                 | Responde                | Qué debe escribir              | Estado      | Respuesta |
| -------- | -------------------------------------------------------- | ----------------------- | ------------------------------ | ----------- | --------- |
| `GOV-18` | ¿A nombre de quién está la cuenta comercial de Rappi?    | Gerencia o Contabilidad | un nombre de empresa o persona | `PENDIENTE` |           |
| `GOV-19` | ¿A nombre de quién está la cuenta comercial de Shopify?  | Gerencia o Contabilidad | un nombre de empresa o persona | `PENDIENTE` |           |
| `GOV-20` | ¿A nombre de quién está la cuenta comercial de ManyChat? | Gerencia o Mercadeo     | un nombre de empresa o persona | `PENDIENTE` |           |

**Origen:** `OPS-GOV-001`, `CAP-MAP-003`.

---

## A3. Vaila Vainilla y catering

| ID       | Pregunta                                                                                            | Responde                         | Qué debe escribir                   | Estado      | Respuesta |
| -------- | --------------------------------------------------------------------------------------------------- | -------------------------------- | ----------------------------------- | ----------- | --------- |
| `COM-01` | ¿De qué lugar sale actualmente el inventario vendido por Vaila Vainilla?                            | responsable de Vaila Vainilla    | un lugar                            | `PENDIENTE` |           |
| `COM-02` | ¿En qué lugar se empacan actualmente los pedidos de Vaila Vainilla?                                 | responsable de Vaila Vainilla    | un lugar                            | `PENDIENTE` |           |
| `COM-03` | Cuando un cliente devuelve un producto de Vaila Vainilla, ¿quién recibe el caso y decide qué hacer? | responsable de Vaila Vainilla    | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `COM-04` | Antes de confirmar una venta de catering, ¿quién debe decir que sí?                                 | Gerencia o responsable comercial | un nombre o cargo                   | `PENDIENTE` |           |
| `COM-05` | ¿Existe actualmente un contrato o cotización estándar para catering?                                | Gerencia                         | `SÍ`, `NO` o `NO SÉ`                | `PENDIENTE` |           |

**Origen:** `OPS-GOV-001`, `CAP-MAP-003`, auditoría E1.

---

## A4. Activos, vehículo y custodia

| ID       | Pregunta                                                                                               | Responde                  | Qué debe escribir             | Estado      | Respuesta |
| -------- | ------------------------------------------------------------------------------------------------------ | ------------------------- | ----------------------------- | ----------- | --------- |
| `ACT-01` | ¿Cuántos vehículos utiliza actualmente la operación?                                                   | Operaciones               | un número                     | `PENDIENTE` |           |
| `ACT-02` | ¿Qué nombre o descripción usan para identificar el vehículo principal?                                 | Operaciones               | una frase corta               | `PENDIENTE` |           |
| `ACT-03` | ¿Qué nombre de empresa o persona aparece en la tarjeta de propiedad del vehículo principal?            | Gerencia o Contabilidad   | un nombre                     | `PENDIENTE` |           |
| `ACT-04` | ¿Quién guarda normalmente las llaves y responde por el vehículo principal?                             | Operaciones               | un nombre o cargo             | `PENDIENTE` |           |
| `ACT-05` | ¿El vehículo principal se puede usar normalmente en este momento?                                      | conductor u Operaciones   | `SÍ`, `NO` o `PARCIAL`        | `PENDIENTE` |           |
| `ACT-06` | ¿Existe otro vehículo disponible si el principal falla?                                                | Operaciones               | `SÍ`, `NO` o `NO SÉ`          | `PENDIENTE` |           |
| `ACT-07` | ¿Cuántas canastas de transporte existen actualmente?                                                   | Bodega u Operaciones      | un número o `NO SÉ`           | `PENDIENTE` |           |
| `ACT-08` | ¿En qué lugares permanecen normalmente las canastas?                                                   | Bodega, conductor y sedes | una lista de lugares          | `PENDIENTE` |           |
| `ACT-09` | ¿Existe algún equipo pendiente de instalar?                                                            | Operaciones               | `SÍ`, `NO` o `NO SÉ`          | `PENDIENTE` |           |
| `ACT-10` | ¿Qué equipo está pendiente de instalar?                                                                | Operaciones               | una descripción o `NO APLICA` | `PENDIENTE` |           |
| `ACT-11` | ¿Algún equipo, mueble u otra cosa de Vento está prestado o guardado por una persona o empresa externa? | Gerencia u Operaciones    | `SÍ`, `NO` o `NO SÉ`          | `PENDIENTE` |           |
| `ACT-12` | ¿Qué equipo, mueble o cosa de Vento está prestado o guardado por esa persona o empresa externa?        | Gerencia u Operaciones    | una descripción o `NO APLICA` | `PENDIENTE` |           |
| `ACT-13` | ¿Hay muebles o decoración de Vento guardados fuera de sus locales u oficinas?                          | Operaciones               | `SÍ`, `NO` o `NO SÉ`          | `PENDIENTE` |           |
| `ACT-14` | ¿Quién guarda normalmente los documentos originales de la empresa?                                     | Gerencia o Contabilidad   | un nombre o cargo             | `PENDIENTE` |           |
| `ACT-15` | ¿Quién recibe y guarda el efectivo que llega desde las sedes?                                          | Gerencia o Contabilidad   | un nombre o cargo             | `PENDIENTE` |           |

**Origen:** `OPS-ACT-001`, `CAP-MAP-003`.

---

## A5. Fuentes de información para demanda, inventario y producción

| ID       | Pregunta                                                                                               | Responde                                    | Qué debe escribir                               | Estado      | Respuesta |
| -------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------- | ----------------------------------------------- | ----------- | --------- |
| `DAT-01` | ¿Makos permite descargar las ventas en Excel o en otro archivo?                                        | Caja, Contabilidad o administrador de Makos | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-02` | ¿Cuál es la fecha más antigua disponible en Makos?                                                     | administrador de Makos                      | una fecha o `NO SÉ`                             | `PENDIENTE` |           |
| `DAT-03` | ¿La exportación de Makos muestra cada producto vendido por separado?                                   | Caja o Contabilidad                         | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-04` | ¿Dónde miras cuántas unidades hay disponibles de cada producto?                                        | Bodega u Operaciones                        | un nombre de aplicación, archivo o `NO EXISTE`  | `PENDIENTE` |           |
| `DAT-05` | ¿En ese mismo lugar puedes ver las cantidades de todas las sedes?                                      | Bodega u Operaciones                        | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-06` | ¿Existe un solo archivo o aplicación donde se puedan consultar las compras anteriores?                 | Compras o Contabilidad                      | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-07` | ¿Se guardan las cantidades que realmente se recibieron en entregas anteriores de proveedores?          | Compras o Bodega                            | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-08` | ¿Se guardan las solicitudes de remisión enviadas anteriormente?                                        | Operaciones                                 | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-09` | ¿Se guardan las remisiones que ya fueron despachadas?                                                  | Bodega o Logística                          | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-10` | ¿Cada sede guarda las remisiones que ya recibió?                                                       | responsables de sede                        | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-11` | ¿Se guardan los resultados de conteos de inventario anteriores?                                        | Bodega u Operaciones                        | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-12` | ¿Se guarda un registro de lo que realmente se produjo cada día?                                        | responsable de Producción                   | `SÍ`, `NO` o `NO SÉ`                            | `PENDIENTE` |           |
| `DAT-13` | ¿En qué carpeta se guardan las hojas manuales de operación?                                            | Operaciones o Contabilidad                  | una ubicación o `NO EXISTE`                     | `PENDIENTE` |           |
| `DAT-14` | ¿Dónde se calcula actualmente el pago laboral?                                                         | Contabilidad                                | un archivo, aplicación o proveedor              | `PENDIENTE` |           |
| `DAT-15` | ¿Dónde se conserva el resultado final del pago laboral?                                                | Contabilidad                                | un archivo, aplicación o proveedor              | `PENDIENTE` |           |
| `DAT-16` | ¿Dónde se guardan actualmente las inspecciones de seguridad y salud?                                   | responsable SST o Gerencia                  | una ubicación o `NO EXISTE`                     | `PENDIENTE` |           |
| `DAT-17` | Cuando una inspección de seguridad encuentra un problema, ¿dónde se anotan las tareas para corregirlo? | responsable SST o Gerencia                  | una ubicación o `NO EXISTE`                     | `PENDIENTE` |           |
| `DAT-18` | Cuando Gerencia da una instrucción importante, ¿dónde queda escrita?                                   | Gerencia o auxiliar administrativa          | un documento, archivo, aplicación o `NO EXISTE` | `PENDIENTE` |           |
| `DAT-19` | Si esa instrucción escrita tiene un error, ¿dónde se hace la corrección?                               | Gerencia o auxiliar administrativa          | un documento, archivo, aplicación o `NO EXISTE` | `PENDIENTE` |           |
| `DAT-20` | ¿Qué documento acompaña actualmente el paquete de Vaila Vainilla al entregarlo a mensajería?           | responsable de Vaila Vainilla o despachador | un nombre o `NINGUNO`                           | `PENDIENTE` |           |
| `DAT-21` | ¿Dónde se registra actualmente que un pedido de Vaila Vainilla fue entregado al cliente?               | responsable de Vaila Vainilla               | una aplicación, chat, archivo o `NO EXISTE`     | `PENDIENTE` |           |
| `DAT-22` | ¿Dónde se registra actualmente cómo se repartieron las propinas?                                       | Gerencia o Contabilidad                     | un archivo, aplicación, papel o `NO EXISTE`     | `PENDIENTE` |           |
| `DAT-23` | ¿Dónde se registra actualmente una venta anulada?                                                      | Caja o responsable de sede                  | una aplicación, archivo, papel o `NO EXISTE`    | `PENDIENTE` |           |
| `DAT-24` | ¿Dónde se registra actualmente una devolución de cliente?                                              | Caja o responsable de sede                  | una aplicación, archivo, chat o `NO EXISTE`     | `PENDIENTE` |           |
| `DAT-25` | Si se da a un cliente un producto, descuento o dinero por un problema, ¿dónde queda anotado?           | Caja o responsable de sede                  | una aplicación, archivo, chat o `NO EXISTE`     | `PENDIENTE` |           |
| `DAT-26` | Si se corrige la cantidad registrada de un producto, ¿dónde queda anotada esa corrección?              | responsable de inventario o sede            | una aplicación, archivo, papel o `NO EXISTE`    | `PENDIENTE` |           |
| `DAT-27` | ¿Cómo se llama el formato donde se registra actualmente una merma?                                     | Producción, Cocina o responsable de sede    | un nombre o `NO EXISTE`                         | `PENDIENTE` |           |

**Origen:** `OPS-PLAN-001`, `OPS-PLAN-002`, `CAP-MAP-004`, `CAP-MAP-005`, `CAP-MAP-007`.

---

## A6. Lugares y operación

| ID       | Pregunta                                                                                                              | Responde                                   | Qué debe escribir                   | Estado      | Respuesta |
| -------- | --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ | ----------------------------------- | ----------- | --------- |
| `OPE-01` | ¿En qué lugares se almacenan productos en frío?                                                                       | responsables de sede, Bodega o Producción  | una lista de lugares                | `PENDIENTE` |           |
| `OPE-02` | ¿En qué sedes se aceptan reservas actualmente?                                                                        | responsables de sede                       | una lista o `NINGUNA`               | `PENDIENTE` |           |
| `OPE-03` | ¿En qué sedes se realizan eventos actualmente?                                                                        | Gerencia o responsables de sede            | una lista o `NINGUNA`               | `PENDIENTE` |           |
| `OPE-04` | Si ya enviaste una solicitud de remisión y necesitas cambiarla, ¿a quién debes pedirle permiso?                       | responsable de sede o área                 | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `OPE-05` | Si llega mercancía diferente a la solicitada, ¿quién puede decidir que no se reciba?                                  | persona que recibe proveedores             | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `OPE-06` | Si al contar un producto la cantidad no coincide, ¿a quién debes pedirle permiso para cambiar la cantidad registrada? | responsable de inventario o sede           | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `OPE-07` | Si una venta quedó con el medio de pago equivocado, ¿a quién debes pedirle permiso para corregirlo?                   | cajero o responsable de sede               | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `OPE-08` | Si un horario ya fue enviado a los trabajadores, ¿a quién debes pedirle permiso para cambiarlo?                       | persona que administra horarios            | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `OPE-09` | Si una hora de entrada o salida quedó equivocada, ¿a quién debes pedirle permiso para corregirla?                     | trabajador o persona que revisa asistencia | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `OPE-10` | Si un cliente pide devolver un producto, ¿quién puede decir que sí o que no?                                          | cajero o responsable de sede               | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |
| `OPE-11` | Si se quiere dar al cliente un producto, descuento o dinero por un problema, ¿quién puede decir que sí o que no?      | cajero o responsable de sede               | un nombre, cargo, `NADIE` o `NO SÉ` | `PENDIENTE` |           |

**Origen:** `CAP-MAP-003`, `CAP-MAP-006`, inventario de controles `OPS-AUD-009`.

---

## A7. Validaciones profesionales o externas

Estas preguntas no deben responderse por intuición.

| ID       | Pregunta                                                                       | Responde                    | Qué debe escribir        | Estado      | Respuesta |
| -------- | ------------------------------------------------------------------------------ | --------------------------- | ------------------------ | ----------- | --------- |
| `EXT-01` | ¿La dirección de Oficina 1 debe actualizarse en Cámara de Comercio?            | asesor contable o jurídico  | `SÍ`, `NO` o `NO APLICA` | `PENDIENTE` |           |
| `EXT-02` | ¿La dirección de Oficina 1 debe actualizarse en el RUT?                        | asesor tributario           | `SÍ`, `NO` o `NO APLICA` | `PENDIENTE` |           |
| `EXT-03` | ¿La dirección de Oficina 1 debe actualizarse ante el banco?                    | Contabilidad o banco        | `SÍ`, `NO` o `NO APLICA` | `PENDIENTE` |           |
| `EXT-04` | ¿La dirección de Oficina 1 debe actualizarse ante la aseguradora?              | Gerencia o aseguradora      | `SÍ`, `NO` o `NO APLICA` | `PENDIENTE` |           |
| `EXT-05` | ¿Oficina 1 debe registrarse legalmente como un establecimiento de comercio?    | asesor jurídico o registral | `SÍ`, `NO` o `NO APLICA` | `PENDIENTE` |           |
| `EXT-06` | ¿Existe un documento vigente que permita a Vento usar la marca Vento Café?     | Gerencia o asesor jurídico  | `SÍ`, `NO` o `NO SÉ`     | `PENDIENTE` |           |
| `EXT-07` | ¿Existe un documento vigente que permita a Vento usar la marca Saudo?          | Gerencia o asesor jurídico  | `SÍ`, `NO` o `NO SÉ`     | `PENDIENTE` |           |
| `EXT-08` | ¿Existe un documento vigente que permita a Vento usar la marca Molka?          | Gerencia o asesor jurídico  | `SÍ`, `NO` o `NO SÉ`     | `PENDIENTE` |           |
| `EXT-09` | ¿Existe un documento vigente que permita a Vento usar la marca Vaila Vainilla? | Gerencia o asesor jurídico  | `SÍ`, `NO` o `NO SÉ`     | `PENDIENTE` |           |

**Origen:** `OPS-ADM-001`, `OPS-GOV-001`, `EXT-ADM-001`, `EXT-GOV-001`.

---

# B. Comprobaciones técnicas asignadas al asistente

Estas preguntas no se enviarán al usuario ni a los trabajadores. Deben resolverse inspeccionando repositorios, configuración, aplicaciones o datos autorizados.

| ID       | Pregunta técnica                                                                                                                          | Método de comprobación                                                         | Estado       | Respuesta                                                                                                                                                                                                                                                                                     |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TEC-01` | ¿Qué repositorio contiene actualmente AURA?                                                                                               | inventario de repositorios VENTO                                               | `RESPONDIDA` | Ninguno. AURA es solo una idea sin diseño ni implementación.                                                                                                                                                                                                                                  |
| `TEC-02` | ¿Qué rutas o pantallas funcionales existen actualmente en AURA?                                                                           | inspección del repositorio y ejecución local                                   | `RESPONDIDA` | Ninguna. Supabase registra cero rutas de navegación y cero pantallas.                                                                                                                                                                                                                         |
| `TEC-03` | ¿Qué capacidades de AURA funcionan realmente?                                                                                             | revisión de código y prueba controlada                                         | `RESPONDIDA` | Ninguna. `aura.access` es únicamente una reserva de catálogo.                                                                                                                                                                                                                                 |
| `TEC-04` | ¿Qué referencias a Oficina 1 o direcciones administrativas existen en los sistemas internos?                                              | búsqueda transversal de código, configuración y datos autorizados              | `RESPONDIDA` | No aparece “Oficina 1”. Supabase conserva `sites.address` y una sede administrativa `Vento Group` con dirección.                                                                                                                                                                              |
| `TEC-05` | ¿Qué tablas o servicios conservan actualmente información de ventas?                                                                      | inspección de esquema, clientes y aplicaciones                                 | `RESPONDIDA` | Pedidos en `orders` y relacionadas; pagos en `payments.transactions`; POS en esquema `pos`; importaciones externas en tablas `pulso_*`.                                                                                                                                                       |
| `TEC-06` | ¿Qué tablas o servicios conservan actualmente información de inventario?                                                                  | inspección de NEXO y esquema canónico                                          | `RESPONDIDA` | NEXO y las tablas `inventory_*`, `restock_*`, `remission_*`, productos, perfiles y ubicaciones.                                                                                                                                                                                               |
| `TEC-07` | ¿Qué tablas o servicios conservan actualmente información de compras?                                                                     | inspección de ORIGO y esquema canónico                                         | `RESPONDIDA` | ORIGO y las tablas de proveedores, `purchase_orders`, `procurement_*` e `inventory_entries`.                                                                                                                                                                                                  |
| `TEC-08` | ¿Qué tablas o servicios conservan actualmente información de producción?                                                                  | inspección de FOGO y esquema canónico                                          | `RESPONDIDA` | FOGO y las tablas de recetas, solicitudes, lotes, consumos, salidas, paquetes y rutas de producción.                                                                                                                                                                                          |
| `TEC-09` | ¿Qué tablas o servicios conservan actualmente información financiera?                                                                     | inspección de NUMERA y esquema canónico                                        | `RESPONDIDA` | `cost_centers`, tablas `numera_*`, costos de inventario, precios internos, pagos y billetera. No existe contabilidad completa.                                                                                                                                                                |
| `TEC-10` | ¿Qué referencias técnicas existen actualmente a Makos?                                                                                    | búsqueda transversal de repositorios e integraciones                           | `RESPONDIDA` | PULSO carga manualmente Excel Makos, lo convierte en filas y permite mapear productos. No existe conexión automática.                                                                                                                                                                         |
| `TEC-11` | ¿Existe una integración automática entre Shopify y alguna aplicación VENTO?                                                               | inspección de código, funciones y secretos declarados sin exponer valores      | `RESPONDIDA` | `NO`. No apareció en código, funciones, Edge Functions, Vault ni trabajos programados.                                                                                                                                                                                                        |
| `TEC-12` | ¿Existe una integración automática entre Rappi y alguna aplicación VENTO?                                                                 | inspección de código, funciones y configuración                                | `RESPONDIDA` | `NO`. Solo existe una regla visual “tipo Rappi”; no recibe pedidos ni usa la API de Rappi.                                                                                                                                                                                                    |
| `TEC-13` | ¿Existe una integración automática entre ManyChat y alguna aplicación VENTO?                                                              | inspección de código, funciones y configuración                                | `RESPONDIDA` | `NO`. No apareció en código, base de datos, funciones, Vault ni trabajos programados.                                                                                                                                                                                                         |
| `TEC-14` | ¿Qué sistemas internos permiten corregir horarios publicados?                                                                             | inspección de VISO, ANIMA y permisos relacionados                              | `RESPONDIDA` | VISO y ANIMA editan `employee_shifts`. VISO puede exigir publicar nuevamente el turno modificado.                                                                                                                                                                                             |
| `TEC-15` | ¿Qué sistemas internos permiten corregir marcaciones de asistencia?                                                                       | inspección de VISO, ANIMA y permisos relacionados                              | `RESPONDIDA` | Ninguno permite corregir la hora. ANIMA solo permite cambiar la nota de incidencia.                                                                                                                                                                                                           |
| `TEC-16` | ¿Qué sistemas internos permiten corregir medios de pago?                                                                                  | inspección de PULSO, integraciones y legado disponible                         | `RESPONDIDA` | Ninguno comprobado. Existen registros de pago, pero no una corrección manual auditable en PULSO.                                                                                                                                                                                              |
| `TEC-17` | ¿Qué aplicaciones tienen mecanismos de exportación utilizables para auditoría?                                                            | revisión por aplicación                                                        | `RESPONDIDA` | NEXO: CSV/Excel; VISO y ANIMA: Excel; ORIGO y FOGO: PDF. PULSO importa Excel, pero no exporta. En NUMERA no se encontró exportación.                                                                                                                                                          |
| `TEC-18` | ¿Qué contratos o estructuras duplicadas existen entre NEXO, FOGO, ORIGO, PULSO y NUMERA?                                                  | revisión de esquemas, tipos y flujos existentes                                | `RESPONDIDA` | Hay tipos de sedes, personas y productos repetidos; FOGO/ORIGO duplican compras; NEXO/FOGO duplican salidas de producción; PULSO repite tipos de pedidos. NUMERA repite `SiteRow`, `SiteOption`, `EmployeeRow`, sesión operativa y componentes estándar; algunas copias ya difieren de ORIGO. |
| `TEC-19` | ¿La exportación temporal de inventario desplegada el 21 de julio sigue siendo necesaria y puede reemplazarse o retirarse de forma segura? | revisar el despliegue remoto y retirarlo únicamente con autorización explícita | `RESPONDIDA` | Fue eliminada de `vento-os-dev` el 2026-07-23 por instrucción explícita del usuario. Una segunda comprobación remota confirmó que ya no está desplegada. No se encontró una fuente local canónica.                                                                                            |

**Regla:** cualquier comprobación que involucre Supabase se ejecutará desde `vento-shell`.

**Evidencia detallada:** `AUDITORIA_TECNICA_TEC-01_A_TEC-18_2026-07-23.md`.

```text
Resultado de la sección B:
19 RESPONDIDAS
0 POR_COMPROBAR
0 PENDIENTES
```

---

# C. Dudas diferidas hasta diseño, prototipo o piloto

Estas dudas están registradas, pero no deben convertirse todavía en cuestionarios.

| ID       | Duda                                                                    | Momento de resolución                                                               | Estado     |
| -------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ---------- |
| `DIF-01` | Definir la fuente de verdad objetivo de cada dato                       | nivel funcional resuelto en `CAP-MAP-008`; ubicación física en BLOQUE E3            | `RESUELTA` |
| `DIF-02` | Definir contratos entre aplicaciones                                    | nivel funcional resuelto en `CAP-MAP-009`; mecanismo técnico en BLOQUE X            | `RESUELTA` |
| `DIF-03` | Definir permisos y segregación objetivo                                 | resuelto funcionalmente en `CAP-MAP-010`; implementación en bloques de autorización | `RESUELTA` |
| `DIF-04` | Definir reversión de anulaciones y devoluciones                         | dominio funcional y catálogo de procesos                                            | `DIFERIDA` |
| `DIF-05` | Definir funcionamiento sin internet                                     | requisitos no funcionales y piloto                                                  | `DIFERIDA` |
| `DIF-06` | Definir reintentos e idempotencia                                       | diseño técnico e integración                                                        | `DIFERIDA` |
| `DIF-07` | Definir recuperación por caída de energía, red o dispositivo            | continuidad y piloto                                                                | `DIFERIDA` |
| `DIF-08` | Medir volúmenes y tiempos que todavía no tienen cifras confiables       | instrumentación y piloto                                                            | `DIFERIDA` |
| `DIF-09` | Resolver variantes menores por sede o turno                             | prototipo con usuarios reales                                                       | `DIFERIDA` |
| `DIF-10` | Definir el propietario objetivo del soporte tecnológico                 | diseño de capacidades de tecnología                                                 | `DIFERIDA` |
| `DIF-11` | Separar traslado interno de entrega al cliente en contratos definitivos | resuelto funcionalmente en `CAP-MAP-007` a `CAP-MAP-009`                            | `RESUELTA` |
| `DIF-12` | Separar propiedad documental según el hecho respaldado                  | resuelto funcionalmente en `CAP-MAP-007`, `CAP-MAP-008` y `CAP-MAP-011`             | `RESUELTA` |
| `DIF-13` | Separar hechos operativos y análisis consolidado                        | resuelto funcionalmente en `CAP-MAP-007` a `CAP-MAP-009`                            | `RESUELTA` |
| `DIF-14` | Definir reglas de imputación de costos compartidos                      | `OPS-CST-001` y NUMERA                                                              | `DIFERIDA` |
| `DIF-15` | Definir el modelo objetivo de catering y ventas B2B                     | `OPS-CAN-001`, `OPS-B2B-001` y diseño comercial                                     | `DIFERIDA` |

---

# D. Preguntas exclusivas para el usuario

Después de deduplicar contra auditorías y decisiones aprobadas:

```text
Preguntas exclusivas para el usuario en este corte: 0
```

Si posteriormente aparece una decisión que solo el usuario pueda tomar:

1. se añadirá aquí;
2. tendrá una sola respuesta;
3. indicará el efecto de cada opción;
4. no se mezclará con preguntas operativas o técnicas;
5. no se preguntará hasta agotar la evidencia disponible.

---

# E. Historial de respuestas

Cada respuesta incorporada se registrará aquí para impedir que vuelva a preguntarse.

| Fecha      | ID                            | Respuesta incorporada                                                                                                                                                                                                                                                                                               | Evidencia o persona que respondió                                                                                     | Cambio producido                                                                                                                |
| ---------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| 2026-07-23 | `ADM-04`                      | No existe una entrada interna directa desde Vento Café                                                                                                                                                                                                                                                              | respuesta escrita por el usuario en el registro                                                                       | respuesta conservada; pregunta marcada `RESPONDIDA`                                                                             |
| 2026-07-23 | `ADM-05`                      | Oficina 1 no comparte la entrada pública de Vento Café                                                                                                                                                                                                                                                              | respuesta escrita por el usuario en el registro                                                                       | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `ADM-06`                      | Oficina 1 no comparte servicios públicos con Vento Café                                                                                                                                                                                                                                                             | respuesta escrita por el usuario en el registro                                                                       | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `ADM-10`                      | 6 personas trabajan habitualmente en Oficina 1                                                                                                                                                                                                                                                                      | respuesta escrita por el usuario en el registro                                                                       | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `ADM-11`                      | Propietario, gerente general, gerente de Vento Café, contador y Marketing                                                                                                                                                                                                                                           | respuesta escrita por el usuario en el registro                                                                       | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `ADM-12`                      | Sí se guarda efectivo habitualmente en Oficina 1                                                                                                                                                                                                                                                                    | respuesta escrita por el usuario en el registro                                                                       | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `ADM-13`                      | Sí se guardan documentos empresariales originales en Oficina 1                                                                                                                                                                                                                                                      | respuesta escrita por el usuario en el registro                                                                       | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `GOV-02`                      | Vento Group S.A.S.                                                                                                                                                                                                                                                                                                  | `docs/RUT/RUT VENTO 2026 MAYO..pdf` + auditoría E1                                                                    | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `GOV-03`                      | Jefersson García — persona natural                                                                                                                                                                                                                                                                                  | confirmación del usuario + `docs/RUT/RUT JEFERSSON GARCIA 2026.pdf` + `docs/RUT/SAUDO CAMARA DE COMERCIO.pdf`         | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `GOV-04`                      | Nathalia Carolina Ibarra Ariza — persona natural                                                                                                                                                                                                                                                                    | confirmación del usuario + `docs/RUT/RUT NATHALIA CAROLINA IBARRA ARIZA.pdf`                                          | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `GOV-06`                      | Vento Group S.A.S. — establecimiento Vento Producción                                                                                                                                                                                                                                                               | `docs/RUT/RUT VENTO 2026 MAYO..pdf` + auditoría E1                                                                    | pregunta marcada `RESPONDIDA`                                                                                                   |
| 2026-07-23 | `TEC-01` a `TEC-03`           | AURA es únicamente una idea; no tiene repositorio, diseño, pantallas ni funciones                                                                                                                                                                                                                                   | confirmación directa del usuario + catálogo remoto de Supabase                                                        | comprobaciones marcadas `RESPONDIDA`                                                                                            |
| 2026-07-23 | `TEC-04` a `TEC-18`           | resultados de la auditoría técnica transversal                                                                                                                                                                                                                                                                      | repositorios VENTO + esquema, tablas, funciones y configuración remota de `vento-os-dev`                              | 14 comprobaciones marcadas `RESPONDIDA`; `TEC-18` marcada `POR_COMPROBAR`                                                       |
| 2026-07-23 | `TEC-19`                      | exportación temporal remota activa sin JWT y con token incrustado                                                                                                                                                                                                                                                   | inspección de la Edge Function desplegada sin exponer el token                                                        | comprobación nueva marcada `POR_COMPROBAR`                                                                                      |
| 2026-07-23 | `TEC-19`                      | Edge Function temporal `inventory-excel-export-20260721` retirada de `vento-os-dev`                                                                                                                                                                                                                                 | instrucción explícita del usuario + eliminación y segunda comprobación remota desde `vento-shell`                     | comprobación marcada `RESPONDIDA`                                                                                               |
| 2026-07-23 | `TEC-17` y `TEC-18`           | NUMERA no tiene exportación encontrada y repite contratos de sedes, empleados, sesión y navegación; algunas copias ya presentan deriva                                                                                                                                                                              | repositorio `vento-numera` incorporado al workspace y comparado con NEXO, FOGO, ORIGO y PULSO                         | `TEC-18` cerrada; sección B sin comprobaciones pendientes                                                                       |
| 2026-07-23 | `DIF-01`                      | la fuente objetivo funcional quedó definida por familia, subcapacidad y excepción; tablas y almacenamiento físico permanecen reservados para E3                                                                                                                                                                     | aprobación explícita de `CAP-MAP-008`                                                                                 | duda diferida marcada `RESUELTA` en su alcance funcional                                                                        |
| 2026-07-23 | `DIF-02`, `DIF-11` y `DIF-13` | quedaron definidos los contratos funcionales entre aplicaciones, la separación entre traslado interno y entrega al cliente, y la separación entre hechos operativos y análisis                                                                                                                                      | aprobación explícita de `CAP-MAP-009`                                                                                 | dudas marcadas `RESUELTA` en su alcance funcional; mecanismos técnicos permanecen diferidos                                     |
| 2026-07-23 | `ADM-02`                      | la dirección registral de Vento Group corresponde a la dirección del Centro de Producción                                                                                                                                                                                                                           | respuesta escrita por el usuario en el registro                                                                       | pregunta marcada `RESPONDIDA` sin exponer la dirección completa en el historial                                                 |
| 2026-07-23 | `GOV-05`, `GOV-08` a `GOV-12` | se confirmaron la ausencia actual de RUT propio para Vaila Vainilla y los titulares o alternativas de facturación usados por Vento Café, Saudo, Molka, Vaila Vainilla y catering                                                                                                                                    | respuestas escritas por el usuario en el registro                                                                     | respuestas conservadas; se evita asumir que marca, RUT y emisor de factura son siempre la misma persona o empresa               |
| 2026-07-23 | `DIF-03`                      | quedaron definidos los controles funcionales, acciones separadas, doble control y tratamiento de excepciones para equipos pequeños                                                                                                                                                                                  | aprobación explícita de `CAP-MAP-010`                                                                                 | duda marcada `RESUELTA` en su alcance funcional; implementación física permanece diferida                                       |
| 2026-07-23 | `DIF-12`                      | cada documento y evidencia queda asociado a la aplicación propietaria del hecho que respalda                                                                                                                                                                                                                        | aprobación explícita de `CAP-MAP-011`                                                                                 | duda marcada `RESUELTA` en su alcance funcional                                                                                 |
| 2026-07-23 | `DEC-POS-001`                 | PULSO permitirá venta ágil a consumidor final sin registrar al cliente cuando no solicite documento a su nombre; toda venta conservará documento fiscal aplicable, impuestos y trazabilidad                                                                                                                         | aclaración directa del usuario + Resolución DIAN 000202 de 2025 y compilación vigente de la Resolución 000165 de 2023 | decisión incorporada sin interpretar “consumidor final” como ocultamiento de venta o reducción automática de impuestos          |
| 2026-07-23 | `DEC-CAP-013-001`             | las colaboraciones entre aplicaciones quedan separadas por resultado; la única propiedad competidora funcional confirmada es la edición de horarios en VISO y ANIMA, y `TEC-18` conserva el frente de duplicación técnica                                                                                           | `CAP-MAP-004` a `CAP-MAP-012`, `TEC-14`, `TEC-15` y `TEC-18`                                                          | decisión incorporada en `CAP-MAP-013` sin crear preguntas nuevas ni autorizar implementación                                    |
| 2026-07-23 | `DEC-CAP-014-001`             | TALENTO existe con código y esquema remoto pero sin datos; VISO CMS y el sitio público cubren parcialmente comunicación; VITAL no cubre salud laboral; se conservan trece frentes de brecha sin agregar nuevas capacidades                                                                                          | repositorios VENTO, tablas remotas de `vento-os-dev`, `TEC-01` a `TEC-19` y `CAP-MAP-001` a `CAP-MAP-013`             | decisión incorporada en `CAP-MAP-014` sin crear preguntas nuevas ni autorizar implementación                                    |
| 2026-07-23 | `DEC-TALENTO-001`             | TALENTO será un proyecto futuro y portal de empleo previo a ANIMA: publicará vacantes, recibirá postulaciones, datos y documentos por etapa, conservará el pre-registro y transferirá a ANIMA/VISO únicamente a la persona vinculada; período de prueba y vinculación definitiva serán estados del mismo trabajador | aclaración directa del usuario                                                                                        | decisión incorporada en `CAP-MAP-014`; la base técnica existente no se declara adoptada ni autoriza acceso laboral anticipado   |
| 2026-07-23 | `DEC-VITAL-001`               | VITAL es un proyecto personal separado de salud y entrenamiento, con relación secundaria a Vento Group y actualmente parcialmente abandonado                                                                                                                                                                        | aclaración directa del usuario                                                                                        | queda fuera de la línea base operativa de Vento OS sin eliminar su código o datos y sin usarlo como cobertura de salud laboral  |
| 2026-07-23 | `DEC-BRECHAS-001`             | las trece brechas de `CAP-MAP-014` quedan enlazadas con tareas canónicas; se crean `CAP-TAL-001` a `CAP-TAL-006` porque el recorrido TALENTO → ANIMA no tenía tareas propias                                                                                                                                        | revisión transversal del roadmap y aclaración del usuario                                                             | las nuevas tareas quedan en cobertura empresarial obligatoria y no solo en el registro histórico                                |
| 2026-07-23 | `DEC-CAP-015-001`             | se propone `LB-CAP-VENTO-001 v1.0` como línea base de 18 familias, 217 subcapacidades, fronteras candidatas, trece brechas y destinos ejecutables                                                                                                                                                                   | consolidación de `CAP-MAP-001` a `CAP-MAP-014`                                                                        | propuesta incorporada en `CAP-MAP-015`; no crea preguntas, no cierra evidencia operativa pendiente y no autoriza implementación |
| 2026-07-23 | `DEC-CAP-015-002`             | se aprueba `LB-CAP-VENTO-001 v1.0` y se habilita el inicio de la auditoría técnica                                                                                                                                                                                                                                  | aprobación explícita del usuario                                                                                      | `CAP-MAP-015` cerrada; `CODE-AUD-001` pasa a propuesta                                                                          |
| 2026-07-23 | `DEC-CODE-001-001`            | ANIMA y PASS son aplicaciones móviles Expo; sus endpoints web son auxiliares. AURA no tiene ninguna superficie actual y queda diferida para planeación futura                                                                                                                                                       | aclaración del usuario + repositorios, EAS, tiendas, Vercel y comprobación HTTP                                       | corrección incorporada en `CODE-AUD-001` sin crear una aplicación web ficticia ni reabrir AURA                                  |
| 2026-07-23 | `DEC-CODE-001-002`            | se aprueba el inventario de doce repositorios, ocho aplicaciones web, dos aplicaciones móviles operativas, superficies auxiliares e infraestructura compartida                                                                                                                                                      | aprobación explícita del usuario                                                                                      | `CODE-AUD-001` cerrada; `CODE-AUD-002` pasa a propuesta                                                                         |
| 2026-07-23 | `DEC-CODE-002-001`            | se propone un inventario de 168 rutas web, pantallas móviles, layouts, 290 módulos activos de componentes y 256 módulos candidatos de captura                                                                                                                                                                       | inspección estática transversal de los doce repositorios                                                              | los conteos no declaran funcionamiento; diez hallazgos continúan a tareas existentes y no se crean preguntas nuevas             |
| 2026-07-23 | `DEC-CODE-002-002`            | se aprueba el inventario de rutas, layouts, pantallas, componentes y candidatos de captura                                                                                                                                                                                                                         | aprobación explícita del usuario                                                                                      | `CODE-AUD-002` cerrada; `CODE-AUD-003` pasa a propuesta                                                                        |
| 2026-07-23 | `DEC-CODE-003-001`            | se propone clasificar el comportamiento en nueve estados y conservar por aplicación las acciones localizadas, sus efectos y las pruebas todavía no ejecutadas                                                                                                                                                     | inspección estática de interfaces, Server Actions, Supabase, RPC, Edge Functions, HTTP y capacidades de dispositivo   | se confirma la suscripción pública sin efecto; doce hallazgos continúan a tareas existentes y no se crean preguntas nuevas      |
| 2026-07-23 | `DEC-CODE-003-002`            | se aprueba el inventario de acciones de usuario y comportamiento efectivo                                                                                                                                                                                                                                          | aprobación explícita del usuario                                                                                      | `CODE-AUD-003` cerrada; `CODE-AUD-004` pasa a propuesta                                                                        |
| 2026-07-23 | `DEC-CODE-004-001`            | se propone el inventario transversal de hooks, servicios, adaptadores, consultas y estado local con separación entre archivos con señales y contratos realmente probados                                                                                                                                          | inspección estática de los doce repositorios, dependencias, clientes Supabase, persistencia local y ubicación de consultas | se registran catorce hallazgos en tareas existentes; no se crean preguntas ni se ejecutan mutaciones productivas                |
| 2026-07-23 | `DEC-CODE-004-002`            | se aprueba el inventario de hooks, servicios, adaptadores, consultas y estado local                                                                                                                                                                                                                                 | aprobación explícita del usuario                                                                                      | `CODE-AUD-004` cerrada; `CODE-AUD-005` pasa a propuesta                                                                        |
| 2026-07-23 | `DEC-CODE-005-001`            | se propone el inventario contrastado de Server Actions, API routes, RPC, Edge Functions y jobs, diferenciando existencia local, consumo y despliegue remoto                                                                                                                                                        | inspección estática de doce repositorios + metadatos remotos de `vento-os-dev` consultados desde `vento-shell`        | se registran dieciocho hallazgos en tareas existentes; no se ejecutan funciones, jobs, RPC ni mutaciones productivas             |
| 2026-07-23 | `DEC-CODE-005-002`            | se aprueba el inventario de Server Actions, API routes, RPC, Edge Functions y jobs                                                                                                                                                                                                                                 | aprobación explícita del usuario                                                                                      | `CODE-AUD-005` cerrada; `CODE-AUD-006` pasa a propuesta                                                                         |
| 2026-07-23 | `DEC-CODE-006-001`            | se propone el vínculo contrastado entre código, relaciones PostgreSQL, vistas, buckets, suscripciones Realtime y eventos efectivos                                                                                                                                                                                  | inspección estática de doce repositorios + metadatos remotos de `vento-os-dev` consultados desde `vento-shell`        | se registran dieciocho hallazgos en tareas existentes; no se crean preguntas ni se ejecutan lecturas de objetos o mutaciones     |

---

# F. Control de incorporación

Cuando aparezca una duda nueva:

1. buscar su posible duplicado en este archivo;
2. revisar las auditorías y decisiones aprobadas;
3. asignar responsable;
4. convertirla en una sola pregunta;
5. indicar formato;
6. asignar el siguiente código de su categoría;
7. registrar respuesta y fecha cuando se resuelva;
8. actualizar la tarea o diseño afectado;
9. conservar la respuesta en el historial.
