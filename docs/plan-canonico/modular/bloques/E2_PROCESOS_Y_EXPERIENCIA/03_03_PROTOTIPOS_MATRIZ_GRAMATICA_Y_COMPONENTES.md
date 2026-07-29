### MINI-BLOQUE — PROTOTIPOS MATRIZ GRAMATICA Y COMPONENTES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **prototipos matriz gramatica y componentes** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `UX-STATION-008` a `UX-STATION-012` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `UX-STATION-008`: Prototipar alternativas con trabajadores reales
- `UX-STATION-009`: Aprobar la matriz proceso → paso → estación → interacción → periférico
- `UX-STATION-010`: Definir gramática de interacción operativa de lectura mínima
- `UX-STATION-011`: Diseñar bandeja contextual de trabajo y siguiente acción
- `UX-STATION-012`: Definir composición dinámica de pasos mediante componentes operativos aprobados
<!-- PLAN-SECTION-META:END -->

### ✅ UX-STATION-008 — Prototipar alternativas con trabajadores reales

**Estado:** APROBADA

**Resultado:** `PASS_WITH_CARRYOVER`

**Método de cierre:** `EVIDENCE_SUBSTITUTION_APPROVED`

**Aclaración obligatoria:** no se afirma que ya se hayan realizado sesiones formales con trabajadores. La tarea se cierra mediante evidencia interna, investigación avanzada, patrones industriales, revisión heurística, walkthroughs adversariales y prototipos verificables. La validación humana final se traslada a pilotos posteriores y deja de bloquear el avance documental y técnico.

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-008 — Prototipar alternativas con trabajadores reales`

**Tarea anterior:** `UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico` — NO INICIADA

**Artefactos producidos:**

- `UX-STATION-EVIDENCE-SUBSTITUTION-DECISION-001`;
- `UX-STATION-INDUSTRY-PATTERN-BASELINE-001`;
- `UX-STATION-FIVE-ARCHETYPE-CATALOG-001`;
- `UX-STATION-ASSUMPTION-AND-RESIDUAL-RISK-REGISTER-001`;
- `UX-STATION-REFERENCE-SCENARIO-CATALOG-001`;
- `UX-STATION-CONDITIONAL-IMPLEMENTATION-GATE-001`;
- `UX-STATION-DEFERRED-HUMAN-VALIDATION-MAP-001`;
- `UX-STATION-CODE-ENABLEMENT-BOUNDARY-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, mediante arquetipos, equivalencia de pasos, excepciones críticas y validación posterior explícita.

**Naturaleza:** decisión documental de proporcionalidad, prototipado basado en evidencia y habilitación condicionada de continuidad; no piloto productivo ni certificación final de uso.

**Cambios en producción, datos reales, permisos, migraciones, RLS, RPC, Supabase, compras o hardware definitivo:** no autorizados por esta tarea.

---

#### 1. Propósito

Cerrar el bloqueo creado por exigir una campaña extensa de pruebas de campo antes de poder continuar el diseño y la implementación, sin degradar la seguridad operativa ni fingir evidencia inexistente.

Vento Group ya dispone de:

- un catálogo canónico de 69 procesos;
- actores, estados, transiciones, entradas, salidas y eventos definidos;
- inventario físico y operativo parcial de sus sedes;
- reglas aprobadas de identidad, sesión, bandeja, siguiente acción, componentes, periféricos, offline, recuperación y accesibilidad;
- conocimiento directo del jefe de operaciones sobre restaurante, pizzería, panadería, centro de producción y bodega;
- patrones ampliamente estabilizados en POS, KDS, WMS, MES y aplicaciones de personal de primera línea.

Con esta base es razonable construir una línea de implementación de alta confianza y reservar la validación humana final para el piloto, cuando exista software real que probar.

```text
NO HACER PRUEBAS DE CAMPO AHORA
≠
IGNORAR A LOS TRABAJADORES
```

```text
APROBAR UNA LÍNEA BASE DE IMPLEMENTACIÓN
≠
CERTIFICAR PRODUCCIÓN
```

```text
USAR PATRONES PROBADOS
+
EVIDENCIA INTERNA
+
PRUEBAS TÉCNICAS
+
PILOTO POSTERIOR
=
AVANCE PROPORCIONAL Y CONTROLADO
```

---

#### 2. Decisión canónica de proporcionalidad

Se aprueba sustituir la ejecución inmediata de sesiones formales con trabajadores por un método escalonado:

1. **ahora:** evidencia interna, investigación avanzada, comparación industrial, revisión heurística, contratos verificables, datos sintéticos y prototipos navegables;
2. **durante diseño e implementación:** pruebas automatizadas, Storybook o equivalente, mocks, walkthroughs adversariales y simulación de fallas;
3. **antes de producción:** pilotos controlados con trabajadores reales mediante `UX-QA-020` y `UX-QA-021` a `UX-QA-030`;
4. **para cierre productivo:** resolución de hallazgos críticos, evidencia del BLOQUE U y puerta `E5-GATE-008`.

Por tanto, la ausencia de una campaña formal de campo en esta etapa:

- no bloquea `UX-STATION-009`;
- no bloquea `UX-ADMIN-*`;
- no bloquea `PROC-SCREEN-*`;
- no bloquea componentes, contratos, mocks ni paquetes de implementación posteriores;
- sí conserva una obligación de validación real antes del despliegue productivo.

---

#### 3. Ajuste de la regla de validación real

La regla general de este subbloque indica que una alternativa definitiva debe validarse con trabajadores reales. Esta tarea la conserva, pero aclara su momento y alcance:

| Nivel                                                                | Puede aprobarse sin prueba humana inmediata | Requiere trabajadores reales                       |
| -------------------------------------------------------------------- | ------------------------------------------- | -------------------------------------------------- |
| patrón transversal                                                   | sí                                          | solo si el piloto detecta divergencia              |
| componente reusable                                                  | sí                                          | validación integrada en el piloto de la aplicación |
| matriz de implementación                                             | sí, como condicionada                       | no para iniciar código                             |
| montaje, alcance, guantes, calor, humedad, ruido y Wi-Fi             | solo como supuesto                          | sí antes del despliegue físico                     |
| pago, identidad, medición, ajuste, conciliación y resultado incierto | prototipo y contrato sí                     | sí antes de producción                             |
| certificación final de una aplicación                                | no                                          | sí mediante BLOQUE U y piloto                      |

`UX-STATION-009` aprobará una **línea base de implementación condicionada**, no una certificación de producción.

---

#### 4. Fundamento de evidencia

La decisión se apoya en cuatro capas acumulativas.

##### 4.1. Evidencia interna de Vento

La línea base ya documenta, entre otros hechos:

- tablets compartidas en servicio;
- estaciones de caja y datáfonos móviles;
- comandas distribuidas a cocina, bar y barra;
- comunicación verbal y por impresora;
- kiosco o referencia técnica de bodega;
- áreas de producción con frío, mesones, canastas y trabajo manual;
- ausencia de una sesión individual persistida en varios dispositivos compartidos.

Esta evidencia permite diseñar el TO-BE sin empezar desde cero.

##### 4.2. Investigación avanzada externa

Se revisaron patrones y guías de:

- ISO 9241-11 para usabilidad en contexto;
- Nielsen Norman Group para estado visible, prevención de error, reconocimiento y lenguaje de acciones;
- WCAG 2.2 para controles táctiles, etiquetas, contraste, ayuda y revisión previa;
- Microsoft Shared Device Mode para personal de primera línea;
- OWASP para timeout, cierre de sesión, limpieza y logging;
- Android offline-first y trabajo persistente;
- Material Design para listas, jerarquía de acciones, confirmaciones y feedback;
- Toast y otros KDS para cocina y expedición;
- Square para recepción, escaneo y ajuste de inventario;
- SAP y Oracle para operación móvil de bodega;
- GS1 para identificación y lectura humana de códigos;
- NIST para criterios observables de eficacia, error y completitud.

##### 4.3. Conocimiento operativo estándar

Restaurante, pizzería, panadería, producción alimentaria y bodega comparten patrones estables:

- trabajo entrante ordenado;
- preparación o ejecución por etapas;
- confirmación de cantidad, estado o destino;
- transferencia entre personas o áreas;
- excepciones por faltantes, errores o fallas de equipo;
- necesidad de continuidad aun con conectividad o periféricos degradados.

##### 4.4. Evidencia técnica posterior

Los patrones deberán comprobarse mediante:

- tipos y contratos;
- pruebas unitarias;
- pruebas de componentes;
- pruebas de integración;
- pruebas E2E;
- pruebas offline e idempotencia;
- pruebas de accesibilidad;
- pilotos de aplicación.

---

#### 5. Principio de personal existente y carga humana mínima

La arquitectura deberá funcionar con la dotación operativa actual.

No se presupone:

- contratar investigadores UX;
- crear un supervisor tecnológico por estación;
- mantener soporte técnico presencial;
- incorporar digitadores para conciliar operaciones;
- pedir al trabajador que diagnostique red, software o periféricos;
- duplicar el trabajo en papel y sistema de forma permanente.

El sistema deberá:

1. indicar qué toca hacer;
2. impedir acciones no elegibles;
3. pedir solo datos no derivables;
4. explicar el error en lenguaje cotidiano;
5. conservar el trabajo cuando la falla sea recuperable;
6. bloquear de forma segura cuando continuar sea peligroso;
7. escalar solo las excepciones reales;
8. dejar evidencia suficiente para soporte sin convertir al trabajador en técnico.

```text
EXCELENTE EN SU LABOR
+
POCA FORMACIÓN TECNOLÓGICA
=
USUARIO OBJETIVO NORMAL DEL SISTEMA
```

La interfaz no se diseñará para expertos en software.

---

#### 6. Cinco arquetipos canónicos de estación

Se adopta un catálogo reducido para evitar una interfaz distinta por cada área.

| Arquetipo          | Áreas principales                                | Trabajo dominante                                            | Interacción base                                                   |
| ------------------ | ------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------ |
| `SERVICE_CHECKOUT` | servicio, mostrador, caja, entrega               | pedido, cobro, entrega y atención de pendientes              | tacto rápido, selección contextual y confirmación explícita        |
| `KITCHEN_PREP`     | cocina, barra, horno, pizza, expedición          | cola de preparación y cambio de estado                       | pantalla visible, tarjetas de pedido y acción principal grande     |
| `PRODUCTION_BATCH` | panadería, repostería, cocina caliente, empaque  | lote, receta, cantidad, pesaje, avance y cierre              | pasos guiados, cantidades estructuradas y periféricos desacoplados |
| `WAREHOUSE_FLOW`   | recepción, bodega, ubicación, picking y despacho | identificar, contar, mover, recibir y entregar               | escaneo preferente, teclado numérico y revisión antes de confirmar |
| `SUPERVISION_EXPO` | supervisor, gerente, expedición y excepciones    | priorizar, aprobar, reasignar, conciliar y resolver bloqueos | tablero consolidado y detalle progresivo                           |

Una sede puede usar varios arquetipos. Un trabajador puede usar más de uno. La estructura se reutiliza; cambian permisos, datos, reglas y próximos pasos.

---

#### 7. Reglas transversales de interfaz

Toda estación deberá conservar:

1. trabajador activo visible;
2. lugar, área o función vigente;
3. estado de conectividad;
4. trabajo actual;
5. siguiente acción;
6. una única acción principal por estado;
7. objeto y consecuencia antes de confirmar;
8. feedback que diferencie captura local de confirmación empresarial;
9. recuperación clara;
10. acceso a ayuda contextual sin manual técnico.

No se aceptarán interfaces que dependan de:

- memorizar códigos;
- leer párrafos largos durante la operación;
- distinguir estados únicamente por color;
- abrir múltiples menús para una acción frecuente;
- entender términos de arquitectura;
- saber si un timeout significa éxito o fracaso;
- preguntar constantemente al supervisor qué sigue.

---

#### 8. Identificación y sesión compartida

La línea base recomendada es:

- selección o reconocimiento del trabajador;
- PIN corto o QR personal según el dispositivo;
- nombre y función visibles durante la sesión;
- opción `Cambiar trabajador` siempre disponible;
- bloqueo por inactividad según riesgo;
- invalidación server-side;
- limpieza de datos y credenciales al cerrar;
- preservación de tareas empresariales mediante relevo, no mediante sesión compartida.

Biometría no es requisito para la primera versión.

---

#### 9. Bandeja de trabajo y siguiente acción

La bandeja mostrará trabajo, no ruido.

Cada elemento deberá declarar:

- objeto principal;
- estado;
- prioridad y razón;
- tiempo o compromiso relevante;
- bloqueo;
- siguiente acción;
- responsable actual;
- origen del trabajo.

Eventos, alertas, mensajes y notificaciones se distinguirán de una tarea ejecutable.

La prioridad será calculada. El supervisor podrá intervenir por excepción autorizada, pero no tendrá que repartir manualmente cada acción ordinaria.

---

#### 10. Cantidades, unidades y presentaciones

Una cantidad no será un campo numérico aislado.

El contrato mínimo incluirá:

```text
VALOR
+ UNIDAD
+ PRESENTACIÓN
+ TARA, SI APLICA
+ ORIGEN DE CAPTURA
+ REGLA DE CONVERSIÓN
```

Casos cubiertos:

- paquete y unidad suelta;
- gramos y kilos;
- litros y mililitros;
- caja, bandeja y porción;
- peso bruto, tara y peso neto;
- recibido frente a esperado;
- producción real frente a planificada.

Capturar y confirmar serán momentos distintos para operaciones sensibles.

---

#### 11. Identificación de producto, ubicación y contenedor

Regla base:

| Contexto                             | Modalidad principal                             | Respaldo                                          |
| ------------------------------------ | ----------------------------------------------- | ------------------------------------------------- |
| bodega, recepción, picking, despacho | escaneo                                         | cámara o captura manual validada                  |
| producción y empaque                 | escaneo o selección contextual según frecuencia | cámara o búsqueda                                 |
| cocina, barra y servicio             | tacto y selección contextual                    | búsqueda breve                                    |
| contingencia                         | referencia legible y entrada manual autorizada  | escalamiento cuando la validación sea obligatoria |

La captura manual no permitirá inventar códigos. Las etiquetas propias deberán mostrar referencia legible.

---

#### 12. Acciones críticas y correcciones

Requieren revisión explícita:

- cobro;
- anulación;
- recepción final;
- despacho;
- cierre de lote;
- ajuste de inventario;
- cambio de responsable;
- generación definitiva de etiqueta;
- corrección con efecto contable, físico o de trazabilidad.

La pantalla deberá mostrar qué objeto cambia, cuánto, desde dónde, hacia dónde y con qué consecuencia.

`Guardar borrador`, `Registrar avance` y `Finalizar` no serán equivalentes.

---

#### 13. Offline, incertidumbre y recuperación

Se adoptan al menos cuatro estados comprensibles:

| Estado técnico canónico | Texto operativo sugerido                  |
| ----------------------- | ----------------------------------------- |
| `LOCAL_SAVED`           | Guardado en este dispositivo              |
| `SENDING`               | Enviando                                  |
| `CONFIRMED`             | Confirmado                                |
| `RESULT_UNKNOWN`        | Todavía no podemos confirmar si se guardó |

Ante `RESULT_UNKNOWN`:

- no se repetirá la acción a ciegas;
- se consultará estado por referencia;
- se esperará sincronización;
- se escalará solo si no se resuelve.

Cada acción declarará si:

- exige conexión;
- admite lectura offline;
- admite captura pendiente;
- requiere contingencia manual;
- debe bloquearse.

---

#### 14. Periféricos y hardware no bloqueantes

El software se diseñará contra capacidades, no contra marcas concretas.

Se usarán adaptadores para:

- escáner;
- cámara;
- impresora;
- báscula;
- datáfono;
- señalización o alarma.

El desarrollo podrá usar mocks hasta confirmar el equipo físico.

La falla de un periférico deberá producir una de estas respuestas:

1. respaldo digital;
2. método alternativo autorizado;
3. equipo alterno aprobado;
4. bloqueo seguro;
5. escalamiento.

No se permitirá estimar una medición obligatoria ni fingir una impresión exitosa.

---

#### 15. Cobertura de los 69 procesos sin explosión combinatoria

No se probarán 69 procesos por cada dispositivo, sede, rol y falla posible.

Se construirá la matriz:

```text
PROCESO
→ PASO HUMANO
→ ARQUETIPO DE ESTACIÓN
→ PATRÓN DE INTERACCIÓN
→ RIESGO
→ EVIDENCIA REUTILIZABLE
→ EXCEPCIÓN QUE REQUIERE PRUEBA DIRECTA
```

La evidencia podrá heredarse cuando coincidan:

- contrato;
- objeto;
- riesgo;
- modalidad;
- entorno;
- consecuencia;
- autoridad;
- recuperación.

No heredarán evidencia genérica:

- pagos;
- identidad y autorización;
- mediciones obligatorias;
- ajustes de inventario;
- conciliaciones;
- resultados no confirmados;
- pasos únicos o irreversibles de criticidad alta.

---

#### 16. Supuestos aceptados para avanzar

Se aceptan como línea base de alta confianza:

- dispositivos compartidos con identificación individual;
- cinco arquetipos reutilizables;
- una acción principal por estado;
- lenguaje directo y no técnico;
- captura y revisión separadas;
- escaneo preferente en flujos logísticos;
- táctil contextual en servicio y cocina;
- offline con cola durable e idempotencia;
- relevo explícito entre personas;
- confirmación reforzada para efectos críticos;
- componentes desacoplados de hardware;
- soporte por excepción y no supervisión permanente.

Estos supuestos pueden codificarse.

---

#### 17. Aspectos que no se pueden conocer solo por investigación

Quedan como riesgo residual físico:

- ubicación exacta de cada pantalla;
- alcance cómodo desde el puesto;
- visibilidad con luz, vapor o harina;
- uso real con guantes o manos húmedas;
- calidad de Wi-Fi en cada punto;
- distancia de lectura del escáner;
- ruido suficiente para señales sonoras;
- disponibilidad de energía y carga;
- ubicación de impresoras y básculas;
- concurrencia real durante picos.

Estos aspectos no bloquean el código desacoplado. Se verificarán en readiness, montaje y piloto.

---

#### 18. Validación técnica antes de pantallas definitivas

Cada patrón candidato deberá contar con:

- contrato tipado;
- estados permitidos;
- datos sintéticos;
- componente aislado;
- revisión heurística;
- prueba de accesibilidad;
- prueba de error;
- prueba offline cuando aplique;
- prueba de idempotencia cuando produzca efectos;
- walkthrough de recuperación;
- evidencia de que no requiere supervisión ordinaria.

Una pantalla bonita sin estas pruebas no será candidata.

---

#### 19. Validación humana diferida y mínima

La validación real no desaparece: cambia de momento.

Se ejecutará mediante:

- `UX-QA-020 — Cada aplicación supera piloto con usuarios reales`;
- `UX-QA-021` a `UX-QA-030` por aplicación;
- escenarios críticos definidos en los requisitos `TREQ-*`;
- personal existente durante ventanas controladas;
- observación integrada al piloto, no una campaña separada de investigación.

No será necesario:

- probar todos los procesos con todas las personas;
- contratar participantes;
- detener varios días la operación;
- crear un equipo permanente de observación;
- repetir patrones ya equivalentes.

La prueba mínima posterior se concentrará en:

- comprensión de la siguiente acción;
- error crítico;
- ergonomía física;
- condiciones ambientales;
- fallas y recuperación;
- tiempo operativo razonable;
- ausencia de supervisión constante.

---

#### 20. Límite de autorización de código

Esta tarea no ordena modificar repositorios todavía. Sí elimina el bloqueo conceptual que impedía llegar a las tareas de diseño e implementación.

Después de aprobar `UX-STATION-009`, la secuencia podrá continuar con:

```text
UX-ADMIN-001 a UX-ADMIN-005
→ PROC-SCREEN-001 a PROC-SCREEN-028
→ PROC-COVER-001 a PROC-COVER-010
→ NFR-REQ-012
→ BLOQUES DE ARQUITECTURA, DATOS Y PAQUETES DE IMPLEMENTACIÓN
```

Desde esas tareas podrán construirse:

- shell de estación;
- sesión compartida;
- bandeja de trabajo;
- componentes de cantidad;
- escaneo y captura manual;
- confirmaciones críticas;
- cola offline;
- telemetría;
- mocks;
- prototipos navegables;
- pruebas automatizadas.

---

#### 21. Hallazgos y cambios obligatorios

Todo hallazgo posterior deberá:

- tener identificador;
- declarar severidad y riesgo;
- indicar patrón o proceso afectado;
- vincular tarea responsable;
- definir cambio y evidencia de cierre;
- impedir producción cuando sea crítico;
- no reabrir toda la arquitectura si el cambio es local.

Los resultados de piloto se incorporarán a la tarea exacta propietaria, no a una lista narrativa sin dueño.

---

#### 22. Estados de decisión

| Estado                           | Significado                                                         |
| -------------------------------- | ------------------------------------------------------------------- |
| `ASSUMED_HIGH_CONFIDENCE`        | patrón ampliamente validado y compatible con evidencia interna      |
| `IMPLEMENTATION_CANDIDATE`       | listo para `UX-STATION-009` y diseño de pantalla                    |
| `PHYSICAL_CONFIRMATION_REQUIRED` | requiere comprobación de puesto o hardware antes de despliegue      |
| `DIRECT_PILOT_REQUIRED`          | paso crítico que debe probarse con trabajadores antes de producción |
| `REJECTED`                       | alternativa incompatible, insegura o innecesariamente compleja      |
| `CERTIFIED_FOR_PRODUCTION`       | solo puede asignarse después del piloto y BLOQUE U                  |

`UX-STATION-008` no asignará `CERTIFIED_FOR_PRODUCTION`.

---

#### 23. Puerta de salida hacia UX-STATION-009

La tarea queda en `PASS_WITH_CARRYOVER` cuando:

- existe la jerarquía de evidencia;
- se adoptan los cinco arquetipos;
- se delimitan patrones de alta confianza;
- se identifican riesgos físicos residuales;
- se separa aprobación de diseño de certificación productiva;
- se asigna la validación real a `UX-QA-020` y `UX-QA-021` a `UX-QA-030`;
- se confirma que no se requiere contratación ni supervisión permanente;
- se generan los requisitos de prueba;
- `UX-STATION-009` queda habilitada.

No se exige ejecutar sesiones de campo antes de continuar.

---

#### Requisitos de prueba derivados

**Rango incorporado:** `TREQ-PROC-941` a `TREQ-PROC-980`

**Cantidad:** 40 requisitos

**Registro canónico regenerado:** `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`

