### MINI-BLOQUE — CLASIFICACIÓN BRECHAS Y APROBACIÓN

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **clasificación brechas y aprobación** dentro de **E1 DESCUBRIMIENTO OPERATIVO**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `CAP-MAP-012` a `CAP-MAP-015` — 4 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `CAP-MAP-012`: Clasificar capacidad núcleo, soporte, transversal, futura o fuera de alcance
- `CAP-MAP-013`: Detectar capacidades duplicadas o con propiedad competidora
- `CAP-MAP-014`: Detectar capacidades necesarias que no aparecen en código ni datos actuales
- `CAP-MAP-015`: Aprobar la línea base de capacidades actuales, necesarias y candidatas de Vento Group
<!-- PLAN-SECTION-META:END -->

### ✅ CAP-MAP-012 — Clasificar capacidad núcleo, soporte, transversal, futura o fuera de alcance

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** clasificación documental de capacidades
**Dependencia anterior:** `CAP-MAP-011`
**Continuidad reservada:** `CAP-MAP-013`

---

#### 1. Resultado de esta tarea

Esta tarea asigna una clasificación principal a las **217 subcapacidades**:

- `NÚCLEO`;
- `SOPORTE`;
- `TRANSVERSAL`;
- `FUTURA`;
- `FUERA_DE_ALCANCE`.

La clasificación responde:

```text
¿qué relación tiene esta capacidad con el funcionamiento empresarial de Vento?
```

No responde todavía:

- en qué orden se implementa;
- cuánto cuesta;
- qué aplicación está más avanzada;
- qué pantalla debe construirse primero;
- qué brecha es más urgente.

---

#### 2. Definiciones

| Clasificación      | Significado                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| `NÚCLEO`           | produce o protege directamente la oferta, abastecimiento, producción, venta, atención o entrega                                      |
| `SOPORTE`          | permite que el núcleo funcione con personas, activos, instalaciones o desarrollo comercial                                           |
| `TRANSVERSAL`      | gobierna, controla, informa o protege varias familias a la vez                                                                       |
| `FUTURA`           | resultado empresarial deliberadamente reservado para una etapa posterior y todavía no necesario para la operación objetivo inmediata |
| `FUERA_DE_ALCANCE` | actividad que no corresponde ejecutar a Vento, aunque deba relacionarse con quien la realiza                                         |

Cada subcapacidad tendrá una sola clasificación principal. Sus relaciones con otras familias se conservan sin duplicarla.

---

#### 3. Reglas obligatorias

1. La clasificación describe la capacidad empresarial, no la aplicación.
2. Una capacidad manual puede ser `NÚCLEO`.
3. Una capacidad implementada puede seguir siendo `SOPORTE` o `TRANSVERSAL`.
4. Que AURA no exista no vuelve futuras todas las capacidades de mercadeo.
5. Usar un proveedor externo no deja la responsabilidad empresarial fuera de alcance.
6. Una obligación legal puede ser transversal aunque no produzca una venta.
7. `NÚCLEO` no significa implementar primero sin análisis adicional.
8. `SOPORTE` no significa opcional.
9. `TRANSVERSAL` no significa que SHELL o NUMERA sean propietarias de todo.
10. `FUTURA` no se usará para ocultar una brecha actual.
11. `FUERA_DE_ALCANCE` no se usará para excluir tareas incómodas, manuales o sin sistema.
12. La ausencia de código no determina la clasificación.

---

#### 4. Regla de cobertura

```text
clasificación de la subcapacidad
=
clasificación base de la familia
+ excepción específica
```

Las excepciones de esta tarea son únicamente seis:

- `CAP-12.02`;
- `CAP-12.06`;
- `CAP-12.07`;
- `CAP-14.07`;
- `CAP-14.08`;
- `CAP-14.09`.

Las demás subcapacidades heredan la clasificación de su familia.

---

#### 5. Clasificación base por familia

| Familia                                  | Cantidad | Clasificación base | Razón                                                          |
| ---------------------------------------- | -------: | ------------------ | -------------------------------------------------------------- |
| `CAP-01` Dirección y gobierno            |       10 | `TRANSVERSAL`      | orienta y controla toda la organización                        |
| `CAP-02` Personas y trabajo              |       13 | `SOPORTE`          | permite disponer de personas preparadas y vinculadas           |
| `CAP-03` Seguridad y salud               |       10 | `TRANSVERSAL`      | protege personas y cumplimiento en toda la operación           |
| `CAP-04` Productos y oferta              |       10 | `NÚCLEO`           | define lo que Vento produce, ofrece y vende                    |
| `CAP-05` Compras y proveedores           |       12 | `NÚCLEO`           | asegura los insumos y servicios necesarios para operar         |
| `CAP-06` Inventario y movimientos        |       15 | `NÚCLEO`           | protege disponibilidad, custodia y flujo físico                |
| `CAP-07` Activos                         |       13 | `SOPORTE`          | provee equipos y reutilizables para ejecutar el núcleo         |
| `CAP-08` Producción                      |       14 | `NÚCLEO`           | transforma insumos en resultados vendibles                     |
| `CAP-09` Venta y servicio                |       15 | `NÚCLEO`           | recibe, cobra y cierra la promesa al cliente                   |
| `CAP-10` Clientes                        |       10 | `NÚCLEO`           | atiende y protege la relación con el cliente                   |
| `CAP-11` Despacho y entrega              |       12 | `NÚCLEO`           | completa traslados y entregas comprometidas                    |
| `CAP-12` Finanzas                        |       15 | `TRANSVERSAL`      | registra y controla efectos económicos de todas las familias   |
| `CAP-13` Instalaciones                   |       11 | `SOPORTE`          | mantiene condiciones físicas para operar                       |
| `CAP-14` Mercadeo y desarrollo comercial |       11 | `SOPORTE`          | genera demanda y comunica la oferta                            |
| `CAP-15` Tecnología                      |       11 | `TRANSVERSAL`      | habilita y protege herramientas utilizadas por todas las áreas |
| `CAP-16` Información y documentos        |       11 | `TRANSVERSAL`      | protege evidencia y conocimiento de toda la organización       |
| `CAP-17` Datos y análisis                |       12 | `TRANSVERSAL`      | mide y mejora resultados de todas las familias                 |
| `CAP-18` Continuidad                     |       12 | `TRANSVERSAL`      | sostiene y recupera la operación completa                      |

---

#### 6. Excepciones específicas

| Subcapacidad                                         | Clasificación | Razón                                                                      |
| ---------------------------------------------------- | ------------- | -------------------------------------------------------------------------- |
| `CAP-12.02` Gestionar caja                           | `NÚCLEO`      | forma parte directa del cierre de la venta presencial                      |
| `CAP-12.06` Facturar y controlar documentos          | `NÚCLEO`      | completa el soporte fiscal y comercial de la operación de venta            |
| `CAP-12.07` Conciliar ventas, pagos y entregas       | `NÚCLEO`      | confirma que la promesa comercial quedó económica y operativamente cerrada |
| `CAP-14.07` Captar oportunidades de venta            | `NÚCLEO`      | inicia una oportunidad comercial concreta                                  |
| `CAP-14.08` Gestionar ventas a empresas              | `NÚCLEO`      | produce ventas B2B, no solo comunicación                                   |
| `CAP-14.09` Gestionar catering y eventos comerciales | `NÚCLEO`      | produce una venta y una entrega empresarial completa                       |

Estas excepciones cambian la clasificación de la subcapacidad, no la propiedad definida en `CAP-MAP-004` ni su fuente de verdad.

---

#### 7. Resultado cuantitativo

| Clasificación      | Subcapacidades |
| ------------------ | -------------: |
| `NÚCLEO`           |         **94** |
| `SOPORTE`          |         **45** |
| `TRANSVERSAL`      |         **78** |
| `FUTURA`           |          **0** |
| `FUERA_DE_ALCANCE` |          **0** |
| **Total**          |        **217** |

El resultado `0` en `FUTURA` y `FUERA_DE_ALCANCE` es deliberado:

- las 217 subcapacidades describen necesidades empresariales reales o necesarias;
- no se excluye una capacidad porque hoy sea manual, externa o incompleta;
- las capacidades futuras que todavía no estén en la taxonomía se detectarán en `CAP-MAP-014`;
- los límites externos se documentan sin retirar la responsabilidad interna de Vento.

---

#### 8. Cadena de capacidades núcleo

```text
definir producto y oferta
        ↓
comprar y recibir
        ↓
controlar inventario
        ↓
producir
        ↓
recibir pedido y vender
        ↓
cobrar y documentar
        ↓
atender y entregar
        ↓
conciliar el resultado
```

Una ruptura de compras, inventario, producción, venta, pago o entrega afecta directamente la promesa al cliente.

---

#### 9. Capacidades de soporte

Las capacidades de soporte no son decorativas ni prescindibles.

```text
personas preparadas
+ activos disponibles
+ instalaciones aptas
+ comunicación comercial
= núcleo capaz de operar de forma repetible
```

La falta de mantenimiento, personal, capacitación o condiciones físicas puede detener una capacidad núcleo aunque no produzca directamente una venta.

---

#### 10. Capacidades transversales

Las capacidades transversales:

- definen dirección y límites;
- protegen personas y cumplimiento;
- controlan dinero y obligaciones;
- gestionan tecnología;
- conservan documentos y evidencia;
- miden resultados;
- mantienen continuidad.

No se implementarán como un único “sistema transversal” universal. Cada resultado permanecerá en la aplicación propietaria definida en `CAP-MAP-008`.

---

#### 11. Regla especial para PULSO y el POS

Las siguientes capacidades permanecen `NÚCLEO`:

- `CAP-09.04` Registrar pedidos;
- `CAP-09.08` Registrar ventas;
- `CAP-09.09` Cobrar y confirmar pagos;
- `CAP-09.10` Emitir factura o soporte;
- `CAP-09.15` Cerrar y revisar la jornada;
- `CAP-12.02` Gestionar caja;
- `CAP-12.06` Facturar y controlar documentos;
- `CAP-12.07` Conciliar ventas, pagos y entregas.

PULSO deberá soportar dos recorridos legales y operativamente distintos:

| Recorrido                        | Identificación del comprador                                          | Resultado                                                        |
| -------------------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------------- |
| consumidor final                 | no se obliga a crear cliente cuando no solicita documento a su nombre | venta completa con documento fiscal aplicable a consumidor final |
| documento a nombre del comprador | se solicitan únicamente los datos permitidos y necesarios             | factura electrónica o documento aplicable identificado           |

Reglas:

1. El recorrido de consumidor final es una función normal del núcleo, no una excepción sospechosa.
2. No registrar un perfil de cliente no significa dejar de registrar la venta.
3. Toda venta conserva productos, valores, impuestos, pago, emisor y documento.
4. La identificación del comprador no determina por sí sola los impuestos.
5. El medio de pago no determina si la venta se registra.
6. PULSO no obligará a identificar a todos los clientes para cerrar una venta ordinaria.
7. PULSO tampoco permitirá usar consumidor final para ocultar ventas, cambiar impuestos o evitar trazabilidad.
8. El tipo documental deberá cumplir la regla DIAN vigente al momento de implementación.

---

#### 12. AURA y la categoría futura

AURA continúa siendo una idea sin diseño ni funciones, pero:

- comunicar;
- crear contenido;
- administrar medios;
- gestionar campañas;
- captar oportunidades;
- medir promoción;
- atender reputación

son capacidades empresariales actuales o necesarias.

Por eso:

```text
AURA = aplicación futura
CAP-14 = capacidades actuales clasificadas como SOPORTE o NÚCLEO
```

No se clasificará una capacidad como `FUTURA` solo porque su aplicación candidata todavía no exista.

---

#### 13. Límites externos

Las siguientes actividades son externas y no se incorporan como capacidades ejecutadas por Vento:

| Actividad externa                                         | Responsabilidad que sí conserva Vento                    |
| --------------------------------------------------------- | -------------------------------------------------------- |
| decidir o validar obligaciones de la DIAN                 | facturar, documentar y cumplir la regla aplicable        |
| procesar internamente operaciones del banco               | autorizar, registrar y conciliar movimientos propios     |
| operar la infraestructura de Rappi, Shopify o ManyChat    | recibir, controlar y conciliar pedidos propios           |
| operar la empresa de mensajería                           | asignar custodia y confirmar entrega                     |
| emitir conceptos jurídicos o tributarios profesionales    | entregar evidencia y ejecutar decisiones aplicables      |
| administrar sistemas internos de proveedores tecnológicos | controlar accesos, contratos, datos e incidentes propios |

