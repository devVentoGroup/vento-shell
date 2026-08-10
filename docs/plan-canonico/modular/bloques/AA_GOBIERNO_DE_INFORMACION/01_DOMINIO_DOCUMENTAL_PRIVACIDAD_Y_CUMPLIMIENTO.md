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


### ✅ INFO-DOM-002 — Definir clasificación, sensibilidad, minimización y manejo por categoría de información

**Estado:** APROBADA
**Tarea anterior:** `INFO-DOM-001 — Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios`
**Tarea siguiente:** `INFO-DOM-003 — Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias`
**Tipo de tarea:** documental; materialización transversal de clasificación, sensibilidad, minimización y manejo por categoría de información
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md`
**Universo heredado:** 69 procesos canónicos y 332 entradas documentales/artefactos contextualizadas
**Cambios físicos autorizados:** ninguno; no modifica código, tablas, RLS, Storage, buckets, objetos, migraciones, configuración, datos ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** convertir la escala de sensibilidad y las reglas de privacidad ya aprobadas en una decisión corporativa consumible: preservar el piso S0–S4 de cada una de las 332 entradas `DOCCTX-*`, asignar categoría de información, fijar minimización y manejo resolubles, materializar el perfil individual de los 69 procesos y reconciliar la exposición técnica observada en Storage sin confundir infraestructura con clasificación empresarial.

---

#### 1. Propósito y resultado sustantivo

La tarea materializa una política corporativa de clasificación y manejo que responde, para cada contexto de información, cuatro preguntas obligatorias:

1. qué categoría empresarial describe el contenido;
2. cuál es su clase mínima de sensibilidad y qué puede elevarla;
3. cuál es la proyección mínima admisible para una finalidad concreta;
4. qué manejo debe aplicarse antes de exponer, almacenar localmente, registrar, exportar o entregar a un tercero.

La decisión se construye sobre las identidades `VPROC-*` y `DOCCTX-*` ya aprobadas. No crea una clasificación paralela por aplicación, tabla, carpeta, bucket, archivo o nombre técnico.

Resultado material:

- 69 perfiles individuales de privacidad por proceso;
- 332 decisiones individuales de clasificación contextual;
- 12 categorías mínimas de información con reglas de minimización y manejo;
- una escala corporativa única S0–S4 con equivalentes humanos;
- cinco reglas dominantes de propagación/elevación preservadas;
- una reconciliación read-only de 14 buckets actuales de Storage;
- reglas de reclasificación, derivados, offline, observabilidad, exportación, terceros y ambientes no productivos.

---

#### 2. Fuentes y decisiones heredadas

- `INFO-DOM-001`: inventario empresarial, propietaria funcional y finalidad primaria de los 69 procesos; la propiedad funcional no se deriva de infraestructura.
- `CAP-SCOPE-016`: clasificación versionada, finalidad, privacidad, compartición y gobierno transversal de información.
- `NFR-REQ-005`: escala S0–S4, categorías mínimas, granularidad, propagación, minimización, manejo, offline, logs, exportación, terceros y perfil de privacidad por proceso.
- `EVID-ARC-003`: 332 claves `DOCCTX-*`, clase mínima y regla dominante por entrada documental contextualizada.
- Registro canónico de requisitos: cobertura de privacidad, clasificación y minimización ya identificada para futuras pruebas e implementación.
- Estado remoto de Storage: únicamente metadata de buckets y conteos de objetos; no se inspecciona contenido personal ni se infiere clasificación por nombre o exposición técnica.

Invariantes heredados que esta tarea no modifica:

- 69 procesos `VPROC-0001` a `VPROC-0069`;
- 332 entradas `DOCCTX-*`;
- 9 propietarias funcionales;
- distribución de clases S0–S4 de `EVID-ARC-003`;
- separación entre autorización, clasificación, retención, disposición y disponibilidad offline;
- AURA permanece como aplicación propietaria objetivo diferida donde ya fue aprobada.

---

#### 3. Escala corporativa de sensibilidad

| Clase                  | Etiqueta humana        | Decisión corporativa                                                                                                                                                           |
| ---------------------- | ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `S0_PUBLIC`            | PÚBLICA                | Únicamente contenido cuya divulgación abierta corresponda a una versión expresamente publicada y aprobada. La fuente, borradores, historial y metadatos no heredan publicidad. |
| `S1_INTERNAL`          | INTERNA                | Información de operación ordinaria que no se divulga externamente por defecto.                                                                                                 |
| `S2_CONFIDENTIAL`      | CONFIDENCIAL           | Información limitada por función, sede, relación, finalidad o conocimiento empresarial propietario.                                                                            |
| `S3_RESTRICTED`        | RESTRINGIDA            | Información cuya exposición, alteración o correlación puede causar daño alto laboral, financiero, disciplinario, investigativo, de ubicación, seguridad o equivalente.         |
| `S4_HIGHLY_RESTRICTED` | ESPECIALMENTE SENSIBLE | Salud, secretos, credenciales, PIN, tokens, investigaciones especialmente sensibles o contenido cuyo compromiso requiere contención inmediata.                                 |

Reglas obligatorias:

1. la clase declarada es un piso mínimo; el contenido real, la combinación o el contexto pueden elevarla;
2. una clase ausente, desconocida o no resoluble activa la política más restrictiva; nunca una política pública;
3. la clasificación se resuelve al nivel útil de campo, atributo, documento, evento, metadato, expediente, agregado, archivo o derivado;
4. una aplicación, tabla, bucket o archivo no impone una sola clase sobre todos sus contenidos;
5. clasificación no concede lectura, edición, obtención de archivo, exportación, impresión, compartición, firma, retención, eliminación ni uso offline;
6. cualquier descenso de clase exige reclasificación explícita, versionada y trazable.

---

#### 4. Reglas dominantes de propagación y elevación

| Regla heredada           | Aplicación obligatoria                                                                                                            |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| `BASE`                   | Aplicar el piso declarado, con elevación y propagación generales.                                                                 |
| `HERENCIA_CONTENIDO`     | Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           |
| `PUBLICACION_CONTROLADA` | Solo la proyección publicada aprobada puede ser pública; borradores, fuentes, historial y metadatos conservan su clase propia.    |
| `INFERENCIA`             | Evaluar inferencia, reidentificación, grupos pequeños y drill-down; elevar o suprimir cuando la combinación incremente el riesgo. |
| `S4_DIRECTA`             | Mantener S4 como piso directo; no existe degradación implícita.                                                                   |

Copias, joins, cachés, exportaciones, impresiones, screenshots, thumbnails, eventos, documentos, evidencias, snapshots y demás derivados conservan la clase más restrictiva de sus fuentes y pueden elevarse por inferencia o daño adicional.

---

#### 5. Categorías mínimas y manejo por categoría

Las categorías siguientes describen la naturaleza empresarial de la información. No sustituyen la clase por entrada: cuando una fila concreta tenga un piso más alto, prevalece la clase concreta.

| Categoría de información                                           | Piso o regla de clase                                                                                    | Minimización obligatoria                                                                                                                                                 | Manejo obligatorio                                                                                                              |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| Contenido público aprobado                                         | S0_PUBLIC solo para versión publicada aprobada                                                           | Separar versión pública de borradores, fuente, historial y metadatos; no incluir campos internos en la proyección pública.                                               | Canal abierto solo para la proyección aprobada; revocación/retiro no vuelve públicos los derivados.                             |
| Operación interna ordinaria                                        | S1_INTERNAL como piso típico, sujeto a elevación                                                         | Conservar únicamente campos operativos, periodo y población necesarios.                                                                                                  | Uso interno autorizado; sin divulgación externa por defecto; copias y derivados heredan/elevan.                                 |
| Clientes, contactos y consentimientos                              | S2_CONFIDENTIAL o superior                                                                               | Separar identidad, contacto, consentimiento, notas internas, movimientos y compensaciones; proyectar solo lo requerido por finalidad.                                    | Acceso por relación/finalidad; masking cuando el valor completo no sea necesario; terceros y comunicaciones con alcance mínimo. |
| Proveedores, contratos y condiciones                               | S2_CONFIDENTIAL o superior                                                                               | Separar datos de contacto, condiciones, documentos, cuentas y evaluación; excluir campos no requeridos por la interacción.                                               | Canales controlados; compartir solo con receptor/finalidad aprobados; contratos y documentos pueden elevar por contenido.       |
| Trabajadores, turnos, asistencia y expediente laboral              | S3_RESTRICTED o superior                                                                                 | Proyección por relación laboral y finalidad; evitar exposición transversal de expediente, decisiones, ubicación o historial.                                             | Need-to-know; masking por defecto; offline solo excepcional para S3; retiro de acceso no autoriza borrado de historia.          |
| Nómina, pagos, cuentas y decisiones financieras                    | S3_RESTRICTED o superior                                                                                 | Limitar importes, cuentas, soportes, población y detalle al actor y decisión requeridos; no incluir credenciales de pago.                                                | Segregación reforzada; enmascaramiento; exportación controlada; no tratar secretos de pago como datos ordinarios.               |
| SST, salud, investigaciones y declaraciones                        | S4_HIGHLY_RESTRICTED para expedientes/casos sensibles; artefactos operativos conservan su piso explícito | Caso, identidad, participación y finalidad estrictos; no propagar detalle médico o investigativo a eventos operativos generales.                                         | Online por defecto para S4; acceso segregado; no listados amplios; logs y notificaciones sin contenido sensible.                |
| Credenciales, secretos, tokens, PIN y llaves                       | S4_HIGHLY_RESTRICTED                                                                                     | No copiar a datos de negocio; no exponer valores completos en UI, URL, logs, analytics, evidencia o mensajes.                                                            | Custodia especializada; alcance mínimo; rotación/revocación; nunca divulgación o exportación ordinaria.                         |
| Recetas, fórmulas, costos, rendimientos y conocimiento propietario | S2_CONFIDENTIAL o superior                                                                               | Separar información publicable de formulación, costo, rendimiento y conocimiento interno; proyectar por versión y necesidad productiva.                                  | Acceso por rol/área/versión; no inferir publicidad por presencia en catálogo; exportación y terceros controlados.               |
| Vulnerabilidades, incidentes y configuración sensible              | S3_RESTRICTED o superior                                                                                 | Separar síntoma/contexto operativo de diagnóstico, IP, topología, debilidad, acceso o configuración sensible.                                                            | Drill-down restringido; soporte no es bypass; screenshots, dumps y grabaciones heredan la clase del contenido.                  |
| Telemetría identificable, logs y auditoría                         | S2_CONFIDENTIAL o superior                                                                               | Registrar identificadores/categorías/resultados suficientes; omitir secretos y payloads sensibles completos; reducir granularidad identificable cuando no sea necesaria. | Allowlist/redacción; acceso administrativo trazable; agregados evalúan inferencia y reidentificación.                           |
| Documentos, evidencia, firmas y soportes                           | Clase del contenido o superior                                                                           | Conservar solo metadatos y contenido necesarios para propósito/evidencia; previews, nombres, firmas y adjuntos pueden elevar sensibilidad.                               | Herencia de contenido; acceso temporal/controlado; una ruta, URL o bandera técnica no concede divulgación.                      |

---

#### 6. Contrato mínimo del sobre de manejo

Toda proyección sensible deberá poder resolver, antes de su uso o exposición:

- clasificación efectiva;
- propietario de información;
- custodio;
- finalidad;
- actor y contexto permitidos;
- campos permitidos;
- regla de enmascaramiento;
- canales permitidos;
- política de almacenamiento local;
- política offline;
- política de exportación;
- política de terceros;
- política de logging;
- referencia de retención;
- referencia de disposición;
- ruta de incidente;
- versión de clasificación;

Si el sobre no puede resolverse, la acción no usa un fallback amplio: bloquea la exposición o aplica la política más restrictiva hasta resolver el dato faltante.

---

#### 7. Minimización por clase

| Clase                  | Regla de minimización                                                                                                                                                       | Regla de manejo                                                                                                                                                  |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `S0_PUBLIC`            | Solo la proyección publicada y aprobada; excluir borradores, fuentes, historial y metadatos no públicos.                                                                    | Canal abierto únicamente para la versión publicada aprobada; la publicación no extiende S0 a material relacionado.                                               |
| `S1_INTERNAL`          | Proyección operativa mínima; limitar campos, precisión, periodo y población a la tarea interna necesaria.                                                                   | Canales internos autorizados; no divulgar externamente por defecto; exportación y terceros requieren autorización separada.                                      |
| `S2_CONFIDENTIAL`      | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. | Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.                                |
| `S3_RESTRICTED`        | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos.                       | Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable.        |
| `S4_HIGHLY_RESTRICTED` | Mínimo indispensable por identidad, participación, caso y finalidad; evitar proyecciones generales, cruces amplios y cualquier dato accesorio.                              | Online por defecto; segregación máxima; sin persistencia local, exportación o terceros rutinarios; logs sin contenido sensible y acceso administrativo trazable. |

La minimización se aplica también a precisión, intervalo temporal, población, granularidad geográfica, adjuntos, metadatos, identificadores correlacionables, campos de depuración y volumen. Obtener un modelo completo y ocultar campos únicamente en interfaz no satisface este contrato.

---

#### 8. Reglas de interfaz, búsqueda y notificación

- listas y búsquedas muestran solo el mínimo necesario para reconocer el recurso autorizado;
- un resultado no autorizado no revela existencia, título, nombre, fragmento, conteo ni metadato sensible;
- el detalle completo exige una acción y autorización más específicas que la vista de resumen cuando la clase lo requiera;
- el enmascaramiento no deja el valor completo oculto en HTML, atributos accesibles, autocomplete, URL, error o payload de cliente;
- notificaciones, previews y accesibilidad obedecen el mismo límite de exposición;
- la posibilidad de navegar a una URL o conocer un identificador no concede acceso al contenido.

---

#### 9. Reglas de offline y dispositivo compartido

- `S4_HIGHLY_RESTRICTED` permanece online por defecto;
- `S3_RESTRICTED` solo puede persistir localmente mediante excepción explícita con cifrado, aislamiento, expiración y borrado verificable;
- toda copia offline conserva finalidad, clase y versión de política;
- cambio de actor, área, turno, bloqueo o expiración debe invalidar proyecciones y aislar caché, portapapeles, temporales, thumbnails y notificaciones;
- esta tarea no concede capacidad offline a ningún proceso: la disponibilidad offline continúa gobernada por su contrato no funcional específico.

---

#### 10. Reglas de logs, observabilidad y soporte

- logs, trazas, métricas, alertas y errores usan allowlists y redacción;
- secretos, tokens, PIN, credenciales, documentos y payloads sensibles completos quedan excluidos;
- soporte y observabilidad no constituyen bypass de autorización;
- screenshots, dumps y grabaciones heredan la clase de su contenido;
- el drill-down administrativo conserva finalidad, actor, alcance y auditoría;
- cuando identificadores, hashes, categorías y resultados basten para diagnosticar, no se registra contenido completo.

---

#### 11. Reglas de exportación, impresión y terceros

- consultar no concede exportar ni imprimir;
- toda exportación o impresión declara finalidad, actor, columnas, población, volumen, clase, destino, vigencia y evidencia;
- los grupos pequeños o combinaciones reidentificables pueden requerir supresión, agregación o elevación de clase;
- un tercero recibe solo campos mínimos para finalidad, receptor y ambiente autorizados;
- reutilización, subdestinos, expiración, retorno y revocación deben resolverse antes de la transferencia cuando apliquen;
- una URL firmada o un canal técnicamente disponible no equivale a autorización empresarial para compartir.

---

#### 12. Reglas de ambientes no productivos y secretos

- producción no se copia íntegramente a desarrollo, CI, demos o pruebas;
- se prefieren datos sintéticos; cuando no basten, la transformación o muestra conserva finalidad, minimización, acceso, duración y disposición referenciada;
- contraseñas, tokens, API keys, llaves privadas, PIN y códigos de recuperación no forman parte de datos de negocio ordinarios;
- secretos no viajan por URLs, logs, analytics, evidencias, mensajes ni exportaciones;
- una copia de datos real en ambiente no productivo no puede recibir una clase inferior por el solo cambio de ambiente.

---

#### 13. Datos derivados, agregados y reclasificación

- un derivado puede ser más sensible que cada fuente aislada cuando permita perfilado, reidentificación, inferencia o drill-down;
- masking, tokenización, seudonimización, anonimización y agregación permanecen conceptos distintos; retirar identificadores directos no demuestra anonimización;
- una predicción o inferencia no se presenta como hecho fuente;
- una reclasificación conserva clase anterior y nueva, motivo, alcance, autorizador, fecha, versión de política, copias, derivados, consumidores, migración y evidencia;
- publicar una versión no hace públicos borradores, comentarios, historial, fuentes o metadatos asociados.

---

#### 14. Perfil individual de privacidad por proceso — 69 de 69

Cada fila recibe una decisión explícita. El rango indica los pisos reales de las entradas `DOCCTX-*` del proceso, no una clase única que reemplace la granularidad documental.

| Proceso      | Propietaria | Categoría(s)                                                                                                            | Finalidad empresarial primaria                                                                                                                                                                | Pisos presentes                   | Minimización y manejo                                                                                                                                                                                                                                                                                           | Offline                                                                                                               | Exportación / terceros                                                                                               | Estado         | Bloqueo                                                          |
| ------------ | ----------- | ----------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | -------------- | ---------------------------------------------------------------- |
| `VPROC-0001` | `viso`      | Operación interna ordinaria                                                                                             | Asegurar que las decisiones empresariales relevantes se adopten con contexto suficiente, autoridad definida y seguimiento hasta su cumplimiento, sustitución o cierre.                        | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0002` | `viso`      | Operación interna ordinaria                                                                                             | Mantener una representación confiable de la estructura jurídica y operativa de Vento Group para que responsabilidades, relaciones y alcances territoriales se interpreten de forma coherente. | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0003` | `viso`      | Operación interna ordinaria                                                                                             | Asegurar que políticas, delegaciones y límites de decisión permanezcan vigentes, sean comprensibles y puedan aplicarse de forma consistente.                                                  | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0004` | `viso`      | Operación interna ordinaria                                                                                             | Coordinar compromisos y transferencias de trabajo entre unidades para que cada resultado conserve responsable, plazo y continuidad hasta su cierre.                                           | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0005` | `viso`      | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Cubrir necesidades de personal con personas idóneas y decisiones de selección trazables, sin confundir candidaturas con vínculos laborales activos.                                           | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0006` | `viso`      | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Lograr que cada persona vinculada ingrese con documentación, contexto, preparación y habilitaciones suficientes para desempeñar su trabajo de forma segura y controlada.                      | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0007` | `viso`      | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Asegurar que la organización disponga de asignaciones laborales y horarios publicados, coherentes y revisables que permitan planear y ejecutar el trabajo.                                    | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0008` | `anima`     | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Conservar evidencia confiable de la asistencia realmente ocurrida y permitir correcciones sin borrar ni reescribir los hechos originales.                                                     | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0009` | `viso`      | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Resolver ausencias, permisos, cambios y reemplazos sin dejar turnos, responsabilidades o contextos operativos inconsistentes.                                                                 | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0010` | `numera`    | Trabajadores, turnos, asistencia y expediente laboral + Nómina, pagos, cuentas y decisiones financieras                 | Producir un paquete laboral autorizado, completo y conciliable que permita liquidar pagos y beneficios mediante la autoridad correspondiente.                                                 | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0011` | `viso`      | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Cerrar cada relación laboral de forma integral, verificando obligaciones, devoluciones, accesos, documentación y riesgos residuales.                                                          | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0012` | `viso`      | SST, salud, investigaciones y declaraciones                                                                             | Reducir riesgos de seguridad, salud e inocuidad mediante identificación, evaluación, control, inspección y seguimiento verificable de acciones preventivas y correctivas.                     | `S4_HIGHLY_RESTRICTED`            | Mínimo indispensable por identidad, participación, caso y finalidad; evitar proyecciones generales, cruces amplios y cualquier dato accesorio. Online por defecto; segregación máxima; sin persistencia local, exportación o terceros rutinarios; logs sin contenido sensible y acceso administrativo trazable. | S4 online por defecto; cualquier excepción requiere contrato específico posterior.                                    | Sin exportación o tercero rutinario; cualquier transferencia exige finalidad, autoridad y alcance mínimo explícitos. | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0013` | `viso`      | SST, salud, investigaciones y declaraciones                                                                             | Proteger a las personas y a la operación mediante respuesta oportuna a incidentes, accidentes y emergencias, preservando investigación, decisiones y aprendizaje.                             | `S4_HIGHLY_RESTRICTED`            | Mínimo indispensable por identidad, participación, caso y finalidad; evitar proyecciones generales, cruces amplios y cualquier dato accesorio. Online por defecto; segregación máxima; sin persistencia local, exportación o terceros rutinarios; logs sin contenido sensible y acceso administrativo trazable. | S4 online por defecto; cualquier excepción requiere contrato específico posterior.                                    | Sin exportación o tercero rutinario; cualquier transferencia exige finalidad, autoridad y alcance mínimo explícitos. | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0014` | `viso`      | SST, salud, investigaciones y declaraciones                                                                             | Mantener condiciones verificables de higiene, inocuidad y cumplimiento durante la operación mediante controles repetibles y evidencia suficiente.                                             | `S1_INTERNAL a S3_RESTRICTED`     | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0015` | `nexo`      | Operación interna ordinaria                                                                                             | Conservar un catálogo de productos, presentaciones, unidades y equivalencias coherente para que todas las operaciones interpreten el mismo objeto comercial y logístico.                      | `S1_INTERNAL`                     | Proyección operativa mínima; limitar campos, precisión, periodo y población a la tarea interna necesaria. Canales internos autorizados; no divulgar externamente por defecto; exportación y terceros requieren autorización separada.                                                                           | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0016` | `fogo`      | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | Convertir una formulación en una receta aprobada, reproducible y versionada que pueda utilizarse sin perder trazabilidad de cambios y validaciones.                                           | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0017` | `pulso`     | Contenido público aprobado + Operación interna ordinaria                                                                | Asegurar que la oferta publicada en cada canal corresponda con definiciones vigentes y disponibilidad realmente comprometible.                                                                | `S1_INTERNAL`                     | Proyección operativa mínima; limitar campos, precisión, periodo y población a la tarea interna necesaria. Canales internos autorizados; no divulgar externamente por defecto; exportación y terceros requieren autorización separada.                                                                           | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0018` | `nexo`      | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | Preservar requisitos de calidad, composición, alérgenos y restricciones de cada producto para prevenir producción, comercialización o consumo no conformes.                                   | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0019` | `origo`     | Proveedores, contratos y condiciones                                                                                    | Convertir necesidades de abastecimiento en requerimientos priorizados, justificables y trazables antes de comprometer una compra.                                                             | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0020` | `origo`     | Proveedores, contratos y condiciones                                                                                    | Permitir una decisión de abastecimiento informada comparando proveedores, condiciones, riesgos y evidencia relevante.                                                                         | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0021` | `origo`     | Proveedores, contratos y condiciones                                                                                    | Autorizar y formalizar compras con el nivel de control adecuado, diferenciando operación ordinaria, urgencia y excepción.                                                                     | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0022` | `origo`     | Proveedores, contratos y condiciones                                                                                    | Confirmar que lo recibido física, documental y económicamente corresponde con lo solicitado y resolver diferencias antes de aceptar la obligación.                                            | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0023` | `nexo`      | Operación interna ordinaria                                                                                             | Mantener una estructura confiable de ubicaciones y condiciones de almacenamiento para saber dónde puede custodiarse cada objeto y bajo qué restricciones.                                     | `S1_INTERNAL`                     | Proyección operativa mínima; limitar campos, precisión, periodo y población a la tarea interna necesaria. Canales internos autorizados; no divulgar externamente por defecto; exportación y terceros requieren autorización separada.                                                                           | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0024` | `nexo`      | Operación interna ordinaria                                                                                             | Asegurar que cada ingreso o cambio de ubicación modifique la custodia y disponibilidad de inventario de forma correlacionada y trazable.                                                      | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0025` | `nexo`      | Operación interna ordinaria                                                                                             | Permitir el retiro, consumo o traslado de existencias sin perder la relación entre cantidad, unidad, conversión, origen, destino y responsable.                                               | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0026` | `nexo`      | Operación interna ordinaria                                                                                             | Establecer la existencia real mediante conteos independientes y convertir las diferencias en decisiones de ajuste justificadas, no en sobrescrituras automáticas.                             | `S1_INTERNAL a S3_RESTRICTED`     | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0027` | `nexo`      | Operación interna ordinaria                                                                                             | Proteger la aptitud y el valor del inventario gestionando vencimientos, condiciones, cuarentenas, pérdidas, mermas, frío y disposición final.                                                 | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0028` | `nexo`      | Operación interna ordinaria                                                                                             | Satisfacer necesidades internas de abastecimiento conservando cantidades y responsabilidades conciliables desde la solicitud hasta la recepción.                                              | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0029` | `nexo`      | Operación interna ordinaria                                                                                             | Conservar identidad, ubicación, condición y custodia de los activos durante su uso, préstamo y transferencia.                                                                                 | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0030` | `nexo`      | Operación interna ordinaria                                                                                             | Restablecer o decidir el destino de un activo mediante mantenimiento, reparación, garantía, repuestos y baja controlados.                                                                     | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0031` | `nexo`      | Operación interna ordinaria                                                                                             | Mantener vehículos disponibles y seguros para la operación mediante control de condición, uso, combustible, kilometraje e incidencias.                                                        | `S1_INTERNAL a S3_RESTRICTED`     | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0032` | `nexo`      | Operación interna ordinaria                                                                                             | Asegurar la disponibilidad y retorno de reutilizables y contenedores, atribuyendo tenencia, faltantes, daños y completitud.                                                                   | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0033` | `fogo`      | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | Transformar demanda y necesidades operativas en un plan de producción factible, priorizado y oportuno.                                                                                        | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0034` | `fogo`      | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | Producir de manera reproducible utilizando materiales, cantidades y versiones aprobadas, conservando trazabilidad de la ejecución.                                                            | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0035` | `fogo`      | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | Evitar liberar producto no conforme mediante una decisión independiente y verificable sobre aceptación, retención, corrección o rechazo.                                                      | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0036` | `fogo`      | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | Preservar identidad, condición y trazabilidad del producto terminado durante empaque, etiquetado y almacenamiento.                                                                            | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0037` | `fogo`      | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | Cerrar la ejecución productiva explicando rendimiento, merma, aprovechamiento y reproceso sin ocultar desviaciones.                                                                           | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0038` | `pulso`     | Clientes, contactos y consentimientos                                                                                   | Completar el servicio en mesa desde la atención inicial hasta la entrega y liquidación, manteniendo coherencia entre pedido, preparación, consumo, pago y mesa.                               | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0039` | `pulso`     | Clientes, contactos y consentimientos                                                                                   | Completar una venta de mostrador o para llevar asegurando que pedido, preparación, entrega y cobro correspondan al mismo compromiso.                                                          | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0040` | `pulso`     | Clientes, contactos y consentimientos                                                                                   | Incorporar pedidos originados en terceros al flujo interno sin duplicar solicitudes ni perder estados, condiciones, cobros o conciliación.                                                    | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0041` | `pulso`     | Clientes, contactos y consentimientos                                                                                   | Cumplir compromisos de catering o venta entre empresas validando viabilidad, condiciones comerciales, producción, entrega y facturación.                                                      | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0042` | `pulso`     | Clientes, contactos y consentimientos                                                                                   | Corregir o terminar compromisos comerciales de manera controlada, distinguiendo modificaciones, sustituciones, cancelaciones, anulaciones y devoluciones según sus efectos.                   | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0043` | `pulso`     | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | Confirmar y respaldar el pago de una obligación comercial, conservando correspondencia entre venta, medio, valor, resultado y soporte fiscal.                                                 | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0044` | `pulso`     | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | Demostrar el resultado real de una jornada de caja conciliando ventas, pagos, efectivo, diferencias y responsabilidades.                                                                      | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0045` | `pass`      | Clientes, contactos y consentimientos                                                                                   | Reconocer al cliente y administrar beneficios de fidelización con saldos, movimientos y consentimientos verificables.                                                                         | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0046` | `pulso`     | Clientes, contactos y consentimientos                                                                                   | Restituir al cliente y corregir la causa de una inconformidad mediante tratamiento trazable de reclamos, devoluciones y compensaciones.                                                       | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0047` | `pulso`     | Clientes, contactos y consentimientos                                                                                   | Comprometer capacidad para reservas y eventos de forma realista y mantener comunicaciones oportunas y consentidas con el cliente.                                                             | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0048` | `nexo`      | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | Preparar un despacho ejecutable asignando ruta, vehículo, carga, secuencia y restricciones antes de iniciar el transporte.                                                                    | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0049` | `nexo`      | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | Completar una entrega con evidencia suficiente del resultado y tratamiento controlado de rechazos, novedades y retornos.                                                                      | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0050` | `pulso`     | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | Obtener y conciliar el resultado de una entrega realizada por terceros sin perder control interno sobre compromiso, seguimiento y evidencia.                                                  | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0051` | `numera`    | Nómina, pagos, cuentas y decisiones financieras                                                                         | Representar hechos económicos a partir de eventos y soportes verificables para evitar registros aislados o sin origen operacional.                                                            | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0052` | `numera`    | Nómina, pagos, cuentas y decisiones financieras                                                                         | Cumplir obligaciones con proveedores mediante aprobación, pago y conciliación que demuestren qué se debía, qué se pagó y qué permanece pendiente.                                             | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0053` | `numera`    | Nómina, pagos, cuentas y decisiones financieras                                                                         | Recuperar y aplicar valores por cobrar manteniendo claridad sobre obligación, recaudo, saldo y diferencias.                                                                                   | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0054` | `numera`    | Nómina, pagos, cuentas y decisiones financieras                                                                         | Producir información confiable sobre costos, asignaciones, cierres y rentabilidad para apoyar decisiones sin confundir estimaciones con hechos realizados.                                    | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0055` | `nexo`      | Operación interna ordinaria                                                                                             | Mantener instalaciones aptas, seguras y operativas mediante limpieza, inspección, mantenimiento, control de plagas, servicios y cierre de novedades.                                          | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0056` | `aura`      | Contenido público aprobado + Operación interna ordinaria                                                                | Publicar contenido y promociones autorizados, vigentes y retirables de forma coordinada en los canales correspondientes.                                                                      | `S0_PUBLIC a S2_CONFIDENTIAL`     | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0057` | `aura`      | Clientes, contactos y consentimientos                                                                                   | Convertir interacciones digitales con intención comercial en oportunidades o casos trazables hasta su atención, descarte o conversión.                                                        | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0058` | `viso`      | Vulnerabilidades, incidentes y configuración sensible                                                                   | Restablecer servicios tecnológicos y reducir recurrencia mediante gestión de solicitudes, incidentes, diagnóstico, resolución y conocimiento.                                                 | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0059` | `viso`      | Credenciales, secretos, tokens, PIN y llaves + Vulnerabilidades, incidentes y configuración sensible                    | Conceder, modificar y revocar acceso tecnológico conforme a una necesidad autorizada, verificando que no permanezcan privilegios residuales.                                                  | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0060` | `viso`      | Documentos, evidencia, firmas y soportes                                                                                | Conservar documentos y evidencia confiables durante su ciclo de vida, con contexto, custodia, acceso y disposición controlados.                                                               | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0061` | `numera`    | Telemetría identificable, logs y auditoría                                                                              | Convertir mediciones y hallazgos en decisiones de mejora verificables y comprobar si produjeron el resultado esperado.                                                                        | `S2_CONFIDENTIAL`                 | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0062` | `viso`      | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | Mantener la operación esencial frente a interrupciones y recuperar el servicio con reconciliación, evidencia y aprendizaje posterior.                                                         | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0063` | `viso`      | Operación interna ordinaria                                                                                             | Mantener visibles y tratados los riesgos empresariales relevantes para apoyar decisiones y evitar exposición residual aceptada sin seguimiento.                                               | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0064` | `viso`      | Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes                                         | Cumplir requerimientos y compromisos con asesores y autoridades conservando responsabilidad interna, vencimientos, evidencia y trazabilidad.                                                  | `S2_CONFIDENTIAL a S3_RESTRICTED` | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0065` | `viso`      | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Orientar el desempeño y desarrollo de las personas mediante objetivos y retroalimentación con propósito legítimo, privacidad y decisiones controladas.                                        | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0066` | `viso`      | Trabajadores, turnos, asistencia y expediente laboral                                                                   | Proteger a las personas mediante entrega, vigencia, cambio, devolución y evidencia de los elementos de protección requeridos.                                                                 | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0067` | `nexo`      | Operación interna ordinaria                                                                                             | Asegurar que kits y conjuntos se definan, armen, entreguen, utilicen y devuelvan con completitud conocida y componentes trazables.                                                            | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0068` | `pulso`     | Clientes, contactos y consentimientos + Telemetría identificable, logs y auditoría                                      | Conocer la experiencia del cliente mediante mediciones interpretables y separadas de incentivos, reclamos y compensaciones.                                                                   | `S1_INTERNAL a S2_CONFIDENTIAL`   | Proyección por finalidad y relación; omitir identificadores, contacto, ubicación, adjuntos y metadatos no necesarios; enmascarar cuando el valor completo no sea requerido. Canales controlados; acceso por finalidad y relación; terceros y exportación solo con alcance mínimo autorizado; logs redactados.   | No concede capacidad offline; se somete al perfil offline del proceso y a la clase efectiva.                          | Exportación/tercero solo por autorización separada, finalidad y proyección mínima; la lectura no los concede.        | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |
| `VPROC-0069` | `numera`    | Nómina, pagos, cuentas y decisiones financieras                                                                         | Planear y controlar el uso de recursos financieros mediante presupuestos versionados, aprobados y comparables con consumo y proyección, sin tratarlos como hechos contables.                  | `S3_RESTRICTED`                   | Necesidad estricta por actor, relación y caso; enmascaramiento por defecto; reducir precisión, ventana, población y volumen; evitar listados masivos. Acceso need-to-know; exportación reforzada y no implícita; almacenamiento local solo excepcional, cifrado, aislado, con expiración y borrado verificable. | S3 local solo por excepción con cifrado, aislamiento, expiración y borrado verificable; no concede capacidad offline. | Exportación/tercero no implícitos; requieren finalidad, autoridad, columnas/población mínimas, destino y evidencia.  | `ESPECIFICADO` | Ninguno documental; cualquier clase efectiva superior prevalece. |