---

#### 24. Criterios de aceptación

- [ ] Se aprobó explícitamente el cierre proporcional sin fingir sesiones realizadas.
- [ ] La validación humana final se conserva antes de producción.
- [ ] El trabajo de campo deja de bloquear diseño, contratos y código posterior.
- [ ] Se definieron cinco arquetipos reutilizables.
- [ ] Se evitó una interfaz distinta por sede o área.
- [ ] La operación ordinaria no requiere supervisión ni soporte técnico permanente.
- [ ] Se adoptó lenguaje cotidiano para personal con baja formación tecnológica.
- [ ] Se definieron identidad individual, bandeja, cantidades, escaneo, confirmación, offline, relevo y periféricos.
- [ ] Los 69 procesos pueden cubrirse por equivalencia controlada.
- [ ] Los pasos críticos conservan prueba directa posterior.
- [ ] Los riesgos físicos residuales tienen dueño y puerta de cierre.
- [ ] No se autorizó producción ni hardware definitivo.
- [ ] Se generaron `TREQ-PROC-941` a `TREQ-PROC-980` sin duplicados ni relaciones inválidas.
- [ ] `UX-STATION-009` permanece como siguiente tarea exacta.

---

#### 25. Resultado y continuidad

```text
UX-STATION-012 APROBADA
UX-STATION-008 APROBADA — PASS_WITH_CARRYOVER
UX-STATION-009 NO INICIADA
```

La continuidad exacta es:

```text
UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico
```

No se inicia `UX-ADMIN-001` hasta la aprobación expresa de `UX-STATION-009`.


### ✅ UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico

**Estado:** APROBADA

**Resultado:** `PASS_WITH_CARRYOVER`

**Matriz aprobada:** `CANONICAL_BASELINE_WITH_PILOT_CARRYOVER`

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Tarea anterior:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales` — APROBADA mediante `EVIDENCE_SUBSTITUTION_APPROVED`

**Siguiente tarea reservada:** `UX-ADMIN-001 — Inventariar tareas administrativas por dominio, frecuencia y complejidad` — NO INICIADA

**Artefactos producidos:**

- `UX-STATION-FINAL-PROCESS-STEP-MATRIX-001`;
- `UX-STATION-ARCHETYPE-RESOLUTION-CATALOG-001`;
- `UX-STATION-INTERACTION-PATTERN-CATALOG-001`;
- `UX-STATION-PERIPHERAL-CAPABILITY-MATRIX-001`;
- `UX-STATION-NO-STATION-RESOLUTION-REGISTER-001`;
- `UX-STATION-SITE-VARIANT-OVERLAY-001`;
- `UX-STATION-PILOT-CARRYOVER-REGISTER-001`;
- `UX-STATION-IMPLEMENTATION-BOUNDARY-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`.

**Naturaleza:** aprobación documental de la línea base proceso-paso-estación-interacción-periférico. No equivale a pantalla final, compra de hardware, despliegue, certificación productiva ni cierre de pilotos.

**Cambios en código, aplicaciones, componentes, rutas, Supabase, tablas, migraciones, RLS, RPC, red, hardware, compras o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Consolidar en una sola matriz ejecutable las decisiones aprobadas en `UX-STATION-002` a `UX-STATION-008` y `UX-STATION-010` a `UX-STATION-012`, de forma que cada paso humano de los 69 procesos tenga una resolución explícita de:

```text
PROCESO
-> PASO O GRUPO DE PASOS EQUIVALENTES
-> ESTACIÓN O AUSENCIA JUSTIFICADA DE ESTACIÓN COMPARTIDA
-> PATRON DE INTERACCIÓN
-> CAPACIDAD PERIFERICA
-> CONTINGENCIA
-> VALIDACIÓN POSTERIOR
```

La matriz elimina dos errores opuestos:

1. crear una pantalla y una estación distinta para cada proceso, sede o rol;
2. imponer una única interfaz genérica a tareas físicas, administrativas, financieras y automáticas que tienen riesgos diferentes.

---

#### 2. Decisión canónica

Se aprueba `UX-STATION-FINAL-PROCESS-STEP-MATRIX-001` como línea base obligatoria para el diseño posterior.

La aprobación significa:

- los cinco arquetipos operativos de `UX-STATION-008` quedan utilizables para diseño y planificación;
- una tarea administrativa o privada puede resolver expresamente a `NO_SHARED / UX-ADMIN`;
- un paso automático puede resolver a `NO_HUMAN`;
- un periférico se expresa por capacidad y no por marca o modelo;
- cada paso conserva modalidad principal, respaldo y condición de bloqueo;
- las variantes de sede se modelan mediante overlays y no mediante procesos duplicados;
- la matriz puede implementarse de forma incremental por paquetes;
- los pilotos posteriores conservan autoridad para corregir texto, orden, ergonomía, montaje o modalidad cuando exista evidencia real.

La aprobación no significa:

- que todos los dispositivos físicos ya existan;
- que cada pantalla definitiva este diseñada;
- que los trabajadores hayan certificado todas las variantes;
- que una impresora, escáner, báscula o datáfono concreto este seleccionado;
- que una aplicación pueda pasar a producción sin readiness, piloto y certificación.

---

#### 3. Dependencias consolidadas

Esta tarea consume y no reemplaza:

- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001` a `UX-STATION-008`;
- `UX-STATION-010` a `UX-STATION-012`;
- `UX-BASE-001` a `UX-BASE-015`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- las decisiones de identidad y autorización `AUTH-*`;
- la validación humana diferida a `UX-QA-020` y `UX-QA-021` a `UX-QA-030`.

Cuando la matriz indique `NO_SHARED / UX-ADMIN`, el diseño detallado pertenece a `UX-ADMIN-001` a `UX-ADMIN-005`. Cuando indique un arquetipo operativo, el contrato de pantalla pertenece a `PROC-SCREEN-001` a `PROC-SCREEN-028`.

---

#### 4. Unidad mínima de la matriz

Cada fila representa:

```text
PROCESO
+ PASO O GRUPO DE PASOS CON EL MISMO CONTRATO DE INTERACCIÓN
+ AMBITO OPERATIVO
+ RESOLUCION DE ESTACIÓN
+ INTERACCIÓN PRINCIPAL
+ CAPACIDAD PERIFERICA
+ RESPALDO O BLOQUEO
+ ESTADO DE DECISIÓN
```

Agrupar pasos esta permitido solo cuando coinciden objeto, riesgo, autoridad, modalidad, consecuencia y recuperación. No se agrupan pagos, mediciones obligatorias, cambios de actor, ajustes, entregas de custodia o acciones irreversibles con pasos de menor riesgo.

---

#### 5. Estados de decisión

| Estado                    | Significado                                                                                                 |
| ------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `CANONICAL`               | resolución aprobada para diseño y planificación posterior                                                   |
| `CONDITIONALLY_CANONICAL` | aprobada con overlay, capacidad, variante o piloto explicito                                                |
| `NO_SHARED_STATION`       | tarea humana real, pero no debe ejecutarse en una estación operativa compartida                             |
| `NO_HUMAN_STATION`        | paso automático sin operador humano en ese instante                                                         |
| `PILOT_CHANGE_REQUIRED`   | estado futuro si un piloto demuestra riesgo o friccion material; no se asigna preventivamente en esta tarea |

No queda permitido `UNDECIDED`, `TBD`, `POR DEFINIR` ni una fila sin tarea propietaria.

---

#### 6. Catalogo de resoluciones de estación

| Código                 | Resolución                                                     | Uso permitido                                                         | Limite obligatorio                                                    |
| ---------------------- | -------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `SERVICE_CHECKOUT`     | servicio, mostrador, caja y entrega                            | selección táctil, pedido, cobro, cliente, reserva y entrega           | no expone administración general ni conserva actor anterior           |
| `KITCHEN_PREP`         | cocina, barra, horno, pizza y expedición                       | cola visible, prioridad, preparación y cambio de estado               | no fuerza captura extensa ni usa sonido como única señal              |
| `PRODUCTION_BATCH`     | panaderia, reposteria, cocina caliente, empaque y calidad      | lote, receta, cantidad, medición, avance y cierre                     | no estima mediciones obligatorias ni oculta versión de receta         |
| `WAREHOUSE_FLOW`       | recepción, bodega, ubicación, conteo, picking, despacho y ruta | escaneo, cantidades, custodia, movimiento y handoff                   | no cierra entrega sin aceptación cuando sea obligatoria               |
| `SUPERVISION_EXPO`     | supervisión, expedición, excepciones y coordinación            | priorización, aprobación, reasignación, conciliación y alertas        | opera por excepción; no reparte manualmente todo el trabajo ordinario |
| `NO_SHARED / UX-ADMIN` | tarea administrativa personal o privada                        | se disena en `UX-ADMIN-001` a `UX-ADMIN-005`                          | no se fuerza dentro de una estación operativa compartida              |
| `NO_HUMAN`             | paso automático o integración técnica                          | evento, cola, adaptador o reconciliación sin operador en ese instante | no se presenta como trabajador ni como estación humana                |


Los overlays `MOBILE`, `MOBILE_ROUTE`, `MEASURE`, `FOOD_HYGIENE`, `PUBLIC_VIEW`, `WET_GREASY`, `COLD`, `HOT`, `NOISY` y equivalentes agregan restricciones; nunca reducen identidad, seguridad, trazabilidad o integridad.

---

#### 7. Catalogo de patrones de interacción

| Patron                       | Propósito                                            | Regla principal                                                                           |
| ---------------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `BANDEJA_Y_SIGUIENTE_ACCION` | mostrar trabajo ejecutable y prioridad               | una acción primaria por estado y razón de prioridad visible                               |
| `SELECCION_TACTIL`           | elegir objeto, producto o opcion frecuente           | blancos tactiles amplios, busqueda breve y sin codigos memorizados                        |
| `PASOS_GUIADOS`              | ejecutar secuencia con dependencias                  | no avanzar si falta un dato obligatorio; conservar borrador y contexto                    |
| `CAPTURA_CANTIDAD`           | registrar valor, unidad y presentación               | valor, unidad, presentación, conversion y origen permanecen separados                     |
| `ESCANEO_Y_VERIFICACION`     | identificar producto, ubicación, activo o contenedor | muestra objeto resuelto antes de confirmar; captura manual no inventa codigos             |
| `MEDICION_GUIADA`            | capturar peso u otra medición                        | unidad, estabilidad, tara y origen quedan visibles cuando aplican                         |
| `CAMBIO_DE_ESTADO`           | iniciar, pausar, avanzar o finalizar                 | el botón describe el efecto empresarial y no escribe estados arbitrarios                  |
| `ENTREGA_Y_ACEPTACION`       | transferir custodia o responsabilidad                | enviar no equivale a recibir; emisor, receptor, contenido y pendientes quedan registrados |
| `REVISION_GUIADA`            | comparar evidencia y decidir                         | datos criticos, diferencias y consecuencia se muestran antes de decidir                   |
| `APROBACION_CON_IMPACTO`     | autorizar una acción sensible                        | autoridad, objeto, alcance, versión e impacto quedan visibles y auditados                 |
| `PAGO_CONFIRMADO`            | autorizar y comprobar un pago                        | captura, autorización, comprobante y conciliación son hechos separados                    |
| `EVIDENCIA`                  | tomar foto, archivo, firma o soporte                 | solo datos necesarios, con propietario, fecha, clasificación y limpieza local             |
| `EVENTO_AUTOMATICO`          | ejecutar integración o reacción técnica              | idempotencia, correlacion, reintento y conciliación obligatorios                          |
| `MODO_CONTINGENCIA`          | conservar resultado mínimo durante falla             | indica que puede continuar, que debe detenerse y como reconciliar después                 |


Los nombres tecnicos pueden existir en contratos internos, pero el texto mostrado al trabajador deberá usar lenguaje cotidiano y orientado a la acción.

---

#### 8. Catalogo de capacidades perifericas

| Capacidad                | Condición de uso                                                           | Respaldo permitido                                                                 |
| ------------------------ | -------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `ESCÁNER`                | identificación repetitiva de producto, ubicación, activo, kit o contenedor | cámara o captura manual validada cuando la política lo permita                     |
| `CÁMARA`                 | evidencia, lectura de código o documento                                   | archivo posterior o registro manual; nunca prueba por si sola el hecho empresarial |
| `BASCULA_MEDICION`       | peso o medición obligatoria                                                | equipo alterno aprobado; no estimacion manual de un valor obligatorio              |
| `ETIQUETADORA_IMPRESORA` | etiqueta, comanda o soporte físico                                         | vista digital, reimpresion o formato controlado; imprimir no confirma el efecto    |
| `DATÁFONO`               | pago por medio externo                                                     | medio alterno autorizado o bloqueo; el datáfono no es la fuente final del pedido   |
| `SENALIZACION`           | llamada, prioridad o alerta ambiental                                      | señal visual y textual; nunca sonido o color como única evidencia                  |
| `NINGUNO`                | el paso no necesita capacidad física especial                              | no se compra hardware solo por conveniencia visual                                 |


Toda capacidad se implementara mediante adaptador desacoplado. Una falla física nunca podrá producir una confirmación empresarial ficticia.

---

#### 9. Reglas transversales de la matriz

1. Cada paso humano resuelve a un arquetipo o a `NO_SHARED / UX-ADMIN`.
2. Cada paso automático resuelve a `NO_HUMAN` y conserva propietario técnico y empresarial.
3. La aplicación no determina por si sola la estación.
4. El rol no determina por si solo la estación.
5. La sede no duplica el proceso; aplica overlay o variante versionada.
6. Una estación compartida mantiene trabajador efectivo visible y cambio de trabajador accesible.
7. La bandeja muestra trabajo ejecutable y una siguiente acción; no mezcla alertas con tareas.
8. Capturar no equivale a confirmar.
9. Imprimir no equivale a pagar, recibir, producir, despachar ni entregar.
10. Escanear no equivale a aceptar el objeto resuelto.
11. Enviar no equivale a recibir.
12. Guardar localmente no equivale a confirmación empresarial.
13. Un resultado incierto no permite reintento ciego.
14. Ninguna estación exige un técnico o supervisor permanente.
15. El trabajador ejecuta acciones simples, seguras y guiadas; soporte atiende excepciones.

---

#### 10. Resolución de variantes por sede

| Variante                         | Regla aprobada                                                                                                                           |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| Vento Cafe                       | combina `SERVICE_CHECKOUT`, `KITCHEN_PREP`, caja, barra, servicio y recepción; las diferencias de zona no crean procesos nuevos          |
| Saudo                            | usa los mismos contratos de servicio, mostrador, cocina y caja; la operación verbal actual no se convierte en diseño objetivo            |
| Molka                            | permite concentrar servicio, cobro, preparación y entrega en menos personas sin fusionar los hechos empresariales                        |
| Centro de Producción             | usa `PRODUCTION_BATCH`, `WAREHOUSE_FLOW` y `SUPERVISION_EXPO` con overlays por panaderia, reposteria, cocina, empaque, bodega y despacho |
| Oficina y trabajo administrativo | resuelve a `NO_SHARED / UX-ADMIN` salvo tableros de supervisión o excepciones operativas                                                 |

Una variante local solo podrá cambiar presentación, montaje, periférico opcional, densidad, zona, capacidad o respaldo. No podrá cambiar por si sola propiedad del proceso, autorización, fuente de verdad o significado de una acción.

---

#### 11. Matriz final proceso → paso → estación → interacción → periférico

