### MINI-BLOQUE — DOMINIO DOCUMENTAL PRIVACIDAD Y CUMPLIMIENTO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **dominio documental privacidad y cumplimiento** dentro de **AA GOBIERNO DE INFORMACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INFO-DOM-001` a `INFO-DOM-013` — 13 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios” y concluye con “Definir auditoría, investigación de accesos o cambios indebidos, preservación y cierre”.
<!-- PLAN-SECTION-META:END -->

### ✅ INFO-DOM-001 — Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios

**Estado:** APROBADA
**Tarea anterior:** `TI-INT-003 — Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos` — APROBADA
**Tarea siguiente:** `INFO-DOM-002 — Definir clasificación, sensibilidad, minimización y manejo por categoría de información` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del gobierno corporativo de información y del inventario inicial de activos de información por proceso, propiedad funcional, custodia, roles de responsable y encargado, finalidad empresarial y dimensiones territoriales
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, buckets, políticas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, documentos, permisos, contratos, proveedores ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Cerrar la primera capa de gobierno de información de VENTO sin crear una fuente de verdad paralela a las aplicaciones y procesos propietarios.

La tarea adopta como unidad empresarial primaria el contexto `VPROC-*` ya aprobado y establece, para cada contexto, qué información o artefactos representa, qué aplicación conserva la propiedad funcional y cuál es la finalidad empresarial canónica que justifica su tratamiento.

También separa de forma expresa propiedad funcional, custodia, responsabilidad jurídica, encargo, infraestructura y territorio, de modo que una tabla, un bucket, una sede, un proveedor o una región técnica nunca adquieran autoridad empresarial por su sola existencia.

---

#### 2. Resultado sustantivo

El resultado material queda compuesto por cuatro capas reconciliadas:

1. **Gobierno corporativo de información:** reglas únicas para propiedad, custodia, responsable, encargado, finalidad y territorio.
2. **Inventario empresarial:** 69 contextos `VPROC-0001` a `VPROC-0069`, con 332 entradas documentales o artefactos heredados y una propietaria funcional resuelta por contexto.
3. **Huella técnica observada:** 23 esquemas no temporales del proyecto Supabase vigente y 14 buckets de Storage, sin inferir propiedad empresarial desde sus nombres.
4. **Brechas de gobierno explícitas:** custodios nominales, responsables jurídicos, encargados, territorios completos, copias locales y terceros quedan identificados cuando la evidencia actual no permite una asignación verificable.

| Control                                        | Resultado |
| ---------------------------------------------- | --------: |
| Contextos `VPROC-*` esperados                  |    **69** |
| Contextos materializados                       |    **69** |
| Entradas documentales/artefactos heredadas     |   **332** |
| Aplicaciones propietarias funcionales          |     **9** |
| Contextos sin propietaria funcional            |     **0** |
| Contextos con propietaria funcional múltiple   |     **0** |
| Contextos AURA con aplicación diferida         |     **2** |
| Esquemas no temporales observados en Supabase  |    **23** |
| Tablas observadas en esos esquemas             |   **432** |
| Vistas observadas en esos esquemas             |   **208** |
| Buckets de Storage observados                  |    **14** |
| Buckets con bandera técnica pública            |     **8** |
| Buckets con bandera técnica privada            |     **6** |
| Objetos de Storage contados sin leer contenido |  **1101** |
| Cambios físicos                                |     **0** |
| Requisitos de prueba nuevos o modificados      |     **0** |

---

#### 3. Fuentes y decisiones heredadas que no se redefinen

Se conservan sin alteración:

- los 69 propósitos empresariales de `PROC-CAT-004`;
- la propiedad de proceso y la propiedad funcional documental materializada por EVID-ARC para los 69 contextos;
- las 332 entradas documentales o artefactos contextualizados de EVID-ARC;
- la escala vigente `S0_PUBLIC`, `S1_INTERNAL`, `S2_CONFIDENTIAL`, `S3_RESTRICTED`, `S4_HIGHLY_RESTRICTED`; esta tarea no reclasifica ninguna entrada;
- la separación entre aplicación propietaria, SHELL como autoridad de identidad y acceso, Supabase/Storage como persistencia técnica y VISO como superficie administrativa de cumplimiento;
- la regla de que `VPROC-0060` gobierna el ciclo documental transversal sin apropiarse de los hechos empresariales originados en otros procesos;
- el carácter diferido de AURA en `VPROC-0056` y `VPROC-0057`;
- las reglas vigentes de privacidad, evidencia, integración, autorización y auditoría ya protegidas por 04A.

---

#### 4. Modelo corporativo de gobierno de información

La relación mínima queda definida así:

```text
ACTIVO DE INFORMACIÓN
→ se vincula con un VPROC-* y una finalidad empresarial
→ conserva una propietaria funcional
→ puede tener una o varias representaciones físicas o digitales
→ cada representación tiene custodia
→ si contiene datos personales, debe resolverse el responsable del tratamiento
→ si un tercero trata datos por cuenta del responsable, debe resolverse el encargado
→ cada uso y representación conserva las dimensiones territoriales que realmente apliquen
```

Ninguna de estas dimensiones sustituye a otra:

```text
PROPIETARIA FUNCIONAL
≠ PROPIETARIO HUMANO O FUNCIÓN EMPRESARIAL
≠ CUSTODIO
≠ RESPONSABLE DEL TRATAMIENTO
≠ ENCARGADO DEL TRATAMIENTO
≠ PROVEEDOR
≠ AUTOR O EMISOR
≠ SUJETO DE INFORMACIÓN
≠ REPOSITORIO
≠ BASE DE DATOS
≠ BUCKET
≠ TERRITORIO
```

---

#### 5. Propiedad funcional

La **propietaria funcional** es la aplicación empresarial que conserva el significado, validez, corrección, vigencia y cierre del registro o artefacto dentro del proceso que lo origina.

Reglas:

1. la propietaria funcional sigue al `VPROC-*`, no al lugar físico o técnico donde se persiste una representación;
2. una copia, exportación, archivo, snapshot, índice, caché o evidencia no adquiere propiedad sobre su fuente;
3. Supabase, Storage, `vento-shell` o un proveedor no se convierten en propietarias empresariales por alojar datos;
4. un expediente compuesto puede referenciar registros de otros procesos sin absorber su autoridad;
5. AURA conserva la propiedad objetivo de sus dos contextos diferidos sin presentarse como capacidad implementada.

Distribución heredada y preservada:

| Aplicación | Contextos |
| ---------- | --------: |
| `anima`    |     **1** |
| `viso`     |    **20** |
| `nexo`     |    **16** |
| `fogo`     |     **6** |
| `origo`    |     **4** |
| `pulso`    |    **12** |
| `numera`   |     **7** |
| `aura`     |     **2** |
| `pass`     |     **1** |
| **Total**  |    **69** |

---

#### 6. Custodia

La **custodia** identifica quién o qué función controla materialmente una representación y responde por su conservación, localización, disponibilidad e integridad dentro de las instrucciones y autoridad aplicables.

La custodia:

- no decide por sí sola la finalidad;
- no convierte al custodio en propietaria funcional;
- no concede permiso de consulta, modificación, exportación, impresión, compartición o disposición;
- puede ser distinta para el registro empresarial, el archivo digital, el original físico, una copia controlada y una representación de contingencia;
- debe ser resoluble hasta una función organizacional o técnica responsable antes de operación gobernada.

Estado actual:

- **custodia funcional por proceso:** `ESPECIFICADO` mediante la propietaria funcional y el proceso canónico;
- **custodia nominal humana por representación:** `PENDIENTE_DE_EVIDENCIA`; las fuentes actuales no permiten asignar personas concretas sin inventarlas;
- **custodia de originales físicos:** existe evidencia de originales en `Oficina 1`, pero el custodio habitual continúa `PENDIENTE_DE_EVIDENCIA`;
- **custodia técnica digital:** existen persistencias y buckets observables, pero un namespace o bucket no se interpreta como custodio empresarial hasta reconciliarlo con recurso, proceso y función responsable.

---

#### 7. Responsable y encargado

Cuando exista tratamiento de datos personales se aplican dos roles separados:

- **Responsable del tratamiento:** entidad jurídica que determina la finalidad y los medios del tratamiento dentro de la autoridad aplicable.
- **Encargado del tratamiento:** tercero o prestador que trata información por cuenta del responsable y dentro de instrucciones documentadas, sin adquirir una finalidad propia por defecto.

Reglas:

1. proveedor técnico no equivale automáticamente a encargado;
2. aplicación propietaria no equivale automáticamente a responsable jurídico;
3. una sede, marca o área no se convierte en entidad responsable por aparecer en un registro;
4. la relación responsable–encargado exige evidencia de entidad, alcance, finalidad y vínculo aplicable;
5. cuando una información no sea personal, estos roles no se fuerzan artificialmente; siguen aplicando propietario funcional, custodia y autoridad del recurso;
6. la determinación detallada de bases, consentimientos y finalidades jurídicas permanece bajo `INFO-DOM-008`;
7. la determinación detallada de terceros, encargados, destinatarios y transferencias permanece bajo `INFO-DOM-010`.

Estado actual: no existe en las fuentes consumidas una matriz completa y verificable que asigne entidad responsable y encargado a los 69 contextos. Por tanto, esa asignación permanece `PENDIENTE_DE_EVIDENCIA` cuando aplique, sin convertir la ausencia de evidencia en `NO_APLICA`.

---

#### 8. Finalidades

INFO-DOM-001 adopta como **finalidad empresarial primaria** de cada activo de información el propósito empresarial canónico del `VPROC-*` que le da contexto.

Esto no equivale todavía a fundamento jurídico, consentimiento, aviso de privacidad ni autorización de uso secundario.

Reglas:

1. toda información debe poder explicar qué `VPROC-*` y qué resultado empresarial justifica su existencia o uso;
2. una finalidad secundaria no se deduce por conveniencia, disponibilidad técnica o similitud de datos;
3. analítica, marketing, IA, soporte, auditoría o exportación no se convierten en finalidad automática por poder acceder técnicamente a un dato;
4. reutilizar información para otra finalidad exige la autoridad y las decisiones propietarias que correspondan;
5. la finalidad empresarial de esta tarea es una restricción de uso; la finalidad jurídica y su fundamento se completan en `INFO-DOM-008`.

---

#### 9. Territorios

El territorio se modela como una dimensión múltiple, no como un campo único.

| Dimensión                                | Qué representa                                                          | Estado actual                                                                                             |
| ---------------------------------------- | ----------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| territorio jurídico/empresarial          | entidad legal y ámbito en el que opera o responde el proceso            | marco colombiano documentado como línea base; entidad exacta por tratamiento `PENDIENTE_DE_EVIDENCIA`     |
| territorio del sujeto                    | ubicación o relación territorial relevante de la persona cuando aplique | `PENDIENTE_DE_EVIDENCIA` salvo contexto individual demostrado                                             |
| ubicación de custodia física             | lugar donde existe un original o soporte físico                         | `Oficina 1` está evidenciada para originales; detalle completo y custodio habitual pendientes             |
| región de procesamiento técnico          | región o infraestructura que procesa o persiste datos                   | proyecto Supabase vigente observado en `us-east-2`; esto no define por sí solo propiedad ni transferencia |
| territorio de encargado/proveedor        | ubicación o ámbito del tercero que trata información                    | `PENDIENTE_DE_EVIDENCIA` hasta contratos e integración verificables                                       |
| territorio de destinatario o divulgación | destino de una compartición o comunicación                              | `PENDIENTE_DE_EVIDENCIA` hasta el gobierno de terceros y transferencias                                   |

Reglas:

- un alcance de sede no demuestra país de procesamiento;
- una región cloud no demuestra entidad responsable;
- la ubicación del usuario no modifica por sí sola la propietaria funcional;
- territorio no concede autorización;
- cualquier transferencia o divulgación a tercero se gobierna después bajo `INFO-DOM-010` y `INFO-INT-003` sin reescribir este inventario.

---

#### 10. Inventario empresarial materializado — 69 de 69

