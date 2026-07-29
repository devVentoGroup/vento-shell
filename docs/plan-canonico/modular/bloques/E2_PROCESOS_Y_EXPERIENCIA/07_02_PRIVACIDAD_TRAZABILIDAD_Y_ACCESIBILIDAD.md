### MINI-BLOQUE — PRIVACIDAD TRAZABILIDAD Y ACCESIBILIDAD

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **privacidad trazabilidad y accesibilidad** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `NFR-REQ-005` a `NFR-REQ-007` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `NFR-REQ-005`: Definir privacidad y sensibilidad
- `NFR-REQ-006`: Definir trazabilidad y retención
- `NFR-REQ-007`: Definir accesibilidad y ergonomía
<!-- PLAN-SECTION-META:END -->

### ✅ NFR-REQ-005 — Definir privacidad y sensibilidad

**Estado:** APROBADA
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal
**Tarea anterior:** `NFR-REQ-004 — Definir comportamiento offline y sincronización` — APROBADA
**Siguiente tarea reservada:** `NFR-REQ-006 — Definir trazabilidad y retención` — NO INICIADA
**Artefactos aprobados:** `NFR-PRIVACY-SENSITIVITY-CONTRACT-001`; `NFR-INFORMATION-HANDLING-MATRIX-001`; `NFR-PROCESS-PRIVACY-PROFILE-001`; `NFR-DATA-EXPOSURE-BOUNDARY-001`
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`
**Naturaleza:** contrato no funcional de privacidad, clasificación, sensibilidad, minimización, exposición y manejo; no dictamen jurídico, implementación criptográfica, política de retención ni certificación
**Cambios en código, migraciones, Supabase, aplicaciones, infraestructura o despliegues:** no autorizados

---

#### 1. Propósito

Definir un contrato verificable para clasificar y manejar la información de Vento OS según su sensibilidad, finalidad, identificabilidad, daño potencial, contexto, actor y canal. El objetivo es impedir que una autorización funcional correcta termine exponiendo más información de la necesaria mediante pantallas, payloads, archivos, cachés, logs, exportaciones, integraciones o ambientes no productivos.

```text
AUTORIZACIÓN PARA EJECUTAR UNA ACCIÓN
≠ AUTORIZACIÓN PARA VER TODOS SUS DATOS

ACCESO A UN PROCESO
≠ ACCESO A TODO EL EXPEDIENTE

CIFRADO
≠ MINIMIZACIÓN
≠ AUTORIZACIÓN
≠ ANONIMIZACIÓN

DATO SIN NOMBRE DIRECTO
≠ DATO ANÓNIMO
```

La aprobación de esta tarea congelará criterios iniciales de diseño. No declarará cumplimiento legal, certificación de seguridad ni adecuación de los sistemas actuales.

---

#### 2. Continuidad lógica

`NFR-REQ-001` definió criticidad y disponibilidad. `NFR-REQ-002` fijó carga y crecimiento. `NFR-REQ-003` estableció presupuestos temporales. `NFR-REQ-004` determinó qué puede existir localmente y cómo se sincroniza. Antes de definir retención en `NFR-REQ-006`, debe establecerse qué información existe, qué tan sensible es, para qué se usa y bajo qué límites puede mostrarse, copiarse, transmitirse o persistirse.

```text
PROCESO, ACTOR Y FINALIDAD
        ↓
INFORMACIÓN MÍNIMA NECESARIA
        ↓
CLASIFICACIÓN Y SENSIBILIDAD
        ↓
REGLAS DE MANEJO Y EXPOSICIÓN
        ↓
RETENCIÓN, TRAZABILIDAD Y DISPOSICIÓN
```

---

#### 3. Alcance

El contrato aplica a:

- datos estructurados y no estructurados;
- documentos, imágenes, audio, video y evidencia;
- identificadores, metadatos, relaciones y timestamps;
- datos calculados, inferidos, agregados y perfiles;
- payloads, eventos, receipts, colas y cachés;
- logs, trazas, métricas, alertas y volcados de diagnóstico;
- archivos descargados, impresos, exportados o compartidos;
- datos en producción, staging, desarrollo, pruebas y soporte;
- información alojada por aplicaciones propias o terceros;
- datos observados, capturados offline o pendientes de sincronización.

No se limita a datos personales. Recetas, precios, costos, credenciales, configuraciones, investigaciones, hallazgos de seguridad y decisiones empresariales también pueden requerir manejo restringido.

---

#### 4. Principios obligatorios

1. **Finalidad explícita:** todo uso deberá responder a una finalidad empresarial identificable.
2. **Minimización:** cada consumidor recibirá solo campos, precisión, periodo y población necesarios.
3. **Necesidad de conocer:** pertenecer a un área o tener acceso a una pantalla no concede acceso total.
4. **Separación de deberes:** consulta, modificación, aprobación, exportación y administración tendrán permisos diferenciados.
5. **Protección por defecto:** una categoría desconocida no se tratará como pública ni de bajo riesgo.
6. **Contexto efectivo:** actor, sede, área, turno, dispositivo, relación con el caso y estado condicionarán la exposición.
7. **Propagación de sensibilidad:** copias, derivados, joins, cachés y exportaciones heredarán o elevarán la clasificación.
8. **No exposición indirecta:** conteos pequeños, nombres de archivo, URLs, errores, logs y metadatos no podrán eludir el control principal.
9. **Reversibilidad controlada:** enmascarar o seudonimizar no equivale a anonimizar.
10. **Evidencia proporcional:** la prueba del control no deberá reproducir innecesariamente el dato protegido.

---

#### 5. Modelo de clasificación

Se adopta la siguiente escala inicial:

| Clase                  | Nombre                | Descripción                                                                            | Ejemplos orientativos                                                                |
| ---------------------- | --------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `S0_PUBLIC`            | pública               | divulgación aprobada para audiencia abierta                                            | menús publicados, horarios públicos, contenido comercial aprobado                    |
| `S1_INTERNAL`          | interna               | operación ordinaria sin divulgación externa                                            | instrucciones generales, catálogos internos, estados operativos no sensibles         |
| `S2_CONFIDENTIAL`      | confidencial          | acceso limitado por función, sede, relación o finalidad                                | datos de proveedores, precios acordados, casos de cliente, rutas internas            |
| `S3_RESTRICTED`        | restringida           | daño alto por exposición, alteración o correlación                                     | información laboral, financiera, disciplinaria, investigación, ubicación individual  |
| `S4_HIGHLY_RESTRICTED` | altamente restringida | secretos, salud, credenciales o información cuyo compromiso exige contención inmediata | credenciales, secretos, tokens, PIN, datos médicos, evidencia especialmente sensible |

La clase se asignará al nivel más específico útil: campo, atributo, documento, evento, expediente, agregado, archivo o conjunto. Una tabla o aplicación no tendrá necesariamente una sola sensibilidad.

---

#### 6. Dimensiones de evaluación

La clasificación deberá considerar conjuntamente:

- identificabilidad directa e indirecta;
- población afectada y posibilidad de reidentificación;
- naturaleza laboral, médica, financiera, comercial, técnica o de seguridad;
- daño físico, económico, reputacional, laboral u operacional;
- obligación contractual, regulatoria o de confidencialidad aplicable;
- precisión, granularidad, vigencia y contexto temporal;
- facilidad de copia, agregación, cruce o difusión;
- relación entre actor, titular, caso, sede y finalidad;
- exposición a terceros, dispositivos compartidos y canales externos;
- sensibilidad adquirida por inferencia o combinación.

La clasificación más restrictiva aplicable prevalecerá hasta que exista una reclasificación explícita y aprobada.

---

#### 7. Categorías mínimas de información

| Categoría                                                | Clase inicial mínima           | Regla principal                                             |
| -------------------------------------------------------- | ------------------------------ | ----------------------------------------------------------- |
| contenido público aprobado                               | `S0_PUBLIC`                    | solo la versión publicada y vigente es pública              |
| operación interna ordinaria                              | `S1_INTERNAL`                  | no divulgar externamente por defecto                        |
| clientes, contactos y consentimientos                    | `S2_CONFIDENTIAL`              | finalidad, relación y canal autorizados                     |
| proveedores, contratos y condiciones                     | `S2_CONFIDENTIAL`              | proyección mínima según compra, pago o evaluación           |
| trabajadores, turnos, asistencia y expedientes           | `S3_RESTRICTED`                | acceso propio o funcional estrictamente delimitado          |
| nómina, pagos, cuentas y decisiones financieras          | `S3_RESTRICTED`                | segregación, enmascaramiento y exportación controlada       |
| SST, salud, investigaciones y declaraciones              | `S4_HIGHLY_RESTRICTED`         | aislamiento por caso, participación y finalidad             |
| credenciales, secretos, tokens, PIN y llaves             | `S4_HIGHLY_RESTRICTED`         | nunca exponer en UI, logs, analytics ni archivos ordinarios |
| recetas, fórmulas, costos y conocimiento propietario     | `S2_CONFIDENTIAL`              | acceso por función, versión y necesidad productiva          |
| vulnerabilidades, incidentes y configuraciones sensibles | `S3_RESTRICTED`                | divulgación mínima y coordinación de contención             |
| telemetría y auditoría identificable                     | `S2_CONFIDENTIAL`              | minimizar payload y restringir drill-down                   |
| evidencia, firmas y documentos                           | clase del contenido o superior | metadatos y copias heredan sensibilidad                     |

La clasificación definitiva corresponde a `INFO-DOM-001`, `INFO-DOM-002`, `INFO-DOM-008` y contratos posteriores. Esta tarea fija el mínimo no funcional que esos contratos no podrán degradar.

---

#### 8. Sobre obligatorio de manejo

Cada categoría o proyección sensible deberá poder declarar:

```text
classification
information_owner
custodian
purpose
allowed_actor_and_context
allowed_fields
masking_rule
allowed_channels
local_storage_policy
offline_policy
export_policy
third_party_policy
logging_policy
retention_policy_reference
disposal_policy_reference
incident_route
classification_version
```

La ausencia del sobre o de una referencia resoluble bloqueará la exposición o utilizará la política más restrictiva; nunca habilitará un fallback amplio.

---

#### 9. Minimización por proyección

Las aplicaciones consumidoras no recibirán modelos completos para ocultar campos únicamente en la interfaz. Cada consulta, RPC, evento, exportación y payload deberá usar una proyección adecuada a la acción.

```text
SELECT * + OCULTAR EN UI
= CONTROL INVÁLIDO