##### 11.1. Gobierno, personas, SST y cumplimiento
| Proceso                                                                | Propietaria | Paso o grupo de pasos                                            | Ambito principal                                  | Estación resuelta                                                              | Interacción aprobada                                  | Perifericos por capacidad                 | Contingencia o respaldo                                             | Estado                    |
| ---------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------ | ----------------------------------------------------- | ----------------------------------------- | ------------------------------------------------------------------- | ------------------------- |
| `VPROC-0001` — Gobernar decisiones empresariales                       | `viso`      | analizar, aprobar y hacer seguimiento                            | corporativo y gerencia                            | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + APROBACION_CON_IMPACTO`            | `NINGUNO`                                 | borrador local controlado; sin conexión no se aprueba               | `NO_SHARED_STATION`       |
| `VPROC-0001`                                                           | `viso`      | resolver excepciones operativas                                  | sedes y áreas afectadas                           | `SUPERVISION_EXPO`                                                             | `BANDEJA_Y_SIGUIENTE_ACCION + EXCEPCION_GUIADA`       | `CAMARA_OPCIONAL`                         | escalar con contexto y evidencia; no decidir desde mensaje informal | `CONDITIONALLY_CANONICAL` |
| `VPROC-0002` — Mantener estructura organizativa y jurídica             | `viso`      | crear, revisar y aplicar cambios de empresa, marca, sede o área  | corporativo                                       | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + VISTA_PREVIA_DE_IMPACTO`         | `NINGUNO`                                 | guardar borrador; bloquear aplicación sin validación completa       | `NO_SHARED_STATION`       |
| `VPROC-0003` — Gobernar politicas, delegaciones y limites              | `viso`      | redactar, revisar, aprobar, publicar y versionar                 | corporativo                                       | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + APROBACION_CON_IMPACTO`            | `NINGUNO`                                 | versión anterior permanece vigente hasta publicación confirmada     | `NO_SHARED_STATION`       |
| `VPROC-0004` — Coordinar compromisos y transferencias internas         | `viso`      | registrar, aceptar, ejecutar y verificar compromiso              | corporativo, sedes y áreas                        | `SUPERVISION_EXPO`                                                             | `BANDEJA_Y_SIGUIENTE_ACCION + ENTREGA_Y_ACEPTACION`   | `CAMARA_OPCIONAL`                         | entrega manual correlacionada y aceptación posterior                | `CANONICAL`               |
| `VPROC-0005` — Planear dotación y ejecutar selección                   | `viso`      | aprobar necesidad, publicar vacante, evaluar y seleccionar       | selección y gerencia                              | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + REVISION_COMPARATIVA`            | `DOCUMENTO_OPCIONAL`                      | guardar borrador y reanudar; no usar estación operativa compartida  | `NO_SHARED_STATION`       |
| `VPROC-0006` — Orquestar vinculación e incorporación                   | `viso`      | validar identidad, documentos, asignaciones, accesos e inducción | talento y administración                          | `NO_SHARED / UX-ADMIN`                                                         | `PASOS_GUIADOS + CHECKLIST + APROBACION_CON_IMPACTO`  | `CAMARA_DOCUMENTO_OPCIONAL`               | no habilitar trabajador hasta completar controles                   | `NO_SHARED_STATION`       |
| `VPROC-0006`                                                           | `viso`      | confirmar preparación del puesto y recepción por el trabajador   | sede y área asignada                              | `SUPERVISION_EXPO`                                                             | `CHECKLIST + ENTREGA_Y_ACEPTACION`                    | `CAMARA_OPCIONAL`                         | pendiente visible con responsable; no cierre verbal                 | `CONDITIONALLY_CANONICAL` |
| `VPROC-0007` — Administrar asignaciones y programación laboral         | `viso`      | crear, revisar y publicar programación                           | administración y gerencia                         | `NO_SHARED / UX-ADMIN`                                                         | `CALENDARIO_GUIADO + VALIDACION_PREVENTIVA`           | `NINGUNO`                                 | conservar versión publicada anterior hasta confirmar la nueva       | `NO_SHARED_STATION`       |
| `VPROC-0007`                                                           | `viso`      | consultar asignación vigente y cambios                           | todas las áreas operativas                        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW`          | `CONSULTA_SOLO_LECTURA`                               | `NINGUNO`                                 | mostrar última versión confirmada y advertir si esta desactualizada | `CANONICAL`               |
| `VPROC-0008` — Capturar y conciliar asistencia                         | `anima`     | identificarse, registrar entrada, pausa o salida                 | todas las áreas operativas                        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `IDENTIFICACION_RAPIDA + CONFIRMACIÓN`                | `QR_O_PIN; CAMARA_NO_REQUERIDA`           | folio local firmado e idempotente; reconciliación posterior         | `CANONICAL`               |
| `VPROC-0008`                                                           | `anima`     | revisar y decidir correcciones                                   | supervisión y administración                      | `SUPERVISION_EXPO`                                                             | `REVISION_GUIADA + APROBACION_CON_IMPACTO`            | `NINGUNO`                                 | no modificar el hecho original; crear decisión vinculada            | `CANONICAL`               |
| `VPROC-0009` — Gestionar novedades, ausencias, permisos y reemplazos   | `viso`      | registrar solicitud o novedad laboral                            | todas las áreas operativas                        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `FORMULARIO_CORTO + MOTIVO_ESTRUCTURADO`              | `CAMARA_DOCUMENTO_OPCIONAL`               | guardar pendiente con folio; no prometer aprobación                 | `CONDITIONALLY_CANONICAL` |
| `VPROC-0009`                                                           | `viso`      | revisar, decidir y coordinar reemplazo                           | supervisión y administración                      | `SUPERVISION_EXPO`                                                             | `BANDEJA_Y_SIGUIENTE_ACCION + APROBACION_CON_IMPACTO` | `NINGUNO`                                 | escalar a responsable vigente                                       | `CANONICAL`               |
| `VPROC-0010` — Preparar y reconciliar pagos y beneficios laborales     | `numera`    | consolidar, revisar, aprobar, pagar y conciliar                  | finanzas y gerencia                               | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + DOBLE_CONTROL`                     | `NINGUNO`                                 | bloquear pago; conservar lote y diferencias para reanudacion        | `NO_SHARED_STATION`       |
| `VPROC-0011` — Orquestar retiro laboral y cierre                       | `viso`      | planear retiro, revocar accesos y cerrar expediente              | talento, administración y seguridad               | `NO_SHARED / UX-ADMIN`                                                         | `PASOS_GUIADOS + CHECKLIST + APROBACION_CON_IMPACTO`  | `NINGUNO`                                 | revocacion urgente independiente del cierre documental              | `NO_SHARED_STATION`       |
| `VPROC-0011`                                                           | `viso`      | recibir activos, llaves, uniformes o elementos                   | bodega o responsable de custodia                  | `WAREHOUSE_FLOW`                                                               | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`       | `ESCANER_PREFERENTE; CAMARA_OPCIONAL`     | captura manual validada con folio y verificacion posterior          | `CANONICAL`               |
| `VPROC-0012` — Gestionar riesgos de seguridad y salud en el trabajo    | `viso`      | identificar, evaluar, tratar y verificar riesgo                  | áreas y supervisión                               | `SUPERVISION_EXPO + MOBILE`                                                    | `CHECKLIST + EVIDENCIA + EXCEPCION_GUIADA`            | `CAMARA_OPCIONAL; MEDICION_OPCIONAL`      | detención segura y reporte con folio                                | `CANONICAL`               |
| `VPROC-0013` — Gestionar incidentes, accidentes y emergencias          | `viso`      | reportar, estabilizar y escalar                                  | cualquier sede o área                             | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `ACCION_DE_EMERGENCIA + FORMULARIO_CORTO`             | `CAMARA_OPCIONAL; SENALIZACION_OPCIONAL`  | priorizar seguridad; reporte diferido cuando sea seguro             | `CANONICAL`               |
| `VPROC-0013`                                                           | `viso`      | investigar, definir acciones y cerrar                            | supervisión y administración                      | `SUPERVISION_EXPO`                                                             | `REVISION_GUIADA + CHECKLIST`                         | `DOCUMENTO_OPCIONAL`                      | conservar evidencia y cronología                                    | `CANONICAL`               |
| `VPROC-0014` — Ejecutar controles de higiene, inocuidad y cumplimiento | `viso`      | realizar control, registrar resultado y contener riesgo          | cocina, barra, producción, bodega e instalaciones | `KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + FOOD_HYGIENE`              | `CHECKLIST + MEDICION_GUIADA + EVIDENCIA`             | `CAMARA_OPCIONAL; MEDICION_SEGUN_CONTROL` | formato manual controlado y cuarentena cuando aplique               | `CANONICAL`               |

##### 11.2. Producto, recetas, oferta y especificaciones
| Proceso                                                                     | Propietaria | Paso o grupo de pasos                             | Ambito principal                     | Estación resuelta                   | Interacción aprobada                                 | Perifericos por capacidad                           | Contingencia o respaldo                                                | Estado                    |
| --------------------------------------------------------------------------- | ----------- | ------------------------------------------------- | ------------------------------------ | ----------------------------------- | ---------------------------------------------------- | --------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------- |
| `VPROC-0015` — Gobernar productos, presentaciones, unidades y equivalencias | `nexo`      | definir, revisar, aprobar y publicar maestro      | administración de producto           | `NO_SHARED / UX-ADMIN`              | `FORMULARIO_GUIADO + VISTA_PREVIA_DE_IMPACTO`        | `NINGUNO`                                           | conservar versión vigente anterior                                     | `NO_SHARED_STATION`       |
| `VPROC-0015`                                                                | `nexo`      | verificar código, presentación o etiqueta física  | bodega y producción                  | `WAREHOUSE_FLOW / PRODUCTION_BATCH` | `ESCANEO_Y_VERIFICACION`                             | `ESCANER_PREFERENTE; CÁMARA; ETIQUETADORA_OPCIONAL` | busqueda manual validada; no inventar codigos                          | `CONDITIONALLY_CANONICAL` |
| `VPROC-0016` — Gestionar desarrollo y versión de recetas                    | `fogo`      | definir, revisar, aprobar y publicar receta       | desarrollo, calidad y administración | `NO_SHARED / UX-ADMIN`              | `FORMULARIO_GUIADO + REVISION_COMPARATIVA`           | `NINGUNO`                                           | conservar versión vigente anterior                                     | `NO_SHARED_STATION`       |
| `VPROC-0016`                                                                | `fogo`      | ejecutar prueba y registrar rendimiento           | producción                           | `PRODUCTION_BATCH + MEASURE`        | `PASOS_GUIADOS + CAPTURA_CANTIDAD + MEDICION_GUIADA` | `BASCULA_SEGUN_RECETA; CAMARA_OPCIONAL`             | registro manual controlado y revisión técnica                          | `CANONICAL`               |
| `VPROC-0017` — Publicar oferta y disponibilidad                             | `pulso`     | validar, aprobar, programar y publicar oferta     | comercial y administración           | `NO_SHARED / UX-ADMIN`              | `REVISION_GUIADA + VISTA_PREVIA_DE_IMPACTO`          | `NINGUNO`                                           | mantener oferta anterior o retirar de forma segura                     | `NO_SHARED_STATION`       |
| `VPROC-0017`                                                                | `pulso`     | consultar oferta disponible durante venta         | servicio, caja y mostrador           | `SERVICE_CHECKOUT`                  | `SELECCION_TACTIL + CONSULTA_SOLO_LECTURA`           | `NINGUNO`                                           | mostrar última oferta confirmada y no prometer disponibilidad incierta | `CANONICAL`               |
| `VPROC-0017`                                                                | `pulso`     | propagar a canales                                | servicios tecnicos                   | `NO_HUMAN`                          | `EVENTO_AUTOMATICO`                                  | `NINGUNO`                                           | reintento idempotente y conciliación                                   | `NO_HUMAN_STATION`        |
| `VPROC-0018` — Mantener especificaciones, alérgenos y criterios de calidad  | `nexo`      | definir, revisar, aprobar y versionar             | calidad y administración             | `NO_SHARED / UX-ADMIN`              | `FORMULARIO_GUIADO + REVISION_GUIADA`                | `DOCUMENTO_OPCIONAL`                                | versión anterior sigue vigente                                         | `NO_SHARED_STATION`       |
| `VPROC-0018`                                                                | `nexo`      | consultar criterio durante recepción o producción | bodega, recepción y producción       | `WAREHOUSE_FLOW / PRODUCTION_BATCH` | `CONSULTA_SOLO_LECTURA + ALERTA_CRITICA`             | `NINGUNO`                                           | bloqueo seguro si falta especificacion obligatoria                     | `CANONICAL`               |

##### 11.3. Compras y recepción
| Proceso                                                    | Propietaria | Paso o grupo de pasos                                        | Ambito principal            | Estación resuelta                                      | Interacción aprobada                                          | Perifericos por capacidad                                     | Contingencia o respaldo                                     | Estado              |
| ---------------------------------------------------------- | ----------- | ------------------------------------------------------------ | --------------------------- | ------------------------------------------------------ | ------------------------------------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------- | ------------------- |
| `VPROC-0019` — Registrar y priorizar necesidades de compra | `origo`     | capturar necesidad desde consumo o faltante                  | bodega, producción y sedes  | `WAREHOUSE_FLOW / PRODUCTION_BATCH / SUPERVISION_EXPO` | `CAPTURA_CANTIDAD + MOTIVO_ESTRUCTURADO`                      | `ESCANER_OPCIONAL`                                            | guardar solicitud con folio; no crear orden automaticamente | `CANONICAL`         |
| `VPROC-0019`                                               | `origo`     | validar y priorizar                                          | compras y gerencia          | `NO_SHARED / UX-ADMIN`                                 | `REVISION_GUIADA`                                             | `NINGUNO`                                                     | mantener pendiente con responsable                          | `NO_SHARED_STATION` |
| `VPROC-0020` — Evaluar mercado, cotizaciones y proveedor   | `origo`     | solicitar, comparar, recomendar y decidir                    | compras y gerencia          | `NO_SHARED / UX-ADMIN`                                 | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO`               | `DOCUMENTO_OPCIONAL`                                          | guardar evidencia y no seleccionar por omision              | `NO_SHARED_STATION` |
| `VPROC-0021` — Aprobar y formalizar compra                 | `origo`     | revisar, aprobar, emitir y confirmar orden                   | compras y gerencia          | `NO_SHARED / UX-ADMIN`                                 | `PASOS_GUIADOS + DOBLE_CONTROL`                               | `DOCUMENTO_O_IMPRESION_OPCIONAL`                              | conservar borrador; envío idempotente                       | `NO_SHARED_STATION` |
| `VPROC-0022` — Recibir y reconciliar compras               | `origo`     | registrar llegada y verificar producto, documento y cantidad | recepción y bodega          | `WAREHOUSE_FLOW + MEASURE`                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + MEDICION_GUIADA` | `ESCANER_PREFERENTE; BASCULA_SEGUN_PRODUCTO; CAMARA_OPCIONAL` | captura manual validada y folio de contingencia             | `CANONICAL`         |
| `VPROC-0022`                                               | `origo`     | aceptar diferencia, ubicar y cerrar                          | recepción, bodega y compras | `WAREHOUSE_FLOW / SUPERVISION_EXPO`                    | `REVISION_ANTES_DE_CONFIRMAR + ENTREGA_Y_ACEPTACION`          | `ETIQUETADORA_O_IMPRESORA_OPCIONAL`                           | recepción parcial y pendiente explicito                     | `CANONICAL`         |

##### 11.4. Inventario, activos y logística interna
| Proceso                                                            | Propietaria | Paso o grupo de pasos                                     | Ambito principal                         | Estación resuelta                                                     | Interacción aprobada                                               | Perifericos por capacidad                                    | Contingencia o respaldo                                                  | Estado      |
| ------------------------------------------------------------------ | ----------- | --------------------------------------------------------- | ---------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------------ | ----------- |
| `VPROC-0023` — Gestionar ubicaciones de inventario                 | `nexo`      | definir, activar, cambiar y verificar ubicación           | bodega                                   | `WAREHOUSE_FLOW`                                                      | `ESCANEO_Y_VERIFICACION + FORMULARIO_GUIADO`                       | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL`                  | código legible y captura manual validada                                 | `CANONICAL` |
| `VPROC-0024` — Ejecutar entradas y ubicación de inventario         | `nexo`      | validar, mover, confirmar y ubicar                        | recepción y bodega                       | `WAREHOUSE_FLOW`                                                      | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + CAMBIO_DE_ESTADO`     | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL`                  | captura manual con folio y conciliación                                  | `CANONICAL` |
| `VPROC-0025` — Ejecutar salidas, retiros y traslados de inventario | `nexo`      | reservar, preparar, retirar, entregar y confirmar destino | bodega y áreas receptoras                | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + ENTREGA_Y_ACEPTACION` | `ESCANER_PREFERENTE`                                         | captura manual autorizada; no cerrar sin receptor cuando sea obligatorio | `CANONICAL` |
| `VPROC-0026` — Ejecutar conteos y ajustes de inventario            | `nexo`      | capturar conteo físico por ubicación y presentación       | bodega y áreas con stock                 | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD`                        | `ESCANER_PREFERENTE`                                         | hoja controlada y doble digitacion posterior                             | `CANONICAL` |
| `VPROC-0026`                                                       | `nexo`      | investigar diferencia y aprobar ajuste                    | supervisión y control de inventario      | `SUPERVISION_EXPO`                                                    | `REVISION_GUIADA + DOBLE_CONTROL`                                  | `CAMARA_OPCIONAL`                                            | no ajustar por el mismo acto de conteo                                   | `CANONICAL` |
| `VPROC-0027` — Gestionar condición, cuarentena y disposición       | `nexo`      | detectar, aislar, evaluar y ejecutar decisión             | bodega, calidad y producción             | `WAREHOUSE_FLOW / PRODUCTION_BATCH + MOBILE`                          | `ESCANEO_Y_VERIFICACION + EVIDENCIA + EXCEPCION_GUIADA`            | `CAMARA_PREFERENTE; ETIQUETADORA_OPCIONAL`                   | separacion física y folio; no liberar sin decisión                       | `CANONICAL` |
| `VPROC-0028` — Gestionar reabastecimiento interno y remisiones     | `nexo`      | solicitar y aprobar reabastecimiento                      | sede solicitante y bodega                | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW` | `CAPTURA_CANTIDAD + BANDEJA_Y_SIGUIENTE_ACCION`                    | `NINGUNO`                                                    | solicitud pendiente con prioridad visible                                | `CANONICAL` |
| `VPROC-0028`                                                       | `nexo`      | preparar, despachar, transportar, recibir y conciliar     | bodega, despacho y sede receptora        | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                    | `ESCANER_PREFERENTE; IMPRESORA_OPCIONAL`                     | folio de remision y recepción parcial                                    | `CANONICAL` |
| `VPROC-0029` — Gestionar activos y custodia                        | `nexo`      | registrar, etiquetar, asignar, transferir y devolver      | bodega, tecnologia y responsables        | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                    | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL; CAMARA_OPCIONAL` | identificación legible y acta controlada                                 | `CANONICAL` |
| `VPROC-0030` — Gestionar mantenimiento de activos y equipos        | `nexo`      | reportar, diagnosticar, reparar, probar y liberar         | todas las sedes; soporte y mantenimiento | `WAREHOUSE_FLOW / SUPERVISION_EXPO + MOBILE`                          | `FORMULARIO_CORTO + CHECKLIST + EVIDENCIA`                         | `CAMARA_OPCIONAL; MEDICION_SEGUN_EQUIPO`                     | equipo fuera de servicio y escalamiento                                  | `CANONICAL` |
| `VPROC-0031` — Gestionar inspeccion y operación de vehículos       | `nexo`      | inspeccionar, asignar, usar y revisar                     | despacho y transporte                    | `WAREHOUSE_FLOW + MOBILE_ROUTE`                                       | `CHECKLIST + EVIDENCIA + ENTREGA_Y_ACEPTACION`                     | `CAMARA_OPCIONAL; LECTOR_OPCIONAL`                           | formato de inspeccion y bloqueo seguro                                   | `CANONICAL` |
| `VPROC-0032` — Controlar reutilizables y contenedores              | `nexo`      | preparar, entregar, custodiar, devolver y verificar       | producción, bodega, despacho y sedes     | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD + ENTREGA_Y_ACEPTACION` | `ESCANER_PREFERENTE`                                         | conteo manual con folio y conciliación                                   | `CANONICAL` |

##### 11.5. Planeación, ejecucion y cierre productivo
| Proceso                                                    | Propietaria | Paso o grupo de pasos                                                        | Ambito principal                                     | Estación resuelta                             | Interacción aprobada                                          | Perifericos por capacidad                                           | Contingencia o respaldo                                        | Estado                    |
| ---------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------- | ---------------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------------- | -------------------------------------------------------------- | ------------------------- |
| `VPROC-0033` — Planear producción                          | `fogo`      | consolidar demanda, validar capacidad, aprobar y publicar                    | planeación y supervisión                             | `SUPERVISION_EXPO / NO_SHARED UX-ADMIN`       | `TABLERO + REVISION_GUIADA + APROBACION_CON_IMPACTO`          | `NINGUNO`                                                           | mantener plan vigente anterior y cambios versionados           | `CONDITIONALLY_CANONICAL` |
| `VPROC-0033`                                               | `fogo`      | consultar trabajo publicado                                                  | áreas productivas                                    | `PRODUCTION_BATCH`                            | `BANDEJA_Y_SIGUIENTE_ACCION`                                  | `PANTALLA_O_IMPRESION_OPCIONAL`                                     | última versión confirmada visible                              | `CANONICAL`               |
| `VPROC-0034` — Ejecutar producción                         | `fogo`      | reservar materiales, iniciar, registrar consumos, producir y reportar salida | panaderia, reposteria, cocina caliente y demas áreas | `PRODUCTION_BATCH + MEASURE + FOOD_HYGIENE`   | `PASOS_GUIADOS + CAPTURA_CANTIDAD + CAMBIO_DE_ESTADO`         | `BASCULA_SEGUN_PROCESO; ESCANER_OPCIONAL`                           | registro manual controlado; no estimar medición obligatoria    | `CANONICAL`               |
| `VPROC-0035` — Inspeccionar calidad y decidir disposición  | `fogo`      | inspeccionar, registrar resultados y ejecutar disposición                    | calidad y producción                                 | `PRODUCTION_BATCH + MEASURE`                  | `CHECKLIST + MEDICION_GUIADA + EVIDENCIA`                     | `CAMARA_OPCIONAL; MEDICION_SEGUN_CONTROL`                           | cuarentena y formato controlado                                | `CANONICAL`               |
| `VPROC-0036` — Empacar, etiquetar y transferir producto    | `fogo`      | preparar materiales, empacar, verificar etiqueta y registrar salida          | empaque, producción y bodega                         | `PRODUCTION_BATCH / WAREHOUSE_FLOW + MEASURE` | `PASOS_GUIADOS + ESCANEO_Y_VERIFICACION + CAPTURA_CANTIDAD`   | `ETIQUETADORA_PREFERENTE; BASCULA_SEGUN_PRODUCTO; ESCANER_OPCIONAL` | etiqueta manual controlada y bloqueo si falta dato obligatorio | `CANONICAL`               |
| `VPROC-0037` — Cerrar producción y reconciliar rendimiento | `fogo`      | consolidar producción, consumo, merma, reproceso e inventario                | producción y supervisión                             | `PRODUCTION_BATCH / SUPERVISION_EXPO`         | `REVISION_GUIADA + CAPTURA_CANTIDAD + APROBACION_CON_IMPACTO` | `BASCULA_SEGUN_PROCESO`                                             | dejar cierre pendiente; no inventar cantidades                 | `CANONICAL`               |

##### 11.6. Servicio, ventas, pagos y cliente
| Proceso                                                    | Propietaria | Paso o grupo de pasos                                            | Ambito principal                        | Estación resuelta                                      | Interacción aprobada                                                | Perifericos por capacidad                   | Contingencia o respaldo                                    | Estado                    |
| ---------------------------------------------------------- | ----------- | ---------------------------------------------------------------- | --------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------- | ------------------------- |
| `VPROC-0038` — Atender servicio en mesa                    | `pulso`     | abrir mesa, tomar pedido y modificar antes de preparación        | salón y servicio                        | `SERVICE_CHECKOUT + MOBILE`                            | `SELECCION_TACTIL + BANDEJA_Y_SIGUIENTE_ACCION`                     | `IMPRESORA_OPCIONAL`                        | envío digital; comprobante en pantalla                     | `CANONICAL`               |
| `VPROC-0038`                                               | `pulso`     | preparar y marcar entrega parcial o total                        | cocina, barra y expedición              | `KITCHEN_PREP`                                         | `COLA_VISUAL + CAMBIO_DE_ESTADO`                                    | `IMPRESORA_OPCIONAL; SENALIZACION_OPCIONAL` | pantalla como respaldo de comandas                         | `CANONICAL`               |
| `VPROC-0038`                                               | `pulso`     | cobrar y cerrar mesa                                             | caja y servicio autorizado              | `SERVICE_CHECKOUT`                                     | `PAGO_CONFIRMADO + REVISION_ANTES_DE_CONFIRMAR`                     | `DATAFONO_SEGUN_MEDIO; IMPRESORA_OPCIONAL`  | no repetir cobro; consulta por referencia                  | `CANONICAL`               |
| `VPROC-0039` — Atender venta de mostrador                  | `pulso`     | seleccionar productos, preparar, cobrar y entregar               | mostrador, caja y preparación           | `SERVICE_CHECKOUT / KITCHEN_PREP`                      | `SELECCION_TACTIL + CAMBIO_DE_ESTADO + PAGO_CONFIRMADO`             | `DATAFONO_SEGUN_MEDIO; IMPRESORA_OPCIONAL`  | flujo digital y consulta de pago antes de reintentar       | `CANONICAL`               |
| `VPROC-0040` — Integrar pedidos de canales externos        | `pulso`     | recibir, validar y mapear pedido                                 | servicio técnico                        | `NO_HUMAN`                                             | `EVENTO_AUTOMATICO`                                                 | `NINGUNO`                                   | reintento idempotente y cola durable                       | `NO_HUMAN_STATION`        |
| `VPROC-0040`                                               | `pulso`     | aceptar, preparar y conciliar excepciones                        | caja, cocina, barra y supervisión       | `SERVICE_CHECKOUT / KITCHEN_PREP / SUPERVISION_EXPO`   | `BANDEJA_Y_SIGUIENTE_ACCION + CAMBIO_DE_ESTADO`                     | `IMPRESORA_OPCIONAL; SENALIZACION_OPCIONAL` | mantener pedido visible y bloquear duplicados              | `CANONICAL`               |
| `VPROC-0041` — Gestionar venta comercial B2B y catering    | `pulso`     | revisar requerimientos, cotizar, aprobar y confirmar             | comercial y gerencia                    | `NO_SHARED / UX-ADMIN`                                 | `FORMULARIO_GUIADO + REVISION_COMPARATIVA + APROBACION_CON_IMPACTO` | `DOCUMENTO_OPCIONAL`                        | guardar borrador y conservar vigencia                      | `NO_SHARED_STATION`       |
| `VPROC-0041`                                               | `pulso`     | cumplir producción, despacho, entrega y facturacion              | producción, bodega, despacho y finanzas | `PRODUCTION_BATCH / WAREHOUSE_FLOW / SUPERVISION_EXPO` | `BANDEJA_Y_SIGUIENTE_ACCION + ENTREGA_Y_ACEPTACION`                 | `ESCANER_OPCIONAL; IMPRESORA_OPCIONAL`      | pendientes separados por proceso propietario               | `CONDITIONALLY_CANONICAL` |
| `VPROC-0042` — Gestionar cambios de pedido                 | `pulso`     | solicitar, evaluar impacto, autorizar y aplicar cambio           | servicio, caja, cocina y supervisión    | `SERVICE_CHECKOUT / KITCHEN_PREP / SUPERVISION_EXPO`   | `REVISION_ANTES_DE_CONFIRMAR + EXCEPCION_GUIADA`                    | `NINGUNO`                                   | no aplicar si el estado cambio; crear corrección vinculada | `CANONICAL`               |
| `VPROC-0043` — Gestionar pago y conciliación de venta      | `pulso`     | seleccionar medio, autorizar, capturar y confirmar               | caja y mostrador                        | `SERVICE_CHECKOUT`                                     | `PAGO_CONFIRMADO + RESULTADO_VISIBLE`                               | `DATAFONO_SEGUN_MEDIO; IMPRESORA_OPCIONAL`  | consultar por referencia; nunca reintentar a ciegas        | `CANONICAL`               |
| `VPROC-0043`                                               | `pulso`     | emitir documento y conciliar                                     | caja y finanzas                         | `SERVICE_CHECKOUT / NO_SHARED UX-ADMIN`                | `REVISION_GUIADA`                                                   | `IMPRESORA_OPCIONAL`                        | documento digital y reimpresion separada del pago          | `CONDITIONALLY_CANONICAL` |
| `VPROC-0044` — Cerrar y conciliar caja                     | `pulso`     | contar, comparar ventas, revisar diferencia y aprobar cierre     | caja y supervisión                      | `SERVICE_CHECKOUT / SUPERVISION_EXPO`                  | `CAPTURA_CANTIDAD + DOBLE_CONTROL + APROBACION_CON_IMPACTO`         | `IMPRESORA_OPCIONAL`                        | guardar conteo; no cerrar con diferencia sin tratamiento   | `CANONICAL`               |
| `VPROC-0045` — Gestionar fidelizacion, puntos y beneficios | `pass`      | identificar cliente, validar elegibilidad y registrar movimiento | caja, mostrador y servicio              | `SERVICE_CHECKOUT`                                     | `ESCANEO_QR + REVISION_ANTES_DE_CONFIRMAR`                          | `CAMARA_O_LECTOR_QR`                        | busqueda autorizada y código de un solo uso                | `CANONICAL`               |
| `VPROC-0045`                                               | `pass`      | conciliar ledger y consentimientos                               | servicio técnico y administración       | `NO_HUMAN / NO_SHARED UX-ADMIN`                        | `EVENTO_AUTOMATICO + REVISION_GUIADA`                               | `NINGUNO`                                   | idempotencia y no alterar saldo por reintento              | `CONDITIONALLY_CANONICAL` |
| `VPROC-0046` — Gestionar reclamos y remedios               | `pulso`     | recibir y clasificar reclamo                                     | servicio, caja o canal autorizado       | `SERVICE_CHECKOUT + MOBILE`                            | `FORMULARIO_CORTO + EVIDENCIA`                                      | `CAMARA_OPCIONAL`                           | folio y traspaso a responsable                             | `CANONICAL`               |
| `VPROC-0046`                                               | `pulso`     | investigar, aprobar remedio y cerrar                             | supervisión y administración            | `SUPERVISION_EXPO / NO_SHARED UX-ADMIN`                | `REVISION_GUIADA + APROBACION_CON_IMPACTO`                          | `DOCUMENTO_OPCIONAL`                        | no prometer compensación sin autoridad                     | `CONDITIONALLY_CANONICAL` |
| `VPROC-0047` — Gestionar reservas                          | `pulso`     | consultar disponibilidad, proponer terminos y confirmar          | servicio, caja y administración         | `SERVICE_CHECKOUT / NO_SHARED UX-ADMIN`                | `CALENDARIO_GUIADO + REVISION_ANTES_DE_CONFIRMAR`                   | `DATAFONO_SEGUN_DEPOSITO`                   | mantener solicitud pendiente y no duplicar reserva         | `CONDITIONALLY_CANONICAL` |
| `VPROC-0047`                                               | `pulso`     | preparar y completar servicio                                    | servicio, cocina y supervisión          | `SERVICE_CHECKOUT / KITCHEN_PREP`                      | `BANDEJA_Y_SIGUIENTE_ACCION + CAMBIO_DE_ESTADO`                     | `IMPRESORA_OPCIONAL`                        | última reserva confirmada visible                          | `CANONICAL`               |

##### 11.7. Transporte y entregas
| Proceso                                           | Propietaria | Paso o grupo de pasos                                    | Ambito principal                  | Estación resuelta                                      | Interacción aprobada                                            | Perifericos por capacidad             | Contingencia o respaldo                            | Estado                    |
| ------------------------------------------------- | ----------- | -------------------------------------------------------- | --------------------------------- | ------------------------------------------------------ | --------------------------------------------------------------- | ------------------------------------- | -------------------------------------------------- | ------------------------- |
| `VPROC-0048` — Planear rutas, vehículos y carga   | `nexo`      | consolidar demanda, optimizar, asignar y publicar        | logística y supervisión           | `SUPERVISION_EXPO / NO_SHARED UX-ADMIN`                | `MAPA_O_LISTA + REVISION_GUIADA + APROBACION_CON_IMPACTO`       | `NINGUNO`                             | conservar plan anterior y cambios versionados      | `CONDITIONALLY_CANONICAL` |
| `VPROC-0049` — Ejecutar ruta y confirmar entregas | `nexo`      | validar carga y transferir custodia                      | despacho                          | `WAREHOUSE_FLOW + MOBILE_ROUTE`                        | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                 | `ESCANER_PREFERENTE; CAMARA_OPCIONAL` | lista controlada y folio de salida                 | `CANONICAL`               |
| `VPROC-0049`                                      | `nexo`      | navegar, registrar parada, entregar, rechazar o retornar | ruta y destino                    | `WAREHOUSE_FLOW + MOBILE_ROUTE`                        | `BANDEJA_Y_SIGUIENTE_ACCION + EVIDENCIA + ENTREGA_Y_ACEPTACION` | `CAMARA_OPCIONAL; UBICACION_OPCIONAL` | captura offline durable y sincronizacion posterior | `CANONICAL`               |
| `VPROC-0050` — Integrar entrega de tercero        | `pulso`     | enviar solicitud, recibir estados y conciliar            | servicio técnico                  | `NO_HUMAN`                                             | `EVENTO_AUTOMATICO`                                             | `NINGUNO`                             | reintento idempotente y reconciliación             | `NO_HUMAN_STATION`        |
| `VPROC-0050`                                      | `pulso`     | entregar al proveedor y resolver incidentes              | mostrador, despacho y supervisión | `SERVICE_CHECKOUT / WAREHOUSE_FLOW / SUPERVISION_EXPO` | `ENTREGA_Y_ACEPTACION + EXCEPCION_GUIADA`                       | `CAMARA_OPCIONAL; ESCANER_OPCIONAL`   | entrega interna controlada o bloqueo seguro        | `CONDITIONALLY_CANONICAL` |

##### 11.8. Finanzas y obligaciones
| Proceso                                                              | Propietaria | Paso o grupo de pasos                                      | Ambito principal     | Estación resuelta      | Interacción aprobada                            | Perifericos por capacidad | Contingencia o respaldo                                | Estado              |
| -------------------------------------------------------------------- | ----------- | ---------------------------------------------------------- | -------------------- | ---------------------- | ----------------------------------------------- | ------------------------- | ------------------------------------------------------ | ------------------- |
| `VPROC-0051` — Registrar hechos economicos desde eventos             | `numera`    | recibir, clasificar y registrar evento económico           | servicio técnico     | `NO_HUMAN`             | `EVENTO_AUTOMATICO`                             | `NINGUNO`                 | cola idempotente y cuarentena de evento invalido       | `NO_HUMAN_STATION`  |
| `VPROC-0051`                                                         | `numera`    | revisar excepción y conciliar                              | finanzas             | `NO_SHARED / UX-ADMIN` | `REVISION_GUIADA + APROBACION_CON_IMPACTO`      | `DOCUMENTO_OPCIONAL`      | no contabilizar sin evento o soporte valido            | `NO_SHARED_STATION` |
| `VPROC-0052` — Gestionar obligaciones y pagos a proveedores          | `numera`    | validar documento, aprobar, programar, pagar y conciliar   | finanzas y gerencia  | `NO_SHARED / UX-ADMIN` | `PASOS_GUIADOS + DOBLE_CONTROL`                 | `DOCUMENTO_OPCIONAL`      | retener pago y conservar instruccion                   | `NO_SHARED_STATION` |
| `VPROC-0053` — Gestionar cartera, cobro y recaudo                    | `numera`    | registrar obligación, cobrar, aplicar y conciliar          | finanzas y comercial | `NO_SHARED / UX-ADMIN` | `BANDEJA_Y_SIGUIENTE_ACCION + REVISION_GUIADA`  | `DOCUMENTO_OPCIONAL`      | mantener recaudo sin aplicar hasta resolver diferencia | `NO_SHARED_STATION` |
| `VPROC-0054` — Gestionar costos, distribucion, cierre y rentabilidad | `numera`    | consolidar entradas, calcular, revisar, aprobar y publicar | finanzas y gerencia  | `NO_SHARED / UX-ADMIN` | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO` | `NINGUNO`                 | conservar versión previa y calculo reproducible        | `NO_SHARED_STATION` |