Reconciliación:

```text
69 procesos esperados
69 perfiles materializados
0 faltantes
0 duplicados
9 propietarias funcionales preservadas
0 propietarias funcionales modificadas
```

---

#### 15. Matriz materializada por entrada contextual — 332 de 332

La categoría de cada fila se hereda del contexto empresarial del proceso. La clase y la regla dominante se preservan literalmente de `EVID-ARC-003`. El resultado de minimización y manejo queda resuelto por las secciones 5 a 13 de esta tarea; ninguna fila puede usar una política inferior a su clase efectiva.

| ID contextual          | Proceso      | Categoría(s)                                                                                                            | Clase mínima           | Regla dominante          | Resultado de minimización y manejo                                                                                                                                                          | Estado         | Bloqueo / condición                                                                          |
| ---------------------- | ------------ | ----------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | -------------------------------------------------------------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | Trabajadores, turnos, asistencia y expediente laboral + Nómina, pagos, cuentas y decisiones financieras                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | Trabajadores, turnos, asistencia y expediente laboral + Nómina, pagos, cuentas y decisiones financieras                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | Trabajadores, turnos, asistencia y expediente laboral + Nómina, pagos, cuentas y decisiones financieras                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | Trabajadores, turnos, asistencia y expediente laboral + Nómina, pagos, cuentas y decisiones financieras                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | SST, salud, investigaciones y declaraciones                                                                             | `S4_HIGHLY_RESTRICTED` | `S4_DIRECTA`             | Aplicar la minimización y el manejo de `S4_HIGHLY_RESTRICTED`; Mantener S4 como piso directo; no existe degradación implícita.                                                              | `ESPECIFICADO` | Ninguno documental; S4 no admite degradación implícita.                                      |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | SST, salud, investigaciones y declaraciones                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | SST, salud, investigaciones y declaraciones                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | SST, salud, investigaciones y declaraciones                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | SST, salud, investigaciones y declaraciones                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | Contenido público aprobado + Operación interna ordinaria                                                                | `S1_INTERNAL`          | `PUBLICACION_CONTROLADA` | Aplicar la minimización y el manejo de `S1_INTERNAL`; Solo la proyección publicada aprobada puede ser pública; borradores, fuentes, historial y metadatos conservan su clase propia.        | `ESPECIFICADO` | Ninguno documental; la condición pública exige publicación aprobada y vigente.               |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | Proveedores, contratos y condiciones                                                                                    | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | Recetas, fórmulas, costos, rendimientos y conocimiento propietario                                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | Clientes, contactos y consentimientos + Nómina, pagos, cuentas y decisiones financieras                                 | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | Clientes, contactos y consentimientos                                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | Operación interna ordinaria + Documentos, evidencia, firmas y soportes                                                  | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | Clientes, contactos y consentimientos + Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | Contenido público aprobado + Operación interna ordinaria                                                                | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | Contenido público aprobado + Operación interna ordinaria                                                                | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | Contenido público aprobado + Operación interna ordinaria                                                                | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | Contenido público aprobado + Operación interna ordinaria                                                                | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | Contenido público aprobado                                                                                              | `S0_PUBLIC`            | `PUBLICACION_CONTROLADA` | Aplicar la minimización y el manejo de `S0_PUBLIC`; Solo la proyección publicada aprobada puede ser pública; borradores, fuentes, historial y metadatos conservan su clase propia.          | `ESPECIFICADO` | Ninguno documental; la condición pública exige publicación aprobada y vigente.               |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | Contenido público aprobado + Operación interna ordinaria                                                                | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | Contenido público aprobado + Operación interna ordinaria                                                                | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | Clientes, contactos y consentimientos                                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | Vulnerabilidades, incidentes y configuración sensible                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | Vulnerabilidades, incidentes y configuración sensible                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | Vulnerabilidades, incidentes y configuración sensible                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | Vulnerabilidades, incidentes y configuración sensible                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | Vulnerabilidades, incidentes y configuración sensible                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | Vulnerabilidades, incidentes y configuración sensible                                                                   | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | Credenciales, secretos, tokens, PIN y llaves + Vulnerabilidades, incidentes y configuración sensible                    | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | Credenciales, secretos, tokens, PIN y llaves + Vulnerabilidades, incidentes y configuración sensible                    | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | Credenciales, secretos, tokens, PIN y llaves + Vulnerabilidades, incidentes y configuración sensible                    | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | Credenciales, secretos, tokens, PIN y llaves + Vulnerabilidades, incidentes y configuración sensible                    | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | Credenciales, secretos, tokens, PIN y llaves + Vulnerabilidades, incidentes y configuración sensible                    | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | Credenciales, secretos, tokens, PIN y llaves + Vulnerabilidades, incidentes y configuración sensible                    | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | Documentos, evidencia, firmas y soportes                                                                                | `S2_CONFIDENTIAL`      | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.           | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | Telemetría identificable, logs y auditoría                                                                              | `S2_CONFIDENTIAL`      | `INFERENCIA`             | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Evaluar inferencia, reidentificación, grupos pequeños y drill-down; elevar o suprimir cuando la combinación incremente el riesgo. | `ESPECIFICADO` | Ninguno documental; la exposición o exportación exige evaluar inferencia y reidentificación. |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | Telemetría identificable, logs y auditoría                                                                              | `S2_CONFIDENTIAL`      | `INFERENCIA`             | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Evaluar inferencia, reidentificación, grupos pequeños y drill-down; elevar o suprimir cuando la combinación incremente el riesgo. | `ESPECIFICADO` | Ninguno documental; la exposición o exportación exige evaluar inferencia y reidentificación. |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | Telemetría identificable, logs y auditoría                                                                              | `S2_CONFIDENTIAL`      | `INFERENCIA`             | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Evaluar inferencia, reidentificación, grupos pequeños y drill-down; elevar o suprimir cuando la combinación incremente el riesgo. | `ESPECIFICADO` | Ninguno documental; la exposición o exportación exige evaluar inferencia y reidentificación. |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | Telemetría identificable, logs y auditoría                                                                              | `S2_CONFIDENTIAL`      | `INFERENCIA`             | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Evaluar inferencia, reidentificación, grupos pequeños y drill-down; elevar o suprimir cuando la combinación incremente el riesgo. | `ESPECIFICADO` | Ninguno documental; la exposición o exportación exige evaluar inferencia y reidentificación. |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | Telemetría identificable, logs y auditoría                                                                              | `S2_CONFIDENTIAL`      | `INFERENCIA`             | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Evaluar inferencia, reidentificación, grupos pequeños y drill-down; elevar o suprimir cuando la combinación incremente el riesgo. | `ESPECIFICADO` | Ninguno documental; la exposición o exportación exige evaluar inferencia y reidentificación. |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | Telemetría identificable, logs y auditoría                                                                              | `S2_CONFIDENTIAL`      | `INFERENCIA`             | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Evaluar inferencia, reidentificación, grupos pequeños y drill-down; elevar o suprimir cuando la combinación incremente el riesgo. | `ESPECIFICADO` | Ninguno documental; la exposición o exportación exige evaluar inferencia y reidentificación. |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | Vulnerabilidades, incidentes y configuración sensible + Documentos, evidencia, firmas y soportes                        | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | Operación interna ordinaria                                                                                             | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes                                         | `S3_RESTRICTED`        | `HERENCIA_CONTENIDO`     | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Resolver la clase efectiva como la más restrictiva entre piso y contenido/fuente antes de exponer, copiar o transferir.             | `ESPECIFICADO` | Ninguno documental; la exposición exige resolver la clase efectiva del contenido.            |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes                                         | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes                                         | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | Proveedores, contratos y condiciones + Documentos, evidencia, firmas y soportes                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | Trabajadores, turnos, asistencia y expediente laboral                                                                   | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | Operación interna ordinaria                                                                                             | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | Operación interna ordinaria                                                                                             | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | Clientes, contactos y consentimientos + Telemetría identificable, logs y auditoría                                      | `S1_INTERNAL`          | `BASE`                   | Aplicar la minimización y el manejo de `S1_INTERNAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                     | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | Clientes, contactos y consentimientos + Telemetría identificable, logs y auditoría                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | Clientes, contactos y consentimientos + Telemetría identificable, logs y auditoría                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | Clientes, contactos y consentimientos + Telemetría identificable, logs y auditoría                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | Clientes, contactos y consentimientos + Telemetría identificable, logs y auditoría                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | Clientes, contactos y consentimientos + Telemetría identificable, logs y auditoría                                      | `S2_CONFIDENTIAL`      | `BASE`                   | Aplicar la minimización y el manejo de `S2_CONFIDENTIAL`; Aplicar el piso declarado, con elevación y propagación generales.                                                                 | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | Nómina, pagos, cuentas y decisiones financieras                                                                         | `S3_RESTRICTED`        | `BASE`                   | Aplicar la minimización y el manejo de `S3_RESTRICTED`; Aplicar el piso declarado, con elevación y propagación generales.                                                                   | `ESPECIFICADO` | Ninguno documental.                                                                          |

Reconciliación de las 332 decisiones:

| Control                  | Resultado |
| ------------------------ | --------: |
| Entradas esperadas       |       332 |
| Entradas materializadas  |       332 |
| Claves `DOCCTX-*` únicas |       332 |
| Entradas faltantes       |         0 |
| Entradas duplicadas      |         0 |
| Procesos faltantes       |         0 |
| Propietarias modificadas |         0 |
| `S0_PUBLIC`              |         1 |
| `S1_INTERNAL`            |        33 |
| `S2_CONFIDENTIAL`        |       166 |
| `S3_RESTRICTED`          |       124 |
| `S4_HIGHLY_RESTRICTED`   |         8 |
| `BASE`                   |       287 |
| `HERENCIA_CONTENIDO`     |        29 |
| `PUBLICACION_CONTROLADA` |         2 |
| `INFERENCIA`             |         6 |
| `S4_DIRECTA`             |         8 |

---

#### 16. Reconciliación con Storage actual

La bandera técnica de un bucket describe exposición/configuración de infraestructura; no es una clase empresarial. Por tanto, `public = true` no equivale a `S0_PUBLIC`, y `public = false` tampoco define por sí sola S1–S4.

| Bucket observado         | Bandera técnica | Objetos observados | Decisión documental                                                                                                                       | Estado                   | Propietario de cierre                                                            | Condición de salida                                                                                               |
| ------------------------ | --------------- | -----------------: | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `commercial-menu-images` | `true`          |                 51 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `documents`              | `true`          |                164 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `employee-photos`        | `true`          |                 26 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `nexo-ai-documents`      | `false`         |                  1 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `nexo-catalog-images`    | `true`          |                790 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `pass-satellite-logos`   | `true`          |                 11 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `product-images`         | `true`          |                 45 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `public-documents`       | `true`          |                  9 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `recipe-media`           | `false`         |                  0 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `recipe-step-photos`     | `true`          |                  4 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `talento-cv`             | `false`         |                  0 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `talento-documents`      | `false`         |                  0 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `talento-medical`        | `false`         |                  0 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |
| `website-media`          | `false`         |                  0 | No clasificar por bucket; resolver cada objeto o familia por recurso, contexto, contenido y clase efectiva antes de concluir conformidad. | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-005`; `INFO-AUTH-002`; `EVID-ARC-007` y auditoría de Storage aplicable | Mapeo objeto/familia → recurso y contexto autorizado, clase efectiva, metadatos y política de acceso verificados. |

Reconciliación técnica observada:

```text
14 buckets
8 con bandera técnica public=true
6 con bandera técnica public=false
1101 objetos contados
0 objetos inspeccionados por contenido en esta tarea
0 clases inferidas desde nombre de bucket
0 cambios de Storage autorizados
```

La existencia de buckets técnicamente públicos obliga a reconciliar contenido y autorización antes de cualquier declaración de conformidad. Esta tarea registra la brecha de interpretación y el handoff; no cambia exposición, políticas ni objetos.

---

#### 17. Casos obligatorios de elevación o política restrictiva

Se aplica política más restrictiva cuando ocurra cualquiera de estas condiciones:

- clasificación ausente o no resoluble;
- contenido real más sensible que el piso;
- mezcla de categorías con clases diferentes;
- copia, derivado o exportación que herede una fuente más sensible;
- combinación que permita inferencia o reidentificación;
- población pequeña o drill-down individual no necesario;
- metadato, nombre, thumbnail, preview o ruta que revele información sensible;
- destino, tercero, finalidad o autoridad no resueltos;
- versión de política desconocida o desactualizada;
- cambio de contexto efectivo, actor, sede, área, dispositivo o relación que invalide la proyección previa.

---

#### 18. Fronteras de autorización y ciclo de vida

Esta tarea define sensibilidad y manejo; no concede autoridad. La acción efectiva deberá combinar posteriormente:

```text
AUTORIZACIÓN DE ACCIÓN
        +
PROYECCIÓN MÍNIMA
        +
CLASE EFECTIVA Y MANEJO
        ↓
RESPUESTA / ACCIÓN PERMITIDA
```

Retención, legal hold, anonimización, disposición, firma, compartición externa y permisos se mantienen bajo sus tareas propietarias. Esta tarea tampoco fija plazos legales ni declara que un tratamiento real cumple una norma.

---

#### 19. Estado AS-IS y frontera TO-BE

| Elemento                                        | Estado verificable                                                      | Decisión                                                                                                                   |
| ----------------------------------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Matriz EVID de sensibilidad                     | 332 entradas con piso S0–S4 y regla dominante ya aprobados              | Se preserva íntegra y se eleva a contrato corporativo de manejo.                                                           |
| Perfil de privacidad por proceso                | Contrato NFR existente para 69 procesos                                 | Se materializa individualmente en esta tarea; no demuestra implementación.                                                 |
| Storage                                         | 14 buckets y 1101 objetos observados por metadata                       | La exposición técnica no se usa como clasificación; mapeo de contenido/acceso queda con propietario y condición de salida. |
| Autorización por clasificación/finalidad        | Contratos documentales existentes; implementación integral no se afirma | Reservada para tareas INFO-AUTH y arquitectura/paquetes posteriores.                                                       |
| Retención/disposición                           | Contratos documentales existentes; no se completan aquí                 | Reservada para tareas INFO-DOM propietarias posteriores.                                                                   |
| Código, RLS, migraciones y políticas de Storage | Fuera de la fase documental actual                                      | Ningún cambio físico en esta tarea.                                                                                        |

---

#### 20. Pendientes y handoffs con propietario

| Pendiente                                                                                           | Propietario                                            | Condición de salida                                                                                                                       |
| --------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Taxonomía corporativa de documentos, registros, evidencia, series, expedientes, originales y copias | `INFO-DOM-003`                                         | Taxonomía aprobada sin degradar las 332 clases ni fusionar contextos por nombre.                                                          |
| Metadatos y vínculo físico/empresarial de archivos y objetos                                        | `INFO-DOM-005` y EVID-ARC aplicable                    | Cada objeto/familia resoluble a recurso, contexto, clase y metadatos obligatorios.                                                        |
| Autorización basada en clasificación, finalidad, identidad, relación, recurso, territorio y estado  | `INFO-AUTH-001`                                        | Contrato de autorización consume clase efectiva y proyección mínima sin convertir clasificación en permiso.                               |
| Obtención de archivo, impresión, exportación, compartición y URLs firmadas                          | `INFO-AUTH-002`                                        | Acciones sensibles protegidas por autorización específica y evidencia, incluida reconciliación de Storage.                                |
| Finalidades revocables, consentimiento y datos especialmente sensibles                              | `INFO-DOM-008`                                         | Base jurídica/consentimiento y revocación versionados donde correspondan.                                                                 |
| Compartición, terceros, encargados y transferencias                                                 | `INFO-DOM-010`                                         | Destinatarios, finalidad, campos, canal, vigencia, retorno/revocación y evidencia resueltos.                                              |
| Certificación de privacidad y manejo                                                                | paquetes de implementación y certificación posteriores | Evidencia real de acceso negativo, minimización, offline, logs, exportación, terceros, secretos, reclasificación y versiones de política. |

Ninguno de estos handoffs posterga el resultado principal de INFO-DOM-002: la clasificación, minimización y manejo documental quedan completamente materializados para el universo recibido.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa para 69 procesos y 332 entradas la clasificación, minimización, propagación y manejo ya protegidos por requisitos vigentes de privacidad, seguridad, proceso, almacenamiento e integración. No introduce una nueva regla ejecutable, transición, cálculo, autorización, mutación, integración o restricción física distinta de las ya registradas. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 22. Criterios de aceptación

- [x] La escala S0–S4 conserva exactamente cinco clases y sus equivalentes humanos.
- [x] Una clase ausente o desconocida nunca se interpreta como pública.
- [x] La clasificación se resuelve a granularidad útil y no por aplicación, tabla, bucket o archivo completo.
- [x] Las 332 claves `DOCCTX-*` aparecen exactamente una vez.
- [x] La distribución S0/S1/S2/S3/S4 es 1/33/166/124/8.
- [x] La distribución de reglas BASE/HERENCIA_CONTENIDO/PUBLICACION_CONTROLADA/INFERENCIA/S4_DIRECTA es 287/29/2/6/8.
- [x] Los 69 procesos reciben perfil individual de privacidad, finalidad, categoría y manejo.
- [x] Las 9 propietarias funcionales heredadas permanecen sin modificación.
- [x] Las 12 categorías mínimas tienen regla explícita de minimización y manejo.
- [x] El sobre de manejo cubre clasificación, propiedad/custodia, finalidad, actor/contexto, campos, masking, canales, local/offline, exportación, terceros, logging, retención/disposición, incidente y versión.
- [x] S4 queda online por defecto y S3 local solo bajo excepción reforzada.
- [x] Consultar no concede exportar, imprimir ni compartir.
- [x] Logs y observabilidad excluyen secretos y payloads sensibles completos.
- [x] Derivados y agregados pueden elevar clase por inferencia o reidentificación.
- [x] La reclasificación conserva historia y no degrada silenciosamente copias o derivados.
- [x] Los 14 buckets actuales se reconcilian sin inferir clase desde su bandera técnica.
- [x] El conteo observado de Storage conserva 14 buckets, 8 públicos técnicos, 6 privados técnicos y 1101 objetos.
- [x] No se inspecciona contenido personal de objetos para completar esta tarea documental.
- [x] No se modifica código, Supabase, Storage, RLS, datos, migraciones o configuración.
- [x] No se crean ni modifican requisitos de prueba.
- [x] INFO-DOM-003 permanece reservada y no iniciada.

---

#### 23. Resultado y continuidad

La organización queda con una clasificación corporativa única que separa naturaleza de la información, clase mínima, clase efectiva, finalidad, minimización y manejo. Cada entrada contextual conserva una decisión explícita y todo consumidor posterior deberá combinar clase efectiva con autorización y proyección mínima.

ÚLTIMA TAREA APROBADA

`INFO-DOM-001 — Definir gobierno de información, inventario, propietarios, custodios, responsables, encargados, finalidades y territorios`

TAREA ACTUAL APROBADA

`INFO-DOM-002 — Definir clasificación, sensibilidad, minimización y manejo por categoría de información`

SIGUIENTE TAREA RESERVADA

`INFO-DOM-003 — Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias`


### ✅ INFO-DOM-003 — Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias

**Estado:** APROBADA
**Tarea anterior:** `INFO-DOM-002 — Definir clasificación, sensibilidad, minimización y manejo por categoría de información` — APROBADA
**Tarea siguiente:** `INFO-DOM-004 — Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de la taxonomía corporativa para distinguir documentos, registros, evidencia, series documentales, expedientes, originales, copias y sus relaciones sin convertir carpetas, archivos, buckets, rutas o representaciones técnicas en categorías empresariales
**Repositorio propietario:** `vento-shell`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, Storage, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, archivos operativos, permisos ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una taxonomía documental corporativa única para VENTO que permita identificar qué es cada objeto informacional y cómo se relaciona con su proceso, recurso, evidencia, agrupación y representación, sin confundir significado empresarial con formato, ubicación física, ruta técnica o mecanismo de almacenamiento.

La taxonomía resuelve la brecha ya identificada entre información, documento, registro, evidencia, archivo, serie, expediente, original y copia. Su resultado es semántico y normativo: establece categorías, relaciones y reglas de resolución que deberán consumir las tareas posteriores de ciclo documental, metadatos, almacenamiento, retención, autenticidad, firma, autorización e integración.

---

#### 2. Resultado sustantivo

La taxonomía queda materializada en cuatro ejes ortogonales:

```text
OBJETO INFORMACIONAL GOBERNADO
        │
        ├── FUNCIÓN DOCUMENTAL
        │     ├── DOCUMENTO
        │     ├── REGISTRO
        │     └── EVIDENCIA
        │
        ├── AGRUPACIÓN DOCUMENTAL
        │     ├── SERIE DOCUMENTAL
        │     └── EXPEDIENTE
        │
        ├── ORIGINALIDAD Y DERIVACIÓN
        │     ├── ORIGINAL
        │     └── COPIA
        │
        └── REPRESENTACIÓN
              ├── física
              └── digital
```

Las nociones del título no son siete valores mutuamente excluyentes. Un mismo objeto puede ser simultáneamente documento y registro, servir como evidencia, pertenecer a una serie, estar referenciado por un expediente y tener representaciones originales y copias.

La taxonomía se resuelve sobre el objeto y sus representaciones reales. No se asigna por aplicación, tabla, schema, bucket, carpeta, ruta, extensión, nombre de archivo o tecnología de almacenamiento.

---

#### 3. Invariantes heredadas

Se conservan sin modificación:

- los **69** contextos de proceso `VPROC-0001` a `VPROC-0069`;
- las **332** entradas contextualizadas `DOCCTX-*`;
- las **9** aplicaciones propietarias funcionales ya asignadas;
- la escala de sensibilidad de cinco clases `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED`;
- la regla de que la propietaria funcional sigue al proceso y al hecho empresarial, no al lugar de persistencia;
- la regla de que una copia, exportación, snapshot, índice, caché, preview, thumbnail o representación derivada no adquiere autoridad sobre su fuente;
- la regla de que la clasificación efectiva de una copia o derivado no puede degradar silenciosamente la clasificación de su fuente;
- la separación entre propiedad funcional, custodia, responsabilidad, encargo, infraestructura, territorio y autorización;
- la regla de que `VPROC-0060` gobierna el ciclo documental transversal sin apropiarse de los hechos empresariales originados en otros procesos;
- la evidencia existente de originales físicos en `Oficina 1`, sin inventar custodios nominales ni correspondencias digitales no verificadas;
- la frontera documental de Storage: la bandera técnica, el nombre del bucket o la ruta no determinan tipo documental, clasificación, autoridad ni permiso.

---

#### 4. Regla de no equivalencia

La taxonomía adopta expresamente estas separaciones:

```text
información
≠ dato personal
≠ documento
≠ registro
≠ evidencia
≠ archivo o blob
```

```text
tipo documental
≠ serie documental
≠ expediente
≠ carpeta
≠ ubicación física
≠ ubicación de Storage
```

```text
objeto lógico
≠ representación
≠ versión
≠ copia
≠ archivo
```

```text
propietaria funcional
≠ custodio
≠ autor
≠ emisor
≠ aprobador
≠ firmante
≠ repositorio
≠ proveedor
```

La coincidencia de nombre, formato, carpeta, ruta o contenido aparente no autoriza fusionar identidades documentales ni inferir que dos representaciones son el mismo original.

---

#### 5. Documento

Un **documento** es un objeto informacional estructurado cuya función es expresar, comunicar, declarar, instruir, solicitar, autorizar, acordar, informar, documentar o presentar contenido dentro de un contexto empresarial.

Reglas:

1. un documento existe por su significado y función, no por ser PDF, imagen, hoja de cálculo, archivo de texto o fila de base de datos;
2. una plantilla en blanco puede ser un documento sin ser todavía un registro de una actuación concreta;
3. al completarse, emitirse, aprobarse, aceptarse o usarse dentro de un proceso, el mismo objeto o una instancia derivada puede adquirir además función de registro o evidencia;
4. una política, procedimiento, contrato, informe, acta, formulario, certificado, comunicación formal o instrucción puede ser documento aunque tenga múltiples representaciones;
5. la existencia de un archivo no demuestra por sí sola la existencia de un documento gobernado: debe existir contexto, recurso y significado empresarial resolubles;
6. el documento conserva la propietaria funcional del proceso que le da autoridad, aunque una representación sea almacenada o servida por otra aplicación o proveedor.

---

#### 6. Registro

Un **registro** es la captura persistente de un hecho, transacción, actuación, decisión, aceptación, estado, medición, movimiento, comunicación o resultado ocurrido dentro de un proceso empresarial.

Reglas:

1. el registro representa que algo ocurrió, fue recibido, fue decidido, fue medido o quedó en determinado estado;
2. una fila, evento o entrada de log puede ser registro sin ser un documento destinado a lectura humana;
3. un formulario completado, una marcación, una recepción, una inspección ejecutada, una venta, una decisión o una entrega pueden producir registros;
4. una plantilla o formulario vacío no se convierte en registro hasta que exista un hecho o instancia concreta que registrar;
5. una representación legible del registro no sustituye al hecho fuente ni adquiere autoridad por ser más fácil de consultar;
6. una corrección, sustitución o cambio de vigencia no se interpreta como permiso para sobrescribir silenciosamente la historia; el contrato de estados y versiones corresponde a la tarea siguiente.

---

#### 7. Evidencia

La **evidencia** es la función probatoria de un objeto o conjunto de objetos utilizados para demostrar un hecho, decisión, estado, cumplimiento, recepción, autorización, ejecución, integridad, comunicación o cierre.

La evidencia no es sinónimo de archivo ni de documento. Puede estar materializada como:

- documento;
- registro;
- fotografía o video;
- firma o constancia de aceptación;
- evento o log preservado;
- comprobante;
- certificado;
- medición;
- snapshot;
- representación física;
- representación digital;
- conjunto correlacionado de objetos.

Reglas:

1. un documento o registro puede cumplir además función de evidencia sin perder su naturaleza original;
2. una evidencia puede probar un hecho sin convertirse en la fuente empresarial de ese hecho;
3. una captura, fotografía, screenshot, exportación o copia puede servir como evidencia de una observación o transmisión, pero no adquiere por ello autoridad sobre el objeto fuente;
4. la fuerza, autenticidad, integridad, procedencia, hash, timestamp y cadena de custodia no se presumen por la etiqueta `evidencia`; esos controles pertenecen a la tarea propietaria posterior;
5. la evidencia preservada conserva clasificación, finalidad y restricciones aplicables al contenido que demuestra;
6. cuando varios elementos forman conjuntamente la prueba, la relación entre ellos debe conservarse sin fusionarlos en un único objeto ficticio.

---

#### 8. Serie documental

Una **serie documental** es una agrupación lógica y estable de documentos o registros producidos o recibidos por una misma función o proceso y que comparten una razón empresarial de gestión continua.

Reglas:

1. la serie agrupa por función documental y contexto empresarial, no por carpeta, ruta, bucket, extensión o aplicación;
2. una serie puede atravesar múltiples periodos, versiones y representaciones sin convertir esos elementos en un único documento;
3. pertenecer a una serie no transfiere propiedad funcional entre procesos;
4. una serie puede contener elementos con distinta clasificación efectiva cuando el contenido o contexto lo exija;
5. la serie no determina por sí sola retención, disposición o legal hold; esos controles se materializan en la tarea propietaria de retención;
6. el nombre de una carpeta o biblioteca puede coincidir con una serie solo cuando exista una relación explícita, nunca por inferencia técnica.

---

#### 9. Expediente

Un **expediente** es una agrupación lógica delimitada por un caso, recurso, sujeto, operación, contrato, investigación, trámite, relación o ciclo empresarial concreto.

Reglas:

1. el expediente conecta los documentos, registros y evidencias necesarios para comprender y probar un caso o ciclo específico;
2. puede referenciar objetos originados en distintos procesos sin absorber su propiedad funcional ni convertirlos en copias;
3. un mismo objeto fuente puede ser referenciado por más de un expediente cuando la relación empresarial sea legítima y explícita;
4. incorporar una referencia a un expediente no duplica el objeto fuente;
5. duplicar físicamente un archivo para formar un expediente sí crea una copia y debe conservar relación con su fuente;
6. expediente no equivale a carpeta, directorio, bucket, tabla, conversación, ticket genérico ni conjunto de archivos con nombres parecidos;
7. la apertura, estados, cierre, reapertura, vigencia y sustitución del expediente se mantienen bajo el contrato de ciclo documental posterior.

---

#### 10. Original

Un **original** es la representación reconocida por el proceso propietario como manifestación fuente o autoritativa de un objeto documental, sujeta a las reglas posteriores de autenticidad, integridad y procedencia.

Reglas:

1. originalidad es una condición de autoridad y procedencia, no una propiedad del formato;
2. no se infiere que un archivo sea original por ser el más antiguo, estar en determinada carpeta, tener un nombre particular o residir en Storage;
3. un original puede ser físico o digital;
4. la digitalización de un original físico produce una representación vinculada, pero no convierte automáticamente la digitalización en original;
5. la impresión de un objeto digital produce una representación física, pero no convierte automáticamente esa impresión en original;
6. cuando el proceso aplicable admita más de una representación con autoridad, esa condición deberá quedar explícita y no deducida;
7. cuando la evidencia disponible no permita demostrar la relación fuente, el objeto no se declarará original por defecto y permanecerá `PENDIENTE_DE_EVIDENCIA` para la dimensión de originalidad;
8. la determinación técnica de autenticidad, hash, timestamp, preservación y cadena de custodia queda reservada a la tarea propietaria correspondiente.

---

#### 11. Copia

Una **copia** es una representación creada a partir de un objeto o representación fuente y que no adquiere autoridad empresarial sobre esa fuente por el solo hecho de existir.

Toda copia deberá poder conservar o resolver su relación con la fuente cuando esa relación sea relevante para gobierno, auditoría, acceso, retención, reconciliación o disposición.

Subtipos funcionales admitidos por esta taxonomía:

| Subtipo                | Uso documental                                                                      | Regla de autoridad                                                                     |
| ---------------------- | ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| copia controlada       | distribución deliberada para una finalidad y destinatario conocidos                 | no sustituye la fuente; queda sujeta a control y reconciliación                        |
| copia de trabajo       | uso temporal para preparación, revisión o ejecución                                 | no se trata como fuente vigente ni como original                                       |
| copia derivada         | transformación de formato, resolución, contenido visible o presentación             | conserva vínculo con la fuente y puede elevar restricciones por contenido o inferencia |
| copia de transferencia | entrega a otra persona, aplicación, tercero o autoridad                             | no transfiere propiedad funcional; exige gobierno de destinatario y finalidad          |
| copia de contingencia  | uso temporal cuando el canal o sistema primario no está disponible                  | no crea una fuente paralela y debe reconciliarse al restablecer operación              |
| réplica técnica        | caché, sincronización, backup, preview, thumbnail u otra réplica de infraestructura | no se convierte en registro empresarial autónomo ni en fuente de verdad                |

Estos subtipos describen la función de la copia; no establecen todavía plazos, permisos, retención, eliminación, acceso externo ni equivalencia jurídica.

---

#### 12. Reglas para representaciones frecuentes

| Representación o caso                       | Decisión taxonómica                                                                                                              |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| plantilla vacía                             | documento; no es registro de una actuación concreta por sí sola                                                                  |
| formulario completado                       | documento y registro; puede cumplir además función de evidencia                                                                  |
| acta de decisión                            | documento y registro; normalmente sirve como evidencia de la decisión y compromisos                                              |
| política o procedimiento                    | documento; la versión aplicable puede servir como evidencia de la regla vigente sin convertir cada consulta en un nuevo original |
| contrato u orden formal                     | documento; puede cumplir función de evidencia del acuerdo o autorización; los hechos de ejecución permanecen registros separados |
| fila transaccional o evento empresarial     | registro; puede ser evidencia si se preserva para demostrar el hecho                                                             |
| log técnico o de auditoría                  | registro; puede cumplir función de evidencia cuando se preserve bajo controles aplicables                                        |
| fotografía o video de una condición         | evidencia cuando su finalidad sea probar la condición; el archivo es su representación digital                                   |
| archivo PDF, imagen, hoja de cálculo o JSON | representación o formato; no determina por sí solo si el objeto es documento, registro o evidencia                               |
| carpeta o directorio                        | mecanismo de organización o localización; no es serie ni expediente por sí mismo                                                 |
| bucket de Storage                           | contenedor técnico; no es tipo documental, serie, expediente, propietaria ni clasificación                                       |
| snapshot o exportación                      | copia derivada o representación congelada; no se convierte en fuente por ser portable                                            |
| screenshot                                  | copia derivada; puede servir como evidencia de una observación, sin sustituir la fuente                                          |
| impresión                                   | copia física de una fuente digital salvo decisión explícita y verificable del proceso propietario                                |
| escaneo o fotografía de original físico     | copia digital vinculada al original físico; la autenticidad de la correspondencia se gobierna posteriormente                     |
| OCR o extracción de texto                   | derivado de una representación; no sustituye el contenido fuente ni adquiere autoridad por facilitar búsqueda                    |
| preview o thumbnail                         | réplica técnica o copia derivada; hereda restricciones del contenido mostrado                                                    |
| cache o sincronización offline              | réplica técnica; no constituye una fuente competidora y debe reconciliarse con la fuente autorizada                              |
| backup                                      | réplica técnica de preservación; no es biblioteca operativa ni registro empresarial adicional                                    |
| expediente                                  | agrupación lógica de objetos relacionados con un caso o ciclo; no equivale al archivo físico que pueda representarlo             |
| serie documental                            | agrupación lógica por función; no equivale a una carpeta, tabla o bucket                                                         |

---

#### 13. Regla de autoridad y referencias

La autoridad documental se conserva mediante referencia, no mediante apropiación.

```text
HECHO EMPRESARIAL
→ permanece bajo su proceso y propietaria funcional