PROYECCIÓN MÍNIMA
+ AUTORIZACIÓN EN SERVIDOR
+ PRESENTACIÓN SEGURA
= FRONTERA ACEPTABLE
```

Se minimizarán también:

- longitud y precisión;
- rango temporal;
- número de registros;
- población y granularidad geográfica;
- adjuntos y metadatos;
- identificadores correlacionables;
- campos utilizados solo para depuración.

---

#### 10. Identificadores, seudonimización y anonimización

Eliminar nombre, correo o documento no será suficiente si sede, turno, rol, timestamps, trayectoria, caso o combinación de atributos permiten reconocer a una persona.

- **enmascaramiento:** reduce exposición visual, pero conserva el dato original;
- **tokenización:** sustituye un valor mediante referencia controlada;
- **seudonimización:** reduce asociación directa, pero puede ser reversible bajo control;
- **anonimización:** exige riesgo de reidentificación suficientemente reducido y evaluación documentada;
- **agregación:** no será segura si grupos pequeños o filtros permiten inferencia.

Ninguna interfaz o reporte podrá denominar “anónimo” a un conjunto únicamente porque omitió un identificador directo.

---

#### 11. Exposición en interfaz

La interfaz deberá:

- mostrar únicamente campos necesarios para la tarea activa;
- enmascarar valores cuando la función no requiera el dato completo;
- impedir revelado por hover, HTML, atributos accesibles, autocomplete o código fuente;
- ocultar contenido durante cambio de actor, bloqueo o expiración;
- evitar información sensible en títulos, URLs, notificaciones y vistas previas;
- distinguir ausencia de permiso de ausencia del dato sin filtrar su existencia;
- aplicar protección equivalente en escritorio, móvil, kiosco, impresión y accesibilidad.

Ocultar visualmente no sustituirá autorización de servidor, RLS, RPC ni política de almacenamiento.

---

#### 12. Dispositivos compartidos y trabajo offline

`NFR-REQ-004` queda restringida por estas reglas:

- `S4_HIGHLY_RESTRICTED` será online por defecto y no persistirá localmente salvo excepción explícita;
- `S3_RESTRICTED` exigirá cifrado, aislamiento por actor, expiración y borrado verificable;
- ninguna cola transferirá información entre actores, áreas o sesiones;
- logout, cambio de turno, revocación y pérdida de contexto bloquearán visualización y sincronización;
- notificaciones locales no expondrán contenido sensible;
- thumbnails, cachés del sistema, archivos temporales y portapapeles respetarán la misma clasificación;
- una copia offline conservará finalidad, clasificación y versión de política.

El detalle físico de cifrado y almacenamiento se materializará en arquitectura y paquetes E5; esta tarea define el resultado obligatorio.

---

#### 13. Logs, métricas, trazas y soporte

No deberán aparecer secretos, tokens, PIN, credenciales, payloads completos ni documentos en logs. Para información sensible se aplicarán allowlists de campos, redacción y correlación mediante identificadores no reveladores.

Los sistemas de observabilidad deberán:

- separar correlación técnica de identidad visible;
- limitar búsqueda y drill-down;
- evitar cardinalidad basada en datos personales;
- impedir que mensajes de error reproduzcan entradas sensibles;
- registrar accesos administrativos a evidencia de diagnóstico;
- aplicar sensibilidad y retención también a dumps, screenshots y sesiones de soporte.

`NFR-REQ-009` definirá métricas y alertas; no podrá ampliar el contenido permitido por esta tarea.

---

#### 14. Exportaciones, reportes e impresión

Toda exportación deberá declarar finalidad, actor, alcance, filtros, columnas, clasificación, destino, vigencia y evidencia. El permiso de consulta ordinaria no concederá automáticamente permiso de exportación masiva.

Guardrails:

- límites de volumen y población;
- supresión o agrupación de celdas pequeñas;
- enmascaramiento de columnas no necesarias;
- marca de clasificación y contexto cuando aplique;
- descarga mediante enlace temporal y no adivinable;
- prohibición de índices públicos y URLs persistentes;
- control de copias impresas y archivos temporales;
- revocación del acceso futuro sin prometer borrar copias legítimamente custodiadas.

---

#### 15. Integraciones y terceros

Antes de transmitir información a otra aplicación o tercero se verificará:

1. finalidad y autoridad de la transferencia;
2. campos mínimos y clasificación;
3. identidad del receptor y ambiente;
4. canal y protección requeridos;
5. restricciones de reutilización;
6. tratamiento de errores, reintentos y dead-letter;
7. subencargados o destinos adicionales;
8. retorno, revocación, expiración y evidencia.

Una integración no recibirá secretos internos ni payloads completos por comodidad técnica. Webhooks, correo, mensajería, analytics y herramientas de soporte se consideran canales externos hasta que exista contrato aprobado.

---

#### 16. Datos de prueba y ambientes no productivos

Producción no se copiará íntegramente a desarrollo, demos, CI o pruebas. Se preferirán datos sintéticos. Cuando un escenario exija información representativa:

- se minimizará y transformará antes de salir del entorno autorizado;
- se documentará la necesidad;
- se limitarán usuarios y duración;
- se impedirá envío de mensajes o acciones reales;
- se verificará eliminación según `NFR-REQ-006`;
- las evidencias de prueba no incluirán secretos ni datos innecesarios.

Capturas de pantalla, grabaciones y archivos usados para soporte conservarán la clasificación del contenido.

---

#### 17. Secretos y credenciales

Contraseñas, tokens, refresh tokens, API keys, llaves privadas, PIN, códigos de recuperación y secretos de firma:

- no se almacenarán en texto claro;
- no se mostrarán nuevamente después de su creación salvo contrato específico;
- no viajarán en URLs, analytics, logs ni mensajes ordinarios;
- no se compartirán entre ambientes;
- tendrán propietario, alcance, rotación y revocación;
- no se incluirán en datos de negocio, evidencia o exportaciones;
- utilizarán mecanismos de custodia especializados definidos en arquitectura.

La presencia de un secreto en una fuente no reclasificará esa fuente como almacenamiento aceptable; obligará a retirar y contener.

---

#### 18. Datos derivados, analítica e inferencias

Un resultado agregado o calculado podrá ser más sensible que sus entradas. Segmentos pequeños, desempeño individual, fraude, salud, productividad, comportamiento, ubicación y combinaciones entre aplicaciones exigirán evaluación de inferencia.

Se prohíbe:

- crear perfiles nuevos sin finalidad y propietario;
- usar telemetría operativa para disciplina individual sin contrato aprobado;
- atribuir fallas de red o dispositivo al trabajador;
- permitir drill-down hasta personas cuando solo se autorizó análisis agregado;
- tratar una predicción como hecho confirmado;
- reutilizar datos recolectados para una finalidad incompatible por conveniencia analítica.

---

#### 19. Consentimiento, avisos y derechos

Cuando una finalidad dependa de consentimiento o autorización revocable:

- el sistema distinguirá aceptación, rechazo, retiro, expiración y versión;
- retirar consentimiento bloqueará usos futuros aplicables;
- la evidencia histórica no se sobrescribirá;
- no se agruparán finalidades independientes en una única aceptación;
- la denegación no degradará servicios que no requieran legítimamente ese uso.

El fundamento, los avisos, las solicitudes de acceso, rectificación, revocación o supresión y los requerimientos de autoridad serán definidos por `INFO-DOM-008` a `INFO-DOM-010`. Esta tarea no inventa obligaciones jurídicas.

---

#### 20. Cambio de clasificación

Toda reclasificación deberá conservar:

- clase anterior y nueva;
- motivo y alcance;
- actor autorizador;
- fecha efectiva;
- versión de política;
- copias, derivados y consumidores afectados;
- medidas de migración;
- evidencia de que no quedaron proyecciones incompatibles.

La publicación de un documento no convierte en públicos sus borradores, comentarios, metadatos, fuentes o historial. El vencimiento de una finalidad no equivale automáticamente a eliminación; `NFR-REQ-006` resolverá retención y disposición.

---

#### 21. Frontera con autorización

`AUTH-*` decide quién puede ejecutar una acción bajo un contexto. `NFR-REQ-005` limita qué información necesita esa acción y cómo puede exponerse.

```text
DECISIÓN DE AUTORIZACIÓN
        ↓
PROYECCIÓN MÍNIMA
        ↓
REGLAS DE MANEJO
        ↓
PRESENTACIÓN, TRANSMISIÓN O PERSISTENCIA
```

URL directa, manipulación de cliente, RPC, RLS, exportación, caché, búsqueda, autocomplete y soporte deberán producir el mismo límite de información.

---

#### 22. Perfil inicial por familias de proceso

| Familia                             | Procesos                                                              | Sensibilidad dominante         | Restricción inicial                                        |
| ----------------------------------- | --------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------- |
| gobierno, riesgo y autoridades      | `VPROC-0001` a `VPROC-0004`; `VPROC-0063`; `VPROC-0064`; `VPROC-0069` | `S2` a `S3`                    | acceso por expediente, finalidad y segregación             |
| talento y ciclo laboral             | `VPROC-0005` a `VPROC-0011`; `VPROC-0065`; `VPROC-0066`               | `S3` a `S4`                    | proyección individual, aislamiento y no exposición masiva  |
| SST, salud y emergencias            | `VPROC-0012` a `VPROC-0014`                                           | `S4`                           | acceso por participación y mínima información médica       |
| maestros, recetas y producto        | `VPROC-0015` a `VPROC-0018`                                           | `S1` a `S3`                    | separar publicación de conocimiento propietario            |
| proveedores y compras               | `VPROC-0019` a `VPROC-0022`                                           | `S2` a `S3`                    | condiciones, cuentas y evaluaciones restringidas           |
| inventario, activos y custodia      | `VPROC-0023` a `VPROC-0032`; `VPROC-0067`                             | `S1` a `S3`                    | ubicación, responsable y diferencias por necesidad         |
| producción y calidad                | `VPROC-0033` a `VPROC-0037`                                           | `S1` a `S3`                    | fórmulas, lotes, hallazgos y evidencia delimitados         |
| venta, caja y clientes              | `VPROC-0038` a `VPROC-0047`; `VPROC-0068`                             | `S2` a `S4`                    | separar identidad, pago, fidelización y reclamo            |
| logística y terceros                | `VPROC-0048` a `VPROC-0050`                                           | `S2` a `S3`                    | ubicación y prueba de entrega mínimas                      |
| finanzas y costos                   | `VPROC-0051` a `VPROC-0054`                                           | `S3`                           | segregación, enmascaramiento y exportación reforzada       |
| instalaciones y marketing           | `VPROC-0055` a `VPROC-0057`                                           | `S1` a `S3`                    | separar contenido público de contratos, incidentes y leads |
| tecnología y accesos                | `VPROC-0058`; `VPROC-0059`                                            | `S3` a `S4`                    | secretos fuera de tickets y diagnóstico mínimo             |
| documentos, analítica y continuidad | `VPROC-0060` a `VPROC-0062`                                           | clase del contenido o superior | herencia, agregación segura y acceso excepcional auditado  |

Cada uno de los 69 procesos deberá materializar una fila individual antes de su paquete E5. La agrupación anterior no autoriza una clase uniforme cuando una etapa o campo requiera mayor protección.

---

#### 23. Matriz obligatoria por proceso

`NFR-PROCESS-PRIVACY-PROFILE-001` deberá cubrir exactamente `VPROC-0001` a `VPROC-0069` con:

- categorías de información;
- clase mínima y posibles elevaciones;
- finalidad;
- titulares o sujetos relacionados;
- propietario y custodio;
- actores y contextos autorizados;
- campos y granularidad mínima;
- reglas de enmascaramiento;
- exposición en UI;
- caché y offline;
- logs y observabilidad;
- exportación e impresión;
- integración o tercero;
- retención referenciada;
- riesgo de agregación e inferencia;
- prueba y evidencia propietarias.

No se certificará un proceso con una celda “no aplica” sin justificación verificable.

---

#### 24. Pruebas obligatorias

Cada capacidad aplicable deberá probar:

1. actor autorizado para acción pero no para campo sensible;
2. acceso entre sedes, áreas, casos y titulares;
3. URL, formulario, RPC y payload manipulados;
4. búsqueda y autocomplete sin filtración;
5. lista, detalle, conteo, exportación e impresión;
6. cambio de actor en dispositivo compartido;
7. bloqueo, background, screenshot y notificación;
8. caché, borrador, outbox y reconexión;
9. revocación con datos pendientes;
10. logs, trazas, errores y analytics;
11. archivos, thumbnails, nombres y metadatos;
12. agregados pequeños y reidentificación;
13. ambientes no productivos y datos sintéticos;
14. integración, webhook y tercero;
15. secreto introducido accidentalmente;
16. reclasificación y propagación a derivados;
17. consentimiento retirado o finalidad expirada;
18. soporte técnico y acceso administrativo;
19. accesibilidad sin revelar información adicional;
20. concurrencia entre versiones de política.

Las pruebas físicas pertenecen a paquetes E5, `AUTH-QA-*`, `UX-QA-*`, `SHELL-CI-*`, `INFO-DOM-*`, `EVID-ARC-*`, `OBS-ARC-*`, `QUEUE-ARC-*` y tareas por aplicación.

---

#### 25. Guardrails

```text
SECRETOS EN LOGS, ANALYTICS O URL = 0
S4 PERSISTIDO LOCALMENTE SIN EXCEPCIÓN = 0
EXPORTACIÓN MASIVA POR PERMISO DE CONSULTA = 0
DATOS PRODUCTIVOS ÍNTEGROS EN CI O DEMO = 0
CAMBIO DE ACTOR CON DATOS DEL ACTOR ANTERIOR VISIBLES = 0
PROYECCIÓN COMPLETA OCULTADA SOLO EN UI = 0
CLASIFICACIÓN DESCONOCIDA TRATADA COMO PÚBLICA = 0
ANONIMIZACIÓN DECLARADA SIN EVALUAR REIDENTIFICACIÓN = 0
```

Los umbrales de monitoreo se definirán en `NFR-REQ-009`; estos valores expresan prohibiciones de diseño.

---

#### 26. Propiedad de decisiones posteriores

| Decisión                                                       | Tarea propietaria                                             |
| -------------------------------------------------------------- | ------------------------------------------------------------- |
| inventario, propietarios, custodios y clasificación definitiva | `INFO-DOM-001`; `INFO-DOM-002`                                |
| documentos, autenticidad, firmas y evidencia                   | `INFO-DOM-003` a `INFO-DOM-007`; `INFO-DOM-011`; `EVID-ARC-*` |
| avisos, consentimiento y derechos                              | `INFO-DOM-008` a `INFO-DOM-010`                               |
| retención, hold, anonimización y eliminación                   | `NFR-REQ-006`; `INFO-DOM-006`                                 |
| autorización de servidor, RLS y RPC                            | `AUTH-SRV-*`; `AUTH-DB-*`; `SUPA-ARC-*`                       |
| dispositivos y credenciales                                    | `AUTH-DEV-*`; `NFR-REQ-008`; `NFR-REQ-011`                    |
| offline, colas y sincronización                                | `NFR-REQ-004`; `QUEUE-ARC-*`                                  |
| observabilidad, soporte y alertas                              | `NFR-REQ-009`; `OBS-ARC-*`                                    |
| cifrado, secretos y arquitectura física                        | bloques E3/E4; `SUPA-ARC-*`; paquetes E5                      |
| experiencia, masking y accesibilidad                           | `NFR-REQ-007`; `UX-BASE-*`; `UX-QA-*`                         |
| integraciones y terceros                                       | `INT-APP-*`; `INT-EXT-*`; BLOQUE X                            |
| certificación por aplicación                                   | `DELIV-PKG-*`; tareas `*-AUTH-*`; BLOQUE U                    |

No se declara una tecnología, proveedor, algoritmo, plazo de retención ni fundamento jurídico sin su tarea propietaria.

---

#### 27. Requisitos de prueba derivados

Esta tarea aprobada incorpora al registro canónico completo:

```text
TREQ-PROC-325 a TREQ-PROC-354
```

Cobertura:

1. finalidad y minimización;
2. clasificación `S0` a `S4`;
3. sensibilidad por campo y no por aplicación;
4. herencia y elevación;
5. sobre de manejo;
6. proyecciones mínimas;
7. enmascaramiento y no filtración indirecta;
8. seudonimización, anonimización y reidentificación;
9. UI y accesibilidad;
10. dispositivos compartidos;
11. offline y almacenamiento local;
12. logs, trazas y errores;
13. exportaciones e impresión;
14. archivos y metadatos;
15. integraciones y terceros;
16. datos de prueba;
17. secretos y credenciales;
18. datos derivados e inferencias;
19. consentimiento y finalidad;
20. reclasificación;
21. autorización más proyección;
22. SST y salud;
23. talento y desempeño;
24. clientes y fidelización;
25. pagos y finanzas;
26. recetas y conocimiento propietario;
27. observabilidad y soporte;
28. clasificación por 69 procesos;
29. guardrails y regresión;
30. gobierno, evidencia y certificación.

La evidencia de estas filas deberá indicar expresamente que proviene de `NFR-REQ-005` aprobada. Los identificadores no cambian.

---

#### 28. Criterios de aceptación

- [ ] Se distinguen privacidad, confidencialidad, autorización, cifrado, minimización y anonimización.
- [ ] Las clases `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED` tienen límites inequívocos.
- [ ] La clasificación puede aplicarse a campo, documento, evento, metadato, agregado y derivado.
- [ ] Una clasificación desconocida usa política restrictiva.
- [ ] Copias, joins, exportaciones y derivados heredan o elevan sensibilidad.
- [ ] Cada consumidor recibe una proyección mínima autorizada.
- [ ] Se cubren UI, caché, offline, logs, métricas, exportaciones, archivos, integraciones y soporte.
- [ ] Los secretos quedan fuera de datos empresariales, URLs, logs y analytics.
- [ ] Se distinguen masking, tokenización, seudonimización, anonimización y agregación.
- [ ] Dispositivos compartidos aíslan actor, contexto y datos locales.
- [ ] Producción no se replica íntegramente a ambientes no productivos.
- [ ] Consentimiento, finalidad y revocación no se confunden con retención o eliminación.
- [ ] Los 69 procesos deberán tener perfil individual antes de implementación.
- [ ] Se incorporan `TREQ-PROC-325` a `TREQ-PROC-354` al `04A` completo con evidencia de tarea aprobada.
- [ ] No se implementan código, cifrado, migraciones, Supabase, políticas físicas ni despliegues.
- [ ] `NFR-REQ-006` permanece no iniciada.

---

#### 29. Estado y continuidad

```text
NFR-REQ-003   APROBADA
NFR-REQ-004   APROBADA
NFR-REQ-005   APROBADA
NFR-REQ-006   NO INICIADA
```

La aprobación explícita de esta tarea congelará el contrato inicial de privacidad y sensibilidad. No certificará cumplimiento jurídico ni seguridad efectiva de ninguna implementación.

### ✅ NFR-REQ-006 — Definir trazabilidad y retención

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-005 — Definir privacidad y sensibilidad` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-007 — Definir accesibilidad y ergonomía` — NO INICIADA  
**Artefactos aprobados:** `NFR-TRACEABILITY-RETENTION-CONTRACT-001`; `NFR-AUDIT-EVENT-ENVELOPE-001`; `NFR-RETENTION-POLICY-MATRIX-001`; `NFR-DISPOSITION-CONTROL-001`; `NFR-PROCESS-TRACEABILITY-PROFILE-001`
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de trazabilidad, historial, conservación, archivo, suspensión de disposición, anonimización y eliminación controlada; no dictamen jurídico, tabla legal definitiva, implementación física de auditoría, diseño de respaldos ni certificación  
**Cambios en código, migraciones, Supabase, aplicaciones, Storage, infraestructura o despliegues:** no autorizados

---

#### 1. Propósito

Definir un contrato verificable para reconstruir qué ocurrió en cada proceso de Vento OS, quién o qué intervino, bajo cuál contexto, sobre qué recurso, con qué decisión, resultado, evidencia y política vigente; y establecer cómo cada dato, documento, evento, log, evidencia, copia o derivado deberá conservarse, archivarse, suspenderse, anonimizarse o eliminarse de manera controlada.

```text
ESTADO ACTUAL
≠ HISTORIAL SUFICIENTE