##### 11.9. Instalaciones, marketing, tecnologia e información
| Proceso                                                              | Propietaria | Paso o grupo de pasos                                       | Ambito principal                 | Estación resuelta                                                              | Interacción aprobada                                          | Perifericos por capacidad              | Contingencia o respaldo                                               | Estado                    |
| -------------------------------------------------------------------- | ----------- | ----------------------------------------------------------- | -------------------------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------- | -------------------------------------- | --------------------------------------------------------------------- | ------------------------- |
| `VPROC-0055` — Gestionar instalaciones, limpieza, plagas y servicios | `nexo`      | reportar, planear, ejecutar, verificar y liberar            | todas las sedes e instalaciones  | `WAREHOUSE_FLOW / SUPERVISION_EXPO + MOBILE`                                   | `CHECKLIST + EVIDENCIA + CAMBIO_DE_ESTADO`                    | `CAMARA_OPCIONAL; MEDICION_SEGUN_CASO` | cierre temporal o proveedor alterno; folio de trabajo                 | `CANONICAL`               |
| `VPROC-0056` — Gestionar contenido y promociones                     | `aura`      | crear, revisar, aprobar, programar y publicar               | marketing y gerencia             | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + VISTA_PREVIA_DE_IMPACTO`                 | `ARCHIVO_MULTIMEDIA`                   | mantener versión anterior o pausar publicación                        | `NO_SHARED_STATION`       |
| `VPROC-0056`                                                         | `aura`      | publicar y medir por integración                            | servicio técnico                 | `NO_HUMAN`                                                                     | `EVENTO_AUTOMATICO`                                           | `NINGUNO`                              | reintento idempotente y retiro seguro                                 | `NO_HUMAN_STATION`        |
| `VPROC-0057` — Gestionar consultas y oportunidades digitales         | `aura`      | clasificar, asignar, responder y dar seguimiento            | marketing y comercial            | `NO_SHARED / UX-ADMIN`                                                         | `BANDEJA_Y_SIGUIENTE_ACCION + FORMULARIO_GUIADO`              | `ARCHIVO_OPCIONAL`                     | mantener caso con folio y canal de respuesta                          | `NO_SHARED_STATION`       |
| `VPROC-0058` — Gestionar solicitudes e incidentes tecnologicos       | `viso`      | reportar caso desde el punto afectado                       | cualquier sede o estación        | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `FORMULARIO_CORTO + DIAGNOSTICO_GUIADO`                       | `CAMARA_OPCIONAL`                      | instrucciones seguras y escalamiento; no pedir configuración avanzada | `CANONICAL`               |
| `VPROC-0058`                                                         | `viso`      | diagnosticar, resolver, validar y documentar                | soporte y administración         | `NO_SHARED / UX-ADMIN`                                                         | `BANDEJA_Y_SIGUIENTE_ACCION + CHECKLIST`                      | `HERRAMIENTA_TECNICA_SEPARADA`         | workaround controlado y rollback                                      | `NO_SHARED_STATION`       |
| `VPROC-0059` — Gestionar ciclo de acceso tecnologico                 | `viso`      | solicitar, revisar, aprobar, provisionar, revisar y revocar | seguridad y administración       | `NO_SHARED / UX-ADMIN`                                                         | `FORMULARIO_GUIADO + DOBLE_CONTROL + VISTA_PREVIA_DE_IMPACTO` | `NINGUNO`                              | revocacion de emergencia y bloqueo seguro                             | `NO_SHARED_STATION`       |
| `VPROC-0060` — Gestionar documentos y evidencia                      | `viso`      | capturar evidencia desde operación                          | cualquier sede o área autorizada | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW + MOBILE` | `EVIDENCIA + CLASIFICACION_MINIMA`                            | `CAMARA_O_ARCHIVO_SEGUN_CASO`          | guardar cifrado y cargar después; no exponer entre actores            | `CONDITIONALLY_CANONICAL` |
| `VPROC-0060`                                                         | `viso`      | revisar, aprobar, retener y disponer                        | administración y control         | `NO_SHARED / UX-ADMIN`                                                         | `REVISION_GUIADA + APROBACION_CON_IMPACTO`                    | `NINGUNO`                              | bloqueo por retención y versión vinculada                             | `NO_SHARED_STATION`       |

##### 11.10. Mejora, continuidad, riesgos y procesos adicionales
| Proceso                                                               | Propietaria | Paso o grupo de pasos                                                         | Ambito principal                    | Estación resuelta                                                     | Interacción aprobada                                                | Perifericos por capacidad                   | Contingencia o respaldo                                              | Estado                    |
| --------------------------------------------------------------------- | ----------- | ----------------------------------------------------------------------------- | ----------------------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------- | -------------------------------------------------------------------- | ------------------------- |
| `VPROC-0061` — Gestionar medición, mejora y verificacion de resultado | `numera`    | definir indicador, analizar, decidir y verificar                              | gerencia y análisis                 | `NO_SHARED / UX-ADMIN`                                                | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO`                     | `NINGUNO`                                   | conservar línea base y resultado inconcluso                          | `NO_SHARED_STATION`       |
| `VPROC-0061`                                                          | `numera`    | consultar alertas y acciones de mejora                                        | supervisión                         | `SUPERVISION_EXPO`                                                    | `TABLERO + BANDEJA_Y_SIGUIENTE_ACCION`                              | `NINGUNO`                                   | última medición confirmada con fecha                                 | `CONDITIONALLY_CANONICAL` |
| `VPROC-0062` — Gestionar continuidad y recuperación                   | `viso`      | detectar, declarar, priorizar y coordinar respuesta                           | supervisión y gerencia              | `SUPERVISION_EXPO + MOBILE`                                           | `ALERTA_CRITICA + BANDEJA_Y_SIGUIENTE_ACCION + EXCEPCION_GUIADA`    | `SENALIZACION_OPCIONAL`                     | guía manual aprobada y canal alterno                                 | `CANONICAL`               |
| `VPROC-0062`                                                          | `viso`      | operar mínimo, recuperar y reconciliar                                        | todas las estaciones afectadas      | `SERVICE_CHECKOUT / KITCHEN_PREP / PRODUCTION_BATCH / WAREHOUSE_FLOW` | `MODO_CONTINGENCIA + RECUPERACION_GUIADA`                           | `SEGUN_CAPACIDAD`                           | folio manual u offline y reincorporacion controlada                  | `CANONICAL`               |
| `VPROC-0063` — Gestionar riesgos empresariales                        | `viso`      | identificar, valorar, tratar, aceptar y revisar                               | gerencia y control                  | `NO_SHARED / UX-ADMIN`                                                | `FORMULARIO_GUIADO + REVISION_COMPARATIVA + APROBACION_CON_IMPACTO` | `DOCUMENTO_OPCIONAL`                        | mantener riesgo abierto y escalado                                   | `NO_SHARED_STATION`       |
| `VPROC-0064` — Gestionar relaciones con asesores y autoridades        | `viso`      | recibir, asignar, preparar, aprobar, enviar y verificar respuesta             | administración, gerencia y asesores | `NO_SHARED / UX-ADMIN`                                                | `BANDEJA_Y_SIGUIENTE_ACCION + CHECKLIST + APROBACION_CON_IMPACTO`   | `DOCUMENTO_REQUERIDO_SEGUN_CASO`            | conservar vencimiento, acuse y evidencia                             | `NO_SHARED_STATION`       |
| `VPROC-0065` — Acompanar desempeño y desarrollo                       | `viso`      | definir objetivos, dar seguimiento, retroalimentar y decidir                  | trabajador y responsable autorizado | `NO_SHARED / UX-ADMIN PRIVADO`                                        | `FORMULARIO_GUIADO + REVISION_PRIVADA`                              | `NINGUNO`                                   | borrador privado y acceso mínimo                                     | `NO_SHARED_STATION`       |
| `VPROC-0066` — Entregar y controlar elementos de protección           | `viso`      | validar necesidad, reservar, entregar, aceptar, reemplazar y devolver         | bodega, SST y trabajador            | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + ENTREGA_Y_ACEPTACION`                     | `ESCANER_PREFERENTE; CAMARA_OPCIONAL`       | acta controlada y bloqueo si elemento no cumple                      | `CANONICAL`               |
| `VPROC-0067` — Gestionar kits y conjuntos                             | `nexo`      | definir y aprobar composicion                                                 | administración de inventario        | `NO_SHARED / UX-ADMIN`                                                | `FORMULARIO_GUIADO + REVISION_GUIADA`                               | `NINGUNO`                                   | versión previa permanece vigente                                     | `NO_SHARED_STATION`       |
| `VPROC-0067`                                                          | `nexo`      | armar, verificar, asignar, usar y devolver                                    | bodega y responsables               | `WAREHOUSE_FLOW + MOBILE`                                             | `ESCANEO_Y_VERIFICACION + CHECKLIST + ENTREGA_Y_ACEPTACION`         | `ESCANER_PREFERENTE; ETIQUETADORA_OPCIONAL` | conteo manual con folio y conciliación                               | `CANONICAL`               |
| `VPROC-0068` — Medir satisfacción del cliente                         | `pulso`     | preparar muestra e instrumento y analizar resultados                          | comercial y gerencia                | `NO_SHARED / UX-ADMIN`                                                | `FORMULARIO_GUIADO + REVISION_COMPARATIVA`                          | `NINGUNO`                                   | conservar sesgo, consentimiento y limitaciones                       | `NO_SHARED_STATION`       |
| `VPROC-0068`                                                          | `pulso`     | invitar y capturar respuesta                                                  | cliente en punto o canal propio     | `SERVICE_CHECKOUT / CLIENT_MOBILE`                                    | `QR_O_ENLACE + FORMULARIO_CORTO`                                    | `CAMARA_QR_OPCIONAL`                        | respuesta posterior por enlace; no obligar al trabajador a responder | `CONDITIONALLY_CANONICAL` |
| `VPROC-0069` — Gestionar presupuestos versionados                     | `numera`    | definir supuestos, consolidar, revisar, aprobar, vigilar y revisar proyección | finanzas y gerencia                 | `NO_SHARED / UX-ADMIN`                                                | `REVISION_COMPARATIVA + APROBACION_CON_IMPACTO`                     | `NINGUNO`                                   | conservar presupuesto base y crear nueva versión                     | `NO_SHARED_STATION`       |



---

#### 12. Reglas para procesos con varias estaciones

Un proceso puede recorrer varias estaciones. En esos casos:

1. cada work item conserva proceso, paso, objeto, versión y responsable;
2. el cambio de estación no crea una instancia nueva;
3. la entrega exige aceptación cuando cambia custodia o responsabilidad;
4. el receptor ve trabajo realizado, pendientes, evidencia y siguiente acción;
5. dos estaciones no pueden confirmar simultáneamente el mismo efecto;
6. la fuente de verdad permanece en la aplicación propietaria;
7. una proyección o impresion local no sustituye el estado canónico.

---

#### 13. Pasos administrativos y automaticos

`NO_SHARED / UX-ADMIN` es una decisión positiva, no un vacio. Protege privacidad, captura extensa, revisión comparativa, edicion masiva y decisiones sensibles que no deben ejecutarse en una tablet operativa compartida.

`NO_HUMAN` tampoco elimina responsabilidad. Todo paso automático conserva:

- comando o evento identificado;
- versión contractual;
- idempotencia;
- correlacion;
- reintento limitado;
- observabilidad;
- reconciliación;
- escalamiento a una bandeja humana cuando falle.

---

#### 14. Operación offline, falla y recuperación

Cada fila deberá materializar una de estas respuestas:

1. continuar localmente con cola durable;
2. continuar en modo degradado digital;
3. utilizar formato manual controlado;
4. cambiar a capacidad o equipo alterno;
5. bloquear de forma segura;
6. escalar con contexto suficiente.

La respuesta elegida dependera del proceso y paso. No existe un modo offline universal.

---

#### 15. Privacidad, accesibilidad y ambiente

Toda implementación derivada deberá:

- limpiar datos temporales al cambiar de trabajador;
- ocultar información no necesaria en vista pública;
- no depender solo de color o sonido;
- permitir tacto confiable en la condición física aplicable;
- evitar captura extensa caminando o con manos ocupadas;
- conservar lectura mínima y acción primaria visible;
- impedir que fotos, archivos o busquedas del actor anterior queden expuestos;
- diferenciar claramente exito, pendiente, error y resultado aun no confirmado.

---

#### 16. Capacidad humana y soporte

La matriz se aprueba bajo estas restricciones:

- no se contrata una persona para repartir trabajo ordinario;
- no se asigna un técnico permanente por sede, turno o estación;
- los responsables actuales pueden combinar facilitacion, observacion y soporte cuando no exista conflicto;
- las estaciones ofrecen diagnostico guiado de primer nivel;
- los problemas repetitivos generan corrección de producto, infraestructura o capacitacion;
- la necesidad de ayuda permanente se considera defecto, no modelo operativo objetivo.

---

#### 17. Gobierno de cambios

Todo cambio posterior deberá indicar:

```text
process_id
step_or_group
current_station_resolution
proposed_resolution
reason
risk
source_of_evidence
affected_sites
affected_components
migration_or_compatibility
pilot_requirement
approver
versión
```

Cambiar hardware por disponibilidad comercial no cambia automaticamente la matriz. Cambiar el contrato del paso, su riesgo o su consecuencia si exige nueva versión y revisión de requisitos.

---

#### 18. Habilitacion de diseño y código

Esta tarea habilita:

- `UX-ADMIN-001` a `UX-ADMIN-005`;
- `PROC-SCREEN-001` a `PROC-SCREEN-028` después del subbloque administrativo;
- prototipos tecnicos y componentes desacoplados;
- mocks de perifericos;
- contratos de adaptadores;
- pruebas unitarias y contractuales tempranas;
- planificación E5 posterior.

No habilita despliegue productivo ni compra definitiva. Cada paquete de implementación deberá declarar las filas de esta matriz que materializa y los `TREQ-*` que protege.

---

#### 19. Validación humana diferida

La sustitucion de evidencia aprobada en `UX-STATION-008` se conserva. Los pilotos posteriores deberán comprobar, como mínimo:

- identificación y cambio de trabajador;
- siguiente acción y prioridad;
- cantidades, unidades y presentaciones;
- escaneo y respaldo manual;
- mediciones obligatorias;
- pagos y resultados inciertos;
- entrega y aceptación;
- operación degradada;
- ergonomía en el puesto real;
- ausencia de dependencia de supervisión permanente.

Un hallazgo crítico podrá modificar la fila afectada sin invalidar automaticamente las demas filas que no compartan el mismo contrato o riesgo.

---

#### 20. Cobertura y consistencia

La matriz cubre exactamente `VPROC-0001` a `VPROC-0069` y no inventa `Centro de Distribucion` como sede física. Cada proceso tiene por lo menos una resolución; cada fila tiene estación o ausencia justificada, interacción, capacidad periferica, respaldo y estado.