DOCUMENTO O REGISTRO
→ representa, formaliza o captura el hecho

EVIDENCIA
→ demuestra el hecho o una condición relacionada

EXPEDIENTE
→ referencia los objetos necesarios para un caso

SERIE
→ agrupa objetos por función documental

COPIA
→ representa una fuente sin adquirir su autoridad
```

Por tanto:

- un expediente no absorbe la autoridad de los registros que referencia;
- una serie no se convierte en propietaria de sus miembros;
- una copia no reemplaza una fuente solo por ser la más reciente o accesible;
- un archivo externo no se convierte en fuente de verdad al ser importado;
- un índice de búsqueda no se convierte en repositorio autoritativo;
- un evento, caché, exportación o snapshot no reemplaza al objeto que representa;
- una aplicación consumidora no adquiere propiedad funcional por obtener, presentar o transformar un objeto.

---

#### 14. Resolución taxonómica obligatoria

Para cualquier objeto documental gobernado se seguirá esta secuencia conceptual:

```text
1. resolver VPROC-* y recurso empresarial
2. resolver propietaria funcional y finalidad heredadas
3. identificar el objeto informacional real
4. declarar funciones aplicables: documento, registro y/o evidencia
5. resolver pertenencia a serie cuando exista
6. resolver referencias de expediente cuando existan
7. resolver cada representación como original o copia cuando exista evidencia suficiente
8. conservar relación fuente → copia o fuente → derivado
9. aplicar clasificación y manejo heredados de INFO-DOM-002
10. entregar a las tareas propietarias posteriores ciclo, metadatos, retención, autenticidad y autorización
```

No se permite usar como atajo taxonómico:

- nombre de archivo;
- extensión;
- tabla;
- schema;
- bucket;
- ruta;
- carpeta;
- aplicación que presenta el contenido;
- bandera técnica pública o privada;
- fecha de creación aislada;
- orden de subida;
- similitud de nombre;
- ubicación física aislada.

Cuando falte evidencia para resolver una dimensión, se conserva la identidad conocida y esa dimensión queda `PENDIENTE_DE_EVIDENCIA`; no se crea una categoría ficticia ni se fuerza una equivalencia.

---

#### 15. Aplicación al universo heredado

Las 332 claves `DOCCTX-*` representan contextos documentales o de información, no 332 objetos físicos o digitales individuales. Algunos contextos contienen más de un artefacto o función; por tanto, asignar por fuerza una única clase documental a cada `DOCCTX-*` destruiría información y contradice la granularidad aprobada.

La decisión material para el universo heredado es:

| Control                                       |         Universo heredado |         Resultado de INFO-DOM-003 |
| --------------------------------------------- | ------------------------: | --------------------------------: |
| procesos `VPROC-*`                            |                        69 |                    69 preservados |
| contextos `DOCCTX-*`                          |                       332 |                   332 preservados |
| contextos fusionados                          |                         0 |                                 0 |
| contextos renombrados                         |                         0 |                                 0 |
| contextos eliminados                          |                         0 |                                 0 |
| aplicaciones propietarias                     |                         9 |                     9 preservadas |
| clases de sensibilidad                        |                         5 | 5 preservadas sin reclasificación |
| ejes taxonómicos corporativos                 | no existía contrato único |                       4 definidos |
| taxonomías inferidas desde buckets o carpetas |            no autorizadas |                                 0 |
| cambios físicos                               |                         0 |                                 0 |
| cambios en requisitos de prueba               |                         0 |                                 0 |

Cada objeto o representación concreta que se materialice dentro de un `DOCCTX-*` deberá resolver los ejes de esta taxonomía sin modificar el identificador, la finalidad, la propietaria funcional ni el piso de sensibilidad del contexto.

---

#### 16. Correspondencia entre original físico y copia digital

La evidencia actual confirma existencia de originales físicos en `Oficina 1`, pero no demuestra una correspondencia completa entre cada original físico y sus representaciones digitales.

Esta tarea fija únicamente las reglas taxonómicas:

1. el original físico conserva su condición cuando exista evidencia suficiente de que es la representación fuente;
2. un escaneo, fotografía o transcripción es copia o derivado hasta que exista una regla posterior que determine otra condición;
3. la copia digital deberá conservar una relación resoluble con su fuente cuando la correspondencia sea necesaria;
4. la ubicación de la copia no demuestra autenticidad;
5. la presencia de hash no demuestra por sí sola que una copia corresponda al original físico;
6. el custodio de la copia puede ser distinto del custodio del original sin transferir propiedad funcional;
7. las comprobaciones de autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia pertenecen a `INFO-DOM-007`.

---

#### 17. Fronteras con tareas posteriores

| Materia                                                                                          | Decisión de INFO-DOM-003                                                                                 | Tarea propietaria de desarrollo posterior       |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| estados, borrador, aprobación, publicación, vigencia, sustitución, anulación, retiro y versiones | no se redefinen; la taxonomía solo identifica el objeto y sus relaciones                                 | `INFO-DOM-004`                                  |
| metadatos obligatorios, almacenamiento, búsqueda, localización y vínculo físico con recursos     | no se materializa esquema de persistencia; solo se fijan las dimensiones semánticas que deberá conservar | `INFO-DOM-005`                                  |
| retención, evento de cómputo, archivo, legal hold, anonimización, eliminación y certificado      | no se fijan plazos ni operaciones de disposición                                                         | `INFO-DOM-006`                                  |
| autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia        | no se certifica originalidad ni equivalencia técnica                                                     | `INFO-DOM-007`                                  |
| aprobación, aceptación, firma electrónica y firma digital                                        | no se equiparan firma, imagen, aceptación ni aprobación                                                  | `INFO-DOM-011`                                  |
| permisos de consulta, obtención de archivo, impresión, exportación o compartición                | la taxonomía no concede autoridad                                                                        | `INFO-AUTH-001` y `INFO-AUTH-002`               |
| objetos actuales de Storage y su mapeo a recurso/contexto                                        | no se infiere taxonomía desde bucket o ruta                                                              | `INFO-DOM-005` y las tareas EVID-ARC aplicables |

Ninguna frontera posterga el resultado principal: la taxonomía corporativa y las reglas de relación quedan definidas completamente en esta tarea.

---

#### 18. Estados de resolución documental

Para aplicar la taxonomía a evidencia real se utilizan únicamente estados de certeza ya compatibles con el plan:

- `ESPECIFICADO`: la regla taxonómica está definida documentalmente;
- `PENDIENTE_DE_EVIDENCIA`: falta evidencia para resolver una dimensión concreta de un objeto real, por ejemplo la condición de original o la correspondencia fuente-copia;
- `BLOQUEADO`: un objeto no puede declararse gobernado cuando carece de recurso, contexto o fuente suficientemente resolubles para la operación que se pretende;
- `NO_APLICA`: una dimensión no corresponde al objeto y existe razón explícita para ello.

La ausencia de evidencia no se interpreta como `NO_APLICA`, y una clasificación técnica no reemplaza la decisión documental.

---

#### 19. Decisiones corporativas de cierre

1. Documento, registro y evidencia quedan como funciones distintas y combinables, no como sinónimos.
2. Serie documental y expediente quedan como agrupaciones lógicas distintas; ninguna equivale a carpeta o Storage.
3. Original y copia se resuelven por representación y procedencia, no por formato, ubicación, fecha o nombre.
4. Archivo o blob es una representación técnica y no una categoría empresarial suficiente.
5. Una copia no adquiere propiedad funcional ni autoridad sobre su fuente.
6. Exportaciones, snapshots, screenshots, previews, thumbnails, caches, backups y sincronizaciones se tratan como copias o réplicas derivadas según su función, nunca como fuente automática.
7. Un escaneo de original físico es una copia digital vinculada hasta que una regla posterior demuestre otra condición.
8. Un expediente referencia objetos de otros procesos sin apropiarlos ni duplicarlos por defecto.
9. Una serie agrupa por función empresarial, no por estructura técnica.
10. Los 69 `VPROC-*`, 332 `DOCCTX-*`, 9 propietarias funcionales y 5 clases de sensibilidad permanecen intactos.
11. No se infiere taxonomía desde los 14 buckets ni desde sus banderas técnicas.
12. No se ejecuta ningún cambio de código, Supabase, Storage, datos, RLS, migraciones o configuración.

---

#### 20. Cobertura de riesgos heredados

La taxonomía cierra documentalmente las brechas de confusión entre información, documento, registro, evidencia, archivo y expediente; también establece la regla necesaria para diferenciar originales físicos de copias digitales y para impedir que una representación técnica adquiera autoridad sobre su fuente.

Los comportamientos ejecutables de persistencia, acceso, protección, reconciliación, ciclo de vida, copias, integridad y disposición ya se encuentran protegidos por el registro canónico vigente. Esta tarea no introduce un comportamiento ejecutable nuevo; define el vocabulario y las relaciones que esos controles deberán consumir.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea define una taxonomía semántica y documental sobre objetos, agrupaciones y representaciones ya cubiertos por controles existentes. No introduce una nueva transición ejecutable, cálculo, autorización, mutación, integración física, política de Storage, operación de retención, mecanismo de firma ni comportamiento de aplicación distinto. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 22. Criterios de aceptación

- [x] Información, dato personal, documento, registro, evidencia y archivo/blob quedan explícitamente separados.
- [x] Tipo documental, serie documental, expediente, carpeta y ubicación de Storage quedan explícitamente separados.
- [x] Documento, registro y evidencia se modelan como funciones combinables y no como categorías forzosamente excluyentes.
- [x] Serie y expediente tienen reglas distintas de agrupación y ninguna transfiere propiedad funcional.
- [x] Original y copia se resuelven por representación y procedencia, sin inferencia por ruta, bucket, formato, fecha o nombre.
- [x] Se define el tratamiento taxonómico de plantilla, formulario completado, acta, política, contrato, fila transaccional, log, fotografía, archivo, carpeta, bucket, snapshot, exportación, screenshot, impresión, escaneo, OCR, preview, thumbnail, caché, sincronización offline y backup.
- [x] Las copias controladas, de trabajo, derivadas, de transferencia, de contingencia y réplicas técnicas conservan relación con su fuente sin adquirir autoridad automática.
- [x] La correspondencia original físico ↔ copia digital queda definida taxonómicamente sin inventar cadena de custodia o autenticidad no comprobadas.
- [x] Los 69 procesos `VPROC-*` permanecen sin renombrar, fusionar o eliminar.
- [x] Las 332 claves `DOCCTX-*` permanecen sin renombrar, fusionar o eliminar.
- [x] Las 9 aplicaciones propietarias funcionales permanecen sin modificación.
- [x] Las cinco clases S0–S4 permanecen sin reclasificación.
- [x] Ningún bucket, carpeta, ruta, tabla, schema, extensión o nombre de archivo se usa como taxonomía empresarial automática.
- [x] Las fronteras de `INFO-DOM-004`, `INFO-DOM-005`, `INFO-DOM-006`, `INFO-DOM-007`, `INFO-DOM-011`, `INFO-AUTH-001` e `INFO-AUTH-002` permanecen reservadas.
- [x] No se realizan cambios físicos ni de Supabase.
- [x] No se crean ni modifican requisitos de prueba.
- [x] `INFO-DOM-004` permanece reservada y no iniciada.

---

#### 23. Resultado y continuidad

VENTO queda con una taxonomía documental corporativa única capaz de distinguir función, agrupación, originalidad y representación sin crear una fuente paralela, sin degradar clasificación y sin convertir infraestructura técnica en identidad documental.

La cadena documental resultante queda definida así:

```text
VPROC-* + recurso empresarial
→ objeto informacional
→ documento / registro / evidencia
→ serie y/o expediente cuando corresponda
→ original o copia por representación
→ clasificación y manejo heredados
→ ciclo, metadatos, retención, autenticidad y autorización en sus tareas propietarias
```

ÚLTIMA TAREA APROBADA

`INFO-DOM-002 — Definir clasificación, sensibilidad, minimización y manejo por categoría de información`

TAREA ACTUAL APROBADA

`INFO-DOM-003 — Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias`

SIGUIENTE TAREA RESERVADA

`INFO-DOM-004 — Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro`


### ✅ INFO-DOM-004 — Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro

**Estado:** APROBADA
**Tarea anterior:** `INFO-DOM-003 — Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias` — APROBADA
**Tarea siguiente:** `INFO-DOM-005 — Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales` — RESERVADA
**Tipo de tarea:** documental; materialización transversal del contrato corporativo de ciclo documental, estados, versionado, vigencia, sustitución, anulación y retiro
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md`
**Universo heredado:** 69 procesos `VPROC-*` y 332 identidades contextuales `DOCCTX-*`
**Contrato materializado:** `INFO-DOCUMENT-LIFECYCLE-CONTRACT-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, Storage, buckets, objetos, migraciones, funciones, jobs, datos, configuración ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** convertir la taxonomía documental aprobada y el ciclo operativo EVID ya materializado en un contrato corporativo único que permita saber qué versión existe, qué estado de preparación tiene, desde cuándo produce efecto, si está publicada, cuál versión sustituyó a otra y por qué una versión dejó de ser utilizable, sin sobrescribir historia ni confundir retiro, vencimiento, anulación, archivo o disposición.

---

#### 1. Propósito y resultado sustantivo

La tarea cierra la brecha transversal de ciclo documental mediante cuatro resultados coordinados:

1. `INFO-DOCUMENT-LIFECYCLE-CONTRACT-001`: sobre corporativo de estado documental con ejes independientes de preparación, vigencia, publicación y referencia de retención.
2. `INFO-DOCUMENT-VERSIONING-RULES-001`: reglas no destructivas de identidad, versión, corrección, sustitución y reconstrucción histórica.
3. `INFO-DOCUMENT-STATE-TRANSITION-CATALOG-001`: catálogo de transiciones permitidas y sus efectos documentales.
4. `INFO-DOCUMENT-LIFECYCLE-MATRIX-001`: decisión explícita para las 332 identidades `DOCCTX-*` heredadas.

La tarea no crea un repositorio central ni un ciclo físico de Storage. Cada aplicación propietaria conserva el hecho empresarial; el contrato transversal determina cómo interpretar el estado documental y su historia.

Resultado cuantitativo:

| Control                              | Resultado |
| ------------------------------------ | --------: |
| procesos `VPROC-*` recibidos         |        69 |
| procesos preservados                 |        69 |
| identidades `DOCCTX-*` recibidas     |       332 |
| identidades con contrato de ciclo    |       332 |
| identidades omitidas                 |         0 |
| identidades duplicadas               |         0 |
| propietarias funcionales modificadas |         0 |
| clases S0–S4 modificadas             |         0 |
| cambios físicos                      |         0 |
| cambios en requisitos de prueba      |         0 |

---

#### 2. Fuentes y decisiones heredadas

Se conservan como entradas obligatorias:

- `INFO-DOM-001`: propiedad funcional, finalidad y frontera de gobierno por proceso;
- `INFO-DOM-002`: clasificación S0–S4, minimización, manejo y publicación controlada;
- `INFO-DOM-003`: taxonomía corporativa de documento, registro, evidencia, serie, expediente, original, copia y representación;
- `CAP-SCOPE-016`: secuencia documental desde recepción o plantilla hasta disposición y las brechas de versionado, vigencia y operación offline;
- `NFR-REQ-006`: historia no destructiva, tiempo efectivo, trazabilidad, retención y distinción entre archivo, hold y disposición;
- `EVID-ARC-004`: identidad lógica, versión documental, metadatos mínimos y vínculo resoluble con proceso/recurso;
- `EVID-ARC-005`: `LOAD_V1`, `SUBSTITUTE_V1`, `ANNUL_V1`, retención base, `RET_UNRESOLVED` y matriz explícita de 332 identidades;
- registro canónico de requisitos de prueba: cobertura vigente del ciclo documental y de la persistencia no destructiva.

Invariantes que esta tarea no cambia:

- `document_id` identifica el objeto lógico y no una ruta, archivo o representación;
- una versión aprobada o preservada no se sobrescribe para representar contenido o estado distinto;
- la sustitución conserva la versión anterior;
- la anulación conserva el hecho original;
- la recepción técnica no equivale a vigencia, aprobación o publicación;
- las 332 identidades mantienen la distribución de retención base 33/184/36/66/13;
- las fronteras EVID heredadas permanecen 73 `NINGUNO`, 245 `FRONTERA_OBLIGATORIA` y 14 `APLICACION_DIFERIDA`;
- las 332 políticas definitivas de retención permanecen `RET_UNRESOLVED` bajo `INFO-DOM-006`;
- AURA conserva su condición de aplicación diferida donde ya fue aprobada.

---

#### 3. Distinciones obligatorias del ciclo documental

```text
documento lógico
≠ versión documental
≠ representación física o digital
≠ estado de preparación
≠ estado de vigencia
≠ estado de publicación
≠ estado de retención
```

```text
BORRADOR
≠ APROBADO
≠ PUBLICADO
≠ VIGENTE
```

```text
SUSTITUIDO
≠ VENCIDO
≠ RETIRADO
≠ ANULADO
≠ ARCHIVADO
≠ ELIMINADO
```

```text
CARGADO O RECIBIDO
≠ VALIDADO TÉCNICAMENTE
≠ APROBADO
≠ VIGENTE
```

Reglas:

1. un único campo de estado no puede representar correctamente todos estos ejes;
2. la publicación es una condición de exposición, no prueba de vigencia ni de aprobación;
3. el archivo pertenece al ciclo de retención y no significa que la versión haya sido anulada;
4. la eliminación o disposición no es un estado documental de esta tarea;
5. la aprobación documental no define por sí sola la fuerza de una firma, aceptación o evidencia; esa materia permanece en `INFO-DOM-011`;
6. la ubicación técnica no determina ninguno de los estados anteriores.

---

#### 4. Sobre corporativo de estado `INFO-DOCUMENT-LIFECYCLE-CONTRACT-001`

Toda versión materializada deberá poder resolver conceptualmente:

```text
document_id
document_version_id
version_sequence
version_created_at
preparation_state
validity_state
effective_from
effective_until
publication_state
supersedes_version_ref
corrects_version_ref
annuls_version_ref
state_reason_code
state_effective_at
state_authority_ref
retention_class_ref
retention_policy_ref
retention_state_ref
```

Esta lista define semántica corporativa, no columnas físicas. El esquema de metadatos, persistencia y búsqueda corresponde a `INFO-DOM-005`.

##### 4.1. Estado de preparación

| Código      | Significado                                                              | Regla                                                                                                    |
| ----------- | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
| `RECEIVED`  | versión recibida desde un tercero, canal o fuente externa                | recepción no demuestra aprobación, vigencia ni integridad                                                |
| `RECORDED`  | registro o evidencia materializados como resultado de un hecho o captura | no se fuerza un borrador ficticio cuando el objeto nace como registro                                    |
| `DRAFT`     | contenido en preparación que todavía no superó el control aplicable      | no puede presentarse como versión aprobada o vigente                                                     |
| `IN_REVIEW` | versión candidata sometida al control de revisión aplicable              | el contenido candidato queda identificable y cualquier cambio material produce otra candidata trazable   |
| `REJECTED`  | candidata que no superó el control de revisión                           | permanece en historia y nunca adquiere vigencia por sí sola                                              |
| `APPROVED`  | candidata que superó el control de aprobación aplicable                  | puede seguir sin vigencia o sin publicación; la semántica de la aprobación se completa en `INFO-DOM-011` |

`RECEIVED`, `RECORDED` y `DRAFT` son entradas alternativas según la naturaleza del objeto; no todos los documentos deben atravesar artificialmente todos los estados.

##### 4.2. Estado de vigencia

| Código          | Significado                                                            | Regla                                                             |
| --------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `NOT_EFFECTIVE` | versión materializada que todavía no produce efecto empresarial        | una aprobación futura o una recepción no la convierte en vigente  |
| `CURRENT`       | versión aplicable al alcance y tiempo resueltos                        | debe poder reconstruirse por alcance y fecha efectiva             |
| `SUPERSEDED`    | dejó de ser vigente porque una sucesora válida asumió el mismo alcance | conserva historia y vínculo con la sucesora                       |
| `EXPIRED`       | dejó de ser vigente por vencimiento temporal o condición tipada        | no implica anulación ni eliminación                               |
| `WITHDRAWN`     | fue retirada deliberadamente del uso futuro por autoridad aplicable    | no declara falso o inexistente su uso histórico válido            |
| `ANNULLED`      | fue invalidada mediante un hecho explícito de anulación                | conserva la versión, el motivo, la autoridad y la historia previa |

##### 4.3. Estado de publicación

| Código          | Significado                                           | Regla                                                                            |
| --------------- | ----------------------------------------------------- | -------------------------------------------------------------------------------- |
| `NOT_PUBLISHED` | no existe proyección publicada activa                 | no implica que la versión sea borrador o no vigente                              |
| `PUBLISHED`     | existe una proyección publicada autorizada            | solo puede exponerse conforme a clasificación, finalidad y autorización vigentes |
| `UNPUBLISHED`   | una proyección antes publicada fue retirada del canal | no cambia por sí sola la historia, vigencia o retención de la versión fuente     |

##### 4.4. Estado de retención

Los estados de retención permanecen bajo el contrato heredado y se referencian sin fusionarlos con el ciclo documental:

```text
ACTIVE
INACTIVE
ARCHIVE_PENDING
ARCHIVED
ELIGIBLE_FOR_DISPOSITION
```

Y sus condiciones transversales, entre otras:

```text
HOLD_ACTIVE
PRESERVATION_REQUIRED
DISPOSITION_BLOCKED
POLICY_UNRESOLVED
```

`INFO-DOM-004` no fija plazos, triggers definitivos, legal hold, anonimización, eliminación ni certificado; esas decisiones pertenecen a `INFO-DOM-006`.

---

#### 5. Perfiles de entrada al ciclo

| Perfil                | Entrada documental típica                                                                 | Estado de preparación inicial | Aplicación                                                                              |
| --------------------- | ----------------------------------------------------------------------------------------- | ----------------------------- | --------------------------------------------------------------------------------------- |
| `AUTHORED_CONTROLLED` | política, procedimiento, plantilla, informe, contrato o contenido elaborado internamente  | `DRAFT`                       | usa revisión/aprobación cuando el proceso lo exija                                      |
| `RECEIVED_CONTROLLED` | documento de tercero, soporte recibido, certificado externo o comunicación formal         | `RECEIVED`                    | conserva origen; su aceptación o uso empresarial se resuelve sin fingir autoría interna |
| `RECORDED_FACT`       | registro transaccional, evento, log gobernado, captura o evidencia producida por un hecho | `RECORDED`                    | preserva el hecho fuente y no inventa una etapa de borrador                             |

El perfil no altera taxonomía, propietaria ni sensibilidad. Una misma identidad `DOCCTX-*` puede contener instancias de perfiles distintos cuando su descripción agrupe más de un artefacto; cada instancia concreta deberá resolver su perfil sin partir ni renombrar la identidad contextual.

---

#### 6. Catálogo de transiciones documentales

| Transición             | Entrada                                                   | Resultado                                    | Invariante                                                           |
| ---------------------- | --------------------------------------------------------- | -------------------------------------------- | -------------------------------------------------------------------- |
| `CREATE_DRAFT`         | nuevo objeto elaborado internamente                       | `DRAFT`                                      | crea identidad o versión candidata conforme al vínculo empresarial   |
| `RECEIVE_VERSION`      | versión externa recibida                                  | `RECEIVED`                                   | conserva referencia de origen y no concede vigencia automática       |
| `RECORD_FACT`          | hecho o evidencia materializados                          | `RECORDED`                                   | conserva causalidad y no se presenta como borrador                   |
| `SUBMIT_REVIEW`        | `DRAFT`                                                   | `IN_REVIEW`                                  | identifica la candidata sometida a revisión                          |
| `REJECT_VERSION`       | `IN_REVIEW`                                               | `REJECTED`                                   | conserva candidata y motivo; no reescribe la historia                |
| `APPROVE_VERSION`      | `IN_REVIEW`                                               | `APPROVED`                                   | no equivale todavía a publicación ni a vigencia                      |
| `MAKE_EFFECTIVE`       | versión apta según su perfil                              | `CURRENT`                                    | fija `effective_from` y alcance resolubles                           |
| `PUBLISH_PROJECTION`   | versión autorizada para el canal                          | `PUBLISHED`                                  | publicación y vigencia permanecen ejes separados                     |
| `UNPUBLISH_PROJECTION` | proyección publicada                                      | `UNPUBLISHED`                                | retira la exposición sin borrar la fuente                            |
| `SUPERSEDE_VERSION`    | versión `CURRENT` + sucesora apta                         | predecesora `SUPERSEDED`; sucesora `CURRENT` | el cambio ocurre en el instante efectivo de la sucesora              |
| `EXPIRE_VERSION`       | versión `CURRENT` que alcanza su límite aplicable         | `EXPIRED`                                    | vencimiento no borra ni anula                                        |
| `WITHDRAW_VERSION`     | versión utilizable retirada por decisión                  | `WITHDRAWN`                                  | preserva uso histórico y autoridad de la decisión                    |
| `ANNUL_VERSION`        | versión materializada con autoridad y motivo de anulación | `ANNULLED`                                   | crea un hecho nuevo; no elimina la versión afectada                  |
| `CORRECT_BY_SUCCESSOR` | versión que requiere corrección material                  | nueva versión enlazada                       | la corrección material no muta silenciosamente una versión histórica |

No se define una transición de eliminación física en este catálogo.

---

#### 7. Contrato de versionado no destructivo

1. `document_id` permanece estable mientras continúen la misma identidad lógica y el mismo recurso empresarial gobernante.
2. Cada contenido materializado que deba conservarse como versión recibe un `document_version_id` inequívoco dentro de la identidad lógica.
3. El formato visible de numeración de versión no se fija aquí; deberá poder ordenarse e interpretarse sin depender del nombre de archivo.
4. `document_version_id`, versión del recurso empresarial, versión de clasificación, versión de esquema de metadatos y versión de representación son conceptos distintos.
5. Una candidata sometida a revisión debe quedar identificable. Un cambio material posterior produce otra candidata o sucesora trazable; no altera silenciosamente la candidata ya revisada.
6. Una versión aprobada, vigente, sustituida, vencida, retirada, anulada o preservada no se sobrescribe para representar contenido diferente.
7. Una corrección material genera una nueva versión o un acto de corrección enlazado. Una corrección puramente administrativa de metadatos no puede alterar el contenido ni su significado y debe conservar auditoría; el detalle de metadatos pertenece a `INFO-DOM-005`.
8. Versiones rechazadas permanecen reconstruibles cuando constituyan historia necesaria del control; rechazo no autoriza su eliminación.
9. Una nueva representación del mismo contenido no crea automáticamente una nueva versión documental; la relación entre representaciones y equivalencia técnica se completa en `INFO-DOM-007`.
10. Un cambio de significado empresarial, recurso gobernante o identidad documental exige un nuevo `document_id`, aunque el archivo se parezca o provenga de una versión anterior.

---

#### 8. Vigencia y reconstrucción temporal

La vigencia se resuelve por tiempo efectivo y alcance empresarial, no por orden de carga.

Una versión puede ser `CURRENT` para un instante y alcance únicamente cuando:

- la versión existe y su perfil permite entrada en vigencia;
- `effective_from` ya ocurrió;
- `effective_until`, cuando exista, no ha sido superado;
- no existe una anulación o retiro efectivo que la invalide para ese instante;
- no ha sido sustituida por una sucesora efectiva para el mismo alcance;
- clasificación, finalidad, recurso y autoridad aplicables continúan resolubles.

Reglas:

1. una versión aprobada con fecha futura permanece `NOT_EFFECTIVE` hasta su fecha efectiva;
2. la versión aplicable a una fecha histórica debe ser reconstruible sin usar como sustituto `created_at`, fecha de carga o último archivo disponible;
3. la sustitución programada no retira a la predecesora antes de que la sucesora sea efectivamente aplicable;
4. intervalos superpuestos para la misma identidad, mismo alcance y misma finalidad quedan `BLOQUEADO` hasta resolver la autoridad de vigencia, salvo que el propio dominio demuestre alcances distintos y compatibles;
5. una fecha retroactiva requiere autoridad y motivo explícitos y no reescribe eventos históricos ya ocurridos;
6. `effective_from`, `effective_until`, recepción, registro, persistencia y sincronización no se confunden entre sí;
7. acceder con frecuencia a una versión no extiende su vigencia ni su retención.

---

#### 9. Sustitución

La sustitución corporativa mantiene la regla `SUBSTITUTE_V1` y la refina:

1. solo existe sustitución cuando predecesora y sucesora representan la misma identidad lógica y el mismo recurso empresarial gobernante;
2. la sucesora recibe una versión nueva y enlaza de forma resoluble a la versión sustituida;
3. la predecesora permanece vigente hasta el `effective_from` válido de la sucesora;
4. si la candidata sucesora es rechazada, anulada antes de entrar en vigencia o no supera los controles aplicables, la versión vigente previa no se retira por la sola existencia de la candidata;
5. al entrar la sucesora en vigencia, la predecesora pasa a `SUPERSEDED` para el alcance correspondiente;
6. una sustitución no reescribe copias, derivados, exportaciones, impresiones o registros históricos; estos conservan su referencia a la versión que realmente utilizaron;
7. una sustitución no rebaja clasificación ni amplía autoridad;
8. cuando el nuevo objeto cambia de significado o recurso gobernante se crea otra identidad, no una falsa sustitución.

---

#### 10. Anulación

La anulación corporativa mantiene `ANNUL_V1` y fija estas reglas:

1. anular es registrar un hecho nuevo y trazable sobre una versión existente;
2. la versión anulada conserva identidad, contenido, clasificación, relaciones, procedencia e historia que deban preservarse;
3. toda anulación requiere versión afectada, motivo tipado, autoridad aplicable y momento efectivo;
4. una anulación no se representa como si la versión nunca hubiese existido;
5. la anulación no ejecuta eliminación física, anonimización, purga ni disposición;
6. la anulación no vence un hold ni modifica por sí sola la política de retención;
7. una anulación retroactiva, cuando el dominio la permita, debe conservar explícitamente la diferencia entre momento de decisión y momento de efecto;
8. si una anulación fue ordenada por error, la corrección se registra mediante un nuevo hecho o versión autorizados; no se borra la anulación del historial.

---

#### 11. Vencimiento, retiro, anulación y despublicación

| Condición     | Qué significa                                                            | Qué no significa                                                 |
| ------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| `SUPERSEDED`  | otra versión asumió el mismo alcance                                     | que la versión anterior fuese inválida durante su vigencia       |
| `EXPIRED`     | terminó su vigencia por tiempo o condición definida                      | anulación, retiro deliberado o eliminación                       |
| `WITHDRAWN`   | una autoridad decidió detener su uso futuro                              | que el hecho histórico nunca hubiera sido válido                 |
| `ANNULLED`    | existe un acto que invalida la versión en el alcance y tiempo declarados | borrado de historia o disposición                                |
| `UNPUBLISHED` | se retiró la proyección de un canal de publicación                       | que la versión fuente haya dejado automáticamente de ser vigente |
| `ARCHIVED`    | el objeto se encuentra en estado de archivo según retención              | vencimiento, retiro, anulación o falta de autoridad              |

El estado de una copia o representación no cambia la verdad histórica de la versión fuente.

---

#### 12. Publicación, vigencia y clasificación

1. `PUBLISHED` no concede por sí solo clasificación pública.
2. Una proyección abierta solo puede operar como `S0_PUBLIC` cuando la versión publicada, aprobada cuando aplique y vigente esté expresamente autorizada para divulgación abierta por la política de clasificación.
3. Borradores, candidatas en revisión, fuentes, comentarios, historial y metadatos no heredan `S0_PUBLIC` de una proyección publicada.
4. Despublicar o retirar una versión detiene la proyección futura correspondiente, pero no elimina la historia de publicación.
5. Una versión sustituida puede seguir siendo consultable históricamente bajo autorización sin continuar como proyección vigente.
6. Publicar una nueva versión no modifica retroactivamente exportaciones, impresiones o evidencias emitidas con versiones anteriores.

---

#### 13. Plantillas e instancias emitidas

1. Plantilla e instancia emitida son objetos distintos conforme a la taxonomía aprobada.
2. Cada instancia debe poder referenciar la versión de plantilla o fuente utilizada cuando esa relación sea necesaria para interpretación histórica.
3. Aprobar o publicar una nueva versión de plantilla no modifica instancias ya emitidas.
4. Retirar una plantilla impide su uso futuro cuando así lo determine el proceso, pero no vuelve inválidas automáticamente las instancias históricas creadas correctamente.
5. La vigencia de la plantilla y la vigencia de cada instancia son independientes.
6. Una corrección material de una instancia sigue su propio ciclo; no se resuelve cambiando la plantilla de origen.

---

#### 14. Registros, evidencia, originales y copias

1. Un registro o evidencia puede nacer como `RECORDED` sin atravesar `DRAFT` o `IN_REVIEW`.
2. Un documento recibido puede nacer como `RECEIVED`; su recepción no equivale a aceptación, aprobación, integridad técnica o vigencia.
3. Una evidencia preservada no se muta para reflejar una corrección del hecho; se agrega evidencia o un hecho de corrección enlazado.
4. Original y copia conservan su relación de procedencia durante todo el ciclo; una copia actualizada no se convierte en original por ser más reciente.
5. Duplicar una representación sin cambiar significado no crea una nueva versión empresarial por sí solo.
6. Editar materialmente una copia no puede presentarse como si fuese la misma representación fuente; deberá resolverse como nueva versión, derivado o documento distinto según la taxonomía y la procedencia aplicables.
7. El retiro, vencimiento o anulación de la fuente no destruye automáticamente copias que deban conservarse por evidencia o retención; su tratamiento posterior deberá reconciliarse bajo las tareas propietarias.

---

#### 15. Series y expedientes

La serie y el expediente son agrupaciones y no sustituyen el ciclo individual de sus miembros.

Para expedientes se fija un ciclo mínimo de agrupación:

```text
OPEN
→ CLOSED
```

`REOPEN` es un evento auditable que lleva un expediente `CLOSED` nuevamente a `OPEN` sin borrar el cierre anterior.

Reglas:

1. cerrar un expediente no vuelve automáticamente vencidos, retirados o anulados sus documentos;
2. el cierre puede convertirse después en trigger de retención cuando `INFO-DOM-006` así lo materialice, pero esta tarea no fija ese trigger;
3. un documento añadido después del cierre exige reapertura o un mecanismo explícito de incorporación tardía que preserve autor, fecha, motivo y relación con el cierre;
4. reabrir el expediente no reactiva automáticamente versiones documentales vencidas, retiradas o anuladas;
5. la pertenencia a una serie conserva identidad y versión de cada objeto; la serie no crea una versión colectiva ficticia;
6. el retiro de una serie de uso operativo no determina disposición de sus miembros.

---

#### 16. Concurrencia, operación offline e idempotencia

1. Repetir la misma intención identificada de carga, sustitución o anulación no puede crear dos versiones o dos efectos documentales equivalentes.
2. Dos candidatas concurrentes que pretendan sustituir la misma versión vigente no se resuelven por “última escritura”; la autoridad debe quedar determinada y el conflicto conservarse.
3. Una operación offline no puede presentarse como `CURRENT`, `SUPERSEDED`, `WITHDRAWN` o `ANNULLED` hasta que el resultado autoritativo correspondiente sea resoluble.
4. La reconciliación conserva instante del hecho, instante local, recepción, commit y sincronización; no sustituye todos esos tiempos por el momento de reconexión.
5. Ante respuesta perdida o resultado desconocido, el consumidor consulta el estado autoritativo antes de crear una nueva intención con efecto distinto.
6. Cambiar actor, dispositivo, área o sesión no transfiere automáticamente una candidata documental pendiente a otro contexto.
7. Un conflicto no resuelto queda `BLOQUEADO`; no se oculta el estado intermedio para aparentar una única versión vigente.

---

#### 17. Fronteras con tareas posteriores

| Materia                                                                                   | Decisión de INFO-DOM-004                                                          | Tarea propietaria posterior       |
| ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------- |
| metadatos físicos, persistencia, localización, búsqueda y vínculo técnico                 | se define la semántica que deben conservar; no se crea esquema físico             | `INFO-DOM-005`                    |
| retención definitiva, trigger, mínimos/máximos, archivo, legal hold y disposición         | se preservan las referencias y estados heredados; no se fijan plazos ni ejecución | `INFO-DOM-006`                    |
| autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia | no se certifica equivalencia o autenticidad de versiones/representaciones         | `INFO-DOM-007`                    |
| avisos, fundamento, consentimiento y revocación                                           | no se determina fundamento jurídico de vigencia o tratamiento                     | `INFO-DOM-008`                    |
| compartición y terceros                                                                   | no se concede autoridad ni se propaga físicamente un cambio de versión            | `INFO-DOM-010`                    |
| aprobación, aceptación y firmas                                                           | solo se define su efecto dentro del ciclo; no su nivel de evidencia ni método     | `INFO-DOM-011`                    |
| permisos para crear, revisar, aprobar, retirar o anular                                   | no se asignan roles o permisos                                                    | `INFO-AUTH-001` a `INFO-AUTH-004` |
| implementación de sincronización documental                                               | se fija el resultado idempotente y reconciliable; no se crea integración          | `INFO-INT-001` y `INFO-INT-002`   |

Ninguna frontera posterga el resultado principal: el ciclo corporativo, sus estados, versionado, vigencia, sustitución, anulación y retiro quedan definidos completamente en esta tarea.

---

#### 18. Matriz corporativa de ciclo — 332 de 332

Todas las identidades reciben el contrato `INFO_DOCUMENT_LIFECYCLE_V1`. La fila no impone un estado actual a objetos que todavía no existen; materializa las reglas que debe resolver cualquier instancia concreta del contexto.

| ID contextual          | Proceso      | Contrato de ciclo            | Versionado        | Vigencia         | Retención heredada   | Frontera heredada      | Estado         |
| ---------------------- | ------------ | ---------------------------- | ----------------- | ---------------- | -------------------- | ---------------------- | -------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `APLICACION_DIFERIDA`  | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ARCHIVAL`       | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_RELATIONSHIP`   | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_OBLIGATION`     | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `NINGUNO`              | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_ACTIVE_CASE`    | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `INFO_DOCUMENT_LIFECYCLE_V1` | `NON_DESTRUCTIVE` | `EFFECTIVE_TIME` | `RET_BUSINESS_CYCLE` | `FRONTERA_OBLIGATORIA` | `ESPECIFICADO` |

---

#### 19. Reconciliación cuantitativa

| Control                                       | Resultado |
| --------------------------------------------- | --------: |
| `DOCCTX-*` esperadas                          |       332 |
| `DOCCTX-*` materializadas                     |       332 |
| claves únicas                                 |       332 |
| faltantes                                     |         0 |
| duplicados                                    |         0 |
| perfiles `INFO_DOCUMENT_LIFECYCLE_V1`         |       332 |
| versionado `NON_DESTRUCTIVE`                  |       332 |
| vigencia `EFFECTIVE_TIME`                     |       332 |
| retención base heredada                       |       332 |
| políticas definitivas de retención inventadas |         0 |
| propietarias funcionales modificadas          |         0 |
| clasificaciones mínimas modificadas           |         0 |

Distribución de retención base preservada:

| Clase                | Entradas |
| -------------------- | -------: |
| `RET_ACTIVE_CASE`    |       33 |
| `RET_BUSINESS_CYCLE` |      184 |
| `RET_RELATIONSHIP`   |       36 |
| `RET_OBLIGATION`     |       66 |
| `RET_ARCHIVAL`       |       13 |
| **Total**            |  **332** |

Fronteras preservadas:

| Frontera               | Entradas |
| ---------------------- | -------: |
| `NINGUNO`              |       73 |
| `FRONTERA_OBLIGATORIA` |      245 |
| `APLICACION_DIFERIDA`  |       14 |
| **Total**              |  **332** |

---

#### 20. Estados de resolución

- `ESPECIFICADO`: la identidad contextual recibe el contrato corporativo y las reglas son suficientes para diseñar consumidores posteriores.
- `PENDIENTE_DE_EVIDENCIA`: una instancia real no puede resolver aún autoridad, fecha efectiva, correspondencia de versión u otra dimensión exigida por el contrato.
- `BLOQUEADO`: existe conflicto de vigencia, identidad, sucesión, autoridad o resultado y no puede declararse una versión vigente hasta resolverlo.
- `NO_APLICA`: una dimensión concreta no corresponde a la instancia y existe razón explícita; la ausencia de evidencia no se convierte en `NO_APLICA`.

El `RET_POLICY_PENDING` heredado no bloquea la definición documental de esta tarea; bloquea la disposición automática y la certificación de retención hasta `INFO-DOM-006`.

---

#### 21. Decisiones corporativas de cierre

1. El estado documental queda modelado como un sobre de ejes independientes y no como una enumeración única que mezcle aprobación, vigencia, publicación y retención.
2. `APPROVED` no equivale a `CURRENT`; una versión puede aprobarse antes de su fecha efectiva.
3. `PUBLISHED` no equivale a `CURRENT` ni convierte por sí solo la información en pública.
4. La versión aplicable se resuelve por identidad, alcance y tiempo efectivo, no por último archivo o último timestamp técnico.
5. Sustituir crea una sucesora y preserva la predecesora; no se sobrescribe historia.
6. Una candidata no retira la versión vigente antes de convertirse efectivamente en sucesora.
7. Anular crea un hecho trazable y conserva la versión afectada; no equivale a eliminación.
8. Vencimiento, retiro, anulación, despublicación y archivo quedan explícitamente separados.
9. Una corrección material crea una nueva versión o acto de corrección enlazado.
10. Plantilla e instancia tienen ciclos separados; cambiar una plantilla no altera documentos ya emitidos.
11. Registros y evidencia pueden nacer como `RECORDED`; documentos externos pueden nacer como `RECEIVED` sin forzar un borrador ficticio.
12. Series y expedientes no absorben el ciclo ni la autoridad de sus miembros.
13. Cerrar o reabrir un expediente no cambia automáticamente vigencia de sus documentos.
14. Conflictos concurrentes u offline no se resuelven mediante última escritura ni se presentan como éxito mientras el resultado sea indeterminado.
15. Las 332 identidades, 69 procesos, 9 propietarias y cinco clases S0–S4 permanecen intactos.
16. No se ejecuta ningún cambio físico, Supabase, Storage, código, configuración o dato.

---

#### 22. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa y materializa documentalmente estados, versionado, vigencia, sustitución, anulación, retiro y reconstrucción temporal sobre comportamientos que ya están protegidos por la cobertura transversal vigente de documentos, persistencia no destructiva, trazabilidad, sincronización y ciclo de información. No introduce una transición física nueva, permiso, mutación de base de datos, operación de Storage, algoritmo de disposición, integración o comportamiento independiente que requiera una fila adicional. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 23. Criterios de aceptación

- [x] `INFO-DOM-003` permanece aprobada y entrega la taxonomía corporativa recibida.
- [x] los 69 `VPROC-*` permanecen sin renombrar, fusionar o eliminar.
- [x] las 332 claves `DOCCTX-*` aparecen exactamente una vez en la matriz de ciclo.
- [x] cada identidad recibe `INFO_DOCUMENT_LIFECYCLE_V1`, versionado no destructivo y vigencia por tiempo efectivo.
- [x] se distinguen estado de preparación, estado de vigencia, estado de publicación y estado de retención.
- [x] `RECEIVED`, `RECORDED`, `DRAFT`, `IN_REVIEW`, `REJECTED` y `APPROVED` tienen semántica explícita.
- [x] `NOT_EFFECTIVE`, `CURRENT`, `SUPERSEDED`, `EXPIRED`, `WITHDRAWN` y `ANNULLED` tienen semántica explícita.
- [x] `NOT_PUBLISHED`, `PUBLISHED` y `UNPUBLISHED` permanecen separados de vigencia y clasificación.
- [x] una versión aprobada puede permanecer no vigente hasta su fecha efectiva.
- [x] la versión aplicable a una fecha histórica puede reconstruirse conceptualmente por identidad, alcance y tiempo efectivo.
- [x] una sustitución no sobrescribe la predecesora y solo toma efecto cuando la sucesora es aplicable.
- [x] una anulación conserva la versión y no ejecuta disposición.
- [x] vencimiento, retiro, anulación, despublicación y archivo no se presentan como sinónimos.
- [x] la publicación controlada preserva la frontera S0–S4 aprobada.
- [x] plantilla e instancia mantienen versiones y vigencias independientes.
- [x] registros/evidencia no requieren un borrador ficticio y conservan historia no destructiva.
- [x] cierre/reapertura de expediente no muta silenciosamente sus miembros.
- [x] concurrencia y operación offline no pueden resolver conflictos mediante última escritura.
- [x] la distribución de retención 33/184/36/66/13 permanece intacta.
- [x] las fronteras 73/245/14 permanecen intactas.
- [x] las 332 políticas definitivas de retención permanecen reservadas a `INFO-DOM-006`.
- [x] `INFO-DOM-005` permanece reservada y no iniciada.
- [x] no se realizan cambios físicos ni de Supabase.
- [x] no se crean ni modifican requisitos de prueba.

---

#### 24. Resultado y continuidad

VENTO queda con un contrato corporativo único para interpretar la vida de un documento o evidencia sin confundir estado de preparación, vigencia, publicación y retención, y con una historia explícita de versiones, correcciones, sustituciones, anulaciones y retiros.

La cadena documental queda:

```text
identidad `DOCCTX-*`
→ objeto lógico y versión
→ preparación o recepción/registro
→ revisión/aprobación cuando aplique
→ vigencia por alcance y tiempo efectivo
→ publicación separada cuando aplique
→ sustitución / vencimiento / retiro / anulación
→ retención y disposición en sus tareas propietarias
```

ÚLTIMA TAREA APROBADA

`INFO-DOM-003 — Definir taxonomía de documentos, registros, evidencia, series, expedientes, originales y copias`

TAREA ACTUAL APROBADA

`INFO-DOM-004 — Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro`

SIGUIENTE TAREA RESERVADA

`INFO-DOM-005 — Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales`


### ✅ INFO-DOM-005 — Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales

**Estado:** APROBADA
**Tarea anterior:** `INFO-DOM-004 — Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro` — APROBADA
**Tarea siguiente:** `INFO-DOM-006 — Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición` — RESERVADA
**Tipo de tarea:** documental; materialización transversal del contrato corporativo de metadatos, vínculo empresarial, localización de representaciones, almacenamiento gobernado y búsqueda autorizada
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md`
**Universo heredado:** 69 procesos `VPROC-*` y 332 identidades contextuales `DOCCTX-*`
**Contratos materializados:** `INFO-DOCUMENT-METADATA-CONTRACT-001`; `INFO-DOCUMENT-RESOURCE-LINK-CONTRACT-001`; `INFO-DOCUMENT-LOCATION-STORAGE-CONTRACT-001`; `INFO-DOCUMENT-AUTHORIZED-SEARCH-CONTRACT-001`; `INFO-DOCUMENT-METADATA-SEARCH-MATRIX-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, Storage, buckets, objetos, migraciones, funciones, índices, jobs, datos, configuración ni despliegues
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir y materializar para las 332 identidades documentales un contrato corporativo que mantenga separadas la identidad lógica, la versión, las representaciones, sus localizadores y los recursos empresariales; establezca metadatos mínimos interpretables; gobierne almacenamiento sin convertir infraestructura en autoridad; y permita búsqueda y localización únicamente sobre proyecciones autorizadas, sin revelar por índices, títulos, fragmentos, rutas o metadatos la existencia de recursos fuera del alcance del actor.

---

#### 1. Propósito y resultado sustantivo

La tarea cierra la brecha transversal de metadatos, almacenamiento, búsqueda y vínculo empresarial mediante cinco resultados coordinados:

1. `INFO-DOCUMENT-METADATA-CONTRACT-001`: sobre corporativo de metadatos que extiende el núcleo EVID sin fusionar identidad, versión, clasificación, estado, representación ni ubicación.
2. `INFO-DOCUMENT-RESOURCE-LINK-CONTRACT-001`: contrato de relación entre documento, proceso, instancia y recursos empresariales, con autoridad explícita y referencias cruzadas no apropiativas.
3. `INFO-DOCUMENT-LOCATION-STORAGE-CONTRACT-001`: modelo de representación y localización que separa documento, representación, objeto técnico, ubicación física y referencia temporal de acceso.
4. `INFO-DOCUMENT-AUTHORIZED-SEARCH-CONTRACT-001`: contrato de búsqueda autorizada y minimizada que trata cualquier índice como proyección reconstruible y nunca como fuente de verdad.
5. `INFO-DOCUMENT-METADATA-SEARCH-MATRIX-001`: decisión explícita para las 332 identidades `DOCCTX-*` heredadas.

La tarea no crea un repositorio documental central obligatorio. Cada aplicación propietaria conserva el hecho empresarial y la autoridad sobre su recurso; los contratos transversales hacen que metadatos, representaciones, localizadores e índices puedan resolverse sin competir con esa autoridad.

Resultado cuantitativo:

| Control                                                  | Resultado |
| -------------------------------------------------------- | --------: |
| procesos `VPROC-*` recibidos                             |        69 |
| procesos preservados                                     |        69 |
| identidades `DOCCTX-*` recibidas                         |       332 |
| identidades con decisión explícita                       |       332 |
| identidades omitidas                                     |         0 |
| identidades duplicadas                                   |         0 |
| propietarias funcionales modificadas                     |         0 |
| clases S0–S4 modificadas                                 |         0 |
| clases de retención modificadas                          |         0 |
| fronteras heredadas modificadas                          |         0 |
| objetos de Storage promovidos a documento por inferencia |         0 |
| cambios físicos                                          |         0 |
| cambios en requisitos de prueba                          |         0 |

---

#### 2. Fuentes y decisiones heredadas

Se conservan como entradas obligatorias:

- `INFO-DOM-001`: inventario de 69 procesos, propiedad funcional, finalidad, huella técnica de schemas y Storage, y prohibición de inferir gobierno desde infraestructura;
- `INFO-DOM-002`: clasificación S0–S4, minimización y propagación de sensibilidad sobre metadatos, copias, índices y derivados;
- `INFO-DOM-003`: taxonomía que separa documento, registro, evidencia, expediente, serie, original, copia y representación;
- `INFO-DOM-004`: identidad lógica, versión y ejes separados de preparación, vigencia, publicación y retención;
- `CAP-SCOPE-016`: brechas de metadatos uniformes, vínculos con recursos y búsqueda transversal;
- `EVID-ARC-004`: `EVID_META_CORE_V1`, identidad estable, versión documental, versión de esquema de metadatos, proceso, instancia y vínculo empresarial resoluble;
- `EVID-ARC-007`: acceso temporal como decisión separada de identidad y localización persistente;
- `EVID-ARC-008`: auditoría de consulta y modificación documental;
- `EVID-ARC-010`: comportamiento de contingencia ante indisponibilidad de Storage;
- registro canónico de requisitos: cobertura vigente de búsqueda autorizada, persistencia documental, reconciliación entre aplicaciones, Storage, índices, copias y cachés.

Invariantes que esta tarea no modifica:

- `document_id` identifica el objeto lógico y no una ruta, URL, bucket, archivo o ubicación física;
- `document_context_id` resuelve exactamente a una identidad `DOCCTX-*` aprobada;
- `document_version` y `metadata_schema_version` mantienen semánticas distintas;
- `process_id` y `process_instance_id` conservan el contexto empresarial;
- `owner_app_code` conserva la propietaria funcional heredada;
- el vínculo con `resource_type` + `resource_id` se exige cuando existe un recurso empresarial específico y no se fabrica cuando no aplica;
- un identificador externo complementa la identidad VENTO y no la reemplaza;
- una URL temporal no sustituye identidad, autorización ni localización canónica;
- las 332 identidades mantienen la distribución de retención 33/184/36/66/13;
- las fronteras heredadas permanecen 73 `NINGUNO`, 245 `FRONTERA_OBLIGATORIA` y 14 `APLICACION_DIFERIDA`;
- las políticas definitivas de retención permanecen reservadas a `INFO-DOM-006`.

---

#### 3. Distinciones obligatorias

```text
document_id
≠ document_version
≠ metadata_schema_version
≠ resource_version
≠ classification_version
```

```text
documento lógico
≠ representación
≠ objeto técnico
≠ localizador
≠ referencia temporal de acceso
```

```text
recurso empresarial
≠ ubicación de Storage
≠ carpeta
≠ bucket
≠ path
≠ URL
```

```text
índice de búsqueda
≠ catálogo autoritativo
≠ permiso de lectura
≠ fuente de verdad
```

```text
metadatos
≠ contenido
≠ autorización
≠ autenticidad
```

Reglas:

1. una ubicación técnica puede cambiar sin cambiar la identidad lógica ni la versión documental;
2. una misma versión puede tener cero, una o varias representaciones válidas según su naturaleza;
3. una representación puede cambiar de localización manteniendo identidad y relación histórica;
4. una fila estructurada que sea registro o evidencia no deberá fabricar un archivo binario para satisfacer este contrato;
5. una copia, réplica, caché, exportación o índice no adquiere autoridad por ser más accesible o más reciente técnicamente;
6. conocer un nombre, identificador, ruta o localizador no concede derecho de consulta.

---

#### 4. Contrato `INFO-DOCUMENT-METADATA-CONTRACT-001`

##### 4.1. Núcleo obligatorio de identidad e interpretación

Toda instancia documental materializada deberá poder resolver, según aplicabilidad, el siguiente sobre semántico:

| Campo o grupo                               | Regla corporativa                                                                                                                                                                            |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document_id`                               | identidad lógica estable; no depende de nombre, formato, ruta o aplicación consumidora                                                                                                       |
| `document_context_id`                       | referencia exacta a una identidad `DOCCTX-*`                                                                                                                                                 |
| `document_version`                          | versión concreta del objeto lógico; no se reutiliza para contenido o estado material distinto                                                                                                |
| `metadata_schema_version`                   | versión del contrato con el que se interpretan los metadatos                                                                                                                                 |
| `process_id`                                | `VPROC-*` propietario o contextual aprobado                                                                                                                                                  |
| `process_instance_id`                       | instancia empresarial concreta cuando se materializa el objeto                                                                                                                               |
| `owner_app_code`                            | aplicación propietaria funcional heredada                                                                                                                                                    |
| `legal_entity_ref`                          | referencia obligatoria de entidad legal para toda instancia persistida; si no es resoluble, la instancia no puede declararse plenamente gobernada y la operación dependiente queda bloqueada |
| `document_function_refs[]`                  | funciones documento/registro/evidencia aplicables según `INFO-DOM-003`; pueden coexistir                                                                                                     |
| `document_type_ref`                         | tipo documental obligatorio para toda instancia persistida; si el catálogo aplicable no es resoluble, queda `PENDIENTE_DE_EVIDENCIA` y no se infiere desde extensión o nombre                |
| `series_ref`                                | serie cuando aplique y exista relación resoluble; no equivale a carpeta                                                                                                                      |
| `expedient_refs[]`                          | expedientes que referencian el objeto; la pertenencia no transfiere propiedad                                                                                                                |
| `classification` + `classification_version` | piso y versión de clasificación heredados o elevados por regla aprobada                                                                                                                      |
| `preparation_status`                        | estado de preparación según `INFO-DOM-004` cuando aplique                                                                                                                                    |
| `effectiveness_status`                      | estado de vigencia según `INFO-DOM-004`                                                                                                                                                      |
| `publication_status`                        | estado de publicación separado de vigencia y clasificación                                                                                                                                   |
| `effective_from` / `effective_to`           | ventana efectiva cuando sea aplicable y resoluble                                                                                                                                            |
| `resource_links[]`                          | referencias empresariales tipadas conforme al contrato de vínculo de esta tarea                                                                                                              |
| `representation_refs[]`                     | representaciones físicas, digitales o estructuradas asociadas a la versión                                                                                                                   |
| `retention_policy_ref`                      | referencia de política cuando exista; su contenido definitivo pertenece a `INFO-DOM-006`                                                                                                     |
| `integrity_provenance_ref`                  | referencia a evidencia de autenticidad/integridad cuando exista; su contrato pertenece a `INFO-DOM-007`                                                                                      |
| `created_or_received_actor_ref`             | actor o sistema que materializó o recibió el objeto cuando sea resoluble                                                                                                                     |
| `created_or_received_at`                    | timestamp empresarial o técnico aplicable sin sustituir los tiempos específicos de ciclo y auditoría                                                                                         |