Cada fila conserva literalmente el contexto documental heredado y el propósito empresarial aprobado. La decisión de gobierno por fila es explícita: la propietaria funcional queda resuelta; custodia nominal, responsable/encargado y territorio completo se completan únicamente con evidencia, sin inferencia.

| Proceso      | Contexto de información / artefactos                                                                                     | Propietaria funcional | Finalidad empresarial primaria                                                                                                                                                                | Estado de propiedad               | Gobierno adicional                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------------------------------ | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` | Registro de decisión; acta y compromisos.                                                                                | `viso`                | Asegurar que las decisiones empresariales relevantes se adopten con contexto suficiente, autoridad definida y seguimiento hasta su cumplimiento, sustitución o cierre.                        | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0002` | Catálogo de estructura; expediente o soporte del cambio estructural.                                                     | `viso`                | Mantener una representación confiable de la estructura jurídica y operativa de Vento Group para que responsabilidades, relaciones y alcances territoriales se interpreten de forma coherente. | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0003` | Política o delegación versionada.                                                                                        | `viso`                | Asegurar que políticas, delegaciones y límites de decisión permanezcan vigentes, sean comprensibles y puedan aplicarse de forma consistente.                                                  | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0004` | Paquete de handoff y compromiso.                                                                                         | `viso`                | Coordinar compromisos y transferencias de trabajo entre unidades para que cada resultado conserve responsable, plazo y continuidad hasta su cierre.                                           | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0005` | Requisición/vacante; expediente de candidato; evaluación; oferta; handoff.                                               | `viso`                | Cubrir necesidades de personal con personas idóneas y decisiones de selección trazables, sin confundir candidaturas con vínculos laborales activos.                                           | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0006` | Caso de incorporación; expediente; checklist; solicitudes de acceso/equipo.                                              | `viso`                | Lograr que cada persona vinculada ingrese con documentación, contexto, preparación y habilitaciones suficientes para desempeñar su trabajo de forma segura y controlada.                      | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0007` | Asignación; horario/programación; publicación e historial.                                                               | `viso`                | Asegurar que la organización disponga de asignaciones laborales y horarios publicados, coherentes y revisables que permitan planear y ejecutar el trabajo.                                    | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0008` | Hechos de asistencia y decisión de corrección.                                                                           | `anima`               | Conservar evidencia confiable de la asistencia realmente ocurrida y permitir correcciones sin borrar ni reescribir los hechos originales.                                                     | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0009` | Caso laboral y soportes.                                                                                                 | `viso`                | Resolver ausencias, permisos, cambios y reemplazos sin dejar turnos, responsabilidades o contextos operativos inconsistentes.                                                                 | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0010` | Paquete de liquidación; detalle; instrucción de pago; conciliación.                                                      | `numera`              | Producir un paquete laboral autorizado, completo y conciliable que permita liquidar pagos y beneficios mediante la autoridad correspondiente.                                                 | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0011` | Expediente de retiro; checklist; documentos finales; certificado de cierre.                                              | `viso`                | Cerrar cada relación laboral de forma integral, verificando obligaciones, devoluciones, accesos, documentación y riesgos residuales.                                                          | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0012` | Registro de riesgo; inspección; control; plan de acción; riesgo residual.                                                | `viso`                | Reducir riesgos de seguridad, salud e inocuidad mediante identificación, evaluación, control, inspección y seguimiento verificable de acciones preventivas y correctivas.                     | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0013` | Expediente de incidente; investigación; acciones.                                                                        | `viso`                | Proteger a las personas y a la operación mediante respuesta oportuna a incidentes, accidentes y emergencias, preservando investigación, decisiones y aprendizaje.                             | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0014` | Procedimiento; plan de control; ejecución; checklist y mediciones.                                                       | `viso`                | Mantener condiciones verificables de higiene, inocuidad y cumplimiento durante la operación mediante controles repetibles y evidencia suficiente.                                             | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0015` | Maestro de producto; presentaciones; unidades; equivalencias.                                                            | `nexo`                | Conservar un catálogo de productos, presentaciones, unidades y equivalencias coherente para que todas las operaciones interpreten el mismo objeto comercial y logístico.                      | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0016` | Receta/versiones; resultados de prueba; aprobación; snapshot publicado.                                                  | `fogo`                | Convertir una formulación en una receta aprobada, reproducible y versionada que pueda utilizarse sin perder trazabilidad de cambios y validaciones.                                           | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0017` | Versión de oferta y publicación de catálogo.                                                                             | `pulso`               | Asegurar que la oferta publicada en cada canal corresponda con definiciones vigentes y disponibilidad realmente comprometible.                                                                | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0018` | Especificación; alérgenos; restricciones; criterios de calidad.                                                          | `nexo`                | Preservar requisitos de calidad, composición, alérgenos y restricciones de cada producto para prevenir producción, comercialización o consumo no conformes.                                   | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0019` | Solicitud de compra; consolidación; decisión.                                                                            | `origo`               | Convertir necesidades de abastecimiento en requerimientos priorizados, justificables y trazables antes de comprometer una compra.                                                             | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0020` | Expediente de cotizaciones; comparación; evaluación; recomendación; decisión.                                            | `origo`               | Permitir una decisión de abastecimiento informada comparando proveedores, condiciones, riesgos y evidencia relevante.                                                                         | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0021` | Orden de compra aprobada; compromiso; comunicación al proveedor.                                                         | `origo`               | Autorizar y formalizar compras con el nivel de control adecuado, diferenciando operación ordinaria, urgencia y excepción.                                                                     | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0022` | Recepción de compra; diferencias; documentos asociados.                                                                  | `origo`               | Confirmar que lo recibido física, documental y económicamente corresponde con lo solicitado y resolver diferencias antes de aceptar la obligación.                                            | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0023` | Catálogo de ubicaciones; etiqueta/identificación.                                                                        | `nexo`                | Mantener una estructura confiable de ubicaciones y condiciones de almacenamiento para saber dónde puede custodiarse cada objeto y bajo qué restricciones.                                     | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0024` | Movimiento; proyección de stock; escaneos/evidencia.                                                                     | `nexo`                | Asegurar que cada ingreso o cambio de ubicación modifique la custodia y disponibilidad de inventario de forma correlacionada y trazable.                                                      | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0025` | Movimiento de retiro/consumo/traslado; custodia/recibo.                                                                  | `nexo`                | Permitir el retiro, consumo o traslado de existencias sin perder la relación entre cantidad, unidad, conversión, origen, destino y responsable.                                               | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0026` | Observación de conteo; sesión; diferencia; investigación; decisión de ajuste.                                            | `nexo`                | Establecer la existencia real mediante conteos independientes y convertir las diferencias en decisiones de ajuste justificadas, no en sobrescrituras automáticas.                             | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0027` | Condición/cuarentena/vencimiento/merma; decisión de disposición.                                                         | `nexo`                | Proteger la aptitud y el valor del inventario gestionando vencimientos, condiciones, cuarentenas, pérdidas, mermas, frío y disposición final.                                                 | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0028` | Solicitud de abastecimiento; cantidad aprobada; preparación; despacho; tránsito; recepción; conciliación.                | `nexo`                | Satisfacer necesidades internas de abastecimiento conservando cantidades y responsabilidades conciliables desde la solicitud hasta la recepción.                                              | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0029` | Registro de activo; identidad; ubicación; custodia; préstamo/transferencia; historial.                                   | `nexo`                | Conservar identidad, ubicación, condición y custodia de los activos durante su uso, préstamo y transferencia.                                                                                 | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0030` | Orden de mantenimiento; diagnóstico; reparaciones/repuestos; prueba; liberación; garantía/disposición.                   | `nexo`                | Restablecer o decidir el destino de un activo mediante mantenimiento, reparación, garantía, repuestos y baja controlados.                                                                     | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0031` | Registro de vehículo; disponibilidad; asignación; kilometraje; combustible; documentos; incidencias.                     | `nexo`                | Mantener vehículos disponibles y seguros para la operación mediante control de condición, uso, combustible, kilometraje e incidencias.                                                        | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0032` | Catálogo de reutilizables/contenedores; custodia; entregas; retornos; pérdida/daño.                                      | `nexo`                | Asegurar la disponibilidad y retorno de reutilizables y contenedores, atribuyendo tenencia, faltantes, daños y completitud.                                                                   | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0033` | Plan de producción versionado; órdenes planificadas; capacidad; faltantes; aprobación.                                   | `fogo`                | Transformar demanda y necesidades operativas en un plan de producción factible, priorizado y oportuno.                                                                                        | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0034` | Orden de producción; lote; receta; materiales; etapas; cantidades; rendimiento; desviaciones.                            | `fogo`                | Producir de manera reproducible utilizando materiales, cantidades y versiones aprobadas, conservando trazabilidad de la ejecución.                                                            | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0035` | Inspección de calidad; resultados; no conformidad; disposición.                                                          | `fogo`                | Evitar liberar producto no conforme mediante una decisión independiente y verificable sobre aceptación, retención, corrección o rechazo.                                                      | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0036` | Registro de empaque; etiquetas/códigos; LPN; handoff a almacenamiento.                                                   | `fogo`                | Preservar identidad, condición y trazabilidad del producto terminado durante empaque, etiquetado y almacenamiento.                                                                            | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0037` | Reproceso; genealogía; rendimiento; merma; cierre.                                                                       | `fogo`                | Cerrar la ejecución productiva explicando rendimiento, merma, aprovechamiento y reproceso sin ocultar desviaciones.                                                                           | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0038` | Servicio de mesa; pedido/versiones; preparación; entrega; pago; cierre de cuenta.                                        | `pulso`               | Completar el servicio en mesa desde la atención inicial hasta la entrega y liquidación, manteniendo coherencia entre pedido, preparación, consumo, pago y mesa.                               | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0039` | Pedido mostrador/para llevar; promesa; preparación; handoff; pago; cierre.                                               | `pulso`               | Completar una venta de mostrador o para llevar asegurando que pedido, preparación, entrega y cobro correspondan al mismo compromiso.                                                          | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0040` | Payload externo preservado; pedido normalizado; mapping; pedido interno; discrepancia.                                   | `pulso`               | Incorporar pedidos originados en terceros al flujo interno sin duplicar solicitudes ni perder estados, condiciones, cobros o conciliación.                                                    | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0041` | Oportunidad B2B; cotización; decisión de capacidad; pedido; expediente producción-factura-entrega.                       | `pulso`               | Cumplir compromisos de catering o venta entre empresas validando viabilidad, condiciones comerciales, producción, entrega y facturación.                                                      | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0042` | Caso de cambio; antes/después; decisión; efectos.                                                                        | `pulso`               | Corregir o terminar compromisos comerciales de manera controlada, distinguiendo modificaciones, sustituciones, cancelaciones, anulaciones y devoluciones según sus efectos.                   | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0043` | Intentos de pago; autorización/captura; asignación a venta; soporte fiscal; reverso/reembolso; conciliación.             | `pulso`               | Confirmar y respaldar el pago de una obligación comercial, conservando correspondencia entre venta, medio, valor, resultado y soporte fiscal.                                                 | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0044` | Sesión de caja; esperado vs. observado; diferencias; aprobaciones; entrega; depósito.                                    | `pulso`               | Demostrar el resultado real de una jornada de caja conciliando ventas, pagos, efectivo, diferencias y responsabilidades.                                                                      | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0045` | Perfil de cliente; consentimientos; cuenta/ledger de fidelización; beneficios/redenciones.                               | `pass`                | Reconocer al cliente y administrar beneficios de fidelización con saldos, movimientos y consentimientos verificables.                                                                         | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0046` | Caso de reclamo; clasificación; investigación; resolución; compensación; devolución/reembolso; causa/acciones.           | `pulso`               | Restituir al cliente y corregir la causa de una inconformidad mediante tratamiento trazable de reclamos, devoluciones y compensaciones.                                                       | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0047` | Reserva/evento; capacidad; comunicaciones; consentimiento; depósitos; asistencia/no-show/cancelación.                    | `pulso`               | Comprometer capacidad para reservas y eventos de forma realista y mantener comunicaciones oportunas y consentidas con el cliente.                                                             | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0048` | Plan de ruta; paradas; vehículo/conductor; carga; manifiesto; restricciones; publicación.                                | `nexo`                | Preparar un despacho ejecutable asignando ruta, vehículo, carga, secuencia y restricciones antes de iniciar el transporte.                                                                    | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0049` | Viaje; paradas; POD; rechazo/incidente; custodia; retornos; kilometraje; cierre.                                         | `nexo`                | Completar una entrega con evidencia suficiente del resultado y tratamiento controlado de rechazos, novedades y retornos.                                                                      | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0050` | Caso de entrega de tercero; asignación; tracking; POD; incidentes; retorno; liquidación/conciliación.                    | `pulso`               | Obtener y conciliar el resultado de una entrega realizada por terceros sin perder control interno sobre compromiso, seguimiento y evidencia.                                                  | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0051` | Hecho económico; clasificación contable; asiento; soporte.                                                               | `numera`              | Representar hechos económicos a partir de eventos y soportes verificables para evitar registros aislados o sin origen operacional.                                                            | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0052` | Obligación; aprobación; instrucción de pago; resultado bancario; conciliación.                                           | `numera`              | Cumplir obligaciones con proveedores mediante aprobación, pago y conciliación que demuestren qué se debía, qué se pagó y qué permanece pendiente.                                             | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0053` | Cuenta por cobrar; acciones de cobro; pago/aplicación; disputa/diferencia.                                               | `numera`              | Recuperar y aplicar valores por cobrar manteniendo claridad sobre obligación, recaudo, saldo y diferencias.                                                                                   | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0054` | Modelo de costos; distribución; cierre de costos; resultados; rentabilidad; variación.                                   | `numera`              | Producir información confiable sobre costos, asignaciones, cierres y rentabilidad para apoyar decisiones sin confundir estimaciones con hechos realizados.                                    | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0055` | Plan de instalaciones; orden de trabajo; ejecución; desviación; liberación.                                              | `nexo`                | Mantener instalaciones aptas, seguras y operativas mediante limpieza, inspección, mantenimiento, control de plagas, servicios y cierre de novedades.                                          | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0056` | Brief; contenido/promoción versionada; revisión; aprobación; publicación; retiro; archivo.                               | `aura`                | Publicar contenido y promociones autorizados, vigentes y retirables de forma coordinada en los canales correspondientes.                                                                      | `ASIGNADA_EN_APLICACION_DIFERIDA` | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0057` | Consulta/lead; consentimiento; calificación; asignación; conversación; oportunidad; handoff.                             | `aura`                | Convertir interacciones digitales con intención comercial en oportunidades o casos trazables hasta su atención, descarte o conversión.                                                        | `ASIGNADA_EN_APLICACION_DIFERIDA` | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0058` | Ticket tecnológico; clasificación/SLA; diagnóstico; workaround; conocimiento; cierre.                                    | `viso`                | Restablecer servicios tecnológicos y reducir recurrencia mediante gestión de solicitudes, incidentes, diagnóstico, resolución y conocimiento.                                                 | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0059` | Solicitud de acceso; aprobaciones; entitlement; resultado de provisión; revocación; attestación.                         | `viso`                | Conceder, modificar y revocar acceso tecnológico conforme a una necesidad autorizada, verificando que no permanezcan privilegios residuales.                                                  | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0060` | Registro documental; versión; metadatos; clasificación; firmas; retención/hold; custodia; certificado de disposición.    | `viso`                | Conservar documentos y evidencia confiables durante su ciclo de vida, con contexto, custodia, acceso y disposición controlados.                                                               | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0061` | Medición; snapshot de fuente; análisis; insight; decisión/plan de mejora; medición posterior.                            | `numera`              | Convertir mediciones y hallazgos en decisiones de mejora verificables y comprobar si produjeron el resultado esperado.                                                                        | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0062` | Caso de continuidad; impacto/severidad; plan; modo degradado; recuperación; conciliación; postmortem.                    | `viso`                | Mantener la operación esencial frente a interrupciones y recuperar el servicio con reconciliación, evidencia y aprendizaje posterior.                                                         | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0063` | Registro de riesgo; valoración; controles; tratamiento; aceptación/seguimiento.                                          | `viso`                | Mantener visibles y tratados los riesgos empresariales relevantes para apoyar decisiones y evitar exposición residual aceptada sin seguimiento.                                               | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0064` | Expediente de asesor/autoridad; requerimiento; comunicaciones; entregable; vencimientos; decisión interna.               | `viso`                | Cumplir requerimientos y compromisos con asesores y autoridades conservando responsabilidad interna, vencimientos, evidencia y trazabilidad.                                                  | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0065` | Ciclo de desempeño; objetivos; feedback; plan de desarrollo; revisión; decisión; constancia del trabajador.              | `viso`                | Orientar el desempeño y desarrollo de las personas mediante objetivos y retroalimentación con propósito legítimo, privacidad y decisiones controladas.                                        | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0066` | Requisito de EPP; asignación; entrega/aceptación; formación; vigencia; reemplazo; devolución.                            | `viso`                | Proteger a las personas mediante entrega, vigencia, cambio, devolución y evidencia de los elementos de protección requeridos.                                                                 | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0067` | Definición/versionado de kit; instancia; manifiesto de componentes; completitud; custodia; préstamo/retorno/sustitución. | `nexo`                | Asegurar que kits y conjuntos se definan, armen, entreguen, utilicen y devuelvan con completitud conocida y componentes trazables.                                                            | `ASIGNADA`                        | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0068` | Instrumento de medición; muestra; invitación; respuesta; resultados; sesgo.                                              | `pulso`               | Conocer la experiencia del cliente mediante mediciones interpretables y separadas de incentivos, reclamos y compensaciones.                                                                   | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |
| `VPROC-0069` | Presupuesto/versiones; supuestos; líneas; aprobación; vigencia; consumo; forecast; variación; supersesión.               | `numera`              | Planear y controlar el uso de recursos financieros mediante presupuestos versionados, aprobados y comparables con consumo y proyección, sin tratarlos como hechos contables.                  | `ASIGNADA_CON_FRONTERA`           | `PENDIENTE_DE_EVIDENCIA` para custodia nominal y, cuando apliquen, responsable/encargado y territorio completo |