La actividad del tercero queda fuera de alcance; gestionar la relación y el efecto sobre Vento permanece dentro.

---

#### 14. Relación con implementación y prioridad

La clasificación no determina por sí sola el orden.

El orden posterior deberá considerar:

```text
clasificación
+ riesgo
+ dependencia
+ brecha actual
+ valor empresarial
+ esfuerzo
+ capacidad de adopción
= prioridad de implementación
```

Una capacidad transversal de seguridad o una capacidad de soporte que bloquea producción puede implementarse antes que una mejora de núcleo.

---

#### 15. Dudas y decisiones incorporadas

No se crean preguntas nuevas.

Esta tarea incorpora:

- `DEC-POS-001`, sobre consumidor final y facturación solicitada;
- las respuestas de titulares y facturación `GOV-05`, `GOV-08` a `GOV-12`;
- la inexistencia actual de AURA confirmada en `TEC-01` a `TEC-03`;
- las fuentes y propietarios definidos en `CAP-MAP-004` a `CAP-MAP-011`.

Las validaciones tributarias concretas deberán refrescarse con Contabilidad y fuentes oficiales antes de implementar el POS.

---

#### 16. Lo que queda decidido

1. Las 217 subcapacidades tienen una clasificación principal.
2. Existen 94 subcapacidades núcleo, 45 de soporte y 78 transversales.
3. Ninguna de las 217 queda actualmente como futura o fuera de alcance.
4. Manual, incompleta o externa no significa fuera de alcance.
5. La aplicación candidata no determina la clasificación.
6. AURA es futura como aplicación, no como conjunto de necesidades empresariales.
7. Compras, inventario y producción forman parte del núcleo.
8. Venta, caja, facturación y conciliación forman parte del núcleo.
9. Ventas empresariales, catering y oportunidades concretas forman parte del núcleo.
10. Personas, activos, instalaciones y comunicación general son soporte.
11. Gobierno, cumplimiento, finanzas generales, tecnología, documentos, análisis y continuidad son transversales.
12. El POS a consumidor final es un recorrido núcleo legítimo.
13. Consumidor final no elimina registro, impuestos ni documento fiscal.
14. La clasificación no fija todavía prioridad de implementación.

---

#### 17. Lo que esta tarea no autoriza

- ocultar ventas o modificar impuestos;
- definir asesoría tributaria definitiva;
- implementar el POS;
- cambiar facturación actual;
- desarrollar AURA;
- retirar capacidades de la taxonomía;
- agregar capacidades sin análisis;
- cambiar propietarios, permisos o integraciones aprobados;
- modificar Supabase, código o migraciones;
- priorizar automáticamente todo lo clasificado como núcleo.

---

#### 18. Criterios de aceptación

`CAP-MAP-012` podrá aprobarse cuando:

- las 217 subcapacidades sumen exactamente el total clasificado;
- cada subcapacidad tenga una sola clasificación principal;
- núcleo, soporte y transversal se distingan claramente;
- ninguna capacidad se declare futura por falta de aplicación;
- ninguna capacidad se excluya por ser manual o externa;
- los límites con terceros conserven responsabilidad interna;
- PULSO contemple consumidor final sin registro obligatorio de cliente;
- toda venta conserve documento, impuestos y trazabilidad;
- la clasificación no se confunda con prioridad;
- no se creen preguntas duplicadas;
- no se autorice implementación;
- `CAP-MAP-013` permanezca como única continuidad inmediata.

---

#### 19. Resultado y continuidad

Al aprobarse esta tarea quedará definido:

```text
qué capacidades producen directamente valor
        ↓
cuáles habilitan la operación
        ↓
cuáles gobiernan varias familias
        ↓
qué límites corresponden a terceros
        ↓
qué candidatas futuras deberán detectarse después
```

La continuidad será exclusivamente:

```text
CAP-MAP-013
— Detectar capacidades duplicadas o con propiedad competidora
```

`CAP-MAP-013` revisará dónde dos aplicaciones, áreas o prácticas intentan gobernar el mismo resultado y distinguirá cooperación válida de duplicación empresarial.

### ✅ CAP-MAP-013 — Detectar capacidades duplicadas o con propiedad competidora

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** análisis documental de solapamientos y fronteras de propiedad
**Dependencia anterior:** `CAP-MAP-012`
**Continuidad reservada:** `CAP-MAP-014`

---

#### 1. Resultado de esta tarea

Esta tarea revisa las **217 subcapacidades** para detectar:

- dos capacidades que parecen producir el mismo resultado;
- dos aplicaciones que podrían intentar gobernar el mismo hecho;
- dos áreas que podrían corregir o aprobar el mismo resultado sin una frontera clara;
- copias manuales o técnicas que podrían convertirse en registros paralelos;
- colaboraciones legítimas que no deben eliminarse.

El propósito no es escoger la aplicación más visible. Es asegurar que cada resultado empresarial tenga:

1. una definición reconocible;
2. una sola fuente principal objetivo;
3. una frontera clara con los resultados relacionados;
4. consumidoras que no puedan corregir el original;
5. un tratamiento explícito cuando hoy exista duplicación.

---

#### 2. Definiciones en lenguaje directo

| Término                    | Significado                                                                                                     |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `DUPLICACIÓN_DE_CAPACIDAD` | dos nombres describen realmente el mismo resultado empresarial                                                  |
| `PROPIEDAD_COMPETIDORA`    | dos aplicaciones o áreas pueden crear, corregir o cerrar versiones independientes del mismo hecho               |
| `COLABORACIÓN_VÁLIDA`      | varias aplicaciones o personas intervienen, pero cada una produce un resultado diferente y enlazado             |
| `COPIA_CONTROLADA`         | una aplicación conserva una referencia o lectura derivada sin poder alterar el original                         |
| `FUENTE_SOMBRA`            | Excel, chat, papel, archivo o sistema secundario termina gobernando un estado que debería tener una sola fuente |
| `DUPLICACIÓN_TÉCNICA`      | código, tipos o componentes repetidos; puede causar deriva, pero no crea por sí sola otra capacidad empresarial |

Dos pantallas parecidas no prueban duplicación. Dos lugares capaces de cambiar de manera independiente el mismo estado sí crean propiedad competidora.

---

#### 3. Prueba obligatoria para comparar dos candidatos

Cada posible cruce se evaluará con estas preguntas:

1. ¿Producen el mismo resultado para el mismo objeto?
2. ¿El resultado tiene el mismo momento de inicio y cierre?
3. ¿Ambos lugares pueden crearlo o corregirlo?
4. ¿Una modificación puede dejar versiones contradictorias?
5. ¿Uno de los registros podría ser solo una lectura o efecto derivado?
6. ¿La separación cambia por etapa, propósito, objeto o tipo de incidente?
7. ¿Puede señalarse una única fuente que explique el estado vigente?

Interpretación:

```text
mismo resultado + dos controles independientes
= duplicación o propiedad competidora

resultados distintos + enlace explícito
= colaboración válida
```

---

#### 4. Estados permitidos

| Estado                           | Uso                                                                                |
| -------------------------------- | ---------------------------------------------------------------------------------- |
| `SIN_DUPLICACIÓN`                | el resultado y su propietaria están suficientemente separados                      |
| `FRONTERA_DEFINIDA`              | existía solapamiento aparente y queda resuelto mediante una división explícita     |
| `DUPLICACIÓN_AS_IS_CONFIRMADA`   | hoy dos superficies o prácticas controlan el mismo resultado                       |
| `DUPLICACIÓN_TÉCNICA_CONFIRMADA` | existen contratos o estructuras de código repetidos que deberán converger          |
| `RIESGO_DE_FUENTE_SOMBRA`        | existe una copia manual que debe auditarse antes de tratarla como duplicación real |
| `PENDIENTE_DE_EVIDENCIA`         | no existe evidencia suficiente para decidir sin observación adicional              |

`PENDIENTE_DE_EVIDENCIA` solo se utilizará cuando las tareas y auditorías anteriores no permitan tomar una decisión. No se abrirán preguntas por precaución genérica.

---

#### 5. Regla de cobertura de las 217 subcapacidades

Las 217 subcapacidades quedan cubiertas así:

```text
resultado definido en CAP-MAP-001 y CAP-MAP-002
+ propietaria y consumidoras de CAP-MAP-004 y CAP-MAP-005
+ actores de CAP-MAP-006
+ información, fuente, eventos, permisos y evidencia de CAP-MAP-007 a CAP-MAP-011
+ frontera específica de esta tarea cuando exista solapamiento
= decisión de duplicación para cada subcapacidad
```

Si una subcapacidad no aparece en los apartados 7 a 11, conserva el resultado, la propietaria y la fuente ya aprobados y queda `SIN_DUPLICACIÓN`.

---

#### 6. Resultado general por familia

| Familia                | Cruce principal revisado                           | Decisión                                                                                                   |
| ---------------------- | -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `CAP-01` Dirección     | Gerencia frente a VISO                             | la decisión sigue siendo humana; VISO registra estructura, reglas y evidencia                              |
| `CAP-02` Personas      | VISO frente a ANIMA                                | administración laboral y experiencia personal se separan; existe una duplicación AS-IS puntual en horarios |
| `CAP-03` Cumplimiento  | VISO, responsables y asesores                      | VISO conserva seguimiento; responsables y asesores ejecutan o validan sin crear otra fuente                |
| `CAP-04` Producto      | NEXO, FOGO y PULSO                                 | identidad de producto, receta y oferta vendible son resultados distintos y enlazados                       |
| `CAP-05` Compras       | ORIGO frente a NEXO                                | ORIGO gobierna compra y aceptación; NEXO registra el efecto en existencias                                 |
| `CAP-06` Inventario    | NEXO frente a aplicaciones originadoras            | NEXO gobierna existencia; las demás originan hechos que producen movimientos                               |
| `CAP-07` Activos       | NEXO, mantenimiento e instalaciones                | activo móvil y condición de instalación se separan por objeto                                              |
| `CAP-08` Producción    | FOGO frente a NEXO                                 | FOGO gobierna orden, lote y rendimiento; NEXO gobierna el movimiento aceptado                              |
| `CAP-09` Ventas        | PULSO, plataformas externas y NEXO                 | PULSO gobierna pedido y venta; externos originan solicitudes y NEXO informa disponibilidad                 |
| `CAP-10` Clientes      | PULSO frente a PASS                                | PASS gobierna identidad y autorización del cliente; PULSO usa los datos mínimos para atender y vender      |
| `CAP-11` Entregas      | NEXO frente a PULSO                                | traslado entre lugares pertenece a NEXO; entrega de pedido al cliente pertenece a PULSO                    |
| `CAP-12` Finanzas      | PULSO, NUMERA y sistema contable                   | PULSO gobierna operación de venta y caja; NUMERA gobierna efecto económico interno y análisis              |
| `CAP-13` Instalaciones | NEXO, responsables y proveedores                   | NEXO registra activo, condición y novedad; la ejecución especializada puede ser externa                    |
| `CAP-14` Mercadeo      | AURA, PULSO, PASS y NUMERA                         | campaña, oportunidad, venta, identidad y medición son resultados distintos                                 |
| `CAP-15` Tecnología    | VISO, SHELL, NEXO y aplicación afectada            | acceso laboral, entrada al ecosistema, activo tecnológico y permiso funcional se separan                   |
| `CAP-16` Documentos    | gobierno transversal frente a aplicación del hecho | las reglas documentales son transversales; el documento permanece con el hecho respaldado                  |
| `CAP-17` Análisis      | NUMERA frente a fuentes operativas                 | NUMERA analiza; no recrea ventas, existencias, producción ni asistencia                                    |
| `CAP-18` Continuidad   | SHELL frente a aplicación afectada                 | cada aplicación recupera su resultado; SHELL coordina acceso y comunicación cuando corresponda             |

No se asigna una familia completa a SHELL, NUMERA o VISO únicamente porque sea transversal.

---

