### TAREAS E1 DERIVADAS DE OPS-AUD-001

Estas tareas materializan brechas AS-IS detectadas por `OPS-AUD-001`.
No diseñan todavía procesos TO-BE, pantallas, estructuras definitivas de datos
ni implementaciones físicas.

La ejecución formal de este conjunto ocurre después de `OPS-AUD-015` y antes
de `CAP-MAP-001`. La recolección de evidencia de `OPS-PLAN-002`,
`OPS-PLAN-003` y `OPS-PLAN-004` puede comenzar antes, sin alterar la tarea
actual ni permitir aprobaciones fuera de secuencia.

### 🟡 OPS-ADM-001 — Documentar brecha registral y plan de regularización de la sede administrativa

**Estado:** PROPUESTA PARA APROBACIÓN  
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


**Dependencias:** `OPS-AUD-015`.  
**Propósito:** reconciliar la ubicación administrativa real, la dirección registral vigente, la identificación de Oficina 1 y la relación física con Vento Café.  
**Salida obligatoria:** evidencia, estado actual, responsables, documentos afectados, decisiones requeridas y tarea de ejecución externa cuando corresponda.  
**Límite:** esta tarea no modifica registros legales ni reemplaza asesoría contable o jurídica.

### [ ] OPS-GOV-001 — Documentar gobernanza AS-IS del ecosistema de marcas y titulares

**Dependencias:** `OPS-AUD-015`.  
**Propósito:** documentar la relación operativa, administrativa, económica y de recursos entre Vento Group, Vento Café, Saudo, Molka, Vaila Vainilla y catering.  
**Salida obligatoria:** fronteras actuales, servicios compartidos, uso de personal y activos, facturación observada, costos compartidos, riesgos y decisiones pendientes.  
**Límite:** el modelo financiero y contable objetivo se diseña posteriormente en NUMERA y las integraciones correspondientes.

### [ ] OPS-ACT-001 — Inventariar activos y puntos externos de custodia

**Dependencias:** `OPS-AUD-015`.  
**Propósito:** completar el inventario AS-IS de decoraciones, vehículo, materiales residuales, mobiliario, elementos pendientes de instalar y demás activos ubicados fuera de sedes formales.  
**Salida obligatoria:** activo o familia, propietario, custodio, ubicación, condición, uso, riesgo, evidencia y destino documental.  
**Continuidad:** alimenta `NEXO-DOM-008`, `NEXO-DOM-010`, `NEXO-DOM-011`, `NEXO-DOM-017` y `NEXO-DOM-027`.

### [ ] OPS-PLAN-001 — Definir el programa de auditoría de demanda y requisitos de planificación productiva

**Dependencias:** `OPS-AUD-015`.  
**Propósito:** establecer preguntas, periodos, granularidad, fuentes, responsables, calidad mínima, criterios de conciliación y límites de la auditoría de demanda.  
**Salida obligatoria:** protocolo de análisis AS-IS para ventas, pedidos, remisiones, faltantes, sobrantes, mermas, inventarios finales, productos previsibles y productos bajo pedido.  
**Límite:** no aprueba todavía el algoritmo, los mínimos, la producción base ni el proceso TO-BE.

### [ ] OPS-PLAN-002 — Consolidar fuentes internas para la auditoría de demanda

**Sustituye la referencia narrativa:** `OPS-PLAN-001-A`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsable inicial de evidencia:** contabilidad.  
**Salida obligatoria:** inventario de fuentes de Makos, inventarios, compras, recepciones, remisiones, periodos disponibles, periodos faltantes, formato, acceso, propietario y calidad conocida.

### [ ] OPS-PLAN-003 — Levantar demanda, faltantes y variaciones por canal

**Sustituye la referencia narrativa:** `OPS-PLAN-001-B`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsable inicial de evidencia:** responsable de pedidos.  
**Salida obligatoria:** fuentes de Rappi y ManyChat, entrevistas, productos faltantes, sobrantes, variaciones recurrentes, estacionalidad conocida y limitaciones de recuperación.

### [ ] OPS-PLAN-004 — Iniciar registro prospectivo de solicitud, entrega y diferencia

**Sustituye la referencia narrativa:** `OPS-PLAN-001-C`.  
**Dependencias:** `OPS-PLAN-001`.  
**Responsables iniciales de evidencia:** contabilidad y responsable de pedidos.  
**Registro mínimo:** fecha, sede solicitante, canal cuando aplique, producto, presentación, cantidad solicitada, cantidad recibida, faltante, sobrante reportado, ajuste y observación.  
**Límite:** el registro prospectivo no se convierte por sí solo en fuente de verdad ni autoriza automatización.