Reconciliación:

```text
69 contextos esperados
69 contextos materializados
0 faltantes
0 duplicados
9 propietarias funcionales
17 ASIGNADA
50 ASIGNADA_CON_FRONTERA
2 ASIGNADA_EN_APLICACION_DIFERIDA
```

---

#### 11. Inventario de familias de activos de información

| Familia observada o exigida                                                               | Evidencia actual                                                      | Estado                                                          | Decisión de gobierno                                                                        |
| ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| registros y expedientes de proceso                                                        | 69 contextos `VPROC-*` y 332 entradas documentales/artefactos EVID    | `ESPECIFICADO`                                                  | conservar proceso y propietaria funcional como ancla de autoridad                           |
| bases de datos y datasets                                                                 | proyecto Supabase vigente con esquemas y objetos técnicos observables | `IMPLEMENTADO` parcialmente / gobierno `PENDIENTE_DE_EVIDENCIA` | inventariar contenedores sin inferir propiedad desde schema o nombre                        |
| documentos empresariales y laborales                                                      | EVID, ANIMA, VISO y tablas/documentos actuales                        | `IMPLEMENTADO` parcialmente                                     | conservar contexto `VPROC-*`; clasificación y ciclo siguen en tareas propietarias           |
| contratos, facturas y soportes                                                            | aparecen en compras, finanzas, mantenimiento y expedientes            | `IMPLEMENTADO` parcialmente                                     | distinguir documento de hecho económico, obligación, proveedor y expediente                 |
| originales físicos                                                                        | evidencia de originales en `Oficina 1`                                | `PENDIENTE_DE_EVIDENCIA` para custodia completa                 | conservar ubicación conocida y no inventar custodio nominal                                 |
| fotos, video, audio y otros medios                                                        | buckets de imágenes/medios y artefactos de proceso                    | `IMPLEMENTADO` parcialmente                                     | conservar contexto y clasificación heredada; no inferir finalidad adicional                 |
| datos de trabajadores, candidatos, clientes y proveedores                                 | procesos y estructuras específicas existentes                         | `IMPLEMENTADO` parcialmente                                     | resolver finalidad, responsable y derechos según tareas INFO propietarias                   |
| información financiera, médica, geográfica, seguridad y otras categorías de mayor impacto | procesos y persistencias especializadas existentes                    | `IMPLEMENTADO` parcialmente                                     | no degradar sensibilidad; INFO-DOM-002 gobierna manejo por categoría                        |
| logs, auditoría, exportaciones, copias locales y hojas de cálculo                         | existen fuentes parciales y soporte AS-IS                             | `PENDIENTE_DE_EVIDENCIA` como inventario corporativo completo   | registrar origen, propietaria, finalidad, copia y condición de retiro cuando se materialice |
| canales, terceros y destinatarios                                                         | proveedores y canales existen de forma distribuida                    | `PENDIENTE_DE_EVIDENCIA` como inventario completo               | INFO-DOM-010 e INFO-INT-003 cierran relación, territorio y transferencia                    |