#### 7. Solapamientos de la propia taxonomía

##### 7.1. Riesgo, inspección y continuidad

| Capacidades relacionadas                             | Frontera aprobable                                                                                         | Estado              |
| ---------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-01.07`, `CAP-03.01` y `CAP-18.01`               | riesgo empresarial, peligro laboral y dependencia de continuidad son objetos diferentes                    | `FRONTERA_DEFINIDA` |
| `CAP-03.07` y `CAP-13.07`                            | la primera comprueba una obligación o control; la segunda comprueba la condición física de una instalación | `FRONTERA_DEFINIDA` |
| `CAP-03.04`, `CAP-15.07` y `CAP-18.03` a `CAP-18.10` | incidente laboral, falla tecnológica y coordinación de continuidad conservan ciclos separados              | `FRONTERA_DEFINIDA` |
| `CAP-03.10` y `CAP-17.11`                            | acción correctiva de cumplimiento frente a acción general de mejora                                        | `FRONTERA_DEFINIDA` |

Una falla tecnológica que interrumpe la operación puede originar simultáneamente un caso `CAP-15.07` y una respuesta `CAP-18`, pero ambos deben enlazarse y no convertirse en un único registro ambiguo.

##### 7.2. Activos, instalaciones y mantenimiento

| Capacidades relacionadas  | Frontera aprobable                                                                          | Estado              |
| ------------------------- | ------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-07.07` y `CAP-13.02` | mantenimiento de activo o equipo móvil frente a mantenimiento de espacio o instalación fija | `FRONTERA_DEFINIDA` |
| `CAP-07.08` y `CAP-13.03` | reparación del activo identificado frente a reparación de la instalación                    | `FRONTERA_DEFINIDA` |
| `CAP-07.06` y `CAP-13.11` | condición del activo frente a novedad de la instalación                                     | `FRONTERA_DEFINIDA` |

Si una instalación contiene un equipo identificable, la solicitud debe indicar cuál es el objeto principal. No se crearán dos reparaciones independientes para el mismo daño.

##### 7.3. Venta empresarial, catering, reservas y eventos

| Capacidades relacionadas  | Frontera aprobable                                                                                | Estado              |
| ------------------------- | ------------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-14.07`               | captura una oportunidad antes de que exista compromiso comercial                                  | `FRONTERA_DEFINIDA` |
| `CAP-14.08` y `CAP-14.09` | gestionan contacto, propuesta, negociación y aceptación comercial B2B o de evento                 | `FRONTERA_DEFINIDA` |
| `CAP-10.08`               | conserva la reserva, asistentes, fecha y compromisos de atención del cliente                      | `FRONTERA_DEFINIDA` |
| `CAP-09.14`               | ejecuta en PULSO el pedido especial ya aceptado: productos, cantidades, cobro, documento y estado | `FRONTERA_DEFINIDA` |

Por tanto:

```text
oportunidad
→ propuesta y negociación
→ reserva o compromiso
→ pedido aceptado
→ venta, preparación y entrega
```

No se eliminan estas subcapacidades. Se separan por etapa y resultado para evitar que AURA, PASS y PULSO creen tres ventas independientes.

##### 7.4. Venta, facturación y finanzas

| Capacidades relacionadas  | Frontera aprobable                                                                        | Estado              |
| ------------------------- | ----------------------------------------------------------------------------------------- | ------------------- |
| `CAP-09.09` y `CAP-12.02` | pago aplicado al pedido frente a sesión, arqueo y cierre de caja                          | `FRONTERA_DEFINIDA` |
| `CAP-09.10` y `CAP-12.06` | emisión del documento de la venta frente a gobierno, vigencia y control fiscal-documental | `FRONTERA_DEFINIDA` |
| `CAP-09.15` y `CAP-12.07` | cierre operativo de jornada frente a conciliación entre ventas, pagos y entregas          | `FRONTERA_DEFINIDA` |
| `CAP-12.01` y `CAP-17.09` | registro del efecto económico frente a análisis de costo y rentabilidad                   | `FRONTERA_DEFINIDA` |

PULSO conservará la venta, el pago aplicado, el documento emitido y la caja operativa. NUMERA recibirá efectos confirmados y no podrá corregir la venta original.

##### 7.5. Servicio al cliente y corrección de ventas

| Capacidades relacionadas  | Frontera aprobable                                                        | Estado              |
| ------------------------- | ------------------------------------------------------------------------- | ------------------- |
| `CAP-09.05` y `CAP-10.03` | cambiar el pedido vigente frente a atender una solicitud del cliente      | `FRONTERA_DEFINIDA` |
| `CAP-10.04` y `CAP-10.05` | investigar reclamo frente a ejecutar devolución o compensación autorizada | `FRONTERA_DEFINIDA` |
| `CAP-10.05` y `CAP-12.01` | decisión operativa de devolución frente a efecto económico confirmado     | `FRONTERA_DEFINIDA` |

La atención puede iniciar el caso, pero no modifica por sí sola la venta, el inventario o el hecho económico.

##### 7.6. Documentos, evidencia y análisis

| Capacidades relacionadas                                      | Frontera aprobable                                                                                                                      | Estado              |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| `CAP-16.02` a `CAP-16.09` frente a documentos de cada familia | CAP-16 define clasificación, aprobación, vigencia, acceso y conservación; la aplicación del hecho crea y custodia el documento concreto | `FRONTERA_DEFINIDA` |
| `CAP-17.02` frente a registros operativos                     | recopilar para análisis no permite recrear o corregir el hecho fuente                                                                   | `FRONTERA_DEFINIDA` |
| `CAP-17.03` frente a controles de cada dominio                | NUMERA puede señalar un problema de calidad; la propietaria corrige el origen con trazabilidad                                          | `FRONTERA_DEFINIDA` |

---

#### 8. Fronteras entre aplicaciones que quedan confirmadas

##### 8.1. VISO y ANIMA

| Resultado                                                 | Propietaria objetivo | Participación de la otra aplicación                      |
| --------------------------------------------------------- | -------------------- | -------------------------------------------------------- |
| persona, relación laboral, sede, función y turno aprobado | VISO                 | ANIMA presenta al trabajador lo necesario                |
| marcación original de entrada o salida                    | ANIMA                | VISO revisa asistencia y gestiona novedades              |
| novedad laboral y decisión administrativa                 | VISO                 | ANIMA permite al trabajador informar o consultar         |
| documento personal aportado por el trabajador             | ANIMA                | VISO consume lo autorizado para administración           |
| cierre de relación y retiro de acceso laboral             | VISO                 | cada aplicación ejecuta el cierre de su sesión o permiso |

`TEC-14` confirma una propiedad competidora actual: **VISO y ANIMA pueden editar `employee_shifts`**. El objetivo será:

```text
VISO publica o corrige el turno
→ ANIMA lo consulta
→ ANIMA no mantiene una segunda edición independiente
```

Esta es una `DUPLICACIÓN_AS_IS_CONFIRMADA`. No se corrige todavía en código; se convierte en hallazgo obligatorio de remodelación.

`TEC-15` confirma que ninguna de las dos aplicaciones corrige actualmente la hora original de asistencia. La posibilidad de agregar una nota en ANIMA no constituye duplicación de la marcación.

##### 8.2. NEXO, ORIGO y FOGO

| Resultado                                             | Propietaria | Regla para las demás                                                        |
| ----------------------------------------------------- | ----------- | --------------------------------------------------------------------------- |
| proveedor, solicitud, orden y aceptación de compra    | ORIGO       | NEXO recibe únicamente el efecto aceptado                                   |
| producto, unidad, ubicación, existencia y movimiento  | NEXO        | ORIGO y FOGO referencian el mismo producto                                  |
| receta, orden, lote, consumo productivo y rendimiento | FOGO        | NEXO recibe movimientos confirmados                                         |
| recepción de proveedor                                | ORIGO       | NEXO no vuelve a aceptar o rechazar la compra; registra la entrada derivada |
| salida o liberación de producción                     | FOGO        | NEXO no vuelve a cerrar el lote; registra el producto aceptado              |

Las pantallas de recepción o despacho pueden requerir acciones coordinadas, pero no deben producir dos recepciones, dos lotes o dos movimientos.

##### 8.3. NEXO, PULSO y entrega

| Resultado                                   | Propietaria                                |
| ------------------------------------------- | ------------------------------------------ |
| disponibilidad física por lugar             | NEXO                                       |
| disponibilidad comercial mostrada al vender | PULSO, derivada de reglas y datos vigentes |
| pedido, venta y promesa al cliente          | PULSO                                      |
| traslado y recepción entre lugares Vento    | NEXO                                       |
| entrega que cierra un pedido del cliente    | PULSO                                      |

El destino determina la frontera:

- si la custodia pasa entre lugares internos, gobierna NEXO;
- si la custodia termina en el cliente por un pedido, gobierna PULSO;
- si interviene mensajería, PULSO conserva la entrega y la referencia externa.

##### 8.4. PULSO, PASS y NUMERA

| Resultado                                               | Propietaria |
| ------------------------------------------------------- | ----------- |
| identidad, consentimiento y acción directa del cliente  | PASS        |
| datos mínimos usados en un pedido o venta               | PULSO       |
| pedido, venta, pago aplicado, caja y documento de venta | PULSO       |
| hecho económico interno, costo, obligación y análisis   | NUMERA      |

PASS no crea ventas y NUMERA no corrige pedidos. PULSO tampoco se convierte en maestro universal de identidad por registrar un comprador identificado.

##### 8.5. AURA, PULSO y NUMERA

AURA continúa sin existir como producto implementado. Su propiedad futura se limita a:

- intención y calendario de comunicación;
- contenido y publicación;
- campaña;
- origen de oportunidad;
- intención de promoción.

PULSO gobernará cupón aplicado, pedido y venta. NUMERA gobernará el análisis económico derivado. Mientras AURA no exista, sus capacidades podrán ejecutarse manualmente, pero no se inventará una integración ni una segunda base de ventas.

##### 8.6. SHELL y las aplicaciones

SHELL podrá gobernar:

- entrada y navegación del ecosistema;
- catálogo visible de aplicaciones;
- selección de contexto autorizado;
- estado básico de disponibilidad para orientar al usuario.

SHELL no gobernará:

- datos laborales de VISO o ANIMA;
- productos o existencias de NEXO;
- compras de ORIGO;
- producción de FOGO;
- ventas de PULSO;
- identidad de cliente de PASS;
- hechos económicos de NUMERA;
- documentos propios de cada hecho.

Mostrar, enlazar o iniciar sesión no convierte a SHELL en propietaria.

---

#### 9. Áreas y personas que intervienen sin competir por la propiedad

Los actores de `CAP-MAP-006` conservan funciones distintas:

| Participación            | Qué puede hacer                             | Qué no significa                          |
| ------------------------ | ------------------------------------------- | ----------------------------------------- |
| iniciador                | solicitar o reportar una necesidad          | aprobarla automáticamente                 |
| ejecutor                 | realizar el trabajo autorizado              | gobernar todos los datos relacionados     |
| supervisor               | revisar avance, diferencia o cumplimiento   | cambiar el registro original sin permiso  |
| aprobador                | aceptar, rechazar o autorizar una excepción | ejecutar todos los pasos                  |
| propietario de la fuente | conservar estado y trazabilidad             | tomar por sí solo la decisión empresarial |

Gerencia, Contabilidad, responsables de sede y trabajadores pueden intervenir en la misma capacidad sin crear propiedad competidora cuando la decisión y el registro quedan enlazados.

Los pendientes `OPE-04` a `OPE-11` definirán cargos concretos para aprobar excepciones. No cambian la propiedad de ORIGO, NEXO, VISO, PULSO o la aplicación correspondiente.

---

#### 10. Sistemas externos, archivos y medios manuales

| Medio o sistema            | Puede conservar                                             | No puede convertirse automáticamente en           |
| -------------------------- | ----------------------------------------------------------- | ------------------------------------------------- |
| Rappi, Shopify o ManyChat  | solicitud, pedido o referencia externa                      | fuente interna paralela del pedido Vento          |
| banco o proveedor de pagos | confirmación externa de movimiento                          | venta, caja o conciliación interna completa       |
| sistema contable           | asiento o documento oficial que le corresponda              | fuente de pedidos, inventario o producción        |
| WhatsApp                   | solicitud, aviso o evidencia complementaria                 | estado final de compra, remisión, venta o novedad |
| Excel                      | importación, exportación o control transitorio identificado | maestro independiente sin conciliación            |
| PDF, captura o papel       | representación o evidencia                                  | sustituto silencioso del registro estructurado    |

Cuando una operación actual solo exista en estos medios se marca `RIESGO_DE_FUENTE_SOMBRA`, no `DUPLICACIÓN_AS_IS_CONFIRMADA`, hasta comprobar que dos versiones se controlan de manera independiente.

Las auditorías operativas pendientes ya registradas servirán para observar esos casos. No se crea un segundo cuestionario.

---

#### 11. Duplicación técnica confirmada

`TEC-18` confirma contratos y estructuras repetidos entre repositorios:

- tipos de sedes, personas y productos;
- compras repetidas entre FOGO y ORIGO;
- salidas de producción repetidas entre NEXO y FOGO;
- tipos de pedidos repetidos en PULSO;
- `SiteRow`, `SiteOption`, `EmployeeRow`, sesión operativa y componentes estándar repetidos en NUMERA;
- copias que ya presentan diferencias entre NUMERA y ORIGO.

La decisión es:

| Hallazgo                                 | Clasificación                     | Tratamiento posterior                        |
| ---------------------------------------- | --------------------------------- | -------------------------------------------- |
| contratos o tipos repetidos              | `DUPLICACIÓN_TÉCNICA_CONFIRMADA`  | derivar de contratos comunes o generados     |
| nombres iguales con significado distinto | no consolidar automáticamente     | separar nombre y contrato por dominio        |
| copias que ya divergen                   | riesgo de incompatibilidad        | comparar campo por campo antes de reemplazar |
| tablas de dominio distintas              | no fusionar por similitud técnica | conservar la fuente empresarial definida     |

Esta duplicación no modifica la taxonomía ni autoriza crear un paquete compartido en esta tarea. Queda como requisito verificable para el análisis y la remodelación técnica.

---

#### 12. Hallazgos consolidados

| Tipo de hallazgo                                       | Resultado |
| ------------------------------------------------------ | --------: |
| familias revisadas                                     |    **18** |
| subcapacidades cubiertas                               |   **217** |
| propiedad competidora funcional confirmada             |     **1** |
| conjunto de duplicaciones técnicas confirmado          |     **1** |
| solapamientos de taxonomía resueltos mediante frontera |    **21** |
| preguntas nuevas creadas                               |     **0** |

La propiedad competidora funcional confirmada es la edición de horarios en VISO y ANIMA.

El conjunto técnico confirmado corresponde a los contratos y estructuras repetidos documentados en `TEC-18`; contiene varios casos, pero se conserva como un solo frente de remodelación transversal.

Los riesgos de fuente sombra no se cuentan como duplicaciones confirmadas hasta que la observación operativa demuestre control paralelo del mismo estado.

---

#### 13. Decisiones para la remodelación posterior

1. Cada hecho tendrá una única fuente con autoridad para crear y corregir.
2. Las consumidoras recibirán identificador, versión y estado sin poder reescribir el original.
3. Un evento derivado no duplicará el efecto empresarial al reintentarse.
4. Toda corrección se realizará en la propietaria y se propagará con trazabilidad.
5. Las referencias externas conservarán el identificador del proveedor y el identificador interno.
6. Los contratos compartidos describirán intercambios; no convertirán una base compartida en propiedad universal.
7. La consolidación técnica no fusionará resultados empresariales diferentes.
8. Los controles manuales seguirán visibles hasta demostrar que su reemplazo funciona.
9. La edición de horarios deberá quedar en VISO; ANIMA será consumidora para el trabajador.
10. Los cruces comerciales conservarán la secuencia oportunidad, propuesta, reserva, pedido y venta.

---

#### 14. Dudas y comprobaciones

No se crean preguntas nuevas.

Esta tarea reutiliza:

- `OPE-04` a `OPE-11` para conocer aprobadores concretos de excepciones;
- `TEC-14` para la edición duplicada de horarios;
- `TEC-15` para la ausencia de corrección de marcaciones;
- `TEC-18` para contratos y estructuras repetidos;
- las auditorías operativas ya pendientes para comprobar fuentes sombra.

Las respuestas futuras se incorporarán al registro vivo y afinarán el estado AS-IS, sin reabrir las fronteras objetivo ya definidas.

---

#### 15. Lo que queda decidido

1. Las 217 subcapacidades fueron revisadas mediante herencia y excepciones.
2. Colaborar, consultar o analizar no concede propiedad.
3. VISO y ANIMA compiten actualmente por la edición de horarios.
4. La marcación original pertenece a ANIMA y la administración de novedades a VISO.
5. ORIGO acepta la compra y NEXO registra su efecto en existencias.
6. FOGO cierra producción y NEXO registra movimientos aceptados.
7. NEXO gobierna traslados internos y PULSO entregas de pedidos al cliente.
8. PASS gobierna identidad del cliente; PULSO gobierna la venta.
9. PULSO gobierna venta y caja; NUMERA recibe el efecto económico.
10. AURA no recreará pedidos, ventas ni costos.
11. SHELL no hereda propiedad de los dominios que enlaza.
12. Los documentos siguen perteneciendo al hecho que respaldan.
13. Las capacidades comerciales solapadas se separan por etapa.
14. Mantenimiento de activos e instalaciones se separa por el objeto afectado.
15. Los incidentes se separan por naturaleza y por la coordinación de continuidad.
16. Los contratos repetidos son duplicación técnica confirmada, no otra capacidad empresarial.
17. WhatsApp, Excel y papel conservan riesgo de fuente sombra hasta terminar la auditoría.
18. No se requieren preguntas nuevas para aprobar esta propuesta.

---

#### 16. Lo que esta tarea no autoriza

- eliminar pantallas o funciones;
- retirar la edición de horarios de ANIMA;
- fusionar tablas o bases de datos;
- crear contratos compartidos;
- modificar Supabase;
- implementar eventos o integraciones;
- reemplazar Excel, WhatsApp, papel o sistemas externos;
- desarrollar AURA;
- cambiar permisos;
- renombrar o eliminar subcapacidades aprobadas;
- iniciar la remodelación técnica.

---

#### 17. Criterios de aceptación

`CAP-MAP-013` podrá aprobarse cuando:

- las 217 subcapacidades queden cubiertas;
- los solapamientos de taxonomía tengan frontera verificable;
- consultar o analizar no se confunda con gobernar;
- VISO y ANIMA conserven la duplicación AS-IS visible y el objetivo sin doble edición;
- ORIGO/NEXO, NEXO/FOGO y NEXO/PULSO tengan resultados separados;
- PULSO/PASS, PULSO/NUMERA y AURA/PULSO tengan fronteras explícitas;
- SHELL no se convierta en propietaria universal;
- los actores humanos no se confundan con la fuente;
- las copias manuales se traten como riesgo y no como duplicación inventada;
- `TEC-18` quede incorporada como duplicación técnica;
- no se creen preguntas repetidas;
- no se autorice implementación;
- `CAP-MAP-014` permanezca como única continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
capacidad y resultado
        ↓
fuente propietaria
        ↓
colaboradoras y consumidoras
        ↓
frontera ante resultados parecidos
        ↓
duplicaciones reales que deberá resolver la remodelación
```