LOG TÉCNICO
≠ AUDITORÍA EMPRESARIAL

BACKUP
≠ ARCHIVO
≠ RETENCIÓN
≠ LEGAL HOLD

BORRADO DE UNA FILA
≠ DISPOSICIÓN COMPLETA

CONSERVAR TODO PARA SIEMPRE
≠ TRAZABILIDAD
≠ CUMPLIMIENTO
```

La aprobación de esta tarea congelará el contrato no funcional inicial. No declarará que los sistemas actuales ya son trazables, que los plazos jurídicos están definidos ni que la eliminación física es completa.

---

#### 2. Continuidad lógica

`NFR-REQ-001` clasificó criticidad y disponibilidad. `NFR-REQ-002` definió carga y crecimiento. `NFR-REQ-003` estableció presupuestos temporales. `NFR-REQ-004` fijó comportamiento offline y sincronización. `NFR-REQ-005` clasificó sensibilidad, finalidad y manejo.

`NFR-REQ-006` convierte esas decisiones en obligaciones de reconstrucción y ciclo de vida:

```text
HECHO EMPRESARIAL
        ↓
ACTOR + CONTEXTO + RECURSO + DECISIÓN
        ↓
EVENTO, HISTORIAL Y EVIDENCIA
        ↓
POLÍTICA DE RETENCIÓN VERSIONADA
        ↓
ARCHIVO / HOLD / ANONIMIZACIÓN / DISPOSICIÓN
        ↓
EVIDENCIA DE EJECUCIÓN Y NO RESURRECCIÓN
```

La accesibilidad de estados, historial y evidencia será detallada por `NFR-REQ-007`. La observabilidad técnica y las alertas serán definidas por `NFR-REQ-009`. Los respaldos, RTO y RPO pertenecerán a `NFR-REQ-010`. Ninguna de esas tareas podrá degradar la trazabilidad, sensibilidad o retención aprobadas aquí.

---

#### 3. Alcance

El contrato aplica a:

- hechos, decisiones y transiciones de los `VPROC-0001` a `VPROC-0069`;
- entidades, expedientes, documentos, archivos, evidencias y firmas;
- accesos, consultas, revelados, exportaciones, impresiones y comparticiones sensibles;
- aprobaciones, rechazos, excepciones, correcciones, cancelaciones, reversos y anulaciones;
- eventos empresariales, outbox, inbox, webhooks, integraciones y callbacks;
- operaciones offline, reintentos, conflictos, cuarentenas y conciliaciones;
- cambios de configuración, permisos, matrices, políticas, maestros y parámetros;
- logs de auditoría, seguridad, soporte y administración privilegiada;
- métricas, trazas y diagnósticos cuando sean necesarios para demostrar un hecho;
- copias, cachés, exportaciones, archivos temporales, datasets y derivados;
- producción, staging, desarrollo, pruebas, soporte y recuperación;
- datos activos, inactivos, archivados, suspendidos, anonimizados y dispuestos;
- bases de datos, Storage, dispositivos, colas, terceros y respaldos.

La trazabilidad no se limitará a acciones de interfaz. RPC, RLS, procesos automáticos, trabajos programados, integraciones y operaciones administrativas deberán producir evidencia equivalente cuando generen un efecto empresarial.

---

#### 4. Distinciones canónicas

| Concepto             | Definición                                                                     | No equivale a                           |
| -------------------- | ------------------------------------------------------------------------------ | --------------------------------------- |
| hecho empresarial    | cambio o decisión con significado para un proceso                              | clic, request o línea de log aislada    |
| evento empresarial   | representación versionada de un hecho consumado o rechazado                    | estado mutable sin historial            |
| historial de recurso | secuencia reconstruible de estados y correcciones                              | copia actual de la fila                 |
| auditoría            | evidencia de quién o qué hizo, intentó, consultó, decidió o cambió algo        | observabilidad general                  |
| observabilidad       | señales para comprender salud y comportamiento técnico                         | prueba completa de un hecho empresarial |
| evidencia            | objeto o referencia que sustenta un hecho, decisión o cumplimiento             | adjunto sin procedencia                 |
| procedencia          | origen, transformaciones y custodios de un dato o evidencia                    | ubicación actual únicamente             |
| retención            | regla que determina cuánto y desde qué evento se conserva algo                 | almacenamiento indefinido               |
| archivo              | conservación controlada fuera del uso operativo ordinario                      | backup o papelera                       |
| legal hold           | suspensión autorizada de disposición sobre un alcance concreto                 | retención permanente general            |
| disposición          | ejecución gobernada de eliminación, anonimización, destrucción o transferencia | `DELETE` sin verificación               |
| anonimización        | transformación que reduce suficientemente la posibilidad de identificar        | ocultamiento visual o seudonimización   |
| tombstone            | registro mínimo que impide recreación o demuestra disposición                  | copia completa del contenido eliminado  |
| backup               | copia de recuperación ante pérdida o corrupción                                | repositorio de consulta histórica       |

Estas distinciones serán obligatorias en nombres, interfaces, reportes, contratos, pruebas y procedimientos.

---

#### 5. Principios obligatorios

1. **Trazabilidad por diseño:** todo efecto material deberá producir evidencia suficiente durante la misma operación o mediante un mecanismo transaccionalmente vinculado.
2. **Proporcionalidad:** se registrará lo necesario para reconstruir y controlar el hecho, sin duplicar secretos, documentos ni payloads completos.
3. **Atribución verificable:** actor, servicio, dispositivo, sesión y contexto efectivo se distinguirán sin confiar solo en texto libre.
4. **Historia no destructiva:** una corrección no reescribirá silenciosamente el hecho anterior.
5. **Tiempo explícito:** ocurrencia, recepción, persistencia y sincronización no se confundirán.
6. **Correlación extremo a extremo:** procesos, recursos, eventos, comandos, reintentos e integraciones conservarán vínculos resolubles.
7. **Política versionada:** toda retención, hold y disposición usará una política identificable y vigente para el hecho.
8. **Finalidad y minimización:** retener para auditoría no autoriza conservar cualquier dato ni usarlo para otra finalidad.
9. **No permanencia por defecto:** ninguna categoría se conservará indefinidamente por ausencia de decisión.
10. **No eliminación por defecto:** una categoría sin política resoluble no se eliminará automáticamente; quedará bloqueada y escalada.
11. **Hold prevalente:** una suspensión válida bloquea disposición, pero no amplía acceso ni finalidad.
12. **Disposición demostrable:** la eliminación deberá producir evidencia, tratar copias y evitar resurrección posterior.
13. **Restauración segura:** recuperar un backup no podrá reactivar datos ya dispuestos, accesos revocados o políticas obsoletas.
14. **Separación de deberes:** creación de política, aprobación, hold, liberación, ejecución y certificación se segregarán cuando el riesgo lo exija.
15. **Acceso a auditoría auditado:** consultar, exportar o alterar evidencia de auditoría será también un hecho auditable.

---

#### 6. Unidad de trazabilidad

La unidad primaria será el `process_instance_id` vinculado con un `process_id` estable y su versión. Cada proceso podrá contener múltiples recursos y eventos, pero deberá poder reconstruirse como una secuencia causal.

```text
process_id
process_version
process_instance_id
        ↓
resource_type + resource_id + resource_version
        ↓
event_id + event_type + event_version
        ↓
correlation_id + causation_id
        ↓