##### 4.2. Reglas de obligatoriedad y ausencia

1. un campo obligatorio por contexto no podrá sustituirse por texto libre ambiguo;
2. un dato no demostrado se marca `PENDIENTE_DE_EVIDENCIA` en la instancia concreta; no se inventa;
3. `NO_APLICA` exige que la dimensión no corresponda semánticamente al objeto;
4. la ausencia de archivo binario no vuelve incompleto a un registro estructurado válido;
5. la ausencia de un recurso empresarial específico no elimina el vínculo obligatorio con proceso e instancia;
6. un metadato derivado conserva referencia a su fuente o regla de cálculo cuando su interpretación dependa de ella;
7. cambios del esquema de metadatos usan `metadata_schema_version`; no fuerzan una nueva `document_version` si el contenido documental no cambió;
8. cambios materiales del documento no se encubren como corrección de metadatos.

##### 4.3. Campos que no pueden actuar como identidad empresarial

No pueden sustituir `document_id`, `process_id`, `process_instance_id` o un recurso empresarial:

- nombre visible;
- nombre de archivo;
- extensión;
- MIME;
- bucket;
- path;
- carpeta;
- URL;
- clave técnica aislada de un proveedor;
- hash;
- timestamp aislado;
- ubicación física;
- posición en un índice;
- nombre de aplicación.

---

#### 5. Contrato `INFO-DOCUMENT-RESOURCE-LINK-CONTRACT-001`

##### 5.1. Capas de vínculo

Todo documento materializado conserva primero su contexto de proceso:

```text
process_id + process_instance_id
        ↓
document_context_id + document_id + document_version
        ↓
resource_links[] cuando existan recursos empresariales específicos
```

Cada `resource_link` deberá poder distinguir como mínimo:

| Dimensión                         | Regla                                                                                                            |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `resource_type`                   | tipo empresarial estable; no nombre de tabla ni bucket por defecto                                               |
| `resource_id`                     | identidad resoluble del recurso en su fuente propietaria                                                         |
| `resource_version`                | versión o revisión cuando el recurso la gobierne                                                                 |
| `link_role`                       | `GOVERNING_RESOURCE`, `RELATED_RESOURCE`, `PARENT_RESOURCE` o `EXTERNAL_ORIGIN`, según evidencia y aplicabilidad |
| `owner_app_code`                  | propietaria del recurso referenciado; una referencia no cambia esta propiedad                                    |
| `effective_from` / `effective_to` | vigencia del vínculo cuando pueda variar en el tiempo                                                            |