La continuidad será exclusivamente:

```text
CAP-MAP-014
— Detectar capacidades necesarias que no aparecen en código ni datos actuales
```

`CAP-MAP-014` comparará la taxonomía empresarial con la evidencia técnica y operativa para localizar necesidades reales que todavía no tengan representación comprobada.

### ✅ CAP-MAP-014 — Detectar capacidades necesarias que no aparecen en código ni datos actuales

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** contraste documental entre capacidad empresarial y representación técnica actual
**Dependencia anterior:** `CAP-MAP-013`
**Continuidad reservada:** `CAP-MAP-015`

---

#### 1. Resultado de esta tarea

Esta tarea compara las **217 subcapacidades** con:

- aplicaciones y rutas disponibles en los repositorios;
- tablas y datos del proyecto remoto `vento-os-dev`;
- migraciones canónicas de `vento-shell`;
- auditoría técnica `TEC-01` a `TEC-19`;
- formularios y auditorías operativas ya preparados;
- decisiones aprobadas en `CAP-MAP-001` a `CAP-MAP-013`.

El objetivo es distinguir:

1. capacidad comprobada y utilizada;
2. capacidad con código o tablas, pero sin uso comprobado;
3. capacidad cubierta solo parcialmente;
4. capacidad realizada manualmente o mediante un tercero;
5. capacidad necesaria sin representación canónica comprobada;
6. producto o repositorio que no pertenece a la línea base operativa de Vento Group.

No se declarará implementada una capacidad solo porque exista una tabla, una pantalla o un documento de diseño.

---

#### 2. Estados de cobertura

| Estado                             | Significado                                                                                               |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `COMPROBADA_EN_USO`                | existen superficie, estructura y datos o evidencia operativa suficiente                                   |
| `ESTRUCTURA_SIN_USO`               | existen código o tablas, pero no hay registros ni operación comprobada                                    |
| `PARCIAL`                          | una parte del resultado existe, pero faltan etapas, controles o evidencia                                 |
| `MANUAL_O_EXTERNA`                 | la necesidad se atiende mediante personas, archivos, mensajes o terceros                                  |
| `SIN_REPRESENTACIÓN_COMPROBADA`    | no se encontró una forma canónica de ejecutar y conservar el resultado                                    |
| `PROYECTO_FUTURO_CON_BASE_TÉCNICA` | existen código o estructuras preliminares, pero el producto todavía debe diseñarse, planearse y adoptarse |
| `FUERA_DE_LA_LÍNEA_BASE`           | existe técnicamente, pero no representa una capacidad operativa de Vento Group dentro de este mapa        |

Estos estados describen evidencia AS-IS. No equivalen a prioridad de implementación.

---

#### 3. Prueba obligatoria de representación

Una subcapacidad solo se considerará `COMPROBADA_EN_USO` cuando pueda responderse:

1. ¿Dónde inicia una persona el trabajo?
2. ¿Qué estructura conserva el resultado?
3. ¿Existe al menos un registro o evidencia real?
4. ¿Puede distinguirse borrador, aprobado, completado, rechazado o corregido?
5. ¿Existe una forma visible de consultar lo ocurrido?
6. ¿La aplicación coincide con la propietaria aprobada?

La evidencia se interpretará así:

```text
pantalla + estructura + datos + ciclo observable
= capacidad comprobada en uso

pantalla o tabla sin datos
= estructura sin uso comprobado

archivo, chat o proveedor externo
= capacidad manual o externa

ninguna evidencia localizada
= sin representación comprobada
```

---

#### 4. Regla de cobertura de las 217 subcapacidades

Cada subcapacidad hereda el estado general de su familia, salvo que aparezca en los apartados 6 a 12.

```text
COBERTURA DE SUBCAPACIDAD
=
EVIDENCIA BASE DE LA FAMILIA
+
EXCEPCIÓN ESPECÍFICA
+
LIMITACIÓN DE AUDITORÍA, SI EXISTE
```

Cuando una familia se marque `PARCIAL`, no se supone que todas sus subcapacidades estén implementadas. El apartado de brechas identifica cuáles requieren atención explícita.

---

#### 5. Cobertura general por familia