`PROC-COVER-001` a `PROC-COVER-010` verificaran posteriormente que las pantallas y paquetes implementados no omitan ninguna fila aplicable.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-PROC-981` a `TREQ-PROC-1020` al Registro Canónico completo.

Todos quedan en `IDENTIFICADO`. Su implementación y evidencia pertenecen a `UX-ADMIN-*`, `PROC-SCREEN-*`, paquetes E5, BLOQUE T, pilotos y BLOQUE U.

---

#### 21. Criterios de aceptación

- [x] Se cubren exactamente los 69 procesos.
- [x] Cada paso o grupo equivalente tiene estación o ausencia justificada.
- [x] Se distinguen pasos operativos, administrativos y automaticos.
- [x] Se conservan los cinco arquetipos aprobados.
- [x] Las variantes usan overlays y no duplican procesos.
- [x] Cada fila tiene interacción principal, periférico por capacidad y respaldo.
- [x] Pagos, mediciones, ajustes, identidad y handoffs conservan tratamiento especifico.
- [x] No se usa impresion, escaneo o almacenamiento local como prueba automática del efecto empresarial.
- [x] No se requiere supervisión o soporte permanente.
- [x] Los pasos administrativos se entregan a `UX-ADMIN-001` a `UX-ADMIN-005`.
- [x] Los pasos automaticos conservan contratos y reconciliación.
- [x] La validación humana queda vinculada a pilotos posteriores.
- [x] Se incorporan `TREQ-PROC-981` a `TREQ-PROC-1020`.
- [x] No se implementa código, hardware, Supabase ni despliegue.
- [x] `UX-ADMIN-001` permanece no iniciada.

---

#### 22. Resultado y continuidad

```text
UX-STATION-008 APROBADA
UX-STATION-009 APROBADA — PASS_WITH_CARRYOVER
UX-ADMIN-001 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-ADMIN-001 — Inventariar tareas administrativas por dominio, frecuencia y complejidad
```


### ✅ UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima`

**Tarea anterior:** `UX-STATION-007 — Definir operación degradada, offline, contingencia y recuperación` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción` — NO INICIADA

**Validación posterior reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales`; `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-INTERACTION-GRAMMAR-001`;
- `UX-STATION-OPERATIONAL-LEXICON-001`;
- `UX-STATION-ACTION-HIERARCHY-CONTRACT-001`;
- `UX-STATION-STATUS-SIGNAL-CONTRACT-001`;
- `UX-STATION-FEEDBACK-CONFIRMATION-CONTRACT-001`;
- `UX-STATION-ERROR-RECOVERY-GRAMMAR-001`;
- `UX-STATION-ACCESSIBILITY-SENSORY-CONTRACT-001`;
- `UX-STATION-GRAMMAR-VALIDATION-MATRIX-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`

**Naturaleza:** contrato transversal de lenguaje, jerarquía, señales, controles, feedback y recuperación para superficies operativas; no diseño visual definitivo ni implementación de componentes

**Cambios en código, componentes, pantallas, navegación, traducciones productivas, aplicaciones, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Definir una gramática común para que cualquier trabajador pueda reconocer con rapidez:

1. dónde está;
2. quién está actuando;
3. qué trabajo tiene delante;
4. cuál es el estado real;
5. qué acción debe ejecutar ahora;
6. qué resultado producirá;
7. qué ocurrió después de actuar;
8. qué hacer cuando existe un bloqueo, error, duda o contingencia.

La gramática deberá disminuir lectura, memoria, capacitación técnica y decisiones irrelevantes sin ocultar información necesaria para operar con seguridad.

```text
LECTURA MÍNIMA
≠
INFORMACIÓN INCOMPLETA
```

```text
INTERFAZ SIMPLE
≠
PROCESO SIMPLIFICADO DE FORMA INSEGURA
```

```text
MISMA GRAMÁTICA
≠
MISMA PANTALLA PARA TODOS
```

---

#### 2. Restricción humana obligatoria

La interacción se diseñará para personas expertas en su oficio, pero que no necesariamente dominan conceptos tecnológicos, administrativos o de sistemas.

Por tanto:

- no se exigirá conocer nombres de servicios, tablas, colas, drivers, estados técnicos o códigos internos;
- no se dependerá de manuales extensos para ejecutar una acción frecuente;
- no se pedirá recordar secuencias que el sistema pueda guiar;
- no se presentarán simultáneamente decisiones que no correspondan al paso actual;
- no se utilizarán palabras técnicas cuando exista una expresión operacional precisa;
- la ayuda deberá aparecer en el punto de decisión, no únicamente en documentación externa;
- una acción crítica deberá poder explicarse con frases breves, ejemplos concretos y consecuencias visibles;
- el diseño deberá ser utilizable bajo presión, ruido, guantes, interrupciones y atención dividida cuando el perfil de estación lo exija.

La simplicidad no trasladará al trabajador validaciones, conciliaciones o decisiones que pertenecen al sistema, al supervisor o a un especialista.

---

#### 3. Unidad mínima de gramática

Cada interacción operativa se describirá mediante:

```text
CONTEXTO
+ OBJETO DE TRABAJO
+ ESTADO
+ INTENCIÓN
+ ACCIÓN
+ EFECTO ESPERADO
+ FEEDBACK
+ SIGUIENTE PASO
+ RECUPERACIÓN
```

No se diseñará un botón, mensaje, campo, ícono o gesto aislado sin conocer esa unidad.

Campos mínimos del contrato:

```text
grammar_rule_id
process_id
step_id
station_profile_id
surface_state
actor_requirement
work_object_type
work_object_reference
canonical_status
primary_intent
primary_action_label
secondary_actions[]
critical_information[]
confirmation_policy
feedback_policy
error_policy
recovery_action
help_entry
accessibility_modes[]
validation_questions[]
```

---

#### 4. Zonas semánticas de una superficie

La gramática reconoce estas zonas lógicas, aunque su posición visual definitiva se diseñe después:

| Zona                 | Contenido permitido                                                           | Regla                                                             |
| -------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| identidad y contexto | actor efectivo, estación, sede, área o zona relevante                         | visible cuando una confusión pueda afectar autoridad o atribución |
| objeto de trabajo    | pedido, lote, solicitud, mesa, recepción, pago, documento u otro recurso      | debe ser inequívoco antes de actuar                               |
| estado               | situación empresarial vigente y frescura                                      | no se sustituye por color o animación                             |
| siguiente acción     | acción primaria segura del paso                                               | debe destacar sobre acciones secundarias                          |
| información crítica  | cantidad, unidad, destino, vencimiento, restricciones o excepción             | solo la necesaria para decidir correctamente                      |
| acciones secundarias | consultar, pausar, corregir, escalar o abandonar según contrato               | no compiten visualmente con la acción primaria                    |
| feedback             | aceptación local, confirmación autoritativa, pendiente, falla o incertidumbre | debe distinguir intención enviada de efecto confirmado            |
| ayuda y recuperación | instrucción breve, alternativa, contacto o folio                              | aparece sin exigir abandonar el contexto                          |

`UX-STATION-011` organizará estas zonas dentro de la bandeja de trabajo y `UX-STATION-012` definirá su composición dinámica mediante componentes aprobados.

---

#### 5. Léxico operacional canónico

Cada concepto empresarial tendrá:

```text
canonical_term
plain_language_definition
approved_short_label
approved_long_label
allowed_synonyms_for_search
forbidden_ambiguous_terms[]
domain_owner
examples[]
```

Reglas:

1. La etiqueta visible utilizará el término canónico o una abreviación aprobada.
2. Los sinónimos podrán ayudar a buscar, pero no crearán múltiples nombres visibles para el mismo hecho.
3. Una misma palabra no representará estados diferentes dentro de una misma superficie.
4. Los términos físicos usados por los trabajadores podrán adoptarse cuando sean precisos y hayan sido validados.
5. Un término interno de software no se mostrará si el trabajador necesita entender un resultado empresarial.
6. La traducción o variante lingüística conservará la misma intención, efecto y nivel de riesgo.
7. Cambiar una palabra crítica exigirá análisis de impacto, actualización de ayudas y regresión.

Ejemplos de distinciones que deberán conservarse:

```text
SOLICITAR ≠ APROBAR ≠ EJECUTAR ≠ CONFIRMAR
RECIBIR ≠ CONTAR ≠ ACEPTAR ≠ CONCILIAR
GUARDAR BORRADOR ≠ REGISTRAR HECHO ≠ COMPLETAR PROCESO
CANCELAR ≠ CORREGIR ≠ REVERSAR ≠ ANULAR
ENVIADO ≠ RECIBIDO ≠ APLICADO ≠ CONCILIADO
```

---

#### 6. Forma de las acciones

La etiqueta ordinaria seguirá:

```text
VERBO CONCRETO
+ OBJETO
+ CALIFICADOR SOLO CUANDO EVITA AMBIGÜEDAD
```

Ejemplos válidos:

- `Registrar cantidad`;
- `Confirmar recepción`;
- `Enviar a producción`;
- `Imprimir etiqueta`;
- `Pausar preparación`;
- `Solicitar corrección`;
- `Entregar pedido`;
- `Reanudar conteo`.

Se evitarán como acción principal, salvo contexto demostrado:

- `OK`;
- `Sí`;
- `No`;
- `Listo`;
- `Aceptar` sin objeto;
- `Procesar`;
- `Gestionar`;
- `Continuar` cuando existan varios efectos posibles;
- `Guardar` cuando en realidad se publica, confirma o ejecuta;
- íconos sin etiqueta para acciones no universales o críticas.

La etiqueta describirá el efecto empresarial, no el evento técnico de interfaz.

---

#### 7. Jerarquía de acciones

Cada estado tendrá como máximo una acción primaria inequívoca.

| Clase                | Uso                                                              | Tratamiento                                          |
| -------------------- | ---------------------------------------------------------------- | ---------------------------------------------------- |
| `PRIMARY_NEXT`       | siguiente acción ordinaria segura                                | mayor prioridad visual y de foco                     |
| `REQUIRED_SECONDARY` | acción necesaria que no constituye avance principal              | visible sin competir con la primaria                 |
| `OPTIONAL_SUPPORT`   | consulta, ayuda o detalle                                        | disponible por divulgación progresiva                |
| `EXCEPTION`          | corrección, rechazo, pausa, sustitución o escalamiento           | separada del flujo ordinario                         |
| `DESTRUCTIVE`        | cancelación, anulación, descarte o reversión con pérdida posible | lenguaje explícito y protección proporcional         |
| `BLOCKED`            | acción conocida pero no permitida ahora                          | muestra causa y resolución; no simula disponibilidad |
| `SYSTEM_ONLY`        | efecto automático sin acción humana                              | no se representa como botón ejecutable               |

Reglas:

1. No se usarán dos acciones primarias con igual jerarquía.
2. Una acción frecuente no se ocultará detrás de menús genéricos.
3. Una excepción no se volverá dominante por ser técnicamente fácil de implementar.
4. Una acción no autorizada no aparecerá habilitada para fallar después.
5. La ausencia de permiso, contexto, capacidad o condición se explicará de forma accionable cuando sea seguro revelarla.
6. Las acciones masivas deberán mostrar alcance, selección, exclusiones y efecto antes de ejecutarse.

---

#### 8. Divulgación progresiva

La lectura mínima se logrará por capas:

1. **capa inmediata:** objeto, estado, dato crítico y siguiente acción;
2. **capa de verificación:** cantidades, unidad, destino, restricciones y evidencia necesaria;
3. **capa de excepción:** corrección, rechazo, conflicto, contingencia y escalamiento;
4. **capa de detalle:** historial, auditoría, diagnósticos permitidos y metadatos.

No se ocultará detrás de una capa secundaria aquello que pueda cambiar la decisión principal, el riesgo, la autorización o el efecto.

El trabajador no deberá recorrer varias pantallas para confirmar datos que caben razonablemente en la decisión actual.

---

#### 9. Gramática de estados

Los estados visibles se derivarán del proceso empresarial y no de nombres técnicos internos.

Conjunto transversal mínimo:

```text
NOT_STARTED
READY
IN_PROGRESS
WAITING
PENDING_CONFIRMATION
COMPLETED
BLOCKED
FAILED
RESULT_UNKNOWN
OFFLINE
CONFLICT
CANCELLED
EXPIRED
```

Cada dominio podrá especializarlos sin contradecir su significado transversal.

Todo estado declarará:

- nombre corto;
- explicación en lenguaje operativo;
- quién o qué debe actuar;
- antigüedad y frescura relevantes;
- acciones permitidas;
- condición de salida;
- tratamiento cuando se desconoce el resultado.

Estado y acción no utilizarán el mismo lenguaje de forma confusa. Por ejemplo, `Recibido` como estado no sustituye `Confirmar recepción` como acción.

---

#### 10. Señalización redundante y accesible

Ningún estado crítico dependerá exclusivamente de:

- color;
- posición;
- animación;
- sonido;
- vibración;
- forma;
- un ícono no etiquetado.

La señal combinará, según el contexto:

```text
TEXTO BREVE
+ FORMA O ÍCONO
+ JERARQUÍA
+ COLOR
+ SEÑAL SENSORIAL OPCIONAL
```

El sonido y la vibración podrán reforzar una confirmación o alerta, pero no serán el único canal porque puede existir ruido, discapacidad, volumen desactivado o dispositivo sin esa capacidad.

---

#### 11. Gramática de información crítica

Antes de una acción con efecto deberán ser visibles, cuando apliquen:

- objeto exacto;
- cantidad y unidad;
- origen y destino;
- sede, área o zona relevante;
- lote, presentación o variante;
- actor o responsable;
- fecha, hora, vigencia o antigüedad;
- restricción;
- efecto irreversible o externo;
- existencia de pendientes o conflictos.

Los números no se mostrarán sin unidad cuando la unidad pueda cambiar el significado.

Los valores predeterminados deberán ser seguros, visibles y reversibles antes de confirmar. Una selección heredada de otra operación no se conservará silenciosamente.

---

#### 12. Gramática de captura

La captura deberá:

1. solicitar únicamente información no derivable de forma segura;
2. utilizar el control adecuado para el dato y el entorno;
3. mostrar unidad, rango y formato antes del error;
4. preservar lo ingresado ante fallas recuperables;
5. distinguir cero, vacío, desconocido y no aplica;
6. evitar transcribir información ya disponible de una fuente confiable;
7. permitir corrección antes de producir el efecto;
8. confirmar lecturas automáticas cuando exista riesgo de asociación incorrecta.

Para escáner, cámara, báscula, sensor o periférico se mostrará:

```text
CAPTURANDO
LECTURA RECIBIDA
OBJETO INTERPRETADO
VALIDACIÓN
ACEPTADA / RECHAZADA / DUPLICADA / INCIERTA
```

Un sonido de escáner no probará por sí solo que el hecho empresarial fue registrado.

---

#### 13. Confirmaciones proporcionales al riesgo

No se confirmará cada acción rutinaria, porque la confirmación constante produce habituación y errores.

Política mínima:

| Tipo                               | Confirmación                                                                    |
| ---------------------------------- | ------------------------------------------------------------------------------- |
| reversible y de bajo riesgo        | ejecución directa con feedback y opción de corrección                           |
| reversible pero sensible           | revisión breve del efecto o undo controlado                                     |
| irreversible, externo o financiero | confirmación explícita con objeto, cantidad, destino y efecto                   |
| destructivo                        | verbo destructivo específico, consecuencia y protección contra toque accidental |
| resultado incierto                 | no se ofrece reintento ciego; se consulta estado o escala                       |
| doble control                      | identidad separada del aprobador y alcance exacto                               |

La pregunta genérica `¿Está seguro?` no será suficiente para una acción crítica.

---

#### 14. Prevención de doble ejecución

La gramática deberá impedir que latencia, doble toque, escaneo repetido o reanudación produzcan efectos duplicados.

La superficie distinguirá:

```text
INTENCIÓN CAPTURADA
SOLICITUD ENVIADA
ACEPTACIÓN TÉCNICA
EFECTO EMPRESARIAL CONFIRMADO
RESULTADO DESCONOCIDO
```

Mientras una intención siga activa:

- la acción no se volverá a habilitar sin regla;
- el trabajador verá que el sistema continúa trabajando;
- un timeout no se presentará automáticamente como fracaso;
- la reanudación conservará la referencia idempotente;
- un reintento requerirá conocer si es seguro.

---

#### 15. Feedback y cierre perceptible

Toda acción producirá feedback inmediato, pero deberá diferenciarse:

| Feedback                  | Significado                                   |
| ------------------------- | --------------------------------------------- |
| reconocimiento local      | el dispositivo capturó la intención           |
| pendiente remoto          | el efecto espera respuesta o sincronización   |
| confirmación autoritativa | la fuente de verdad aceptó el efecto          |
| confirmación física       | periférico o proceso físico reportó resultado |
| validación empresarial    | el proceso alcanzó el estado esperado         |
| resultado desconocido     | no puede afirmarse éxito o fracaso            |

El cierre mostrará qué cambió y cuál es el siguiente paso. No se utilizará una animación breve como única evidencia de éxito.

---

#### 16. Gramática de espera, latencia y frescura

La superficie distinguirá:

- cargando por primera vez;
- actualizando información existente;
- enviando una intención;
- esperando una dependencia;
- pendiente offline;
- reintentando de forma segura;
- resultado desconocido;
- información desactualizada.

Cuando la edad del dato importe, deberá mostrarse en lenguaje comprensible, por ejemplo:

```text
Actualizado hace 2 minutos
Pendiente de sincronizar
Datos vigentes hasta las 14:35
```

No se borrará información útil durante una actualización ni se sustituirá un estado conocido por un spinner indefinido.

---

#### 17. Gramática de errores y bloqueos

Un mensaje operativo deberá responder, según aplique:

```text
QUÉ OCURRIÓ
QUÉ NO OCURRIÓ
QUÉ SE CONSERVÓ
POR QUÉ IMPORTA
QUÉ PUEDE HACER AHORA
QUIÉN DEBE AYUDAR
REFERENCIA DEL CASO
```

Ejemplo estructural:

```text
No se confirmó la recepción.
La cantidad ingresada quedó guardada como borrador.
Revise la conexión y vuelva a intentar una sola vez.
Si continúa, reporte el folio RX-2048.
```

No serán aceptables como único mensaje:

- `Error`;
- `Algo salió mal`;
- `500`;
- `RPC failed`;
- `Network request failed`;
- `Invalid payload`;
- un código sin explicación y acción.

Los detalles técnicos se conservarán para diagnóstico autorizado, no como instrucción principal al trabajador.

---

#### 18. Vacío, cero resultados, filtro y falla

La interfaz diferenciará:

| Situación                        | Mensaje esperado                             |
| -------------------------------- | -------------------------------------------- |
| no existen elementos             | estado vacío legítimo y qué ocurrirá después |
| no existen resultados del filtro | filtro activo y opción para retirarlo        |
| aún no se cargaron datos         | estado de espera o carga                     |
| no se pudo consultar             | falla y acción segura                        |
| no existe autorización           | bloqueo sin exponer información innecesaria  |
| información incompleta           | faltante exacto y propietario de resolución  |

Una lista vacía no probará que no existe trabajo.

---

#### 19. Offline, degradación y contingencia

Los modos definidos en `UX-STATION-007` deberán utilizar la misma gramática central y añadir señales inequívocas de:

- modo activo;
- limitaciones;
- datos posiblemente desactualizados;
- acciones permitidas y prohibidas;
- pendientes locales;
- necesidad de folio o formulario;
- persona o canal de ayuda;
- condición de retorno.

El modo offline no imitará visualmente al modo normal cuando el efecto todavía no está confirmado.

---

#### 20. Interrupción y reanudación

Al reanudar después de bloqueo, cambio de aplicación, cambio de actor, pérdida de energía o suspensión, la superficie mostrará:

- proceso y paso;
- objeto de trabajo;
- actor propietario;
- cambios ya confirmados;
- datos en borrador;
- acciones pendientes;
- resultados desconocidos;
- siguiente acción segura.

No se asumirá que el último botón visible antes de la interrupción sigue siendo válido.

---

#### 21. Identidad, contexto y privacidad

La gramática deberá mostrar el actor efectivo y el contexto suficiente cuando una confusión pueda atribuir una acción a otra persona, sede, área, zona o recurso.

No mostrará por defecto:

- permisos internos completos;
- identificadores técnicos innecesarios;
- datos personales ajenos;
- secretos;
- información sensible no requerida para el paso.

En estaciones compartidas, el cambio de actor deberá limpiar etiquetas, datos, ayudas, búsquedas, selecciones y mensajes que no correspondan al nuevo contexto.

---

#### 22. Ergonomía física y lectura a distancia

La validación deberá considerar:

- distancia real de lectura;
- tamaño y densidad;
- contraste;
- iluminación y reflejo;
- movimiento;
- guantes;
- humedad o grasa;
- postura;
- mano dominante;
- precisión táctil;
- teclado o escáner;
- ruido;
- tiempo disponible para mirar la pantalla.

No se utilizarán objetivos táctiles pequeños, hover obligatorio, gestos ocultos o secuencias de precisión fina para acciones ordinarias de una estación operativa.

---

#### 23. Accesibilidad y modalidades alternativas

Toda gramática crítica deberá conservar significado con:

- navegación por teclado cuando el perfil la admita;
- lector de pantalla cuando corresponda;
- escalado de texto;
- alto contraste;
- reducción de movimiento;
- interacción táctil;
- escáner o captura automática;
- ayudas no dependientes de audio;
- lenguaje comprensible.

Los íconos familiares podrán reducir texto repetitivo, pero una acción crítica o poco frecuente conservará etiqueta o explicación accesible.

---

#### 24. Ayuda contextual y escalamiento

La ayuda se organizará en tres niveles:

1. **microayuda:** una frase junto al dato o acción;
2. **guía del paso:** pocas instrucciones, ejemplo y criterio de finalización;
3. **escalamiento:** canal, información que se enviará y folio.

La ayuda no obligará a abandonar el trabajo ni a repetir información que la estación ya conoce.

Cuando se escale, el sistema preparará contexto técnico seguro para soporte sin pedir al trabajador que interprete logs o copie secretos.

---

#### 25. Selección múltiple y acciones masivas

Antes de una acción sobre varios elementos se mostrará:

- cantidad seleccionada;
- alcance territorial y temporal;
- elementos excluidos y motivo;
- efecto común;
- excepciones;
- posibilidad de ejecución parcial;
- tratamiento del fallo intermedio;
- evidencia de resultados individuales.

La etiqueta `Seleccionar todo` declarará si cubre solo la página, el filtro o el conjunto completo autorizado.

---

#### 26. Consistencia transversal y especialización

La gramática transversal fijará:

- jerarquía de acciones;
- semántica de estados;
- anatomía de mensajes;
- feedback;
- confirmaciones;
- tratamiento de espera, error, offline e incertidumbre;
- señales accesibles.

Cada aplicación conservará su vocabulario empresarial y podrá especializar componentes, pero no cambiar silenciosamente el significado de una acción o estado transversal.

Una persona que cambie entre NEXO, FOGO, PULSO, ORIGO, VISO, ANIMA u otra superficie deberá reconocer el patrón sin aprender un sistema de señales completamente distinto.