evidence_refs[]
```

No se aceptará como trazabilidad completa una colección de timestamps y usuarios sin vínculo con proceso, recurso, transición, resultado y motivo.

---

#### 7. Sobre canónico de evento auditable

`NFR-AUDIT-EVENT-ENVELOPE-001` deberá permitir, según aplicabilidad, los siguientes campos:

```text
event_id
event_type
event_version
event_class
occurred_at
occurred_timezone
recorded_at
received_at
committed_at
synchronized_at
clock_source
clock_skew_status
process_id
process_version
process_instance_id
resource_type
resource_id
resource_version
parent_resource_ref
command_id
request_id
correlation_id
causation_id
idempotency_key
attempt_number
action
outcome
previous_state
new_state
reason_code
reason_detail_ref
actor_type
authenticated_subject_ref
effective_actor_ref
service_actor_ref
simulated_actor_ref
effective_role_ref
site_id
area_id
shift_id
checkin_ref
device_id
session_id
application_id
service_id
channel
network_mode
offline_sequence
policy_versions
classification
retention_policy_id
retention_policy_version
hold_status
evidence_refs[]
integrity_reference
corrects_event_id
supersedes_event_id
external_system_ref
external_event_ref
ingestion_status
```

Reglas:

- los identificadores deberán ser estables y no depender del nombre visible;
- los campos no aplicables se omitirán o marcarán con una razón tipada, no con datos inventados;
- `reason_detail_ref` evitará introducir texto sensible completo dentro del evento;
- el sobre podrá materializarse en distintas estructuras físicas, pero su semántica será común;
- secretos, tokens, PIN, credenciales y payloads completos no se incorporarán al evento;
- la ausencia de actor humano deberá declarar actor de servicio, sistema, tercero o procedimiento manual;
- las versiones de contrato y política deberán permitir interpretar eventos históricos después de cambios del sistema.

---

#### 8. Clases de trazabilidad

| Clase                     | Nombre                       | Cobertura mínima                                                                                           |
| ------------------------- | ---------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `T0_CONTROL_CRITICAL`     | control crítico              | seguridad, acceso, inocuidad, salud, dinero, custodia, permisos, configuración crítica, hold y disposición |
| `T1_BUSINESS_STATE`       | estado empresarial           | creación, transición, aprobación, rechazo, entrega, recepción, pago, producción, inventario y cierre       |
| `T2_DECISION_EXCEPTION`   | decisión o excepción         | override, corrección, reverso, cancelación, excepción, autorización especial y motivo                      |
| `T3_ACCESS_DISCLOSURE`    | acceso o divulgación         | consulta sensible, revelado, descarga, exportación, impresión, compartición y acceso administrativo        |
| `T4_INTEGRATION_SYNC`     | integración y sincronización | emisión, recepción, reintento, deduplicación, conflicto, dead-letter, conciliación y resultado externo     |
| `T5_EVIDENCE_DOCUMENT`    | evidencia y documento        | carga, versión, firma, sustitución, anulación, vínculo, consulta y preservación                            |
| `T6_TECHNICAL_SUPPORT`    | soporte técnico              | diagnóstico mínimo, incidente, cambio operativo, ejecución privilegiada y recuperación                     |
| `T7_AGGREGATED_REFERENCE` | referencia agregada          | métricas o señales sin detalle individual cuando el hecho completo reside en otra fuente autorizada        |

`T7_AGGREGATED_REFERENCE` no podrá reemplazar las clases `T0` a `T5` cuando se requiera reconstruir un hecho individual.

---

#### 9. Acciones obligatoriamente auditables

Como mínimo deberán auditarse:

1. autenticación, cierre, bloqueo, recuperación y revocación relevantes;
2. decisiones de autorización sensibles, denegaciones y uso de excepción;
3. cambios de rol, permiso, alcance, matriz, contexto, política o configuración;
4. altas, bajas, activaciones, suspensiones y cierres de identidades empresariales;
5. creación, transición, aprobación, rechazo y cierre de procesos;
6. cambios de inventario, ubicación, lote, custodia, cantidad y disposición física;
7. movimientos de dinero, pagos, devoluciones, caja, cartera y conciliaciones;
8. emisión, sustitución, anulación y firma de documentos o evidencia;
9. creación, modificación y publicación de maestros, productos, recetas y costos;
10. acceso, revelado, descarga, exportación, impresión y compartición de `S3` o `S4`;
11. operaciones masivas y acciones administrativas privilegiadas;
12. correcciones, reversos, cancelaciones, anulaciones y reaperturas;
13. cambios de retención, hold, liberación, archivo, anonimización y disposición;
14. eventos offline, reintentos, conflictos, cuarentenas y conciliaciones;
15. integraciones, webhooks, callbacks, deduplicaciones y fallas externas;
16. acceso de soporte a datos, evidencia, backups o ambientes no productivos;
17. restauraciones, migraciones y reprocesamientos que alteren historia o estado;
18. fallas de auditoría, pérdida de correlación o imposibilidad de determinar resultado.

---

#### 10. Historial, corrección y verdad vigente

Cada dominio distinguirá:

```text
ESTADO VIGENTE AUTORITATIVO
+
HISTORIAL DE EVENTOS
+
EVIDENCIA DE SOPORTE
+
RELACIÓN DE CORRECCIÓN O SUSTITUCIÓN
```

Una corrección deberá conservar:

- valor o estado anterior cuando sea legítimo y necesario;
- valor o estado nuevo;
- motivo tipado;
- actor y autoridad;
- fecha de ocurrencia y fecha de registro;
- relación con el evento corregido;
- efecto sobre procesos dependientes;
- evidencia y aprobación cuando aplique;
- versión de la regla utilizada.

Se prohíbe:

- sobrescribir historial para “dejarlo limpio”;
- eliminar un hecho válido porque fue revertido;
- modificar timestamps originales durante conciliación;
- reutilizar el mismo identificador para un hecho distinto;
- representar una anulación como si el hecho nunca hubiera ocurrido.

---

#### 11. Modelo temporal

Todo hecho relevante deberá distinguir, según aplicabilidad:

| Tiempo            | Significado                                                  |
| ----------------- | ------------------------------------------------------------ |
| `occurred_at`     | momento declarado en que ocurrió el hecho empresarial        |
| `recorded_at`     | momento en que el actor o dispositivo lo registró            |
| `received_at`     | momento en que el servicio lo recibió                        |
| `committed_at`    | momento en que quedó persistido autoritativamente            |
| `synchronized_at` | momento en que una operación offline fue conciliada          |
| `effective_at`    | momento desde el cual una decisión o política produce efecto |
| `expired_at`      | momento en que deja de estar vigente                         |

Reglas:

- se almacenará una referencia temporal inequívoca y la zona horaria aplicable;
- UTC podrá usarse para persistencia, conservando la interpretación local de negocio;
- el reloj del dispositivo será evidencia declarada, no autoridad absoluta;
- desviaciones relevantes deberán marcarse y no corregirse silenciosamente;
- ordenar por `created_at` únicamente no será suficiente para reconstruir una operación offline;
- la retención se computará desde el evento definido por la política, no necesariamente desde la creación técnica.

---

#### 12. Actor, identidad y contexto

La auditoría distinguirá:

- sujeto autenticado;
- identidad empresarial vinculada;
- actor efectivo;
- rol base y rol operativo efectivo;
- simulación o actuación por delegación;
- servicio, job o integración técnica;
- dispositivo, sesión y canal;
- sede, área, turno y check-in aplicables;
- tercero o procedimiento manual que originó el hecho.

En dispositivos compartidos:

```text
MISMO DISPOSITIVO
≠ MISMO ACTOR
≠ MISMO TURNO
≠ MISMA ÁREA
≠ MISMA SESIÓN
```

Un cambio de actor deberá cerrar o aislar el contexto anterior. La atribución no podrá basarse en la última persona que usó el equipo.

---

#### 13. Decisiones automáticas, asistentes y acciones de sistema

Cuando un proceso automático produzca un efecto empresarial deberá registrarse:

- regla, versión o job que actuó;
- iniciador humano o evento causal, si existe;
- datos de entrada referenciados y minimizados;
- decisión producida;
- límites, umbrales o configuración vigente;
- resultado y fallas;
- posibilidad y autoridad de revisión humana;
- corrección posterior y su relación causal.

Una predicción, recomendación o sugerencia no se registrará como decisión final hasta que el proceso correspondiente la acepte o ejecute.

---

#### 14. Correlación entre aplicaciones, servicios e integraciones

Cada traspaso conservará una cadena resoluble:

```text
COMANDO ORIGEN
→ EVENTO EMPRESARIAL
→ OUTBOX
→ ENTREGA / REINTENTO
→ INBOX / DEDUPLICACIÓN
→ EFECTO DESTINO
→ RESPUESTA O CONCILIACIÓN
```

Se conservarán:

- identificadores internos y externos;
- versión de contrato;
- correlación y causalidad;
- idempotencia;
- intento y resultado;
- timestamps de emisión y recepción;
- transformación aplicada;
- campos descartados por minimización;
- error tipado y ruta de reparación;
- evidencia de deduplicación o compensación.

El identificador de un tercero no reemplazará el identificador canónico de Vento ni se reutilizará entre ambientes.

---

#### 15. Trazabilidad offline y sincronización

`NFR-REQ-004` queda complementada por estas reglas:

- cada dispositivo mantendrá una secuencia local por actor y contexto cuando la operación lo requiera;
- la reconexión no reemplazará el tiempo original por el tiempo de sincronización;
- un reintento conservará el mismo `idempotency_key` y aumentará `attempt_number`;
- un conflicto generará evento de detección, decisión y resolución;
- una operación `UNKNOWN`, `QUARANTINED` o `RECONCILIATION_REQUIRED` no se presentará como completada;
- la conciliación conservará versiones local, remota y decisión final;
- cambiar actor, área, sesión o dispositivo no transferirá outbox ni evidencia;
- desinstalar, limpiar almacenamiento o restablecer el dispositivo seguirá una política de custodia y pérdida declarada;
- una cola local sensible heredará la política de retención y borrado de su contenido;
- la falta de espacio, reloj inválido o versión de esquema deberá quedar trazada.

---

#### 16. Evidencia, documentos y cadena de custodia

Todo objeto de evidencia deberá poder declarar:

```text
evidence_id
evidence_type
source
creator_or_collector
collected_at
received_at
resource_ref
process_instance_id
classification
content_hash
metadata_hash
version
custodian
storage_ref
access_history_ref
integrity_status
retention_policy_id
hold_status
supersedes_evidence_id
disposition_status
```

La arquitectura física, validación de archivos, malware, URLs firmadas y preservación pertenecerán a `EVID-ARC-001` a `EVID-ARC-010`. La taxonomía documental, autenticidad, hash, firma y cadena de custodia se completarán en `INFO-DOM-003` a `INFO-DOM-007`.

Esta tarea fija que:

- un adjunto sin procedencia no demostrará un hecho;
- reemplazar un archivo no eliminará la versión anterior cuando deba preservarse;
- la consulta o descarga de evidencia sensible será auditable;
- hash e integridad no sustituyen autorización, contexto ni cadena de custodia;
- capturas, fotos, audio y video conservarán clasificación, finalidad y política.

---

#### 17. Contrato de política de retención

Cada categoría retenible deberá resolver una política versionada con:

```text
retention_policy_id
retention_policy_version
information_category
record_or_event_scope
process_scope
classification
information_owner
custodian
purpose
obligation_refs[]
retention_trigger
active_retention_rule
inactive_retention_rule
archive_rule
minimum_period
maximum_period
review_frequency
disposition_method
anonymization_rule
hold_eligibility
backup_treatment
copy_and_derivative_treatment
third_party_treatment
jurisdiction_or_territory
exception_route
effective_at
superseded_at
approval_refs[]
```

Reglas:

- toda duración deberá expresar unidad, evento inicial y condición de cierre;
- no se aceptará “X años” sin indicar desde cuándo se cuentan;
- el mínimo protege obligaciones; el máximo limita conservación excesiva;
- una política nueva no alterará retroactivamente hechos sin regla de transición;
- el acceso frecuente no reiniciará automáticamente el cómputo;
- copiar o exportar no creará un plazo independiente por defecto;
- la política deberá considerar metadatos, adjuntos, índices, cachés y derivados;
- la ausencia de obligación jurídica confirmada no autoriza inventar un plazo;
- `INFO-DOM-006` materializará tablas de retención y plazos definitivos con sus fundamentos.

---

#### 18. Clases iniciales de ciclo de retención

Estas clases describen comportamiento, no duración jurídica:

| Clase                     | Uso                                                                | Regla                                                                          |
| ------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `RET_TRANSIENT`           | datos técnicos o temporales                                        | eliminar al cumplir finalidad y ventana operativa aprobada                     |
| `RET_ACTIVE_CASE`         | expediente o proceso activo                                        | conservar mientras el caso permanezca abierto y durante su transición aprobada |
| `RET_BUSINESS_CYCLE`      | ciclo operativo, contable, laboral o logístico                     | computar desde cierre, conciliación, vencimiento o hito definido               |
| `RET_RELATIONSHIP`        | relación con trabajador, cliente, proveedor o tercero              | computar desde terminación, última obligación o cierre aplicable               |
| `RET_OBLIGATION`          | conservación contractual, fiscal, laboral, sanitaria o regulatoria | duración y evento fijados por tabla aprobada y fundamento verificable          |
| `RET_ARCHIVAL`            | evidencia histórica con valor aprobado                             | acceso restringido, integridad, revisión periódica y disposición definida      |
| `RET_HOLD`                | suspensión temporal de disposición                                 | prevalece mientras el hold esté vigente; no es una política permanente         |
| `RET_PERMANENT_EXCEPTION` | conservación permanente excepcional                                | exige justificación, propietario, aprobación y revisión periódica              |
| `RET_UNRESOLVED`          | política faltante o contradictoria                                 | bloquea disposición automática y genera brecha con destino `INFO-DOM-006`      |

`RET_UNRESOLVED` no será un estado aceptable para certificar un paquete E5.

---

#### 19. Eventos que inician el cómputo

La política deberá elegir un trigger tipado, por ejemplo:

- creación o recepción;
- fecha efectiva;
- publicación o sustitución;
- cierre del proceso o expediente;
- conciliación final;
- pago o liquidación completa;
- entrega o recepción confirmada;
- vencimiento o consumo;
- terminación de relación;
- cierre de incidente o investigación;
- retiro de consentimiento cuando aplique;
- liberación de hold;
- última obligación pendiente;
- disposición física del activo, lote o producto.

Si existen múltiples triggers, la política deberá declarar precedencia y regla de cómputo. No se elegirá automáticamente el timestamp más reciente para prolongar retención.

---

#### 20. Estados del ciclo de vida

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

```text
HOLD_ACTIVE
PRESERVATION_REQUIRED
DISPOSITION_BLOCKED
DISPOSITION_FAILED
POLICY_UNRESOLVED
```

Toda transición deberá registrar política, versión, actor o job, motivo, fecha, alcance y resultado. `HOLD_ACTIVE` podrá aplicarse desde cualquier estado previo a la disposición efectiva.

---

#### 21. Legal hold y preservación excepcional

Un hold deberá declarar:

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

- el alcance será explícito por recursos, expedientes, personas, periodos o categorías;
- un hold bloqueará eliminación, anonimización destructiva y rotación incompatible;
- no concederá acceso adicional ni cambiará clasificación;
- se propagará a copias y derivados gobernados que formen parte del alcance;
- se revisará periódicamente y no permanecerá abierto sin propietario;
- la liberación será una acción separada, aprobada y auditable;
- las políticas normales se recalcularán desde el trigger que corresponda después de la liberación;
- una solicitud informal por chat no constituirá hold vigente sin materialización controlada.

La autoridad, fundamento y procedimiento definitivo pertenecen a `INFO-DOM-006`, `INFO-DOM-010`, `INFO-DOM-012` e `INFO-DOM-013`.

---

#### 22. Archivo

Archivar significará trasladar un registro fuera del uso operativo ordinario conservando:

- identificador estable;
- contexto y metadatos suficientes;
- clasificación y acceso;
- integridad y legibilidad;
- política y trigger;
- búsqueda autorizada;
- relación con el recurso original;
- formato y versión interpretables;
- migraciones de formato o almacenamiento auditadas;
- disposición futura.

Se prohíbe usar como archivo:

- un backup no indexado;
- una carpeta personal;
- un bucket sin política;
- una exportación manual sin custodio;
- una tabla legacy abandonada;
- un dispositivo o correo individual.

---

#### 23. Disposición, eliminación y anonimización

Toda disposición deberá seguir:

```text
ELEGIBILIDAD CALCULADA
→ VERIFICACIÓN DE HOLD Y EXCEPCIONES
→ MANIFIESTO DE ALCANCE
→ APROBACIÓN SEGÚN RIESGO
→ EJECUCIÓN IDEMPOTENTE
→ VERIFICACIÓN DE COPIAS Y DERIVADOS
→ CERTIFICADO O EVIDENCIA
→ PROTECCIÓN CONTRA RESURRECCIÓN
```

El manifiesto deberá incluir:

- política y versión;
- trigger y fecha de elegibilidad;
- recursos afectados;
- copias, adjuntos, índices y derivados conocidos;
- terceros afectados;
- método de disposición;
- excepciones y fallas;
- ejecutor y aprobador;
- conteos antes y después;
- evidencia de verificación;
- referencia al tombstone mínimo cuando aplique.

Reglas:

- eliminación lógica no será disposición final si el contenido sigue accesible;
- anonimización deberá impedir razonablemente reidentificación bajo el contrato aprobado;
- fallas parciales producirán `DISPOSITION_FAILED`, nunca éxito silencioso;
- reintentos serán idempotentes;
- una disposición no borrará la evidencia mínima necesaria para demostrar que ocurrió;
- la evidencia de disposición no conservará el contenido eliminado;
- la eliminación de un recurso no romperá integridad referencial sin tratamiento aprobado;
- las disposiciones masivas o `S3`/`S4` exigirán segregación reforzada.

---

#### 24. Copias, cachés, búsquedas y derivados

La política deberá identificar, como mínimo:

- fuente autoritativa;
- réplicas y vistas;
- índices de búsqueda;
- cachés de servidor y cliente;
- almacenamiento offline;
- thumbnails y previsualizaciones;
- exportaciones y archivos temporales;
- eventos y colas;
- data warehouse, métricas y datasets;
- adjuntos y copias transformadas;
- ambientes no productivos;
- terceros y subencargados;
- backups.

Una eliminación del origen no se considerará completa hasta que exista tratamiento definido para cada copia gobernada. Cuando una copia no pueda eliminarse inmediatamente, deberá quedar inaccesible, expirar según política y no reutilizarse.

---

#### 25. Backups, restauración y no resurrección

`NFR-REQ-010` definirá RTO, RPO y arquitectura de respaldo. Quedará restringida por estas reglas:

- los backups tendrán política propia y acceso excepcional;
- no se usarán para consulta ordinaria ni archivo histórico;
- datos dispuestos podrán persistir cifrados hasta la expiración técnica aprobada del backup;
- durante ese periodo no podrán restaurarse para uso ordinario;
- toda restauración ejecutará un ledger de disposiciones, holds, revocaciones y políticas posteriores al punto restaurado;
- una restauración deberá volver a aplicar eliminaciones y anonimización antes de abrir acceso;
- probar recuperación no autoriza conservar backups indefinidamente;
- exportaciones de respaldo manuales deberán quedar inventariadas o prohibidas.

```text
RESTAURAR BACKUP ANTIGUO
+
NO REAPLICAR DISPOSICIONES
=
RESURRECCIÓN DE DATOS
=
CONTROL INVÁLIDO
```

---

#### 26. Auditoría frente a logs y observabilidad

La auditoría empresarial deberá estar separada lógicamente de logs de aplicación y diagnósticos volátiles.

| Señal                    | Retención y uso                                         |
| ------------------------ | ------------------------------------------------------- |
| evento empresarial       | según proceso, obligación y política de evidencia       |
| evento de auditoría      | según riesgo, investigación y política aprobada         |
| log técnico              | ventana mínima necesaria para soporte y seguridad       |
| trace distribuida        | muestreo y duración limitados; sin payload sensible     |
| métrica agregada         | retención por utilidad analítica y riesgo de inferencia |
| dump o sesión de soporte | excepcional, altamente restringida y con expiración     |

`NFR-REQ-009` definirá instrumentación, búsqueda y alertas, pero no podrá ampliar payload, acceso o duración sin política aprobada.

---

#### 27. Consultas, exportaciones y acceso a auditoría

Toda consulta de auditoría deberá aplicar:

- autorización de servidor;
- finalidad y caso;
- rango temporal y población mínimos;
- filtros y paginación;
- enmascaramiento;
- límites de exportación;
- marca de clasificación;
- registro de quién consultó o exportó;
- expiración de archivos generados;
- protección frente a búsquedas exploratorias masivas.

Una persona autorizada para operar un proceso no estará autorizada automáticamente para consultar su historial completo, eventos de seguridad o datos de otros actores.

---

#### 28. Terceros e integraciones externas

Antes de transferir información deberá declararse:

- política de retención del receptor;
- devolución o eliminación al terminar la finalidad;
- subencargados y ubicaciones;
- evidencia de disposición o imposibilidad;
- tratamiento de backups;
- hold o requerimiento de autoridad;
- incidentes y acceso excepcional;
- exportaciones posteriores;
- terminación contractual.

La eliminación interna no podrá presentarse como eliminación global si permanecen copias legítimas o no controladas en terceros. El estado deberá distinguir `DISPOSED_INTERNAL`, `THIRD_PARTY_PENDING` y `DISPOSED_VERIFIED` cuando aplique.

---

#### 29. Datos no productivos, soporte y pruebas

Datos productivos transformados para staging, soporte o pruebas deberán tener:

- finalidad y propietario;
- alcance mínimo;
- transformación aplicada;
- fecha de expiración;
- política de retención propia;
- bloqueo de mensajes y efectos reales;
- evidencia de eliminación;
- trazabilidad de copias y accesos.

Una copia temporal para resolver un incidente no heredará automáticamente el plazo completo del origen. Deberá eliminarse al cerrar la finalidad, salvo hold o obligación documentada.

---

#### 30. Perfil inicial por familias de proceso

| Familia                             | Procesos                                                              | Trazabilidad mínima                                                        | Trigger de retención orientativo                               |
| ----------------------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------- |
| gobierno, riesgo y autoridades      | `VPROC-0001` a `VPROC-0004`; `VPROC-0063`; `VPROC-0064`; `VPROC-0069` | decisión, aprobación, versión, evidencia, acceso y divulgación             | cierre de decisión, obligación, investigación o requerimiento  |
| talento y ciclo laboral             | `VPROC-0005` a `VPROC-0011`; `VPROC-0065`; `VPROC-0066`               | actor, relación laboral, cambios, aprobaciones, acceso y expediente        | terminación de relación y cierre de obligaciones aplicables    |
| SST, salud y emergencias            | `VPROC-0012` a `VPROC-0014`                                           | reporte, atención, evidencia, custodia, acceso y corrección                | cierre del caso o evento definido por tabla obligatoria        |
| maestros, recetas y producto        | `VPROC-0015` a `VPROC-0018`                                           | versión, aprobación, vigencia, sustitución y publicación                   | sustitución, retiro o fin de vigencia                          |
| proveedores y compras               | `VPROC-0019` a `VPROC-0022`                                           | solicitud, comparación, aprobación, recepción, diferencia y pago           | cierre de compra, contrato u obligación                        |
| inventario, activos y custodia      | `VPROC-0023` a `VPROC-0032`; `VPROC-0067`                             | movimiento, ubicación, cantidad, lote, custodio, ajuste y baja             | cierre de ciclo, disposición física o fin de custodia          |
| producción y calidad                | `VPROC-0033` a `VPROC-0037`                                           | orden, receta, lote, consumo, resultado, control y liberación              | cierre de lote, vencimiento o ventana de trazabilidad aprobada |
| venta, caja y clientes              | `VPROC-0038` a `VPROC-0047`; `VPROC-0068`                             | venta, pago, devolución, fidelización, consentimiento y reclamo            | cierre de transacción, relación o caso                         |
| logística y terceros                | `VPROC-0048` a `VPROC-0050`                                           | custodia, salida, recorrido, entrega, recepción y evidencia                | recepción final, cierre de diferencia o contrato               |
| finanzas y costos                   | `VPROC-0051` a `VPROC-0054`                                           | origen, cálculo, aprobación, asiento, pago y conciliación                  | cierre contable, fiscal o contractual aplicable                |
| instalaciones y marketing           | `VPROC-0055` a `VPROC-0057`                                           | orden, intervención, publicación, consentimiento y resultado               | cierre de trabajo, campaña o finalidad                         |
| tecnología y accesos                | `VPROC-0058`; `VPROC-0059`                                            | solicitud, aprobación, privilegio, cambio, incidente y revocación          | revocación, cierre de incidente o política de seguridad        |
| documentos, analítica y continuidad | `VPROC-0060` a `VPROC-0062`                                           | procedencia, versión, transformación, consulta, restauración y disposición | trigger de la fuente o política específica aprobada            |

Los triggers son orientativos y no sustituyen las tablas definitivas de `INFO-DOM-006`. Cada proceso deberá materializar una fila individual antes de su paquete E5.

---

#### 31. Matriz obligatoria por proceso

`NFR-PROCESS-TRACEABILITY-PROFILE-001` deberá cubrir exactamente `VPROC-0001` a `VPROC-0069` con:

- proceso, versión y propietario funcional;
- recursos y expedientes involucrados;
- hechos y transiciones auditables;
- clase de trazabilidad;
- actor y contexto requeridos;
- estados anterior y posterior;
- motivos y excepciones;
- correlación y causalidad;
- evidencias y documentos;
- accesos y divulgaciones auditables;
- integraciones y referencias externas;
- comportamiento offline;
- sensibilidad y minimización del evento;
- política de retención y trigger;
- archivo y búsqueda autorizada;
- elegibilidad de hold;
- disposición y anonimización;
- tratamiento de copias, terceros y backups;
- requisitos de integridad;
- pruebas y evidencia de certificación.

No se aceptará `no aplica` sin justificación, propietario y evidencia.

---

#### 32. Pruebas obligatorias

Cada capacidad aplicable deberá probar:

1. reconstrucción completa de una instancia de proceso;
2. actor, rol, sede, área, turno, dispositivo y sesión correctos;
3. acción automática con actor de servicio y causa;
4. transición ordinaria y transición rechazada;
5. corrección sin pérdida del hecho anterior;
6. cancelación, reverso, anulación y reapertura;
7. correlación entre aplicaciones;
8. reintento idempotente y deduplicación;
9. operación offline y timestamps múltiples;
10. conflicto y conciliación;
11. acceso sensible y exportación auditados;
12. consulta de auditoría también auditada;
13. evento sin secreto ni payload completo;
14. política versionada y trigger correcto;
15. cambio de política sin reinterpretación silenciosa;
16. cálculo de elegibilidad;
17. hold que bloquea disposición;
18. liberación de hold autorizada;
19. disposición parcial fallida;
20. reintento idempotente de disposición;
21. anonimización y evaluación de reidentificación;
22. eliminación de caché, índice, adjunto y derivado;
23. tercero pendiente y evidencia de eliminación;
24. backup que no se usa como archivo;
25. restauración con reaplicación de disposiciones;
26. tombstone sin conservar contenido eliminado;
27. datos de prueba con expiración;
28. migración que conserva historial e identificadores;
29. acceso privilegiado y soporte;
30. pérdida o corrupción de eventos;
31. reloj de dispositivo desviado;
32. versiones antiguas del sobre;
33. matriz completa de 69 procesos;
34. segregación en hold y disposición;
35. imposibilidad de certificar con política `RET_UNRESOLVED`.

Las pruebas se implementarán en los paquetes propietarios de E5, BLOQUE R, `EVID-ARC-*`, `INFO-DOM-*`, `OBS-ARC-*`, `QUEUE-ARC-*`, `AUTH-QA-*`, `UX-QA-*` y tareas por aplicación.

---

#### 33. Guardrails

```text
HECHO CRÍTICO SIN EVENTO AUDITABLE = 0
CORRECCIÓN QUE DESTRUYE HISTORIAL = 0
EVENTO CON SECRETO O TOKEN = 0
EVENTO SIN PROCESS_INSTANCE_ID CUANDO APLICA = 0
REINTENTO QUE DUPLICA EFECTO EMPRESARIAL = 0
DISPOSICIÓN CON HOLD ACTIVO = 0
RETENCIÓN INDEFINIDA POR AUSENCIA DE POLÍTICA = 0
ELIMINACIÓN AUTOMÁTICA CON POLÍTICA NO RESUELTA = 0
BACKUP USADO COMO ARCHIVO ORDINARIO = 0
RESTAURACIÓN QUE RESUCITA DATOS DISPUESTOS = 0
ACCESO A AUDITORÍA SIN AUDITORÍA = 0
PAQUETE E5 CERTIFICADO CON RET_UNRESOLVED = 0
```

Los umbrales operativos y alertas serán definidos por `NFR-REQ-009`. Estos valores representan prohibiciones de diseño.

---

#### 34. Propiedad de decisiones posteriores

| Decisión                                                             | Tarea propietaria                                            |
| -------------------------------------------------------------------- | ------------------------------------------------------------ |
| inventario y clasificación definitiva de información                 | `INFO-DOM-001`; `INFO-DOM-002`                               |
| taxonomía documental, versiones y metadatos                          | `INFO-DOM-003` a `INFO-DOM-005`                              |
| tablas, plazos, triggers, archivo, hold, anonimización y disposición | `INFO-DOM-006`                                               |
| autenticidad, hash, procedencia y cadena de custodia                 | `INFO-DOM-007`; `INFO-DOM-011`; `EVID-ARC-*`                 |
| avisos, derechos, requerimientos y terceros                          | `INFO-DOM-008` a `INFO-DOM-010`                              |
| obligaciones, investigaciones y auditoría de cumplimiento            | `INFO-DOM-012`; `INFO-DOM-013`                               |
| arquitectura de archivos y evidencia                                 | `EVID-ARC-001` a `EVID-ARC-010`                              |
| auditoría física en Supabase, índices, partición y crecimiento       | `SUPA-AUD-020`; `SUPA-ARC-021`; `SUPA-ARC-022`; BLOQUE R     |
| colas, outbox, inbox, reintentos y dead-letter                       | `QUEUE-ARC-*`; BLOQUE E4                                     |
| observabilidad, métricas, soporte y alertas                          | `NFR-REQ-009`; `OBS-ARC-*`                                   |
| backups, restauración, RTO y RPO                                     | `NFR-REQ-010`; `CONT-DOM-002` a `CONT-DOM-004`               |
| autorización de auditoría y evidencia                                | `AUTH-SRV-*`; `AUTH-DB-*`; `INFO-AUTH-001` a `INFO-AUTH-004` |
| experiencia de historial, archivo, hold y disposición                | `NFR-REQ-007`; `INFO-UX-002`; `INFO-UX-005`; `INFO-UX-006`   |
| paquetes y pruebas físicas                                           | `DELIV-PKG-*`; tareas por aplicación; BLOQUES T, R y U       |

No queda un pendiente narrativo sin destino. Esta tarea no fija plazos legales ni estructuras físicas fuera de sus tareas propietarias.

---

#### 35. Requisitos de prueba derivados

**Resultado:** GENERA REQUISITOS DE PRUEBA

Esta tarea aprobada incorpora al registro canónico completo:

```text
TREQ-PROC-355 a TREQ-PROC-389
```

Cobertura:

1. sobre auditable y versionado;
2. instancia de proceso y recurso;
3. atribución de actor y contexto;
4. decisiones automáticas;
5. tiempo de ocurrencia, recepción y sincronización;
6. historial no destructivo;
7. corrección, reverso y anulación;
8. correlación y causalidad;
9. idempotencia y deduplicación;
10. integraciones extremo a extremo;
11. offline y conciliación;
12. acceso y divulgación sensibles;
13. auditoría de la propia auditoría;
14. minimización de eventos;
15. evidencia y procedencia;
16. política de retención versionada;
17. triggers de cómputo;
18. mínimo y máximo de retención;
19. estados del ciclo de vida;
20. legal hold;
21. liberación de hold;
22. archivo y legibilidad;
23. elegibilidad de disposición;
24. segregación y aprobación;
25. eliminación y fallas parciales;
26. anonimización y reidentificación;
27. copias, cachés, índices y derivados;
28. terceros;
29. backups;
30. restauración y no resurrección;
31. datos no productivos;
32. migración de historial;
33. matriz de 69 procesos;
34. guardrails;
35. gobierno y certificación.

La evidencia de estas filas deberá indicar expresamente que proviene de `NFR-REQ-006` aprobada. Los identificadores no cambian.

---

#### 36. Criterios de aceptación

- [ ] Se distinguen hecho, evento, historial, auditoría, observabilidad, evidencia y procedencia.
- [ ] Se distinguen retención, archivo, hold, anonimización, disposición y backup.
- [ ] Todo efecto material puede vincularse con proceso, instancia, recurso, actor, contexto, resultado y política.
- [ ] El sobre de evento admite versiones, correlación, causalidad, idempotencia y tiempos múltiples.
- [ ] Las correcciones no destruyen historial.
- [ ] Las acciones automáticas y de terceros conservan atribución y causa.
- [ ] Offline y sincronización conservan orden, tiempo original, conflicto y conciliación.
- [ ] La auditoría minimiza datos y excluye secretos.
- [ ] Cada categoría retenible exige política versionada, trigger, mínimo, máximo y método de disposición.
- [ ] No existe retención indefinida ni eliminación automática por ausencia de política.
- [ ] Hold bloquea disposición sin ampliar acceso.
- [ ] Archivo conserva integridad, contexto, legibilidad y disposición futura.
- [ ] Disposición trata copias, derivados, terceros y fallas parciales.
- [ ] Restaurar backups reaplica disposiciones y evita resurrección.
- [ ] Consultar o exportar auditoría queda auditado.
- [ ] Cada uno de los 69 procesos tendrá perfil individual antes de implementación.
- [ ] Se incorporan `TREQ-PROC-355` a `TREQ-PROC-389` al registro completo con evidencia de tarea aprobada.
- [ ] Todos los pendientes se vinculan con tareas existentes y exactas.
- [ ] No se implementan código, migraciones, Supabase, Storage, jobs, políticas físicas ni despliegues.
- [ ] `NFR-REQ-007` permanece no iniciada.

---

#### 37. Estado y continuidad

```text
NFR-REQ-004   APROBADA
NFR-REQ-005   APROBADA
NFR-REQ-006   APROBADA
NFR-REQ-007   NO INICIADA
```

La aprobación explícita de esta tarea congelará el contrato no funcional inicial de trazabilidad y retención. No certificará que la implementación actual conserve todos los hechos, que los plazos jurídicos estén validados ni que existan mecanismos físicos de archivo, hold o disposición.


### ✅ NFR-REQ-007 — Definir accesibilidad y ergonomía

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `NFR-REQ-006 — Definir trazabilidad y retención` — APROBADA  
**Siguiente tarea reservada:** `NFR-REQ-008 — Definir hardware, red y periféricos requeridos` — NO INICIADA  
**Artefactos aprobados:** `NFR-ACCESSIBILITY-ERGONOMICS-CONTRACT-001`; `NFR-INTERACTION-TARGET-PROFILE-001`; `NFR-PROCESS-ACCESSIBILITY-PROFILE-001`; `NFR-ACCESSIBILITY-TEST-MATRIX-001`; `NFR-ACCESSIBILITY-EXCEPTION-REGISTER-001`  
**Procesos cubiertos:** `VPROC-0001` a `VPROC-0069`  
**Naturaleza:** contrato no funcional de accesibilidad digital, ergonomía física y cognitiva, interacción multimodal, compatibilidad asistiva, prevención y recuperación de errores y validación con personas reales; no certificación jurídica, médica, laboral, de hardware ni de conformidad externa  
**Cambios en código, migraciones, Supabase, aplicaciones, componentes, hardware, estaciones o despliegues:** no autorizados

---

#### 1. Propósito

Definir un contrato verificable para que cada proceso, pantalla, documento, estación, mensaje, formulario, control y resultado de Vento OS pueda ser percibido, comprendido y operado por las personas que realmente lo utilizan, bajo sus condiciones físicas, cognitivas, sensoriales, ambientales y tecnológicas.

```text
UNA FUNCIÓN EXISTE TÉCNICAMENTE
≠ UNA PERSONA PUEDE ENCONTRARLA
≠ PUEDE COMPRENDERLA
≠ PUEDE OPERARLA
≠ PUEDE RECUPERARSE DE UN ERROR