| Familia                                      | Evidencia actual principal                                                          | Estado general      |
| -------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------- |
| `CAP-01` Dirección y gobierno                | empresas, sedes, áreas, roles, permisos y mapa operativo en VISO                    | `PARCIAL`           |
| `CAP-02` Personas y trabajo                  | VISO, ANIMA, esquema `talento`, turnos, asistencia, vacantes y documentos           | `PARCIAL`           |
| `CAP-03` Seguridad, salud y cumplimiento     | documentos, reglas, auditoría operativa y controles dispersos                       | `PARCIAL`           |
| `CAP-04` Productos y conocimiento            | NEXO, FOGO, VISO, 959 productos, 276 recetas y configuraciones comerciales          | `COMPROBADA_EN_USO` |
| `CAP-05` Abastecimiento                      | ORIGO, proveedores, órdenes y estructuras de recepción                              | `PARCIAL`           |
| `CAP-06` Inventario                          | NEXO, saldos, ubicaciones, movimientos, conteos, solicitudes y traslados con datos  | `COMPROBADA_EN_USO` |
| `CAP-07` Activos                             | activos, grupos, movimientos y superficies de NEXO; mantenimiento y conteos sin uso | `PARCIAL`           |
| `CAP-08` Producción                          | recetas y rutas con datos; solicitudes y lotes sin registros                        | `PARCIAL`           |
| `CAP-09` Venta y pedidos                     | pedidos digitales con pocos datos, PULSO, salón y esquema POS vacío                 | `PARCIAL`           |
| `CAP-10` Clientes                            | usuarios, PASS, mensajes, facturación solicitada y lealtad parcial                  | `PARCIAL`           |
| `CAP-11` Transporte y entrega                | traslados existentes; remisiones nuevas y sesiones de entrega sin registros         | `PARCIAL`           |
| `CAP-12` Dinero y obligaciones               | pagos digitales, costos y NUMERA; contabilidad, bancos y cartera incompletos        | `PARCIAL`           |
| `CAP-13` Instalaciones                       | sedes, ubicaciones y activos; sin ciclo dedicado de instalaciones                   | `PARCIAL`           |
| `CAP-14` Comunicación y desarrollo comercial | CMS de VISO, sitio público y contenido; AURA inexistente                            | `PARCIAL`           |
| `CAP-15` Tecnología y soporte                | permisos, dispositivos, navegación, actualizaciones y tickets básicos               | `PARCIAL`           |
| `CAP-16` Información y evidencia             | documentos, tipos, reglas y algunas solicitudes de datos                            | `PARCIAL`           |
| `CAP-17` Medición y mejora                   | exportaciones puntuales, NUMERA y páginas de rentabilidad                           | `PARCIAL`           |
| `CAP-18` Continuidad e incidentes            | tickets, eventos y configuraciones aisladas; sin ciclo integral de continuidad      | `PARCIAL`           |

`COMPROBADA_EN_USO` a nivel de familia no significa que sus quince o diez subcapacidades estén completas. Significa que el ciclo principal tiene evidencia real y que las brechas son excepciones localizables.

---

#### 6. Evidencia que corrige o amplía el mapa anterior

##### 6.1. TALENTO es un proyecto futuro anterior a ANIMA

El usuario confirma que TALENTO se concibe como una **plataforma de empleo propia** y como el portal anterior a ANIMA.

Su propósito objetivo será:

1. publicar puestos de trabajo de Vento Group;
2. permitir que una persona consulte y seleccione una vacante;
3. registrar su postulación;
4. solicitar progresivamente los datos y documentos necesarios para evaluarla;
5. conservar entrevistas, evaluaciones, decisiones y oferta;
6. crear un pre-registro de persona candidata;
7. transferir a ANIMA únicamente a quien complete la selección y vinculación autorizada;
8. permitir operación con el estado laboral y los accesos correspondientes durante el período de prueba;
9. confirmar después la continuidad definitiva o ejecutar el cierre correspondiente.

La revisión técnica actual confirma:

- repositorio `vento-talento`;
- aplicación móvil Expo con vacantes, postulaciones, proceso, documentos y perfil;
- administración de vacantes en VISO;
- migraciones canónicas en `vento-shell`;
- esquema remoto `talento`;
- tablas de candidatos, vacantes, postulaciones, etapas, documentos, entrevistas, evaluaciones, ofertas y preingreso;
- cero registros actuales en las tablas del esquema `talento`.

La base técnica existente no convierte el producto en actual. TALENTO queda:

```text
PROYECTO_FUTURO_CON_BASE_TÉCNICA
```

Flujo objetivo:

```text
VISO o el responsable autorizado crea y publica la vacante
        ↓
TALENTO permite consultar y presentar la postulación
        ↓
TALENTO solicita los datos y documentos requeridos para esa etapa
        ↓
el equipo autorizado evalúa, entrevista, rechaza o selecciona
        ↓
TALENTO conserva el pre-registro y la trazabilidad de selección
        ↓
la vinculación autorizada crea o enlaza el trabajador en ANIMA/VISO
        ↓
el trabajador opera con estado EN_PERIODO_DE_PRUEBA y permisos provisionales acordes con su función
        ↓
se confirma continuidad definitiva o se cierra la vinculación y sus accesos
```

Reglas:

1. Una persona postulada es `CANDIDATO`, no trabajador.
2. El pre-registro no crea por sí solo relación laboral, turno, asistencia ni acceso operativo.
3. Solo una selección y vinculación autorizadas podrán crear o enlazar `employee_id`.
4. El período de prueba será un estado del trabajador ya vinculado, no una forma de mantenerlo como candidato informal.
5. Los permisos provisionales se asignarán por sede, función, fechas y aplicación, únicamente en la medida necesaria para operar.
6. La continuidad definitiva no requerirá crear otra persona; actualizará el estado del mismo vínculo.
7. Un rechazo, retiro o vencimiento cerrará la postulación sin borrar la trazabilidad obligatoria.
8. Los documentos se pedirán por etapa y finalidad; no se solicitará desde el inicio información que todavía no sea necesaria.
9. El candidato deberá conocer qué datos se solicitan, para qué se usan y cuánto tiempo se conservarán.
10. Una persona podrá postularse a varias vacantes sin duplicar su identidad.
11. ANIMA recibirá únicamente la información laboral necesaria después de la vinculación autorizada.
12. VISO conservará la administración empresarial de vacantes, selección, estado laboral y permisos; TALENTO conservará la experiencia de la persona candidata.

TALENTO es una aplicación candidata real que faltaba en el catálogo inicial de `CAP-MAP-004`, pero se incorporará como **aplicación futura**, no como operación actual.

Su diseño detallado, reglas documentales, estados, consentimiento, retención y traspaso a ANIMA deberán planearse antes de implementar o activar la base técnica existente.

##### 6.2. La comunicación digital no está totalmente ausente

Aunque AURA no tiene repositorio, pantallas ni funciones, existen:

- CMS de sitio web en VISO;
- administración de bloques y contenidos;
- repositorio `vento-group-web`;
- páginas de restaurantes, servicios, empleos, eventos y ecosistema;
- `website_items` con 9 registros;
- `website_blocks` con 7 registros;
- `app_content_blocks` con 9 registros.

Esto representa parcialmente:

- `CAP-14.01`;
- `CAP-14.03`;
- `CAP-14.04`;
- una parte de `CAP-14.11`.

No demuestra gestión de campañas, oportunidades, reputación multicanal ni medición promocional.

VISO y el sitio público son superficies actuales. AURA conserva la candidatura futura para coordinación de mercadeo, pero no podrá apropiarse retroactivamente de los hechos ya gobernados por otras fuentes.

##### 6.3. VITAL es un proyecto personal separado

El repositorio y esquema `vital` contienen programas personales de actividad física, deporte, nutrición, preparación y bienestar.

El usuario confirma que:

- VITAL es un proyecto aparte de salud y entrenamiento;
- su relación con Vento Group es nominal o secundaria;
- en la práctica es principalmente un proyecto personal;
- actualmente está parcialmente abandonado;
- no forma parte de la operación que este mapa debe remodelar.

No constituyen evidencia de:

- identificación de peligros laborales;
- investigación de accidentes;
- entrega de elementos de protección;
- inspecciones obligatorias;
- higiene e inocuidad empresarial;
- emergencias laborales.

Por tanto, VITAL queda `FUERA_DE_LA_LÍNEA_BASE` de estas 217 subcapacidades. Su código y datos se conservan como producto separado; no se eliminan ni se incluyen en la remodelación de Vento OS.

No se utilizará VITAL para declarar cubierta `CAP-03`.

---

#### 7. Estructuras existentes sin uso operativo comprobado

| Frente                                  | Evidencia técnica                                                                                                      | Estado                             |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| reclutamiento y selección               | TALENTO tiene aplicación y esquema con 0 registros, pero todavía debe diseñarse y planearse como portal previo a ANIMA | `PROYECTO_FUTURO_CON_BASE_TÉCNICA` |
| recepción de compras                    | `procurement_receptions` e ítems con 0 registros                                                                       | `ESTRUCTURA_SIN_USO`               |
| ejecución productiva                    | solicitudes, lotes, consumos, salidas y paquetes con 0 registros                                                       | `ESTRUCTURA_SIN_USO`               |
| operación POS propia                    | sesiones, pedidos de sesión, turnos, movimientos y pagos POS con 0 registros                                           | `ESTRUCTURA_SIN_USO`               |
| importación de ventas Makos             | lotes, filas, mapeos y consumos con 0 registros                                                                        | `ESTRUCTURA_SIN_USO`               |
| mantenimiento de activos                | registros nuevos de mantenimiento con 0 filas                                                                          | `ESTRUCTURA_SIN_USO`               |
| conteos patrimoniales                   | sesiones y líneas de conteo de activos con 0 filas                                                                     | `ESTRUCTURA_SIN_USO`               |
| documentos internos valorizados         | comprobantes POS internos y secuencias con 0 filas                                                                     | `ESTRUCTURA_SIN_USO`               |
| gastos y presupuestos NUMERA            | tablas disponibles con 0 gastos y 0 presupuestos                                                                       | `ESTRUCTURA_SIN_USO`               |
| solicitudes de facturación identificada | perfiles y solicitudes disponibles con 0 registros                                                                     | `ESTRUCTURA_SIN_USO`               |
| sesiones de entrega de pedidos          | estructura disponible con 0 registros                                                                                  | `ESTRUCTURA_SIN_USO`               |
| billetera y movimientos de lealtad      | estructura disponible con 0 movimientos                                                                                | `ESTRUCTURA_SIN_USO`               |

Estos frentes no se tratarán como capacidades inexistentes. Requieren:

1. prueba de flujo;
2. verificación de permisos;
3. adopción real;
4. datos controlados;
5. confirmación de que sustituyen el método manual.

---

#### 8. Capacidades con ausencia funcional específica confirmada

##### 8.1. Personas y asistencia

| Capacidad                 | Ausencia confirmada                                                               | Evidencia                  |
| ------------------------- | --------------------------------------------------------------------------------- | -------------------------- |
| `CAP-02.07` y `CAP-02.08` | no existe una corrección auditable de hora o tipo de marcación                    | `TEC-15`                   |
| `CAP-02.12`               | no existe nómina, liquidación ni gestión completa de pagos y beneficios laborales | esquema financiero parcial |

La nota de incidencia de ANIMA no equivale a corregir una marcación. La exportación de asistencia tampoco constituye nómina.

##### 8.2. Venta, pago y control de jornada

| Capacidad                     | Ausencia confirmada                                                                | Evidencia                         |
| ----------------------------- | ---------------------------------------------------------------------------------- | --------------------------------- |
| `CAP-09.09` y `CAP-12.07`     | no existe corrección manual auditable de medio de pago                             | `TEC-16`                          |
| `CAP-09.15`                   | no existe jornada POS propia comprobada con sesiones y cierres usados              | tablas POS con 0 registros        |
| `CAP-09.08` a `CAP-09.10`     | el flujo digital existe, pero el POS presencial objetivo todavía no está operativo | PULSO parcial y tablas POS vacías |
| `CAP-17.04` aplicado a ventas | PULSO no tiene exportación de auditoría comprobada                                 | `TEC-17`                          |

Makos puede seguir registrando ventas actuales. Su importación manual no demuestra que el POS futuro de PULSO esté listo.

##### 8.3. Finanzas y cartera

| Capacidad                                      | Ausencia confirmada                                                                         |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `CAP-12.03` Gestionar bancos y pagos           | no existe módulo bancario completo                                                          |
| `CAP-12.04` Gestionar cuentas por cobrar       | no existe cartera completa con documentos, aplicaciones de pago, vencimiento y saldo        |
| `CAP-12.05` Gestionar cuentas por pagar        | compras y condiciones de proveedor existen, pero no una cartera completa de obligaciones    |
| `CAP-12.12` Gestionar tesorería                | no existe ciclo canónico completo                                                           |
| `CAP-12.13` Gestionar impuestos y obligaciones | no existe sistema tributario interno completo; intervienen herramientas y asesores externos |
| `CAP-12.14` Cerrar períodos y emitir reportes  | NUMERA tiene una base parcial, no cierre contable completo                                  |