---

#### 27. Fechas, cantidades, unidades y localización

La gramática deberá:

- usar formatos de fecha y hora comprensibles para el contexto;
- distinguir fecha empresarial, fecha de captura y fecha de sincronización;
- mostrar zona horaria cuando pueda existir ambigüedad;
- mantener separadores y decimales coherentes;
- mostrar moneda y unidad;
- conservar precisión requerida;
- impedir que una localización cambie el valor canónico;
- tratar texto largo, nombres, tildes, Unicode y truncamiento sin ocultar identidad crítica.

---

#### 28. Telemetría de fricción sin vigilancia invasiva

La validación futura podrá medir:

- errores de selección;
- retrocesos;
- cancelaciones;
- tiempo por paso;
- ayuda solicitada;
- reintentos;
- dobles toques;
- bloqueos;
- abandonos;
- recuperación;
- necesidad de asistencia.

No se recopilarán grabaciones, pulsaciones, datos personales o vigilancia individual innecesaria para medir usabilidad.

La telemetría indicará dónde simplificar el sistema, no servirá para culpar automáticamente al trabajador.

---

#### 29. Matriz obligatoria por proceso y paso

Para `VPROC-0001` a `VPROC-0069`, cada paso con interacción deberá declarar:

```text
process_id
step_id
station_profile_id
actor
work_object
canonical_term_set
surface_state
critical_information
primary_action
secondary_actions
status_signal
capture_grammar
confirmation_policy
feedback_policy
error_policy
offline_variant
resume_policy
help_policy
accessibility_requirements
validation_scenarios
```

Un paso sin interacción humana se marcará `SYSTEM_ONLY` y explicará qué estado o resultado deberá comunicar a las superficies consumidoras.

---

#### 30. Criterios para prototipo con trabajadores

`UX-STATION-008` deberá medir como mínimo:

- identificación correcta del objeto y estado;
- comprensión de la acción primaria;
- tiempo hasta la primera acción correcta;
- errores de interpretación;
- necesidad de leer ayuda;
- recuerdo después de una interrupción;
- distinción entre pendiente, completado, fallido y desconocido;
- capacidad de corregir;
- desempeño con ruido, guantes o movilidad aplicables;
- carga percibida;
- asistencia requerida;
- términos que los trabajadores no entienden.

No bastará preguntar si la pantalla “les gusta”.

---

#### 31. Responsabilidades posteriores

| Materia                             | Tarea propietaria                        |
| ----------------------------------- | ---------------------------------------- |
| bandeja y priorización del trabajo  | `UX-STATION-011`                         |
| composición dinámica de componentes | `UX-STATION-012`                         |
| prototipo con trabajadores          | `UX-STATION-008`                         |
| aprobación de matriz final          | `UX-STATION-009`                         |
| pantallas definitivas               | `PROC-SCREEN-001` a `PROC-SCREEN-028`    |
| cobertura integral de pantallas     | `PROC-COVER-001` a `PROC-COVER-010`      |
| implementación por paquetes         | BLOQUE E5                                |
| infraestructura de pruebas          | BLOQUE T                                 |
| capacitación y soporte              | `TI-DOM-013`; `TI-UX-006`; `E5-GATE-006` |

Esta tarea no crea un sistema de diseño visual completo ni sustituye las tareas posteriores.

---

#### 32. Reglas de rechazo

La gramática será rechazada para un paso cuando:

1. no pueda reconocerse el objeto o estado;
2. existan varias acciones primarias equivalentes;
3. una etiqueta no describa el efecto;
4. una acción crítica use `OK`, `Aceptar`, `Continuar` o un ícono ambiguo;
5. color, sonido o memoria sean el único canal;
6. un número carezca de unidad relevante;
7. una confirmación crítica no muestre efecto;
8. una acción rutinaria tenga confirmaciones innecesarias;
9. una espera permita doble ejecución;
10. un timeout se declare fracaso sin certeza;
11. una lista vacía o error sean indistinguibles;
12. offline parezca operación confirmada;
13. un cambio de actor conserve contexto ajeno;
14. la ayuda requiera conocimientos técnicos;
15. el flujo dependa de gestos ocultos o precisión incompatible con la estación;
16. no exista recuperación o escalamiento;
17. no pueda probarse con trabajadores reales;
18. el mismo término cambie de significado entre aplicaciones sin justificación.

---

#### Requisitos de prueba derivados

**Resultado:** GENERA 40 REQUISITOS DE PRUEBA.

Se incorporan al registro canónico:

`TREQ-PROC-821` a `TREQ-PROC-860`.

Los requisitos protegen:

- propósito de lectura mínima;
- unidad y zonas semánticas;
- léxico y etiquetas;
- jerarquía y divulgación progresiva;
- estados y señalización;
- datos, captura y periféricos;
- confirmación y prevención de duplicados;
- feedback, espera, error e incertidumbre;
- offline, reanudación, identidad y privacidad;
- ergonomía, accesibilidad y ayuda;
- selección masiva, localización y consistencia transversal;
- telemetría y validación con trabajadores;
- cobertura de los 69 procesos.

El detalle completo reside en `04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`.

---

#### 33. Criterios de aceptación

- [ ] La lectura mínima está definida como reducción de carga, no como ocultamiento de información crítica.
- [ ] La unidad mínima de gramática contiene contexto, objeto, estado, acción, efecto, feedback y recuperación.
- [ ] Existe léxico canónico con sinónimos y términos prohibidos.
- [ ] Las acciones usan verbo y objeto concretos.
- [ ] Cada estado admite una sola acción primaria.
- [ ] Estados, acciones y resultados no se confunden.
- [ ] La señalización no depende de un único canal sensorial.
- [ ] Cantidades, unidades, origen, destino y restricciones se muestran cuando afectan la decisión.
- [ ] Captura automática y periféricos distinguen lectura de registro empresarial.
- [ ] Confirmaciones y protecciones son proporcionales al riesgo.
- [ ] Latencia, timeout y doble toque no producen doble ejecución.
- [ ] Feedback local, remoto, físico y empresarial están diferenciados.
- [ ] Errores y bloqueos ofrecen una acción segura.
- [ ] Vacío, filtro, carga y falla son distinguibles.
- [ ] Offline y resultado desconocido no imitan éxito.
- [ ] Reanudación conserva actor, objeto, estado y pendientes.
- [ ] Privacidad y limpieza entre actores están definidas.
- [ ] Se cubren ergonomía física y accesibilidad.
- [ ] La ayuda es contextual y no exige formación técnica.
- [ ] Acciones masivas muestran alcance y resultados.
- [ ] La gramática transversal permite especialización sin cambiar semántica.
- [ ] Los 69 procesos tienen matriz por paso o justificación `SYSTEM_ONLY`.
- [ ] Los escenarios para `UX-STATION-008` miden comprensión y ejecución real.
- [ ] `UX-STATION-011` permanece sin iniciar.
- [ ] No se implementaron pantallas, componentes, código, traducciones, migraciones ni cambios en Supabase.

---

#### 34. Resultado y continuidad

```text
UX-STATION-007 APROBADA
UX-STATION-010 APROBADA
UX-STATION-011 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción
```

No se inicia `UX-STATION-011` hasta la aprobación expresa de esta tarea y una solicitud explícita de continuidad.


### ✅ UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción`

**Tarea anterior:** `UX-STATION-010 — Definir gramática de interacción operativa de lectura mínima` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados` — NO INICIADA

**Validación posterior reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales`; `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-CONTEXTUAL-WORK-TRAY-CONTRACT-001`;
- `UX-STATION-WORK-ITEM-SCHEMA-001`;
- `UX-STATION-NEXT-ACTION-RESOLUTION-CONTRACT-001`;
- `UX-STATION-PRIORITY-AND-ORDERING-POLICY-001`;
- `UX-STATION-ASSIGNMENT-CLAIM-HANDOFF-CONTRACT-001`;
- `UX-STATION-BLOCKER-ESCALATION-CONTRACT-001`;
- `UX-STATION-OFFLINE-WORK-TRAY-CONTRACT-001`;
- `UX-STATION-WORK-TRAY-VALIDATION-MATRIX-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`

**Naturaleza:** contrato transversal para presentar, ordenar, asignar, reclamar, ejecutar, bloquear, transferir, reanudar y cerrar trabajo operativo; no diseño visual definitivo ni implementación de colas

**Cambios en código, componentes, pantallas, navegación, algoritmos productivos, datos, migraciones, RLS, RPC, Supabase, dispositivos o dotación:** no autorizados

---

#### 1. Propósito

Diseñar una bandeja operativa que permita a cada trabajador reconocer, con la menor lectura y supervisión posibles:

1. qué trabajo puede ejecutar ahora;
2. cuál elemento requiere atención primero;
3. por qué aparece en la bandeja;
4. qué condición lo habilita o bloquea;
5. cuál es la siguiente acción segura;
6. qué resultado se espera;
7. quién conserva la responsabilidad;
8. qué ocurrió si el trabajo fue interrumpido, transferido o ejecutado offline.

La bandeja deberá convertir estados y dependencias complejos en una secuencia operativa comprensible, sin trasladar al trabajador decisiones de autorización, conciliación, priorización técnica o diagnóstico que pertenecen al sistema o a responsables especializados.

```text
BANDEJA DE TRABAJO
≠
TABLERO GERENCIAL
```

```text
NOTIFICACIÓN
≠
TRABAJO EJECUTABLE
```

```text
ELEMENTO VISIBLE
≠
ACCIÓN AUTORIZADA
```

```text
PRIORIDAD AUTOMÁTICA
≠
SUPERVISIÓN HUMANA PERMANENTE
```

---

#### 2. Restricción humana y operativa obligatoria

La solución se diseñará para una organización donde cada persona domina su oficio, pero no necesariamente conceptos de software, colas, sincronización, estados distribuidos o soporte técnico.

Por tanto:

- no se exigirá que un supervisor reparta manualmente cada unidad de trabajo;
- no se exigirá un coordinador observando continuamente todas las bandejas;
- no se necesitará un técnico por sede, área, turno o estación;
- el sistema resolverá automáticamente la mayoría de asignaciones, prioridades, bloqueos y siguientes acciones ordinarias;
- la supervisión se concentrará en excepciones, conflictos, vencimientos, riesgos y trabajo sin propietario;
- la bandeja explicará los bloqueos con lenguaje operativo y señalará el responsable o canal correcto;
- la persona no deberá conocer la aplicación propietaria, tabla, servicio o integración que originó el trabajo;
- una falla técnica no se transformará en una instrucción de diagnóstico avanzado para el trabajador;
- la capacitación ordinaria se basará en patrones repetibles, ejemplos y práctica breve;
- cualquier necesidad de dotación adicional deberá justificarse fuera de esta tarea mediante capacidad, riesgo, duración y costo verificables.

El diseño preferirá automatización, autoasignación gobernada, escalamiento por excepción y soporte centralizado antes que aumentar permanentemente la carga humana.

---

#### 3. Dependencias canónicas

Esta tarea consume y no reemplaza:

- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001` a `UX-STATION-007`;
- `UX-STATION-010`;
- `NFR-REQ-001` a `NFR-REQ-011`;
- el catálogo de procesos `VPROC-0001` a `VPROC-0069`;
- el modelo de actor efectivo, contexto, autorización, dispositivo compartido, idempotencia, auditoría y segregación ya aprobado;
- los contratos de operación degradada, offline, contingencia y recuperación;
- la regla de lectura mínima y una única acción primaria por estado.

Esta tarea no define todavía la biblioteca final de componentes. Esa composición corresponde a `UX-STATION-012`.

---

#### 4. Separación conceptual obligatoria

Se mantendrán separados:

| Concepto           | Significado                                   | No equivale a               |
| ------------------ | --------------------------------------------- | --------------------------- |
| evento empresarial | hecho ocurrido en un dominio                  | trabajo pendiente           |
| notificación       | comunicación sobre un hecho                   | orden de ejecución          |
| alerta             | condición que exige atención                  | unidad de trabajo ordinaria |
| mensaje            | comunicación entre actores o sistemas         | transición de proceso       |
| work item          | representación operativa de trabajo pendiente | registro fuente completo    |
| siguiente acción   | intención actualmente elegible                | autorización permanente     |
| asignación         | responsabilidad propuesta o vigente           | permiso                     |
| claim              | reserva temporal para ejecutar                | propiedad definitiva        |
| handoff            | transferencia trazable                        | reasignación silenciosa     |
| contador           | resumen de elementos visibles y frescos       | fuente de verdad            |
| estado leído       | reconocimiento visual                         | trabajo completado          |
| prioridad          | orden empresarial calculado                   | urgencia aislada            |

Una misma causa podrá producir evento, notificación y work item, pero cada artefacto conservará propósito, propietario y ciclo de vida distintos.

---

#### 5. Unidad mínima: `WorkItem`

Cada fila de la bandeja representará una unidad operativa explícita:

```text
WORK ITEM
+ OBJETO EMPRESARIAL
+ PROCESO Y PASO
+ ESTADO REAL
+ ACTOR O POOL ELEGIBLE
+ TERRITORIO
+ PRIORIDAD
+ SIGUIENTE ACCIÓN
+ BLOQUEOS
+ FRESCURA
+ TRAZABILIDAD
```

Contrato conceptual mínimo:

```text
work_item_id
work_item_version
source_domain
source_reference
process_id
process_version
step_id
business_object_type
business_object_id
business_object_label
current_business_state
surface_state
site_id
area_id
zone_id
station_profile_constraints[]
eligible_actor_scope
assigned_actor_id
assigned_pool_id
claim_status
claim_owner_id
claim_expires_at
priority_class
priority_score
priority_reasons[]
urgency_deadline
business_deadline
age_started_at
next_action_id
next_action_label
next_action_eligibility
next_action_effect
blocking_reasons[]
dependency_references[]
risk_flags[]
freshness_state
source_updated_at
last_reconciled_at
offline_state
pending_command_ids[]
handoff_reference
sensitive_display_policy
created_at
closed_at
```

La bandeja no copiará el expediente completo del objeto empresarial. Consumirá una proyección mínima, versionada y autorizada.

---

#### 6. Identidad estable y deduplicación

`work_item_id` identificará una obligación operativa concreta y no una tarjeta visual efímera.

Reglas:

1. la misma obligación no aparecerá duplicada por recarga, cambio de filtro, reintento o reconexión;
2. dos pasos distintos del mismo proceso podrán generar work items distintos cuando requieran actores, condiciones o acciones diferentes;
3. una actualización mantendrá historial de versión y no creará silenciosamente un elemento nuevo;
4. la bandeja deberá detectar duplicados semánticos producidos por integraciones o reintentos;
5. cerrar visualmente una tarjeta no eliminará el trabajo fuente;
6. un elemento reabierto conservará vínculo con su ciclo previo.

---

#### 7. Fuente autoritativa

El estado del work item se derivará de hechos y contratos del proceso propietario.

No serán fuente autoritativa:

- estado local de React;
- contador almacenado en el cliente;
- posición visual;
- tarjeta arrastrada;
- marca `read`;
- caché sin versión;
- notificación push;
- correo o mensaje;
- almacenamiento local sin reconciliación;
- selección de sede o área enviada por el cliente;
- nombre del rol;
- estación compartida por sí sola.

La bandeja podrá mantener proyecciones para rendimiento, pero deberá declarar origen, versión, frescura y mecanismo de reconstrucción.

---

#### 8. Resolución de la siguiente acción

La siguiente acción se resolverá como intersección de:

```text
ESTADO DEL PROCESO
∩ PRERREQUISITOS CUMPLIDOS
∩ ACTOR EFECTIVO
∩ AUTORIZACIÓN VIGENTE
∩ TERRITORIO DEL RECURSO
∩ ESTACIÓN Y CAPACIDADES
∩ MODALIDAD OPERATIVA
∩ CONECTIVIDAD Y FRESCURA
∩ REGLAS DE SEGREGACIÓN
```

La interfaz no inventará una acción porque exista un botón disponible.

El contrato de resolución devolverá como mínimo:

```text
next_action_id
eligibility = ELIGIBLE | BLOCKED | REQUIRES_STEP_UP | REQUIRES_HANDOFF | SYSTEM_ONLY
label
business_effect
required_confirmation
required_capabilities[]
blocking_reasons[]
recheck_triggers[]
expires_at
```

La autorización se reevaluará en el servidor al ejecutar; la elegibilidad mostrada no será un permiso durable.

---

#### 9. Una acción primaria

Cada estado de work item tendrá como máximo una acción `PRIMARY_NEXT`.

Podrán existir:

- acciones secundarias de consulta;
- corrección controlada;
- handoff;
- escalamiento;
- cancelación autorizada;
- acción excepcional con step-up;
- acciones automáticas del sistema.

No competirán visualmente con la siguiente acción ordinaria.

Cuando no exista una acción elegible, la bandeja mostrará el motivo y la condición de desbloqueo, no un botón inactivo sin explicación.

---

#### 10. Familias canónicas de bandeja

La bandeja podrá organizar trabajo en familias semánticas consistentes:

| Familia                   | Contenido                                                          |
| ------------------------- | ------------------------------------------------------------------ |
| `READY_NOW`               | trabajo ejecutable por el actor y estación actuales                |
| `IN_PROGRESS`             | trabajo ya iniciado y no concluido                                 |
| `PENDING_CONFIRMATION`    | efecto solicitado sin resultado empresarial confirmado             |
| `WAITING_DEPENDENCY`      | espera legítima de persona, insumo, tiempo, evento o sistema       |
| `BLOCKED_ACTION_REQUIRED` | bloqueo que requiere una intervención identificada                 |
| `HANDOFF_PENDING`         | transferencia emitida o por aceptar                                |
| `OFFLINE_LOCAL`           | trabajo capturado localmente pendiente de sincronización           |
| `CONFLICT_REVIEW`         | discrepancia que impide continuar automáticamente                  |
| `RESULT_UNKNOWN`          | efecto incierto que exige consulta o conciliación                  |
| `COMPLETED_RECENT`        | cierre reciente visible solo cuando ayude a confirmar el resultado |

No se crearán pestañas diferentes únicamente por estado técnico interno.

---

#### 11. Priorización empresarial

La prioridad no se basará únicamente en orden de llegada o fecha de creación.

Podrá considerar, según el proceso:

- seguridad de personas y alimentos;
- integridad financiera;
- cliente presente o esperando;
- perecibilidad;
- vencimiento empresarial;
- dependencia de otros pasos;
- impacto en producción, despacho o servicio;
- riesgo de inventario;
- compromiso externo;
- antigüedad;
- ventana de ejecución;
- capacidad disponible;
- severidad de un bloqueo;
- necesidad de segregación o aprobación.

Cada prioridad mostrará una explicación operacional breve y conservará razones auditables.

Un peso numérico interno no se mostrará al trabajador salvo que aporte valor real.

---

#### 12. Prioridad, urgencia y vencimiento

Se distinguirán:

```text
PRIORIDAD
→ qué debe atenderse primero

URGENCIA
→ cuánto tiempo existe para actuar