CUMPLIR UN CHECKLIST AUTOMÁTICO
≠ SER ACCESIBLE
≠ SER ERGONÓMICO
≠ SER SEGURO EN OPERACIÓN REAL

INTERFAZ MÁS SIMPLE
≠ MENOS CONTROL
≠ MENOS TRAZABILIDAD
≠ OCULTAR INFORMACIÓN NECESARIA
```

La aprobación de esta tarea congela la línea base no funcional. No declara que las aplicaciones actuales sean accesibles, que una estación física sea ergonómica ni que exista certificación frente a una norma externa.

---

#### 2. Continuidad lógica

`NFR-REQ-001` a `NFR-REQ-006` definieron criticidad, capacidad, tiempo, operación offline, privacidad, trazabilidad y retención. `NFR-REQ-007` determina cómo esas obligaciones deberán llegar a una persona sin crear barreras, confusión, fatiga, errores evitables ni dependencia de una única capacidad sensorial o motriz.

```text
PROCESO + ACTOR + CONTEXTO
        ↓
INFORMACIÓN Y ACCIÓN NECESARIAS
        ↓
MODALIDAD PERCEPTIBLE Y OPERABLE
        ↓
INTERACCIÓN COMPRENSIBLE Y ERGONÓMICA
        ↓
PREVENCIÓN + RECUPERACIÓN DE ERROR
        ↓
