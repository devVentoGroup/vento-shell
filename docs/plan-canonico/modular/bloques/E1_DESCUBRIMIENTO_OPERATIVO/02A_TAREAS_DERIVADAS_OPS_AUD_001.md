### TAREAS E1 DERIVADAS DE OPS-AUD-001

Estas tareas materializan brechas AS-IS detectadas por `OPS-AUD-001`.
No diseñan todavía procesos TO-BE, pantallas, estructuras definitivas de datos
ni implementaciones físicas.

La ejecución formal de este conjunto ocurre después de `OPS-AUD-015` y antes
de `CAP-MAP-001`. La recolección de evidencia de `OPS-PLAN-002`,
`OPS-PLAN-003` y `OPS-PLAN-004` puede comenzar antes, sin alterar la tarea
actual ni permitir aprobaciones fuera de secuencia.

### ✅ OPS-ADM-001 — Documentar brecha registral y plan de regularización de la sede administrativa

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación  
**Dependencia cumplida:** `OPS-AUD-015`  
**Naturaleza:** Documentación AS-IS de una brecha registral, física y documental  
**Implementación técnica:** No autorizada  
**Cambios legales, contables o registrales:** No autorizados por esta tarea  
**Migraciones o cambios en Supabase:** No autorizados  
**Límite profesional:** esta tarea no reemplaza la validación de Contabilidad, asesoría jurídica, asesoría tributaria ni la actuación ante entidades externas

---

#### 1. Propósito

Documentar y delimitar la brecha existente entre:

- la ubicación donde funciona realmente la administración de Vento Group;
- la dirección registral vigente;
- la referencia interna denominada `Oficina 1`;
- la relación física de esa oficina con Vento Café;
- la forma en que esa ubicación aparece en documentos, sistemas, contratos y comunicaciones.

La tarea deberá producir:

```text
EVIDENCIA DISPONIBLE
→ ESTADO ACTUAL
→ DIFERENCIA REGISTRAL O DOCUMENTAL
→ DECISIONES REQUERIDAS
→ RESPONSABLES
→ PLAN DE REGULARIZACIÓN
→ TAREA EXTERNA CONDICIONAL
```

No se ejecutará todavía ninguna modificación ante entidades públicas, bancos, aseguradoras, proveedores, arrendadores o plataformas.

---

#### 2. Resultado esperado

Al aprobar esta tarea deberá quedar definido:

1. qué se conoce con suficiente certeza;
2. qué dato exacto debe verificarse documentalmente;
3. qué referencias no deben utilizarse como equivalentes;
4. qué documentos o sistemas podrían estar afectados;
5. quién debe tomar la decisión empresarial;
6. quién debe emitir el concepto contable o jurídico;
7. qué acción externa deberá ejecutarse si se confirma la necesidad de regularización;
8. cómo deberá normalizarse posteriormente la referencia interna.

---

#### 3. Línea base AS-IS

##### 3.1. Hechos suficientemente establecidos

Se considera suficientemente establecido que:

- Vento Group utiliza un punto administrativo real;
- ese punto es identificado internamente como `Oficina 1`;
- existe una relación física entre `Oficina 1` y Vento Café;
- la actividad principal de la oficina es administrativa;
- la oficina no constituye ordinariamente un punto de venta al público;
- la oficina no constituye ordinariamente un centro de producción;
- existe una brecha o ambigüedad entre la ubicación administrativa real y la referencia registral o documental vigente;
- la relación física con Vento Café no permite concluir automáticamente que ambas operaciones sean la misma sede empresarial, el mismo establecimiento o el mismo contexto operativo.

##### 3.2. Hechos que no deberán presumirse

Esta tarea no afirmará, sin evidencia documental, que:

- `Oficina 1` sea un establecimiento de comercio independiente;
- `Oficina 1` tenga una matrícula, registro o dirección propia;
- la dirección registral vigente sea incorrecta jurídicamente;
- la oficina esté dentro, encima, contigua o separada de Vento Café bajo una categoría jurídica específica;
- compartir inmueble implique compartir operación;
- compartir dirección implique compartir inventario, Caja, personal, permisos o responsabilidad;
- toda entidad externa deba ser actualizada;
- exista incumplimiento legal o tributario.

---

#### 4. Problema documentado

La brecha no consiste únicamente en que puedan existir dos direcciones distintas.

La brecha completa es:

```text
UBICACIÓN FÍSICA REAL
+
NOMBRE INTERNO “OFICINA 1”
+
DIRECCIÓN REGISTRAL
+
REFERENCIA A VENTO CAFÉ
+
DOCUMENTOS Y SISTEMAS QUE UTILIZAN ESOS DATOS
        ↓
NO ESTÁN RECONCILIADOS EN UNA DEFINICIÓN EMPRESARIAL ÚNICA
```

Esto puede provocar que una misma ubicación sea presentada de formas diferentes según:

- documento;
- aplicación;
- contrato;
- trabajador;
- proveedor;
- entidad;
- trámite;
- comunicación.

---

#### 5. Distinciones obligatorias

##### 5.1. Titular jurídico

Persona jurídica o natural responsable ante terceros.

##### 5.2. Dirección registral

Dirección declarada en uno o más registros o documentos externos.

##### 5.3. Establecimiento

Figura jurídica o comercial cuya existencia deberá confirmarse profesionalmente.

##### 5.4. Sede operativa

Lugar donde se ejecutan capacidades empresariales reales.

##### 5.5. Punto administrativo

Lugar donde se realizan funciones administrativas, aunque no sea un establecimiento independiente.

##### 5.6. Oficina interna

Espacio identificado por la organización para ubicar personas, documentos, activos o funciones.

##### 5.7. Área

Unidad funcional dentro de una sede o punto operativo.

##### 5.8. Dirección de correspondencia

Lugar utilizado para recibir comunicaciones, que puede no equivaler al domicilio, establecimiento o sede operativa.

Estas categorías no deberán fusionarse para simplificar el modelo.

---

#### 6. Estado de evidencia

| Código      | Afirmación                                                                                | Estado                          |
| ----------- | ----------------------------------------------------------------------------------------- | ------------------------------- |
| `E-ADM-001` | Existe una operación administrativa real de Vento Group                                   | `CONFIRMADO`                    |
| `E-ADM-002` | La ubicación se identifica internamente como `Oficina 1`                                  | `CONFIRMADO`                    |
| `E-ADM-003` | `Oficina 1` tiene una relación física con Vento Café                                      | `CONFIRMADO_PARCIAL`            |
| `E-ADM-004` | La naturaleza física exacta de esa relación debe quedar documentada                       | `PENDIENTE_DOCUMENTAL`          |
| `E-ADM-005` | La referencia registral vigente no está reconciliada con la realidad operativa descrita   | `BRECHA_CONFIRMADA`             |
| `E-ADM-006` | La oficina no opera ordinariamente como punto de venta                                    | `CONFIRMADO`                    |
| `E-ADM-007` | La oficina no opera ordinariamente como centro de producción                              | `CONFIRMADO`                    |
| `E-ADM-008` | Los registros externos concretos que requieren cambio deben determinarse profesionalmente | `PENDIENTE_EXTERNO`             |
| `E-ADM-009` | Los sistemas internos pueden contener referencias inconsistentes                          | `POR_AUDITAR_EN_IMPLEMENTACIÓN` |

---

#### 7. Información mínima que deberá reconciliarse

| Campo                                  | Valor actual                            | Evidencia requerida                              | Responsable de aportar  |
| -------------------------------------- | --------------------------------------- | ------------------------------------------------ | ----------------------- |
| Nombre interno                         | `Oficina 1`                             | Uso interno confirmado                           | Jefatura de Operaciones |
| Nombre empresarial de referencia       | Vento Group / denominación aplicable    | Documento empresarial                            | Gerencia / Contabilidad |
| Dirección física real                  | Pendiente de transcripción exacta       | Visita, contrato o recibo                        | Gerencia                |
| Dirección registral vigente            | Pendiente de transcripción exacta       | Registro o certificado vigente                   | Contabilidad / asesor   |
| Relación con Vento Café                | Pendiente de clasificación exacta       | Plano, contrato, nomenclatura o evidencia física | Gerencia / propietario  |
| Titular del inmueble o contrato        | Pendiente                               | Contrato o documento                             | Gerencia                |
| Titular de la operación administrativa | Pendiente de confirmación documental    | Registro empresarial                             | Contabilidad            |
| Uso real del espacio                   | Administrativo                          | Observación y funciones ejecutadas               | Jefatura de Operaciones |
| Personal habitual                      | Pendiente de consolidación              | Asignaciones reales                              | Gerencia                |
| Activos custodiados                    | Pendiente de inventario                 | `OPS-ACT-001`                                    | Operaciones             |
| Dinero o documentos custodiados        | Según procesos administrativos actuales | Evidencia de proceso                             | Gerencia / Contabilidad |

La falta de transcripción de una dirección exacta no impide aprobar esta tarea documental; impide ejecutar una regularización externa sin validación profesional.

---

#### 8. Relación operativa con Vento Café

La relación física con Vento Café deberá documentarse sin fusionar las operaciones.

##### 8.1. Lo que puede compartirse físicamente

Por confirmar:

- inmueble;
- acceso;
- dirección principal;
- servicios;
- zonas comunes;
- conexión interna;
- recepción de correspondencia.

##### 8.2. Lo que no deberá suponerse compartido

- titular jurídico;
- Caja;
- facturación;
- inventario;
- trabajadores;
- área operativa;
- permisos;
- costos;
- activos;
- responsabilidad;
- horarios;
- documentos.

##### 8.3. Regla temporal

Hasta que exista decisión profesional:

```text
VENTO GROUP — OFICINA 1
→ PUNTO ADMINISTRATIVO REAL

VENTO CAFÉ
→ SEDE COMERCIAL Y OPERATIVA

RELACIÓN FÍSICA
→ DOCUMENTADA

FUSIÓN JURÍDICA U OPERATIVA
→ NO PRESUMIDA
```

---

#### 9. Funciones administrativas observadas o asociadas

La oficina puede concentrar o soportar actividades como:

- Gerencia;
- coordinación operativa;
- Contabilidad o enlace contable;
- compras;
- gestión de proveedores;
- gestión documental;
- contratación;
- programación laboral;
- Marketing;
- Vaila Vainilla;
- soporte tecnológico;
- administración de aplicaciones;
- recepción temporal de facturas, soportes o efectivo.

Esta lista describe capacidades AS-IS y no asigna automáticamente:

- propiedad funcional;
- cargo;
- permiso;
- centro de costo;
- responsabilidad jurídica.

Esas decisiones corresponden a tareas posteriores.

---

#### 10. Brechas específicas

##### 10.1. Brecha de nomenclatura

`Oficina 1` es una referencia interna útil, pero insuficiente para documentos empresariales si no se relaciona con:

- titular;
- dirección;
- tipo de punto;
- vigencia.

##### 10.2. Brecha de dirección

La dirección utilizada registralmente puede no describir de forma inequívoca la ubicación administrativa real.

##### 10.3. Brecha de relación física

No está formalmente clasificado si `Oficina 1`:

- forma parte del mismo inmueble;
- es una unidad interna;
- es una oficina diferenciada;
- usa la dirección de Vento Café únicamente como referencia.

##### 10.4. Brecha documental

Distintos documentos pueden utilizar nombres o direcciones diferentes.

##### 10.5. Brecha de sistemas

Los sistemas internos pueden confundir:

- sede;
- área;
- empresa;
- marca;
- dirección;
- punto de custodia.

##### 10.6. Brecha de responsabilidad

No existe todavía un responsable documental único de mantener sincronizadas las referencias internas y externas.

---

#### 11. Riesgos derivados

| Riesgo                                     | Consecuencia                                                           |
| ------------------------------------------ | ---------------------------------------------------------------------- |
| Dirección ambigua                          | Correspondencia, visita o notificación enviada al punto incorrecto     |
| Nombre inconsistente                       | Documentos y sistemas representan entidades diferentes                 |
| Oficina fusionada con Vento Café           | Permisos, costos, activos o procesos mal atribuidos                    |
| Oficina separada sin evidencia             | Duplicación artificial de sedes o registros                            |
| Documentos no actualizados                 | Inconsistencia frente a terceros                                       |
| Activos sin punto claro                    | Custodia y depreciación difíciles de reconstruir                       |
| Efectivo o soportes sin ubicación definida | Pérdida de trazabilidad                                                |
| Cambios externos no coordinados            | Registros contradictorios                                              |
| Cambio interno prematuro                   | Aplicaciones alineadas con una decisión jurídica todavía no confirmada |

---

#### 12. Escenarios de regularización

##### 12.1. Escenario A — Misma dirección válida y oficina interna

Aplica cuando la dirección registral cubre correctamente el inmueble y `Oficina 1` es una denominación interna.

Acciones posibles:

- conservar registros externos;
- normalizar el nombre interno;
- documentar relación con Vento Café;
- corregir sistemas y documentos internos.

##### 12.2. Escenario B — Mismo inmueble, unidad o referencia incompleta

Aplica cuando la dirección principal coincide, pero falta identificar correctamente oficina, unidad, piso, local o relación contractual.

Acciones posibles:

- obtener concepto profesional;
- actualizar los documentos externos que correspondan;
- normalizar la nomenclatura interna después del dictamen.

##### 12.3. Escenario C — Dirección física diferente de la registral

Aplica cuando la administración funciona realmente en una dirección distinta.

Acciones posibles:

- determinar qué registros deben actualizarse;
- definir fecha efectiva;
- ejecutar cambios coordinados;
- evitar períodos con referencias contradictorias.

##### 12.4. Escenario D — Dirección registral y dirección operativa cumplen funciones distintas

Aplica cuando una dirección es domicilio, notificación o registro y otra corresponde al punto administrativo.

Acciones posibles:

- documentar ambas sin tratarlas como error;
- definir cuál usa cada documento;
- representar internamente la diferencia.

##### 12.5. Regla

La selección del escenario requiere:

```text
EVIDENCIA DOCUMENTAL
+
CONCEPTO CONTABLE O JURÍDICO
+
DECISIÓN DE GERENCIA O DIRECCIÓN
```

---

#### 13. Documentos y registros potencialmente afectados

La afectación deberá evaluarse; no se declara automática.

##### 13.1. Registros empresariales y tributarios

- certificados empresariales;
- registro tributario;
- obligaciones municipales;
- registros de establecimiento;
- información de facturación.

##### 13.2. Contratos

- arrendamiento;
- comodato;
- prestación de servicios;
- contratos laborales;
- contratos con proveedores;
- pólizas y seguros.

##### 13.3. Entidades financieras y laborales

- bancos;
- portales de nómina;
- aseguradoras;
- seguridad social y riesgos laborales;
- proveedores de pago.

##### 13.4. Operación y terceros

- facturas recibidas;
- órdenes;
- formularios;
- firmas;
- correspondencia;
- datos de proveedores;
- datos de clientes empresariales;
- guías de mensajería.

##### 13.5. Sistemas internos

- catálogo de sedes;
- áreas;
- usuarios;
- asignaciones;
- permisos contextuales;
- centros de costo;
- activos;
- ubicaciones;
- plantillas;
- reportes;
- documentos generados.