##### 5.2. Reglas de autoridad

1. `GOVERNING_RESOURCE` identifica el recurso que gobierna el significado empresarial del documento cuando esa relación exista y esté demostrada;
2. una instancia no recibe más de un `GOVERNING_RESOURCE` para el mismo significado y momento sin una regla explícita de composición;
3. `RELATED_RESOURCE` permite referencias cruzadas sin absorber propiedad ni autoridad;
4. `PARENT_RESOURCE` expresa jerarquía empresarial únicamente cuando exista en el dominio propietario;
5. `EXTERNAL_ORIGIN` conserva referencia de origen externo sin convertir el identificador del tercero en identidad VENTO;
6. expediente, serie, carpeta, bucket o aplicación consumidora no son por sí mismos recursos gobernantes;
7. una referencia rota, ambigua o no resoluble bloquea la operación que dependa de ella; no se repara por similitud de nombre.

##### 5.3. Cardinalidad y referencias cruzadas

- un documento puede referenciar múltiples recursos relacionados;
- un recurso puede estar representado o evidenciado por múltiples documentos;
- un expediente puede referenciar documentos de distintos procesos sin duplicarlos ni transferir su autoridad;
- la materialización de una copia o representación adicional no crea un nuevo recurso empresarial;
- una relación histórica no se elimina silenciosamente cuando el documento o recurso cambia de estado.

---

#### 6. Contrato `INFO-DOCUMENT-LOCATION-STORAGE-CONTRACT-001`

##### 6.1. Capas separadas

```text
document_id + document_version
        ↓
representation_id
        ↓
location_ref[]
        ↓
referencia de acceso temporal cuando corresponda
```

`representation_id` identifica una representación concreta de la versión documental. Una representación puede ser física, digital binaria, estructurada o derivada. El contrato no obliga a convertir todas las representaciones en archivos.

##### 6.2. Tipos de localización

| Código                      | Uso                                                                              |
| --------------------------- | -------------------------------------------------------------------------------- |
| `VENTO_MANAGED_OBJECT`      | representación almacenada en infraestructura gobernada por VENTO                 |
| `EXTERNAL_GOVERNED_REF`     | representación custodiada por tercero o sistema externo con referencia resoluble |
| `PHYSICAL_LOCATION`         | original o copia física con ubicación controlada                                 |
| `DERIVED_TECHNICAL_REPLICA` | réplica, caché, preview u otra copia técnica que no es fuente de autoridad       |
| `NO_APLICA`                 | no existe representación que requiera localización de esta clase                 |

##### 6.3. Sobre de localización

Una localización persistente deberá poder conservar, según su tipo:

```text
representation_id
location_kind
storage_or_custody_ref
container_ref
object_or_item_ref
physical_location_ref
location_status
observed_or_registered_at
effective_from
effective_to
supersedes_location_ref
```

Reglas:

1. `storage_or_custody_ref`, `container_ref` y `object_or_item_ref` son referencias técnicas o de custodia; no reemplazan identidad documental;
2. un traslado, renombre o migración de objeto conserva historia de localización cuando sea necesario para reconstruir la representación;
3. una ruta o URL cambiante no obliga a crear una versión documental nueva;
4. una referencia temporal de acceso se genera desde autorización vigente y no se persiste como localizador canónico;
5. la bandera técnica pública/privada de un contenedor no determina clasificación empresarial ni permiso de lectura;
6. una réplica técnica conserva vínculo con su representación fuente y no se presenta como original ni autoridad;
7. una ubicación física conocida no permite inventar custodio, contenido o correspondencia individual no comprobados;
8. la ausencia temporal de Storage no permite presentar una representación como inexistente, eliminada o dispuesta sin reconciliación.

##### 6.4. Almacenamiento y fuente de verdad

La arquitectura lógica queda:

```text
fuente propietaria del hecho empresarial
        ↓
metadatos documentales resolubles
        ↓
representaciones
        ↓
localizaciones gobernadas
```

Por tanto:

- Storage conserva representaciones, no reemplaza el hecho empresarial;
- una tabla de metadatos transversal, si se materializa posteriormente, funciona como catálogo y vínculo, no como propietaria universal de los hechos de negocio;
- un objeto sin vínculo resoluble no puede declararse documento gobernado únicamente por existir en un contenedor;
- un objeto duplicado técnicamente no implica dos documentos lógicos;
- backup, caché y réplica no son repositorios históricos de consulta ordinaria por defecto.

---

#### 7. Tratamiento de la huella técnica actual de Storage

La línea base heredada registra 14 buckets y 1101 objetos mediante metadata y conteo, sin inspección de contenido. Esta tarea conserva esa evidencia únicamente como huella técnica.

| Control                                                             | Decisión de INFO-DOM-005              |
| ------------------------------------------------------------------- | ------------------------------------- |
| buckets observados                                                  | 14 preservados como evidencia técnica |
| objetos contados                                                    | 1101 preservados como conteo técnico  |
| objetos inspeccionados por contenido en esta tarea                  | 0                                     |
| objetos promovidos a identidad `document_id` por nombre o ubicación | 0                                     |
| recursos empresariales inferidos desde bucket/path                  | 0                                     |
| clasificaciones empresariales inferidas desde bandera técnica       | 0                                     |
| correspondencias objeto ↔ `DOCCTX-*` inventadas                     | 0                                     |

La huella de 1101 objetos no constituye un inventario de 1101 documentos. El universo documental canónico de esta tarea sigue siendo el conjunto de 332 identidades contextuales `DOCCTX-*`; una instancia concreta solo podrá declararse materializada cuando satisfaga identidad, proceso, vínculo y representación conforme a este contrato.

---

#### 8. Tratamiento de originales y ubicaciones físicas

La existencia heredada de originales físicos en `Oficina 1` se conserva como evidencia de ubicación agregada. No se usa para inventar localizaciones individuales.

Reglas:

1. `Oficina 1` puede convertirse en `physical_location_ref` de una instancia concreta solo cuando exista evidencia que vincule el documento con esa ubicación;
2. la ubicación física no determina por sí sola originalidad, autenticidad, custodio ni propiedad funcional;
3. una copia digital se vincula con su representación fuente cuando la correspondencia sea resoluble;
4. autenticidad, hash, timestamp, preservación y cadena de custodia permanecen en `INFO-DOM-007`;
5. una instancia cuya ubicación concreta no esté demostrada conserva su identidad y marca esa dimensión `PENDIENTE_DE_EVIDENCIA`; no se completa por inferencia.

---

#### 9. Contrato `INFO-DOCUMENT-AUTHORIZED-SEARCH-CONTRACT-001`

##### 9.1. Principio de autorización previa

La búsqueda documental no es un permiso separado para conocer la existencia de información. Antes de devolver títulos, nombres, fragmentos, conteos, etiquetas, relaciones o metadatos sensibles deberá resolverse el contexto autorizado del actor.

Una solicitud de búsqueda deberá poder resolver, según aplicabilidad:

```text
principal_ref
effective_actor_ref
purpose_code
action = SEARCH
process_scope
resource_scope
relationship_scope
territory_scope
classification_scope
lifecycle_scope
publication_scope
query_or_filter
requested_projection
```

La ausencia de un componente obligatorio para decidir alcance produce política restrictiva; nunca amplía resultados.

##### 9.2. Pipeline lógico de búsqueda

```text
actor + finalidad + acción + alcance
        ↓
proyección de índice autorizable
        ↓
candidatos dentro del alcance permitido
        ↓
revalidación de autorización y estado vigente
        ↓
proyección mínima de metadatos
        ↓
acceso al contenido mediante su control propio
```

Reglas:

1. un índice solo contiene o proyecta información necesaria para la finalidad aprobada;
2. los resultados no revelan recursos no autorizados mediante título, nombre, snippet, conteo, sugerencia, autocomplete, faceta o mensaje de error;
3. obtener un candidato por búsqueda no concede acceso a su contenido;
4. la hidratación del resultado revalida autorización, relación, clasificación, estado y alcance aplicables;
5. búsquedas exactas por identificador respetan las mismas reglas que búsqueda textual;
6. ranking, filtros, facetas o búsqueda aproximada no pueden operar sobre contenido que el actor no está autorizado a conocer;
7. información S3/S4 usa proyecciones minimizadas y no expone contenido en índices o snippets más allá de lo autorizado;
8. una búsqueda sin resultados no debe distinguir entre inexistencia y falta de permiso de manera que filtre información protegida;
9. una copia local o caché de índice hereda clasificación, finalidad y política de su contenido.

##### 9.3. Índice como proyección reconstruible

Un índice de búsqueda:

- conserva referencias estables a `document_id`, `document_version` y recursos necesarios para revalidación;
- no se convierte en fuente de verdad del estado documental;
- no conserva una versión como vigente únicamente porque aún aparezca indexada;
- puede reconstruirse desde fuentes autorizadas sin perder identidad empresarial;
- no crea una versión documental nueva por actualizar tokens, ranking o estructura del índice;
- no autoriza modificar el documento fuente;
- debe impedir que una copia desactualizada gane autoridad frente al estado vigente.

---

#### 10. Localización y búsqueda por recurso empresarial

La localización funcional parte del recurso, no del contenedor técnico:

```text
recurso empresarial autorizado
→ vínculos documentales
→ identidad y versión aplicables
→ representación autorizada
→ localización vigente
```

También puede partir de una identidad documental conocida:

```text
document_id autorizado
→ versión aplicable
→ resource_links[]
→ representation_refs[]
→ location_ref[]
```

Reglas:

1. localizar significa resolver dónde existe una representación; no significa autorizar lectura;
2. una relación con un recurso permite navegar solo dentro del alcance autorizado;
3. mover un objeto entre contenedores no cambia el recurso empresarial gobernante;
4. cambiar de aplicación consumidora no cambia la propietaria funcional;
5. una vista transversal puede presentar referencias de múltiples dominios sin replicar sus hechos como autoridad propia;
6. búsquedas por expediente o serie respetan la autoridad individual de cada documento miembro.

---

#### 11. Versionado de metadatos, vínculos y localizadores

Se distinguen cuatro clases de cambio:

| Cambio                                    | Efecto                                                                               |
| ----------------------------------------- | ------------------------------------------------------------------------------------ |
| cambia contenido o significado documental | nueva `document_version` según `INFO-DOM-004`                                        |
| cambia únicamente contrato de metadatos   | nueva `metadata_schema_version`; no fuerza nueva versión documental                  |
| cambia vínculo empresarial por hecho real | nueva revisión del vínculo con historia y vigencia; no reescribe el vínculo anterior |
| cambia ubicación de una representación    | nueva revisión/localización enlazada; no fuerza nueva versión documental             |

Una corrección de metadatos no puede utilizarse para alterar silenciosamente el significado empresarial de una versión. Cuando el cambio revele que la identidad o el recurso eran incorrectos, la corrección deberá preservar la asignación anterior y el motivo de la rectificación.

---

#### 12. Representaciones múltiples y copias

Una versión documental puede tener varias representaciones, por ejemplo una estructura autoritativa y una representación PDF, un original físico y una copia digital, o una evidencia primaria y una preview técnica.

Reglas:

1. cada representación conserva `representation_id` estable dentro de la versión;
2. original/copia se interpreta según `INFO-DOM-003`, no según ubicación;
3. una representación derivada conserva relación con su fuente;
4. una representación no autorizada para consumo puede existir sin aparecer en búsqueda ordinaria;
5. una preview o thumbnail no hereda autoridad sobre su fuente;
6. una impresión es copia física cuando corresponde y no se vuelve original por ubicación;
7. un cambio de formato sin cambio de significado puede producir representación nueva sin forzar identidad lógica nueva, siempre que la relación sea trazable;
8. si la transformación cambia significado o contenido material, deberá tratarse mediante el ciclo de versión correspondiente.

---

#### 13. Estados de resolución aplicables

Para instancias concretas se utilizan los estados de certeza ya compatibles con el plan:

- `ESPECIFICADO`: contrato o relación documental definida;
- `PENDIENTE_DE_EVIDENCIA`: falta evidencia para resolver un valor concreto sin inferencia;
- `BLOQUEADO`: la operación pretendida no puede continuar por vínculo, autorización, clasificación, estado o localización obligatoria no resolubles;
- `NO_APLICA`: la dimensión no corresponde y existe razón explícita.

La ausencia de evidencia no se transforma en `NO_APLICA`. La existencia técnica no se transforma en `ESPECIFICADO` empresarial sin vínculo resoluble.

---

#### 14. Reglas de falla segura

Quedan bloqueadas, cuando dependan del dato faltante, las operaciones que intenten:

- presentar un objeto técnico como documento sin `document_id` y `document_context_id` resolubles;
- presentar un documento materializado sin `process_id` y `process_instance_id` resolubles;
- usar un recurso específico cuando su `resource_type` o `resource_id` no pueda resolverse;
- usar bucket, ruta o nombre como sustituto de identidad;
- exponer resultados de búsqueda sin contexto autorizado;
- generar acceso temporal desde un candidato que no superó revalidación;
- tratar una réplica, caché o índice como versión vigente;
- declarar inexistencia, eliminación o disposición únicamente porque un objeto no sea localizable temporalmente;
- degradar clasificación porque una representación esté en un contenedor técnicamente público;
- reparar referencias ambiguas por similitud de texto o posición técnica.

---

#### 15. Aplicación al universo heredado

Las 332 identidades `DOCCTX-*` reciben el mismo contrato corporativo de metadatos, vínculo, representación/localización y búsqueda, preservando su proceso, propietaria, sensibilidad, retención y frontera heredada.

Códigos de matriz:

| Código                       | Significado                                                                                      |
| ---------------------------- | ------------------------------------------------------------------------------------------------ |
| `INFO_META_LOC_SEARCH_V1`    | perfil corporativo de metadatos, vínculo, localización y búsqueda de esta tarea                  |
| `BUSINESS_LINK_RESOLVABLE`   | proceso e instancia obligatorios; recurso específico condicional cuando exista y aplique         |
| `LOCATION_BY_REPRESENTATION` | localización resuelta por representación, nunca por identidad documental sola                    |
| `AUTHORIZED_SEARCH_V1`       | búsqueda con autorización previa, proyección mínima y revalidación antes del contenido           |
| `NINGUNO`                    | no existe frontera heredada adicional                                                            |
| `FRONTERA_OBLIGATORIA`       | referencias cruzadas no absorben autoridad ni propiedad ajena                                    |
| `APLICACION_DIFERIDA`        | la definición documental es válida, pero no acredita disponibilidad de la aplicación propietaria |