Los documentos POS internos de NEXO no son facturas fiscales y no constituyen por sí solos una cartera completa.

La arquitectura preliminar ya analizada se conserva como referencia, no como implementación:

- cuentas por cobrar internas apoyadas en documentos y pagos aplicados;
- cuentas por pagar apoyadas en órdenes, recepciones y condiciones de proveedores;
- migraciones y contratos de datos siempre desde `vento-shell`.

##### 8.4. Clientes y servicio

No se encontró ciclo canónico completo para:

- `CAP-10.04` recibir, investigar y resolver reclamos;
- `CAP-10.05` autorizar y ejecutar devoluciones o compensaciones;
- `CAP-10.06` medir satisfacción;
- `CAP-10.08` gestionar reservas y eventos de atención.

Mensajes asociados a pedidos y `user_feedback` vacío representan una base parcial, no los ciclos completos.

##### 8.5. Instalaciones

`CAP-13` carece de una aplicación o ciclo dedicado comprobado para:

- planear mantenimiento de instalaciones;
- solicitar y cerrar reparaciones;
- controlar limpieza y saneamiento;
- controlar plagas;
- controlar servicios;
- inspeccionar condiciones;
- calibrar equipos;
- gestionar llaves y acceso físico;
- controlar obras y adecuaciones;
- cerrar novedades de instalaciones.

Las sedes, ubicaciones y activos permiten identificar el lugar u objeto. No sustituyen la ejecución y evidencia de mantenimiento.

##### 8.6. Comunicación y desarrollo comercial

Sin representación canónica comprobada:

- `CAP-14.05` gestionar campañas completas;
- `CAP-14.07` administrar oportunidades comerciales;
- la parte de propuesta y negociación de `CAP-14.08` y `CAP-14.09`;
- `CAP-14.10` medir de extremo a extremo una promoción;
- `CAP-14.11` gestionar reputación y respuestas multicanal.

El CMS publica contenido; no es CRM, gestor de campaña ni sistema de reputación.

##### 8.7. Continuidad

No se encontró ciclo empresarial integral para:

- inventariar dependencias críticas;
- definir alternativas por capacidad;
- declarar y priorizar incidentes empresariales;
- operar temporalmente fuera de línea;
- incorporar lo ocurrido durante la falla;
- confirmar pendientes después de recuperar;
- probar respaldos y recuperación por dominio;
- aprender y actualizar el plan.

Tickets, eventos técnicos y respaldos de infraestructura pueden participar, pero no cubren por sí solos `CAP-18.01` a `CAP-18.12`.

---

#### 9. Coberturas parciales que no deben declararse cerradas

| Frente     | Parte existente                             | Parte faltante                                                               |
| ---------- | ------------------------------------------- | ---------------------------------------------------------------------------- |
| compras    | proveedor, orden y algunos costos           | adopción de recepción nueva, comparación, devoluciones y evaluación completa |
| activos    | inventario, grupos y movimientos            | mantenimiento, garantías, documentos, conteos y baja operativa comprobada    |
| producción | recetas, pasos y rutas                      | solicitud, ejecución, consumo, rendimiento y cierre con datos reales         |
| ventas     | pedido digital y pago digital limitado      | POS presencial, caja, consumidor final, correcciones y cierres               |
| entregas   | traslados internos                          | despacho sellado, recepción nueva y entrega de pedido con adopción           |
| finanzas   | centros, periodos, categorías y costos      | gastos reales, presupuestos, bancos, cartera, tesorería y cierre             |
| tecnología | accesos, navegación, dispositivos y tickets | gobierno de cambios, pruebas, licencias, costos y capacitación completa      |
| documentos | documentos, tipos y reglas                  | retención, eliminación, firmas, versiones y auditoría integral               |
| análisis   | exportaciones y páginas puntuales           | indicadores comunes, calidad, servicio, acciones y seguimiento               |

`PARCIAL` no significa fallido. Significa que la remodelación deberá preservar lo útil y completar el resultado sin declarar terminada la capacidad antes de tiempo.

---

#### 10. Operaciones manuales o externas que sí representan capacidad

| Operación                                | Representación actual                   | Decisión                                                             |
| ---------------------------------------- | --------------------------------------- | -------------------------------------------------------------------- |
| ventas Makos                             | sistema externo y Excel                 | capacidad existente, integración interna manual                      |
| pedidos Shopify                          | plataforma externa y traslado operativo | capacidad existente, automatización no comprobada                    |
| pedidos Rappi                            | plataforma externa y traslado operativo | capacidad existente, API no comprobada                               |
| solicitudes ManyChat o WhatsApp          | mensajes y copia humana                 | capacidad existente, fuente interna por confirmar                    |
| facturación electrónica actual           | Dataico u otro emisor según titular     | capacidad externa con control interno necesario                      |
| asesoría jurídica, contable o tributaria | profesional externo y documentos        | capacidad interna de gestionar la relación, no de emitir el concepto |
| transporte tercerizado                   | mensajería y comprobantes               | capacidad interna de asignar y confirmar entrega                     |

La ausencia de una integración automática no significa ausencia de la capacidad empresarial.

---

#### 11. Capacidades nuevas fuera de las 217

No se propone crear una familia ni una subcapacidad nueva.

Los elementos encontrados se absorben así:

| Elemento observado                        | Cobertura existente                                                                          |
| ----------------------------------------- | -------------------------------------------------------------------------------------------- |
| experiencia del candidato en TALENTO      | `CAP-02.02`, `CAP-02.03`, `CAP-02.11`, `CAP-15`, `CAP-16` y traspaso autorizado a ANIMA/VISO |
| sitio web y CMS                           | `CAP-14.01` a `CAP-14.04` y `CAP-14.11`                                                      |
| POS a consumidor final                    | `CAP-09.08` a `CAP-09.10`, `CAP-12.02`, `CAP-12.06` y `CAP-12.07`                            |
| cartera                                   | `CAP-12.04`, `CAP-12.05`, conciliación y documentos                                          |
| soporte por tickets                       | `CAP-15.06`, `CAP-15.07` y `CAP-18` cuando afecte continuidad                                |
| dispositivos compartidos y firma de actor | `CAP-15`, `CAP-16` y controles de autorización ya definidos                                  |

VITAL no obliga a ampliar la línea base porque es un proyecto personal separado de salud y entrenamiento, actualmente sin continuidad operativa dentro de Vento OS.

La taxonomía de 217 subcapacidades continúa siendo suficiente para aprobar una línea base, siempre que `CAP-MAP-015` incorpore TALENTO como proyecto futuro previo a ANIMA y conserve sus estados de cobertura.

---

#### 12. Frentes de brecha que deberá conservar la remodelación

| ID               | Frente                                                                                            | Capacidades principales                                                | Tipo                             |
| ---------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | -------------------------------- |
| `BRECHA-CAP-001` | corrección auditable de asistencia                                                                | `CAP-02.07`, `CAP-02.08`                                               | ausencia funcional               |
| `BRECHA-CAP-002` | nómina, pagos y beneficios laborales                                                              | `CAP-02.12`                                                            | sin representación comprobada    |
| `BRECHA-CAP-003` | seguridad, salud y cumplimiento integral                                                          | `CAP-03`                                                               | cobertura dispersa               |
| `BRECHA-CAP-004` | adopción real de compras, activos y producción nuevos                                             | `CAP-05`, `CAP-07`, `CAP-08`                                           | estructura sin uso               |
| `BRECHA-CAP-005` | POS presencial, caja, correcciones y auditoría de ventas                                          | `CAP-09`, `CAP-12.02`, `CAP-12.06`, `CAP-12.07`                        | cobertura parcial                |
| `BRECHA-CAP-006` | reclamos, devoluciones, satisfacción y reservas                                                   | `CAP-10.04` a `CAP-10.06`, `CAP-10.08`                                 | sin ciclo completo               |
| `BRECHA-CAP-007` | despacho nuevo y entrega trazable al cliente                                                      | `CAP-11`                                                               | estructura sin uso o parcial     |
| `BRECHA-CAP-008` | bancos, cartera, tesorería, impuestos y cierre                                                    | `CAP-12.03` a `CAP-12.05`, `CAP-12.12` a `CAP-12.14`                   | ausencia o cobertura parcial     |
| `BRECHA-CAP-009` | mantenimiento integral de instalaciones                                                           | `CAP-13`                                                               | sin representación comprobada    |
| `BRECHA-CAP-010` | campañas, oportunidades y reputación                                                              | `CAP-14.05`, `CAP-14.07` a `CAP-14.11`                                 | cobertura parcial                |
| `BRECHA-CAP-011` | gobierno tecnológico y documental completo                                                        | `CAP-15`, `CAP-16`                                                     | cobertura parcial                |
| `BRECHA-CAP-012` | indicadores, mejora y continuidad empresarial                                                     | `CAP-17`, `CAP-18`                                                     | cobertura parcial o ausente      |
| `BRECHA-CAP-013` | diseñar y validar TALENTO → ANIMA desde postulación hasta período de prueba, continuidad o cierre | `CAP-02.02`, `CAP-02.03`, `CAP-02.11`, `CAP-02.13`, `CAP-15`, `CAP-16` | proyecto futuro con base técnica |

Estas brechas se incorporan al plan como insumo obligatorio. No se dejan únicamente en el registro histórico de esta tarea.

---

#### 13. Dudas y comprobaciones

No se crean preguntas nuevas.

Esta tarea:

- utiliza las preguntas `OPE`, `DAT`, `ACT`, `EXT` y `GOV` ya registradas;
- utiliza `TEC-01` a `TEC-19`;
- incorpora la consulta actual de repositorios, rutas y tablas remotas;
- no convierte falta de respuesta operativa en ausencia técnica;
- no pide al usuario información que puede obtenerse de código o datos.

Las preguntas operativas pendientes servirán para determinar **cómo se ejecuta hoy** una capacidad manual, no para negar la brecha técnica ya observada.

---

#### 14. Decisiones para CAP-MAP-015

`CAP-MAP-015` deberá:

1. incorporar TALENTO al catálogo como proyecto futuro con base técnica;
2. definirlo como portal de vacantes, postulación, evaluación y pre-registro anterior a ANIMA;
3. conservar VISO como administración de vacantes, decisiones laborales y permisos;
4. conservar TALENTO como experiencia y expediente de la persona candidata;
5. registrar el traspaso autorizado hacia ANIMA/VISO sin duplicar identidad;
6. separar candidato, seleccionado pendiente de vinculación, trabajador en período de prueba, trabajador activo y vínculo cerrado;
7. reconocer VISO CMS y `vento-group-web` como cobertura actual de publicación;
8. mantener AURA como candidata futura de coordinación comercial;
9. excluir VITAL de la línea base operativa sin eliminar su producto personal;
10. conservar las trece brechas `BRECHA-CAP-001` a `BRECHA-CAP-013`;
11. impedir que tablas vacías se presenten como operación validada;
12. aprobar una línea base que pueda pasar después a análisis y remodelación.

---

#### 15. Lo que queda decidido

1. Las 217 subcapacidades quedan cubiertas mediante familia y excepciones.
2. La taxonomía no necesita una capacidad adicional.
3. TALENTO es un proyecto futuro con base técnica, no una aplicación operativa actual.
4. TALENTO será el portal de empleo previo a ANIMA y faltaba en el catálogo inicial.
5. La persona empieza como candidata y solo se convierte en trabajadora después de una vinculación autorizada.
6. El período de prueba será un estado laboral controlado con permisos provisionales acordes con la función, no una identidad paralela.
7. El traspaso TALENTO → ANIMA/VISO reutilizará la identidad y conservará trazabilidad.
8. VISO CMS y el sitio web representan parte real de comunicación y publicación.
9. AURA sigue sin existir y no puede considerarse implementación.
10. VITAL es un proyecto personal separado y no cubre seguridad y salud laboral.
11. Productos e inventario tienen los ciclos más claramente comprobados.
12. Producción, POS, recepción nueva y activos avanzados tienen estructura sin uso.
13. Finanzas carece de contabilidad, bancos, cartera y tesorería completas.
14. No existe corrección auditable de marcación ni de medio de pago.
15. Instalaciones y continuidad no tienen ciclo canónico completo.
16. Las operaciones externas o manuales siguen siendo capacidades existentes.
17. Se conservan trece frentes de brecha para la remodelación.
18. No se requieren preguntas nuevas.