---

#### 14. Regla interna provisional

Hasta que se emita la decisión profesional:

1. usar `Vento Group — Oficina 1` como referencia operativa interna;
2. identificarla como `punto administrativo`;
3. no declararla automáticamente como establecimiento independiente;
4. no fusionarla con Vento Café;
5. conservar la dirección registral vigente en documentos externos existentes;
6. no actualizar aplicaciones con una dirección no verificada;
7. marcar la relación registral como pendiente de regularización;
8. mantener trazabilidad entre el nombre interno y la documentación externa vigente.

Esta regla no modifica ningún registro.

---

#### 15. Responsables

| Responsabilidad                                     | Responsable                                     |
| --------------------------------------------------- | ----------------------------------------------- |
| Levantar ubicación física y uso real                | Jefatura de Operaciones                         |
| Aportar documentos vigentes                         | Gerencia / Administración                       |
| Identificar implicaciones contables y tributarias   | Contabilidad o asesor correspondiente           |
| Identificar implicaciones jurídicas y contractuales | Asesoría jurídica cuando aplique                |
| Tomar decisión empresarial                          | Dirección / Gerencia autorizada                 |
| Ejecutar trámites externos                          | Responsable designado según concepto            |
| Normalizar sistemas internos                        | Jefatura de Operaciones, después de la decisión |
| Verificar cierre documental                         | Gerencia + Contabilidad                         |

---

#### 16. Plan de regularización

##### 16.1. Etapa 1 — Expediente de evidencia

Reunir únicamente los documentos necesarios para comparar:

- dirección física;
- dirección registral;
- contrato o soporte de ocupación;
- titular;
- referencias usadas en documentos principales.

##### 16.2. Etapa 2 — Matriz de discrepancias

Registrar:

| Documento o sistema | Referencia actual | Referencia esperada | Diferencia | Requiere cambio  |
| ------------------- | ----------------- | ------------------- | ---------- | ---------------- |
|                     |                   |                     |            | `POR_DETERMINAR` |

##### 16.3. Etapa 3 — Concepto profesional

Contabilidad y asesoría aplicable deberán determinar:

- escenario;
- obligación real;
- entidades;
- documentos;
- orden;
- fecha efectiva;
- evidencia de cierre.

##### 16.4. Etapa 4 — Decisión empresarial

Dirección o Gerencia deberá aprobar:

- referencia definitiva;
- responsable;
- alcance;
- fecha;
- presupuesto, si aplica.

##### 16.5. Etapa 5 — Ejecución externa

Se activa `EXT-ADM-001` únicamente cuando exista concepto y decisión.

##### 16.6. Etapa 6 — Normalización interna

Después de la ejecución externa o de confirmar que no es necesaria:

- actualizar catálogos;
- actualizar plantillas;
- actualizar documentos internos;
- verificar asignaciones;
- conservar evidencia.

##### 16.7. Etapa 7 — Cierre

El expediente deberá demostrar:

```text
DECISIÓN
→ CAMBIOS EXTERNOS APLICABLES
→ CAMBIOS INTERNOS
→ VERIFICACIÓN
→ FECHA DE VIGENCIA
```

---

#### 17. Tarea externa condicional

##### `EXT-ADM-001 — Ejecutar regularización registral y documental de la sede administrativa`

**Estado:** NO ACTIVADA — DEPENDE DE CONCEPTO PROFESIONAL  
**Naturaleza:** actuación externa, administrativa, contable o jurídica; no es implementación de software  
**Dependencia:** `OPS-ADM-001` aprobada + concepto profesional + decisión empresarial

**Propósito**

Ejecutar únicamente los trámites y actualizaciones que hayan sido determinados como aplicables.

**Entrada obligatoria**

- expediente de evidencia;
- escenario aprobado;
- lista de entidades y documentos;
- responsable;
- fecha efectiva;
- orden de ejecución.

**Salida obligatoria**

- comprobantes;
- certificados o documentos actualizados;
- fecha de vigencia;
- diferencias no resueltas;
- autorización para normalización interna.

**Límite**

`EXT-ADM-001` no podrá activarse con base únicamente en una suposición documental o técnica.

---

#### 18. Decisiones propuestas

1. La administración real se reconoce como un punto operativo administrativo.
2. Su referencia interna provisional será `Vento Group — Oficina 1`.
3. `Oficina 1` y Vento Café no se fusionan por compartir una relación física.
4. La oficina no se declarará establecimiento independiente sin validación.
5. La dirección registral vigente no se modificará desde esta tarea.
6. La brecha se considera confirmada aunque el trámite exacto permanezca pendiente.
7. La clasificación jurídica final corresponde a profesionales y Dirección.
8. Los documentos potencialmente afectados se evaluarán por aplicabilidad.
9. Los sistemas internos se actualizarán únicamente después de la decisión.
10. Se crea `EXT-ADM-001` como tarea externa condicional no activada.
11. La ejecución externa no bloquea la continuidad documental de E1.
12. Cualquier brecha adicional deberá quedar vinculada a una tarea concreta.
13. Ninguna decisión autoriza código, migraciones ni cambios en Supabase.

---

#### 19. Criterios de aceptación

`OPS-ADM-001` podrá aprobarse cuando se confirme que:

- la brecha está descrita;
- se separan ubicación física, dirección registral, sede, oficina y establecimiento;
- se documenta la relación con Vento Café sin presumir equivalencia;
- se define una referencia interna provisional;
- se identifican documentos potencialmente afectados;
- se asignan responsables;
- se establecen escenarios de regularización;
- se define un plan de ejecución;
- existe una tarea externa condicional;
- no se han realizado cambios legales;
- no se ha emitido asesoría jurídica o contable desde el roadmap;
- no se ha diseñado todavía el modelo TO-BE;
- no se ha autorizado implementación.

---

#### 20. Resultado y continuidad

Con la aprobación de `OPS-ADM-001` quedará documentada la brecha registral y el mecanismo para resolverla sin bloquear el avance del roadmap.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-GOV-001
— Documentar gobernanza AS-IS del ecosistema de marcas y titulares
```

`OPS-GOV-001` deberá documentar cómo se relacionan actualmente Vento Group, Vento Café, Saudo, Molka, Vaila Vainilla y catering, sin diseñar todavía el modelo financiero, contable o societario objetivo.


### ✅ OPS-GOV-001 — Documentar gobernanza AS-IS del ecosistema de marcas y titulares

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencia cumplida:** `OPS-AUD-015` y `OPS-ADM-001` aprobada conceptualmente
**Naturaleza:** documentación AS-IS de fronteras de marca, titularidad, operación y recursos
**Implementación técnica:** no autorizada
**Cambios legales, societarios, contables, tributarios o registrales:** no autorizados por esta tarea
**Migraciones o cambios en Supabase:** no autorizados
**Límite profesional:** esta tarea no sustituye certificados, contratos, registros, asesoría jurídica, tributaria o contable.

---

#### 1. Propósito

Documentar, sin presumir una estructura jurídica o financiera objetivo, cómo se distinguen actualmente Vento Group, Vento Café, Saudo, Molka, Vaila Vainilla y catering; qué evidencia existe de su operación; qué recursos parecen atravesar más de un frente; y qué debe confirmarse antes de declarar titularidades, facturación, costos o responsabilidades.

La salida de la tarea será:

```text
EVIDENCIA DISPONIBLE
→ FRENTERAS AS-IS
→ RECURSOS Y SERVICIOS COMPARTIDOS OBSERVADOS
→ HECHOS NO CONFIRMADOS
→ RIESGOS
→ RESPONSABLES DE VALIDACIÓN
→ DESTINO DOCUMENTAL O EXTERNO DE CADA BRECHA
```

No crea empresas, marcas, sedes, centros de costo, catálogos, permisos, integraciones ni reglas de facturación.

---

#### 2. Principios obligatorios

1. Marca, titular jurídico, sede operativa, canal comercial, línea de producto, centro de costo y aplicación no son equivalentes.
2. La presencia de una sede o una marca en la operación no demuestra por sí misma quién factura, contrata, posee activos o asume obligaciones frente a terceros.
3. Compartir personal, instalaciones, administración, proveedores o canales no demuestra por sí mismo identidad jurídica, mezcla patrimonial ni autorización para imputar costos.
4. Las fronteras documentadas aquí describen el estado observado; el modelo TO-BE se reserva para E2, NUMERA, BLOQUE X y las tareas de dominio correspondientes.
5. Ninguna conclusión de esta tarea autoriza una modificación externa o de sistemas internos.

---

#### 3. Inventario AS-IS de frentes identificados

| Frente         | Clasificación AS-IS                                   | Evidencia disponible                                                                 | Lo que no queda probado por esta tarea                                                                  |
| -------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| Vento Group    | referencia organizacional y punto administrativo real | `OPS-ADM-001` documenta `Oficina 1` como punto administrativo real                   | razón social exacta, titularidad de cada operación, relación jurídica con las demás marcas              |
| Vento Café     | sede comercial y operativa                            | aparece como sede con áreas operativas, asignaciones laborales y dispositivo de caja | titular jurídico, facturación, propiedad de activos o relación societaria con otros frentes             |
| Saudo          | sede operativa diferenciada                           | aparece como sede con áreas, roles, turnos y operación propia                        | titular jurídico, facturación, activos, costos o relación jurídica con Vento Café/Molka                 |
| Molka          | sede operativa diferenciada                           | aparece como sede con asignaciones laborales y rol operativo                         | titular jurídico, facturación, activos, costos o relación jurídica con los demás frentes                |
| Vaila Vainilla | línea, marca o canal comercial por confirmar          | Shopify y mensajería se asocian operativamente con Vaila Vainilla                    | titular de marca, canal de venta exacto, inventario, facturación, producción, recaudo y responsabilidad |
| Catering       | capacidad o canal comercial por confirmar             | figura como elemento que debe gobernarse y diseñarse en tareas posteriores           | titular, oferta, operación, facturación, activos, personal, contratos y canales efectivos               |

La tabla no clasifica jurídicamente ninguno de los frentes. Su función es impedir que nombres operativos se conviertan prematuramente en entidades, sedes, empresas o centros de costo.

---

#### 4. Relaciones observadas y límites de evidencia

##### 4.1. Administración transversal

`OPS-ADM-001` confirma un punto administrativo real denominado provisionalmente `Vento Group — Oficina 1`. Desde allí se asocian funciones administrativas como gerencia, coordinación, compras, gestión documental, programación laboral, marketing, soporte tecnológico y administración de aplicaciones.

Esto confirma una concentración administrativa observada; no confirma qué frente es titular de cada obligación, documento, activo, ingreso, gasto o relación laboral.

##### 4.2. Operación por sede

Vento Café, Saudo y Molka se encuentran representados como sedes diferenciadas en la configuración laboral y operativa. Existen trabajadores con asignaciones en más de una sede.

Esto evidencia movilidad o cobertura operativa multisede. No permite inferir que los trabajadores, costos, cajas, inventarios o activos sean compartidos sin reglas o documentos específicos.

##### 4.3. Canales y plataformas externas

La documentación de contingencias asocia Shopify y mensajería con Vaila Vainilla, y contempla catering entre los canales o capacidades que deberán diseñarse posteriormente.

No existe, dentro de la evidencia revisada, una conciliación que pruebe para cada canal: titular de la cuenta, emisor de factura, cuenta receptora, responsable del pedido, responsable de la entrega, inventario usado y tratamiento de devoluciones.

##### 4.4. Producción, distribución y frentes comerciales

Centro de Producción, Vento Café, Saudo y Molka aparecen como contextos operativos distintos. La relación económica entre producción, distribución y sedes comerciales no se define en esta tarea; su destino es `OPS-CST-001` y las tareas de NUMERA indicadas allí.

---

#### 5. Matriz de evidencia y estado

| Código    | Afirmación                                                                      | Estado                      | Evidencia o destino de validación                              |
| --------- | ------------------------------------------------------------------------------- | --------------------------- | -------------------------------------------------------------- |
| `GOV-001` | Existe una referencia organizacional Vento Group y un punto administrativo real | `CONFIRMADO`                | `OPS-ADM-001`                                                  |
| `GOV-002` | Vento Café, Saudo y Molka se operan como sedes diferenciadas                    | `CONFIRMADO`                | configuraciones de sede, áreas, roles y asignaciones auditadas |
| `GOV-003` | Existe cobertura laboral multisede                                              | `CONFIRMADO`                | asignaciones y ejemplos de roles por sede auditados            |
| `GOV-004` | Vaila Vainilla depende operativamente de Shopify y mensajería                   | `CONFIRMADO_PARCIAL`        | auditoría de contingencias; flujo comercial completo pendiente |
| `GOV-005` | Catering corresponde a una capacidad o canal que requiere gobierno explícito    | `CONFIRMADO_PARCIAL`        | `OPS-CAN-001` lo incluye como alcance futuro                   |
| `GOV-006` | La titularidad jurídica de cada frente está reconciliada                        | `PENDIENTE_DOCUMENTAL`      | `EXT-GOV-001` condicional                                      |
| `GOV-007` | La titularidad de cada marca y canal externo está reconciliada                  | `PENDIENTE_DOCUMENTAL`      | `EXT-GOV-001` condicional + `OPS-CAN-001`                      |
| `GOV-008` | Facturación, recaudo y cuentas receptoras están asignados por frente            | `PENDIENTE_DE_CONCILIACION` | `OPS-CST-001` + auditoría funcional de NUMERA                  |
| `GOV-009` | Costos, activos y personal compartidos tienen regla de imputación aprobada      | `PENDIENTE_DE_DISENO`       | `OPS-ACT-001`, `OPS-CST-001` y NUMERA                          |
| `GOV-010` | Cada canal tiene propietario funcional y responsable de atención                | `PENDIENTE_DE_DISENO`       | `OPS-CAN-001`                                                  |

---

#### 6. Fronteras provisionales de lectura

Hasta contar con evidencia documental y decisiones posteriores, se usará la siguiente lectura AS-IS:

```text
Vento Group
→ referencia organizacional y administrativa observada

Vento Café / Saudo / Molka / Centro de Producción
→ sedes operativas diferenciadas

Vaila Vainilla / catering
→ frentes comerciales o capacidades por caracterizar