VALIDACIÓN CON PERSONAS Y ESTACIÓN REAL
```

`NFR-REQ-008` detallará hardware, red y periféricos. `NFR-REQ-011` definirá compatibilidad mínima por dispositivo. `UX-STATION-002` a `UX-STATION-012` diseñarán la estación e interacción concreta. `PROC-SCREEN-001` a `PROC-SCREEN-028` diseñarán las pantallas. `UX-QA-001` a `UX-QA-030` y los paquetes correspondientes implementarán y certificarán escenarios. Ninguna de esas tareas podrá reducir la línea base aprobada aquí.

---

#### 3. Alcance

El contrato aplica a:

- aplicaciones web, móviles, tablet, kiosco, POS y superficies de escritorio;
- software con funcionalidad cerrada o dependiente de una estación específica;
- pantallas administrativas, operativas, públicas y de cliente;
- autenticación, PIN, cambio de actor, simulación y dispositivo compartido;
- navegación, formularios, tablas, filtros, búsquedas, gráficos y reportes;
- estados, alertas, errores, bloqueos, confirmaciones, tiempos y recuperación;
- lectura, tacto, teclado, mouse, escáner, cámara, voz, audio y respuesta háptica;
- documentos, archivos, exportaciones, impresiones, etiquetas, códigos y evidencias;
- operación online, offline, degradada, en sincronización, con error y en contingencia;
- trabajo de pie, sentado, móvil, con una mano, manos ocupadas, guantes o restricciones temporales;
- ruido, baja iluminación, reflejos, humedad, grasa, vibración, frío, calor y distancia de lectura;
- necesidades visuales, auditivas, motrices, cognitivas, neurológicas, del habla y asociadas al envejecimiento;
- limitaciones permanentes, temporales o situacionales, sin exigir que una persona revele un diagnóstico.

La accesibilidad no se limitará al frontend. Contratos, orden semántico, mensajes, estados, documentos, periféricos, autenticación y procedimientos de contingencia deberán conservar alternativas equivalentes.

---

#### 4. Referencia normativa y alcance de conformidad

La línea base digital será:

1. `WCAG 2.2` niveles `A` y `AA` para contenido y aplicaciones web, cuando el criterio sea aplicable.
2. `WCAG2ICT 2.2` como guía informativa para interpretar los criterios en software no web, documentos y aplicaciones móviles o nativas.
3. Reglas internas adicionales de Vento OS cuando la operación real exija objetivos táctiles mayores, menor carga cognitiva, más tolerancia al error, interacción con guantes, manos ocupadas, ruido, movimiento o funcionalidad cerrada.

```text
LÍNEA BASE EXTERNA
+ PERFIL OPERATIVO INTERNO
+ PRUEBA EN DISPOSITIVO Y ESTACIÓN REAL
+ VALIDACIÓN CON PERSONAS
= CRITERIO DE ACEPTACIÓN DE VENTO OS
```

Una tarea podrá declarar un criterio externo `NO_APLICA` únicamente con análisis documentado. `NO_APLICA` no equivale a `NO IMPLEMENTADO`. La aprobación documental no autoriza publicar una declaración de conformidad externa.

---

#### 5. Principios obligatorios

1. **Perceptible:** la información no dependerá de una sola modalidad sensorial.
2. **Operable:** toda función tendrá una forma de entrada compatible con el perfil aprobado.
3. **Comprensible:** lenguaje, estructura, estados y consecuencias serán predecibles.
4. **Robusto:** nombre, rol, valor, estado y cambios serán interoperables con tecnologías de asistencia cuando la plataforma lo permita.
5. **Equivalencia funcional:** una alternativa accesible deberá permitir completar el mismo resultado empresarial, no una versión incompleta.
6. **Accesibilidad por defecto:** el camino ordinario será accesible; no se relegará a una pantalla paralela desactualizada.
7. **Ergonomía contextual:** frecuencia, alcance, postura, ambiente, manos y riesgo determinarán la interacción.
8. **Prevención antes que corrección:** el diseño reducirá errores previsibles sin impedir la recuperación cuando ocurran.
9. **No dependencia de memoria:** la interfaz conservará contexto, instrucciones y datos ya conocidos.
10. **No penalización:** una necesidad de apoyo, mayor tiempo o modalidad alternativa no se tratará como bajo desempeño del trabajador.
11. **Privacidad equivalente:** tecnologías de asistencia y alternativas no expondrán datos adicionales.
12. **Seguridad proporcional:** accesibilidad no eliminará autorización, segregación, confirmación ni trazabilidad.
13. **Continuidad accesible:** carga, error, offline, sincronización y recuperación deberán ser accesibles, no solo el camino feliz.
14. **Validación humana:** automatización y checklist no sustituirán pruebas manuales ni uso real.
15. **Deuda con vencimiento:** toda excepción tendrá propietario, alternativa, riesgo, fecha y tarea de cierre.

---

#### 6. Modelo de necesidades

El diseño no dependerá de categorías médicas. Cada perfil se evaluará por capacidades y condiciones observables:

| Dimensión   | Preguntas mínimas                                                                           |
| ----------- | ------------------------------------------------------------------------------------------- |
| visión      | ¿requiere zoom, texto grande, contraste, lector de pantalla o reducción de reflejo?         |
| audición    | ¿la señal sonora tiene equivalente visual o háptico y puede distinguirse del ruido?         |
| motricidad  | ¿puede operarse sin precisión fina, arrastre obligatorio, multitacto o alcance excesivo?    |
| cognición   | ¿la acción, el estado, el lenguaje y la recuperación se comprenden sin memoria innecesaria? |
| habla       | ¿existe alternativa cuando una función use voz o comunicación oral?                         |
| temporal    | ¿el tiempo disponible admite extensión, pausa o recuperación sin pérdida?                   |
| situacional | ¿funciona con guantes, una mano, manos húmedas, ruido, movimiento o luz adversa?            |
| tecnológica | ¿funciona con teclado, tacto, mouse, accesibilidad de plataforma y dispositivo objetivo?    |

No se recopilarán diagnósticos para justificar una mejora de interfaz. Cuando sea necesario gestionar una adaptación individual, su información pertenecerá a TALENTO y privacidad, no a telemetría ordinaria de producto.

---

#### 7. Perfiles de interacción

`NFR-INTERACTION-TARGET-PROFILE-001` define perfiles iniciales acumulativos:

| Perfil            | Uso                                                 | Reglas mínimas                                                                      |
| ----------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `A11Y-WEB-AA`     | web y backoffice                                    | WCAG 2.2 A/AA aplicable, teclado, foco, semántica, reflow y errores                 |
| `A11Y-MOBILE-AA`  | móvil y tablet personal                             | línea base anterior adaptada a plataforma, orientación y texto del sistema          |
| `A11Y-CLOSED`     | kiosco, POS o estación cerrada                      | equivalentes integrados cuando no pueda instalarse tecnología de asistencia externa |
| `ERGO-TOUCH`      | operación táctil frecuente                          | objetivos táctiles ampliados, separación y prevención de pulsación accidental       |
| `ERGO-GLOVED`     | guantes, humedad o precisión reducida               | controles mayores, menor densidad, confirmación y alternativa a teclado fino        |
| `ERGO-HANDS-BUSY` | una mano o manos ocupadas                           | captura contextual, escáner o secuencia breve sin perder trazabilidad               |
| `ERGO-NOISY`      | cocina, barra, producción o despacho                | ninguna alerta depende solo de audio; prioridad visible y distinguible              |
| `ERGO-LOW-LIGHT`  | reflejo, baja luz o distancia                       | contraste, tamaño, brillo y ubicación validados físicamente                         |
| `ERGO-HIGH-RISK`  | dinero, inventario, acceso, seguridad o disposición | confirmación contextual, separación de acciones, resumen y recuperación segura      |

Cada proceso podrá combinar perfiles. Una aplicación no tendrá un único perfil global.

---

#### 8. Semántica y estructura programática

Todo componente deberá exponer, cuando la plataforma lo permita:

- nombre accesible único y comprensible;
- rol correcto;
- valor, estado, selección, expansión y disponibilidad;
- relaciones entre etiqueta, instrucción, error y control;
- agrupación, encabezados, regiones y orden de lectura;
- acción disponible y resultado del cambio;
- mensajes de estado sin obligar a mover el foco;
- idioma principal y cambios de idioma relevantes.

Un `div`, ícono, color o texto visual no sustituirá un control semántico. Un componente personalizado no se aprobará hasta demostrar equivalencia con el componente nativo o estándar que reemplaza.

---

#### 9. Navegación, teclado y foco

1. Toda función web o administrativa deberá poder ejecutarse con teclado cuando la plataforma lo admita.
2. No existirá trampa de teclado ni foco inaccesible.
3. El orden de foco seguirá el orden lógico de trabajo, no la posición accidental del DOM.
4. El foco será visible, no quedará completamente oculto por encabezados, pies, modales o paneles.
5. Al abrir o cerrar un modal, cambiar de aplicación, actualizar una lista o resolver un error, el foco regresará a un punto lógico.
6. Atajos no serán la única vía, se documentarán y no interferirán con tecnologías de asistencia.
7. Una acción destructiva no se ejecutará por una sola tecla no modificada ni por foco accidental.
8. Saltos de navegación y regiones permitirán evitar bloques repetidos cuando sean aplicables.

---

#### 10. Objetivos táctiles y precisión

Se establecen tres clases internas, medidas en unidades lógicas equivalentes y verificadas en el dispositivo real:

| Clase          |                    Mínimo de diseño | Uso                                                                |
| -------------- | ----------------------------------: | ------------------------------------------------------------------ |
| `TARGET-MIN`   | `24 × 24` con separación suficiente | controles ordinarios no críticos y no frecuentes                   |
| `TARGET-TOUCH` |                           `44 × 44` | valor predeterminado para tablet, móvil, POS y kiosco táctil       |
| `TARGET-GLOVE` |                           `56 × 56` | guantes, humedad, vibración, movimiento o acción crítica frecuente |

Reglas:

- el área activable completa coincidirá con la representación visible o será mayor;
- controles vecinos con efectos opuestos tendrán separación y jerarquía inequívocas;
- el responsive no reducirá silenciosamente la clase aprobada;
- una fila completa podrá ser activable si nombre, foco y acciones secundarias permanecen claros;
- se medirá tasa de pulsación errónea en dispositivo real;
- `UX-STATION-002`, `UX-STATION-006`, `UX-STATION-008` y `NFR-REQ-011` podrán elevar el tamaño, nunca reducirlo sin excepción aprobada.

---

#### 11. Gestos, arrastre y mecanismos alternativos

- toda acción basada en arrastre tendrá alternativa de un solo puntero sin arrastre, salvo que el movimiento sea esencial;
- no se exigirá multitacto, presión, trayectoria precisa, sacudida o inclinación como única vía;
- swipe, long press y hover serán atajos, no funciones exclusivas;
- los gestos deberán poder cancelarse o revertirse antes de confirmar el efecto;
- escáner, cámara o lectura automática tendrán captura manual o procedimiento alterno controlado;
- una alternativa no podrá omitir identificación, autorización, cantidades, confirmación o evidencia.

---

#### 12. Texto, lenguaje e instrucciones

1. El idioma ordinario será español claro y operativo.
2. Términos técnicos, códigos y abreviaturas se explicarán cuando el actor no deba conocerlos.
3. La etiqueta describirá la acción o dato, no su posición visual.
4. Placeholder no sustituirá etiqueta persistente.
5. Instrucciones aparecerán antes de la decisión o dato al que aplican.
6. Fecha, hora, unidad, moneda, cantidad y precisión serán explícitas.
7. Mensajes evitarán culpa, ambigüedad y códigos técnicos sin traducción.
8. La acción principal y el siguiente paso serán identificables sin capacitación especializada.
9. Una interfaz no dependerá de recordar información mostrada en otra pantalla o aplicación.

---

#### 13. Presentación visual

La línea base exigirá:

- contraste mínimo `4.5:1` para texto ordinario;
- contraste mínimo `3:1` para texto grande y componentes o estados visuales esenciales;
- ningún significado transmitido solo por color, posición, forma, sonido o animación;
- texto redimensionable hasta `200 %` sin pérdida de contenido ni función;
- reflow hasta el ancho equivalente a `320 CSS px` cuando aplique, sin scroll en dos dimensiones salvo contenido esencial;
- compatibilidad con orientación vertical y horizontal salvo restricción operativa esencial documentada;
- ausencia de texto importante incrustado únicamente en imágenes;
- iconos acompañados por etiqueta o nombre accesible cuando su significado no sea universal;
- modo de alto contraste y preferencias de plataforma sin ocultar estados o foco.

Tablas o superficies densas podrán requerir una vista especializada, pero no reducirán tipografía, objetivos o contexto hasta hacerlos ilegibles.

---

#### 14. Movimiento, parpadeo y actualización automática

- no se usarán destellos por encima de límites seguros ni animaciones que impidan operar;
- movimiento, parpadeo, carrusel o actualización automática no esencial podrá pausarse, detenerse u ocultarse;
- animación por interacción respetará la preferencia de reducción de movimiento;
- progreso, sincronización y carga se informarán sin bucles visuales invasivos;
- una actualización de lista no robará foco, cambiará selección ni desplazará la acción que se está ejecutando;
- alertas repetidas se agruparán y conservarán prioridad sin fatiga de notificación.

---

#### 15. Audio, háptica y señales sensoriales

Toda señal material tendrá al menos dos modalidades cuando el contexto lo exija:

```text
SONIDO
+ ESTADO VISUAL
+ OPCIONALMENTE HÁPTICA
```

- campanas, alarmas y confirmaciones tendrán significado visual persistente;
- información hablada tendrá equivalente textual;
- audio no iniciará automáticamente de forma intrusiva;
- volumen y vibración respetarán la plataforma cuando no comprometan seguridad;
- color o vibración no serán la única diferencia entre prioridades;
- una impresora, escáner o datáfono no se considerará exitoso solo por sonido o luz física.

---

#### 16. Formularios, captura y entrada redundante

1. Los campos conocidos se conservarán o precargarán desde la fuente autorizada.
2. No se solicitará de nuevo información disponible en la misma instancia salvo confirmación, seguridad o cambio explícito.
3. Agrupación, formato y unidad serán visibles antes de escribir.
4. Autocompletado y teclado adecuado se usarán cuando no comprometan privacidad.
5. El sistema conservará datos válidos después de un error.
6. Los formatos tolerarán variaciones razonables y normalizarán de forma explícita.
7. Lectura por escáner o cámara mostrará el valor interpretado antes del efecto cuando exista riesgo.
8. La entrada por voz no será obligatoria.
9. Copiar y pegar no se bloqueará salvo riesgo documentado y alternativa accesible.

---

#### 17. Errores y recuperación

Todo error deberá indicar:

```text
QUÉ OCURRIÓ
+ QUÉ CAMPO, RECURSO O PASO AFECTA
+ POR QUÉ NO PUEDE CONTINUAR
+ QUÉ DEBE HACER LA PERSONA
+ QUÉ INFORMACIÓN SE CONSERVÓ
+ DÓNDE OBTENER AYUDA
```

Reglas:

- el error se asociará programáticamente al control o región;
- se mostrará resumen cuando existan múltiples errores;
- el foco irá al primer problema lógico sin perder contexto;
- no se borrarán entradas válidas;
- errores de autorización, conectividad, validación y conflicto se distinguirán;
- códigos técnicos podrán conservarse como referencia secundaria, no como explicación principal;
- una persona podrá salir y volver sin crear una segunda intención ni perder evidencia.

---

#### 18. Prevención de errores críticos

Para dinero, inventario, producción, acceso, datos sensibles, publicación, disposición o acciones irreversibles se exigirá, según riesgo:

- resumen previo de recurso, cantidad, unidad, sede, área, actor y consecuencia;
- confirmación contextual, no un diálogo genérico;
- separación física y visual entre acción principal y destructiva;
- autorización y segregación independientes de la interfaz;
- posibilidad de cancelar antes del commit;
- deshacer, corregir, compensar o escalar después, según contrato;
- detección de duplicado, valor atípico, unidad incompatible o recurso incorrecto;
- evidencia de quién confirmó y con cuál contexto.

No se usará fricción indiscriminada para operaciones frecuentes de bajo riesgo.

---

#### 19. Tiempo, sesión y autenticación

- una tarea no perderá datos por timeout sin advertencia previa y recuperación;
- cuando sea seguro, la persona podrá extender o reanudar el tiempo;
- seguridad de dispositivo compartido podrá exigir cierre breve, pero conservará borrador protegido o mecanismo de recuperación;
- cuenta regresiva será perceptible y no dependerá solo de color;
- autenticación no exigirá recordar, transcribir o resolver una prueba cognitiva sin alternativa permitida;
- PIN, OTP, biometría, enlace o credencial tendrán instrucciones, errores y recuperación accesibles;
- pegar códigos y usar gestores de contraseñas se permitirá cuando la plataforma y política lo admitan;
- el cambio de actor no heredará foco, datos visibles ni borrador sensible de la persona anterior.

---

#### 20. Estado, carga, offline y sincronización

La persona deberá poder distinguir:

- estado empresarial actual;
- estado local o borrador;
- conectividad con backend;
- disponibilidad de periférico;
- acción en progreso;
- resultado confirmado;
- resultado desconocido;
- pendiente de sincronización;
- conflicto o revisión requerida.

Cada cambio material tendrá texto y anuncio programático cuando corresponda. Spinner, color verde o desaparición del botón no serán evidencia suficiente. La interfaz bloqueará doble activación sin ocultar el estado ni atrapar el foco.

---

#### 21. Carga cognitiva y jerarquía de tarea

1. Cada superficie operativa tendrá una acción principal inequívoca por contexto.
2. Se mostrará primero lo necesario para decidir y actuar.
3. Información secundaria usará divulgación progresiva sin quedar inaccesible.
4. Estado, pendiente, excepción y siguiente paso estarán juntos cuando sea posible.
5. No se mezclarán administración, configuración y operación ordinaria.
6. Las opciones irrelevantes por rol, proceso o estado no se presentarán como disponibles.
7. Una secuencia larga se dividirá en pasos con progreso y posibilidad de revisión.
8. Nombres, iconos, ubicación y comportamiento serán consistentes entre aplicaciones.
9. Se evitarán interrupciones, modales y confirmaciones innecesarias.
10. El diseño no dependerá de capacitación para descubrir controles básicos.

---

#### 22. Ergonomía física y estación

Cada paso deberá evaluar:

- altura, postura, ángulo y distancia de lectura;
- alcance cómodo y repetición;
- uso sentado, de pie o en movimiento;
- una mano, dos manos, manos ocupadas o guantes;
- fuerza, precisión y duración de interacción;
- ubicación de escáner, cámara, impresora, báscula o datáfono;
- cables, energía, montaje, limpieza y protección;
- visibilidad para la persona autorizada y privacidad frente a terceros;
- riesgo de contacto con alimentos, humedad, grasa, calor o frío;
- fatiga acumulada durante picos y tareas repetitivas.

`NFR-REQ-007` no selecciona hardware. Los mínimos físicos se concretarán en `UX-STATION-002` a `UX-STATION-009`, `NFR-REQ-008` y `NFR-REQ-011` mediante prototipos y medición real.

---

#### 23. Entorno adverso

| Condición              | Respuesta mínima                                                            |
| ---------------------- | --------------------------------------------------------------------------- |
| ruido                  | alertas visuales persistentes y prioridad legible                           |
| reflejo o baja luz     | contraste y brillo validados en ubicación real                              |
| humedad o grasa        | objetivos grandes, menor precisión y limpieza segura                        |
| guantes                | `TARGET-GLOVE`, alternativa a teclado fino y escáner evaluado               |
| movimiento o vibración | estabilizar selección, ampliar controles y evitar arrastre                  |
| distancia              | tipografía, estado y siguiente acción legibles desde la posición de trabajo |
| manos ocupadas         | captura contextual o periférico sin omitir confirmación crítica             |
| interrupciones         | reanudación con contexto y estado de la intención                           |

No se aprobará una modalidad solo porque funcione en un escritorio de desarrollo.

---

#### 24. Tablas, gráficos y datos densos

- tablas tendrán encabezados y relaciones semánticas;
- orden, filtro, selección y expansión serán anunciables;
- foco y selección sobrevivirán actualizaciones previsibles;
- gráficos tendrán título, resumen, valores o tabla equivalente;
- color no será la única codificación;
- zoom y texto grande no ocultarán filtros activos ni unidad;
- operaciones masivas mostrarán alcance, excepciones y consecuencia;
- móvil o tablet reordenará contenido, usará tarjetas o limitará de forma explícita la operación incompatible;
- exportar no será el único camino accesible para comprender el dato.

---

#### 25. Documentos, impresiones, etiquetas y códigos

1. Documentos generados conservarán estructura, idioma, títulos, encabezados, orden de lectura, texto alternativo y tablas cuando el formato lo permita.
2. Un PDF escaneado sin texto no será la única copia operativa.
3. La impresión conservará contenido esencial sin depender de color.
4. Etiquetas y códigos tendrán texto humano mínimo que permita identificar y recuperar la operación.
5. QR, DataMatrix, Code128 o lectura por cámara tendrán alternativa manual autorizada.
6. Un código ilegible no obligará a crear un recurso duplicado.
7. Evidencia visual tendrá descripción o metadatos suficientes según finalidad.
8. Documentos sensibles conservarán la protección de `NFR-REQ-005` y la trazabilidad de `NFR-REQ-006` también en su representación accesible.

---

#### 26. Privacidad, seguridad y accesibilidad

- nombres accesibles, labels, tooltips, anuncios y notificaciones no revelarán secretos o datos ocultos visualmente;
- masking visual deberá coincidir con el contenido expuesto a tecnologías de asistencia;
- lectores de pantalla no recibirán columnas o acciones fuera del permiso;
- una alternativa accesible no eludirá autorización ni segregación;
- capturas, grabaciones y pruebas no recopilarán datos personales innecesarios;
- preferencias de accesibilidad se tratarán como configuración mínima, no como diagnóstico;
- mensajes de privacidad, consentimiento y autorización serán comprensibles y operables;
- el modo de alto contraste o texto grande no expondrá contenido superpuesto de otro actor.

---

#### 27. Personalización y preferencias

Cuando la plataforma lo permita, se respetarán:

- tamaño de texto;
- zoom;
- alto contraste y colores del sistema;
- reducción de movimiento;
- lector de pantalla y navegación por interruptor;
- teclado externo;
- orientación;
- subtítulos y volumen;
- idioma y formatos regionales aprobados.

Una preferencia podrá persistirse por persona en dispositivo personal. En estación compartida deberá aplicarse después de identificar al actor, evitar exponer información personal y restablecerse al cerrar la sesión.

---

#### 28. Prohibición de sustitutos falsos

No se aceptará como solución suficiente:

- overlay o widget de accesibilidad que intente corregir una interfaz inaccesible;
- ruta paralela incompleta o desactualizada;
- ocultar controles a tecnologías de asistencia sin alternativa;
- texto alternativo genérico generado sin revisión;
- declaración de cumplimiento basada solo en Lighthouse u otra herramienta automática;
- exigir que la persona cambie de dispositivo para completar una tarea ordinaria sin análisis y alternativa;
- soporte humano como única forma de operar una función que debería ser autónoma;
- capacitar para memorizar una interfaz inconsistente en lugar de corregirla.

---

#### 29. Perfil por proceso

`NFR-PROCESS-ACCESSIBILITY-PROFILE-001` deberá contener exactamente una fila por `VPROC-0001` a `VPROC-0069` con:

```text
process_id
process_version
actor_and_context
critical_steps
station_and_device
frequency_and_duration
risk_class
sensory_demands
motor_demands
cognitive_demands
environmental_conditions
input_modalities
output_modalities
assistive_technology_expectations
target_profile
text_and_contrast_profile
timeout_policy
error_prevention
error_recovery
accessible_alternative
document_and_print_requirements
privacy_constraints
required_test_scenarios
responsible_tasks
status_and_evidence
```

Una fila global por aplicación no sustituirá el perfil del proceso. Un proceso con etapas materialmente diferentes podrá declarar subperfiles sin duplicar su identidad.

---

#### 30. Estrategia de pruebas

Cada paquete deberá combinar, según aplicabilidad:

1. validación estática de semántica y contratos;
2. pruebas automatizadas de regresión accesible;
3. navegación completa con teclado;
4. lector de pantalla en combinaciones objetivo;
5. zoom, reflow, texto grande, alto contraste y reducción de movimiento;
6. tacto en hardware real, incluyendo tasa de pulsación errónea;
7. condiciones de ruido, iluminación, guantes, movilidad y manos ocupadas;
8. error, timeout, offline, sincronización y recuperación;
9. documentos, impresión, escáner y periféricos;
10. validación con trabajadores reales y, cuando sea posible, personas con necesidades representativas.

La automatización detectará parte de los defectos, pero no certificará comprensibilidad, orden de trabajo, ergonomía ni equivalencia funcional.

---

#### 31. Métricas y guardrails

Se medirán por escenario:

- tasa de finalización;
- tiempo de tarea sin usarlo de forma punitiva;
- errores, pulsaciones incorrectas y reintentos;
- abandono y solicitud de ayuda;
- pérdida de foco o contexto;
- recuperación exitosa;
- lectura o interpretación incorrecta;
- fatiga, dolor o incomodidad reportada;
- diferencias entre dispositivo de laboratorio y estación real;
- defectos por severidad y tiempo de cierre.

Un diseño no se aprobará por reducir tiempo si aumenta error, fatiga, exclusión, riesgo o necesidad de asistencia.

---

#### 32. Severidad de defectos

| Severidad | Definición                                                                                           | Regla de salida                                  |
| --------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| `A11Y-P0` | impide una acción crítica, crea riesgo físico, financiero, de acceso o datos, sin alternativa segura | bloquea paquete y despliegue                     |
| `A11Y-P1` | impide completar una función principal a una población o modalidad soportada                         | bloquea certificación y piloto ampliado          |
| `A11Y-P2` | genera dificultad material, error recurrente o dependencia de ayuda con alternativa parcial          | exige tarea, responsable y fecha antes de cierre |
| `A11Y-P3` | mejora de calidad sin bloqueo material inmediato                                                     | puede planificarse con evidencia y prioridad     |

La severidad considerará impacto, frecuencia, población, riesgo y existencia real de alternativa, no solo número de usuarios observados.

---

#### 33. Excepciones

Toda excepción deberá registrar:

```text
exception_id
criterion_or_rule
process_and_step
users_and_modalities_affected
reason
risk
accessible_alternative
owner
approval
created_at
expires_at
closure_task
validation_evidence
```

No se aprobará una excepción indefinida. La incompatibilidad de un proveedor, periférico o sistema legacy generará una tarea de resolución y un procedimiento alterno verificable. Una barrera crítica sin alternativa bloqueará el proceso o la funcionalidad afectada.

---

#### 34. Propiedad de decisiones posteriores

| Decisión                             | Tarea propietaria                                 |
| ------------------------------------ | ------------------------------------------------- |
| modalidad por paso                   | `UX-STATION-002`                                  |
| perfil de estación                   | `UX-STATION-003`                                  |
| cambio de actor compartido           | `UX-STATION-004`; `AUTH-DEV-001` a `AUTH-DEV-016` |
| superficie contextual                | `UX-STATION-005`                                  |
| periféricos y montaje                | `UX-STATION-006`; `NFR-REQ-008`                   |
| contingencia y recuperación          | `UX-STATION-007`; `NFR-REQ-004`; `NFR-REQ-010`    |
| prototipo con trabajadores           | `UX-STATION-008`                                  |
| matriz final de estación             | `UX-STATION-009`                                  |
| gramática y lectura mínima           | `UX-STATION-010` a `UX-STATION-012`               |
| pantallas por proceso                | `PROC-SCREEN-001` a `PROC-SCREEN-028`             |
| compatibilidad por dispositivo       | `NFR-REQ-011`                                     |
| implementación y pruebas por paquete | `SHELL-CI-020` a `SHELL-CI-024`; paquetes E5      |
| certificación transversal            | `UX-QA-001` a `UX-QA-030`; BLOQUE U               |

Todo hallazgo deberá vincularse de inmediato con una de estas tareas o crear una nueva tarea explícita en el bloque correspondiente.

---

#### 35. Guardrails de cierre

Deberán fallar CI, revisión, readiness, piloto o certificación cuando aplique cualquiera de estas condiciones:

- control sin nombre, rol, estado o etiqueta resoluble;
- función principal inaccesible por teclado o modalidad aprobada;
- foco invisible, perdido o completamente oculto;
- significado transmitido solo por color, sonido o posición;
- objetivo táctil inferior al perfil aprobado;
- arrastre o gesto complejo sin alternativa;
- texto o interfaz inutilizable con zoom, reflow o texto grande;
- error sin identificación, preservación o recuperación;
- timeout que elimina trabajo sin advertencia;
- acción crítica sin resumen, separación o confirmación proporcional;
- estado offline, pendiente o desconocido no perceptible;
- alternativa accesible que reduce autorización, privacidad o trazabilidad;
- documento esencial sin estructura o alternativa;
- barrera `A11Y-P0` o `A11Y-P1` abierta sin alternativa aprobada;
- paquete sin perfil de proceso, matriz de pruebas y evidencia en dispositivo real.

---

#### 36. Requisitos de prueba derivados

Se incorporan al registro canónico completo:

```text
TREQ-PROC-390 a TREQ-PROC-424
```

Cobertura:

1. línea base y aplicabilidad de WCAG;
2. principios y equivalencia funcional;
3. semántica de componentes;
4. estructura y orden de lectura;
5. teclado y ausencia de trampas;
6. foco visible y no oculto;
7. objetivos táctiles por perfil;
8. alternativas a gestos y arrastre;
9. contraste y señales no dependientes de color;
10. zoom, texto grande, reflow y orientación;
11. lenguaje, etiquetas e instrucciones;
12. identificación y recuperación de errores;
13. prevención de errores críticos;
14. mensajes de estado y actualización;
15. tiempos, sesión y autenticación;
16. movimiento, parpadeo y reducción de movimiento;
17. audio, háptica y alternativas sensoriales;
18. carga cognitiva y acción principal;
19. entrada redundante y preservación de contexto;
20. postura, alcance y fatiga;
21. ruido, luz, humedad, guantes y movimiento;
22. frecuencia y clase de objetivo;
23. estación compartida y cambio de actor;
24. offline, sincronización y resultado desconocido;
25. autenticación accesible;
26. responsive y preferencias de plataforma;
27. tablas, gráficos y datos densos;
28. documentos, impresiones y etiquetas;
29. códigos, escáner y alternativa manual;
30. seguridad y privacidad equivalentes;
31. personalización sin exposición;
32. compatibilidad con dispositivos y tecnologías de asistencia;
33. pruebas con trabajadores y necesidades representativas;
34. evidencia, severidad y excepciones;
35. perfiles de 69 procesos y certificación.

La evidencia deberá indicar que proviene de `NFR-REQ-007` aprobada.

---

#### 37. Criterios de aceptación

- [ ] Se adopta WCAG 2.2 A/AA aplicable y WCAG2ICT como guía, sin declarar certificación externa.
- [ ] Se cubren necesidades visuales, auditivas, motrices, cognitivas, temporales, situacionales y tecnológicas.
- [ ] Se definen perfiles digitales, táctiles, cerrados y de entorno adverso.
- [ ] Nombre, rol, valor, estado, relaciones y mensajes son programáticamente determinables cuando aplica.
- [ ] Teclado, foco, gestos, objetivos táctiles y alternativas tienen reglas verificables.
- [ ] Contraste, color, zoom, reflow, orientación y reducción de movimiento tienen mínimos explícitos.
- [ ] Formularios preservan contexto y evitan entrada redundante.
- [ ] Errores indican cómo continuar y no destruyen trabajo válido.
- [ ] Acciones críticas aplican prevención proporcional y recuperación segura.
- [ ] Timeout, autenticación y cambio de actor son accesibles sin degradar seguridad.
- [ ] Offline, periféricos y resultado desconocido conservan estados perceptibles.
- [ ] La ergonomía considera postura, alcance, frecuencia, fatiga y ambiente real.
- [ ] Tablas, gráficos, documentos, impresiones y códigos tienen alternativas equivalentes.
- [ ] Accesibilidad no expone datos ni evade autorización o trazabilidad.
- [ ] Overlays, rutas paralelas incompletas y automatización aislada no se aceptan como conformidad.
- [ ] Los 69 procesos tendrán perfil individual antes de implementación.
- [ ] Las pruebas combinan automatización, revisión manual, tecnologías de asistencia, hardware y personas reales.
- [ ] Defectos `A11Y-P0` y `A11Y-P1` bloquean cierre según la regla aprobada.
- [ ] Toda excepción tiene propietario, alternativa, vencimiento y tarea de cierre.
- [ ] Se incorporan `TREQ-PROC-390` a `TREQ-PROC-424` al registro completo.
- [ ] No se implementan código, migraciones, Supabase, componentes, hardware ni despliegues.
- [ ] `NFR-REQ-008` permanece no iniciada.

---

#### 38. Estado y continuidad

```text
NFR-REQ-005   APROBADA
NFR-REQ-006   APROBADA
NFR-REQ-007   APROBADA
NFR-REQ-008   NO INICIADA
```

La aprobación explícita de esta tarea congela el contrato no funcional inicial de accesibilidad y ergonomía. No certifica las aplicaciones actuales, los dispositivos, las estaciones ni la conformidad frente a normas o legislación externa.