---

#### 16. Lo que esta tarea no autoriza

- crear o modificar tablas;
- ejecutar migraciones;
- desplegar o retirar funciones;
- poblar tablas vacías;
- crear datos de prueba productivos;
- integrar Shopify, Rappi, ManyChat o Makos;
- implementar TALENTO, AURA, POS, cartera o continuidad;
- mover migraciones fuera de `vento-shell`;
- eliminar VITAL;
- declarar fallida una capacidad únicamente por falta de código;
- iniciar análisis técnico detallado o remodelación antes de aprobar la línea base.

---

#### 17. Criterios de aceptación

`CAP-MAP-014` podrá aprobarse cuando:

- las 217 subcapacidades queden cubiertas;
- uso, estructura vacía, cobertura parcial, trabajo manual y ausencia se distingan;
- una tabla vacía no se presente como operación;
- TALENTO se reconozca como proyecto futuro anterior a ANIMA, sin declararlo adoptado;
- candidato, pre-registro, vinculación, período de prueba y trabajador activo queden separados;
- el traspaso a ANIMA/VISO no duplique identidad ni conceda acceso antes de la vinculación;
- el CMS y el sitio web se reconozcan sin fingir que AURA existe;
- VITAL se conserve como proyecto personal separado y no se confunda con salud laboral;
- las ausencias funcionales confirmadas queden explícitas;
- las operaciones manuales y externas no se borren;
- las trece brechas queden dentro del plan;
- no se creen preguntas duplicadas;
- no se autorice implementación;
- `CAP-MAP-015` permanezca como única continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse esta tarea quedará definida la cadena:

```text
capacidad necesaria
        ↓
evidencia de código y datos
        ↓
uso, estructura vacía, parcial, manual o ausente
        ↓
brecha que debe conservar la remodelación
        ↓
línea base lista para aprobación
```

La continuidad será exclusivamente:

```text
CAP-MAP-015
— Aprobar la línea base de capacidades actuales, necesarias y candidatas de Vento Group
```

`CAP-MAP-015` consolidará las decisiones de `CAP-MAP-001` a `CAP-MAP-014` sin volver a abrir preguntas ya resueltas.

---

#### 19. Adición posterior incorporada: destino ejecutable de las brechas

Las brechas de esta tarea no quedan solamente como hallazgos. Cada una conserva
un destino canónico con marcador de tarea:

| Brecha           | Tareas canónicas de destino                                                                         |
| ---------------- | --------------------------------------------------------------------------------------------------- |
| `BRECHA-CAP-001` | `CAP-SCOPE-002`, `INT-WORK-003` y tareas posteriores de corrección auditable que deriven del diseño |
| `BRECHA-CAP-002` | `CAP-SCOPE-002` y alcance financiero/laboral que apruebe `CAP-MAP-015`                              |
| `BRECHA-CAP-003` | `CAP-SCOPE-003`                                                                                     |
| `BRECHA-CAP-004` | `CAP-SCOPE-005`, `CAP-SCOPE-007`, `CAP-SCOPE-008` y tareas ORIGO, NEXO y FOGO ya existentes         |
| `BRECHA-CAP-005` | `CAP-SCOPE-009`, tareas PULSO e `INT-POS-001` a `INT-POS-019` según alcance                         |
| `BRECHA-CAP-006` | `CAP-SCOPE-010`, `PULSO-UX-009`, `INT-POS-008` e `INT-POS-019`                                      |
| `BRECHA-CAP-007` | `CAP-SCOPE-011` y tareas NEXO/PULSO de despacho, recepción y entrega                                |
| `BRECHA-CAP-008` | `CAP-SCOPE-012`, `NUMERA-DOM-010`, `NUMERA-UX-020` y tareas financieras que se deriven              |
| `BRECHA-CAP-009` | `CAP-SCOPE-013`, `NEXO-DOM-012`, `NEXO-DOM-026` y tareas de instalaciones que se deriven            |
| `BRECHA-CAP-010` | `CAP-SCOPE-014`, `AURA-AUD-010` e `INT-MKT-001`                                                     |
| `BRECHA-CAP-011` | `CAP-SCOPE-015` y `CAP-SCOPE-016`                                                                   |
| `BRECHA-CAP-012` | `CAP-SCOPE-017` y `CAP-SCOPE-018`                                                                   |
| `BRECHA-CAP-013` | `CAP-TAL-001` a `CAP-TAL-006`                                                                       |

Reglas:

1. una referencia a una tarea amplia no sustituye sus subtareas derivadas;
2. las subtareas nuevas deberán añadirse al documento correspondiente cuando se detecten;
3. no se cerrará una brecha solo porque exista una tarea con nombre relacionado;
4. una brecha se cierra únicamente con resultado, evidencia y aceptación;
5. `CAP-MAP-015` deberá comprobar que los destinos continúan visibles antes de aprobar la línea base.

### ✅ CAP-MAP-015 — Aprobar la línea base de capacidades actuales, necesarias y candidatas de Vento Group

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Tipo:** cierre documental y control de línea base
**Dependencia anterior:** `CAP-MAP-014`
**Continuidad reservada:** `CODE-AUD-001`

---

#### 1. Resultado propuesto

Esta tarea consolida `CAP-MAP-001` a `CAP-MAP-014` en la línea base:

| Campo                        | Valor                       |
| ---------------------------- | --------------------------- |
| Identificador                | `LB-CAP-VENTO-001`          |
| Versión                      | `1.0`                       |
| Fecha de corte               | 2026-07-23                  |
| Estado                       | `PROPUESTA PARA APROBACIÓN` |
| Familias de capacidad        | **18**                      |
| Subcapacidades               | **217**                     |
| Brechas confirmadas          | **13**                      |
| Destinos canónicos de brecha | **13 de 13**                |

La línea base define qué necesita hacer Vento Group, qué cobertura se ha
comprobado, qué aplicaciones son candidatas a gobernar cada resultado y qué
trabajo debe permanecer visible. No declara terminada una función porque exista
código, una tabla o una pantalla.

---

#### 2. Qué se aprueba y qué no

La aprobación de `LB-CAP-VENTO-001` significa:

1. aceptar las 18 familias y 217 subcapacidades como estructura de referencia;
2. aceptar las fronteras candidatas entre aplicaciones para orientar la
   auditoría y la remodelación;
3. conservar los estados actual, parcial, manual, externo, futuro y ausente;
4. conservar las trece brechas y sus tareas de destino;
5. permitir que `CODE-AUD-001` contraste esta línea base con la implementación.

La aprobación **no** significa:

- afirmar que todas las capacidades funcionan actualmente;
- cerrar preguntas operativas todavía pendientes;
- aprobar diseños, código, migraciones, despliegues o cambios de datos;
- autorizar creación o eliminación de aplicaciones;
- aprobar una conclusión contable, tributaria, laboral o jurídica;
- convertir una aplicación candidata en propietaria definitiva sin evidencia.

---

#### 3. Estructura empresarial congelada en esta versión

| Familia                                    | Resultado general esperado                              |
| ------------------------------------------ | ------------------------------------------------------- |
| `CAP-01` Gobierno y dirección              | decisiones, políticas y responsabilidades vigentes      |
| `CAP-02` Personas y trabajo                | vinculación, operación laboral y desarrollo trazables   |
| `CAP-03` Seguridad, salud y cumplimiento   | riesgos, obligaciones y acciones controladas            |
| `CAP-04` Producto, oferta y abastecimiento | oferta definida y abastecimiento coordinado             |
| `CAP-05` Compras y proveedores             | necesidad comprada, recibida y evaluada                 |
| `CAP-06` Inventario                        | existencias identificadas, disponibles y conciliadas    |
| `CAP-07` Logística interna y activos       | bienes trasladados, custodiados y mantenidos            |
| `CAP-08` Producción y transformación       | producción planeada, ejecutada y verificada             |
| `CAP-09` Venta y atención                  | solicitud convertida en venta y atendida correctamente  |
| `CAP-10` Clientes y experiencia            | identidad, relación, novedad y satisfacción conservadas |
| `CAP-11` Entregas y cumplimiento           | compromiso preparado, entregado y demostrado            |
| `CAP-12` Finanzas y contabilidad           | dinero, obligaciones y documentos conciliados           |
| `CAP-13` Instalaciones                     | espacios disponibles, seguros y mantenidos              |
| `CAP-14` Mercadeo y crecimiento            | oferta comunicada y oportunidad medida                  |
| `CAP-15` Tecnología y administración       | acceso, soporte, configuración y continuidad gobernados |
| `CAP-16` Información y documentos          | información íntegra, localizable y conservada           |
| `CAP-17` Analítica y mejora                | desempeño medido y decisiones sustentadas               |
| `CAP-18` Continuidad y control             | incidentes, excepciones y recuperación trazables        |

El detalle de las 217 subcapacidades permanece en `CAP-MAP-001` y
`CAP-MAP-002`. Esta tarea no crea una taxonomía paralela.

---

#### 4. Clasificación aprobable

| Clasificación      | Cantidad |
| ------------------ | -------: |
| `NÚCLEO`           |   **94** |
| `SOPORTE`          |   **45** |
| `TRANSVERSAL`      |   **78** |
| `FUTURA`           |    **0** |
| `FUERA_DE_ALCANCE` |    **0** |
| **Total**          |  **217** |

Una capacidad necesaria no se vuelve futura porque la aplicación destinada a
soportarla todavía no exista. Por eso TALENTO, AURA y el POS futuro se describen
como aplicaciones o coberturas futuras, mientras las necesidades empresariales
que deberán atender permanecen clasificadas como núcleo, soporte o transversal.

VITAL no se usa para retirar capacidades de salud laboral: esas capacidades
continúan en `CAP-03`, aunque VITAL sea un proyecto personal separado.

---

#### 5. Regla de lectura de la cobertura

La línea base usará estas categorías sin mezclarlas:

| Estado                          | Significado                                                                 |
| ------------------------------- | --------------------------------------------------------------------------- |
| `EN USO COMPROBADO`             | existe evidencia de operación real                                          |
| `PARCIAL`                       | una parte existe o se usa, pero el resultado no está completo               |
| `ESTRUCTURA SIN USO COMPROBADO` | existe código o dato, pero no prueba de adopción                            |
| `MANUAL`                        | la organización obtiene el resultado fuera de una automatización controlada |
| `EXTERNO`                       | interviene un tercero; Vento conserva responsabilidad sobre el resultado    |
| `FUTURO CON BASE TÉCNICA`       | existe base reutilizable, pero no producto operativo aprobado               |
| `IDEA FUTURA`                   | existe intención, sin diseño ni funciones aprobadas                         |
| `AUSENTE`                       | no se encontró representación suficiente del resultado                      |
| `POR COMPROBAR`                 | falta observación operativa y no debe inventarse el estado                  |

Productos e inventario presentan la cobertura en uso más sólida encontrada.
Compras, activos, producción, venta, entrega, finanzas y otras familias conservan
estados parciales, estructuras sin uso comprobado, trabajo manual, operación
externa o ausencia según `CAP-MAP-014`.

---

#### 6. Línea base de aplicaciones y proyectos

| Aplicación o proyecto | Posición en la línea base                                                                    |
| --------------------- | -------------------------------------------------------------------------------------------- |
| SHELL                 | entrada, navegación y contexto común actuales; no es propietaria universal                   |
| VISO                  | organización, administración laboral, roles, permisos y CMS actuales                         |
| ANIMA                 | experiencia personal del trabajador y asistencia actual                                      |
| TALENTO               | proyecto futuro con base técnica, anterior a ANIMA                                           |
| NEXO                  | inventario, logística interna y activos; cobertura actual más comprobada                     |
| FOGO                  | conocimiento de recetas actual; ejecución productiva parcial o sin uso comprobado            |
| ORIGO                 | proveedores y órdenes de compra actuales; recepción con cobertura parcial                    |
| PULSO                 | pedidos digitales parciales; POS y control completo de venta todavía futuros                 |
| PASS                  | identidad y experiencia de cliente con cobertura parcial                                     |
| NUMERA                | análisis económico y financiero parcial; no es contabilidad completa                         |
| AURA                  | idea futura; no existen diseño inicial ni funciones aprobadas                                |
| vento-group-web       | superficie pública actual; no gobierna capacidades empresariales                             |
| VITAL                 | proyecto personal separado de salud y entrenamiento, fuera de la línea operativa de Vento OS |