Titular jurídico, titular de marca, emisor de factura,
propietario de cuenta, centro de costo y dueño de activo
→ NO PRESUMIDOS A PARTIR DEL NOMBRE O LA SEDE
```

Esta regla evita dos errores opuestos: fusionar frentes por conveniencia operativa o inventar separaciones jurídicas sin soporte.

---

#### 7. Servicios y recursos potencialmente transversales

| Recurso o servicio                  | Estado AS-IS                            | Riesgo si se presume una regla                                               | Destino                                       |
| ----------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------- |
| Administración y coordinación       | concentrada parcialmente en Oficina 1   | atribuir obligaciones o decisiones al frente incorrecto                      | `OPS-ADM-001` y `CAP-MAP-001` a `CAP-MAP-006` |
| Personal multisede                  | observado                               | tratar la asignación laboral como imputación de costo o pertenencia jurídica | `CAP-MAP-003`, `CAP-MAP-006`, `OPS-CST-001`   |
| Activos y puntos de custodia        | incompleto                              | asignar propiedad por ubicación física                                       | `OPS-ACT-001`                                 |
| Producción y transferencias         | relación operativa por caracterizar     | duplicar inventario, ingreso o costo entre producción y sede                 | `OPS-LOG-001`, `OPS-CST-001`                  |
| Shopify, mensajería y otros canales | asociados parcialmente a Vaila Vainilla | perder trazabilidad de pedido, recaudo, entrega o devolución                 | `OPS-CAN-001` y BLOQUE X                      |
| Catering                            | sin caracterización AS-IS suficiente    | abrir ventas o compromisos sin propietario ni contrato operativo             | `OPS-CAN-001`, `OPS-B2B-001` cuando aplique   |

---

#### 8. Riesgos registrados

| Riesgo                                                                        | Consecuencia                                                             | Tratamiento documental                             |
| ----------------------------------------------------------------------------- | ------------------------------------------------------------------------ | -------------------------------------------------- |
| Marca, sede y titular se usan como sinónimos                                  | facturación, contratos, permisos o reportes atribuidos incorrectamente   | `EXT-GOV-001` condicional y `CAP-MAP-003`          |
| Un canal externo no tiene propietario funcional y económico distinguible      | pedidos, recaudos, devoluciones o soporte sin responsable claro          | `OPS-CAN-001`                                      |
| Personal o activos multisede se interpretan como compartidos sin trazabilidad | costo, custodia, autorización y responsabilidad ambiguos                 | `OPS-ACT-001` y `OPS-CST-001`                      |
| Producción y venta se reconcilian solo de forma informal                      | duplicación u omisión de inventario, costo o ingreso                     | `OPS-LOG-001`, `OPS-CST-001`, NUMERA               |
| Catering se trata como marca, sede o canal sin definición                     | compromisos comerciales sin proceso, responsable ni capacidad confirmada | `OPS-CAN-001` y `OPS-B2B-001` si supera viabilidad |

---

#### 9. Validaciones requeridas y responsables

| Validación                                                                 | Responsable inicial                          | Evidencia mínima                                            | Destino                                                 |
| -------------------------------------------------------------------------- | -------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------- |
| Titular jurídico, representación y registros aplicables por frente         | Gerencia + Contabilidad + asesoría aplicable | certificados, registros y contratos vigentes                | `EXT-GOV-001` condicional                               |
| Titularidad y uso autorizado de marcas, dominios, redes y cuentas externas | Gerencia / Marketing + asesoría aplicable    | cuenta, contrato, registro o autorización                   | `EXT-GOV-001` condicional; `OPS-CAN-001` para operación |
| Emisor de factura, recaudo y conciliación por canal                        | Contabilidad                                 | facturas, extractos, contratos de plataforma y conciliación | `OPS-CST-001` + NUMERA                                  |
| Activo, custodio y ubicación de recursos compartidos                       | Operaciones                                  | inventario y evidencia de custodia                          | `OPS-ACT-001`                                           |
| Propietario funcional, actor y flujo de cada canal                         | Operaciones / Comercial                      | proceso observado, responsables y excepciones               | `OPS-CAN-001`                                           |

---

#### 10. Tarea externa condicional propuesta

### [ ] EXT-GOV-001 — Verificar soporte documental de titulares, marcas y cuentas externas del ecosistema

**Estado:** NO ACTIVADA — requiere evidencia documental y decisión de Gerencia
**Naturaleza:** validación documental, administrativa y profesional; no es implementación de software
**Dependencia:** `OPS-GOV-001` aprobada + expediente disponible

**Propósito:** reconciliar, por cada frente identificado, el titular jurídico, denominación o marca usada, representación, cuenta o canal externo, documento de soporte, vigencia y responsable interno.

**Entrada obligatoria:** inventario de frentes, documentos disponibles, cuentas/canales conocidos, discrepancias y responsable de aportar evidencia.

**Salida obligatoria:** matriz documental por frente; diferencias confirmadas; decisiones requeridas; lista de cambios externos aplicables; y autorización explícita para normalización posterior cuando corresponda.

**Límite:** no crea ni modifica registros, contratos, marcas, cuentas, facturación, permisos o datos de aplicaciones.

Esta tarea queda materializada como identificador único dentro del fragmento canónico propietario y deberá aparecer en el registro global de tareas.

---

#### 11. Decisiones propuestas

1. Vento Group se reconoce provisionalmente como referencia organizacional y administrativa observada, no como sustituto automático del titular de cada frente.
2. Vento Café, Saudo y Molka se reconocen como sedes operativas diferenciadas; esa clasificación no decide titularidad jurídica, económica o de activos.
3. Vaila Vainilla y catering se mantienen como frentes por caracterizar; no se les atribuye automáticamente empresa, sede, marca registrada, inventario, cuenta de recaudo ni proceso definitivo.
4. La asignación multisede de trabajadores no equivale a mezcla de costos, activos, inventario o responsabilidad jurídica.
5. Todo canal externo deberá distinguir: titular de cuenta, propietario funcional, emisor de factura, receptor de recaudo, responsable de preparación, responsable de entrega y tratamiento de devolución.
6. Los activos se atribuirán por evidencia de propiedad y custodia, no solo por ubicación; el destino inmediato es `OPS-ACT-001`.
7. La relación económica entre producción, distribución y sedes se definirá en `OPS-CST-001` y NUMERA, no en esta tarea.
8. La arquitectura objetivo de canales, incluidos catering y Vaila Vainilla, se definirá en `OPS-CAN-001` después del cierre de E1.
9. Se propone `EXT-GOV-001` como tarea externa condicional para verificar soporte documental de titulares, marcas y cuentas externas.
10. Ninguna decisión de esta tarea autoriza cambios legales, financieros, contables, tributarios, de código, migraciones o Supabase.

---

#### 12. Criterios de aceptación

`OPS-GOV-001` podrá aprobarse cuando se confirme que:

- cada frente está descrito sin convertir nombres operativos en conclusiones jurídicas;
- se distinguen marca, titular, sede, canal, línea de producto, centro de costo y aplicación;
- están documentados los recursos y servicios compartidos observados, con sus límites de evidencia;
- toda incertidumbre de titularidad, canal, activo, costo o facturación tiene destino concreto;
- existe una tarea externa condicional para validar soportes documentales;
- la tarea no diseña aún el modelo financiero, contable, societario ni TO-BE;
- no se han realizado cambios en registros, contratos, plataformas, sistemas, código o Supabase.

---

#### 13. Resultado y continuidad

Con la aprobación de `OPS-GOV-001` quedará disponible una lectura AS-IS controlada del ecosistema de frentes operativos y comerciales, sin convertir ambigüedades documentales en decisiones de arquitectura.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-ACT-001
— Inventariar activos y puntos externos de custodia
```

`OPS-ACT-001` deberá identificar activo o familia, propietario, custodio, ubicación, condición, uso, riesgo, evidencia y destino documental, sin inferir propiedad solo por sede o marca.



### ✅ OPS-ACT-001 — Inventariar activos y puntos externos de custodia

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencia cumplida:** `OPS-AUD-015`, `OPS-ADM-001` y `OPS-GOV-001`
**Naturaleza:** inventario AS-IS de activos, reutilizables, puntos de custodia y evidencia disponible
**Implementación técnica:** no autorizada
**Cambios contables, patrimoniales, registrales o de seguros:** no autorizados
**Migraciones o cambios en Supabase:** no autorizados

---

#### 1. Propósito

Crear la línea base verificable de los activos y recursos físicos que se encuentran fuera de una sede formal, en tránsito, en custodia administrativa o cuya ubicación, titularidad, condición o responsable no estén inequívocamente documentados.

La tarea produce:

```text
ACTIVO O FAMILIA
→ UBICACIÓN O PUNTO DE CUSTODIA
→ CUSTODIO OBSERVADO
→ CONDICIÓN Y USO
→ EVIDENCIA DISPONIBLE
→ RIESGO
→ DESTINO DE CADA BRECHA
```

No determina depreciación, propiedad legal, valor contable, baja, seguro, compra, venta, transferencia ni asignación definitiva en aplicaciones.

---

#### 2. Principios obligatorios

1. Ubicación física, custodio, propietario, responsable operativo, usuario y centro de costo son atributos distintos.
2. Un activo no se atribuye a una sede, marca, empresa o persona únicamente por estar allí o ser usado por ella.
3. Un recurso reutilizable controlado por cantidad no se inventa como activo individual si no existe identificación o evidencia suficiente; se clasifica provisionalmente como familia pendiente de modelo.
4. La existencia de un vehículo, canastas, hornos, decoración, mobiliario o materiales no demuestra por sí misma propiedad, disponibilidad, condición ni cobertura de seguro.
5. Este inventario documenta AS-IS y no sustituye conteo físico, avalúo, contabilidad ni controles de seguridad.

---

#### 3. Alcance inicial

| Familia o punto                                                      | Estado de evidencia                           | Riesgo operativo conocido                                | Destino documental                             |
| -------------------------------------------------------------------- | --------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------- |
| Decoraciones y elementos de marca                                    | inventario incompleto                         | pérdida, préstamo informal o atribución incorrecta       | `NEXO-DOM-008` a `NEXO-DOM-011`                |
| Vehículo                                                             | dependencia crítica identificada              | interrupción de remisiones y abastecimiento              | `NEXO-DOM-027`                                 |
| Canastas y reutilizables de transporte                               | cantidad, ubicación y custodia no conciliadas | pérdida de trazabilidad, empaque improvisado y faltantes | `NEXO-DOM-009`, `NEXO-DOM-011`, `NEXO-DOM-014` |
| Mobiliario, herramientas y repuestos fuera de sede formal            | inventario y custodia incompletos             | mantenimiento, reposición y costo no trazables           | `NEXO-DOM-010` a `NEXO-DOM-013`                |
| Equipos pendientes de instalar o reubicar                            | ubicación y destino por confirmar             | activos o capacidades inactivas sin responsable          | `NEXO-DOM-008`, `NEXO-DOM-012`                 |
| Documentos físicos, soportes y efectivo bajo custodia administrativa | punto y responsable por confirmar             | pérdida de trazabilidad y exposición financiera          | `OPS-ADM-001`, `OPS-CST-001` y E4              |
| Activos en tránsito o en poder de terceros                           | relación y evidencia por levantar             | pérdida de custodia o devolución no verificable          | `NEXO-DOM-011`                                 |

---

#### 4. Hechos y límites confirmados

Se encuentra documentado que:

- el vehículo y el conductor son dependencias distintas y críticas para remisiones y abastecimiento;
- canastas y mensajería son recursos relevantes para transporte y entrega;
- existen activos, soportes o efectivo que pueden permanecer en el punto administrativo `Vento Group — Oficina 1`;
- el modelo actual de activos es parcial y aún no define integralmente reutilizables, custodia y mantenimiento;
- Vento Café, Saudo, Molka y Centro de Producción son contextos operativos diferenciados, pero ello no determina la propiedad de los recursos ubicados allí.

No se afirma todavía:

- que exista un inventario físico completo;
- quién es propietario jurídico o contable de cada ítem;
- que todos los recursos estén disponibles, asegurados, identificados o en buen estado;
- que una persona, sede o marca deba absorber un costo por custodiar o usar el recurso;
- que una ubicación temporal sea un punto de almacenamiento autorizado.

---

#### 5. Registro mínimo obligatorio

Cada ítem individual o familia deberá registrarse con los siguientes campos. Si el dato se desconoce, se anotará `POR_VERIFICAR`, nunca se inferirá.

| Campo                    | Regla                                                                              |
| ------------------------ | ---------------------------------------------------------------------------------- |
| Código temporal          | único para la evidencia, sin convertirlo aún en código de inventario definitivo    |
| Familia y descripción    | qué recurso es y para qué se usa                                                   |
| Control                  | individual, por cantidad, kit, consumible, documento, efectivo o por definir       |
| Identificador disponible | placa, serial, etiqueta, foto, referencia o `NO_DISPONIBLE`                        |
| Ubicación actual         | sede, punto externo, tránsito, tercero o `POR_VERIFICAR`                           |
| Custodio observado       | persona, equipo o tercero que lo conserva o entrega; no equivale a propietario     |
| Responsable operativo    | quien requiere el recurso para el proceso, si es distinto del custodio             |
| Condición                | operativo, degradado, en reparación, pendiente de instalar, perdido, por verificar |
| Uso y proceso asociado   | producción, venta, logística, administración, marketing, catering u otro           |
| Titularidad              | confirmada documentalmente, atribuida provisionalmente o por verificar             |
| Evidencia                | foto, factura, contrato, acta, placa, conteo, conversación o ausencia documentada  |
| Riesgo y prioridad       | pérdida, seguridad, operación, financiero, legal o mantenimiento                   |
| Destino                  | tarea concreta que resuelve la brecha                                              |

---

#### 6. Estados permitidos

| Campo      | Valores AS-IS permitidos                                                                               |
| ---------- | ------------------------------------------------------------------------------------------------------ |
| Ubicación  | `SEDE_CONFIRMADA`, `PUNTO_ADMINISTRATIVO`, `TRANSITO`, `TERCERO`, `EXTERNO_NO_FORMAL`, `POR_VERIFICAR` |
| Custodia   | `CONFIRMADA`, `OBSERVADA`, `DISPUTADA`, `NO_DEFINIDA`, `POR_VERIFICAR`                                 |
| Condición  | `OPERATIVO`, `DEGRADADO`, `EN_REPARACION`, `PENDIENTE_INSTALAR`, `NO_LOCALIZADO`, `POR_VERIFICAR`      |
| Evidencia  | `DOCUMENTAL`, `FISICA`, `FOTOGRAFICA`, `TESTIMONIAL`, `NINGUNA`, `POR_RECOLECTAR`                      |
| Criticidad | `IC1` a `IC5`, usando la escala ya documentada de continuidad                                          |

---

#### 7. Procedimiento de levantamiento

1. Crear listado inicial por familia, no por presunta propiedad.
2. Realizar conteo físico o verificación remota identificando ubicación y custodia observada.
3. Capturar evidencia mínima sin publicar números de serie, placas o documentos sensibles fuera del repositorio de evidencia autorizado.
4. Separar activos individuales, reutilizables por cantidad, consumibles, documentos y efectivo.
5. Marcar diferencias entre existencia observada, ubicación declarada, custodio declarado y soporte disponible.
6. Vincular cada diferencia con una tarea existente; si no hay tarea responsable, crear una tarea formal antes de cerrar E1.
7. No efectuar bajas, movimientos, reasignaciones, correcciones contables ni cambios de sistemas durante el levantamiento.

---

#### 8. Brechas y destinos obligatorios