| ID contextual          | Proceso      | Perfil                    | Vínculo empresarial        | Localización                 | Búsqueda               | Retención heredada   | Estado         | Frontera heredada      |
| ---------------------- | ------------ | ------------------------- | -------------------------- | ---------------------------- | ---------------------- | -------------------- | -------------- | ---------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ARCHIVAL`       | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_RELATIONSHIP`   | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_OBLIGATION`     | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_ACTIVE_CASE`    | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `INFO_META_LOC_SEARCH_V1` | `BUSINESS_LINK_RESOLVABLE` | `LOCATION_BY_REPRESENTATION` | `AUTHORIZED_SEARCH_V1` | `RET_BUSINESS_CYCLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |

---

#### 16. Reconciliación cuantitativa

| Control                                   | Resultado |
| ----------------------------------------- | --------: |
| `DOCCTX-*` esperadas                      |       332 |
| `DOCCTX-*` materializadas                 |       332 |
| claves únicas                             |       332 |
| faltantes                                 |         0 |
| duplicados                                |         0 |
| procesos cubiertos                        |        69 |
| filas con `INFO_META_LOC_SEARCH_V1`       |       332 |
| filas con vínculo empresarial resoluble   |       332 |
| filas con localización por representación |       332 |
| filas con búsqueda autorizada             |       332 |
| propietarias modificadas                  |         0 |
| clasificaciones modificadas               |         0 |

Distribución de retención heredada preservada:

| Clase                | Entradas |
| -------------------- | -------: |
| `RET_ACTIVE_CASE`    |       33 |
| `RET_BUSINESS_CYCLE` |      184 |
| `RET_RELATIONSHIP`   |       36 |
| `RET_OBLIGATION`     |       66 |
| `RET_ARCHIVAL`       |       13 |
| **Total**            |  **332** |

Fronteras heredadas preservadas:

| Frontera               | Entradas |
| ---------------------- | -------: |
| `NINGUNO`              |       73 |
| `FRONTERA_OBLIGATORIA` |      245 |
| `APLICACION_DIFERIDA`  |       14 |
| **Total**              |  **332** |

---

#### 17. Fronteras con tareas y contratos posteriores

| Materia                                                                                   | Decisión de INFO-DOM-005                                                                       | Propietario posterior             |
| ----------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | --------------------------------- |
| plazos de retención, triggers, archivo, hold, anonimización, eliminación y certificado    | solo se conserva `retention_policy_ref`; no se inventan políticas o plazos                     | `INFO-DOM-006`                    |
| autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia | se conserva referencia cuando exista; no se certifica                                          | `INFO-DOM-007`                    |
| avisos, fundamentos, consentimiento y datos sensibles                                     | metadatos y búsqueda respetan clasificación/finalidad; no se definen bases de tratamiento      | `INFO-DOM-008`                    |
| solicitudes de titulares                                                                  | búsqueda y vínculo permiten localización autorizada; no se define procedimiento de atención    | `INFO-DOM-009`                    |
| compartición, terceros y requerimientos de autoridad                                      | localizadores no conceden divulgación; no se define transferencia                              | `INFO-DOM-010`                    |
| aprobación, aceptación y firmas                                                           | los metadatos pueden referenciar estados; no definen fuerza de firma                           | `INFO-DOM-011`                    |
| auditoría e investigación                                                                 | búsquedas y cambios deben ser auditables según cobertura existente; no se define investigación | `INFO-DOM-013`                    |
| autorización de búsqueda, lectura, impresión, exportación o compartición                  | esta tarea exige decisión previa; la política de permiso pertenece al dominio de autorización  | `INFO-AUTH-001` y `INFO-AUTH-002` |
| validación física de archivos y acceso temporal                                           | se consumen los contratos EVID sin redefinirlos                                                | tareas `EVID-ARC-*` aplicables    |

Ninguna frontera posterga el resultado principal: el modelo corporativo de metadatos, vínculo empresarial, localización, almacenamiento gobernado y búsqueda autorizada queda completamente definido y materializado para el universo heredado.

---

#### 18. Decisiones corporativas de cierre

1. `document_id`, versión, representación, objeto técnico, localizador y referencia temporal de acceso quedan separados.
2. Metadatos no sustituyen contenido, autorización, autenticidad ni fuente empresarial.
3. El documento conserva siempre contexto de proceso; el recurso específico se vincula cuando exista y sea resoluble.
4. Las referencias cruzadas no transfieren propiedad ni autoridad.
5. Un documento puede tener múltiples recursos relacionados y múltiples representaciones sin duplicar identidad lógica.
6. Bucket, path, carpeta, URL, nombre de archivo, hash o ubicación física no pueden actuar como identidad empresarial.
7. Mover o renombrar una representación no crea una versión documental nueva por sí solo.
8. Una referencia temporal de acceso nunca es localizador canónico.
9. La bandera técnica pública/privada no determina clasificación ni autorización empresarial.
10. Los 14 buckets y 1101 objetos observados se conservan como huella técnica; no se inventan correspondencias objeto-documento-recurso.
11. Un índice de búsqueda es una proyección reconstruible, no una fuente de verdad ni permiso de lectura.
12. La búsqueda exige autorización previa, minimización y revalidación antes de hidratar contenido.
13. Títulos, snippets, facetas, conteos, sugerencias y mensajes de error no pueden filtrar recursos no autorizados.
14. Una versión desactualizada en índice o caché no adquiere autoridad sobre el estado vigente.
15. Original físico, copia digital, réplica, preview y representación estructurada conservan localizadores propios y relaciones con su fuente.
16. La ubicación agregada `Oficina 1` no se convierte en localizador individual sin evidencia.
17. Las 332 identidades, 69 procesos, propietarias, clasificación, retención y fronteras heredadas permanecen intactos.
18. No se ejecuta ningún cambio de código, Supabase, Storage, datos, índices, configuración o despliegue.

---

#### 19. Cobertura de riesgos heredados

La tarea cierra documentalmente las brechas que permitían confundir infraestructura con identidad documental, mantener archivos sin vínculo empresarial uniforme o tratar la búsqueda como vía lateral de divulgación. También fija cómo localizar representaciones físicas, digitales, externas o técnicas sin que su ubicación adquiera autoridad sobre el recurso empresarial.

Los comportamientos ejecutables ya cuentan con cobertura transversal vigente: búsqueda y consulta resuelven actor, finalidad, clasificación, recurso, relación, territorio, estado y acción; la persistencia documental conserva identidad, tipo, versión, estado, vigencia y representación; y la integración impide que índices, copias, cachés o proveedores se conviertan en fuentes competidoras. Esta tarea materializa el contrato documental que esos controles deberán consumir y no introduce un comportamiento ejecutable independiente.

---

#### 20. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa y especializa metadatos, vínculo empresarial, localización, almacenamiento gobernado y búsqueda autorizada sobre comportamientos ya protegidos por la cobertura vigente de consulta/búsqueda, persistencia documental y reconciliación entre fuentes, índices, copias y cachés. No introduce una nueva transición física, permiso, algoritmo, mutación de base de datos, operación de Storage, índice ejecutable, integración o comportamiento independiente. En consecuencia, crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0.

---

#### 21. Criterios de aceptación

- [x] `INFO-DOM-004` figura aprobada y entrega ciclo, estados, versiones y vigencia.
- [x] los 69 `VPROC-*` permanecen sin renombrar, fusionar o eliminar.
- [x] las 332 claves `DOCCTX-*` aparecen exactamente una vez en la matriz de esta tarea.
- [x] cada identidad recibe `INFO_META_LOC_SEARCH_V1`, vínculo empresarial resoluble, localización por representación y búsqueda autorizada.
- [x] `document_id`, `document_version`, `metadata_schema_version`, `resource_version` y `classification_version` quedan semánticamente separados.
- [x] documento, representación, objeto técnico, localizador y referencia temporal de acceso quedan separados.
- [x] proceso e instancia permanecen como contexto obligatorio de materialización.
- [x] `resource_type` y `resource_id` se exigen cuando existe recurso empresarial específico y no se inventan cuando no aplica.
- [x] las referencias cruzadas no transfieren propiedad ni autoridad.
- [x] una misma versión puede tener múltiples representaciones y localizaciones sin duplicar identidad lógica.
- [x] una representación estructurada no está obligada a fabricar archivo binario.
- [x] bucket, path, carpeta, URL, nombre de archivo, hash y ubicación física no pueden sustituir identidad o recurso.
- [x] una referencia temporal de acceso no se usa como localizador persistente.
- [x] la bandera técnica pública/privada no concede clasificación pública ni autorización.
- [x] los 14 buckets y 1101 objetos se conservan únicamente como huella técnica y se crean cero correspondencias inferidas.
- [x] `Oficina 1` se conserva como ubicación física agregada sin inventar correspondencias individuales.
- [x] la búsqueda exige actor, finalidad, acción y alcance resolubles antes de exponer metadatos protegidos.
- [x] resultados, conteos, facetas, sugerencias y mensajes no filtran recursos no autorizados.
- [x] un índice no se convierte en fuente de verdad ni permiso de lectura.
- [x] una copia, caché o índice desactualizado no puede ganar autoridad frente al estado vigente.
- [x] cambios de metadatos, vínculo empresarial y localización conservan historia sin confundirse con nueva versión documental.
- [x] la distribución de retención 33/184/36/66/13 permanece intacta.
- [x] las fronteras 73/245/14 permanecen intactas.
- [x] las políticas definitivas de retención permanecen reservadas a `INFO-DOM-006`.
- [x] no se realizan cambios físicos ni de Supabase.
- [x] no se crean ni modifican requisitos de prueba.
- [x] `INFO-DOM-006` permanece reservada y no iniciada.

---

#### 22. Resultado y continuidad

VENTO queda con un contrato corporativo único para describir una instancia documental, vincularla con su proceso y recursos empresariales, resolver sus representaciones y ubicaciones, gobernar dónde se almacena sin convertir infraestructura en autoridad y localizarla mediante búsqueda autorizada y minimizada.

La cadena resultante queda:

```text
VPROC-* + instancia empresarial
→ DOCCTX-* + document_id + document_version
→ metadatos interpretables y versionados
→ resource_links[]
→ representation_refs[]
→ location_ref[]
→ índice autorizado como proyección reconstruible
→ revalidación de autorización
→ contenido o representación permitida
```

ÚLTIMA TAREA APROBADA

`INFO-DOM-004 — Definir ciclo documental, estados, versiones, vigencia, sustitución, anulación y retiro`

TAREA ACTUAL APROBADA

`INFO-DOM-005 — Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales`

SIGUIENTE TAREA RESERVADA

`INFO-DOM-006 — Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición`


### ✅ INFO-DOM-006 — Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición

**Estado:** APROBADA
**Tarea anterior:** `INFO-DOM-005 — Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales` — APROBADA
**Tarea siguiente:** `INFO-DOM-007 — Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del gobierno de retención, cómputo temporal, archivo, legal hold, elegibilidad, disposición, anonimización, eliminación controlada y certificado de disposición para las identidades documentales aprobadas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md`
**Fase:** exclusivamente documental
**Procesos cubiertos:** 69 (`VPROC-0001` a `VPROC-0069`)
**Identidades documentales cubiertas:** 332 (`DOCCTX-*`)
**Cambios físicos autorizados:** ninguno; no crea ni modifica tablas, buckets, objetos de Storage, RLS, RPC, funciones, triggers, jobs, Edge Functions, migraciones, datos, archivos empresariales, backups, índices, tombstones ni ejecuciones de disposición
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir un gobierno único y no destructivo para decidir cuánto tiempo puede conservarse una identidad documental, desde qué hecho autoritativo comienza el cómputo, cuándo debe archivarse o quedar elegible para disposición, cómo prevalece un legal hold, qué condiciones permiten anonimización o eliminación y qué evidencia mínima deberá conservar un certificado de disposición.

La tarea no convierte una clase de retención en un plazo jurídico inventado. Las fuentes canónicas consumidas definen el contrato, los estados, los controles y las clases de retención, pero no contienen una tabla aprobada de duraciones numéricas y fundamentos aplicables a las 332 identidades. Por ello, la decisión canónica actual es conservar `RET_UNRESOLVED` para la política ejecutable de cada identidad y bloquear toda disposición automática hasta que exista fundamento verificable, periodo mínimo, periodo máximo y versión de política resolubles.

La aprobación documental de esta tarea especifica el modelo y materializa la decisión por las 332 identidades; no certifica implementación física, elegibilidad real ni disposición ejecutada.

---

#### 2. Resultado sustantivo

El resultado queda compuesto por ocho artefactos lógicos coordinados:

1. `INFO-RETENTION-POLICY-CONTRACT-001`: contrato de política versionada de retención.
2. `INFO-RETENTION-SCHEDULE-001`: tabla corporativa de clases y reglas de cómputo.
3. `INFO-RETENTION-COMPUTATION-EVENT-CATALOG-001`: catálogo de eventos autoritativos que pueden iniciar o recalcular el cómputo.
4. `INFO-ARCHIVE-CONTRACT-001`: reglas de archivo gobernado y preservación de identidad.
5. `INFO-LEGAL-HOLD-CONTRACT-001`: imposición, revisión, propagación y liberación de hold.
6. `INFO-DISPOSITION-CONTRACT-001`: elegibilidad, manifiesto, segregación, ejecución idempotente, anonimización, eliminación y tratamiento de residuales.
7. `INFO-DISPOSITION-CERTIFICATE-CONTRACT-001`: evidencia mínima de una disposición realmente verificada.
8. `INFO-RETENTION-DISPOSITION-MATRIX-001`: decisión explícita para las 332 identidades `DOCCTX-*` heredadas.

| Control                                                   | Resultado |
| --------------------------------------------------------- | --------: |
| Procesos esperados                                        |    **69** |
| Procesos materializados                                   |    **69** |
| Identidades `DOCCTX-*` esperadas                          |   **332** |
| Identidades materializadas                                |   **332** |
| Identificadores únicos                                    |   **332** |
| Faltantes                                                 |     **0** |
| Duplicados                                                |     **0** |
| Políticas ejecutables con plazo y fundamento verificables |     **0** |
| Identidades con `RET_UNRESOLVED`                          |   **332** |
| Identidades con disposición automática habilitada         |     **0** |
| Cambios físicos                                           |     **0** |
| Requisitos de prueba nuevos o modificados                 |     **0** |

---

#### 3. Decisiones heredadas que no se redefinen

Se preservan sin alteración:

- las 69 identidades de proceso `VPROC-*` y sus propósitos empresariales;
- las 332 identidades `DOCCTX-*` y su propiedad funcional;
- las clases `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED` y sus reglas de minimización;
- la identidad lógica, versión, representación, localización, recurso empresarial y búsqueda definidos en `INFO-DOM-003` a `INFO-DOM-005`;
- la historia no destructiva, los estados de ciclo documental y las relaciones de sustitución, anulación, vencimiento y retiro definidas en `INFO-DOM-004`;
- las clases base heredadas `RET_ACTIVE_CASE`, `RET_BUSINESS_CYCLE`, `RET_RELATIONSHIP`, `RET_OBLIGATION` y `RET_ARCHIVAL`;
- el bloqueo `RET_UNRESOLVED` heredado de EVID-ARC mientras no exista política ejecutable resoluble;
- `HOLD_CHECK_REQUIRED`, `DISPOSITION_ELIGIBILITY_REQUIRED`, `DISPOSITION_BY_POLICY_ONLY`, `DISPOSITION_EVIDENCE_REQUIRED` y `NO_RESURRECTION_REQUIRED` para las 332 identidades;
- la separación entre backup, archivo, retención, legal hold, disposición y borrado técnico;
- la regla de que una versión aprobada o evidencia preservada no se sobrescribe ni se elimina directamente para aparentar disposición.

---

#### 4. Distinciones obligatorias

```text
CLASE DE RETENCIÓN
≠ POLÍTICA DE RETENCIÓN
≠ TRIGGER DE CÓMPUTO
≠ PERIODO MÍNIMO
≠ PERIODO MÁXIMO
≠ ESTADO DE CICLO
≠ ARCHIVO
≠ LEGAL HOLD
≠ ELEGIBILIDAD
≠ MÉTODO DE DISPOSICIÓN
≠ BACKUP
≠ CERTIFICADO DE DISPOSICIÓN
```

Además:

```text
BORRADO LÓGICO ≠ ELIMINACIÓN VERIFICADA
ANULACIÓN ≠ DISPOSICIÓN
RETIRO ≠ ARCHIVO
ARCHIVO ≠ BACKUP
SEUDONIMIZACIÓN ≠ ANONIMIZACIÓN
COPIA INACCESIBLE ≠ COPIA ELIMINADA
CERTIFICADO ≠ CONTENIDO DISPUESTO
```

Una ubicación, bucket, path, ausencia en interfaz, timestamp técnico o cambio de visibilidad no determina por sí mismo ningún estado de retención o disposición.

---

#### 5. `INFO-RETENTION-POLICY-CONTRACT-001`

Una política será ejecutable únicamente cuando pueda resolver de forma versionada y verificable, como mínimo:

| Campo                           | Regla                                                                                           |
| ------------------------------- | ----------------------------------------------------------------------------------------------- |
| `retention_policy_id`           | Identificador estable de la política; no se deriva del nombre del documento ni de la ubicación. |
| `retention_policy_version`      | Versión exacta aplicable; una versión publicada no cambia silenciosamente de significado.       |
| `information_category`          | Categoría o alcance documental al que aplica.                                                   |
| `record_or_event_scope`         | Objeto, evento, documento, expediente o conjunto gobernado.                                     |
| `process_scope`                 | `VPROC-*` aplicable.                                                                            |
| `classification`                | Clase de sensibilidad efectiva o regla para resolverla.                                         |
| `information_owner`             | Propietaria funcional o autoridad empresarial correspondiente.                                  |
| `custodian`                     | Custodia aplicable a la representación o archivo gobernado.                                     |
| `purpose`                       | Finalidad que justifica la conservación.                                                        |
| `obligation_refs[]`             | Fundamentos verificables que justifican mínimo, máximo, hold, archivo o método de disposición.  |
| `retention_trigger`             | Evento tipado, autoritativo y verificable que inicia el cómputo.                                |
| `active_retention_rule`         | Regla mientras el recurso permanece activo.                                                     |
| `inactive_retention_rule`       | Regla tras cierre, vencimiento, sustitución u otro evento aplicable.                            |
| `archive_rule`                  | Condición y tratamiento de archivo.                                                             |
| `minimum_period`                | Duración mínima con unidad, inicio y fundamento explícitos.                                     |
| `maximum_period`                | Duración máxima con unidad, inicio, excepción y fundamento explícitos.                          |
| `review_frequency`              | Frecuencia de revisión cuando la política lo requiera.                                          |
| `disposition_method`            | Archivo, transferencia, anonimización, eliminación controlada u otra opción aprobada.           |
| `anonymization_rule`            | Método/versionado y condición de aceptación cuando aplique.                                     |
| `hold_eligibility`              | Regla para evaluar suspensión de disposición.                                                   |
| `backup_treatment`              | Tratamiento del objeto cuando permanezca temporalmente dentro de backups vigentes.              |
| `copy_and_derivative_treatment` | Tratamiento de copias, exportaciones, índices, cachés, thumbnails y derivados.                  |
| `third_party_treatment`         | Tratamiento de copias externas y evidencia de cierre.                                           |
| `jurisdiction_or_territory`     | Dimensión territorial relevante para la obligación.                                             |
| `exception_route`               | Ruta autorizada cuando exista conflicto, investigación o excepción.                             |
| `effective_at`                  | Inicio de vigencia de la versión de política.                                                   |
| `superseded_at`                 | Momento en que deja de ser la versión gobernante.                                               |
| `approval_refs[]`               | Evidencia de autoridad para aprobar la política y sus cambios.                                  |

Reglas obligatorias:

1. la clase base orienta el comportamiento, pero nunca rellena automáticamente un periodo;
2. una duración sin evento inicial verificable es inválida;
3. `minimum_period` y `maximum_period` son conceptos distintos;
4. el acceso frecuente, la última consulta, `updated_at`, una sincronización o un cambio de ubicación no reinician el reloj salvo política explícita y fundada;
5. una nueva versión de política no reinterpreta silenciosamente historia anterior;
6. una copia o exportación no adquiere por defecto un plazo independiente que permita eludir el de su fuente;
7. si falta cualquier fundamento o campo material para decidir disposición, la política permanece `RET_UNRESOLVED` y la disposición queda bloqueada;
8. conservar indefinidamente por inercia no es una política válida, aunque el bloqueo preventivo siga impidiendo eliminar hasta resolver la obligación.

---

#### 6. Estado actual de los plazos y fundamentos

Las fuentes canónicas disponibles no aportan una tabla aprobada que asigne duraciones numéricas y fundamentos verificables a las 332 identidades. No se inventan años, meses, días, máximos, mínimos, prescripciones, obligaciones tributarias, laborales, comerciales, sanitarias, contractuales, de privacidad o probatorias.

Por tanto:

- `retention_policy_id`: `RET_UNRESOLVED` para 332/332;
- `minimum_period`: `PENDIENTE_DE_EVIDENCIA` para 332/332;
- `maximum_period`: `PENDIENTE_DE_EVIDENCIA` para 332/332;
- `obligation_refs[]`: `PENDIENTE_DE_EVIDENCIA` cuando deba justificar el periodo o la disposición;
- estado ejecutable: `BLOQUEADO` para 332/332;
- disposición automática: prohibida para 332/332.

El insumo documental pendiente tiene como propietario `INFO-DOM-012 — Crear registro de obligaciones, controles, evidencias, responsables, frecuencias y brechas de cumplimiento`. La condición de salida es disponer de una obligación o fundamento verificable y aprobado que permita fijar `obligation_refs[]`, evento inicial, mínimo, máximo, método, excepciones y aprobaciones sin inferencia. La existencia de esa tarea futura no autoriza anticipar sus resultados ni modifica la continuidad de la tarea actual.

---

#### 7. `INFO-RETENTION-SCHEDULE-001`

La tabla corporativa actual conserva las cinco clases heredadas y les asigna una regla de cómputo estructural, no un periodo jurídico:

| Clase heredada       | Identidades | Perfil de evento                              | Regla de cómputo                                                                                                                                                       | Periodos actuales        | Disposición |
| -------------------- | ----------: | --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ----------- |
| `RET_ACTIVE_CASE`    |      **33** | `RET_EVT_CASE_CLOSED`                         | El reloj solo puede iniciar desde el cierre autoritativo del caso o expediente aplicable.                                                                              | `PENDIENTE_DE_EVIDENCIA` | `BLOQUEADA` |
| `RET_BUSINESS_CYCLE` |     **184** | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | El reloj solo puede iniciar desde el cierre autoritativo del ciclo empresarial que gobierna el recurso.                                                                | `PENDIENTE_DE_EVIDENCIA` | `BLOQUEADA` |
| `RET_RELATIONSHIP`   |      **36** | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | El cómputo exige terminación autoritativa de la relación y resolución de las obligaciones que la política declare necesarias; no se presume que ambos hitos coincidan. | `PENDIENTE_DE_EVIDENCIA` | `BLOQUEADA` |
| `RET_OBLIGATION`     |      **66** | `RET_EVT_LAST_OBLIGATION_CLOSED`              | El reloj solo puede iniciar desde el cierre o extinción autoritativa de la última obligación aplicable declarada por la política.                                      | `PENDIENTE_DE_EVIDENCIA` | `BLOQUEADA` |
| `RET_ARCHIVAL`       |      **13** | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | La clase no permite inferir un plazo de disposición; requiere evento y autoridad archivística o legal expresamente resolubles.                                         | `PENDIENTE_DE_EVIDENCIA` | `BLOQUEADA` |
| **Total**            |     **332** |                                               |                                                                                                                                                                        |                          |             |

---

#### 8. `INFO-RETENTION-COMPUTATION-EVENT-CATALOG-001`

Catálogo cerrado de eventos utilizables por una política:

| Código                                        | Significado                                 | Condición mínima                                                       |
| --------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------------------- |
| `RET_EVT_CREATED_OR_RECEIVED`                 | Creación o recepción controlada.            | Identidad, versión, proceso y tiempo autoritativo resolubles.          |
| `RET_EVT_EFFECTIVE`                           | Inicio de vigencia empresarial.             | `effective_at` autoritativo y política que lo seleccione.              |
| `RET_EVT_PUBLISHED`                           | Publicación controlada.                     | Publicación empresarial válida, no simple carga técnica.               |
| `RET_EVT_SUPERSEDED`                          | Sustitución efectiva.                       | Sucesor efectivo y relación de supersesión preservada.                 |
| `RET_EVT_WITHDRAWN`                           | Retiro controlado.                          | Evento de retiro autoritativo.                                         |
| `RET_EVT_EXPIRED`                             | Vencimiento empresarial.                    | Expiración autoritativa, no ausencia de uso.                           |
| `RET_EVT_CASE_CLOSED`                         | Cierre del caso o expediente.               | Estado de cierre autoritativo y no solo ocultamiento o archivo físico. |
| `RET_EVT_BUSINESS_CYCLE_CLOSED`               | Cierre del ciclo empresarial gobernante.    | Evento de cierre del recurso propietario.                              |
| `RET_EVT_RELATIONSHIP_TERMINATED`             | Fin de relación.                            | Terminación autoritativa de la relación.                               |
| `RET_EVT_LAST_OBLIGATION_CLOSED`              | Cierre de la última obligación aplicable.   | Obligaciones y cierre verificables.                                    |
| `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | Regla compuesta de relación y obligaciones. | Política explícita que determine el hito gobernante sin inferencia.    |
| `RET_EVT_PURPOSE_ENDED`                       | Fin de finalidad aplicable.                 | Finalidad y evento de terminación aprobados.                           |
| `RET_EVT_PHYSICAL_DISPOSITION`                | Disposición física de un soporte gobernado. | Evidencia del evento y relación con la identidad correspondiente.      |
| `RET_EVT_HOLD_RELEASED`                       | Liberación aprobada de hold.                | Evento de liberación; no reinicia el plazo por defecto.                |
| `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | Evento archivístico aún no resoluble.       | Autoridad y evento explícitos antes de computar disposición.           |

No se autoriza usar `created_at`, `updated_at`, última consulta, última exposición, última sincronización, nombre de archivo, fecha de movimiento de bucket o fecha de backup como sustitutos del evento empresarial requerido.

---

#### 9. Regla de cómputo temporal

La evaluación canónica se expresa así:

```text
POLICY_VERSION_APPLICABLE
+
AUTHORITATIVE_TRIGGER_EVENT
+
TRIGGER_TIME_ALLOWED_BY_POLICY
+
MINIMUM_PERIOD
+
MAXIMUM_PERIOD
+
CURRENT_RESOURCE_STATE
+
ACTIVE_HOLDS_OR_PRESERVATION
+
PENDING_OBLIGATIONS
+
THIRD_PARTY_AND_BACKUP_STATUS
+
DISPOSITION_ERRORS_OR_RESIDUALS
→ RETENTION / ELIGIBILITY DECISION
```

Reglas:

1. `trigger_at` debe provenir del evento tipado y de la dimensión temporal que la política declare autoritativa; no se elige el timestamp más conveniente;
2. si el evento dispone de `effective_at`, `occurred_at`, `recorded_at`, `received_at`, `committed_at` o `synchronized_at`, cada uno conserva su significado y la política debe declarar cuál gobierna el cómputo;
3. un reloj local ambiguo, una zona horaria desconocida o una corrección temporal no se resuelven por orden de llegada;
4. una corrección del evento de origen crea un hecho nuevo enlazado; no reescribe el evento histórico;
5. un hold activo bloquea disposición, pero no borra ni reinicia silenciosamente el trigger ni la política;
6. al liberar un hold se recalcula elegibilidad con la política aplicable y los hechos conservados; la liberación no ejecuta disposición automáticamente;
7. si el periodo, trigger, obligación o política no son resolubles, el resultado es `POLICY_UNRESOLVED` o `DISPOSITION_BLOCKED` y no una fecha aproximada;
8. un máximo vencido con hold, investigación, obligación o fallo pendiente queda bloqueado con causa explícita; no se presenta como cumplimiento.

---

#### 10. Estados de retención y disposición

Se adopta el ciclo heredado:

```text
ACTIVE
→ INACTIVE
→ ARCHIVE_PENDING
→ ARCHIVED
→ ELIGIBLE_FOR_DISPOSITION
→ DISPOSITION_PENDING
→ DISPOSED | ANONYMIZED | TRANSFERRED
```

Estados transversales:

- `HOLD_ACTIVE`;
- `PRESERVATION_REQUIRED`;
- `DISPOSITION_BLOCKED`;
- `DISPOSITION_FAILED`;
- `POLICY_UNRESOLVED`.

Cada transición futura deberá conservar política y versión, actor o sistema, razón, fecha, alcance, estado anterior, estado nuevo y evidencia de soporte. Ningún estado se infiere desde un bucket, carpeta, borrado lógico, ausencia en interfaz o movimiento técnico.

---

#### 11. `INFO-ARCHIVE-CONTRACT-001`

Archivo significa conservación gobernada de un objeto que deja de ser de uso operativo ordinario pero debe permanecer interpretable y localizable bajo política.

El archivo deberá preservar:

- `document_id`, versión y `document_context_id`;
- proceso, instancia y recurso empresarial;
- clasificación y reglas de acceso;
- metadatos y vínculo con representaciones;
- integridad y legibilidad;
- política y versión de retención;
- trigger y tiempos relevantes;
- procedencia y custodia;
- índice o mecanismo de búsqueda autorizado;
- posibilidad de migración futura sin perder significado;
- elegibilidad y disposición futura cuando la política lo permita.

No constituyen archivo por sí solos:

- un backup;
- una carpeta personal;
- un bucket o prefijo técnico;
- una exportación manual sin custodia;
- una tabla legacy abandonada;
- un dispositivo o correo electrónico;
- un objeto movido a almacenamiento frío sin metadatos y política resolubles.

Archivar no cambia automáticamente la clasificación, no concede acceso, no sustituye la política y no elimina el deber de disposición futura cuando corresponda.

---

#### 12. `INFO-LEGAL-HOLD-CONTRACT-001`

Todo hold deberá materializar, como mínimo:

```text
hold_id
hold_type
scope_query_or_manifest
reason_code
authority_ref
requested_by
approved_by
issued_at
effective_at
review_at
release_condition
released_at
custodian
notification_status
preservation_actions[]
exceptions[]
```

Reglas:

1. un hold tiene alcance explícito; no existe un hold global por conveniencia;
2. un hold activo prevalece sobre anonimización destructiva, eliminación y disposición incompatible;
3. imponer hold no amplía permisos, visibilidad, finalidad ni clasificación;
4. el alcance se propaga a copias, derivados, índices, archivos y representaciones gobernadas cuando formen parte del manifiesto o de la política aplicable;
5. el hold conserva propietario, revisión y condición de salida; no puede permanecer indefinidamente sin revisión;
6. modificar o liberar hold es un hecho separado, autorizado y auditable;
7. la liberación conserva historia y recalcula elegibilidad; no elimina automáticamente;
8. una solicitud informal, comentario o mensaje sin autoridad no se transforma en hold ejecutable;
9. si la autoridad, el alcance o la relación con los objetos no son resolubles, se bloquea la disposición conservando la incertidumbre.

---

#### 13. Elegibilidad de disposición

Una identidad solo podrá llegar a `ELIGIBLE_FOR_DISPOSITION` cuando simultáneamente:

- exista política y versión resolubles;
- exista trigger autoritativo verificable;
- el mínimo haya sido satisfecho;
- el máximo y la regla de acción sean evaluables;
- el estado del recurso permita disposición;
- no exista hold activo incompatible;
- no exista preservación requerida, investigación, obligación o excepción pendiente;
- copias y derivados estén inventariados suficientemente;
- tratamiento de terceros sea conocido cuando aplique;
- tratamiento de backups sea conocido;
- no existan fallos de disposición anteriores sin reconciliar;
- exista autoridad para aprobar el método.

`RET_UNRESOLVED` bloquea tanto la ejecución automática como cualquier certificado que pretenda afirmar disposición completa.

---

#### 14. Manifiesto de disposición

Antes de una ejecución futura deberá existir un manifiesto versionado que fije:

- política y versión;
- identidad o conjunto exacto de identidades;
- proceso, instancia y recurso;
- trigger y fecha de elegibilidad;
- método autorizado;
- filas, archivos y representaciones;
- adjuntos, thumbnails, cachés, índices y búsquedas;
- exportaciones controladas y copias temporales;
- derivados y agregados identificables cuando sigan sujetos a la política;
- terceros y estado de su copia;
- backups y tratamiento pendiente;
- hold y excepciones evaluados;
- aprobador, ejecutor y segregación aplicable;
- mecanismo de reintento idempotente;
- criterios de éxito, fallo parcial y residual;
- evidencia esperada de verificación.

No se certifica un conjunto si algún componente requerido queda desconocido, pendiente o fallido sin tratamiento explícito.

---

#### 15. Segregación de funciones para disposición

Las funciones lógicas se mantienen separadas:

```text
SOLICITAR
≠ APROBAR
≠ EJECUTAR
≠ VERIFICAR
≠ CERTIFICAR
```

La política de autorización definitiva corresponde al dominio de autorización aplicable. Esta tarea establece que una disposición sensible no puede asumir que la misma identidad solicita, aprueba, ejecuta y certifica sin una excepción explícita y auditable.

---

#### 16. Anonimización

La anonimización solo puede ser un método de disposición cuando:

- la política la autoriza;
- existe método y versión documentados;
- se conoce el conjunto de atributos, claves, derivados y fuentes correlacionables relevantes;
- se evalúa el riesgo de reidentificación con el contexto razonablemente disponible;
- el resultado deja de poder vincularse razonablemente con la persona o sujeto bajo el contrato aprobado;
- no existe hold o preservación incompatible;
- se tratan copias, índices, exportaciones y derivados gobernados;
- se conserva evidencia mínima del método y resultado sin conservar por esa vía los datos dispuestos.

Ocultar identificadores directos, tokenizar, seudonimizar, truncar, enmascarar o retirar columnas no demuestra por sí solo anonimización. Si la transformación es reversible o el sujeto sigue razonablemente reidentificable, el resultado continúa sujeto al gobierno correspondiente.

El método criptográfico, hash o prueba de integridad del resultado queda fuera del alcance de esta tarea y corresponde a `INFO-DOM-007` cuando aplique.

---

#### 17. Eliminación controlada

Una eliminación completa no equivale a ejecutar `DELETE` sobre una fila ni a retirar un objeto principal de Storage.

La ejecución futura deberá:

1. fijar el manifiesto;
2. verificar política, trigger, mínimo, máximo, estado y autoridad;
3. verificar hold, investigación, obligación y excepción;
4. tratar referencias y dependencias sin crear huérfanos silenciosos;
5. tratar representaciones, adjuntos, thumbnails, índices, cachés, colas, exportaciones y derivados gobernados;
6. distinguir copias de terceros pendientes y verificadas;
7. tratar backups conforme a su ciclo sin permitir uso ordinario de información ya dispuesta;
8. ejecutar de forma idempotente y registrar resultado por componente;
9. conservar `DISPOSITION_FAILED` ante cualquier fallo parcial material;
10. verificar residuales antes de cerrar;
11. crear evidencia o certificado solo después del resultado verificado;
12. impedir resurrección ordinaria después de restauraciones futuras.

Un componente ya dispuesto no se destruye de nuevo por un reintento; el sistema debe consultar el resultado previo y reconciliar el estado.

---

#### 18. Backups y no resurrección

Backup conserva finalidad de recuperación y ciclo propio; no es archivo ni mecanismo para evadir disposición.

Si una copia de backup no puede purgarse inmediatamente sin comprometer el contrato de recuperación, la política deberá declarar su expiración y el tratamiento del dato dispuesto. Durante ese intervalo:

- la copia no se vuelve fuente de consulta ordinaria;
- una restauración debe reaplicar disposiciones, tombstones, revocaciones, políticas y holds posteriores al punto recuperado antes de habilitar acceso;
- el dato no puede reaparecer como vigente por el solo hecho de existir en un punto de recuperación;
- la expiración del backup no sustituye la verificación de la disposición en los sistemas ordinarios.

---

#### 19. Terceros y copias externas

Cuando exista una copia gobernada en un tercero, la disposición interna no permite afirmar eliminación global mientras su tratamiento permanezca pendiente.

Estados lógicos permitidos para el seguimiento:

- `DISPOSED_INTERNAL`;
- `THIRD_PARTY_PENDING`;
- `DISPOSED_VERIFIED`.

El detalle contractual de terceros, destinatarios, subencargados y transferencias corresponde a `INFO-DOM-010` e `INFO-INT-003`. Esta tarea exige conservar el estado y la evidencia necesarios para no certificar más alcance del realmente verificado.

---

#### 20. `INFO-DISPOSITION-CERTIFICATE-CONTRACT-001`

Un certificado podrá existir únicamente después de una ejecución real y verificada. Esta tarea define el contrato; no emite certificados de objetos reales.

Contenido mínimo:

```text
disposition_certificate_id
disposition_manifest_id
retention_policy_id
retention_policy_version
scope_ref
process_ref
resource_ref
trigger_event_ref
eligibility_evaluated_at
hold_check_ref
approved_method
execution_started_at
execution_completed_at
requested_by
approved_by
executed_by
verified_by
components_expected
components_succeeded
components_failed
third_party_status
backup_status
residual_status
result_status
verification_refs[]
exception_refs[]
issued_at
integrity_evidence_ref
```

Reglas:

1. el certificado no contiene el contenido eliminado o anonimizado;
2. `result_status` no puede ser exitoso si existen componentes materiales fallidos o desconocidos;
3. `THIRD_PARTY_PENDING`, backups vigentes o residuales se declaran expresamente y limitan el alcance del certificado;
4. el certificado conserva segregación entre aprobación, ejecución y verificación según riesgo;
5. una política `RET_UNRESOLVED` no puede producir certificado de disposición completa;
6. una evidencia de eliminación técnica parcial no equivale a certificado empresarial;
7. la prueba criptográfica o mecanismo exacto de integridad se completará bajo `INFO-DOM-007` sin reescribir el contenido del certificado.

---

#### 21. Tratamiento de cambios de política

- una política nueva requiere versión nueva;
- la versión anterior permanece interpretable para historia;
- el cambio de mínimo, máximo, trigger, método, alcance, obligación, excepción o tratamiento de backup es material;
- no se aplica retroactivamente una política más corta o más larga sin fundamento, autoridad y regla explícita;
- una política sustituida conserva `superseded_at` y sus referencias históricas;
- una política retirada no borra certificados, holds ni decisiones emitidas bajo ella;
- si una versión nueva deja una identidad sin regla resoluble, el estado vuelve a `POLICY_UNRESOLVED` y bloquea disposición.

---

#### 22. Fronteras con tareas posteriores

- `INFO-DOM-007` define autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia; esta tarea solo exige referencias de integridad donde correspondan.
- `INFO-DOM-008` gobierna fundamentos, consentimientos y condiciones de tratamiento de datos personales sin reemplazar la política de retención.
- `INFO-DOM-010` gobierna terceros, encargados, destinatarios y transferencias; esta tarea conserva el estado de disposición externa.
- `INFO-DOM-012` es el propietario documental del registro de obligaciones, controles, evidencias, responsables y brechas que deberá aportar fundamentos verificables para resolver periodos todavía pendientes.
- `INFO-DOM-013` gobierna investigación de accesos o cambios indebidos, preservación y cierre; un caso activo puede imponer preservación o hold sin alterar silenciosamente la política normal.
- los bloques E3/R y paquetes E5 materializarán tablas, jobs, migraciones, autorizaciones y ejecuciones físicas cuando sean autorizados; esta tarea no los implementa.

---

#### 23. Matriz materializada `INFO-RETENTION-DISPOSITION-MATRIX-001` — 332 de 332

Cada identidad conserva su clase base heredada. La estructura de política, perfil de evento, archivo, hold, disposición y certificado queda especificada; la política ejecutable permanece bloqueada porque mínimo, máximo y fundamento verificable no están disponibles en las fuentes actuales.

| ID contextual          | Proceso      | Clase base           | Política         | Evento de cómputo                             | Mínimo                   | Máximo                   | Archivo                  | Hold                  | Disposición           | Certificado                                 | Estado      | Bloqueo / frontera                                         |
| ---------------------- | ------------ | -------------------- | ---------------- | --------------------------------------------- | ------------------------ | ------------------------ | ------------------------ | --------------------- | --------------------- | ------------------------------------------- | ----------- | ---------------------------------------------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `RET_ARCHIVAL`       | `RET_UNRESOLVED` | `RET_EVT_ARCHIVAL_AUTHORITY_REQUIRED`         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `RET_RELATIONSHIP`   | `RET_UNRESOLVED` | `RET_EVT_RELATIONSHIP_AND_OBLIGATIONS_CLOSED` | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `RET_OBLIGATION`     | `RET_UNRESOLVED` | `RET_EVT_LAST_OBLIGATION_CLOSED`              | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING`                      |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `RET_ACTIVE_CASE`    | `RET_UNRESOLVED` | `RET_EVT_CASE_CLOSED`                         | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `RET_BUSINESS_CYCLE` | `RET_UNRESOLVED` | `RET_EVT_BUSINESS_CYCLE_CLOSED`               | `PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | `ARCHIVE_BY_POLICY_ONLY` | `HOLD_CHECK_REQUIRED` | `DISPOSITION_BLOCKED` | `CERTIFICATE_AFTER_VERIFIED_EXECUTION_ONLY` | `BLOQUEADO` | `RET_POLICY_PERIOD_AND_BASIS_PENDING+FRONTERA_OBLIGATORIA` |


---

#### 24. Reconciliación cuantitativa

| Clase                | Esperado | Materializado |
| -------------------- | -------: | ------------: |
| `RET_ACTIVE_CASE`    |   **33** |        **33** |
| `RET_BUSINESS_CYCLE` |  **184** |       **184** |
| `RET_RELATIONSHIP`   |   **36** |        **36** |
| `RET_OBLIGATION`     |   **66** |        **66** |
| `RET_ARCHIVAL`       |   **13** |        **13** |
| **Total**            |  **332** |       **332** |

| Frontera heredada      | Esperado | Materializado |
| ---------------------- | -------: | ------------: |
| `NINGUNO`              |   **73** |        **73** |
| `FRONTERA_OBLIGATORIA` |  **245** |       **245** |
| `APLICACION_DIFERIDA`  |   **14** |        **14** |
| **Total**              |  **332** |       **332** |

Resultado de integridad documental:

- 332 identificadores esperados;
- 332 filas materializadas;
- 332 claves `DOCCTX-*` únicas;
- 69 procesos representados;
- 0 faltantes;
- 0 duplicados;
- 332 políticas ejecutables todavía `RET_UNRESOLVED`;
- 332 identidades con disposición bloqueada por falta de periodo y fundamento verificable;
- 0 identidades habilitadas para disposición automática.

---

#### 25. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

La tarea materializa decisiones dentro de comportamientos ya protegidos por el registro canónico vigente: política versionada, triggers autoritativos, mínimo/máximo, estados de retención, legal hold, archivo, elegibilidad, segregación, disposición idempotente, anonimización, copias, terceros, backups, no resurrección y certificado. No amplía el comportamiento protegido ni retira una protección existente.

Balance:

- creados: 0;
- modificados: 0;
- diferidos: 0;
- descartados: 0;
- obsoletos: 0.

---

#### 26. Criterios de aceptación

- [x] Se preservan 69/69 procesos y 332/332 identidades `DOCCTX-*`.
- [x] Cada identidad tiene decisión explícita de clase, política, evento, mínimo, máximo, archivo, hold, disposición, certificado, estado y bloqueo.
- [x] Se preservan exactamente las distribuciones heredadas de clases y fronteras.
- [x] Se define el contrato completo de política versionada de retención.
- [x] Se define un catálogo cerrado de eventos de cómputo y se impide usar timestamps técnicos ambiguos como sustituto.
- [x] Se distinguen periodo mínimo y periodo máximo.
- [x] No se inventa ningún plazo numérico ni fundamento ausente.
- [x] Las 332 políticas continúan bloqueadas mientras no exista fundamento, mínimo y máximo verificables.
- [x] Se define archivo sin confundirlo con backup ni ubicación técnica.
- [x] Se define imposición, revisión y liberación de legal hold sin ampliar permisos.
- [x] Se define elegibilidad y manifiesto de disposición con tratamiento de copias, derivados, terceros y backups.
- [x] Se define anonimización sin equipararla a masking, tokenización o seudonimización.
- [x] Se define eliminación idempotente con estado de fallo parcial y no resurrección.
- [x] Se define el certificado de disposición sin emitir evidencia ficticia.
- [x] Se preservan las fronteras con autenticidad, privacidad, terceros, obligaciones, investigación e implementación física.
- [x] No se realizan cambios físicos ni se habilita disposición automática.
- [x] El balance de requisitos de prueba es cero cambios.

---

#### 27. Continuidad

ÚLTIMA TAREA APROBADA

`INFO-DOM-005 — Definir metadatos, almacenamiento, búsqueda, localización y vínculo con recursos empresariales`

TAREA ACTUAL APROBADA

`INFO-DOM-006 — Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición`

SIGUIENTE TAREA RESERVADA

`INFO-DOM-007 — Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia`


### ✅ INFO-DOM-007 — Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia

**Estado:** APROBADA
**Tarea anterior:** `INFO-DOM-006 — Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición` — APROBADA
**Tarea siguiente:** `INFO-DOM-008 — Definir avisos, finalidades, autorizaciones, fundamentos, consentimiento, revocación y datos sensibles` — RESERVADA
**Tipo de tarea:** documental; materialización transversal del contrato corporativo de autenticidad, integridad, procedencia, evidencia temporal, preservación y cadena de custodia
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md`
**Universo heredado:** 69 procesos `VPROC-*` y 332 identidades contextuales `DOCCTX-*`
**Contratos materializados:** `INFO-DOCUMENT-AUTHENTICITY-CONTRACT-001`; `INFO-DOCUMENT-INTEGRITY-CONTRACT-001`; `INFO-DOCUMENT-PROVENANCE-CONTRACT-001`; `INFO-DOCUMENT-TRUSTED-TIME-CONTRACT-001`; `INFO-DOCUMENT-PRESERVATION-CONTRACT-001`; `INFO-DOCUMENT-CHAIN-OF-CUSTODY-CONTRACT-001`; `INFO-DOCUMENT-AUTHENTICITY-CUSTODY-MATRIX-001`
**Cambios físicos autorizados:** ninguno; esta tarea no crea ni modifica esquema, datos, Storage, proveedores de tiempo, mecanismos de firma ni infraestructura de preservación

#### 1. Propósito y resultado material

Esta tarea materializa, para el universo documental corporativo ya identificado, el contrato que permite distinguir y conservar evidencia verificable de autenticidad, integridad, procedencia, tiempo, preservación y custodia sin convertir una señal técnica aislada en prueba de hechos que no demuestra.

El resultado establece reglas consumibles para documentos, registros y evidencias, y las aplica explícitamente a las 332 identidades `DOCCTX-*`. La materialización es normativa y no afirma que las instancias físicas o digitales actualmente existentes ya dispongan de toda la evidencia requerida.

#### 2. Principios de separación obligatoria

1. Autenticidad, integridad, procedencia, temporalidad, preservación y custodia son dimensiones relacionadas pero no intercambiables.
2. Un hash de contenido prueba fijación de bytes bajo un algoritmo y contrato determinados; por sí solo no prueba autoría, identidad del emisor, intención, aceptación, firma, fecha jurídica, validez empresarial ni cumplimiento.
3. Antivirus, validación de formato, legibilidad técnica o ausencia de corrupción no equivalen a autenticidad.
4. Firma electrónica, firma digital, aceptación y niveles de evidencia de firma permanecen bajo `INFO-DOM-011`; esta tarea solo conserva las referencias y evidencias que existan sin atribuirles un nivel no aprobado.
5. Vigencia documental y fechas de efecto definidas en `INFO-DOM-004` son distintas de los tiempos técnicos o probatorios de creación, recepción, registro, confirmación y sincronización.
6. Localización y almacenamiento definidos en `INFO-DOM-005` no prueban autenticidad ni custodia por sí solos.
7. Retención, legal hold, archivo y disposición definidos en `INFO-DOM-006` gobiernan cuánto debe conservarse la evidencia; preservación no significa retención indefinida.
8. Una copia, derivado o representación técnica no adquiere autoridad empresarial por existir, tener el mismo hash o estar alojada en una infraestructura corporativa.

#### 3. `INFO-DOCUMENT-AUTHENTICITY-CONTRACT-001`

La autenticidad se evalúa respecto de una identidad documental y una versión concretas. Debe poder resolverse un conjunto suficiente de evidencia que conecte el objeto con su origen, contexto empresarial, procedencia y hechos de incorporación o emisión.