---

#### 12. Huella técnica actual de base de datos

La siguiente tabla registra exclusivamente namespaces observados en modo de solo lectura. No asigna propiedad empresarial desde el nombre del esquema.

| Schema                | Tablas | Vistas | Vistas materializadas | Decisión                                                     |
| --------------------- | -----: | -----: | --------------------: | ------------------------------------------------------------ |
| `app_private`         |      1 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `auth`                |     23 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `club`                |     11 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `cron`                |      2 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `extensions`          |      0 |      2 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `graphql`             |      0 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `graphql_public`      |      0 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `information_schema`  |      4 |     65 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `net`                 |      2 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `pass`                |     26 |      1 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `payments`            |      2 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `pg_catalog`          |     64 |     78 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `pg_toast`            |      0 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `pgbouncer`           |      0 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `pos`                 |     13 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `public`              |    185 |     61 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `realtime`            |     10 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `storage`             |      8 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `supabase_migrations` |      1 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `talento`             |     13 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `vault`               |      1 |      1 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `viso`                |     12 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |
| `vital`               |     54 |      0 |                     0 | inventariado técnicamente; autoridad empresarial no inferida |

Totales observados:

```text
23 schemas no temporales
432 tablas
208 vistas
0 vistas materializadas
```

Estos conteos son una fotografía técnica de la consulta actual, no un inventario lógico completo de activos de información ni evidencia de que cada objeto esté en uso.