| Brecha                                                          | Destino exacto                                                                  |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| Custodio actual no definido                                     | `NEXO-DOM-008`                                                                  |
| Condición, daño, pérdida o faltante                             | `NEXO-DOM-010`                                                                  |
| Préstamo, devolución, transferencia o tránsito                  | `NEXO-DOM-011`                                                                  |
| Mantenimiento, reparación o disponibilidad                      | `NEXO-DOM-012` y `NEXO-DOM-026`                                                 |
| Baja, descarte, venta o reemplazo                               | `NEXO-DOM-013`                                                                  |
| Kit, conjunto, canasta o completitud                            | `NEXO-DOM-014`                                                                  |
| Vehículo, kilometraje, combustible o mantenimiento              | `NEXO-DOM-027`                                                                  |
| Impacto económico de adquisición, reparación, pérdida o baja    | `NEXO-DOM-028` y NUMERA                                                         |
| Propiedad, custodia o documento físico del punto administrativo | `OPS-ADM-001`, `EXT-ADM-001` cuando aplique, y `EXT-GOV-001` cuando corresponda |
| Relación entre activos, costos y frentes operativos             | `OPS-CST-001`                                                                   |

---

#### 9. Riesgos prioritarios

| Riesgo                                     | Impacto                                                | Tratamiento en esta fase                                                                                            |
| ------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| Vehículo no disponible o sin alternativa   | `IC5` para remisiones y abastecimiento                 | identificar vehículo, custodio, condición, documentos disponibles y dependencia; diseño posterior en `NEXO-DOM-027` |
| Canastas o reutilizables sin control       | pérdida, faltantes y empaque improvisado               | conteo por familia y punto; modelo posterior en `NEXO-DOM-009`, `NEXO-DOM-011`, `NEXO-DOM-014`                      |
| Activo fuera de sede sin custodio          | pérdida o imposibilidad de reconstruir responsabilidad | registrar ubicación/custodia observada y evidencia; resolver con `NEXO-DOM-008`                                     |
| Equipo pendiente de instalar               | capacidad bloqueada y deterioro                        | identificar destino y condición; resolver disponibilidad con `NEXO-DOM-012`                                         |
| Documento o efectivo sin punto de custodia | riesgo financiero, legal y de trazabilidad             | registrar sin exponer contenido; destino `OPS-ADM-001`, `OPS-CST-001` y E4                                          |

---

#### 10. Responsables

| Responsabilidad                                                 | Responsable inicial                                    |
| --------------------------------------------------------------- | ------------------------------------------------------ |
| Coordinar inventario físico y evidencia                         | Jefatura de Operaciones                                |
| Identificar uso, estado y ubicación observada                   | responsable de cada sede, área o proceso               |
| Aportar soportes de adquisición, contrato, seguro o titularidad | Gerencia / Administración / Contabilidad según aplique |
| Validar vehículo y recursos de logística                        | Operaciones + responsable de logística                 |
| Evaluar impacto contable o tributario                           | Contabilidad o asesoría aplicable                      |
| Mantener evidencia sensible                                     | responsable documental autorizado                      |
| Consolidar brechas y destinos                                   | Responsable de E1 / `GAP-CTRL-001` a `GAP-CTRL-006`    |

---

#### 11. Decisiones propuestas

1. Se creará una línea base de inventario AS-IS antes de diseñar el modelo definitivo de activos.
2. Todo recurso se clasificará por evidencia y control requerido, no por supuesto propietario.
3. Vehículo, canastas, recursos en tránsito y activos fuera de sede se consideran prioritarios por su riesgo operativo.
4. La custodia observada se registrará sin convertirla en autorización, propiedad o imputación de costo.
5. Ninguna diferencia habilita una baja, compra, transferencia, ajuste contable o cambio de sistema.
6. Cada diferencia tendrá uno de los destinos definidos en la sección 8; ninguna quedará solo como observación.
7. Los datos sensibles de documentos, efectivo, placas y seriales permanecerán en el repositorio de evidencia autorizado, no en el plan canónico.

---

#### 12. Criterios de aceptación

`OPS-ACT-001` podrá aprobarse cuando:

- exista un inventario AS-IS por familia o ítem con ubicación, custodia, condición, evidencia y riesgo;
- se distingan activo, reutilizable, consumible, documento y efectivo;
- vehículo, canastas, activos externos y recursos pendientes de instalar estén identificados o declarados explícitamente no localizados;
- ninguna titularidad, valor, baja o transferencia se presente como confirmada sin soporte;
- cada brecha tenga tarea, responsable y evidencia de cierre;
- no se hayan realizado cambios contables, legales, físicos, de código o Supabase.

---

#### 13. Resultado y continuidad

Con la aprobación de `OPS-ACT-001` quedará trazada la evidencia mínima para que los modelos de custodia, reutilizables, mantenimiento, flota y costo se diseñen después sin ocultar activos fuera de los catálogos actuales.

La continuidad deberá realizarse exclusivamente con:

```text
OPS-PLAN-001
— Definir el programa de auditoría de demanda y requisitos de planificación productiva
```

`OPS-PLAN-001` definirá preguntas, períodos, fuentes, responsables y calidad mínima para auditar demanda; no aprobará todavía algoritmo, mínimos, producción base ni proceso TO-BE.

### ✅ OPS-PLAN-001 — Definir el programa de auditoría de demanda y requisitos de planificación productiva

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencia cumplida:** `OPS-AUD-015`, `OPS-ADM-001`, `OPS-GOV-001` y `OPS-ACT-001`
**Naturaleza:** protocolo AS-IS de evidencia y conciliación de demanda
**Implementación técnica, algoritmo, mínimos o automatización:** no autorizados
**Cambios en Supabase:** no autorizados
**Ejecución de la auditoría:** diferida; esta aprobación define el instrumento, pero no obliga a ejecutarlo ahora

---

#### 1. Propósito

Definir cómo se levantará evidencia suficiente de ventas, pedidos, remisiones, faltantes, sobrantes, mermas e inventario para comprender la demanda real y los requisitos de planificación productiva.

```text
FUENTES DISPONIBLES
→ CALIDAD Y VACÍOS
→ DEMANDA OBSERVADA
→ FALTANTES / SOBRANTES / MERMAS
→ CONCILIACIÓN
→ REQUISITOS DE PLANIFICACIÓN
→ DESTINO DE BRECHAS
```

No decide todavía qué producir, cuánto producir, qué inventario mínimo mantener, cómo asignar costo ni qué sistema será fuente de verdad definitiva.

---

#### 2. Preguntas obligatorias

1. ¿Qué se solicitó, vendió, preparó, despachó, recibió, devolvió o quedó pendiente por producto, presentación, canal y sede?
2. ¿Qué fuente registra cada hecho y con qué período, acceso, granularidad y confiabilidad?
3. ¿Dónde se originan faltantes, sobrantes, sustituciones, cancelaciones, mermas y diferencias de inventario?
4. ¿Qué productos son previsibles, estacionales, bajo pedido, críticos o de producción limitada?
5. ¿Qué restricciones de capacidad, equipos, personal, ventana horaria, logística e insumos afectan el cumplimiento?
6. ¿Qué datos no se pueden recuperar históricamente y deben comenzar a registrarse prospectivamente?

---

#### 3. Fuentes a auditar

| Fuente                                | Hecho potencial                                           | Responsable inicial                | Destino        |
| ------------------------------------- | --------------------------------------------------------- | ---------------------------------- | -------------- |
| Makos / POS vigente                   | ventas, mesas, pedidos, descuentos, pagos y cancelaciones | Contabilidad / operación comercial | `OPS-PLAN-002` |
| Inventarios, compras y recepciones    | disponibilidad, entrada, faltante y costo observado       | Contabilidad / bodega              | `OPS-PLAN-002` |
| Remisiones y hojas de solicitud       | pedido entre puntos, preparado, entregado y recibido      | Operaciones                        | `OPS-PLAN-002` |
| Rappi                                 | pedidos externos, cancelaciones y demanda por canal       | Responsable de pedidos             | `OPS-PLAN-003` |
| ManyChat, WhatsApp y canales directos | solicitud, conversación, pedido y entrega                 | Responsable de pedidos             | `OPS-PLAN-003` |
| Shopify / Vaila Vainilla              | pedidos, pago, preparación y despacho por confirmar       | Comercial / operaciones            | `OPS-PLAN-003` |
| Conteo y observación operativa        | sobrantes, faltantes, merma, sustitución y no venta       | Responsable de sede o producción   | `OPS-PLAN-004` |

---

#### 4. Unidad mínima de análisis

Cada registro recuperable o prospectivo deberá poder distinguir, cuando aplique:

| Campo                               | Regla                                                                                     |
| ----------------------------------- | ----------------------------------------------------------------------------------------- |
| Fecha y hora                        | conservar zona y período de corte                                                         |
| Producto y presentación             | no agregar presentaciones distintas sin trazabilidad                                      |
| Canal                               | sede, POS, Rappi, directo, Shopify, B2B u `OTRO_POR_VERIFICAR`                            |
| Sede solicitante / origen / destino | separar cuando exista transferencia o remisión                                            |
| Cantidad                            | solicitada, confirmada, preparada, enviada, recibida, vendida, faltante, sobrante o merma |
| Estado                              | completado, parcial, cancelado, sustituido, pendiente o desconocido                       |
| Evidencia                           | sistema, documento, mensaje, conteo u observación                                         |
| Calidad                             | completa, parcial, inconsistente, no recuperable o por validar                            |
| Responsable                         | propietario de la fuente y persona que valida el dato                                     |
| Observación                         | causa conocida, limitación o discrepancia, sin corrección silenciosa                      |

---

#### 5. Reglas de calidad y conciliación

1. No sumar fuentes distintas como si fueran ventas independientes sin identificar su relación.
2. Una cifra sin producto, presentación, fecha o canal se clasifica como agregada y no sirve para cálculo fino.
3. Las diferencias entre pedido, preparación, despacho, recepción y venta se conservan; no se corrigen para forzar coincidencia.
4. Una ausencia histórica se registra como `NO_RECUPERABLE` con período y responsable, no como cero demanda.
5. Cualquier estimación debe señalar método, fuente, responsable y nivel de confianza.
6. El programa separará demanda observada de capacidad disponible y de decisión futura de producción.

---

#### 6. Salidas de las tareas derivadas

| Tarea          | Salida aprobable                                                                                 |
| -------------- | ------------------------------------------------------------------------------------------------ |
| `OPS-PLAN-002` | inventario de fuentes internas, períodos, formatos, acceso, propietario y calidad conocida       |
| `OPS-PLAN-003` | evidencia por canal, faltantes, sobrantes, variaciones, estacionalidad y límites de recuperación |
| `OPS-PLAN-004` | registro prospectivo de solicitud, entrega y diferencia con responsables y frecuencia            |

La recolección de evidencia de `OPS-PLAN-002` a `OPS-PLAN-004` puede comenzar tras esta propuesta; su aprobación formal conserva el orden canónico.

Cada tarea derivada deberá entregar un checklist operativo reutilizable. La ejecución puede posponerse, pero las preguntas, variables, fuentes, responsables y evidencias requeridas deberán permanecer documentadas para no depender de esta conversación.

##### 6.1. Regla de resolución delegable

Cada duda deberá convertirse en una pregunta concreta que pueda responder la persona más cercana al hecho mediante observación, conteo, demostración, documento o descripción de su trabajo. El cuestionario indicará:

- rol adecuado para responder;
- lugar, momento y proceso que debe observar;
- pregunta en lenguaje cotidiano;
- opciones de respuesta y cuándo usar `NO SÉ` o `NO APLICA`;
- evidencia mínima esperada;
- repregunta según cada respuesta;
- criterio para considerar la duda resuelta;
- responsable que valida y tarea que recibe el resultado.

El trabajador no será responsable de diseñar soluciones, interpretar arquitectura, consultar bases de datos ni emitir conclusiones jurídicas o contables. Cajeros, meseros, operarios, responsables de pedidos y encargados responderán sobre hechos observables; Contabilidad y Gerencia responderán sobre soportes, decisiones y responsabilidades empresariales. Solo los casos que requieran acceso técnico, seguridad o inspección de sistemas se escalarán posteriormente, conservando primero la descripción funcional obtenida del trabajador.

---

#### 7. Brechas y destinos

| Brecha                                                      | Destino                                                  |
| ----------------------------------------------------------- | -------------------------------------------------------- |
| Fuente inexistente, inaccesible o no recuperable            | `OPS-PLAN-002` o `OPS-PLAN-003`                          |
| Diferencia persistente entre solicitud, entrega y recepción | `OPS-PLAN-004`, `OPS-LOG-001` y `NEXO-DOM` aplicable     |
| Producto, presentación o unidad ambigua                     | `CAP-MAP-001` a `CAP-MAP-015` y catálogo correspondiente |
| Capacidad productiva, equipo o personal insuficiente        | `CAP-SCOPE-008`, `OPS-LOG-001` y FOGO                    |
| Falta de trazabilidad económica                             | `OPS-CST-001` y NUMERA                                   |
| Canal sin responsable o flujo definido                      | `OPS-CAN-001` y BLOQUE X                                 |

---

#### 8. Decisiones propuestas

1. La auditoría partirá de hechos observables y conservará diferencias, vacíos y calidad de fuente.
2. No se aprobará algoritmo, pronóstico, mínimo, lote, producción base ni compra automática desde esta tarea.
3. La recuperación histórica y el registro prospectivo se tratarán como fuentes diferentes y conciliables, no intercambiables.
4. Ningún dato sin trazabilidad mínima se usará como base única de una decisión de producción.
5. Cada vacío tendrá el destino definido en la sección 7.
6. La auditoría puede ejecutarse posteriormente; `OPS-PLAN-002` a `OPS-PLAN-004` conservarán sus instrumentos, variables y controles específicos.
7. Las dudas se formularán como cuestionarios delegables y no exigirán conocimientos de ingeniería para describir el hecho empresarial.

---

#### 9. Criterios de aceptación

`OPS-PLAN-001` podrá aprobarse cuando estén definidas preguntas, fuentes, unidad mínima de análisis, reglas de calidad, responsables, salidas de `OPS-PLAN-002` a `OPS-PLAN-004` y destino de brechas; sin diseñar todavía el proceso TO-BE, algoritmo, mínimos, automatización o cambios de sistemas.

---

#### 10. Resultado y continuidad

Al aprobarse, quedará definido el protocolo de evidencia necesario para iniciar la consolidación de fuentes internas.

La continuidad será:

```text
OPS-PLAN-002
— Consolidar fuentes internas para la auditoría de demanda
```


### ✅ OPS-PLAN-002 — Consolidar fuentes internas para la auditoría de demanda

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento integral de operación, capacidades y cobertura de implementación
**Dependencia cumplida:** `OPS-PLAN-001`
**Responsable inicial de evidencia:** Contabilidad, con apoyo de Operaciones, Bodega y responsables de sistema
**Naturaleza:** inventario y plan de acceso a fuentes internas AS-IS
**Extracción, análisis estadístico o modificación de datos:** no autorizados por esta tarea
**Cambios en código, Supabase o sistemas externos:** no autorizados
**Ejecución:** puede realizarse posteriormente mediante el checklist definido aquí

---

#### 1. Propósito

Construir el inventario operativo de las fuentes internas necesarias para auditar demanda, disponibilidad y cumplimiento, dejando claro:

```text
QUÉ FUENTE EXISTE
→ QUIÉN LA CONTROLA
→ CÓMO SE ACCEDE
→ QUÉ PERÍODO CUBRE
→ QUÉ CAMPOS CONTIENE
→ QUÉ HECHO EMPRESARIAL REPRESENTA
→ QUÉ CALIDAD Y LIMITACIONES TIENE
→ QUÉ ACCIÓN POSTERIOR REQUIERE
```

Esta tarea no descarga todavía todos los datos ni calcula demanda. Su salida es la lista verificable para ejecutar la auditoría después sin improvisación.

---

#### 2. Checklist maestro por fuente

Cada fuente deberá responder todas las variables siguientes:

| Grupo           | Variable de control     | Pregunta de auditoría                                                                       |
| --------------- | ----------------------- | ------------------------------------------------------------------------------------------- |
| Identidad       | código y nombre         | ¿Cómo se identifica inequívocamente la fuente?                                              |
| Propiedad       | propietario empresarial | ¿Quién responde por su significado y uso?                                                   |
| Custodia        | administrador técnico   | ¿Quién concede acceso, exporta o recupera información?                                      |
| Acceso          | mecanismo y estado      | ¿Existe acceso activo, solicitado, restringido o perdido?                                   |
| Seguridad       | clasificación           | ¿Contiene datos personales, financieros, comerciales o credenciales?                        |
| Cobertura       | fecha inicial y final   | ¿Qué período real está disponible?                                                          |
| Frecuencia      | actualización           | ¿Es tiempo real, diaria, semanal, mensual o manual?                                         |
| Granularidad    | unidad de registro      | ¿Venta, línea, pedido, producto, remisión, movimiento, conteo o agregado?                   |
| Formato         | soporte                 | ¿Base de datos, API, CSV, Excel, PDF, papel, mensaje o interfaz?                            |
| Identificadores | claves disponibles      | ¿Hay producto, presentación, sede, canal, pedido, documento y timestamps?                   |
| Cantidades      | medidas disponibles     | ¿Registra solicitado, vendido, preparado, enviado, recibido, faltante, sobrante o merma?    |
| Estados         | ciclo registrado        | ¿Distingue completado, parcial, cancelado, sustituido y pendiente?                          |
| Calidad         | estado evaluado         | ¿Es completa, parcial, inconsistente, no recuperable o por validar?                         |
| Conciliación    | claves de cruce         | ¿Con qué otra fuente puede relacionarse sin asumir equivalencia?                            |
| Limitaciones    | vacíos conocidos        | ¿Qué dato falta y desde cuándo?                                                             |
| Evidencia       | prueba de existencia    | ¿Hay captura, diccionario, exportación de muestra o responsable que la confirme?            |
| Acción          | siguiente paso          | ¿Exportar, solicitar acceso, documentar, conciliar, excluir o iniciar registro prospectivo? |

---

#### 3. Fuentes internas mínimas a confirmar

| Código provisional | Fuente                               | Hechos esperados                                                       | Responsable inicial                | Estado inicial               |
| ------------------ | ------------------------------------ | ---------------------------------------------------------------------- | ---------------------------------- | ---------------------------- |
| `SRC-DEM-001`      | Makos / POS vigente                  | ventas, líneas, productos, descuentos, impuestos, pagos, cancelaciones | Contabilidad / operación comercial | `POR_CONFIRMAR_ACCESO`       |
| `SRC-DEM-002`      | inventario actual                    | existencias, movimientos, conteos, ajustes y disponibilidad            | Bodega / Operaciones               | `POR_CONFIRMAR_COBERTURA`    |
| `SRC-DEM-003`      | compras y órdenes                    | solicitudes, proveedor, cantidades, fechas y estados                   | Compras / Contabilidad             | `POR_CONFIRMAR_FORMATO`      |
| `SRC-DEM-004`      | recepciones de proveedor             | recibido, diferencias, fecha, producto y presentación                  | Bodega / Compras                   | `POR_CONFIRMAR_GRANULARIDAD` |
| `SRC-DEM-005`      | solicitudes de remisión              | solicitado por sede, producto, presentación y fecha                    | Operaciones                        | `POR_INVENTARIAR`            |
| `SRC-DEM-006`      | preparación y despacho de remisiones | preparado, sustituido, faltante, enviado y responsable                 | Bodega / Logística                 | `POR_INVENTARIAR`            |
| `SRC-DEM-007`      | recepción de remisiones              | recibido, diferencia, rechazo, ajuste y fecha                          | Sede receptora                     | `POR_INVENTARIAR`            |
| `SRC-DEM-008`      | conteos e inventarios finales        | saldo, sobrante, faltante, merma y momento de corte                    | Producción / Bodega / sedes        | `POR_CONFIRMAR_EXISTENCIA`   |
| `SRC-DEM-009`      | producción ejecutada                 | lote, producto, cantidad, rendimiento, merma y fecha                   | Producción                         | `POR_CONFIRMAR_FUENTE`       |
| `SRC-DEM-010`      | archivos y hojas manuales            | solicitudes, consolidaciones y correcciones no presentes en sistemas   | Operaciones / Contabilidad         | `POR_LOCALIZAR`              |

Rappi, ManyChat, WhatsApp, Shopify y entrevistas por canal se detallarán en `OPS-PLAN-003`; solo se registrarán aquí cuando exista una copia o conciliación interna controlada.

---

#### 4. Estados normalizados

Cada fuente tendrá exactamente un estado principal:

```text
CONFIRMADA_ACCESIBLE
CONFIRMADA_RESTRINGIDA
ACCESO_SOLICITADO
ACCESO_PERDIDO
EXISTENCIA_POR_CONFIRMAR
NO_RECUPERABLE
SUSTITUIDA
FUERA_DE_ALCANCE
```

Y una clasificación de calidad:

```text
UTILIZABLE
UTILIZABLE_CON_LIMITACIONES
REQUIERE_CONCILIACION
SOLO_AGREGADA
INCONSISTENTE
SIN_MUESTRA
NO_EVALUADA
```

`NO_RECUPERABLE` nunca se interpretará como ausencia de demanda ni como valor cero.

---

#### 5. Evidencia mínima antes de declarar una fuente confirmada

Una fuente solo podrá marcarse `CONFIRMADA_ACCESIBLE` cuando exista:

1. responsable empresarial identificado;
2. mecanismo de acceso verificado;
3. período disponible confirmado;
4. granularidad conocida;
5. lista mínima de campos;
6. muestra controlada o evidencia equivalente;
7. clasificación de sensibilidad;
8. limitaciones documentadas;
9. acción siguiente asignada.

No se incluirán credenciales, datos personales, números financieros sensibles ni exportaciones completas dentro del plan canónico.

---

#### 6. Procedimiento de ejecución posterior

Cuando la auditoría sea activada:

1. entrevistar al propietario de cada fuente;
2. completar el checklist sin solicitar aún extracciones masivas;
3. obtener una muestra mínima y segura;
4. verificar fechas, granularidad, identificadores y estados;
5. documentar campos disponibles y significado;
6. identificar cruces posibles y evitar uniones por nombre libre;
7. registrar períodos faltantes y datos no recuperables;
8. clasificar calidad y utilidad;
9. asignar acción, responsable y evidencia de cierre;
10. aprobar el inventario antes de iniciar análisis cuantitativo.

---

#### 7. Variables para la muestra de validación

La muestra de cada fuente deberá permitir revisar, cuando aplique:

| Dimensión  | Campos esperados                                                                      |
| ---------- | ------------------------------------------------------------------------------------- |
| Tiempo     | fecha de creación, actualización, operación y cierre                                  |
| Producto   | identificador, nombre, presentación y unidad                                          |
| Territorio | sede, origen, destino y área cuando aplique                                           |
| Canal      | POS, remisión, compra, producción u otro                                              |
| Documento  | pedido, factura, recepción, remisión, lote o movimiento                               |
| Cantidad   | solicitada, confirmada, preparada, enviada, recibida, vendida y ajustada              |
| Estado     | pendiente, parcial, completado, cancelado, sustituido o rechazado                     |
| Actor      | creador, responsable, aprobador o receptor, sin exponer datos personales innecesarios |
| Evidencia  | referencia estable que permita volver al registro original                            |

---

#### 8. Criterios de conciliación preliminar

1. Producto y presentación deberán reconciliarse mediante identificadores o una tabla explícita de equivalencias.
2. Pedido, remisión, recepción y venta son hechos diferentes; no se fusionarán por compartir fecha o producto.
3. Las cantidades deberán conservar unidad y presentación originales.
4. Los timestamps se compararán usando zona horaria y regla de corte conocida.
5. Cancelaciones, sustituciones y parciales permanecerán visibles.
6. Los archivos manuales se conservarán como fuente separada hasta demostrar equivalencia.
7. Una fuente agregada no reemplazará registros detallados para análisis por producto, sede o canal.

---

#### 9. Registro de dudas puntuales

Toda duda encontrada se registrará con:

| Campo                         | Contenido                                                                       |
| ----------------------------- | ------------------------------------------------------------------------------- |
| ID                            | `DQ-DEM-###`                                                                    |
| Fuente                        | código `SRC-DEM-###` relacionado                                                |
| Pregunta exacta               | una sola duda verificable                                                       |
| Impacto                       | qué cálculo o decisión queda afectado                                           |
| Responsable de respuesta      | persona o función empresarial                                                   |
| Evidencia requerida           | documento, muestra, entrevista o acceso                                         |
| Fecha o condición de revisión | momento concreto, no “más adelante”                                             |
| Destino                       | `OPS-PLAN-003`, `OPS-PLAN-004`, CAP-MAP, FOGO, NEXO, NUMERA u otra tarea exacta |
| Estado                        | abierta, respondida, no recuperable, diferida o descartada con motivo           |

Este registro será la lista de dudas que el usuario podrá resolver posteriormente una por una.

---

#### 10. Cuestionario delegable por duda

Cada registro `DQ-DEM-###` deberá incluir una guía autocontenida que pueda entregarse directamente al trabajador o responsable seleccionado.

##### 10.1. Ficha de asignación

| Campo               | Contenido obligatorio                                                                     |
| ------------------- | ----------------------------------------------------------------------------------------- |
| Duda                | una sola pregunta empresarial                                                             |
| Persona adecuada    | rol o función, no nombre obligatorio                                                      |
| Motivo de selección | por qué esa persona observa o controla el hecho                                           |
| Lugar               | caja, salón, cocina, bodega, oficina, plataforma o sede                                   |
| Momento             | apertura, pedido, cierre, recepción, conteo, despacho u otro evento                       |
| Duración estimada   | minutos necesarios para observar o responder                                              |
| Preparación         | documento, dispositivo, producto o proceso que debe tener a la vista                      |
| Riesgo              | advertencia si no debe compartir datos personales, claves, valores o documentos completos |

##### 10.2. Estructura de preguntas

El cuestionario deberá seguir este orden:

1. **Contexto:** “Cuéntame qué ocurre desde que sucede X hasta que termina Y”.
2. **Observación:** “Muéstrame dónde ves o registras ese dato”.
3. **Frecuencia:** “¿Esto ocurre siempre, algunas veces o solo en una excepción?”.
4. **Variación:** “¿Qué cambia cuando falta producto, llega tarde o el pedido cambia?”.
5. **Responsabilidad:** “¿Quién recibe el dato, quién lo modifica y quién confirma que terminó?”.
6. **Evidencia:** “¿Qué queda guardado para demostrar lo ocurrido?”.
7. **Excepción:** “¿Qué haces cuando el sistema, documento o responsable no está disponible?”.
8. **Cierre:** “¿Cómo sabes que no quedó nada pendiente?”.

Cada pregunta deberá ofrecer `SÍ`, `NO`, `A VECES`, `NO SÉ` y `NO APLICA` cuando corresponda, además de un espacio breve para describir lo observado.

##### 10.3. Repreguntas condicionadas

| Respuesta                  | Repregunta obligatoria                                           |
| -------------------------- | ---------------------------------------------------------------- |
| `SÍ`                       | ¿Dónde puede observarse y qué evidencia queda?                   |
| `NO`                       | ¿Qué se hace en su lugar y quién decide?                         |
| `A VECES`                  | ¿En qué casos cambia y con qué frecuencia?                       |
| `NO SÉ`                    | ¿Quién lo sabría o qué documento permitiría comprobarlo?         |
| `NO APLICA`                | ¿Por qué no aplica a este rol, sede, canal o proceso?            |
| Respuestas contradictorias | observar el proceso y solicitar una segunda fuente independiente |

##### 10.4. Evidencia accesible para trabajadores

Se aceptarán:

- observación directa acompañada;
- demostración del flujo habitual;
- captura con datos sensibles ocultos;
- nombre de pantalla, reporte, cuaderno, formato o archivo;
- conteo manual;
- fotografía autorizada de elemento físico;
- ticket, comanda, remisión o documento con información sensible protegida;
- identificación de la persona que ejecuta el paso siguiente.

No se pedirá al trabajador consultar SQL, inspeccionar código, explicar integraciones, interpretar tablas, entregar contraseñas ni formular una solución técnica.

##### 10.5. Asignación por perfil

| Tipo de duda                                                     | Perfil preferente                                                                      |
| ---------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| toma de pedido, mesa, comanda, entrega y reclamo                 | mesero, cajero o responsable de atención                                               |
| apertura, cierre, venta, descuento, pago y cancelación           | cajero o responsable de sede                                                           |
| preparación, faltante, sustitución, merma y rendimiento          | operario, cocinero, panadero, repostero o responsable productivo                       |
| recepción, almacenamiento, conteo, despacho y devolución         | bodeguero, receptor o responsable logístico                                            |
| pedido digital y seguimiento                                     | responsable de pedidos o canal                                                         |
| factura, soporte, período, pago, costo y conciliación            | Contabilidad                                                                           |
| propiedad, decisión, excepción y responsable empresarial         | Gerencia General                                                                       |
| acceso, exportación, disponibilidad o comportamiento del sistema | responsable funcional primero; soporte técnico únicamente para la comprobación técnica |

##### 10.6. Criterio de resolución

Una duda se considerará resuelta cuando:

1. la respuesta identifique un hecho observable;
2. exista evidencia o una segunda fuente concordante;
3. estén diferenciados procedimiento habitual y excepción;
4. se conozca quién inicia, ejecuta, confirma y recibe el resultado;
5. se hayan registrado variaciones por sede, canal o rol;
6. el validador funcional confirme que la respuesta permite continuar.

Si el trabajador no conoce la respuesta, la tarea correcta es identificar a la siguiente persona o evidencia; nunca completar el cuestionario por suposición.

---

#### 11. Salidas obligatorias

`OPS-PLAN-002` deberá entregar:

- matriz completa de fuentes internas;
- checklist por fuente;
- responsables empresariales y técnicos;
- estado de acceso;
- períodos y granularidad;
- campos y claves disponibles;
- clasificación de sensibilidad;
- muestra o evidencia mínima;
- calidad y limitaciones;
- mapa preliminar de conciliación;
- registro `DQ-DEM-###` de dudas puntuales;
- acción y destino de cada brecha.