VENCIMIENTO
→ momento o condición después del cual cambia el riesgo o la elegibilidad
```

Un elemento urgente no desplazará automáticamente un trabajo crítico si el modelo empresarial determina lo contrario.

Los vencimientos deberán indicar zona horaria, fuente y consecuencia.

---

#### 13. Orden determinista y estable

La bandeja deberá conservar un orden explicable y estable.

Reglas:

- la recarga no reordenará arbitrariamente elementos equivalentes;
- los empates usarán criterios deterministas;
- un elemento no saltará continuamente por cambios mínimos de score;
- cambios materiales podrán reposicionarlo con señal discreta;
- el actor podrá entender por qué un elemento subió o bajó;
- no se permitirá manipular prioridad mediante una fecha enviada por el cliente;
- el orden respetará filtros autorizados sin cambiar el estado fuente.

---

#### 14. Frescura y datos desactualizados

Cada work item declarará:

- momento de actualización de la fuente;
- momento de última reconciliación;
- estado `FRESH`, `AGING`, `STALE`, `OFFLINE_SNAPSHOT` o `UNKNOWN`;
- acciones que siguen siendo seguras;
- acciones bloqueadas por falta de frescura;
- disparadores de actualización.

La bandeja no presentará una acción como disponible cuando la información necesaria esté vencida o no pueda verificarse.

---

#### 15. Contadores y resúmenes

Todo contador deberá corresponder al mismo alcance, autorización, filtro y frescura que la lista visible.

Se prohibirá:

- mostrar un número global que incluya elementos que el actor no puede consultar;
- mantener un badge desactualizado después de completar o transferir trabajo;
- contar notificaciones como work items;
- inferir `0` cuando falló la consulta;
- usar el contador como única prueba de existencia;
- exponer información sensible mediante cantidades agregadas no autorizadas.

---

#### 16. Bandeja personal y pool compartido

La solución distinguirá:

| Modalidad   | Regla                                                            |
| ----------- | ---------------------------------------------------------------- |
| personal    | responsabilidad asignada a un actor específico                   |
| pool        | trabajo disponible para un conjunto elegible                     |
| estación    | trabajo condicionado por capacidades o zona de una estación      |
| equipo      | trabajo compartido por una unidad operativa con reglas de claim  |
| supervisión | excepciones visibles por alcance, no trabajo ordinario duplicado |

Un elemento de pool no aparecerá como asignado a todos simultáneamente.

---

#### 17. Asignación, claim y lease

Cuando varios trabajadores puedan ejecutar el mismo elemento:

1. el sistema podrá autoasignar, permitir claim o mantener pool según el proceso;
2. el claim deberá ser atómico;
3. dos actores no podrán creer válidamente que poseen exclusividad simultánea;
4. el lease tendrá vencimiento y renovación gobernados;
5. perder conectividad no liberará de inmediato un trabajo con efectos pendientes;
6. una expiración no duplicará comandos ya enviados;
7. la liberación manual conservará razón y auditoría;
8. una reasignación forzada requerirá autoridad y manejo de borradores.

---

#### 18. Concurrencia y trabajo simultáneo

La bandeja deberá reconocer:

- otro actor trabajando;
- actor desconocido por desconexión;
- edición o ejecución incompatible;
- acciones compatibles en paralelo;
- bloqueo optimista o pesimista según riesgo;
- versión del objeto;
- conflicto al confirmar;
- resultado ya completado por otro actor.

La respuesta `ya fue realizado` deberá mostrar el resultado vigente y evitar repetir el efecto.

---

#### 19. Handoff y transferencia

El handoff definido en `UX-STATION-004` aparecerá como transición explícita:

```text
EMISOR
→ OBJETO Y ESTADO
→ RESPONSABILIDAD TRANSFERIDA
→ RECEPTOR O POOL
→ CONDICIONES PENDIENTES
→ ACEPTACIÓN O RECHAZO
→ RECEIPT
```

No se transferirá silenciosamente trabajo con borradores, comandos pendientes, resultados desconocidos o datos sensibles sin una política explícita.

El emisor deberá saber si el receptor aceptó, rechazó o dejó vencer el handoff.

---

#### 20. Cambio de actor en estación compartida

Al cambiar de trabajador:

- se retirará la bandeja personal anterior;
- se conservarán pendientes locales bajo su actor original;
- no se heredarán selecciones, filtros privados, borradores ni autorizaciones;
- los work items de pool se recalcularán para el nuevo actor;
- claims vigentes seguirán su política de lease y transferencia;
- el nuevo actor no podrá confirmar acciones iniciadas por otro sin regla de takeover;
- la pantalla no revelará trabajo sensible del actor anterior.

---

#### 21. Lectura, visto y completado

Los estados de comunicación y ejecución permanecerán separados:

```text
MOSTRADO
≠ LEÍDO
≠ RECONOCIDO
≠ ACEPTADO
≠ INICIADO
≠ COMPLETADO
≠ VALIDADO
```

Marcar como leído nunca cerrará un work item empresarial.

Ocultar una notificación tampoco cancelará el trabajo que la originó.

---

#### 22. Dependencias y bloqueos

Cada bloqueo declarará:

```text
blocking_reason_code
mensaje operativo
propietario de resolución
condición de desbloqueo
momento estimado, si existe
acción local segura
canal de escalamiento
referencia de dependencia
```

No se mostrará únicamente `Bloqueado`, `Error` o `No disponible`.

Los bloqueos automáticos se retirarán por hechos verificables, no por refrescar la página.

---

#### 23. Esperas legítimas

`WAITING_DEPENDENCY` distinguirá espera de:

- tiempo o ventana;
- insumo;
- producción;
- transporte;
- cliente;
- aprobación;
- validación;
- integración;
- periférico;
- sincronización;
- proveedor externo.

La espera no consumirá atención constante. La bandeja notificará cuando cambie la condición o se supere un umbral.

---

#### 24. Supervisión por excepción

La vista de supervisión se limitará a:

- trabajo sin propietario;
- vencido o próximo a vencer;
- bloqueos prolongados;
- riesgo alto;
- conflictos;
- fallos repetidos;
- resultados desconocidos;
- sobrecarga de un pool;
- handoffs rechazados o vencidos;
- desviaciones de capacidad.

No duplicará toda la bandeja ordinaria de cada trabajador.

El diseño deberá permitir que una sola persona coordine varias áreas cuando el volumen y el riesgo lo permitan, sin obligarla a asignar manualmente cada actividad.

---

#### 25. Escalamiento mínimo y dirigido

El escalamiento deberá:

1. identificar el tipo de ayuda;
2. sugerir el canal correcto;
3. adjuntar contexto seguro ya conocido;
4. evitar pedir logs, secretos o códigos técnicos al trabajador;
5. generar folio cuando corresponda;
6. indicar qué puede seguir haciendo mientras espera;
7. notificar la resolución;
8. cerrar o reactivar el work item de forma trazable.

Una misma persona podrá asumir coordinación y soporte básico si está capacitada, pero el sistema no dependerá de esa coincidencia para funcionar.

---

#### 26. Capacidad y límites de trabajo en curso

La bandeja deberá identificar sobrecarga sin convertirla automáticamente en una exigencia de más personal.

Podrá aplicar:

- límite de work in progress;
- tamaño de lote;
- reserva de capacidad;
- redistribución entre pools compatibles;
- secuenciación por estación;
- pausa de trabajo no prioritario;
- agrupación de acciones repetitivas;
- escalamiento de capacidad.

Una recomendación de dotación requerirá evidencia de volumen, tiempos, variabilidad, riesgo y alternativas de automatización o rediseño.

---

#### 27. Búsqueda, filtros y vistas

Los filtros servirán para localizar trabajo, no para cambiar autoridad o estado.

Deberán:

- mostrar claramente que están activos;
- permitir volver al alcance operativo recomendado;
- conservar criterios autorizados;
- distinguir `sin resultados` de `sin trabajo`;
- funcionar con paginación o virtualización;
- mantener orden estable;
- no ocultar silenciosamente elementos críticos;
- admitir búsqueda por referencias humanas permitidas;
- no depender de identificadores técnicos memorizados.

---

#### 28. Offline y trabajo local

En modo offline la bandeja distinguirá:

- snapshot disponible;
- work items habilitados offline;
- acciones prohibidas;
- nuevos registros locales;
- comandos pendientes;
- resultado local no confirmado;
- posibles conflictos;
- actor y estación originales;
- momento de última sincronización;
- condición para volver al modo normal.

No mezclará trabajo remoto confirmado con trabajo local pendiente sin señal inequívoca.

---

#### 29. Reconciliación y retorno

Al reconectar:

1. se actualizará la fuente antes de proponer acciones incompatibles;
2. se consultará el resultado de comandos inciertos;
3. se deduplicarán intenciones mediante idempotencia;
4. se detectarán cambios realizados por otros actores;
5. se conservarán datos locales hasta confirmar su incorporación o rechazo;
6. los conflictos se dirigirán a una revisión concreta;
7. la bandeja explicará qué quedó completado, pendiente, rechazado o duplicado;
8. no se borrará evidencia por el solo hecho de sincronizar.

---

#### 30. Resultado desconocido

Un work item con `RESULT_UNKNOWN`:

- no ofrecerá repetición ciega de la acción;
- mostrará que el efecto puede haber ocurrido;
- permitirá consultar, reconciliar o escalar;
- conservará idempotency key, actor, contexto, dispositivo y tiempo;
- bloqueará acciones incompatibles;
- saldrá del estado solo por evidencia suficiente.

---

#### 31. Interrupción y reanudación

Al reanudar se mostrará:

- objeto;
- paso;
- actor propietario;
- última acción confirmada;
- borradores;
- comandos pendientes;
- bloqueo o dependencia;
- versión vigente;
- siguiente acción recalculada.

No se restaurará automáticamente una acción destructiva o confirmación vencida.

---

#### 32. Acciones masivas

Una acción masiva deberá declarar:

- conjunto exacto;
- filtro y alcance;
- elementos no elegibles;
- resultado esperado;
- atomicidad o parcialidad;
- orden de ejecución;
- tratamiento de fallos;
- posibilidad de cancelación;
- evidencia por elemento;
- reconciliación.

No se habilitará una acción masiva solo porque los elementos compartan una etiqueta visual.

---

#### 33. Privacidad y minimización

La bandeja mostrará únicamente datos requeridos para identificar y ejecutar el trabajo.

Aplicará:

- masking contextual;
- revelado progresivo autorizado;
- limpieza al cambiar de actor;
- protección de contadores sensibles;
- separación entre datos operativos y personales;
- restricción de vistas de supervisión;
- retención mínima de proyecciones locales;
- ausencia de información sensible en títulos de notificación cuando no sea necesaria.

---

#### 34. Accesibilidad y lectura mínima

La bandeja deberá ser operable mediante las modalidades aprobadas para la estación y conservar:

- una acción primaria reconocible;
- orden lógico de foco;
- objetivos táctiles adecuados;
- señales no dependientes solo de color;
- etiquetas accesibles;
- densidad adaptable;
- lectura a distancia cuando aplique;
- soporte para teclado, lector de pantalla o escáner según perfil;
- mensajes breves con detalle disponible;
- estabilidad visual durante actualizaciones.

La simplificación no ocultará prioridades, riesgos, unidades, cantidades o consecuencias.

---

#### 35. Telemetría sin vigilancia invasiva

La mejora de la bandeja podrá medir de forma agregada:

- tiempo hasta la primera acción correcta;
- elementos ignorados por orden incorrecto;
- claims fallidos;
- conflictos;
- bloqueos;
- escalamiento;
- ayuda solicitada;
- reintentos;
- abandonos;
- cambios de prioridad;
- carga por pool;
- resultados desconocidos;
- recuperación offline.

No se utilizará para clasificar automáticamente a trabajadores, vigilar cada movimiento o inferir desempeño individual sin finalidad y gobierno explícitos.

---

#### 36. Estados vacíos, fallas y ausencia de trabajo

La bandeja diferenciará:

| Estado             | Significado                                      |
| ------------------ | ------------------------------------------------ |
| `EMPTY_CONFIRMED`  | no existe trabajo en el alcance consultado       |
| `FILTER_EMPTY`     | el filtro actual no encuentra resultados         |
| `LOADING`          | todavía no existe resultado                      |
| `STALE`            | existe snapshot, pero puede estar desactualizado |
| `QUERY_FAILED`     | no pudo confirmarse la lista                     |
| `UNAUTHORIZED`     | el actor no puede consultar ese alcance          |
| `CONTEXT_REQUIRED` | falta actor, sede, área, zona o estación válida  |

Una falla de consulta nunca se mostrará como bandeja vacía.

---

#### 37. Ayuda contextual

Cada work item podrá ofrecer:

1. explicación breve de por qué está aquí;
2. criterio de finalización;
3. dato o ejemplo necesario;
4. causa de bloqueo;
5. procedimiento de contingencia aplicable;
6. canal de escalamiento.

La ayuda no obligará a abandonar la bandeja ni a navegar por documentación extensa para una acción frecuente.

---

#### 38. Pruebas con trabajadores reales

`UX-STATION-008` deberá comprobar, como mínimo:

- reconocimiento del trabajo prioritario;
- comprensión de por qué está primero;
- selección de la siguiente acción correcta;
- distinción entre personal, pool y supervisión;
- claim y liberación;
- handoff;
- bloqueo y escalamiento;
- interrupción y reanudación;
- offline y reconciliación;
- resultado desconocido;
- búsqueda y filtros;
- carga cognitiva;
- necesidad de ayuda;
- cantidad de supervisión real requerida.

No bastará validar estética o preferencia.

---

#### 39. Matriz obligatoria por proceso y paso

Para `VPROC-0001` a `VPROC-0069`, cada paso deberá declarar:

```text
process_id
process_version
step_id
work_item_required
work_item_identity_rule
source_domain
business_object
eligible_actor_scope
assignment_mode
pool_id
claim_policy
handoff_policy
priority_class
priority_reasons
urgency_deadline
ordering_tiebreaker
next_action_rule
blocking_reasons
waiting_conditions
station_constraints
capability_constraints
freshness_policy
offline_policy
reconciliation_policy
sensitive_display_policy
help_policy
supervision_exception
validation_scenarios
```

Un paso que no deba aparecer en bandeja se marcará `NO_WORK_ITEM` y justificará cómo se comunica su resultado o excepción.

---

#### 40. Responsabilidades posteriores

| Materia                                                   | Tarea propietaria                        |
| --------------------------------------------------------- | ---------------------------------------- |
| componentes operativos y composición dinámica             | `UX-STATION-012`                         |
| prototipo con trabajadores                                | `UX-STATION-008`                         |
| matriz final proceso-paso-estación-interacción-periférico | `UX-STATION-009`                         |
| pantallas operativas definitivas                          | `PROC-SCREEN-001` a `PROC-SCREEN-028`    |
| cobertura de pantallas                                    | `PROC-COVER-001` a `PROC-COVER-010`      |
| algoritmos, colas y persistencia                          | paquetes de implementación de BLOQUE E5  |
| pruebas y regresión                                       | BLOQUE T y BLOQUE U                      |
| capacitación y soporte                                    | `TI-DOM-013`; `TI-UX-006`; `E5-GATE-006` |
| continuidad permanente                                    | BLOQUE AC                                |

Esta tarea no autoriza crear colas, cron jobs, tablas, workers, componentes, dashboards ni algoritmos productivos.

---

#### 41. Reglas de rechazo

La bandeja será rechazada si:

1. exige asignación manual ordinaria para funcionar;
2. depende de supervisión humana permanente;
3. mezcla notificaciones con trabajo ejecutable;
4. muestra acciones no autorizadas como elegibles;
5. oculta la razón de prioridad o bloqueo;
6. duplica trabajo por recarga, claim o sincronización;
7. permite dos claims exclusivos simultáneos;
8. confunde leído con completado;
9. muestra `0` cuando falló la consulta;
10. reintenta resultados desconocidos sin consulta;
11. hereda trabajo sensible al cambiar de actor;
12. exige conocimientos técnicos para escalar;
13. usa métricas para vigilancia invasiva;
14. no posee modalidad offline o contingencia donde sea necesaria;
15. no cubre los 69 procesos.

---

#### Requisitos de prueba derivados

Esta tarea genera los requisitos:

- `TREQ-PROC-861` a `TREQ-PROC-900`.

---

#### 42. Criterios de aceptación

- [ ] Se distingue work item, evento, notificación, alerta, mensaje y siguiente acción.
- [ ] Existe contrato mínimo versionable de `WorkItem`.
- [ ] La siguiente acción se resuelve por estado, actor, autorización, territorio, estación, capacidades, frescura y segregación.
- [ ] Cada estado posee como máximo una acción primaria.
- [ ] Prioridad, urgencia y vencimiento se mantienen separados.
- [ ] El orden es determinista, explicable y estable.
- [ ] Contadores y listas comparten alcance, autorización y frescura.
- [ ] Se definen bandeja personal, pool, estación, equipo y supervisión.
- [ ] Claim, lease, concurrencia, handoff y takeover están gobernados.
- [ ] El cambio de actor no filtra trabajo, datos o autorización del anterior.
- [ ] Leído no equivale a completado.
- [ ] Bloqueos, esperas y escalamiento tienen propietario y condición de cierre.
- [ ] La supervisión se concentra en excepciones.
- [ ] No se requiere técnico ni coordinador permanente por sede o estación.
- [ ] La capacidad se trata antes de recomendar aumento de dotación.
- [ ] Offline, reconciliación y resultado desconocido están definidos.
- [ ] Se protege privacidad y se evita vigilancia invasiva.
- [ ] Se definen pruebas con trabajadores reales.
- [ ] Los 69 procesos tienen matriz o justificación `NO_WORK_ITEM`.
- [ ] `UX-STATION-012` permanece sin iniciar.
- [ ] No se implementó código, datos, infraestructura ni cambios físicos.

---

#### 43. Resultado y continuidad

```text
UX-STATION-010 APROBADA
UX-STATION-011 APROBADA
UX-STATION-012 NO INICIADA
UX-STATION-008 NO INICIADA
UX-STATION-009 NO INICIADA
```

`UX-STATION-011` define el contrato documental de bandeja y siguiente acción. No demuestra todavía que el diseño funcione con trabajadores reales ni aprueba la matriz final.

La siguiente tarea canónica es:

```text
UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados
```


### ✅ UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] UX-STATION-012 — Definir composición dinámica de pasos mediante componentes operativos aprobados`

**Tarea anterior:** `UX-STATION-011 — Diseñar bandeja contextual de trabajo y siguiente acción` — APROBADA

**Siguiente tarea reservada:** `UX-STATION-008 — Prototipar alternativas con trabajadores reales` — NO INICIADA

**Aprobación posterior reservada:** `UX-STATION-009 — Aprobar la matriz proceso → paso → estación → interacción → periférico`

**Artefactos producidos:**

- `UX-STATION-OPERATIONAL-COMPONENT-CATALOG-001`;
- `UX-STATION-DYNAMIC-COMPOSITION-MANIFEST-001`;
- `UX-STATION-COMPONENT-STATE-CONTRACT-001`;
- `UX-STATION-COMPONENT-DATA-AND-COMMAND-CONTRACT-001`;
- `UX-STATION-COMPONENT-COMPATIBILITY-MATRIX-001`;
- `UX-STATION-COMPONENT-LIFECYCLE-AND-VERSIONING-001`;
- `UX-STATION-COMPONENT-FALLBACK-CONTRACT-001`;
- `UX-STATION-COMPONENT-VALIDATION-MATRIX-001`.

**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`, por paso con interacción humana o superficie operativa

**Naturaleza:** contrato semántico, declarativo y versionado para componer superficies operativas a partir de componentes permitidos; no biblioteca implementada, constructor visual, pantalla definitiva ni motor productivo

**Cambios en código, componentes ejecutables, aplicaciones, rutas, esquemas remotos, tablas, migraciones, RLS, RPC, Supabase, hardware o despliegues:** no autorizados

---

#### 1. Propósito

Definir cómo cada paso operativo podrá materializarse mediante una composición controlada de componentes semánticos, reutilizables y versionados, sin construir una pantalla distinta y artesanal para cada combinación de proceso, sede, actor, estación o estado.

La composición deberá permitir que el trabajador encuentre una experiencia estable, predecible y de lectura mínima, mientras el sistema adapta lo necesario según:

1. proceso y versión;
2. paso y estado empresarial;
3. work item y objeto afectado;
4. actor efectivo y autorización vigente;
5. sede, área, zona y estación;
6. modalidad de interacción;
7. capacidades y periféricos disponibles;
8. conectividad, sincronización y contingencia;
9. privacidad, accesibilidad y riesgo;
10. resultado de la acción anterior.

```text
COMPOSICIÓN DINÁMICA
≠
PANTALLA ARBITRARIA GENERADA DESDE DATOS
```

```text
COMPONENTE VISIBLE
≠
ACCIÓN AUTORIZADA
```

```text
REUTILIZACIÓN
≠
UNIFORMIDAD CIEGA ENTRE PROCESOS DIFERENTES
```

---

#### 2. Resultado documental aprobado

Esta tarea aprueba el **contrato semántico** de los componentes y de su composición.

No aprueba todavía:

- una implementación React, React Native o nativa;
- un paquete de diseño productivo;
- una pantalla concreta;
- una configuración remota de producción;
- una versión visual final;
- la idoneidad con trabajadores reales;
- la matriz final proceso-paso-estación-interacción-periférico.

Los contratos definidos aquí quedan `CONTRACT_APPROVED`. Sus implementaciones futuras deberán pasar prototipo, pruebas, paquete, release y evidencia antes de utilizarse en producción.

---

#### 3. Dependencias canónicas

Esta tarea consume y no reemplaza:

- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001` a `UX-STATION-007`;
- `UX-STATION-010` y su gramática de lectura mínima;
- `UX-STATION-011` y su contrato de bandeja, work item y siguiente acción;
- `NFR-REQ-001` a `NFR-REQ-011`;
- el catálogo de procesos `VPROC-0001` a `VPROC-0069`;
- identidad, contexto, autorización, segregación, idempotencia, auditoría, privacidad, offline y recuperación ya aprobados.

`UX-STATION-008` validará los prototipos con trabajadores reales. `UX-STATION-009` aprobará la matriz final. `PROC-SCREEN-001` a `PROC-SCREEN-028` diseñarán las pantallas definitivas después de esas decisiones.

---

#### 4. Separación conceptual obligatoria

| Concepto                     | Significado                                                      | No equivale a                |
| ---------------------------- | ---------------------------------------------------------------- | ---------------------------- |
| componente semántico         | unidad con propósito, entradas, estados, salidas y restricciones | archivo de código específico |
| implementación de componente | realización técnica para una plataforma                          | contrato canónico            |
| instancia de componente      | uso concreto dentro de un paso                                   | componente nuevo             |
| manifiesto de composición    | declaración versionada de componentes y relaciones               | lógica empresarial libre     |
| regla de visibilidad         | condición para presentar información                             | autorización                 |
| regla de habilitación        | condición de experiencia previa al comando                       | decisión final de servidor   |
| comando                      | intención empresarial identificada                               | evento visual                |
| estado visual                | representación del estado real                                   | fuente de verdad             |
| slot                         | zona semántica de la superficie                                  | posición absoluta o pixel    |
| variante                     | adaptación permitida del mismo contrato                          | semántica diferente          |
| plantilla                    | composición reusable                                             | pantalla universal           |

---

#### 5. Principio de biblioteca cerrada

La superficie solo podrá utilizar componentes cuyo identificador y versión existan en el catálogo canónico.

Se prohíbe:

- cargar componentes ejecutables desde una base de datos;
- ejecutar JavaScript, expresiones, plantillas o fórmulas arbitrarias recibidas del servidor;
- interpretar HTML no confiable como control operativo;
- permitir que un administrador cree comandos nuevos mediante un constructor visual;
- usar nombres de componentes libres sin esquema;
- introducir una variante que cambie silenciosamente el efecto empresarial;
- importar un componente remoto sin paquete, firma, versión y release aprobados.

La configuración podrá seleccionar y parametrizar contratos permitidos, pero no crear comportamiento ejecutable nuevo.

---

#### 6. Catálogo semántico inicial

El catálogo documental inicial incluirá, como mínimo:

| ID semántico         | Componente                | Responsabilidad                                    |
| -------------------- | ------------------------- | -------------------------------------------------- |
| `OPC-CONTEXT-001`    | contexto persistente      | actor, sede, área, zona, estación y modo           |
| `OPC-ACTOR-001`      | identidad del actor       | mostrar actor efectivo y cambio seguro             |
| `OPC-CONNECTION-001` | conexión y sincronización | estado online, degradado, offline y pendientes     |
| `OPC-WORK-001`       | identidad del trabajo     | work item, objeto, proceso y paso                  |
| `OPC-STATE-001`      | estado empresarial        | estado real, frescura y significado                |
| `OPC-RISK-001`       | riesgo o bloqueo          | advertencia, causa, responsable y resolución       |
| `OPC-ACTION-001`     | acción primaria           | siguiente intención segura y efecto                |
| `OPC-ACTION-002`     | acciones secundarias      | consultar, pausar, corregir, escalar o salir       |
| `OPC-TEXT-001`       | captura textual breve     | dato libre permitido y validado                    |
| `OPC-QUANTITY-001`   | cantidad y unidad         | valor, unidad, rango, precisión y conversión       |
| `OPC-SELECTION-001`  | selección simple          | elegir una opción versionada                       |
| `OPC-SELECTION-002`  | selección múltiple        | elegir conjunto con límites y significado          |
| `OPC-SCAN-001`       | captura por escáner       | interpretar identificador y confirmar objeto       |
| `OPC-CAMERA-001`     | captura por cámara        | evidencia o lectura autorizada                     |
| `OPC-MEASURE-001`    | medición periférica       | obtener valor, unidad, origen y estabilidad        |
| `OPC-CHECKLIST-001`  | lista operativa           | confirmar condiciones sin simular resultado        |
| `OPC-REASON-001`     | motivo estructurado       | registrar excepción, corrección o rechazo          |
| `OPC-CONFIRM-001`    | confirmación reforzada    | consecuencia, objeto, alcance y actor              |
| `OPC-HANDOFF-001`    | transferencia             | origen, destino, pendientes y aceptación           |
| `OPC-OFFLINE-001`    | pendiente local           | estado, autoría, sincronización y conflicto        |
| `OPC-PERIPHERAL-001` | capacidad física          | disponibilidad, reserva, salud y alternativa       |
| `OPC-RECEIPT-001`    | resultado y recibo        | resultado empresarial, referencia y siguiente paso |
| `OPC-HELP-001`       | ayuda y escalamiento      | instrucción breve, canal y contexto                |
| `OPC-PRIVACY-001`    | protección visual         | ocultamiento, revelado y limpieza                  |