---

#### 13. Huella técnica actual de Storage

La bandera `public` se registra como configuración técnica observada. No equivale a clasificación `S0_PUBLIC`, autorización empresarial ni decisión de privacidad.

| Bucket                   | Exposición técnica observada | Objetos contados | Estado de propiedad/custodia                                                    |
| ------------------------ | ---------------------------- | ---------------: | ------------------------------------------------------------------------------- |
| `commercial-menu-images` | `public`                     |               51 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `documents`              | `public`                     |              164 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `employee-photos`        | `public`                     |               26 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `nexo-ai-documents`      | `private`                    |                1 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `nexo-catalog-images`    | `public`                     |              790 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `pass-satellite-logos`   | `public`                     |               11 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `product-images`         | `public`                     |               45 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `public-documents`       | `public`                     |                9 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `recipe-media`           | `private`                    |                0 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `recipe-step-photos`     | `public`                     |                4 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `talento-cv`             | `private`                    |                0 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `talento-documents`      | `private`                    |                0 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `talento-medical`        | `private`                    |                0 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |
| `website-media`          | `private`                    |                0 | `PENDIENTE_DE_EVIDENCIA` para mapping completo a activo, propietaria y custodio |

Reconciliación:

```text
14 buckets
8 con bandera public
6 con bandera private
1101 objetos contados
contenido de objetos no leído
```