---

#### 12. Decisiones propuestas

1. No se iniciará análisis cuantitativo hasta aprobar el inventario de fuentes.
2. El plan documentará metadatos, controles y dudas; los datos sensibles permanecerán en ubicaciones autorizadas.
3. Cada fuente tendrá propietario, acceso, cobertura, granularidad, calidad, evidencia y acción.
4. Cada duda tendrá identificador, responsable, evidencia requerida y destino exacto.
5. Las fuentes externas y entrevistas por canal se profundizarán en `OPS-PLAN-003`.
6. Los vacíos no recuperables alimentarán el registro prospectivo de `OPS-PLAN-004`.
7. La ejecución puede diferirse sin perder el checklist aprobado.
8. Cada duda deberá convertirse en una guía entregable a un rol disponible y resolverse mediante observación o evidencia accesible.
9. El trabajador describirá el hecho; la validación, priorización y decisión permanecerán en el responsable funcional correspondiente.
10. No se exigirá conocimiento de ingeniería, bases de datos o arquitectura para responder preguntas operativas.

---

#### 13. Criterios de aceptación

`OPS-PLAN-002` podrá aprobarse cuando el instrumento permita inventariar todas las fuentes internas mínimas, clasificar acceso y calidad, verificar una muestra segura, registrar dudas puntuales, generar cuestionarios delegables y asignar destinos; sin descargar datos masivamente, analizar demanda, modificar sistemas ni exponer información sensible.

---

#### 14. Resultado y continuidad

Con la aprobación quedará preparada la lista específica de auditoría interna para ejecutarla cuando exista tiempo, acceso y responsables disponibles.

La continuidad será exclusivamente:

```text
OPS-PLAN-003
— Levantar demanda, faltantes y variaciones por canal
```

`OPS-PLAN-003` deberá completar el instrumento para Rappi, ManyChat, WhatsApp, Shopify, entrevistas y demás canales, conservando las mismas reglas de evidencia, calidad y registro de dudas.


### ✅ OPS-PLAN-003 — Levantar demanda, faltantes y variaciones por canal

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento de la operación actual
**Dependencias cumplidas:** `OPS-PLAN-001` y `OPS-PLAN-002`
**Propósito:** crear autocuestionarios de WhatsApp para saber cómo llegan los pedidos, qué suele faltar y qué suele sobrar
**Aplicación:** cada persona podrá completar su cuestionario sola
**No se realizará todavía:** cálculo de producción futura, cambios de sistemas o decisiones automáticas

---

#### 1. Regla obligatoria de los autocuestionarios

Cada pregunta deberá indicar exactamente:

1. qué debe marcar;
2. qué espacio debe completar;
3. qué debe escribir si marca `OTRO`;
4. qué debe hacer si responde `NO SÉ`;
5. un ejemplo de respuesta;
6. si debe adjuntar una foto, audio o ningún archivo.

No se usarán instrucciones abiertas como:

- “muéstrame el proceso”;
- “explica cómo funciona”;
- “describe el canal”;
- “indica la trazabilidad”;
- “revisa el sistema”.

---

#### 2. Mensaje inicial para copiar en WhatsApp

```text
Hola. Necesitamos conocer mejor lo que pasa con los pedidos durante el trabajo.

Te enviaré un formulario corto relacionado únicamente con las tareas que tú
realizas.

COPIA cada mensaje, marca las opciones con una X y completa los espacios.

Ejemplo:
[X] Sí
[ ] No

Puedes escribir NO SÉ. No es una evaluación de tu trabajo.

No envíes contraseñas, datos de clientes, números de tarjetas ni fotos donde
aparezca información privada.
```

---

#### 3. Formulario para meseros

##### MES-01 — Dónde anotas el pedido

```text
MES-01

Cuando una persona te pide comida o bebida, ¿dónde anotas el pedido?

Marca UNA opción:
[ ] En una tableta
[ ] En un computador
[ ] En un celular
[ ] En una comanda de papel
[ ] Lo digo de palabra
[ ] En otro lugar
[ ] NO SÉ

Nombre de la aplicación, aparato o papel:
________________________________

Si marcaste “En otro lugar”, escribe cuál:
________________________________

Ejemplo: “En la tableta negra, en Makos”.

NO envíes foto.
```

##### MES-02 — Cómo sabes si hay producto

```text
MES-02

Antes de confirmar un pedido, ¿cómo sabes si el producto sí está disponible?

Marca TODAS las que ocurran:
[ ] La tableta o computador lo muestra
[ ] Hay una lista escrita de productos agotados
[ ] Cocina o barra avisa
[ ] Pregunto cada vez
[ ] Solo me entero después de enviar el pedido
[ ] No hay una forma definida
[ ] Otra forma
[ ] NO SÉ

Si marcaste “Otra forma”, completa:
Me entero porque __________________________________

Escribe un producto que se haya agotado recientemente:
________________________________

Ejemplo: “Cocina avisa por el grupo de WhatsApp. Se agotó la lasaña”.
```

##### MES-03 — Qué pasa cuando no hay

```text
MES-03

Piensa en la ÚLTIMA VEZ que una persona pidió algo que no había.

Producto que pidió:
________________________________

¿Qué hiciste primero?
[ ] Le ofrecí otro producto
[ ] Pregunté a cocina o barra
[ ] Pedí ayuda al cajero
[ ] Cancelé ese producto
[ ] Otra cosa
[ ] No recuerdo un caso

¿Dónde quedó anotado que no había?
[ ] En el pedido
[ ] En una nota o papel
[ ] En un chat
[ ] No quedó anotado
[ ] NO SÉ

¿La persona compró otra cosa?
[ ] Sí. Compró: ________________________________
[ ] No
[ ] NO SÉ
```

##### MES-04 — Pedido incompleto o equivocado

```text
MES-04

En los últimos 7 días, ¿te entregaron algún pedido incompleto o equivocado?

[ ] Sí
[ ] No
[ ] No trabajé durante esos días
[ ] No recuerdo

Si respondiste SÍ:

¿Qué faltó o llegó equivocado?
________________________________

¿A quién avisaste?
________________________________

¿Dónde quedó anotada la corrección?
[ ] En la tableta o computador
[ ] En papel
[ ] En un chat
[ ] No quedó anotada
[ ] NO SÉ

Ejemplo: “Faltó una bebida. Avisé en barra. No quedó anotado”.
```

##### MES-05 — Productos que las personas buscan

```text
MES-05

Escribe hasta 3 productos que las personas hayan pedido y no hayan podido
comprar durante el último mes.

1. Producto: ________________________________
   Motivo:
   [ ] Se había agotado
   [ ] No estaba en el menú
   [ ] No se podía preparar en ese momento
   [ ] NO SÉ

2. Producto: ________________________________
   Motivo:
   [ ] Se había agotado
   [ ] No estaba en el menú
   [ ] No se podía preparar en ese momento
   [ ] NO SÉ

3. Producto: ________________________________
   Motivo:
   [ ] Se había agotado
   [ ] No estaba en el menú
   [ ] No se podía preparar en ese momento
   [ ] NO SÉ

Si no recuerdas ninguno, escribe: NO RECUERDO NINGUNO.
```

---

#### 4. Formulario para cajeros

##### CAJ-01 — De dónde recibes pedidos

```text
CAJ-01

¿De cuáles lugares recibes pedidos durante tu trabajo?

Marca TODOS:
[ ] Mesas
[ ] Mostrador
[ ] Rappi
[ ] WhatsApp
[ ] ManyChat
[ ] Shopify
[ ] Llamadas
[ ] Otro
[ ] NO SÉ

Si marcaste “Otro”, escribe cuál:
________________________________

¿Cuál de esas opciones revisas con mayor frecuencia?
________________________________
```

##### CAJ-02 — Pedidos que debes copiar

```text
CAJ-02

¿Hay pedidos que debes copiar manualmente de un celular, tableta, chat o papel
a otro aparato?

[ ] Sí
[ ] No
[ ] NO SÉ

Si respondiste SÍ, completa:

El pedido llega primero a:
________________________________

Después lo copio en:
________________________________

Lo copio:
[ ] Siempre
[ ] Solo algunas veces
[ ] Solo si me lo piden

Ejemplo: “Llega por WhatsApp y lo copio en Makos”.
```

##### CAJ-03 — Aviso de producto agotado

```text
CAJ-03

Cuando un producto se termina, ¿cómo te avisan?

Marca TODAS:
[ ] Aparece como agotado en pantalla
[ ] Me escriben por WhatsApp
[ ] Cocina o barra me avisa de palabra
[ ] Hay una lista escrita
[ ] Me entero cuando intento venderlo
[ ] No hay una forma definida
[ ] Otra forma
[ ] NO SÉ

Si marcaste “Otra forma”:
Me avisan así: ________________________________

¿Quién suele avisarte?
________________________________
```

##### CAJ-04 — Pedido pagado pero no preparado

```text
CAJ-04

¿Te ha pasado que un pedido ya está pagado pero no se puede preparar?

[ ] Sí
[ ] No
[ ] No recuerdo

Si respondiste SÍ, piensa en el caso más reciente:

¿Por qué no se pudo preparar?
[ ] Producto agotado
[ ] Faltó un ingrediente
[ ] Falló un equipo
[ ] Hubo un error en el pedido
[ ] Otra razón
[ ] NO SÉ

¿Qué hicieron con el pago?
[ ] Lo devolvieron
[ ] Cambiaron el producto
[ ] Dejaron el pedido pendiente
[ ] Otra solución
[ ] NO SÉ

Otra razón o solución:
________________________________
```

##### CAJ-05 — Revisión al cerrar

```text
CAJ-05

Al terminar el turno, ¿qué revisas para saber si quedaron pedidos pendientes?

Marca TODAS:
[ ] Pantalla o reporte de caja
[ ] Rappi
[ ] WhatsApp
[ ] ManyChat
[ ] Shopify
[ ] Comandas o papeles
[ ] Pregunto a otra persona
[ ] No hago una revisión
[ ] Otro

Nombre exacto de la pantalla, reporte, chat o papel:
________________________________

Ejemplo: “Reviso pedidos abiertos en Makos y la tableta de Rappi”.
```

---

#### 5. Formulario para quien atiende pedidos por aplicaciones o mensajes

Se responderá un formulario separado para Rappi, WhatsApp, ManyChat y Shopify.

Antes de enviarlo, reemplazar `[FORMA DE PEDIDO]` por el nombre correspondiente.

##### PED-01 — Cómo avisa que llegó

```text
PED-01 — [FORMA DE PEDIDO]

Cuando llega una nueva solicitud, ¿cómo te avisa?

Marca TODAS:
[ ] Suena una alarma
[ ] Sale un aviso en pantalla
[ ] Llega un mensaje al celular
[ ] Otra persona me avisa
[ ] Debo abrir y revisar para descubrirla
[ ] No hay aviso
[ ] Otra forma
[ ] NO SÉ

Nombre del aparato donde aparece:
________________________________

Si marcaste “Otra forma”:
Me avisa así: ________________________________

Ejemplo: “Suena la tableta blanca que está junto a la caja”.
```

##### PED-02 — Cuándo se vuelve pedido real

```text
PED-02 — [FORMA DE PEDIDO]

¿Cuál de estas acciones significa que el pedido ya quedó confirmado?

Marca UNA:
[ ] La persona envía el primer mensaje
[ ] La persona acepta el precio
[ ] La persona realiza el pago
[ ] Nosotros presionamos aceptar
[ ] Cocina o producción confirma
[ ] Otra acción
[ ] No hay un momento claro
[ ] NO SÉ

Si marcaste “Otra acción”, escribe exactamente cuál:
________________________________

Completa esta frase:
“Yo sé que ya es un pedido real cuando ________________________________”.
```

##### PED-03 — Información que recibes

```text
PED-03 — [FORMA DE PEDIDO]

Cuando recibes el pedido, ¿cuáles datos puedes ver?

Marca TODOS:
[ ] Nombre del producto
[ ] Tamaño o presentación
[ ] Cantidad
[ ] Precio
[ ] Nombre de la persona
[ ] Dirección
[ ] Teléfono
[ ] Forma de pago
[ ] Hora esperada
[ ] Lugar que debe prepararlo
[ ] Otro dato

Escribe qué dato necesitas pero normalmente NO aparece:
________________________________

NO envíes capturas con datos del cliente.
```

##### PED-04 — Dónde vuelves a escribirlo

```text
PED-04 — [FORMA DE PEDIDO]

Después de recibirlo, ¿debes volver a escribir el pedido en otro lugar?

[ ] Sí
[ ] No
[ ] Solo algunas veces
[ ] NO SÉ

Si respondiste SÍ o ALGUNAS VECES:

Lo recibo en: ________________________________
Lo vuelvo a escribir en: ________________________________
La persona que lo copia es: ________________________________

¿Cómo revisas que no quedó repetido?
[ ] Reviso el nombre
[ ] Reviso el número del pedido
[ ] Reviso la hora
[ ] No lo reviso
[ ] Otra forma: ________________________________
```

##### PED-05 — Cuando no hay producto

```text
PED-05 — [FORMA DE PEDIDO]

Piensa en el último pedido que no pudo completarse por falta de producto.

Producto que faltó:
________________________________

¿Quién descubrió que faltaba?
[ ] Caja
[ ] Cocina o barra
[ ] Producción
[ ] Bodega
[ ] Cliente
[ ] Otra persona: ________________________________
[ ] NO SÉ

¿Cómo le avisaron a la persona que compraba?
[ ] Mensaje
[ ] Llamada
[ ] La aplicación avisó
[ ] No le avisaron
[ ] NO SÉ

¿Qué decidió la persona?
[ ] Aceptó otro producto
[ ] Aceptó recibir menos
[ ] Canceló
[ ] Quedó pendiente
[ ] NO SÉ
```

##### PED-06 — Pago, preparación y entrega

```text
PED-06 — [FORMA DE PEDIDO]

Completa cada línea con el nombre del lugar, pantalla, chat o persona:

Sé que el pago llegó porque:
________________________________

Sé que empezaron a preparar porque:
________________________________

Sé que el pedido quedó listo porque:
________________________________

Sé que salió para entrega porque:
________________________________

Sé que fue entregado porque:
________________________________

Si alguna de estas cosas NO se puede saber, escribe NO SE PUEDE SABER en esa
línea.

Ejemplo: “Sé que quedó listo porque cocina escribe LISTO en el grupo”.
```

##### PED-07 — Pedidos que quedan sin cerrar

```text
PED-07 — [FORMA DE PEDIDO]

En el último mes, ¿viste algún pedido que:

[ ] quedó pagado pero no preparado?
[ ] fue preparado pero no salió?
[ ] salió pero no fue entregado?
[ ] fue entregado pero siguió apareciendo pendiente?
[ ] apareció dos veces?
[ ] ninguna de las anteriores?
[ ] NO SÉ?

Si marcaste alguna situación, completa:

Qué ocurrió:
________________________________

Cómo se dieron cuenta:
________________________________

Qué hicieron:
________________________________

Dónde quedó anotada la solución:
________________________________
```

---

#### 6. Formulario para cocina, barra y producción