El contrato mínimo de autenticidad conserva, cuando sean aplicables y estén respaldados por evidencia:

- `document_id`, `document_context_id`, `document_version` y `representation_id`;
- proceso, instancia de proceso y recurso empresarial relacionado;
- origen o fuente declarada y evidencia que permita sostener esa declaración;
- creador, emisor, sistema productor o fuente técnica solo cuando pueda atribuirse de forma verificable;
- evento de creación, emisión, recepción, incorporación, aprobación o registro que corresponda;
- referencias de integridad de la versión y representación exactas;
- referencias de procedencia, custodia y evidencia temporal pertinentes;
- estado de resolución de la afirmación de autenticidad y sus bloqueos.

Reglas obligatorias:

- `AUTHENTICITY_EVIDENCE_REQUIRED` exige evidencia positiva; nombre de archivo, ruta, bucket, URL, usuario visible, metadato libre o hash aislado no bastan.
- `AUTHENTICITY_NO_HASH_SHORTCUT` impide concluir autenticidad a partir de igualdad de digest.
- `AUTHENTICITY_NO_SIGNATURE_INFERENCE` impide concluir firma o aceptación por presencia de una imagen, certificado, nombre, sello o campo técnico no validado por el contrato propietario.
- `AUTHENTICITY_VERSION_SCOPED` vincula la afirmación a la versión y representación exactas; una versión posterior requiere su propia evidencia.
- `AUTHENTICITY_FAIL_CLOSED` impide afirmar autenticidad verificable cuando la evidencia esencial no sea resoluble.

Cuando una instancia concreta no tenga evidencia suficiente, el estado aplicable será `PENDIENTE_DE_EVIDENCIA`, con el insumo faltante identificado. La condición de salida es que la fuente autoritativa correspondiente sea resoluble y satisfaga este contrato; no se suple con inferencias.

#### 4. `INFO-DOCUMENT-INTEGRITY-CONTRACT-001`

La integridad de contenido se controla mediante registros de fijación vinculados a los bytes exactos de una representación concreta. El registro de integridad es evidencia técnica versionada, no identidad documental ni firma.

Cada registro de fijación deberá poder conservar:

- `integrity_record_id`;
- `document_id`, `document_version` y `representation_id`;
- algoritmo o perfil criptográfico identificado y versionado;
- digest calculado;
- longitud exacta en bytes;
- momento de cálculo y actor o servicio que lo produjo;
- resultado de verificación;
- momento, actor o servicio de verificación;
- referencia a la verificación previa cuando exista;
- evidencia técnica de lectura, cálculo o comparación suficiente para auditoría.

Reglas obligatorias:

- `INTEGRITY_EXACT_BYTES` vincula el digest a una secuencia exacta de bytes, no a una interpretación visual o nombre lógico.
- `INTEGRITY_ALGORITHM_VERSIONED` exige algoritmo y versión resolubles; esta tarea no impone un algoritmo global no sustentado por una fuente canónica.
- `INTEGRITY_NO_IDENTITY_MERGE` establece que dos representaciones con el mismo digest no se fusionan ni comparten identidad automáticamente.
- `INTEGRITY_CHANGED_BYTES_NEW_EVIDENCE` obliga a generar nueva evidencia de fijación cuando cambien los bytes; el tratamiento como nueva versión, representación o derivado sigue el ciclo documental aprobado.
- `INTEGRITY_DERIVATIVE_OWN_DIGEST` exige digest propio para derivados y mantiene vínculo con su fuente.
- `INTEGRITY_REVERIFY` permite y exige, cuando la política de preservación lo requiera, verificaciones periódicas sin sobrescribir el historial previo.
- `INTEGRITY_FAILURE_FAIL_CLOSED` trata una discrepancia no explicada como incidente de integridad y evita presentar el objeto como verificado hasta su resolución.

#### 5. `INFO-DOCUMENT-PROVENANCE-CONTRACT-001`

La procedencia describe de dónde proviene una versión o representación, cómo ingresó al dominio gobernado y qué transformaciones verificables la conectan con su origen. Se conserva como historia append-only.

Cada evento de procedencia deberá poder registrar:

- `provenance_event_id`;
- documento, versión y representación exactos;
- proceso, instancia y recurso empresarial aplicables;
- tipo de origen: producción interna, recepción externa, importación, migración, captura física, derivación o mecanismo equivalente explícitamente gobernado;
- identificador de fuente o referencia autoritativa cuando exista;
- actor, servicio, emisor o sistema fuente verificable;
- evento que explica incorporación, transformación o derivación;
- representación o versión fuente cuando exista una relación de linaje;
- método, regla o versión de transformación cuando aplique;
- tiempos tipados;
- `correlation_id` y `causation_id` cuando existan en la cadena causal;
- resultado y referencias de evidencia.

Una corrección de procedencia crea un nuevo evento que explica la rectificación y enlaza el hecho previo; no reescribe silenciosamente la procedencia histórica.

#### 6. `INFO-DOCUMENT-TRUSTED-TIME-CONTRACT-001`

El modelo temporal conserva significados distintos para los momentos relevantes. Para cada hecho se utilizará únicamente el campo cuyo significado pueda sostenerse por la fuente y el mecanismo observados.

Tiempos tipados mínimos, cuando apliquen:

- `occurred_at`: momento en que ocurrió el hecho empresarial o técnico;
- `recorded_at`: momento en que el hecho fue registrado por el productor;
- `received_at`: momento en que un receptor verificable recibió el hecho u objeto;
- `committed_at`: momento en que la persistencia autoritativa confirmó el commit;
- `synchronized_at`: momento en que una operación diferida u offline fue sincronizada;
- zona horaria, fuente de reloj y evidencia de deriva o sincronización cuando sean relevantes.

Reglas obligatorias:

- `TIME_NO_UPDATED_AT_PROXY` prohíbe usar un timestamp genérico de modificación como sustituto de un hecho tipado.
- `TIME_NO_PERSISTENCE_ORDER_INFERENCE` prohíbe ordenar hechos únicamente por el momento de persistencia cuando exista creación offline, recepción tardía, reintento o sincronización.
- `TIME_EFFECTIVE_DATE_SEPARATE` mantiene separadas las fechas de vigencia empresarial de los timestamps técnicos y probatorios.
- `TIME_TRUST_CLAIM_EVIDENCED` permite declarar sello o timestamp confiable, cualificado o equivalente únicamente cuando exista evidencia del mecanismo y de su autoridad aplicable; su ausencia impide esa afirmación.
- `TIME_SOURCE_EXPLICIT` exige fuente de reloj o mecanismo temporal cuando la precisión o el orden formen parte de la prueba.

#### 7. `INFO-DOCUMENT-PRESERVATION-CONTRACT-001`

La preservación conserva la capacidad de demostrar identidad, contenido, contexto, integridad, procedencia y lectura de una versión durante el periodo en que su política obliga a mantenerla.

El contrato exige:

- preservar identidad lógica, versión y representaciones gobernadas;
- mantener metadatos y vínculos empresariales necesarios para interpretar el objeto;
- mantener procedencia y cadena de custodia;
- conservar evidencia de integridad y resultados de verificaciones periódicas;
- preservar legibilidad o capacidad controlada de interpretación cuando el formato o soporte envejezca;
- documentar toda migración, conversión, reparación o restauración que cambie representación;
- mantener el original o la referencia autoritativa requerida mientras la política aplicable lo exija;
- tratar cada derivado como representación identificable con digest y linaje propios;
- mantener los controles de clasificación, autorización, retención y hold durante preservación.

Una copia de recuperación no se convierte por ello en archivo permanente ni en nueva fuente empresarial. Una conversión de formato no puede destruir el vínculo con la representación fuente ni ocultar diferencias de contenido.

#### 8. `INFO-DOCUMENT-CHAIN-OF-CUSTODY-CONTRACT-001`

La cadena de custodia registra cambios verificables de posesión, control, custodia o responsabilidad material sobre una representación, sin confundirlos con propiedad empresarial, autorización de acceso ni titularidad jurídica.

Cada evento de custodia deberá poder conservar:

- `custody_event_id`;
- documento, versión y representación exactos;
- custodio anterior y custodio posterior cuando exista transferencia;
- actor o servicio que ejecuta o registra la acción;
- autoridad y finalidad de la acción;
- tipo de evento: recepción, entrega, traslado, depósito, retiro, préstamo, devolución, transferencia técnica, recuperación, preservación o equivalente gobernado;
- `occurred_at` y `recorded_at`, y otros tiempos tipados cuando apliquen;
- localización anterior y posterior mediante las referencias gobernadas por `INFO-DOM-005`;
- evidencia de integridad previa y posterior cuando la naturaleza del evento lo requiera;
- `correlation_id`, `causation_id` y referencia de evidencia cuando existan;
- resultado, excepción y estado de reconciliación.

Reglas obligatorias:

- `CUSTODY_NO_AUTHORITY_TRANSFER` establece que transferir custodia no transfiere por sí mismo autoridad empresarial, propiedad, clasificación ni permisos.
- `CUSTODY_PHYSICAL_DIGITAL_SEPARATE` mantiene eventos físicos y digitales diferenciados aunque pertenezcan al mismo documento lógico.
- `CUSTODY_ACCESS_NOT_TRANSFER` impide registrar una consulta o lectura como transferencia de custodia si no cambia el control o posesión de la representación.
- `CUSTODY_APPEND_ONLY` conserva eventos previos y registra correcciones como nuevos hechos enlazados.
- `CUSTODY_GAP_VISIBLE` obliga a marcar un intervalo no demostrable como brecha de custodia; no se rellena con actores, fechas o ubicaciones inferidos.

#### 9. Relación entre autenticidad, integridad y cadena probatoria

Una afirmación fuerte sobre un documento debe poder reconstruirse desde referencias estables: identidad y versión → procedencia → evidencia temporal → integridad de la representación → eventos de custodia → preservación → estado de retención y disponibilidad. La ausencia de una dimensión no se compensa silenciosamente con otra.

El contrato permite resultados parciales explícitos: una representación puede tener integridad verificada y procedencia pendiente; puede tener procedencia conocida y una brecha de custodia; puede conservar cadena de custodia sin existir evidencia suficiente para atribuir autoría. Cada estado se expresa de forma independiente.

#### 10. Estados de resolución y tratamiento de faltantes

| Estado                   | Uso en esta tarea                                                                                                                 |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| `ESPECIFICADO`           | El contrato normativo y su aplicabilidad a la identidad `DOCCTX-*` están materializados.                                          |
| `PENDIENTE_DE_EVIDENCIA` | Una instancia concreta necesita evidencia autoritativa que todavía no puede resolverse.                                           |
| `BLOQUEADO`              | Una operación dependiente no puede continuar porque falta evidencia requerida o existe una discrepancia material no reconciliada. |
| `NO_APLICA`              | La dimensión no corresponde a una representación o evento concreto y existe justificación explícita.                              |
| `FUERA_DE_ALCANCE`       | La decisión pertenece a otra tarea canónica y se mantiene separada.                                                               |

Todo pendiente deberá registrar el insumo faltante, el propietario de la fuente o proceso, la tarea responsable cuando exista y la condición de salida. Esta tarea no inventa actores, emisores, custodios, timestamps, hashes, firmas, ubicaciones ni eventos ausentes.

#### 11. Fronteras de responsabilidad

- `INFO-DOM-005` conserva metadatos, vínculo empresarial, localización, almacenamiento y búsqueda autorizada.
- `INFO-DOM-006` conserva política de retención, eventos de cómputo, archivo, hold, disposición, anonimización y certificado.
- `INFO-DOM-008` definirá fundamentos, finalidades, autorizaciones, consentimiento, revocación y tratamiento de datos sensibles.
- `INFO-DOM-010` definirá compartición, divulgación, terceros, encargados, transferencias y requerimientos de autoridad.
- `INFO-DOM-011` definirá aprobación, aceptación, firma electrónica, firma digital y niveles de evidencia.
- `INFO-DOM-013` definirá monitoreo, auditorías, investigaciones, hallazgos, acciones correctivas y evidencia de cumplimiento.
- `EVID-ARC-006` mantiene la validación técnica de integridad, hash y archivos; esta tarea la integra en el gobierno documental sin redefinir sus controles físicos.
- Los servicios de auditoría y evidencia conservan eventos y trazabilidad; esta tarea no implementa almacenamiento, funciones, jobs ni políticas técnicas.

#### 12. `INFO-DOCUMENT-AUTHENTICITY-CUSTODY-MATRIX-001`

La matriz aplica el contrato a cada identidad contextual heredada. `ESPECIFICADO` expresa cobertura normativa, no evidencia de que todas las instancias existentes ya hayan sido verificadas.

| DOCCTX                 | VPROC        | Autenticidad                     | Integridad                  | Procedencia           | Tiempo                | Preservación            | Custodia                 | Retención base       | Resultado            | Estado         | Bloqueo / frontera     |
| ---------------------- | ------------ | -------------------------------- | --------------------------- | --------------------- | --------------------- | ----------------------- | ------------------------ | -------------------- | -------------------- | -------------- | ---------------------- |
| `DOCCTX-VPROC-0001-01` | `VPROC-0001` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0001-02` | `VPROC-0001` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0002-01` | `VPROC-0002` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0002-02` | `VPROC-0002` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0003-01` | `VPROC-0003` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0004-01` | `VPROC-0004` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-01` | `VPROC-0005` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-02` | `VPROC-0005` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-03` | `VPROC-0005` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-04` | `VPROC-0005` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0005-05` | `VPROC-0005` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-01` | `VPROC-0006` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-02` | `VPROC-0006` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-03` | `VPROC-0006` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0006-04` | `VPROC-0006` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-01` | `VPROC-0007` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-02` | `VPROC-0007` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0007-03` | `VPROC-0007` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0008-01` | `VPROC-0008` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0009-01` | `VPROC-0009` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-01` | `VPROC-0010` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-02` | `VPROC-0010` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-03` | `VPROC-0010` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0010-04` | `VPROC-0010` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-01` | `VPROC-0011` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-02` | `VPROC-0011` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-03` | `VPROC-0011` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0011-04` | `VPROC-0011` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-01` | `VPROC-0012` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-02` | `VPROC-0012` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-03` | `VPROC-0012` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-04` | `VPROC-0012` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0012-05` | `VPROC-0012` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-01` | `VPROC-0013` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-02` | `VPROC-0013` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0013-03` | `VPROC-0013` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-01` | `VPROC-0014` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-02` | `VPROC-0014` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-03` | `VPROC-0014` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0014-04` | `VPROC-0014` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0015-01` | `VPROC-0015` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-02` | `VPROC-0015` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-03` | `VPROC-0015` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0015-04` | `VPROC-0015` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0016-01` | `VPROC-0016` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-02` | `VPROC-0016` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-03` | `VPROC-0016` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0016-04` | `VPROC-0016` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0017-01` | `VPROC-0017` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-01` | `VPROC-0018` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-02` | `VPROC-0018` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-03` | `VPROC-0018` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0018-04` | `VPROC-0018` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0019-01` | `VPROC-0019` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0019-02` | `VPROC-0019` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0019-03` | `VPROC-0019` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-01` | `VPROC-0020` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-02` | `VPROC-0020` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-03` | `VPROC-0020` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-04` | `VPROC-0020` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0020-05` | `VPROC-0020` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-01` | `VPROC-0021` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-02` | `VPROC-0021` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0021-03` | `VPROC-0021` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0022-01` | `VPROC-0022` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-02` | `VPROC-0022` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0022-03` | `VPROC-0022` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0023-01` | `VPROC-0023` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0023-02` | `VPROC-0023` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-01` | `VPROC-0024` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-02` | `VPROC-0024` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0024-03` | `VPROC-0024` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0025-01` | `VPROC-0025` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0025-02` | `VPROC-0025` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-01` | `VPROC-0026` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-02` | `VPROC-0026` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-03` | `VPROC-0026` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-04` | `VPROC-0026` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0026-05` | `VPROC-0026` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0027-01` | `VPROC-0027` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0027-02` | `VPROC-0027` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-01` | `VPROC-0028` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-02` | `VPROC-0028` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-03` | `VPROC-0028` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-04` | `VPROC-0028` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-05` | `VPROC-0028` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-06` | `VPROC-0028` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0028-07` | `VPROC-0028` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0029-01` | `VPROC-0029` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-02` | `VPROC-0029` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-03` | `VPROC-0029` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-04` | `VPROC-0029` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-05` | `VPROC-0029` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0029-06` | `VPROC-0029` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0030-01` | `VPROC-0030` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-02` | `VPROC-0030` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-03` | `VPROC-0030` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-04` | `VPROC-0030` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-05` | `VPROC-0030` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0030-06` | `VPROC-0030` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0031-01` | `VPROC-0031` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-02` | `VPROC-0031` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-03` | `VPROC-0031` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-04` | `VPROC-0031` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-05` | `VPROC-0031` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-06` | `VPROC-0031` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0031-07` | `VPROC-0031` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-01` | `VPROC-0032` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-02` | `VPROC-0032` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-03` | `VPROC-0032` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-04` | `VPROC-0032` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0032-05` | `VPROC-0032` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0033-01` | `VPROC-0033` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-02` | `VPROC-0033` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-03` | `VPROC-0033` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-04` | `VPROC-0033` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0033-05` | `VPROC-0033` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-01` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-02` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-03` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-04` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-05` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-06` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-07` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0034-08` | `VPROC-0034` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-01` | `VPROC-0035` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-02` | `VPROC-0035` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-03` | `VPROC-0035` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0035-04` | `VPROC-0035` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-01` | `VPROC-0036` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-02` | `VPROC-0036` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-03` | `VPROC-0036` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0036-04` | `VPROC-0036` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-01` | `VPROC-0037` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-02` | `VPROC-0037` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-03` | `VPROC-0037` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-04` | `VPROC-0037` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0037-05` | `VPROC-0037` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0038-01` | `VPROC-0038` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-02` | `VPROC-0038` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-03` | `VPROC-0038` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-04` | `VPROC-0038` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-05` | `VPROC-0038` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0038-06` | `VPROC-0038` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-01` | `VPROC-0039` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-02` | `VPROC-0039` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-03` | `VPROC-0039` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-04` | `VPROC-0039` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-05` | `VPROC-0039` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0039-06` | `VPROC-0039` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0040-01` | `VPROC-0040` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-02` | `VPROC-0040` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-03` | `VPROC-0040` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-04` | `VPROC-0040` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0040-05` | `VPROC-0040` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-01` | `VPROC-0041` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-02` | `VPROC-0041` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-03` | `VPROC-0041` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-04` | `VPROC-0041` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0041-05` | `VPROC-0041` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-01` | `VPROC-0042` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-02` | `VPROC-0042` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-03` | `VPROC-0042` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0042-04` | `VPROC-0042` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-01` | `VPROC-0043` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-02` | `VPROC-0043` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-03` | `VPROC-0043` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-04` | `VPROC-0043` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-05` | `VPROC-0043` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0043-06` | `VPROC-0043` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-01` | `VPROC-0044` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-02` | `VPROC-0044` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-03` | `VPROC-0044` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-04` | `VPROC-0044` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-05` | `VPROC-0044` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0044-06` | `VPROC-0044` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-01` | `VPROC-0045` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-02` | `VPROC-0045` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-03` | `VPROC-0045` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0045-04` | `VPROC-0045` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-01` | `VPROC-0046` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-02` | `VPROC-0046` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-03` | `VPROC-0046` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-04` | `VPROC-0046` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-05` | `VPROC-0046` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-06` | `VPROC-0046` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0046-07` | `VPROC-0046` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-01` | `VPROC-0047` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-02` | `VPROC-0047` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-03` | `VPROC-0047` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-04` | `VPROC-0047` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-05` | `VPROC-0047` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0047-06` | `VPROC-0047` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0048-01` | `VPROC-0048` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-02` | `VPROC-0048` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-03` | `VPROC-0048` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-04` | `VPROC-0048` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-05` | `VPROC-0048` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-06` | `VPROC-0048` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0048-07` | `VPROC-0048` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0049-01` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-02` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-03` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-04` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-05` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-06` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-07` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0049-08` | `VPROC-0049` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-01` | `VPROC-0050` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-02` | `VPROC-0050` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-03` | `VPROC-0050` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-04` | `VPROC-0050` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-05` | `VPROC-0050` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-06` | `VPROC-0050` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0050-07` | `VPROC-0050` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-01` | `VPROC-0051` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-02` | `VPROC-0051` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-03` | `VPROC-0051` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0051-04` | `VPROC-0051` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-01` | `VPROC-0052` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-02` | `VPROC-0052` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-03` | `VPROC-0052` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-04` | `VPROC-0052` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0052-05` | `VPROC-0052` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-01` | `VPROC-0053` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-02` | `VPROC-0053` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-03` | `VPROC-0053` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0053-04` | `VPROC-0053` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-01` | `VPROC-0054` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-02` | `VPROC-0054` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-03` | `VPROC-0054` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-04` | `VPROC-0054` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-05` | `VPROC-0054` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0054-06` | `VPROC-0054` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-01` | `VPROC-0055` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-02` | `VPROC-0055` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-03` | `VPROC-0055` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-04` | `VPROC-0055` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0055-05` | `VPROC-0055` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0056-01` | `VPROC-0056` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-02` | `VPROC-0056` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-03` | `VPROC-0056` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-04` | `VPROC-0056` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-05` | `VPROC-0056` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-06` | `VPROC-0056` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0056-07` | `VPROC-0056` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-01` | `VPROC-0057` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-02` | `VPROC-0057` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-03` | `VPROC-0057` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-04` | `VPROC-0057` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-05` | `VPROC-0057` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-06` | `VPROC-0057` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0057-07` | `VPROC-0057` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `APLICACION_DIFERIDA`  |
| `DOCCTX-VPROC-0058-01` | `VPROC-0058` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-02` | `VPROC-0058` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-03` | `VPROC-0058` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-04` | `VPROC-0058` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-05` | `VPROC-0058` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0058-06` | `VPROC-0058` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-01` | `VPROC-0059` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-02` | `VPROC-0059` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-03` | `VPROC-0059` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-04` | `VPROC-0059` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-05` | `VPROC-0059` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0059-06` | `VPROC-0059` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-01` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-02` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-03` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-04` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-05` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-06` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-07` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0060-08` | `VPROC-0060` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ARCHIVAL`       | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-01` | `VPROC-0061` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-02` | `VPROC-0061` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-03` | `VPROC-0061` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-04` | `VPROC-0061` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-05` | `VPROC-0061` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0061-06` | `VPROC-0061` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-01` | `VPROC-0062` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-02` | `VPROC-0062` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-03` | `VPROC-0062` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-04` | `VPROC-0062` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-05` | `VPROC-0062` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-06` | `VPROC-0062` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0062-07` | `VPROC-0062` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-01` | `VPROC-0063` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-02` | `VPROC-0063` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-03` | `VPROC-0063` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-04` | `VPROC-0063` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0063-05` | `VPROC-0063` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-01` | `VPROC-0064` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-02` | `VPROC-0064` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-03` | `VPROC-0064` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-04` | `VPROC-0064` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-05` | `VPROC-0064` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0064-06` | `VPROC-0064` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-01` | `VPROC-0065` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-02` | `VPROC-0065` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-03` | `VPROC-0065` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-04` | `VPROC-0065` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-05` | `VPROC-0065` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-06` | `VPROC-0065` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0065-07` | `VPROC-0065` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_RELATIONSHIP`   | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-01` | `VPROC-0066` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-02` | `VPROC-0066` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-03` | `VPROC-0066` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-04` | `VPROC-0066` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-05` | `VPROC-0066` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-06` | `VPROC-0066` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0066-07` | `VPROC-0066` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_OBLIGATION`     | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0067-01` | `VPROC-0067` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-02` | `VPROC-0067` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-03` | `VPROC-0067` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-04` | `VPROC-0067` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-05` | `VPROC-0067` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0067-06` | `VPROC-0067` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `NINGUNO`              |
| `DOCCTX-VPROC-0068-01` | `VPROC-0068` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-02` | `VPROC-0068` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-03` | `VPROC-0068` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-04` | `VPROC-0068` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-05` | `VPROC-0068` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0068-06` | `VPROC-0068` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_ACTIVE_CASE`    | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-01` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-02` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-03` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-04` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-05` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-06` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-07` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-08` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |
| `DOCCTX-VPROC-0069-09` | `VPROC-0069` | `AUTHENTICITY_EVIDENCE_REQUIRED` | `INTEGRITY_FIXITY_REQUIRED` | `PROVENANCE_REQUIRED` | `TYPED_TIME_REQUIRED` | `PRESERVATION_REQUIRED` | `CUSTODY_CHAIN_REQUIRED` | `RET_BUSINESS_CYCLE` | `CONTRATO_APLICABLE` | `ESPECIFICADO` | `FRONTERA_OBLIGATORIA` |

#### 13. Reconciliación de cobertura

| Métrica                          | Resultado |
| -------------------------------- | --------: |
| Procesos esperados               |        69 |
| Procesos materializados          |        69 |
| Identidades `DOCCTX-*` esperadas |       332 |
| Identidades materializadas       |       332 |
| Identidades únicas               |       332 |
| Faltantes                        |         0 |
| Duplicados                       |         0 |
| `RET_ACTIVE_CASE`                |        33 |
| `RET_BUSINESS_CYCLE`             |       184 |
| `RET_RELATIONSHIP`               |        36 |
| `RET_OBLIGATION`                 |        66 |
| `RET_ARCHIVAL`                   |        13 |
| `FRONTERA_OBLIGATORIA`           |       245 |
| `NINGUNO`                        |        73 |
| `APLICACION_DIFERIDA`            |        14 |

Las distribuciones heredadas se conservan sin reclasificación. Esta tarea no cambia identidad, retención, frontera, clasificación, propietario empresarial ni estado de implementación de ninguna entrada.

#### 14. Criterios de aceptación

- [x] Las 69 identidades de proceso y las 332 identidades `DOCCTX-*` quedan cubiertas explícitamente.
- [x] Autenticidad queda separada de hash, antivirus, firma, publicación y ubicación.
- [x] La integridad se vincula a bytes exactos, algoritmo versionado, versión documental y representación.
- [x] Igualdad de digest no fusiona identidades ni prueba autoría o aceptación.
- [x] Procedencia conserva origen, fuente, transformación y causalidad como historia no destructiva.
- [x] Los tiempos de hecho, registro, recepción, commit y sincronización quedan diferenciados.
- [x] La preservación conserva fijación, legibilidad, linaje y controles sin convertirse en retención indefinida.
- [x] La cadena de custodia registra transferencias y brechas sin transferir silenciosamente propiedad, autoridad o permisos.
- [x] Custodia física y digital permanecen diferenciadas.
- [x] Las faltas de evidencia se representan explícitamente y no se rellenan con inferencias.
- [x] Se preservan las distribuciones heredadas de retención y frontera.
- [x] No se ejecutan cambios físicos ni se adelantan decisiones de firma, privacidad, terceros o auditoría pertenecientes a tareas posteriores.

#### 15. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

La tarea materializa y aplica contratos documentales sobre comportamientos que ya están protegidos por el registro canónico vigente de requisitos de prueba: sobre auditable versionado, temporalidad tipada, historia no destructiva, causalidad, procedencia, custodios, integridad documental y conservación de evidencia. No introduce un comportamiento probatorio nuevo ni modifica uno existente.

#### 16. Continuidad

ÚLTIMA TAREA APROBADA

`INFO-DOM-006 — Definir tablas de retención, eventos de cómputo, archivo, legal hold, anonimización, eliminación y certificado de disposición`

TAREA ACTUAL APROBADA

`INFO-DOM-007 — Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia`

SIGUIENTE TAREA RESERVADA

`INFO-DOM-008 — Definir avisos, finalidades, autorizaciones, fundamentos, consentimiento, revocación y datos sensibles`


### ✅ INFO-DOM-008 — Definir avisos, finalidades, autorizaciones, fundamentos, consentimiento, revocación y datos sensibles

**Estado:** APROBADA
**Tarea anterior:** `INFO-DOM-007 — Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia` — APROBADA
**Tarea siguiente:** `INFO-DOM-009 — Definir consultas, reclamos y solicitudes de acceso, rectificación, prueba, revocación y supresión` — RESERVADA
**Tipo de tarea:** documental; definición y materialización transversal del contrato corporativo de tratamiento de datos personales, aviso, finalidad, fundamento documentado, autorización, consentimiento, revocación y tratamiento reforzado de datos sensibles
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md`
**Universo empresarial preservado:** 69 procesos `VPROC-0001` a `VPROC-0069`, 332 identidades contextuales `DOCCTX-*`, 9 aplicaciones propietarias funcionales y escala corporativa `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED`
**Contratos materializados:** `INFO-PRIVACY-TREATMENT-CONTRACT-001`; `INFO-PRIVACY-NOTICE-CONTRACT-001`; `INFO-PRIVACY-PURPOSE-BASIS-CONTRACT-001`; `INFO-PRIVACY-CONSENT-AUTHORIZATION-CONTRACT-001`; `INFO-PRIVACY-REVOCATION-RESTRICTION-CONTRACT-001`; `INFO-PRIVACY-SENSITIVE-DATA-CONTRACT-001`; `INFO-PRIVACY-PURPOSE-TREATMENT-MATRIX-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, Storage, buckets, objetos, migraciones, funciones, jobs, datos, configuración, secretos, proveedores ni despliegues
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito y resultado sustantivo

Esta tarea establece el contrato corporativo que determina cómo debe declararse y demostrarse un tratamiento de datos personales cuando exista dentro de un proceso VENTO. La definición evita convertir el propósito empresarial, la clasificación S0–S4, la aceptación de términos, una relación contractual, una pantalla, un formulario o la mera persistencia técnica en una autorización de tratamiento implícita.

El resultado queda materializado en siete contratos consumibles y en una matriz de 69 procesos. La matriz fija una decisión explícita de gobierno por proceso sin afirmar, donde la evidencia actual no lo demuestra, que exista o no exista tratamiento personal, consentimiento, fundamento jurídico, responsable de tratamiento concreto o categoría sensible concreta.

La tarea conserva además las 332 identidades documentales heredadas sin reclasificarlas: un `DOCCTX-*` puede contener o relacionarse con datos personales solo cuando el contenido o contexto verificable lo demuestre. La clase de seguridad no sustituye esa determinación.

---

#### 2. Decisiones heredadas que permanecen vigentes

1. Los 69 propósitos empresariales aprobados permanecen como finalidad empresarial primaria; no se reinterpretan como fundamento de privacidad.
2. La propiedad funcional sigue al proceso y al hecho empresarial; no se deriva de tabla, esquema, bucket, aplicación o proveedor.
3. La escala `S0_PUBLIC`, `S1_INTERNAL`, `S2_CONFIDENTIAL`, `S3_RESTRICTED`, `S4_HIGHLY_RESTRICTED` continúa gobernando sensibilidad operativa y minimización.
4. Las 332 identidades `DOCCTX-*` conservan exactamente su identidad y clasificación heredadas; esta tarea no crea una clasificación jurídica paralela por documento.
5. El ciclo, retención, legal hold, disposición, autenticidad, integridad, procedencia y custodia permanecen bajo sus contratos ya aprobados.
6. El marco jurisdiccional empresarial observado se mantiene como referencia de contexto; esta tarea no emite una opinión jurídica ni inventa bases normativas no respaldadas por evidencia vigente.
7. Roles de responsable, encargado, destinatario, transferencia y requerimiento de autoridad se coordinan con sus tareas propietarias; infraestructura y región técnica no asignan esos roles.
8. La ausencia de evidencia no se convierte en consentimiento, autorización, fundamento ni declaración de `NO_APLICA`.

---

#### 3. Separaciones normativas obligatorias

Se fija la siguiente separación semántica:

```text
business_purpose_ref
!= privacy_purpose_id
!= documented_basis_id
!= notice_version_id
!= consent_or_authorization_record_id
!= terms_acceptance_ref
!= marketing_authorization_ref
!= sensitive_data_authorization_ref
!= access_authorization_ref
```

Reglas:

1. La finalidad empresarial explica por qué existe el proceso; no demuestra por sí sola por qué puede tratarse un dato personal.
2. La finalidad de privacidad declara el uso específico del dato dentro de un tratamiento identificado.
3. El fundamento documentado explica la base aplicada al tratamiento; no se registra como consentimiento cuando no lo es.
4. El aviso demuestra qué información fue presentada; no demuestra aceptación por sí solo.
5. La aceptación de términos de servicio no concede automáticamente marketing, datos sensibles ni finalidades futuras.
6. Una autorización de acceso a una aplicación o recurso no equivale a autorización de tratamiento.
7. La clasificación `S4_HIGHLY_RESTRICTED` exige manejo reforzado, pero no constituye por sí misma prueba de que la categoría sea legalmente sensible. Una clase inferior tampoco demuestra ausencia de datos sensibles.
8. Revocar una finalidad revocable no borra el hecho histórico de la autorización ni elimina automáticamente registros que deban conservarse por otro fundamento documentado y por la política de retención aplicable.

---

#### 4. `INFO-PRIVACY-TREATMENT-CONTRACT-001` — identidad del tratamiento

Un tratamiento gobernado se identifica independientemente de su aplicación, tabla, formulario, archivo o proveedor. La unidad documental mínima es una combinación resoluble de finalidad de privacidad, población o titular aplicable, categorías de datos, fuente, entidad responsable y contexto empresarial.

| Campo                                | Regla                                                                                                                 |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `treatment_id`                       | Identificador estable del tratamiento; no se deriva de nombre de tabla, ruta o pantalla.                              |
| `process_id`                         | `VPROC-*` que aporta el contexto empresarial.                                                                         |
| `business_purpose_ref`               | Referencia al propósito empresarial aprobado; no sustituye `privacy_purpose_id`.                                      |
| `privacy_purpose_id`                 | Finalidad específica y versionada del tratamiento.                                                                    |
| `subject_scope_ref`                  | Titular, población o colectivo al que aplica, sin ampliar el alcance por inferencia.                                  |
| `data_category_refs`                 | Categorías de datos realmente necesarias para la finalidad.                                                           |
| `source_refs`                        | Fuentes de los datos y, cuando corresponda, referencia de procedencia.                                                |
| `controller_ref`                     | Entidad responsable documentada; si es obligatoria y no existe evidencia, el tratamiento dependiente queda bloqueado. |
| `processor_refs`                     | Encargados documentados cuando existan; su alcance no se infiere del proveedor técnico.                               |
| `documented_basis_id`                | Fundamento aplicable, resoluble mediante el contrato de la sección 6.                                                 |
| `notice_version_id`                  | Aviso presentado cuando corresponda.                                                                                  |
| `authorization_record_refs`          | Evidencia de decisiones de autorización o consentimiento cuando correspondan.                                         |
| `sensitivity_assessment_ref`         | Evaluación de sensibilidad y riesgo del tratamiento.                                                                  |
| `rights_channel_ref`                 | Canal aplicable para derechos o solicitudes, sin definir aquí el flujo de atención.                                   |
| `retention_policy_ref`               | Referencia al contrato de retención; no se fija un plazo nuevo.                                                       |
| `treatment_status`                   | Estado documental del tratamiento y su evidencia.                                                                     |
| `effective_from` / `effective_until` | Vigencia efectiva de la definición, sin confundirla con la fecha de captura.                                          |

Estados de resolución:

| Estado                   | Uso                                                                                                   |
| ------------------------ | ----------------------------------------------------------------------------------------------------- |
| `ESPECIFICADO`           | La regla de gobierno está definida y los campos obligatorios de la instancia están respaldados.       |
| `PENDIENTE_DE_EVIDENCIA` | Falta evidencia para resolver un dato de gobierno sin inventarlo.                                     |
| `BLOQUEADO`              | La operación dependiente no puede continuar porque falta un requisito obligatorio o existe conflicto. |
| `NO_APLICA`              | La materia no aplica a la instancia y existe base verificable para esa conclusión.                    |

Una fila de proceso de la matriz no crea por sí sola un `treatment_id`: la instancia se materializa cuando existe evidencia de un tratamiento concreto.

---

#### 5. `INFO-PRIVACY-NOTICE-CONTRACT-001` — avisos y versiones presentadas

El aviso de privacidad es un artefacto versionado que permite reconstruir exactamente qué información se presentó, a quién, por qué canal y bajo qué versión. No se modela como un booleano global.

Campos mínimos:

- `notice_id` y `notice_version_id`;
- `controller_ref` aplicable;
- `privacy_purpose_ids` presentadas;
- categorías de datos o alcance informado cuando corresponda;
- `mandatory_optional_profile` por finalidad;
- `rights_channel_ref`;
- `language`;
- `channel`;
- `effective_from` y, cuando proceda, `effective_until`;
- `presented_at`;
- sujeto o contexto al que se presentó;
- `content_integrity_ref` o referencia de versión preservada;
- relaciones con versiones predecesoras o sucesoras.

Reglas:

1. Una nueva versión no altera qué aviso fue presentado históricamente.
2. Un cambio material de finalidad, alcance informado, entidad responsable o condición de autorización obliga a versionar y reevaluar la aplicabilidad de autorizaciones previas.
3. Idioma y canal forman parte de la evidencia; no se reconstruyen desde preferencias actuales.
4. La mera disponibilidad de una política estática no demuestra presentación ni decisión del titular.
5. Una versión retirada conserva trazabilidad histórica y no se presenta como vigente.

---

#### 6. `INFO-PRIVACY-PURPOSE-BASIS-CONTRACT-001` — finalidades y fundamentos documentados

Cada tratamiento debe resolver una finalidad de privacidad específica y un fundamento documentado. Las clases siguientes son estados de gobierno interno para impedir ambigüedad; no constituyen una taxonomía jurídica exhaustiva.

| Clase                            | Decisión                                                                                                                           |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `CONSENT_OR_AUTHORIZATION`       | El tratamiento depende de una decisión verificable del titular o sujeto autorizado y requiere evidencia de esa decisión.           |
| `LEGAL_OR_REGULATORY_OBLIGATION` | Existe un fundamento normativo documentado; requiere `basis_ref` verificable y no se registra como consentimiento.                 |
| `CONTRACTUAL_OBLIGATION`         | Existe un fundamento contractual documentado vinculado al alcance correspondiente; no concede finalidades accesorias.              |
| `OTHER_DOCUMENTED_BASIS`         | Existe otro fundamento documentado y versionado que debe quedar identificado de forma concreta.                                    |
| `NO_APLICA_NO_PERSONAL_DATA`     | La instancia no trata datos personales y existe evidencia suficiente para sostener esa conclusión.                                 |
| `UNRESOLVED`                     | La fuente actual no permite determinar el fundamento sin una decisión adicional; bloquea el tratamiento que dependa de resolverlo. |

Reglas de finalidad:

1. Cada `privacy_purpose_id` debe ser específico, interpretable, versionado y enlazado al proceso y tratamiento.
2. Dos finalidades independientes no se fusionan para obtener una decisión única si una puede aceptarse o rechazarse sin la otra.
3. Una finalidad secundaria o nueva exige evaluación propia; una autorización previa no se extiende por semejanza.
4. Cambiar la finalidad empresarial del proceso no reescribe automáticamente finalidades de privacidad históricas.
5. El fundamento se conserva con versión, evidencia, vigencia y alcance. `UNRESOLVED` nunca se trata como autorización implícita.
6. El registro de un fundamento distinto de consentimiento debe mostrar explícitamente que el tratamiento no depende de una decisión de consentimiento para ese alcance, sin fabricar una aceptación ficticia.

---

#### 7. `INFO-PRIVACY-CONSENT-AUTHORIZATION-CONTRACT-001` — consentimiento y autorizaciones

La evidencia de autorización se registra por finalidad y alcance. Se preservan tanto decisiones afirmativas como negativas para evitar que la ausencia de una marca se interprete a favor del tratamiento.

| Campo                         | Regla                                                                     |
| ----------------------------- | ------------------------------------------------------------------------- |
| `authorization_record_id`     | Identidad estable del registro de decisión.                               |
| `treatment_id`                | Tratamiento al que se aplica.                                             |
| `privacy_purpose_id`          | Finalidad concreta; no una aceptación global.                             |
| `subject_ref`                 | Titular o sujeto aplicable.                                               |
| `controller_ref`              | Entidad responsable aplicable.                                            |
| `decision`                    | `ACCEPTED`, `REJECTED`, `NOT_REQUIRED` o `UNRESOLVED`.                    |
| `requirement_profile`         | `MANDATORY` u `OPTIONAL` según la definición documentada del tratamiento. |
| `notice_version_id`           | Versión informada asociada cuando corresponda.                            |
| `language` / `channel`        | Contexto en que se obtuvo o registró la decisión.                         |
| `occurred_at` / `recorded_at` | Momento de la decisión y momento de su registro, sin fusionarlos.         |
| `actor_ref`                   | Actor que expresó o registró la decisión según corresponda.               |
| `evidence_ref`                | Evidencia preservada con integridad y procedencia resolubles.             |
| `scope_ref`                   | Datos, canal, producto, relación o población a la que aplica.             |
| `supersedes_ref`              | Registro anterior sustituido por una nueva decisión, sin borrar historia. |

Reglas:

1. `ACCEPTED` solo existe con evidencia positiva resoluble; el silencio o la ausencia de fila no equivalen a aceptación.
2. `REJECTED` se conserva y debe impedir el uso dependiente de esa finalidad cuando no exista otro fundamento documentado aplicable.
3. `NOT_REQUIRED` exige que el fundamento aplicable esté resuelto y documentado; no es un atajo para omitir evidencia.
4. Marketing, datos sensibles y otras finalidades opcionales se registran separadamente de términos de servicio o condiciones necesarias del servicio.
5. Una finalidad opcional rechazada no bloquea automáticamente una operación independiente que tenga fundamento propio documentado.
6. Una decisión posterior se enlaza con la anterior y conserva la historia completa.
7. El contrato de evidencia de `INFO-DOM-007` gobierna integridad, procedencia, tiempo y preservación de la prueba de autorización.

---

#### 8. `INFO-PRIVACY-REVOCATION-RESTRICTION-CONTRACT-001` — revocación y restricciones

Una revocación es un nuevo hecho trazable y acotado. No destruye el registro anterior ni se interpreta como si la autorización nunca hubiera existido.

Campos mínimos: `revocation_id`, `authorization_record_id`, `treatment_id`, `privacy_purpose_id`, `scope_ref`, `occurred_at`, `recorded_at`, `effective_at`, `actor_ref`, `reason_ref` cuando aplique, `evidence_ref`, `propagation_status` y `restriction_refs`.

Reglas:

1. La revocación opera sobre el alcance revocable identificado y desde su momento efectivo; no se propaga a finalidades independientes por semejanza.
2. El uso futuro dependiente de la autorización revocada debe detenerse o quedar bloqueado cuando no exista otro fundamento documentado aplicable.
3. El hecho de revocación y la evidencia de autorización previa se preservan bajo las reglas de historia, retención e integridad aplicables.
4. La revocación no equivale a eliminación de cuenta, supresión de todos los datos, anulación contractual ni vencimiento de obligaciones independientes.
5. Cuando existan proyecciones, copias controladas o terceros, la revocación genera una obligación de reconciliación y propagación; la identificación de destinatarios y transferencias pertenece a `INFO-DOM-010`.
6. El flujo formal de solicitud del titular, sus plazos y cierre pertenecen a `INFO-DOM-009`; este contrato define el efecto documental que ese flujo debe poder producir.
7. Si una copia debe conservarse bajo otro fundamento o retención, se restringe o desvincula según corresponda sin destruir el hecho empresarial ni falsear la historia.

---

#### 9. `INFO-PRIVACY-SENSITIVE-DATA-CONTRACT-001` — datos sensibles y contextos de alto riesgo

La determinación de sensibilidad personal se resuelve por categoría y contexto con evidencia. La clase corporativa S0–S4 continúa siendo una protección operativa independiente.

| Estado de evaluación            | Regla                                                                                                                                            |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `NOT_ASSESSED`                  | La sensibilidad personal no ha sido evaluada; no puede interpretarse como ausencia de sensibilidad.                                              |
| `NON_SENSITIVE_PERSONAL`        | Existe evidencia suficiente para tratar la categoría como personal no sensible dentro del alcance evaluado.                                      |
| `SENSITIVE_OR_SPECIAL_CATEGORY` | Existe evidencia documentada de que la categoría requiere tratamiento reforzado por su naturaleza o regla aplicable.                             |
| `HIGH_RISK_CONTEXT`             | La combinación de datos, población, precisión, canal o finalidad exige controles reforzados aunque la etiqueta legal concreta no se afirme aquí. |
| `UNRESOLVED`                    | La evidencia no permite resolver la categoría; el uso que requiera esa determinación queda bloqueado.                                            |

Reglas:

1. Toda declaración `SENSITIVE_OR_SPECIAL_CATEGORY` requiere `sensitivity_basis_ref`; no se deriva solo de `S4_HIGHLY_RESTRICTED`.
2. `S4_HIGHLY_RESTRICTED` conserva sus controles reforzados aunque la categoría personal permanezca `NOT_ASSESSED` o `UNRESOLVED`.
3. Categorías médicas, biométricas, geolocalización precisa, documentos de identidad, información financiera, laboral, SST y otras categorías de alto riesgo requieren minimización estricta y evaluación explícita antes de usos secundarios, exportaciones, analítica, logs o proveedores.
4. Datos sensibles o de alto riesgo no se incorporan a eventos, telemetría, logs, exports o datasets generales solo por conveniencia técnica.
5. La necesidad de una autorización especial o de otro fundamento se resuelve mediante referencia documentada; no se presume desde la categoría.
6. La proyección autorizada expone el mínimo de campos, precisión, población y ventana temporal necesarios para la finalidad.
7. El cambio de categoría o contexto conserva la evaluación anterior, motivo, evidencia, vigencia y efecto sobre tratamientos activos.

---

#### 10. Cambios de finalidad, aviso o fundamento

1. Un cambio material de finalidad crea una nueva versión de finalidad o un nuevo tratamiento cuando el alcance deja de ser equivalente.
2. Un aviso nuevo no vuelve válida una autorización antigua para una finalidad materialmente distinta.
3. Un fundamento nuevo no reescribe el fundamento histórico utilizado por eventos anteriores.
4. Un cambio de entidad responsable requiere nueva evaluación del tratamiento y de la información presentada; no se deriva del cambio de aplicación o infraestructura.
5. Cambiar proveedor o encargado no crea por sí solo una nueva finalidad, pero exige mantener alcance, autoridad, minimización, evidencia y obligaciones de tercero resolubles.
6. Una finalidad futura no informada permanece fuera del alcance de autorizaciones anteriores hasta que su fundamento quede resuelto.

---

#### 11. Aplicación fail-closed

| Condición                                                 | Resultado obligatorio                                                                        |
| --------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Falta `process_id` o contexto empresarial                 | `BLOQUEADO` para tratamiento dependiente de contexto.                                        |
| Falta `privacy_purpose_id`                                | `BLOQUEADO`; no se admite finalidad implícita.                                               |
| Fundamento obligatorio `UNRESOLVED`                       | `BLOQUEADO`.                                                                                 |
| Se exige consentimiento y no existe evidencia positiva    | `BLOQUEADO` para esa finalidad.                                                              |
| Decisión `REJECTED` vigente                               | Uso dependiente de esa finalidad denegado.                                                   |
| Autorización revocada y sin otro fundamento aplicable     | Uso futuro dependiente bloqueado.                                                            |
| Sensibilidad necesaria para decidir y estado `UNRESOLVED` | `BLOQUEADO` para el uso que dependa de esa resolución.                                       |
| Aviso requerido sin versión presentada verificable        | `BLOQUEADO` para el acto que dependa de esa presentación.                                    |
| Entidad responsable obligatoria sin evidencia             | `PENDIENTE_DE_EVIDENCIA` y operación dependiente bloqueada.                                  |
| Tratamiento no personal demostrado                        | `NO_APLICA` al contrato de fundamento personal, conservando las demás reglas de información. |

Los mensajes y resultados de autorización no deben revelar información sensible adicional para explicar el bloqueo.

---

#### 12. Evidencia, auditoría y reconstrucción temporal

Para cualquier tratamiento, aviso, autorización o revocación materializado debe ser posible reconstruir:

- qué finalidad estaba vigente;
- qué fundamento documentado se aplicó;
- qué aviso y versión se presentaron;
- qué decisión fue registrada y para qué alcance;
- quién o qué sistema registró el hecho;
- cuándo ocurrió y cuándo fue registrado;
- qué evidencia preserva integridad y procedencia;
- qué cambio posterior sustituyó, restringió o revocó la decisión;
- qué usos dependían de esa decisión;
- qué condición bloqueó la operación cuando faltaba evidencia.

La reconstrucción usa tiempos tipados y evidencia no destructiva; no sustituye el hecho histórico por la preferencia o política vigente en el presente.

---

#### 13. Relación con las 332 identidades `DOCCTX-*`

La tarea preserva el universo documental completo y fija una decisión de aplicabilidad sin inventar contenido personal por identidad:

| Elemento                                                                                   | Resultado |
| ------------------------------------------------------------------------------------------ | --------: |
| Identidades `DOCCTX-*` esperadas                                                           |       332 |
| Identidades preservadas                                                                    |       332 |
| Identidades renombradas                                                                    |         0 |
| Identidades fusionadas                                                                     |         0 |
| Identidades eliminadas                                                                     |         0 |
| Reclasificaciones S0–S4 producidas por esta tarea                                          |         0 |
| Conclusiones de dato personal inferidas solo por nombre de documento, bucket, ruta o clase |         0 |

Distribución de sensibilidad corporativa preservada:

| Clase                  | Total heredado |
| ---------------------- | -------------: |
| `S0_PUBLIC`            |              1 |
| `S1_INTERNAL`          |             33 |
| `S2_CONFIDENTIAL`      |            166 |
| `S3_RESTRICTED`        |            124 |
| `S4_HIGHLY_RESTRICTED` |              8 |
| **Total**              |        **332** |

Para cada `DOCCTX-*`, la regla es: resolver el tratamiento desde el contenido y contexto empresarial real; heredar o elevar la clasificación operativa ya vigente; aplicar el contrato de privacidad solo a los campos o representaciones que efectivamente contengan datos personales; mantener `PENDIENTE_DE_EVIDENCIA` cuando esa condición no pueda demostrarse.

---

#### 14. `INFO-PRIVACY-PURPOSE-TREATMENT-MATRIX-001` — 69 de 69 procesos

Cada proceso conserva la finalidad empresarial aprobada mediante referencia estable. La columna de conclusión evita que la matriz se convierta en una lista inventada de tratamientos: ninguna fila declara tratamiento personal existente solo por el nombre o propósito del proceso.

| VPROC        | Finalidad empresarial                            | Conclusión sobre tratamiento personal                          | Regla de finalidad/fundamento                     | Aviso                       | Autorización                                    | Sensibilidad                       | Estado de regla | Condición de bloqueo                      |
| ------------ | ------------------------------------------------ | -------------------------------------------------------------- | ------------------------------------------------- | --------------------------- | ----------------------------------------------- | ---------------------------------- | --------------- | ----------------------------------------- |
| `VPROC-0001` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0001` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0002` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0002` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0003` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0003` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0004` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0004` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0005` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0005` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0006` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0006` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0007` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0007` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0008` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0008` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0009` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0009` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0010` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0010` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0011` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0011` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0012` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0012` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0013` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0013` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0014` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0014` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0015` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0015` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0016` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0016` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0017` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0017` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0018` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0018` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0019` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0019` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0020` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0020` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0021` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0021` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0022` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0022` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0023` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0023` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0024` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0024` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0025` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0025` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0026` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0026` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0027` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0027` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0028` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0028` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0029` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0029` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0030` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0030` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0031` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0031` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0032` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0032` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0033` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0033` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0034` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0034` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0035` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0035` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0036` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0036` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0037` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0037` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0038` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0038` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0039` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0039` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0040` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0040` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0041` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0041` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0042` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0042` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0043` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0043` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0044` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0044` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0045` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0045` | `SENAL_EXPLICITA_CONSENTIMIENTOS_EN_PROPOSITO`                 | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0046` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0046` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0047` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0047` | `SENAL_EXPLICITA_COMUNICACIONES_CONSENTIDAS_EN_PROPOSITO`      | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0048` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0048` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0049` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0049` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0050` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0050` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0051` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0051` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0052` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0052` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0053` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0053` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0054` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0054` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0055` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0055` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0056` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0056` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0057` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0057` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0058` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0058` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0059` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0059` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0060` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0060` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0061` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0061` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0062` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0062` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0063` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0063` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0064` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0064` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0065` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0065` | `SENAL_EXPLICITA_PRIVACIDAD_Y_PROPOSITO_LEGITIMO_EN_PROPOSITO` | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0066` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0066` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0067` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0067` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0068` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0068` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |
| `VPROC-0069` | `PROC-BUSINESS-PURPOSE-REGISTRY-001::VPROC-0069` | `NO_INFERIR_TRATAMIENTO_DESDE_PROPOSITO`                       | `RESOLVER_SI_SE_MATERIALIZA_TRATAMIENTO_PERSONAL` | `VERSION_VIGENTE_SI_APLICA` | `DECISION_O_BASE_DOCUMENTADA_SEGUN_CORRESPONDA` | `EVALUAR_POR_CATEGORIA_Y_CONTEXTO` | `ESPECIFICADO`  | `BLOQUEAR_SI_FALTA_EVIDENCIA_OBLIGATORIA` |

Reconciliación de la matriz:

```text
69 procesos esperados
69 procesos materializados
69 process_id unicos
0 procesos faltantes
0 procesos duplicados
0 process_id renombrados
0 finalidades empresariales reescritas
0 tratamientos personales inventados por inferencia
```

Las tres señales explícitas de la matriz describen solo texto ya presente en el propósito empresarial de `VPROC-0045`, `VPROC-0047` y `VPROC-0065`; no constituyen por sí mismas una determinación de fundamento, consentimiento vigente, entidad responsable ni categoría sensible.

---

#### 15. Tratamiento de marketing, comunicaciones y finalidades opcionales

1. Una autorización de marketing se registra separada de términos, servicio principal, fidelización, soporte, reclamos y obligaciones contractuales.
2. Canal, idioma, finalidad, población y alcance forman parte de la decisión; una autorización de un canal no se extiende automáticamente a otro.
3. Una revocación de marketing debe impedir comunicaciones futuras dependientes de esa autorización y conservar evidencia del cambio.
4. El origen externo de un lead no demuestra autorización para contacto posterior; la decisión aplicable debe ser resoluble antes del uso que dependa de ella.
5. Una interacción comercial no autoriza finalidades analíticas, perfilamiento, terceros o IA que no hayan sido resueltas bajo un fundamento documentado propio.

---

#### 16. Datos laborales, SST, financieros e identidad

Los contextos laborales, SST, financieros, de identidad y otros de alto impacto mantienen el piso de clasificación y minimización ya aprobado. Esta tarea agrega las siguientes reglas de privacidad sin reclasificar:

1. separar la finalidad empresarial de cada uso concreto de datos personales;
2. resolver fundamento y entidad responsable antes del tratamiento que dependa de ellos;
3. evaluar sensibilidad por categoría y contexto;
4. impedir que logs, exportaciones, analítica o integraciones absorban campos personales no necesarios;
5. conservar evidencia de autorización o de otro fundamento documentado sin mezclar ambos conceptos;
6. mantener la retención y disposición bajo `INFO-DOM-006`; una revocación no autoriza destrucción anticipada de evidencia.

---

#### 17. Fronteras propietarias

| Materia                                                                          | Decisión de esta tarea                                                                                  | Propietario de continuidad        |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------- |
| Retención, hold, anonimización, eliminación y certificado                        | Conserva referencias y efectos; no fija plazos ni ejecuta disposición.                                  | `INFO-DOM-006`                    |
| Integridad, procedencia, tiempos y custodia de evidencia                         | Requiere evidencia resoluble; no redefine su fuerza técnica.                                            | `INFO-DOM-007`                    |
| Consultas, reclamos, acceso, rectificación, prueba, revocación y supresión       | Define los efectos documentales que debe poder producir una solicitud; no diseña el caso ni sus plazos. | `INFO-DOM-009`                    |
| Compartición, terceros, encargados, transferencias y requerimientos de autoridad | Conserva referencias y obliga a reconciliar; no materializa destinatarios ni transferencias.            | `INFO-DOM-010`                    |
| Aceptación, aprobación y firmas                                                  | Distingue estos hechos de consentimiento; no define método de firma ni nivel probatorio.                | `INFO-DOM-011`                    |
| Auditoría e investigación                                                        | Preserva hechos y evidencia necesarios; no diseña el expediente investigativo.                          | `INFO-DOM-013`                    |
| Roles y permisos de acceso                                                       | Un permiso de aplicación no equivale a fundamento de tratamiento.                                       | `INFO-AUTH-001` a `INFO-AUTH-004` |
| Sincronización y propagación física                                              | Fija el efecto idempotente y reconciliable esperado; no implementa integraciones.                       | tareas `INFO-INT-*` aplicables    |

Ninguna frontera difiere el resultado principal de `INFO-DOM-008`: aviso, finalidad, fundamento documentado, autorización, consentimiento, revocación y tratamiento sensible quedan definidos como contrato de gobierno.

---

#### 18. Decisiones no autorizadas por esta tarea

Esta tarea no:

- asigna una entidad responsable concreta a cada tratamiento sin evidencia;
- inventa encargados, destinatarios, transferencias ni bases normativas;
- determina que un proceso necesariamente trata o no trata datos personales por su nombre;
- convierte `S4_HIGHLY_RESTRICTED` en una etiqueta jurídica automática de dato sensible;
- define plazos de retención o supresión;
- diseña pantallas, banners, formularios, cookies o componentes UX;
- crea tablas, columnas, RLS, RPC, Storage, jobs, triggers o migraciones;
- ejecuta cambios remotos o productivos;
- modifica las 332 identidades `DOCCTX-*`, los 69 `VPROC-*` o las 9 propietarias funcionales;
- aprueba firmas ni confunde consentimiento con aceptación contractual.

---

#### 19. Estado AS-IS y resultado TO-BE documental

| Elemento                                | Estado verificable recibido                                                | Resultado de esta tarea                                                                                           |
| --------------------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Propósitos empresariales                | 69 propósitos aprobados                                                    | Referenciados sin convertirlos en fundamento de privacidad.                                                       |
| Clasificación y minimización            | 332 `DOCCTX-*` con S0–S4 y perfiles por proceso                            | Preservados; se agrega regla de evaluación personal/sensible sin inferencia.                                      |
| Avisos estáticos existentes             | Evidencia parcial de políticas en superficies concretas                    | Se define contrato versionado de presentación; no se declara cobertura transversal implementada.                  |
| Evidencia transversal de consentimiento | Cobertura funcional parcial y requisitos de prueba ya registrados          | Se define contrato canónico de decisión y revocación; implementación permanece pendiente de sus bloques técnicos. |
| Fundamentos por tratamiento             | No existe evidencia suficiente para asignarlos exhaustivamente por proceso | Se define taxonomía de resolución y `UNRESOLVED` bloqueante; no se inventan asignaciones.                         |
| Tratamientos sensibles                  | No existe inventario jurídico exhaustivo demostrado por proceso            | Se define evaluación separada de S0–S4 y manejo fail-closed.                                                      |
| Cambios físicos                         | No forman parte de esta fase documental                                    | 0 cambios físicos.                                                                                                |

---

#### 20. Criterios de aceptación

- [x] Se preservan los 69 `VPROC-*` y sus finalidades empresariales sin reescritura.
- [x] La matriz contiene exactamente 69 filas de proceso, sin faltantes ni duplicados.
- [x] Se preservan las 332 identidades `DOCCTX-*` y la distribución S0/S1/S2/S3/S4 de 1/33/166/124/8.
- [x] Finalidad empresarial, finalidad de privacidad, fundamento, aviso, consentimiento, términos, marketing, datos sensibles y acceso quedan semánticamente separados.
- [x] El aviso es versionado y conserva idioma, canal, vigencia, contenido y evidencia de presentación.
- [x] Los fundamentos no basados en consentimiento nunca se registran como consentimientos ficticios.
- [x] El consentimiento o autorización conserva finalidad, alcance, aviso presentado, decisión, actor, tiempos y evidencia.
- [x] Las decisiones `ACCEPTED`, `REJECTED`, `NOT_REQUIRED` y `UNRESOLVED` quedan diferenciadas.
- [x] Marketing y datos sensibles no se absorben dentro de una aceptación general de términos.
- [x] La revocación es prospectiva para su alcance efectivo y conserva la historia previa.
- [x] Revocación, eliminación de cuenta, supresión, retención y disposición permanecen como conceptos distintos.
- [x] La sensibilidad personal se evalúa separadamente de la clasificación S0–S4.
- [x] S4 no se usa como prueba automática de categoría personal sensible y una clase inferior no prueba ausencia.
- [x] Un fundamento o entidad responsable obligatorios sin evidencia producen `PENDIENTE_DE_EVIDENCIA` o `BLOQUEADO` según el efecto.
- [x] La ausencia de fila o de respuesta nunca se interpreta como consentimiento positivo.
- [x] Una finalidad nueva o materialmente distinta exige reevaluación de aviso, fundamento y autorización aplicables.
- [x] Los registros de consentimiento y revocación conservan integridad, procedencia y tiempos tipados mediante los contratos ya aprobados.
- [x] La tarea no asigna por inferencia responsable, encargado, destinatario, transferencia, base legal o tratamiento personal.
- [x] No se crean cambios físicos, Supabase, Storage, código, datos ni configuración.
- [x] La siguiente tarea permanece reservada y no se materializa en este artefacto.

---

#### 21. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa y normaliza en contratos de gobierno las reglas de finalidad, consentimiento, revocación, minimización, privacidad, evidencia, autorización, reconciliación y uso sensible ya protegidas por el registro canónico vigente. No introduce una nueva mutación, transición física, cálculo, permiso, integración o conducta verificable distinta; crea 0 requisitos, modifica 0, difiere 0, descarta 0 y vuelve obsoletos 0. La implementación futura deberá satisfacer la cobertura ya registrada sin duplicar identidades de prueba.

---

#### 22. Cierre y continuidad

**ÚLTIMA TAREA APROBADA**
`INFO-DOM-007 — Definir autenticidad, integridad, procedencia, hash, timestamp, preservación y cadena de custodia`

**TAREA ACTUAL APROBADA**
`INFO-DOM-008 — Definir avisos, finalidades, autorizaciones, fundamentos, consentimiento, revocación y datos sensibles`

**SIGUIENTE TAREA RESERVADA**
`INFO-DOM-009 — Definir consultas, reclamos y solicitudes de acceso, rectificación, prueba, revocación y supresión`

La continuidad termina en `INFO-DOM-008`. No se materializa contenido de `INFO-DOM-009`.


### [ ] INFO-DOM-009 — Definir consultas, reclamos y solicitudes de acceso, rectificación, prueba, revocación y supresión
### [ ] INFO-DOM-010 — Definir compartición, exportación, divulgación, terceros, encargados, transferencias y requerimientos de autoridad
### [ ] INFO-DOM-011 — Definir aprobación, aceptación, firma electrónica, firma digital y niveles de evidencia
### [ ] INFO-DOM-012 — Crear registro de obligaciones, controles, evidencias, responsables, frecuencias y brechas de cumplimiento
### [ ] INFO-DOM-013 — Definir auditoría, investigación de accesos o cambios indebidos, preservación y cierre