La existencia de buckets con nombre que sugiera documentos, fotografías o datos de talento exige reconciliación de clasificación y autorización, pero el nombre y la bandera técnica no permiten por sí solos concluir que exista exposición indebida.

---

#### 14. Persistencias y evidencias localizadas por nombre técnico

La inspección de catálogo identificó, entre otras, estructuras relacionadas con documentos, consentimiento y auditoría:

- `auth.audit_log_entries`;
- `auth.oauth_consents`;
- `club.audit_events`;
- `public.asset_documents`;
- `public.document_types`;
- `public.documents`;
- `public.internal_pos_document_lines`;
- `public.internal_pos_document_sequences`;
- `public.internal_pos_documents`;
- `public.required_document_rules`;
- `talento.candidate_documents`;
- `vital.consent_records`;

Esta lista proviene de una búsqueda técnica dirigida por nombres y **no** se usa como prueba de ausencia de otros mecanismos, tablas, archivos o proveedores.

---

#### 15. Regla de acceso y uso

Tener una propietaria, un custodio o una ubicación conocida no concede acceso.

Toda consulta, búsqueda, exportación, impresión, compartición, administración o divulgación deberá seguir resolviendo, según aplique, identidad, actor efectivo, finalidad, clasificación, recurso, relación, territorio, estado, destinatario y acción exacta conforme al modelo general de autorización.

La tarea no crea permisos nuevos ni transforma un rol de gobierno en capacidad técnica.

---

#### 16. Frontera con clasificación y minimización

`INFO-DOM-002` conserva exclusivamente la definición de clasificación, sensibilidad, minimización y manejo por categoría.

Por tanto INFO-DOM-001:

- no cambia ninguna de las 332 clasificaciones EVID existentes;
- no reduce `S1` a `S4` por tratarse de un sistema interno;
- no declara público un contenido porque su bucket tenga bandera `public`;
- no define campos mínimos por categoría de datos;
- no define reglas de masking o minimización por vista.

Los hallazgos de exposición técnica observada se entregan a INFO-DOM-002 como evidencia de contexto, no como clasificación resuelta.

---

#### 17. Fronteras con las tareas posteriores de INFO-DOM

| Tarea          | Decisión reservada                                                                                    |
| -------------- | ----------------------------------------------------------------------------------------------------- |
| `INFO-DOM-002` | clasificación, sensibilidad, minimización y manejo por categoría                                      |
| `INFO-DOM-003` | taxonomía global de documentos, registros, evidencia, series, expedientes, originales y copias        |
| `INFO-DOM-004` | ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro                       |
| `INFO-DOM-005` | metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales                |
| `INFO-DOM-006` | retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y disposición          |
| `INFO-DOM-007` | autenticidad, integridad, procedencia, timestamp, preservación y cadena de custodia                   |
| `INFO-DOM-008` | avisos, finalidad jurídica, autorizaciones, fundamentos, consentimiento, revocación y datos sensibles |
| `INFO-DOM-009` | consultas, reclamos y solicitudes de titulares                                                        |
| `INFO-DOM-010` | compartición, terceros, encargados, destinatarios, transferencias y requerimientos de autoridad       |
| `INFO-DOM-011` | aprobación, aceptación y firmas                                                                       |
| `INFO-DOM-012` | obligaciones, controles, evidencias, responsables, frecuencias y brechas de cumplimiento              |
| `INFO-DOM-013` | auditoría, investigación, preservación y cierre                                                       |

INFO-DOM-001 define el campo de gobierno y el estado actual; no adelanta el contenido normativo de esas tareas.

---

#### 18. Pendientes documentados y condiciones de salida