##### PRO-01 — Cómo recibes lo que debes preparar

```text
PRO-01

¿Cómo recibes la lista de lo que debes preparar?

Marca TODAS:
[ ] Pantalla
[ ] Impresora
[ ] Papel escrito a mano
[ ] WhatsApp
[ ] Alguien lo dice de palabra
[ ] Excel
[ ] Otra forma
[ ] No hay una forma definida

Nombre del aparato, papel, chat o archivo:
________________________________

Ejemplo: “La impresora de cocina saca una comanda”.
```

##### PRO-02 — Cantidad pedida y cantidad preparada

```text
PRO-02

¿Dónde ves cuántas unidades debes preparar?
________________________________

¿Dónde anotas cuántas unidades sí preparaste?

[ ] En el mismo lugar
[ ] En otro lugar: ________________________________
[ ] No se anota
[ ] NO SÉ

Si preparas menos de lo pedido, ¿dónde anotas cuánto faltó?

[ ] En: ________________________________
[ ] No se anota
[ ] NO SÉ
```

##### PRO-03 — Motivos por los que no se completa

```text
PRO-03

Durante el último mes, ¿por cuáles razones no pudieron preparar todo lo pedido?

Marca TODAS:
[ ] Faltó un ingrediente
[ ] Faltó producto preparado
[ ] No alcanzó el tiempo
[ ] Faltó personal
[ ] Falló un equipo
[ ] Llegó tarde la solicitud
[ ] Se pidió más de lo habitual
[ ] Otra razón
[ ] No ocurrió
[ ] NO SÉ

La razón que más se repitió fue:
________________________________

Producto más afectado:
________________________________
```

##### PRO-04 — Lo que sobra

```text
PRO-04

Escribe hasta 3 productos que suelen quedar sobrando:

1. Producto: ________________________________
   ¿Cuándo suele sobrar?: ________________________________
   ¿Dónde se anota cuánto sobró?: ________________________________

2. Producto: ________________________________
   ¿Cuándo suele sobrar?: ________________________________
   ¿Dónde se anota cuánto sobró?: ________________________________

3. Producto: ________________________________
   ¿Cuándo suele sobrar?: ________________________________
   ¿Dónde se anota cuánto sobró?: ________________________________

Si no recuerdas ninguno, escribe: NO RECUERDO NINGUNO.
```

##### PRO-05 — Lo que se pierde o daña

```text
PRO-05

Cuando un producto se cae, se daña, se vence o no se puede usar:

¿Dónde se anota?
[ ] En una aplicación
[ ] En papel
[ ] En Excel
[ ] En un chat
[ ] No se anota
[ ] NO SÉ

Nombre del lugar donde se anota:
________________________________

¿Quién revisa esa anotación?
________________________________
```

---

#### 7. Formulario para bodega y recepción

##### BOD-01 — Solicitud, preparación y entrega

```text
BOD-01

Completa:

Veo lo que cada sede pide en:
________________________________

Anoto cuánto pude preparar en:
________________________________

Anoto cuánto salió de bodega en:
________________________________

La sede confirma cuánto recibió en:
________________________________

Si algo no se anota, escribe NO SE ANOTA.
```

##### BOD-02 — Diferencias

```text
BOD-02

En el último mes, ¿qué diferencias viste?

[ ] Se pidió más de lo enviado
[ ] Se envió más de lo pedido
[ ] La sede recibió menos de lo enviado
[ ] Llegó un producto diferente
[ ] Llegó producto dañado
[ ] No hubo diferencias
[ ] NO SÉ

La diferencia más reciente fue:
________________________________

¿Quién la revisó?
________________________________

¿Dónde quedó anotada?
________________________________
```

---

#### 8. Formulario para Contabilidad

##### CON-01 — Información que puede entregar

```text
CON-01

Marca qué información puedes obtener actualmente:

[ ] Ventas por día
[ ] Ventas por producto
[ ] Ventas por sede
[ ] Ventas separadas por Rappi, WhatsApp, Shopify u otra forma
[ ] Pedidos cancelados
[ ] Devoluciones
[ ] Descuentos
[ ] Pagos recibidos
[ ] Compras
[ ] Recepciones
[ ] Inventario final

La información más antigua disponible comienza en:
Mes: __________ Año: __________

La información que NO se puede obtener es:
________________________________
```

##### CON-02 — Archivo o reporte exacto

```text
CON-02

Para cada lugar, archivo o reporte que utilizas, completa una fila:

Nombre exacto: ________________________________
Lo abre: ________________________________
Está en: [ ] computador [ ] correo [ ] nube [ ] papel [ ] otro
Se actualiza: [ ] diario [ ] semanal [ ] mensual [ ] cuando lo solicitan
Contiene información desde: ________________________________
La persona que lo cuida es: ________________________________

Copia este bloque una vez por cada archivo o reporte.
```

##### CON-03 — Correcciones manuales

```text
CON-03

¿Qué información debes corregir o completar manualmente?

Nombre de la información:
________________________________

¿Por qué debes corregirla?
________________________________

¿Quién realiza la corrección?
________________________________

¿Quién la revisa o autoriza?
________________________________

¿Dónde queda guardada la corrección?
________________________________

Si no realizas correcciones manuales, escribe: NINGUNA.
```

---

#### 9. Formulario para Gerencia General

##### GER-01 — Responsables

```text
GER-01

Completa una línea por cada forma de recibir pedidos:

Forma de recibir pedidos: ________________________________
Persona responsable: ________________________________
Sede o negocio: ________________________________
Quién puede aceptar una excepción: ________________________________

Ejemplo:
Forma: Rappi
Responsable: cajero de turno
Sede: Vento Café
Excepción: gerente de sede
```

##### GER-02 — Cuando no alcanza

```text
GER-02

Cuando no alcanza un producto para todos los pedidos:

¿Quién decide cuáles se atienden primero?
________________________________

¿Qué regla utiliza?
[ ] Orden de llegada
[ ] Pedido ya pagado
[ ] Tipo de cliente
[ ] Sede
[ ] Decisión del momento
[ ] Otra: ________________________________
[ ] No hay una regla definida
[ ] NO SÉ

¿Dónde queda anotada esa decisión?
________________________________
```

##### GER-03 — Información que hace falta

```text
GER-03

Completa hasta 5 líneas:

Para decidir cuánto producir necesito saber:
1. ________________________________
2. ________________________________
3. ________________________________
4. ________________________________
5. ________________________________

Actualmente recibo esa información:
1. [ ] Sí [ ] No [ ] A veces
2. [ ] Sí [ ] No [ ] A veces
3. [ ] Sí [ ] No [ ] A veces
4. [ ] Sí [ ] No [ ] A veces
5. [ ] Sí [ ] No [ ] A veces
```

---

#### 10. Qué hacer con una respuesta incompleta

No se devolverá un mensaje diciendo solamente “explica mejor”.

Se enviará la pregunta correspondiente:

| Respuesta recibida      | Mensaje que debe enviarse                                                                                 |
| ----------------------- | --------------------------------------------------------------------------------------------------------- |
| “En el sistema”         | “Escribe el nombre de la aplicación y el nombre que ves en la pantalla.”                                  |
| “Le aviso al encargado” | “Escribe el trabajo o cargo de esa persona y cómo le avisas: de palabra, llamada o mensaje.”              |
| “A veces”               | “Escribe un ejemplo de cuándo sí ocurre y otro de cuándo no.”                                             |
| “Depende”               | “Marca de qué depende: producto, cantidad, hora, sede, persona u otra razón.”                             |
| “No sé”                 | “Escribe quién podría saberlo o dónde podría comprobarse. Si tampoco sabes eso, escribe NO SÉ.”           |
| respuesta sin ejemplo   | “Piensa en la última vez que ocurrió y escribe: qué pasó, cuándo, quién participó y dónde quedó anotado.” |

---

#### 11. Cómo guardar las respuestas

Cada formulario diligenciado deberá conservar:

```text
Código de respuesta:
Trabajo de la persona:
Sede o lugar:
Fecha:
Códigos de preguntas respondidas:
Respuesta original:
Resumen confirmado por la persona:
Foto o audio guardado en:
Pregunta que todavía falta responder:
Persona que podría responderla:
```

El resumen deberá enviarse nuevamente a la persona:

```text
Esto fue lo que entendimos de tus respuestas:

[RESUMEN]

Responde:
[ ] Sí, eso es correcto
[ ] No. La corrección es: ________________________________
```

---

#### 12. Lista de preguntas que queden pendientes

Cada pregunta sin respuesta tendrá su propio bloque:

```text
Número de pregunta pendiente:
Pregunta que se enviará por WhatsApp:
Trabajo de la persona que puede responder:
Sede o lugar:
Opciones que deberá marcar:
Espacio que deberá completar:
Ejemplo incluido:
Foto o audio permitido:
Cómo sabremos que quedó respondida:
Dónde se usará la respuesta:
Estado: PENDIENTE / RESPONDIDA / NO SE PUDO COMPROBAR
```

No se aceptará escribir solamente “preguntar después”.

---

#### 13. Reglas de cuidado

1. No enviar más de cinco preguntas por mensaje.
2. No pedir explicaciones técnicas.
3. No pedir cálculos ni porcentajes.
4. No pedir contraseñas o datos privados.
5. Permitir responder `NO SÉ`.
6. Dar siempre un ejemplo.
7. Permitir texto o audio.
8. Confirmar el resumen con la persona.
9. No usar las respuestas para buscar culpables.

---

#### 14. Resultado esperado

Al aplicar los formularios deberá quedar una lista concreta de:

- productos que las personas pidieron y no encontraron;
- productos que se agotaron;
- productos que se sustituyeron;
- pedidos cancelados o incompletos;
- productos que sobraron;
- información que actualmente no se anota;
- diferencias entre sedes y formas de recibir pedidos;
- preguntas que todavía necesitan respuesta;
- persona adecuada para responder cada pregunta.

---

#### 15. Decisiones propuestas

1. Los formularios podrán copiarse directamente a WhatsApp.
2. Cada pregunta indicará qué marcar y qué completar.
3. Cada pregunta incluirá un ejemplo.
4. Cada persona recibirá únicamente preguntas relacionadas con su trabajo.
5. Los trabajadores no deberán analizar sistemas ni proponer soluciones.
6. Las respuestas podrán enviarse por texto o audio.
7. Las preguntas pendientes conservarán responsable y forma exacta de responderse.
8. La aplicación de los formularios podrá realizarse posteriormente.

---

#### 16. Criterios de aceptación

`OPS-PLAN-003` podrá aprobarse cuando una persona pueda completar su formulario sola, sin preguntar qué debe escribir; cada pregunta tenga opciones, espacios, ejemplo y tratamiento de `NO SÉ`; y las respuestas puedan guardarse y confirmarse sin conocimientos técnicos.

---

#### 17. Resultado y continuidad

Con la aprobación quedarán disponibles autocuestionarios que pueden enviarse directamente por WhatsApp a meseros, cajeros, responsables de pedidos, cocina, producción, bodega, Contabilidad y Gerencia.

La continuidad será:

```text
OPS-PLAN-004
— Iniciar registro prospectivo de solicitud, entrega y diferencia
```

`OPS-PLAN-004` preparará un formato igualmente sencillo para comenzar a anotar la información que no pueda recuperarse de períodos anteriores.

**Sustituye la referencia narrativa:** `OPS-PLAN-001-B`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsable inicial de evidencia:** responsable de pedidos.  
**Salida obligatoria:** fuentes de Rappi y ManyChat, entrevistas, productos faltantes, sobrantes, variaciones recurrentes, estacionalidad conocida y limitaciones de recuperación.

### ✅ OPS-PLAN-004 — Iniciar registro prospectivo de solicitud, entrega y diferencia

**Estado:** APROBADA
**Bloque:** E1 — Descubrimiento de la operación actual
**Dependencias cumplidas:** `OPS-PLAN-001`, `OPS-PLAN-002` y `OPS-PLAN-003`
**Propósito:** dejar listo un formato sencillo para anotar desde ahora lo que se pide, lo que se envía, lo que se recibe y cualquier diferencia
**Aplicación:** WhatsApp, papel o formulario sencillo
**Inicio del registro:** no obligatorio desde esta aprobación; Gerencia u Operaciones definirá cuándo comenzar
**No constituye:** sistema definitivo, inventario oficial, autorización de ajustes ni cálculo automático
**Cambios en código o Supabase:** no autorizados

---

#### 1. Para qué sirve

Este formato permitirá conocer información que no puede reconstruirse de meses anteriores:

```text
LO QUE SE PIDIÓ
→ LO QUE SE CONFIRMÓ
→ LO QUE SE PREPARÓ
→ LO QUE SALIÓ
→ LO QUE LLEGÓ
→ LO QUE FALTÓ, SOBRÓ O CAMBIÓ
→ CÓMO SE RESOLVIÓ
```

Cada persona completará únicamente la parte que le corresponde.

---

#### 2. Reglas sencillas

1. Usar un solo número para relacionar solicitud, envío y recepción.
2. Escribir un producto por bloque.
3. No borrar el dato original cuando haya un error; anotar la corrección.
4. Usar la misma unidad en las cantidades: unidades, kilos, gramos, bolsas, cajas u otra.
5. Si no se conoce un dato, escribir `NO SÉ`.
6. Si algo no corresponde, escribir `NO APLICA`.
7. No incluir precios, datos privados o contraseñas.
8. No ajustar inventarios ni pagos usando únicamente este formato.

---

#### 3. Cómo crear el número de seguimiento

La persona que inicia la solicitud escribirá:

```text
Número:
PED-[FECHA]-[SEDE]-[NÚMERO DEL DÍA]
```

Ejemplo:

```text
PED-2026-08-05-SAUDO-01
```

Si no sabe qué abreviatura usar, podrá escribir el nombre completo:

```text
PED-2026-08-05-VENTO-CAFE-01
```

El mismo número deberá copiarse sin cambios en preparación, envío, recepción y corrección.

---

#### 4. Mensaje inicial para el equipo

```text
Hola. Vamos a comenzar a anotar con mayor claridad lo que cada lugar pide y lo
que finalmente recibe.

Cada persona llenará solamente la parte que le corresponde.

COPIA el bloque, marca las casillas con una X y completa los espacios.

Si no sabes un dato, escribe NO SÉ. No cambies una cantidad para hacerla
coincidir con otra.

Este formato no es una evaluación de tu trabajo.
```

---

#### 5. Formulario de solicitud

Lo completa la persona que necesita el producto.

##### SOL-01 — Datos generales

```text
SOL-01 — NUEVA SOLICITUD

Número:
________________________________

Fecha en que estoy haciendo la solicitud:
Día: ____ Mes: ____ Año: ____

Hora:
____ : ____  [ ] a. m.  [ ] p. m.

Lugar que solicita:
________________________________

Nombre o trabajo de quien solicita:
________________________________

¿Para qué fecha se necesita?
Día: ____ Mes: ____ Año: ____

¿Para qué momento?
[ ] Apertura
[ ] Mañana
[ ] Tarde
[ ] Noche
[ ] Hora exacta: __________
[ ] NO SÉ
```