Makos, Rappi, Shopify, ManyChat, Dataico, bancos, proveedores contables y otros
terceros se conservan como medios o fuentes externas. Su participación no
transfiere automáticamente la responsabilidad empresarial de Vento.

---

#### 7. Propiedad candidata por familia

| Familia  | Aplicación candidata y frontera principal                                          |
| -------- | ---------------------------------------------------------------------------------- |
| `CAP-01` | VISO administra estructura; Gerencia conserva decisión y aprobación                |
| `CAP-02` | VISO administra; ANIMA sirve al trabajador; TALENTO servirá al candidato           |
| `CAP-03` | VISO y administración coordinan; especialistas externos pueden ejecutar            |
| `CAP-04` | NEXO gobierna producto físico; FOGO transformación; PULSO oferta vendible          |
| `CAP-05` | ORIGO gobierna proveedor, solicitud y orden de compra                              |
| `CAP-06` | NEXO gobierna inventario y movimientos internos                                    |
| `CAP-07` | NEXO gobierna traslados, custodia y activos                                        |
| `CAP-08` | FOGO gobierna receta, planeación y ejecución productiva                            |
| `CAP-09` | PULSO gobierna pedido, venta, caja y correcciones operativas                       |
| `CAP-10` | PASS gobierna identidad y relación; PULSO consume el contexto de venta             |
| `CAP-11` | NEXO gobierna movimiento interno; PULSO entrega al cliente                         |
| `CAP-12` | NUMERA gobierna consolidación; PULSO conserva hechos de venta y caja               |
| `CAP-13` | NEXO es candidato interno; ejecución puede apoyarse en terceros                    |
| `CAP-14` | VISO CMS y web cubren publicación actual; AURA es futura; PULSO aplica promociones |
| `CAP-15` | VISO, SHELL, NEXO o la aplicación afectada según el resultado administrado         |
| `CAP-16` | la aplicación que origina el hecho conserva su registro de autoridad               |
| `CAP-17` | NUMERA consolida; las aplicaciones fuente conservan los hechos                     |
| `CAP-18` | la aplicación afectada registra; SHELL coordina identidad y acceso común           |

Estas asignaciones son candidaturas de remodelación. La auditoría podrá
ratificarlas o proponer una versión nueva, pero no cambiarlas silenciosamente.

---

#### 8. Fronteras que no deben perderse

1. SHELL no absorberá la propiedad funcional de todas las aplicaciones.
2. VISO administra la relación laboral; ANIMA no crea ni aprueba trabajadores.
3. TALENTO administra la experiencia de la persona candidata; no concede acceso
   de trabajador.
4. NEXO conserva inventario y logística interna; PULSO conserva venta y entrega
   al cliente.
5. ORIGO origina compras; NEXO recibe y afecta inventario.
6. FOGO define y ejecuta transformación; NEXO registra los efectos de inventario.
7. PASS conserva identidad y relación del cliente; PULSO conserva la transacción.
8. NUMERA consolida y analiza; no reemplaza el hecho operativo de origen.
9. AURA no puede presentarse como sistema existente.
10. VITAL no representa seguridad y salud en el trabajo de Vento Group.

---

#### 9. TALENTO anterior a ANIMA

La línea base incorpora esta secuencia:

```text
vacante publicada
        ↓
persona candidata y postulación
        ↓
datos, documentos, consentimiento y evaluación
        ↓
selección pendiente de vinculación
        ↓
vinculación laboral autorizada y reutilización de identidad
        ↓
trabajador en período de prueba con permisos provisionales
        ↓
continuidad definitiva o cierre del vínculo
```

La persona candidata no será trabajadora ni recibirá permisos operativos antes
de la vinculación autorizada. El traspaso hacia VISO y ANIMA deberá ser trazable,
repetible sin duplicar registros y conservar el expediente permitido.

El trabajo quedó incorporado como tareas canónicas reales:

- `CAP-TAL-001` a `CAP-TAL-006`;
- las seis tareas forman parte de la secuencia activa;
- su existencia no significa que TALENTO ya esté diseñado o implementado.

---

#### 10. PULSO y venta a consumidor final

El POS futuro deberá separar:

1. venta a consumidor final cuando no se solicite documento identificado;
2. venta con identificación del comprador cuando se solicite o sea obligatoria;
3. emisión, corrección, anulación y conservación del documento correspondiente;
4. registro trazable de toda venta, pago, caja, impuesto y excepción.

El flujo de consumidor final no exigirá registrar individualmente a cada cliente
cuando la regla aplicable permita ese tratamiento. Esto no autoriza ventas por
fuera del sistema ni omisión de obligaciones. Las reglas jurídicas y tributarias
deberán volver a validarse al diseñar e implementar el POS.

---

#### 11. Duplicaciones y propiedad competidora

La única competencia funcional confirmada en esta fase es la edición de horarios
entre VISO y ANIMA. La remodelación deberá conservar una fuente gobernante y una
experiencia coherente para el trabajador.

También se conserva:

- el inventario técnico `TEC-18` de duplicaciones de implementación;
- copias manuales o archivos paralelos como riesgo de fuente sombra;
- integraciones válidas entre aplicaciones como cooperación, no duplicación;
- la obligación de comprobar una segunda propiedad antes de declararla.

---

#### 12. Brechas conservadas y ejecutables

| Brecha           | Resultado todavía insuficiente                   | Destino mínimo                                 |
| ---------------- | ------------------------------------------------ | ---------------------------------------------- |
| `BRECHA-CAP-001` | corrección auditable de asistencia               | `CAP-SCOPE-002`, `INT-WORK-003`                |
| `BRECHA-CAP-002` | nómina, prestaciones y obligaciones laborales    | `CAP-SCOPE-002` y derivadas                    |
| `BRECHA-CAP-003` | seguridad, salud y cumplimiento                  | `CAP-SCOPE-003`                                |
| `BRECHA-CAP-004` | adopción de compras, activos y producción        | `CAP-SCOPE-005`, `007`, `008`                  |
| `BRECHA-CAP-005` | POS, caja, correcciones y auditoría              | `CAP-SCOPE-009`, `INT-POS-001..019`            |
| `BRECHA-CAP-006` | novedades, devoluciones, satisfacción y reservas | `CAP-SCOPE-010` y derivadas                    |
| `BRECHA-CAP-007` | entrega al cliente                               | `CAP-SCOPE-011` y derivadas                    |
| `BRECHA-CAP-008` | bancos, cartera, tesorería, impuestos y cierre   | `CAP-SCOPE-012` y tareas NUMERA                |
| `BRECHA-CAP-009` | instalaciones                                    | `CAP-SCOPE-013` y tareas NEXO                  |
| `BRECHA-CAP-010` | campañas, oportunidades y reputación             | `CAP-SCOPE-014`, `AURA-AUD-010`, `INT-MKT-001` |
| `BRECHA-CAP-011` | gobierno tecnológico y documental                | `CAP-SCOPE-015`, `016` y derivadas             |
| `BRECHA-CAP-012` | analítica, mejora y continuidad                  | `CAP-SCOPE-017`, `018` y derivadas             |
| `BRECHA-CAP-013` | recorrido TALENTO hacia ANIMA                    | `CAP-TAL-001..006`                             |

Las trece tienen destino documental. Ninguna se considera cerrada hasta que su
tarea produzca resultado, evidencia y aceptación.

---

#### 13. Preguntas e información todavía pendientes

Las preguntas operativas acumuladas permanecen en la lista separada acordada.
No se copian ni se vuelven a preguntar aquí.

Reglas:

1. una respuesta anterior conserva vigencia mientras no exista evidencia
   contradictoria;
2. lo comprobable en código, datos o repositorios corresponde al asistente;
3. lo observable en el trabajo se entrega como autocuestionario directo al
   trabajador adecuado;
4. cada pregunta solicita una sola respuesta concreta;
5. una respuesta pendiente ajustará el estado AS-IS, pero no bloquea la
   aprobación de la estructura empresarial;
6. ninguna ausencia de respuesta se convierte en una afirmación inventada.

Por tanto, `D-CAP004-008` y `D-CAP005-006` continúan como observaciones
operativas pendientes y no impiden iniciar la auditoría técnica.

---

#### 14. Control de cambios de la línea base

Después de aprobarse:

1. `LB-CAP-VENTO-001 v1.0` quedará congelada como referencia;
2. un hallazgo nuevo se registrará primero como evidencia o brecha;
3. cualquier cambio de capacidad, clasificación, frontera o propiedad indicará
   impacto, razón y tareas afectadas;
4. los ajustes menores usarán una adición trazable;
5. los cambios estructurales producirán una nueva versión;
6. `CODE-AUD-001` podrá proponer cambios, pero no reescribir esta versión de
   forma silenciosa;
7. una nueva tarea detectada se añadirá al documento canónico correspondiente,
   no solo al registro histórico.

---

#### 15. Uso de la línea base durante la auditoría

Cada superficie encontrada por `CODE-AUD-001` deberá poder relacionarse con:

```text
repositorio o servicio
        ↓
aplicación y superficie desplegada
        ↓
capacidad y resultado empresarial
        ↓
fuente, actor, permiso, evidencia y estado de uso
        ↓
coincidencia, duplicación, brecha o deuda
```

El código sin capacidad asociada quedará como candidato a deuda, utilidad
técnica o alcance no explicado. Una capacidad sin implementación suficiente
conservará su brecha. Ninguna de las dos conclusiones se asumirá sin evidencia.

---

#### 16. Decisiones propuestas

1. Se adopta `LB-CAP-VENTO-001 v1.0` como línea base documental.
2. Se conservan 18 familias y 217 subcapacidades.
3. Se conservan 94 capacidades núcleo, 45 de soporte y 78 transversales.
4. Se distinguen capacidad necesaria, aplicación actual y proyecto futuro.
5. Se aprueban las candidaturas y fronteras de aplicación como guía auditable.
6. Se conservan las trece brechas y todos sus destinos canónicos.
7. TALENTO queda como proyecto futuro anterior a ANIMA mediante `CAP-TAL-001..006`.
8. AURA permanece como idea futura sin funciones atribuidas.
9. VITAL permanece separado y no cubre salud laboral.
10. Las preguntas operativas pendientes no se duplican ni bloquean `CODE-AUD-001`.
11. Toda tarea adicional futura deberá incorporarse al plan ejecutable.
12. La siguiente continuidad única será `CODE-AUD-001`.

---

#### 17. Criterios de aceptación

`CAP-MAP-015` podrá aprobarse cuando:

- la línea base tenga identificador, versión y fecha;
- las 18 familias y 217 subcapacidades permanezcan visibles;
- clasificación y cobertura no se confundan;
- las aplicaciones actuales, futuras y separadas estén diferenciadas;
- las fronteras candidatas por familia estén registradas;
- TALENTO, ANIMA y VISO tengan un recorrido sin duplicar identidad;
- el POS futuro conserve consumidor final, trazabilidad y validación normativa;
- las duplicaciones confirmadas permanezcan visibles;
- las trece brechas tengan tareas de destino;
- las preguntas pendientes permanezcan aparte, simples y sin repetición;
- la aprobación no autorice implementación;
- el control de cambios impida reescrituras silenciosas;
- `CODE-AUD-001` sea la única continuidad inmediata.

---

#### 18. Resultado y continuidad

Al aprobarse esta tarea quedará cerrada la cadena:

```text
necesidad empresarial
        ↓
capacidad y resultado
        ↓
actor, información, fuente, integración, permiso y evidencia
        ↓
clasificación, propiedad, duplicación y brecha
        ↓
LB-CAP-VENTO-001 v1.0 aprobada
```

La continuidad será exclusivamente:

```text
CODE-AUD-001
— Inventariar todos los repositorios y superficies desplegadas
```

`CODE-AUD-001` iniciará el contraste técnico sin reabrir decisiones ya
respondidas y sin tratar una estructura técnica como prueba automática de uso.