| Pendiente                                                         | Estado                   | Propietario / destino                                                       | Condición de salida                                                                                       |
| ----------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| custodio habitual de originales en `Oficina 1`                    | `PENDIENTE_DE_EVIDENCIA` | autoridad organizacional + `INFO-DOM-005` para localización                 | función o persona vigente registrada junto con ubicación y alcance de custodia                            |
| asignación nominal de custodios digitales por representación      | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005` + `INFO-INT-002`                                             | cada representación digital enlazada con recurso, ubicación técnica y función custodio verificable        |
| entidad responsable por tratamiento personal                      | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-008`                                                              | entidad legal, finalidad aplicable y fundamento documentados para cada tratamiento que corresponda        |
| encargados, destinatarios y terceros                              | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-010` + `INFO-INT-003`                                             | tercero, rol, alcance, propósito permitido, contrato y territorio reconciliados                           |
| territorio completo por activo y copia                            | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005` + `INFO-DOM-010`                                             | ubicación física/técnica, entidad y territorio de terceros registrados sin inferencia                     |
| inventario de copias locales, hojas de cálculo y exportaciones    | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005` + `INFO-INT-002`                                             | copia identificada por fuente, propietaria, finalidad, custodio, ubicación y condición de vigencia/retiro |
| evaluación de buckets técnicamente públicos frente a sensibilidad | `FUERA_DE_ALCANCE`       | `INFO-DOM-002` + `INFO-AUTH-002`                                            | clasificación efectiva y autorización de acceso reconciliadas por contenido y recurso                     |
| materialización física del inventario corporativo                 | `FUERA_DE_ALCANCE`       | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobada | modelo físico versionado, migraciones desde `vento-shell`, consumidores adaptados y pruebas aplicables    |

Ninguno de estos pendientes autoriza a cambiar datos o infraestructura en la fase documental actual.

---

#### 19. Invariantes de gobierno

1. un archivo no sustituye al registro empresarial que respalda;
2. una copia no adquiere autoridad sobre la fuente;
3. un bucket no es un propietario funcional;
4. una tabla no es una finalidad;
5. un proveedor no es automáticamente un encargado;
6. un custodio no decide automáticamente el uso permitido;
7. un responsable del tratamiento no se infiere desde el nombre de una marca, sede o aplicación;
8. un territorio de infraestructura no equivale al territorio empresarial ni al del sujeto;
9. una bandera técnica `public` no equivale a clasificación pública;
10. una finalidad empresarial no equivale por sí sola a fundamento jurídico;
11. clasificación no concede acceso;
12. retención no se define por conveniencia técnica;
13. eliminación de cuenta no significa eliminación universal de historia o evidencia;
14. VISO administra cumplimiento sin absorber los hechos fuente de otras aplicaciones;
15. SHELL conserva autorización sin convertirse en propietaria de la información;
16. Supabase y Storage conservan persistencia técnica sin adquirir autoridad empresarial;
17. AURA conserva sus dos contextos diferidos sin presentarse como implementada;
18. la ausencia de evidencia se conserva como incertidumbre y no como `NO_APLICA`;
19. ninguna decisión de esta tarea ejecuta un cambio físico.

---

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** CAP-SCOPE-016 ya creó la cobertura transversal que protege gobierno de información, finalidad, territorio, ciclo documental, privacidad, persistencia y reconciliación. Esta tarea consume y materializa documentalmente los campos de gobierno e inventario cubiertos por `TREQ-SHELL-011`, `TREQ-SUPABASE-013`, `TREQ-ANIMA-005`, `TREQ-VISO-003`, `TREQ-PASS-012` y `TREQ-INTEGRATION-021`. No introduce una nueva transición ejecutable, permiso, regla de cálculo, contrato físico, esquema, operación de tratamiento ni comportamiento independiente de los requisitos existentes.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 21. Criterios de aceptación documental

- [x] la continuidad recibida es `TI-INT-003 → INFO-DOM-001 → INFO-DOM-002`;
- [x] la tarea permanece exclusivamente documental;
- [x] se define una sola frontera de gobierno de información para VENTO;
- [x] se distinguen propietaria funcional, custodio, responsable, encargado, proveedor, autor, sujeto, infraestructura y territorio;
- [x] los 69 `VPROC-*` aparecen exactamente una vez;
- [x] los 69 propósitos empresariales se conservan desde `PROC-CAT-004`;
- [x] las 69 propietarias funcionales conservan la distribución aprobada 1/20/16/6/4/12/7/2/1;
- [x] se conservan 17 contextos `ASIGNADA`, 50 `ASIGNADA_CON_FRONTERA` y 2 `ASIGNADA_EN_APLICACION_DIFERIDA`;
- [x] se preservan las 332 entradas documentales/artefactos heredadas sin reclasificarlas;
- [x] se registran 23 schemas no temporales observados sin inferir propiedad por nombre;
- [x] se registran 14 buckets y 1101 objetos por conteo sin leer contenido;
- [x] la bandera técnica pública no se presenta como clasificación pública;
- [x] `Oficina 1` se conserva como ubicación física conocida sin inventar custodio nominal;
- [x] el proyecto Supabase vigente se registra en `us-east-2` sin convertir región técnica en decisión jurídica;
- [x] responsables, encargados y territorios no demostrados quedan con estado, propietario y condición de salida;
- [x] INFO-DOM-002 permanece reservada y no es desarrollada;
- [x] no se crea código, SQL, migración, política, dato ni cambio Supabase;
- [x] se crean cero requisitos de prueba y se modifican cero existentes.

---

#### 22. Estado de materialización

| Elemento                                            | Estado                                                                                    |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| modelo corporativo de gobierno de información       | `ESPECIFICADO`                                                                            |
| inventario empresarial de 69 contextos              | `ESPECIFICADO`                                                                            |
| propiedad funcional 69/69                           | `ESPECIFICADO`                                                                            |
| finalidad empresarial 69/69                         | `ESPECIFICADO`                                                                            |
| huella de schemas Supabase                          | `IMPLEMENTADO` como estado técnico observado; autoridad empresarial por reconciliar       |
| huella de buckets Storage                           | `IMPLEMENTADO` como estado técnico observado; propiedad/custodia completa por reconciliar |
| custodia nominal de originales físicos              | `PENDIENTE_DE_EVIDENCIA`                                                                  |
| custodios digitales por representación              | `PENDIENTE_DE_EVIDENCIA`                                                                  |
| responsables del tratamiento por contexto aplicable | `PENDIENTE_DE_EVIDENCIA`                                                                  |
| encargados y destinatarios por contexto aplicable   | `PENDIENTE_DE_EVIDENCIA`                                                                  |
| territorio completo por activo/copia/tercero        | `PENDIENTE_DE_EVIDENCIA`                                                                  |
| clasificación corporativa detallada                 | `FUERA_DE_ALCANCE` — `INFO-DOM-002`                                                       |
| cambios físicos                                     | `NO_APLICA` en esta tarea                                                                 |
| cambios en requisitos de prueba                     | `NO_APLICA` — cero cambios                                                                |

---

#### 23. Continuidad

ÚLTIMA TAREA APROBADA
`TI-INT-003 — Definir integraciones con MDM, soporte remoto, ISP, fabricantes, licenciamiento y proveedores tecnológicos`

TAREA ACTUAL APROBADA
`INFO-DOM-001 — Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios`

SIGUIENTE TAREA RESERVADA
`INFO-DOM-002 — Definir clasificación, sensibilidad, minimización y manejo por categoría de información`


### [ ] INFO-DOM-002 — Definir clasificación, sensibilidad, minimización y manejo por categoría de información
### [ ] INFO-DOM-003 — Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias
### [ ] INFO-DOM-004 — Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro
### [ ] INFO-DOM-005 — Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales
### [ ] INFO-DOM-006 — Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición
### [ ] INFO-DOM-007 — Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia
### [ ] INFO-DOM-008 — Definir avisos, finalidades, autorizaciones, fundamentos, consentimiento, revocación y datos sensibles
### [ ] INFO-DOM-009 — Definir consultas, reclamos y solicitudes de acceso, rectificación, prueba, revocación y supresión
### [ ] INFO-DOM-010 — Definir compartición, exportación, divulgación, terceros, encargados, transferencias y requerimientos de autoridad
### [ ] INFO-DOM-011 — Definir aprobación, aceptación, firma electrónica, firma digital y niveles de evidencia
### [ ] INFO-DOM-012 — Crear registro de obligaciones, controles, evidencias, responsables, frecuencias y brechas de cumplimiento
### [ ] INFO-DOM-013 — Definir auditoría, investigación de accesos o cambios indebidos, preservación y cierre