##### SOL-02 — Producto solicitado

Copiar una vez por cada producto.

```text
SOL-02 — PRODUCTO SOLICITADO

Número de la solicitud:
________________________________

Nombre exacto del producto:
________________________________

Tamaño, presentación o empaque:
________________________________

Cantidad solicitada:
________________________________

Unidad:
[ ] unidades
[ ] kilos
[ ] gramos
[ ] bolsas
[ ] cajas
[ ] bandejas
[ ] otra: ________________________________

¿Por qué se necesita?
[ ] Reponer lo consumido
[ ] Pedido de una persona
[ ] Pedido especial
[ ] Evento
[ ] Se agotó
[ ] Prevención para próximos días
[ ] Otra razón: ________________________________
[ ] NO SÉ

¿Cuánto queda actualmente en el lugar que solicita?
Cantidad: ________________________________
Unidad: ________________________________
[ ] No se contó
[ ] NO SÉ

Ejemplo:
Producto: Croissant de almendras
Presentación: unidad
Cantidad solicitada: 20
Quedan actualmente: 3 unidades
```

##### SOL-03 — Confirmación de envío

```text
SOL-03 — SOLICITUD ENVIADA

Número:
________________________________

¿A quién se envió?
________________________________

¿Cómo se envió?
[ ] WhatsApp
[ ] Papel
[ ] Excel
[ ] Aplicación
[ ] Llamada
[ ] De palabra
[ ] Otro: ________________________________

Fecha y hora del envío:
________________________________

¿Recibiste confirmación?
[ ] Sí
[ ] No
[ ] NO SÉ

Si respondiste SÍ, ¿quién confirmó?
________________________________
```

---

#### 6. Formulario de revisión y preparación

Lo completa quien recibe la solicitud y prepara el envío.

##### PRE-01 — Solicitud recibida

```text
PRE-01 — SOLICITUD RECIBIDA

Número:
________________________________

Fecha y hora en que la recibí:
________________________________

Mi nombre o trabajo:
________________________________

¿La solicitud se entiende?
[ ] Sí
[ ] No
[ ] Falta el producto exacto
[ ] Falta la presentación
[ ] Falta la cantidad
[ ] Falta la fecha de entrega
[ ] Otra información: ________________________________

Si falta información, ¿a quién se la pedí?
________________________________

¿Cómo se la pedí?
[ ] WhatsApp
[ ] Llamada
[ ] De palabra
[ ] Otro: ________________________________
```

##### PRE-02 — Cantidad que se puede preparar

Copiar una vez por producto.

```text
PRE-02 — PRODUCTO REVISADO

Número:
________________________________

Producto:
________________________________

Presentación:
________________________________

Cantidad que pidieron:
________________________________

Cantidad que sí puedo preparar:
________________________________

Usé la misma unidad:
[ ] Sí
[ ] No. La unidad que usé es: ________________________________

Resultado:
[ ] Se puede preparar todo
[ ] Se puede preparar solo una parte
[ ] No se puede preparar
[ ] Debe cambiarse por otro producto
[ ] Quedará para otra fecha
[ ] NO SÉ

Si no se puede completar, marca la razón:
[ ] No hay suficiente producto
[ ] No hay suficiente ingrediente
[ ] No alcanza el tiempo
[ ] Falta personal
[ ] Falló un equipo
[ ] La solicitud llegó tarde
[ ] Otra razón: ________________________________
[ ] NO SÉ

¿A quién informaste?
________________________________

Fecha y hora del aviso:
________________________________
```

##### PRE-03 — Cambio aceptado

Se usa solamente si cambia producto, cantidad o fecha.

```text
PRE-03 — CAMBIO PROPUESTO

Número:
________________________________

El cambio es de:
[ ] Producto
[ ] Presentación
[ ] Cantidad
[ ] Fecha
[ ] Hora

Lo que se pidió originalmente:
________________________________

Lo que se propone entregar:
________________________________

Persona que propuso el cambio:
________________________________

Persona que aceptó o rechazó:
________________________________

Respuesta:
[ ] Aceptado
[ ] Rechazado
[ ] Pendiente
[ ] NO SÉ

Fecha y hora de la respuesta:
________________________________
```

---

#### 7. Formulario de salida

Lo completa quien entrega el producto al conductor, mensajero o responsable del traslado.

##### ENV-01 — Producto que salió

Copiar una vez por producto.

```text
ENV-01 — PRODUCTO ENVIADO

Número:
________________________________

Producto:
________________________________

Presentación:
________________________________

Cantidad preparada:
________________________________

Cantidad que realmente salió:
________________________________

Unidad:
________________________________

Si salió menos de lo preparado, ¿qué pasó?
________________________________

Condición al salir:
[ ] Completo y en buen estado
[ ] Empaque dañado
[ ] Producto incompleto
[ ] Pendiente de revisión
[ ] Otra: ________________________________

Fecha y hora de salida:
________________________________
```

##### ENV-02 — Persona que transporta

```text
ENV-02 — ENTREGA PARA TRANSPORTE

Número:
________________________________

Nombre o trabajo de quien entrega:
________________________________

Nombre o trabajo de quien recibe para transportar:
________________________________

Forma de transporte:
[ ] Vehículo de la empresa
[ ] Moto
[ ] Mensajería externa
[ ] Persona a pie
[ ] Otro: ________________________________

Cantidad de paquetes, cajas, bolsas o canastas:
________________________________

¿La persona que transporta confirmó la cantidad?
[ ] Sí
[ ] No
[ ] NO SÉ

Fecha y hora:
________________________________
```

---

#### 8. Formulario de recepción

Lo completa la persona que recibe en el lugar de destino.

##### REC-01 — Recepción general

```text
REC-01 — PEDIDO RECIBIDO

Número:
________________________________

Lugar que recibe:
________________________________

Nombre o trabajo de quien recibe:
________________________________

Fecha y hora de recepción:
________________________________

Cantidad de paquetes, cajas, bolsas o canastas recibidas:
________________________________

¿La entrega llegó?
[ ] Completa
[ ] Incompleta
[ ] Con algo diferente
[ ] Con producto dañado
[ ] No llegó
[ ] Pendiente de revisar
```

##### REC-02 — Producto recibido

Copiar una vez por producto.

```text
REC-02 — PRODUCTO RECIBIDO

Número:
________________________________

Producto:
________________________________

Presentación:
________________________________

Cantidad que aparece como enviada:
________________________________

Cantidad que conté al recibir:
________________________________

Unidad:
________________________________

Resultado:
[ ] Llegó exactamente lo enviado
[ ] Llegó menos
[ ] Llegó más
[ ] Llegó otro producto
[ ] Llegó dañado
[ ] No llegó

Diferencia encontrada:
________________________________

¿Tomaste foto?
[ ] Sí, está guardada en: ________________________________
[ ] No
[ ] No era necesaria

No enviar fotografías con personas o datos privados.
```

---

#### 9. Formulario para resolver una diferencia

Lo completa la persona encargada de revisar el faltante, sobrante, cambio o daño.

```text
DIF-01 — DIFERENCIA EN REVISIÓN

Número:
________________________________

Producto:
________________________________

La diferencia fue:
[ ] Faltó cantidad
[ ] Sobró cantidad
[ ] Llegó otro producto
[ ] Llegó dañado
[ ] No llegó
[ ] La cantidad se escribió mal
[ ] Otra: ________________________________

Cantidad esperada:
________________________________

Cantidad encontrada:
________________________________

¿Quién informó la diferencia?
________________________________

¿Quién la revisó?
________________________________

¿Qué se comprobó?
[ ] Error al solicitar
[ ] Error al preparar
[ ] Error al contar la salida
[ ] Error durante transporte
[ ] Error al contar la recepción
[ ] Error al escribir
[ ] No se pudo saber
[ ] Otra causa: ________________________________

¿Qué se hizo?
[ ] Se envió lo faltante
[ ] Se devolvió lo sobrante
[ ] Se cambió el producto
[ ] Se aceptó la diferencia
[ ] Se dejó pendiente
[ ] Otra acción: ________________________________

¿Quién aceptó la solución?
________________________________

Fecha y hora de cierre:
________________________________

¿Quedó algo pendiente?
[ ] No
[ ] Sí. Quedó pendiente: ________________________________
```

---

#### 10. Formulario de sobrantes y faltantes sin solicitud

Se usa cuando al terminar un día se descubre que sobró o faltó producto, aunque no exista una solicitud relacionada.

```text
EXI-01 — SOBRANTE O FALTANTE OBSERVADO

Fecha:
________________________________

Sede o lugar:
________________________________

Producto:
________________________________

Presentación:
________________________________

Situación:
[ ] Sobró producto
[ ] Faltó producto
[ ] Se dañó producto
[ ] Se venció producto
[ ] NO SÉ

Cantidad:
________________________________

Unidad:
________________________________

¿Cómo se descubrió?
[ ] Conteo
[ ] Durante una venta
[ ] Durante preparación
[ ] Durante recepción
[ ] Al cerrar
[ ] Otra forma: ________________________________

¿Dónde quedó anotado además de este mensaje?
________________________________

¿Quién debe revisarlo?
________________________________
```

---

#### 11. Resumen diario sencillo

Lo completa únicamente la persona designada para reunir los formularios del día.

```text
RES-01 — RESUMEN DEL DÍA

Fecha:
________________________________

Sede o lugar:
________________________________

Solicitudes realizadas:
________________________________

Solicitudes entregadas completas:
________________________________

Solicitudes entregadas incompletas:
________________________________

Solicitudes no entregadas:
________________________________

Productos con faltante:
1. ________________________________
2. ________________________________
3. ________________________________

Productos con sobrante:
1. ________________________________
2. ________________________________
3. ________________________________

Diferencias que siguen pendientes:
1. Número: ______________ Pendiente: ________________________________
2. Número: ______________ Pendiente: ________________________________
3. Número: ______________ Pendiente: ________________________________

Nombre o trabajo de quien hizo el resumen:
________________________________
```

El resumen no reemplaza los formularios individuales.

---

#### 12. Quién completa cada parte

| Parte               | Persona disponible                                |
| ------------------- | ------------------------------------------------- |
| `SOL-01` a `SOL-03` | quien solicita para la sede o área                |
| `PRE-01` a `PRE-03` | bodega, producción o quien prepara                |
| `ENV-01` y `ENV-02` | quien despacha y entrega para transportar         |
| `REC-01` y `REC-02` | quien recibe y cuenta                             |
| `DIF-01`            | encargado designado por Operaciones               |
| `EXI-01`            | persona que descubre el sobrante, faltante o daño |
| `RES-01`            | responsable diario designado                      |

La persona no deberá completar partes que no observó.

---

#### 13. Qué hacer si una respuesta está incompleta

| Falta                 | Mensaje que debe enviarse                                                                  |
| --------------------- | ------------------------------------------------------------------------------------------ |
| falta número          | “Copia el número que aparece en la solicitud original. Si no existe, responde SIN NÚMERO.” |
| falta presentación    | “Escribe cómo viene el producto: unidad, bolsa, caja, tamaño o peso.”                      |
| falta cantidad        | “Escribe el número y después la unidad. Ejemplo: 12 unidades.”                             |
| no coincide la unidad | “No conviertas la cantidad. Escribe la unidad original y la nueva por separado.”           |
| no sabe quién decidió | “Escribe NO SÉ y el nombre o trabajo de la persona que podría saberlo.”                    |
| falta evidencia       | “Indica dónde podría comprobarse: chat, papel, pantalla, conteo o persona.”                |

---

#### 14. Revisión semanal

Cuando se active el registro, una persona designada revisará semanalmente:

- números repetidos;
- solicitudes sin recepción;
- envíos sin confirmación;
- diferencias sin cerrar;
- productos que faltaron varias veces;
- productos que sobraron varias veces;
- datos que las personas no pudieron completar;
- formularios demasiado difíciles de usar.

La revisión no decidirá todavía cuánto producir. Solo identificará información completa, faltante o repetida.

---

#### 15. Tiempo de prueba antes de usarlo de forma ordinaria

Antes de adoptarlo, deberá probarse con:

- una sede solicitante;
- una persona que prepara;
- una persona que despacha;
- una persona que recibe;
- entre tres y cinco productos;
- entre tres y siete días de operación.

Al terminar la prueba se preguntará:

```text
¿Qué pregunta fue difícil de entender?
________________________________

¿Qué dato no pudiste conseguir?
________________________________

¿Qué parte tomó demasiado tiempo?
________________________________

¿Qué pregunta hizo falta?
________________________________

¿Qué parte se llenó dos veces?
________________________________
```

La prueba no autoriza todavía implementación técnica.

---

#### 16. Información que no debe enviarse

- contraseñas;
- datos bancarios;
- números de tarjeta;
- documentos de identidad;
- direcciones o teléfonos de clientes;
- fotografías de personas sin autorización;
- información médica;
- precios o costos si la persona no está autorizada.

---

#### 17. Qué deberá quedar cuando se aplique

- cantidad solicitada por producto y lugar;
- cantidad que pudo prepararse;
- cantidad que salió;
- cantidad recibida;
- faltantes, sobrantes, cambios y daños;
- motivo conocido de cada diferencia;
- persona que revisó;
- forma de solución;
- asuntos que siguen pendientes;
- productos con diferencias repetidas.

---

#### 18. Decisiones propuestas

1. El registro podrá usarse por WhatsApp, papel o formulario sencillo.
2. Cada persona completará solo la parte que observó.
3. Solicitud, preparación, salida y recepción conservarán cantidades separadas.
4. Las diferencias no se borrarán ni se corregirán para que coincidan.
5. El formato no será fuente oficial ni autorizará ajustes.
6. Su aplicación comenzará únicamente cuando Gerencia u Operaciones defina responsables y período de prueba.
7. La prueba inicial será limitada y podrá simplificar preguntas difíciles.
8. No se realizarán cambios en código o Supabase desde esta tarea.

---

#### 19. Criterios de aceptación

`OPS-PLAN-004` podrá aprobarse cuando cada participante pueda completar su parte sin conocimientos técnicos; las cantidades solicitada, preparada, enviada y recibida permanezcan separadas; exista un formato para diferencias y cierre; y esté definido un período de prueba antes del uso ordinario.

---

#### 20. Resultado y continuidad

Con la aprobación quedará listo el instrumento para comenzar a reunir, cuando se autorice, la información que no existe históricamente.

La continuidad documental regresará a:

```text
CAP-MAP-001
— Crear taxonomía jerárquica de capacidades de Vento Group
```

La recolección futura mediante estos formatos podrá continuar en paralelo, pero no bloqueará la elaboración del mapa de capacidades mientras cada vacío permanezca registrado con responsable y destino.

**Sustituye la referencia narrativa:** `OPS-PLAN-001-C`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsables iniciales de evidencia:** contabilidad y responsable de pedidos.  
**Registro mínimo:** fecha, sede solicitante, canal cuando aplique, producto, presentación, cantidad solicitada, cantidad recibida, faltante, sobrante reportado, ajuste y observación.  
**Límite:** el registro prospectivo no se convierte por sí solo en fuente de verdad ni autoriza automatización.