La existencia de este catálogo no obliga a mostrar todos los componentes en todos los pasos.

---

#### 7. Contrato mínimo de un componente

Cada componente semántico deberá declarar:

```text
component_id
component_version
semantic_name
purpose
allowed_slots[]
input_schema
output_schema
supported_surface_states[]
supported_station_profiles[]
supported_modalities[]
required_capabilities[]
optional_capabilities[]
validation_contract
command_contract
privacy_policy
accessibility_contract
offline_contract
fallback_contract
actor_change_policy
focus_policy
telemetry_contract
error_contract
compatibility_range
deprecation_state
test_references[]
approval_references[]
```

Un campo sin contrato no podrá recibir semántica implícita desde una pantalla concreta.

---

#### 8. Manifiesto de composición

Cada paso con superficie componible declarará un manifiesto versionado:

```text
composition_manifest_id
composition_manifest_version
status
process_id
process_version
step_id
step_version
work_item_contract_version
surface_contract_version
supported_station_profiles[]
supported_modalities[]
required_context[]
component_instances[]
primary_action_instance_id
secondary_action_instance_ids[]
capability_requirements[]
privacy_policy
accessibility_policy
offline_policy
fallback_policy
state_mapping
telemetry_policy
validation_scenarios[]
approval_references[]
```

El manifiesto será declarativo. No contendrá código, consultas SQL, secretos, permisos escritos manualmente ni fórmulas ejecutables arbitrarias.

---

#### 9. Instancia de componente

Cada entrada de `component_instances[]` declarará:

```text
instance_id
component_id
component_version
slot
semantic_order
cardinality
input_binding
output_binding
visibility_predicate
experience_enablement_predicate
required
sensitive
reset_policy
retain_policy
fallback_instance_id
dependency_instance_ids[]
```

`input_binding` y `output_binding` usarán contratos conocidos. No podrán apuntar a cualquier propiedad interna del sistema ni escribir directamente en tablas.

---

#### 10. Slots semánticos

La superficie utilizará un orden conceptual estable:

1. `PERSISTENT_CONTEXT` — actor, lugar, estación, conectividad y modo;
2. `BLOCKING_STATE` — riesgos, bloqueos y condiciones de detención;
3. `WORK_IDENTITY` — objeto, proceso, paso y estado;
4. `STEP_CONTENT` — datos, captura, verificación o evidencia necesaria;
5. `PRIMARY_ACTION` — una sola acción primaria;
6. `SECONDARY_SUPPORT` — corrección, pausa, ayuda o escalamiento;
7. `RESULT_AND_RECEIPT` — resultado, referencia y siguiente paso.

La adaptación visual podrá reorganizar espacio, pero no alterar silenciosamente este orden semántico ni esconder contexto crítico.

---

#### 11. Resolución determinista de la composición

La composición resultará de:

```text
PROCESO Y PASO VERSIONADOS
+ ESTADO EMPRESARIAL
+ WORK ITEM Y OBJETO
+ ACTOR Y AUTORIZACIÓN
+ TERRITORIO
+ PERFIL DE ESTACIÓN
+ MODALIDAD
+ CAPACIDADES DISPONIBLES
+ CONECTIVIDAD Y FRESCURA
+ PRIVACIDAD Y ACCESIBILIDAD
= MANIFIESTO RESUELTO
```

Con las mismas entradas autoritativas y versiones deberá producirse la misma composición semántica.

El cliente no podrá elegir una composición más permisiva enviando otro perfil, paso, estado, sede o capacidad.

---

#### 12. Estados de la composición

| Estado           | Significado                                     | Mutaciones ordinarias      |
| ---------------- | ----------------------------------------------- | -------------------------- |
| `UNRESOLVED`     | faltan entradas autoritativas                   | No                         |
| `RESOLVING`      | se valida manifiesto, contexto y compatibilidad | No                         |
| `READY`          | composición completa y acción elegible          | Sí, con autorización       |
| `BLOCKED`        | existe condición empresarial o de seguridad     | No                         |
| `DEGRADED`       | falta capacidad no fatal o existe alternativa   | Según contrato             |
| `OFFLINE_READY`  | operación local autorizada y acotada            | Según contrato             |
| `PENDING_SYNC`   | existe comando local pendiente                  | No duplicar                |
| `RESULT_UNKNOWN` | no se conoce el efecto final                    | Consultar antes de repetir |
| `CONFLICT`       | estado local y autoritativo divergen            | No hasta resolver          |
| `RECOVERY`       | se reconstruye después de falla o cambio        | No hasta validar           |
| `CLOSED`         | paso o actor cerrados y superficie limpia       | No                         |

Cada componente recibirá el estado de superficie aplicable y no inventará uno incompatible.

---

#### 13. Una sola acción primaria

La composición contendrá como máximo una instancia en `PRIMARY_ACTION`.

Reglas:

1. la acción primaria corresponderá a la siguiente acción elegible de `UX-STATION-011`;
2. no se derivará de la posición visual ni del componente enfocado;
3. las acciones secundarias no competirán en jerarquía;
4. una acción sensible requerirá confirmación o step-up cuando corresponda;
5. un componente de captura no completará el proceso por sí solo;
6. una tecla, escaneo o evento automático no evitará las validaciones.

---

#### 14. Autoridad y comandos

Los componentes no poseen autoridad empresarial.

Toda salida mutable deberá emitir una intención conocida:

```text
command_id
command_contract_version
business_object_reference
expected_object_version
actor_context_reference
station_context_reference
idempotency_key
payload
client_observed_at
```

El servidor volverá a resolver identidad, autorización, territorio, estado, prerrequisitos, segregación y concurrencia antes de aceptar el comando.

Ningún `visibility_predicate` o `experience_enablement_predicate` sustituirá esta decisión.

---

#### 15. Validación de datos

La validación se distribuirá así:

| Nivel      | Responsabilidad                                          |
| ---------- | -------------------------------------------------------- |
| componente | formato, presencia y ayuda inmediata                     |
| manifiesto | dependencia, cardinalidad y coherencia entre componentes |
| proceso    | regla empresarial y transición permitida                 |
| servidor   | autoridad, integridad, concurrencia y persistencia       |
| periférico | calidad, estabilidad y procedencia de la lectura         |

Una validación del cliente nunca será la única protección de una regla empresarial.

---

#### 16. Cantidades, unidades y presentaciones

`OPC-QUANTITY-001` deberá conservar separados:

- valor observado;
- unidad de captura;
- unidad empresarial;
- presentación seleccionada;
- factor de conversión versionado;
- precisión y tolerancia;
- origen manual o periférico;
- cantidad esperada y cantidad real;
- motivo de diferencia.

No convertirá silenciosamente paquetes en unidades, gramos en kilogramos ni cantidades esperadas en cantidades confirmadas.

---

#### 17. Escaneo, cámara y captura manual

`OPC-SCAN-001`, `OPC-CAMERA-001` y la alternativa manual producirán la misma identidad empresarial cuando representen la misma acción.

El sistema deberá:

1. validar tipo, formato y contexto del identificador;
2. mostrar el objeto resuelto antes de una acción sensible;
3. impedir que un código válido para otra sede, zona, proceso o estado se acepte por coincidencia técnica;
4. conservar origen de captura;
5. permitir fallback manual controlado;
6. evitar dobles efectos por lectura repetida.

---

#### 18. Selecciones y catálogos

Los componentes de selección usarán opciones versionadas, autorizadas y frescas.

Se distinguirá:

- catálogo vacío;
- filtro sin resultados;
- carga pendiente;
- consulta fallida;
- opción retirada;
- opción visible pero no elegible;
- selección previa ya incompatible.

Una etiqueta visible no será el identificador empresarial almacenado.

---

#### 19. Checklist, evidencia y motivos

Un checklist confirma condiciones declaradas, no demuestra automáticamente que el efecto empresarial ocurrió.

La evidencia deberá declarar finalidad, obligatoriedad, autor, tiempo, objeto, retención y privacidad.

Los motivos de corrección, rechazo, cancelación o excepción serán estructurados cuando afecten auditoría, conciliación o análisis posterior. El texto libre se limitará a contexto adicional.

---

#### 20. Confirmación reforzada

`OPC-CONFIRM-001` mostrará, según riesgo:

- acción exacta;
- objeto y versión;
- cantidad y unidad;
- origen y destino;
- consecuencia;
- posibilidad de reversión;
- actor que ejecuta;
- aprobador separado cuando aplique.

No se usará confirmación repetitiva para todas las acciones, porque genera habituación y errores.

---

#### 21. Borradores y datos locales

Todo estado local quedará aislado por:

```text
actor_effective_id
+ station_instance_id
+ process_id
+ step_id
+ work_item_id
+ component_instance_id
+ manifest_version
```

Al cambiar actor, contexto, work item, manifiesto o versión, cada componente aplicará una política explícita de conservar, transferir, descartar, reconciliar o bloquear.

No existirán borradores globales heredables por el siguiente trabajador.

---

#### 22. Interrupción y reanudación

La composición deberá poder reconstruirse después de:

- navegación accidental;
- bloqueo de pantalla;
- expiración de actor;
- pérdida de red;
- reinicio de aplicación;
- falla de periférico;
- cambio controlado de trabajador;
- actualización del objeto empresarial;
- cambio de manifiesto compatible.

La reanudación validará de nuevo estado, actor, autorización, versión, capacidades y pendientes antes de habilitar la acción.

---

#### 23. Cambios dinámicos sin sorpresa

Una actualización no podrá:

- mover una acción destructiva bajo el dedo o foco activo;
- borrar datos ya capturados sin explicación;
- cambiar unidad o presentación silenciosamente;
- sustituir el objeto empresarial mientras se confirma;
- habilitar una acción por una respuesta tardía de otro componente;
- cerrar una alerta antes de que el trabajador la perciba;
- convertir un resultado desconocido en éxito por timeout.

Los cambios materiales producirán estabilización, aviso o revalidación según riesgo.

---

#### 24. Capacidades y periféricos

Un componente que requiera escáner, cámara, báscula, impresora, datáfono u otra capacidad declarará:

- capacidad mínima;
- versión o compatibilidad;
- estado de salud;
- reserva o lease cuando aplique;
- fallback permitido;
- efecto de indisponibilidad;
- evidencia de resultado físico.

La composición no mostrará un control inutilizable ni ocultará el trabajo sin explicar la alternativa.

---

#### 25. Offline, sincronización y conflicto

Cada componente declarará uno de estos comportamientos:

- `ONLINE_ONLY`;
- `OFFLINE_READ_ONLY`;
- `OFFLINE_CAPTURE_DRAFT`;
- `OFFLINE_COMMAND_ALLOWED`;
- `MANUAL_CONTINGENCY_ONLY`;
- `NOT_APPLICABLE`.

Una composición offline no mezclará componentes incompatibles. Los comandos pendientes conservarán actor, contexto, versión, idempotencia y manifiesto originales.

`RESULT_UNKNOWN` bloqueará la repetición hasta consultar, conciliar o escalar.

---

#### 26. Fallo aislado y coherencia global

Un componente podrá fallar sin derribar toda la superficie solo cuando:

1. no sea crítico para comprender el estado;
2. no altere la siguiente acción;
3. exista fallback seguro;
4. la ausencia sea visible y trazable.

Si falla contexto, actor, estado, riesgo, acción primaria o confirmación necesaria, la composición completa deberá bloquear mutaciones.

---

#### 27. Privacidad en estación compartida

Cada componente declarará qué datos puede mostrar:

- antes de identificar actor;
- con actor activo;
- durante cambio de trabajador;
- en modo supervisión;
- en pantalla visible a terceros;
- durante contingencia;
- después de cierre.

La composición aplicará el nivel más restrictivo entre dato, proceso, actor, estación y componente.

`OPC-PRIVACY-001` no sustituye las reglas de acceso; solo materializa protecciones de presentación y limpieza.

---

#### 28. Accesibilidad y modalidades

El mismo contrato semántico podrá tener variantes táctil, teclado, escáner, cámara, lectura a distancia o asistencia accesible.

Todas conservarán:

- nombre y efecto de la acción;
- orden semántico;
- estado y riesgo;
- foco y navegación predecibles;
- objetivos adecuados;
- alternativas a color, sonido, gesto o arrastre;
- mensajes breves con detalle disponible;
- recuperación tras interrupción.

Una variante no podrá eliminar controles críticos para caber en una pantalla menor.

---

#### 29. Adaptación por perfil de estación

La composición podrá adaptar densidad, agrupación, orientación y modalidad según el perfil aprobado.

No podrá:

- convertir una estación de consulta en estación de mutación;
- usar una capacidad inexistente;
- ampliar territorio o permisos;
- asumir privacidad no disponible;
- mostrar información sensible por mayor tamaño de pantalla;
- usar responsive design como justificación para una experiencia universal no probada.

---

#### 30. Versionado y compatibilidad

Se versionarán independientemente:

- contrato del componente;
- implementación por plataforma;
- manifiesto de composición;
- proceso y paso;
- work item;
- contrato de comando;
- esquema de entrada y salida.

Una nueva versión deberá declarar compatibilidad, migración de borradores, impacto offline, rollout, rollback, pruebas y fecha de retiro de la versión anterior.

---

#### 31. Ciclo de vida

| Estado                   | Significado                                   |
| ------------------------ | --------------------------------------------- |
| `CONTRACT_APPROVED`      | semántica documental aprobada                 |
| `PROTOTYPE_PENDING`      | falta prototipo representativo                |
| `PROTOTYPE_VALIDATED`    | comportamiento comprendido por trabajadores   |
| `IMPLEMENTATION_PENDING` | falta componente ejecutable y paquete         |
| `RELEASE_APPROVED`       | versión autorizada para un ambiente y alcance |
| `DEPRECATED`             | no debe incorporarse a manifiestos nuevos     |
| `RETIRED`                | no puede ejecutarse                           |
| `REJECTED`               | variante no aceptada                          |

Una implementación no heredará automáticamente la aprobación del contrato semántico.

---

#### 32. Deprecación y retiro

La retirada de un componente exigirá:

1. inventario de manifiestos consumidores;
2. sustituto o justificación;
3. compatibilidad con trabajo abierto y borradores;
4. tratamiento de operación offline;
5. actualización de pruebas;
6. rollout y rollback;
7. fecha y responsable;
8. verificación de que no quedan versiones productivas huérfanas.

---

#### 33. Telemetría y auditoría

La composición podrá registrar:

- manifiesto y componentes resueltos;
- versión y plataforma;
- estados presentados;
- componente que originó una intención;
- fallback utilizado;
- errores y recuperaciones;
- tiempo hasta la primera acción correcta;
- ayuda solicitada;
- cambios inesperados evitados;
- conflictos y resultados desconocidos.

No registrará secretos, credenciales, contenido sensible innecesario ni cada gesto con fines de vigilancia individual.

---

#### 34. Rendimiento y carga técnica

La composición no justificará una consulta independiente y secuencial por cada componente.

El diseño deberá permitir:

- proyecciones agregadas y versionadas;
- carga por prioridad;
- caché segura con frescura explícita;
- actualizaciones incrementales estables;
- aislamiento de componentes no críticos;
- presupuesto de complejidad y dependencias;
- diagnóstico centralizado.

Una superficie que requiera vigilancia técnica permanente o ajustes manuales frecuentes será rechazada.

---

#### 35. Gobierno de variantes

Una variante solo se creará cuando cambie de manera real:

- modalidad;
- perfil de estación;
- accesibilidad;
- riesgo;
- privacidad;
- capacidad física;
- densidad operativa.

No se creará una variante por sede, trabajador, color, preferencia aislada o aplicación si el contrato semántico es el mismo.

Toda excepción tendrá propietario, justificación, prueba y condición de retiro.

---

#### 36. Composiciones reutilizables

Podrán definirse plantillas semánticas como:

- identificación y selección de trabajo;
- captura de cantidad;
- verificación por escaneo;
- recepción con diferencia;
- preparación mediante checklist;
- transferencia y handoff;
- confirmación de entrega;
- registro de excepción;
- operación offline;
- resultado y recibo.

La plantilla no reemplazará el manifiesto del paso ni podrá omitir sus contratos de estado, autoridad o resultado.

---

#### 37. Relación con pantallas definitivas

`PROC-SCREEN-001` a `PROC-SCREEN-028` podrán agrupar varios pasos o manifiestos dentro de una pantalla, ruta o flujo.

Sin embargo:

- cada paso conservará su manifiesto y trazabilidad;
- una pantalla no podrá cambiar la semántica de los componentes;
- la navegación no sustituirá el estado empresarial;
- una optimización visual no eliminará validaciones;
- las pantallas solo usarán versiones aprobadas para su paquete y ambiente.

---

#### 38. Pruebas con trabajadores reales

`UX-STATION-008` deberá prototipar combinaciones representativas y comprobar:

- reconocimiento del objeto y estado;
- comprensión de la acción primaria;
- captura correcta con distintas modalidades;
- cambio de actor;
- interrupción y reanudación;
- bloqueo y escalamiento;
- fallo de componente o periférico;
- offline y reconciliación;
- resultado desconocido;
- consistencia entre aplicaciones;
- carga cognitiva;
- necesidad real de ayuda o supervisión.

No bastará validar componentes aislados en un catálogo de diseño.

---

#### 39. Matriz obligatoria por proceso y paso

Para `VPROC-0001` a `VPROC-0069`, cada paso con interacción humana declarará:

```text
process_id
process_version
step_id
step_version
composition_required
composition_manifest_id
composition_manifest_version
work_item_contract_version
supported_station_profiles
supported_modalities
required_context
component_instances
primary_action_instance
secondary_action_instances
state_mapping
capability_requirements
privacy_policy
accessibility_policy
offline_policy
fallback_policy
draft_and_reset_policy
command_contracts
validation_scenarios
prototype_scenarios
```

Un paso sin composición declarará `NO_DYNAMIC_COMPOSITION` y justificará su ejecución automática, externa o puramente informativa.

---

#### 40. Responsabilidades posteriores

| Materia                                    | Tarea propietaria                        |
| ------------------------------------------ | ---------------------------------------- |
| prototipo de componentes y composiciones   | `UX-STATION-008`                         |
| aprobación de matriz final                 | `UX-STATION-009`                         |
| diseño de pantallas operativas definitivas | `PROC-SCREEN-001` a `PROC-SCREEN-028`    |
| cobertura integral de pantallas            | `PROC-COVER-001` a `PROC-COVER-010`      |
| implementación de biblioteca y motor       | paquetes E5 por aplicación y plataforma  |
| pruebas automatizadas y regresión          | BLOQUE T y BLOQUE U                      |
| rollout, rollback y contingencia           | BLOQUE E5, BLOQUE Z y BLOQUE AC          |
| capacitación y soporte                     | `TI-DOM-013`; `TI-UX-006`; `E5-GATE-006` |

Esta tarea no crea un constructor de formularios, CMS operativo, motor de reglas, paquete de componentes ni configuración productiva.

---

#### 41. Reglas de rechazo

La composición será rechazada si:

1. permite componentes no catalogados;
2. ejecuta código o expresiones arbitrarias desde datos;
3. confunde visibilidad con autorización;
4. presenta más de una acción primaria;
5. permite que un componente cambie estado empresarial directamente;
6. oculta actor, contexto, objeto, riesgo o estado crítico;
7. pierde o mezcla borradores entre trabajadores;
8. repite comandos después de un resultado desconocido;
9. depende de un periférico sin fallback o bloqueo explícito;
10. cambia la interfaz bajo el foco de forma insegura;
11. usa validación exclusivamente en cliente;
12. rompe unidades, presentaciones o conversiones;
13. genera consultas o dependencias sin presupuesto;
14. requiere mantenimiento manual frecuente para seguir funcionando;
15. no tiene versionado, compatibilidad, pruebas o retiro;
16. no cubre los 69 procesos.

---

#### Requisitos de prueba derivados

Esta tarea genera los requisitos:

- `TREQ-PROC-901` a `TREQ-PROC-940`.

---

#### 42. Criterios de aceptación

- [ ] Existe catálogo cerrado de componentes semánticos.
- [ ] Cada componente declara entradas, estados, salidas, privacidad, accesibilidad, offline, fallback y versión.
- [ ] Existe manifiesto declarativo por proceso y paso.
- [ ] No se ejecuta código arbitrario desde configuración.
- [ ] Se separan visibilidad, habilitación de experiencia y autorización de servidor.
- [ ] Existe orden semántico estable de slots.
- [ ] Cada composición admite como máximo una acción primaria.
- [ ] Comandos, idempotencia y versión esperada están definidos.
- [ ] Los borradores se aíslan por actor, estación, paso, work item, componente y manifiesto.
- [ ] Cambio de actor, interrupción y reanudación tienen políticas explícitas.
- [ ] Capacidades, periféricos, fallback y operación degradada están integrados.
- [ ] Offline, sincronización, conflicto y resultado desconocido están definidos.
- [ ] Privacidad y accesibilidad se resuelven por el criterio más restrictivo.
- [ ] Cantidades, unidades, selecciones, escaneo, evidencia y confirmación conservan semántica empresarial.
- [ ] Existe ciclo de vida, compatibilidad, deprecación y retiro.
- [ ] La telemetría no se convierte en vigilancia invasiva.
- [ ] La composición no exige soporte o supervisión permanente.
- [ ] Los 69 procesos tienen manifiesto o justificación `NO_DYNAMIC_COMPOSITION`.
- [ ] `UX-STATION-008` permanece sin iniciar.
- [ ] No se implementó código, componentes, datos, infraestructura ni cambios físicos.

---

#### 43. Resultado y continuidad

```text
UX-STATION-011 APROBADA
UX-STATION-012 APROBADA
UX-STATION-008 NO INICIADA
UX-STATION-009 NO INICIADA
```

`UX-STATION-012` cierra el diseño documental previo al prototipo. Define qué componentes y composiciones podrán probarse, pero no demuestra todavía su comprensión, eficiencia o seguridad con trabajadores reales.

La siguiente tarea canónica es:

```text
UX-STATION-008 — Prototipar alternativas con trabajadores reales
```
