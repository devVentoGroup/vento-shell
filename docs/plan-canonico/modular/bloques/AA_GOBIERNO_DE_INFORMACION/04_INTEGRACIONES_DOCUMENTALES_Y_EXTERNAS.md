### MINI-BLOQUE — INTEGRACIONES DOCUMENTALES Y EXTERNAS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **integraciones documentales y externas** dentro de **AA GOBIERNO DE INFORMACION**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INFO-INT-001` a `INFO-INT-003` — 3 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INFO-INT-001`: Definir adaptadores de Storage, escaneo, OCR, firma, certificación, preservación y archivo externo
- `INFO-INT-002`: Definir contratos con SHELL, Supabase, EVID-ARC, ANIMA, VISO, PASS y aplicaciones de dominio
- `INFO-INT-003`: Definir contratos con encargados, asesores, autoridades, proveedores y destinatarios externos
<!-- PLAN-SECTION-META:END -->

### ✅ INFO-INT-001 — Definir adaptadores de Storage, escaneo, OCR, firma, certificación, preservación y archivo externo

**Estado:** APROBADA
**Tarea anterior:** `INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva` — APROBADA
**Tarea siguiente:** `INFO-INT-002 — Diseñar integraciones con e-signature, email, object storage, SIEM/DLP, HRIS/finance cuando aplique` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de adaptadores neutrales para almacenamiento de objetos, captura por escaneo, OCR, firma, certificación, preservación y archivo externo, con contratos comunes de correlación, autoridad, evidencia, resultados parciales y reconciliación
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/AA_GOBIERNO_DE_INFORMACION/04_INTEGRACIONES_DOCUMENTALES_Y_EXTERNAS.md`
**Fase:** exclusivamente documental
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, endpoints, tablas, buckets, políticas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, secretos, credenciales, proveedores, contratos comerciales ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una frontera común y consumible para integrar capacidades documentales externas sin trasladar a un proveedor, SDK, bucket, dispositivo, motor OCR, servicio de firma, certificador, custodio o archivo externo la autoridad empresarial que pertenece a los contratos canónicos de VENTO.

La tarea convierte siete familias técnicas heterogéneas en adaptadores con semántica uniforme para que una fase posterior pueda vincular implementaciones concretas sin reescribir las reglas de identidad, autorización, clasificación, versión, retención, legal hold, preservación, evidencia, auditoría ni propiedad funcional.

Principio rector:

```text
ADAPTADOR
= FRONTERA TÉCNICA NORMALIZADA
+ CORRELACIÓN
+ RESULTADO EXPLÍCITO
+ EVIDENCIA
+ RECONCILIACIÓN

ADAPTADOR
≠ AUTORIDAD EMPRESARIAL
≠ PROPIETARIO FUNCIONAL
≠ FUENTE DE VERDAD DE NEGOCIO
≠ APROBACIÓN
≠ FIRMA POR INFERENCIA
≠ CERTIFICACIÓN POR INFERENCIA
≠ DISPOSICIÓN AUTORIZADA
```

La disponibilidad técnica de una operación nunca basta para ejecutarla. La intención empresarial, el recurso exacto, la versión aplicable, la autorización, la finalidad, la clasificación y las restricciones vigentes deben estar resueltas antes de producir un efecto protegido.

---

#### 2. Resultado sustantivo

Se materializan nueve artefactos lógicos coordinados:

1. `INFO-EXTERNAL-ADAPTER-CORE-CONTRACT-001` — contrato transversal de operación, correlación, resultados, evidencia y reconciliación.
2. `INFO-STORAGE-ADAPTER-CONTRACT-001` — contrato neutral para persistencia y recuperación de representaciones en almacenamiento de objetos.
3. `INFO-SCAN-CAPTURE-ADAPTER-CONTRACT-001` — contrato neutral para captura digital por escaneo.
4. `INFO-OCR-ADAPTER-CONTRACT-001` — contrato neutral para extracción OCR como derivado no autoritativo.
5. `INFO-SIGNATURE-ADAPTER-CONTRACT-001` — contrato neutral para solicitar, consultar y reconciliar actos de firma.
6. `INFO-CERTIFICATION-ADAPTER-CONTRACT-001` — contrato neutral para generar, consultar o verificar evidencia de certificación cuando aplique.
7. `INFO-PRESERVATION-ADAPTER-CONTRACT-001` — contrato neutral para preservación de fuentes y evidencia.
8. `INFO-EXTERNAL-ARCHIVE-ADAPTER-CONTRACT-001` — contrato neutral para ingestión, recuperación y disposición gobernada en archivo externo.
9. `INFO-EXTERNAL-ADAPTER-CAPABILITY-MATRIX-001` — matriz de capacidades, autoridad requerida, resultado técnico y decisiones que cada adaptador tiene prohibido asumir.

Balance heredado preservado:

| Control                                         |     Resultado |
| ----------------------------------------------- | ------------: |
| Procesos `VPROC-*` cubiertos por referencia     |   **69 / 69** |
| Identidades `DOCCTX-*` cubiertas por referencia | **332 / 332** |
| Procesos nuevos                                 |         **0** |
| Identidades documentales nuevas                 |         **0** |
| Identidades omitidas del universo aplicable     |         **0** |
| Reclasificaciones                               |         **0** |
| Cambios de propietaria funcional                |         **0** |
| Estados empresariales nuevos                    |         **0** |
| Proveedores concretos seleccionados             |         **0** |
| Cambios físicos                                 |         **0** |

La cobertura por referencia es deliberada: esta tarea define capacidades de adaptación transversales y no vuelve a materializar el inventario empresarial ya aprobado. Cada recurso que atraviese un adaptador conserva su identidad canónica, proceso, propietaria funcional, clasificación, finalidad, versión, retención, restricciones y relaciones vigentes.

---

#### 3. Entradas canónicas consumidas

Los adaptadores consumen sin redefinir:

- el universo de 69 procesos y 332 identidades documentales aprobado por el gobierno de información;
- la separación entre propietaria funcional, custodia, responsable, encargado, proveedor, repositorio y territorio;
- la clasificación corporativa `S0_PUBLIC` a `S4_HIGHLY_RESTRICTED`, incluida propagación, minimización y tratamiento de derivados;
- el ciclo documental, versionado, vigencia, integridad y procedencia ya aprobados;
- las reglas de retención, archivo, legal hold, disposición y certificado de disposición;
- la preservación de fuentes antes de correcciones que puedan alterarlas;
- la auditoría no destructiva y la separación entre evento empresarial, log técnico, evidencia e investigación;
- la autorización por identidad, actor efectivo, capacidad, recurso, clasificación, finalidad, relación, territorio, estado y política de campos;
- la separación entre consulta, descarga, impresión, exportación, compartición y accesos temporales;
- la segregación del ciclo de vida documental y la independencia de las acciones investigativas;
- las experiencias documentales y administrativas ya aprobadas, sin convertir esta tarea en diseño de interfaz.

Un adaptador puede transportar, transformar, almacenar o consultar una representación, pero no puede reinterpretar estas decisiones.

---

#### 4. Distinciones obligatorias

```text
RECURSO EMPRESARIAL
≠ OBJETO TÉCNICO
≠ REPRESENTACIÓN
≠ COPIA
≠ DERIVADO OCR
≠ EVIDENCIA PRESERVADA
≠ ELEMENTO ARCHIVADO
```

```text
AUTORIZACIÓN
≠ DISPONIBILIDAD DEL ADAPTADOR
≠ CREDENCIAL TÉCNICA
≠ TOKEN
≠ LOCALIZADOR TEMPORAL
≠ RESPUESTA DEL PROVEEDOR
```

```text
APROBACIÓN DOCUMENTAL
≠ ENVÍO A FIRMA
≠ FIRMA COMPLETADA
≠ CERTIFICACIÓN
≠ SELLO O RECIBO TÉCNICO
```

```text
PRESERVACIÓN
≠ COPIA ORDINARIA
≠ ARCHIVO OPERATIVO
≠ BACKUP
≠ LEGAL HOLD
≠ RETENCIÓN
```

```text
ÉXITO TÉCNICO
≠ ÉXITO EMPRESARIAL
```

Estas separaciones son invariantes de diseño y deberán sobrevivir a cualquier selección posterior de tecnología.

---

#### 5. `INFO-EXTERNAL-ADAPTER-CORE-CONTRACT-001`

Toda operación de adaptación deberá representarse mediante un sobre lógico común. Los campos son contractuales; una implementación posterior podrá expresarlos con tipos o estructuras concretas sin cambiar su significado.

| Campo lógico                        | Regla                                                                                |
| ----------------------------------- | ------------------------------------------------------------------------------------ |
| `adapter_operation_ref`             | identidad estable de la intención técnica dentro de la integración                   |
| `correlation_ref`                   | referencia que une intención, intento, respuesta, callbacks y reconciliación         |
| `idempotency_ref`                   | referencia de idempotencia cuando la operación permita o exija reintentos seguros    |
| `capability_code`                   | capacidad exacta solicitada; no se infiere desde un rol o proveedor                  |
| `canonical_resource_ref`            | recurso empresarial exacto afectado o consultado                                     |
| `canonical_version_or_snapshot_ref` | versión o snapshot exacto cuando el acto depende de contenido inmutable              |
| `process_ref`                       | proceso `VPROC-*` aplicable                                                          |
| `principal_ref`                     | principal técnico o de sesión cuando sea relevante                                   |
| `effective_actor_ref`               | actor humano efectivo cuando corresponda                                             |
| `purpose_ref`                       | finalidad empresarial que justifica la operación                                     |
| `effective_classification`          | clasificación vigente o propagada que limita el tratamiento                          |
| `projection_or_payload_scope`       | población, campos, páginas, bytes lógicos o representación mínima autorizada         |
| `territory_or_transfer_constraints` | restricciones territoriales o de transferencia cuando apliquen                       |
| `retention_hold_preservation_flags` | condiciones que bloquean o restringen mutaciones destructivas                        |
| `input_source_refs[]`               | fuentes o representaciones exactas consumidas                                        |
| `expected_outcome`                  | efecto técnico esperado sin convertirlo en estado empresarial                        |
| `adapter_result_status`             | resultado técnico normalizado                                                        |
| `provider_operation_ref`            | referencia externa cuando exista y pueda conservarse de forma segura                 |
| `evidence_refs[]`                   | recibos, respuestas, manifiestos o evidencias mínimas producidas                     |
| `attempt_ref`                       | identidad del intento técnico                                                        |
| `reconciliation_ref`                | referencia del proceso de conciliación cuando el resultado inicial no sea definitivo |
| `source_time_ref`                   | tiempo aportado por una fuente cuando exista; no se fabrica desde la interfaz        |

Reglas:

1. ninguna operación se crea únicamente desde parámetros suministrados por cliente sin resolver el recurso y la autoridad desde fuentes canónicas;
2. el `canonical_resource_ref` no se sustituye por nombre de objeto, nombre de archivo, clave técnica o localizador externo;
3. la versión exacta es obligatoria para firma, certificación, preservación y cualquier acción cuya validez dependa del contenido presentado;
4. el adaptador conserva trazabilidad entre intención, intentos y resultado final;
5. secretos, credenciales, tokens reutilizables y contenido sensible completo no forman parte de la evidencia ordinaria;
6. una respuesta externa solo se promueve a hecho empresarial mediante la lógica propietaria correspondiente;
7. la clasificación de un derivado nunca disminuye por el formato o servicio que lo produjo;
8. una operación que genere una nueva representación conserva procedencia hacia su fuente;
9. una operación destructiva exige ausencia de bloqueos aplicables además de la autoridad específica;
10. toda operación no concluyente entra a reconciliación antes de que una repetición pueda producir un efecto duplicado o irreversible.

---

#### 6. Estados normalizados de resultado técnico

Los adaptadores comparten cuatro estados de salida técnica:

| Estado              | Significado                                                                                     | Consecuencia                                                         |
| ------------------- | ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `CONFIRMED_SUCCESS` | existe evidencia suficiente de que la operación técnica terminó con el efecto esperado          | permite que la capa propietaria evalúe su transición empresarial     |
| `CONFIRMED_FAILURE` | existe evidencia suficiente de que la operación no produjo el efecto esperado                   | no se presenta como éxito ni se oculta la causa normalizada          |
| `PARTIAL_RESULT`    | una parte material del efecto ocurrió y otra no puede considerarse completada                   | exige reconciliación y evita repetir ciegamente el conjunto completo |
| `UNKNOWN_RESULT`    | timeout, pérdida de respuesta, callback incompleto u otra condición impide conocer el resultado | exige reconciliación antes de cualquier reintento no idempotente     |

Estos valores son estados del adaptador, no estados de firma, aprobación, certificación, archivo, preservación o disposición.

Prohibiciones:

- `UNKNOWN_RESULT` nunca se traduce a fracaso seguro solo para permitir reintentar;
- `PARTIAL_RESULT` nunca se traduce a éxito global;
- la aceptación de una solicitud por un proveedor no equivale a finalización;
- un callback aislado no desplaza la necesidad de verificar correlación, recurso, versión y estado;
- un reintento no debe crear un segundo acto de firma, una segunda certificación, una segunda disposición o una segunda transferencia irreversible cuando el primer resultado es desconocido.

---

#### 7. Reconciliación e idempotencia

La reconciliación es una capacidad transversal obligatoria cuando el resultado no sea definitivo.

Orden lógico:

```text
INTENCIÓN AUTORIZADA
→ OPERACIÓN CORRELACIONADA
→ INTENTO
→ RESPUESTA O AUSENCIA DE RESPUESTA
→ CLASIFICACIÓN DEL RESULTADO
→ RECONCILIACIÓN SI ES NECESARIA
→ RESULTADO TÉCNICO FINAL
→ EVALUACIÓN DEL EFECTO EMPRESARIAL POR SU PROPIETARIO
```

La reconciliación podrá consumir, según disponibilidad:

- `adapter_operation_ref`;
- `correlation_ref`;
- `provider_operation_ref`;
- evidencia o recibo externo;
- estado consultable del proveedor;
- referencia de recurso y versión;
- historial de intentos;
- evidencia de callback ya recibida.

No se fija un número universal de reintentos, timeout o periodo de polling porque esas decisiones dependen de la implementación concreta y de las garantías del proveedor. Sí queda fijada la regla de seguridad: **un resultado incierto precede a la reconciliación y no a la repetición ciega**.

---

#### 8. `INFO-STORAGE-ADAPTER-CONTRACT-001`

El adaptador de Storage representa almacenamiento técnico de objetos o representaciones. No convierte un contenedor, objeto, clave, prefijo o localizador en identidad empresarial.

Capacidades lógicas:

| Capacidad                  | Propósito                                              | Regla de autoridad                                                                  |
| -------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------- |
| `STORAGE_PUT`              | persistir una representación autorizada                | exige recurso, versión, clasificación, finalidad y destino compatibles              |
| `STORAGE_GET`              | recuperar una representación                           | exige autorización de lectura sobre el recurso exacto y proyección permitida        |
| `STORAGE_METADATA`         | consultar metadata técnica necesaria                   | no concede contenido ni revela recursos no autorizados                              |
| `STORAGE_COPY`             | crear una copia gobernada                              | la copia hereda procedencia, clasificación y restricciones de la fuente             |
| `STORAGE_DELETE`           | eliminar una representación técnica                    | exige autoridad destructiva y ausencia de retención, hold o preservación bloqueante |
| `STORAGE_TEMPORARY_ACCESS` | emitir o resolver acceso temporal a una representación | el mecanismo temporal no crea autoridad empresarial ni amplía el destinatario       |

Reglas:

1. la clave técnica de objeto permanece separada del `canonical_resource_ref`;
2. una bandera técnica pública no equivale a clasificación `S0_PUBLIC`;
3. una copia no se vuelve fuente de verdad por existir en otra ubicación;
4. una eliminación técnica no equivale al cierre empresarial de disposición;
5. el adaptador no decide retención, hold ni derecho de eliminación;
6. la metadata registrada se minimiza y no incorpora secretos o contenido innecesario;
7. un acceso temporal caducable sigue sujeto al recurso, versión, destinatario, finalidad y vigencia de la autorización que lo originó;
8. una falla o resultado incierto de eliminación obliga a reconciliar antes de asumir que el objeto desapareció o repetir la operación.

---

#### 9. `INFO-SCAN-CAPTURE-ADAPTER-CONTRACT-001`

El adaptador de escaneo transforma una fuente física o una representación de captura en una representación digital trazable. El escaneo por sí solo no declara autenticidad, originalidad jurídica, clasificación, firma ni certificación.

Entrada mínima resoluble:

- referencia de la fuente o expediente que justifica la captura;
- proceso y finalidad;
- operador o actor efectivo cuando aplique;
- clasificación esperada o regla de herencia;
- contexto de captura permitido;
- relación con la identidad documental destino cuando ya exista.

Salida lógica mínima:

- `capture_operation_ref`;
- referencia a la fuente capturada;
- representación digital producida;
- cantidad y orden de páginas cuando sean aportados por la captura;
- referencia de dispositivo o fuente técnica cuando esté disponible y sea necesaria;
- defectos o advertencias de calidad detectables;
- intento de captura;
- evidencia de procedencia;
- resultado técnico normalizado.

Reglas:

1. la captura crea una representación; no sustituye automáticamente el original;
2. un segundo escaneo crea un nuevo intento o una nueva representación vinculada, no sobrescribe la historia para ocultar el anterior;
3. rotación, recorte, compresión o normalización de imagen no eliminan la procedencia;
4. una página faltante, ilegible o fuera de orden se conserva como defecto explícito cuando pueda detectarse;
5. destruir o descartar la fuente física queda fuera de la autoridad del adaptador;
6. el resultado digital hereda como mínimo la protección de la fuente y puede elevarse por contenido;
7. el adaptador no convierte una captura en documento aprobado, firmado o certificado;
8. una captura parcial se representa como `PARTIAL_RESULT`, no como documento completo.

---

#### 10. `INFO-OCR-ADAPTER-CONTRACT-001`

OCR produce un derivado de lectura automática y no una reescritura autoritativa del documento fuente.

Capacidades lógicas:

| Capacidad       | Resultado                                                                       |
| --------------- | ------------------------------------------------------------------------------- |
| `OCR_EXTRACT`   | texto y estructura derivada desde una representación exacta                     |
| `OCR_STATUS`    | estado técnico de una extracción asíncrona cuando aplique                       |
| `OCR_RECONCILE` | conciliación de una extracción cuyo resultado inicial fue parcial o desconocido |

Cada resultado OCR deberá conservar:

- fuente y versión exactas;
- referencia de operación;
- texto derivado mínimo permitido;
- páginas o regiones de procedencia cuando la tecnología las proporcione;
- idioma, confianza o geometría únicamente cuando la fuente técnica los entregue;
- advertencias o páginas sin resultado;
- clasificación heredada o elevada;
- evidencia de intento y resultado.

Reglas:

1. el texto OCR no sobrescribe silenciosamente el documento fuente;
2. ningún campo empresarial se considera verificado por provenir de OCR;
3. la promoción de un dato OCR a un registro propietario exige una decisión explícita del flujo dueño de ese dato;
4. una confianza técnica no equivale a exactitud jurídica o empresarial;
5. ausencia de puntaje de confianza no se interpreta como confianza total;
6. la extracción se limita al contenido necesario para la finalidad autorizada;
7. logs y telemetría no duplican el texto completo salvo que exista autoridad y necesidad expresa;
8. el derivado conserva procedencia y protección de la fuente;
9. una extracción parcial mantiene identificables las partes no procesadas;
10. un cambio de fuente o versión exige una nueva extracción vinculada a esa versión.

---

#### 11. `INFO-SIGNATURE-ADAPTER-CONTRACT-001`

El adaptador de firma normaliza la interacción técnica con un mecanismo externo de firma sin confundir envío, aceptación técnica, visualización, firma, certificación o aprobación interna.

Capacidades lógicas:

| Capacidad             | Regla                                                                                  |
| --------------------- | -------------------------------------------------------------------------------------- |
| `SIGNATURE_CREATE`    | crea una solicitud técnica únicamente para una versión o snapshot exacto ya autorizado |
| `SIGNATURE_STATUS`    | consulta el estado técnico correlacionado del acto                                     |
| `SIGNATURE_EVIDENCE`  | recupera la evidencia disponible del acto completado                                   |
| `SIGNATURE_CANCEL`    | solicita cancelación cuando el contrato de negocio y proveedor lo permitan             |
| `SIGNATURE_RECONCILE` | determina el resultado tras timeout, callback incompleto o estado incierto             |

Cada intención de firma deberá poder vincular:

- documento y versión o snapshot exactos;
- proceso y finalidad;
- actor solicitante;
- firmante o sujeto esperado cuando la fuente canónica lo haya resuelto;
- autoridad o relación que justifica el acto;
- clasificación y restricciones de salida;
- operación externa correlacionada;
- evidencia de presentación o contenido firmado cuando el contrato aplicable lo requiera;
- resultado técnico y evidencia recibida.

Reglas:

1. enviar un documento a firma no equivale a aprobarlo;
2. una aceptación técnica del proveedor no equivale a firma completada;
3. una firma solo se atribuye a la versión o snapshot exacto presentado;
4. si el contenido material cambia, se requiere un nuevo acto; no se reutiliza la evidencia del acto anterior;
5. la identidad técnica del firmante no sustituye la autoridad empresarial necesaria;
6. un callback se trata como evidencia de integración que debe correlacionarse y verificarse;
7. un resultado desconocido se reconcilia antes de crear otro acto equivalente;
8. la cancelación técnica no borra la historia del intento ni su evidencia;
9. el adaptador no determina por sí mismo validez jurídica, aprobación interna o vigencia documental;
10. cualquier copia producida conserva clasificación, procedencia y restricciones de la fuente.

---

#### 12. `INFO-CERTIFICATION-ADAPTER-CONTRACT-001`

El adaptador de certificación gestiona evidencias técnicas de certificación, atestación, sellado, constancia, recibo o verificación cuando una integración concreta disponga de esa capacidad.

Capacidades lógicas:

- `CERTIFICATION_CREATE`;
- `CERTIFICATION_STATUS`;
- `CERTIFICATION_EVIDENCE`;
- `CERTIFICATION_VERIFY`;
- `CERTIFICATION_RECONCILE`.

El contrato conserva:

- fuente, documento, representación o snapshot exacto;
- finalidad del acto;
- operación correlacionada;
- emisor o prestador cuando la integración concreta lo resuelva;
- evidencia producida;
- resultado de verificación cuando exista;
- referencia temporal solo cuando provenga de una fuente verificable;
- relación con la firma u otro acto, si existe, sin fusionar sus identidades.

Reglas:

1. certificación no equivale a aprobación;
2. certificación no equivale a firma salvo que un contrato canónico de firma lo demuestre de manera separada;
3. un sello, hash, recibo o timestamp técnico no se interpreta automáticamente como certificación jurídica;
4. esta tarea no fija algoritmo, estándar, autoridad certificadora ni proveedor;
5. una verificación `UNKNOWN_RESULT` o `CONFIRMED_FAILURE` no se presenta como certificación válida;
6. el adaptador conserva la evidencia original y no la sobrescribe para aparentar una verificación posterior exitosa;
7. cualquier nueva verificación se registra como acto correlacionado independiente;
8. el resultado solo alimenta el estado empresarial que su propietario esté autorizado a resolver.

---

#### 13. `INFO-PRESERVATION-ADAPTER-CONTRACT-001`

El adaptador de preservación protege una fuente o representación relevante para auditoría, investigación, cumplimiento u otra obligación antes de acciones que puedan alterarla, reducirla o destruirla.

Capacidades lógicas:

| Capacidad                | Propósito                                                               |
| ------------------------ | ----------------------------------------------------------------------- |
| `PRESERVATION_ACQUIRE`   | adquirir o inmovilizar una representación preservable                   |
| `PRESERVATION_STATUS`    | consultar la condición técnica del material preservado                  |
| `PRESERVATION_RETRIEVE`  | recuperar una representación preservada bajo autorización independiente |
| `PRESERVATION_RELEASE`   | solicitar liberación cuando la autoridad y el caso permitan hacerlo     |
| `PRESERVATION_RECONCILE` | resolver estados parciales o desconocidos                               |

Cada operación deberá conservar, según aplicabilidad:

- caso, auditoría, obligación o disparador que exige preservación;
- `canonical_resource_ref`;
- versión o snapshot de fuente;
- sistema o representación de origen;
- tiempo de adquisición cuando exista evidencia de fuente;
- custodio o servicio técnico que conserva la copia, cuando esté resuelto;
- evidencia de integridad disponible;
- restricciones de retención y legal hold;
- evidencia de acceso y transferencia;
- resultado técnico.

Reglas:

1. preservar precede a una corrección destructiva cuando esa corrección pueda alterar una fuente relevante;
2. la copia preservada no sustituye la fuente empresarial;
3. preservar no amplía acceso de investigadores, custodios o administradores;
4. recuperar evidencia preservada exige una capacidad distinta de preservarla;
5. liberar evidencia exige autoridad separada y no implica disposición automática;
6. un hold activo o una investigación vigente bloquea cualquier liberación incompatible;
7. una preservación parcial se representa como parcial y mantiene explícitas las fuentes faltantes;
8. un resultado desconocido bloquea cualquier afirmación de preservación completa hasta reconciliarse;
9. la corrección posterior de un recurso no modifica retrospectivamente la evidencia preservada;
10. el adaptador no elimina evidencia para reflejar el cierre de una investigación.

---

#### 14. `INFO-EXTERNAL-ARCHIVE-ADAPTER-CONTRACT-001`

El archivo externo es una capacidad de custodia y conservación. No adquiere propiedad funcional ni autoridad de negocio por recibir una representación.

Capacidades lógicas:

- `ARCHIVE_INGEST`;
- `ARCHIVE_STATUS`;
- `ARCHIVE_RETRIEVE`;
- `ARCHIVE_METADATA`;
- `ARCHIVE_DISPOSITION_REQUEST`;
- `ARCHIVE_RECONCILE`.

Manifiesto lógico mínimo de archivo:

```text
archive_operation_ref
canonical_resource_ref
canonical_version_or_snapshot_ref
process_ref
effective_classification
purpose_ref
retention_policy_ref
legal_hold_refs[]
preservation_refs[]
source_representation_ref
external_locator_ref_if_available
custody_ref_if_resolved
integrity_evidence_refs[]
provider_operation_ref_if_available
adapter_result_status
reconciliation_ref_if_required
```

Reglas:

1. el éxito de ingestión exige evidencia técnica suficiente y conciliación interna; una aceptación inicial no basta para suponer conservación completa;
2. el recurso fuente permanece protegido hasta que el flujo propietario confirme que cualquier cambio de custodia es válido;
3. una falla de archivo no autoriza destruir la fuente;
4. recuperar desde archivo conserva procedencia y no convierte la copia recuperada en una versión empresarial nueva por defecto;
5. retención, legal hold y preservación gobiernan cualquier disposición solicitada al archivo;
6. una orden externa de eliminación no se emite únicamente porque el proveedor permita ejecutarla;
7. el archivo conserva clasificación y restricciones aplicables a la fuente;
8. un localizador externo es una referencia técnica y no una autorización;
9. migrar entre custodios o proveedores futuros deberá conservar correlación y evidencia de origen/destino;
10. la disposición completa solo puede declararse después de reconciliar los sistemas y copias que el contrato empresarial obligue a incluir.

---

#### 15. `INFO-EXTERNAL-ADAPTER-CAPABILITY-MATRIX-001`

| Familia         | Capacidad                     | Autoridad empresarial previa                                                  | Resultado del adaptador                            | Decisión que el adaptador no puede asumir |
| --------------- | ----------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------- | ----------------------------------------- |
| Storage         | `STORAGE_PUT`                 | escribir representación exacta dentro de finalidad y clasificación permitidas | objeto persistido, fallido, parcial o incierto     | propiedad funcional o vigencia            |
| Storage         | `STORAGE_GET`                 | consultar representación exacta                                               | representación recuperada o resultado técnico      | derecho general de lectura                |
| Storage         | `STORAGE_DELETE`              | disposición/eliminación autorizada y ausencia de bloqueos                     | eliminación técnica confirmada, fallida o incierta | cierre de disposición                     |
| Storage         | `STORAGE_TEMPORARY_ACCESS`    | acceso temporal a recurso/version/destinatario autorizados                    | mecanismo temporal emitido o rechazado             | autorización empresarial                  |
| Captura         | `SCAN_CAPTURE`                | capturar fuente dentro del proceso y finalidad permitidos                     | representación digital y procedencia               | autenticidad, originalidad o aprobación   |
| OCR             | `OCR_EXTRACT`                 | procesar derivado autorizado de la fuente exacta                              | texto/estructura derivados                         | corrección de datos empresariales         |
| Firma           | `SIGNATURE_CREATE`            | iniciar firma del snapshot exacto por actor/relación autorizados              | solicitud correlacionada                           | aprobación interna o firma completada     |
| Firma           | `SIGNATURE_STATUS`            | consultar acto exacto                                                         | estado técnico reconciliado                        | validez jurídica                          |
| Firma           | `SIGNATURE_EVIDENCE`          | recuperar evidencia autorizada                                                | evidencia técnica vinculada                        | propiedad o vigencia documental           |
| Certificación   | `CERTIFICATION_CREATE`        | solicitar el acto permitido sobre versión exacta                              | operación y evidencia técnica                      | aprobación o firma                        |
| Certificación   | `CERTIFICATION_VERIFY`        | verificar evidencia exacta                                                    | verificación confirmada, fallida o incierta        | validez empresarial universal             |
| Preservación    | `PRESERVATION_ACQUIRE`        | preservar fuente dentro de caso/obligación autorizados                        | fuente preservada total, parcial o incierta        | derecho de lectura                        |
| Preservación    | `PRESERVATION_RETRIEVE`       | acceder a evidencia preservada con permiso específico                         | representación recuperada                          | cierre de investigación                   |
| Preservación    | `PRESERVATION_RELEASE`        | liberar preservación bajo autoridad independiente                             | liberación técnica                                 | disposición automática                    |
| Archivo externo | `ARCHIVE_INGEST`              | transferir custodia técnica dentro de política vigente                        | ingestión confirmada, fallida, parcial o incierta  | propiedad funcional                       |
| Archivo externo | `ARCHIVE_RETRIEVE`            | recuperar material archivado autorizado                                       | material y procedencia                             | promoción a versión vigente               |
| Archivo externo | `ARCHIVE_DISPOSITION_REQUEST` | disposición autorizada, sin hold o preservación incompatible                  | resultado técnico reconciliado                     | certificado empresarial de disposición    |

La matriz separa intención empresarial y capacidad técnica. La fase de integración concreta podrá mapear estas capacidades a operaciones de proveedor, pero no podrá reducir las condiciones de autoridad aquí establecidas.

---

#### 16. Cobertura transversal del universo de información

La aplicación de los contratos se define por referencia cerrada al universo canónico existente:

| Universo                    |     Cobertura | Decisión                                                                                                                                                                     |
| --------------------------- | ------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VPROC-0001` a `VPROC-0069` |   **69 / 69** | cualquier recurso de un proceso que atraviese una capacidad externa conserva proceso, finalidad y propietaria funcional; el adaptador no cambia esas dimensiones             |
| identidades `DOCCTX-*`      | **332 / 332** | cada identidad conserva clasificación, propietario, versión, retención, hold, preservación y restricciones; el adaptador opera únicamente sobre la representación autorizada |

No se crea una segunda tabla de 332 filas porque esta tarea no adopta una decisión distinta por identidad: la decisión es uniforme y cerrada para el conjunto completo. Si una identidad entra en una capacidad externa, conserva íntegramente su sobre de gobierno vigente y solo se añade la referencia de operación técnica correspondiente.

Reconciliación de cardinalidad:

```text
procesos esperados: 69
procesos cubiertos: 69
procesos faltantes: 0
identidades esperadas: 332
identidades cubiertas: 332
identidades faltantes: 0
identidades nuevas: 0
reclasificaciones: 0
cambios de propietaria: 0
```

---

#### 17. Clasificación, minimización y derivados

1. un adaptador recibe la clasificación efectiva resuelta; no la calcula desde extensión, proveedor, contenedor o canal;
2. una salida derivada conserva como mínimo la protección de la fuente y puede elevarse por inferencia o nueva sensibilidad;
3. OCR, thumbnails, previews, metadatos enriquecidos, certificados, recibos y copias no se consideran automáticamente menos sensibles;
4. se transmite al proveedor únicamente el conjunto necesario para la capacidad y finalidad autorizadas;
5. metadata técnica y observabilidad se minimizan por defecto;
6. el hecho de que un proveedor procese contenido no autoriza su reutilización para otra finalidad;
7. cualquier uso secundario requerirá autoridad independiente del contrato de adaptación;
8. los registros técnicos no duplican documentos completos salvo necesidad canónica demostrable;
9. un error no debe devolver contenido sensible completo cuando basta una referencia o código normalizado;
10. la implementación posterior deberá preservar la clasificación al cruzar límites de sistema y territorio.

---

#### 18. Territorio, terceros y transferencia

El adaptador no decide si un prestador es responsable, encargado, destinatario, subencargado, custodio o mero proveedor técnico. Esa clasificación se consume desde el gobierno canónico cuando una integración concreta sea seleccionada.

Antes de una operación que implique un tercero o territorio externo deberá poder resolverse, cuando aplique:

- entidad o prestador exacto;
- rol del tercero;
- finalidad;
- categorías mínimas de información;
- territorio de procesamiento o destino;
- mecanismo o condición de transferencia;
- restricciones de retención;
- subprocesamiento cuando sea relevante;
- autoridad de la operación;
- evidencia que debe conservarse.

Si una dimensión obligatoria permanece no resoluble, el adaptador no convierte la ausencia de evidencia en autorización.

---

#### 19. Evidencia y auditoría del adaptador

Toda operación protegida debe ser correlacionable sin convertir la auditoría en una réplica del contenido tratado.

Evidencia mínima, según capacidad:

- quién o qué principal inició la intención;
- actor efectivo cuando sea requerido;
- capacidad exacta;
- recurso y versión;
- finalidad;
- intento y correlación;
- resultado técnico normalizado;
- referencia externa cuando exista;
- evidencia o recibo relevante;
- condición parcial o desconocida;
- reconciliación posterior;
- efecto final conocido cuando llegue a resolverse.

Reglas:

1. correcciones de metadata de integración se registran de forma no destructiva;
2. evidencia de proveedor no se sobrescribe para ocultar una respuesta anterior;
3. una repetición conserva su propio `attempt_ref`;
4. la evidencia preservada tiene autorización independiente de la auditoría ordinaria;
5. el acceso administrativo al proveedor no concede acceso irrestricto a documentos, evidencia o logs;
6. los logs no contienen secretos reutilizables;
7. la visualización o extracción posterior de auditoría permanece bajo su autorización propia.

---

#### 20. Manejo de fallas y efectos parciales

Los adaptadores deberán distinguir al menos:

- rechazo antes de ejecutar;
- fallo confirmado durante la operación sin efecto material;
- efecto parcial;
- resultado desconocido;
- éxito técnico confirmado;
- éxito técnico seguido de rechazo empresarial posterior;
- callback duplicado;
- respuesta tardía;
- evidencia contradictoria;
- dependencia externa no disponible.

Reglas:

1. un error de transporte no demuestra que el proveedor no ejecutó la acción;
2. una respuesta tardía se correlaciona con la intención original y no crea una intención nueva;
3. callbacks duplicados deben ser reconciliables sin duplicar efectos empresariales;
4. evidencia contradictoria mantiene ambas fuentes hasta resolución;
5. el estado visible al usuario futuro deberá distinguir ejecución desconocida de fracaso confirmado;
6. una operación parcial no borra las partes ya ejecutadas ni oculta las pendientes;
7. cualquier compensación futura debe ser una acción explícita y autorizada, no una reversión implícita;
8. cuando no exista operación compensatoria segura, la reconciliación y la intervención propietaria prevalecen sobre un reintento automático.

---

#### 21. Seguridad del contrato de adaptación

El diseño exige:

- principio de mínimo privilegio para credenciales técnicas futuras;
- separación entre actor humano y principal de servicio;
- no persistir secretos en payloads documentales, eventos o evidencia ordinaria;
- correlación sin exponer tokens;
- verificación de origen e integridad de callbacks cuando la implementación concreta lo permita;
- rechazo por defecto cuando recurso, versión, finalidad o autoridad no puedan resolverse;
- protección de payloads y metadata según clasificación efectiva;
- reautorización para acciones posteriores de salida o destrucción;
- reducción de campos antes de cruzar una frontera externa;
- conservación de evidencia suficiente para explicar efectos parciales, duplicados o desconocidos.

Esta tarea no define cifrados, algoritmos, certificados, redes, secretos, credenciales o mecanismos de autenticación específicos porque dependen de la integración concreta y de la arquitectura técnica posterior.

---

#### 22. Observabilidad y diagnóstico

La observabilidad del adaptador deberá permitir medir y diagnosticar sin incorporar contenido innecesario.

Dimensiones lógicas permitidas cuando sean necesarias:

- familia de adaptador;
- capability code;
- resultado técnico;
- duración técnica cuando pueda medirse de forma confiable;
- intento;
- correlación;
- clase de error normalizada;
- necesidad de reconciliación;
- dependencia externa;
- versión del contrato del adaptador.

No forman parte de la telemetría ordinaria:

- cuerpo completo de documentos;
- texto OCR completo;
- secretos;
- credenciales;
- tokens de acceso reutilizables;
- evidencia preservada completa;
- datos personales completos cuando basta una referencia minimizada.

---

#### 23. Modelo de error normalizado

Las implementaciones posteriores deberán mapear errores externos a categorías estables sin perder la evidencia original necesaria.

Categorías documentales mínimas:

| Categoría                      | Significado                                                                               |
| ------------------------------ | ----------------------------------------------------------------------------------------- |
| `ADAPTER_DENIED`               | la operación fue bloqueada antes del efecto por autoridad o restricción aplicable         |
| `ADAPTER_INVALID_INPUT`        | la intención no puede normalizarse sin inventar o completar datos obligatorios            |
| `ADAPTER_EXTERNAL_REJECTED`    | el prestador rechazó la operación de forma confirmada                                     |
| `ADAPTER_EXTERNAL_UNAVAILABLE` | la dependencia no respondió o no estuvo disponible                                        |
| `ADAPTER_PARTIAL`              | existe efecto parcial material                                                            |
| `ADAPTER_UNKNOWN`              | no puede determinarse si ocurrió el efecto                                                |
| `ADAPTER_CONFLICT`             | existen respuestas o evidencias incompatibles que requieren conciliación                  |
| `ADAPTER_INTEGRITY_FAILURE`    | la evidencia disponible no permite confiar en integridad de la representación o resultado |

Estas categorías no sustituyen los estados empresariales ni los códigos de error específicos de proveedor que una implementación deba conservar como evidencia técnica.

---

#### 24. Handoff a integración concreta

`INFO-INT-001` cierra la semántica neutral de los siete adaptadores. La integración posterior puede seleccionar servicios concretos únicamente respetando estos contratos.

El handoff exige que cada binding futuro documente, como mínimo:

1. capacidad lógica del adaptador que implementa;
2. operación concreta equivalente;
3. garantías de idempotencia;
4. estrategia de correlación;
5. semántica de éxito, fallo, parcialidad e incertidumbre;
6. método de reconciliación;
7. evidencia recibida;
8. callbacks o mecanismos asíncronos;
9. límites de payload y clasificación;
10. territorio y rol del tercero;
11. tratamiento de retención, legal hold y preservación;
12. observabilidad y minimización;
13. compatibilidad con las decisiones de autorización;
14. condiciones de rollback o compensación cuando exista una operación reversible.

La tarea siguiente podrá definir integraciones concretas con e-signature, email, object storage, SIEM/DLP, HRIS/finance cuando aplique. No se anticipan aquí prestadores, endpoints, credenciales, regiones, esquemas físicos ni configuración.

---

#### 25. Estados de materialización

| Elemento                            | Estado             | Justificación                                                                         |
| ----------------------------------- | ------------------ | ------------------------------------------------------------------------------------- |
| contrato transversal de adaptadores | `ESPECIFICADO`     | semántica de operación, resultado, evidencia y reconciliación cerrada documentalmente |
| adaptador Storage                   | `ESPECIFICADO`     | capacidades y límites definidos sin binding físico                                    |
| adaptador de escaneo                | `ESPECIFICADO`     | captura, procedencia y parcialidad definidas                                          |
| adaptador OCR                       | `ESPECIFICADO`     | derivado, procedencia y no autoridad definidos                                        |
| adaptador de firma                  | `ESPECIFICADO`     | versión exacta, correlación y evidencia definidas                                     |
| adaptador de certificación          | `ESPECIFICADO`     | separación de certificación, firma y aprobación definida                              |
| adaptador de preservación           | `ESPECIFICADO`     | adquisición, acceso, liberación y no destrucción definidos                            |
| adaptador de archivo externo        | `ESPECIFICADO`     | custodia, ingestión, recuperación y disposición gobernada definidas                   |
| selección de proveedores            | `FUERA_DE_ALCANCE` | pertenece al binding de integración concreta                                          |
| código y configuración              | `FUERA_DE_ALCANCE` | fase actual exclusivamente documental                                                 |
| ejecución remota                    | `FUERA_DE_ALCANCE` | no existe operación física autorizada en esta tarea                                   |

No quedan pendientes documentales sin dueño dentro del resultado actual: las decisiones que dependen de prestadores concretos están asignadas al siguiente paso de integración y no bloquean el contrato neutral.

---

#### 26. Criterios de aceptación

- [x] Existe un contrato transversal único para operación, correlación, resultados, evidencia y reconciliación.
- [x] Storage, escaneo, OCR, firma, certificación, preservación y archivo externo tienen contrato propio y frontera explícita.
- [x] Los contratos son neutrales respecto de proveedor y no fijan tecnología concreta.
- [x] Los cuatro resultados técnicos `CONFIRMED_SUCCESS`, `CONFIRMED_FAILURE`, `PARTIAL_RESULT` y `UNKNOWN_RESULT` están definidos sin convertirlos en estados empresariales.
- [x] Un resultado desconocido exige reconciliación antes de repetir una operación no idempotente.
- [x] La identidad empresarial permanece separada de clave de objeto, localizador, proveedor y representación.
- [x] Storage no adquiere propiedad funcional ni autoridad por alojar una representación.
- [x] Un acceso temporal de Storage no se interpreta como autorización empresarial.
- [x] Escanear crea una representación trazable y no destruye ni sustituye por inferencia el original.
- [x] Una captura parcial permanece explícitamente parcial.
- [x] OCR produce un derivado no autoritativo y no sobrescribe silenciosamente la fuente.
- [x] Un resultado OCR conserva procedencia y clasificación heredada o elevada.
- [x] La firma queda vinculada a una versión o snapshot exacto.
- [x] Envío a firma, aceptación técnica, firma completada, aprobación y certificación permanecen separados.
- [x] La certificación no fija proveedor, algoritmo o estándar no respaldado por una integración concreta.
- [x] Preservar precede a correcciones que puedan alterar evidencia relevante.
- [x] Preservar no concede lectura, liberación ni disposición.
- [x] Archivo externo conserva custodia técnica sin apropiarse de la fuente empresarial.
- [x] Retención y legal hold bloquean acciones destructivas incompatibles.
- [x] La matriz de capacidades separa autoridad empresarial de disponibilidad técnica.
- [x] Los 69 procesos están cubiertos por referencia sin crear procesos nuevos.
- [x] Las 332 identidades documentales están cubiertas por referencia sin reclasificar, duplicar ni cambiar propietaria funcional.
- [x] Los errores parciales, desconocidos, duplicados y contradictorios tienen comportamiento determinista de reconciliación.
- [x] La observabilidad minimiza contenido y excluye secretos reutilizables.
- [x] La fase documental crea cero cambios físicos.
- [x] El handoff a integración concreta está definido sin desarrollar la tarea siguiente.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el requisito transversal de integración vigente ya asigna expresamente esta tarea y cubre identidad, autoridad, finalidad, clasificación, minimización, tercero o destinatario, territorio, versión, retención y hold, resultado, evidencia no destructiva, efectos parciales o desconocidos y reconciliación previa a reintentos no idempotentes. Esta tarea materializa esa conducta existente como contratos documentales de adaptación y no introduce comportamiento ejecutable adicional.

- requisitos creados: **0**;
- requisitos modificados: **0**;
- requisitos diferidos: **0**;
- requisitos descartados: **0**;
- requisitos obsoletos: **0**.

---

#### 28. Continuidad

ÚLTIMA TAREA APROBADA

`INFO-UX-006 — Diseñar explorador de auditoría e investigación con divulgación progresiva`

TAREA ACTUAL APROBADA

`INFO-INT-001 — Definir adaptadores de Storage, escaneo, OCR, firma, certificación, preservación y archivo externo`

SIGUIENTE TAREA RESERVADA

`INFO-INT-002 — Diseñar integraciones con e-signature, email, object storage, SIEM/DLP, HRIS/finance cuando aplique`


### ✅ INFO-INT-002 — Definir contratos con SHELL, Supabase, EVID-ARC, ANIMA, VISO, PASS y aplicaciones de dominio.

**Estado:** APROBADA  
**Tarea anterior:** INFO-INT-001 — Definir modelo de integraciones con terceros.  
**Tarea siguiente:** BLOQUE AA COMPLETO — GOBIERNO DE INFORMACIÓN.  
**Tipo de tarea:** Documental — definición contractual transversal de intercambio, autoridad, persistencia, evidencia y consumo entre componentes VENTO.

#### Propósito

Establecer el contrato canónico de interacción entre las aplicaciones propietarias de dominio y las capacidades transversales de VENTO, de forma que cada intercambio preserve una única fuente de verdad, autoridad explícita, mínima exposición de información, trazabilidad, idempotencia, reconciliación y separación entre estado empresarial, autorización, persistencia, evidencia, notificación, analítica y seguridad.

La tarea no crea una fuente de verdad transversal nueva, no traslada propiedad empresarial a SHELL, Supabase, EVID-ARC, ANIMA, VISO o PASS y no autoriza escrituras directas entre dominios.

#### Entradas canónicas y decisiones heredadas

1. `INFO-INT-001` conserva el modelo aprobado de integración, incluyendo contratos versionados, trazabilidad, idempotencia, clasificación de errores, reintentos controlados, reconciliación y prohibición de convertir a terceros o adaptadores en fuentes empresariales competidoras.
2. `INT-APP-010` conserva los cinco patrones de interacción transversal: `QUERY`, `COMMAND`, `EVENT`, `STATUS` y `PROJECTION`; mantiene autoridad única del propietario, prohíbe escrituras cruzadas y exige que proyecciones y estados de entrega no sustituyan el estado canónico del dominio.
3. El BLOQUE AA conserva la propiedad funcional: la aplicación de dominio es propietaria de su expediente y sus hechos; SHELL gobierna acceso, contexto y autorización; Supabase es sustrato compartido; ANIMA acompaña registro, activación, notificación e interacción guiada; PASS administra seguridad, credenciales, confianza y acciones administrativas de identidad; VISO expone indicadores, alertas y vistas; la arquitectura de evidencia conserva trazabilidad y prueba sin apropiarse del expediente empresarial.
4. Las reglas de autorización conservan decisión explícita por actor, organización o dominio, función, contexto, acción, alcance, fase, finalidad y sensibilidad; fuera del contrato aplicable rige denegación por defecto.
5. Las reglas documentales conservan propietario, procedencia, estado, finalidad, sensibilidad, retención, disposición y legal hold cuando sean aplicables; una copia, índice, proyección o evidencia no altera por sí misma la autoridad del objeto fuente.
6. `TREQ-INTEGRATION-021` cubre de forma directa el ciclo de información, documentos y evidencia entre aplicación propietaria, SHELL, Supabase, Storage, ANIMA, VISO, PASS y terceros, y exige contratos versionados, idempotentes, reconciliables y observables sin fuentes competidoras.

#### Principios obligatorios del contrato transversal

1. **Autoridad única por hecho.** Todo dato, documento, estado o decisión empresarial tiene una aplicación propietaria identificable. Ningún consumidor transversal puede redefinirlo por copia, caché, proyección, evento, índice o resultado técnico.
2. **Separación entre decisión de negocio y decisión de acceso.** La aplicación propietaria decide la validez empresarial de la transición; SHELL decide si el actor y el contexto están autorizados para iniciar, ver, continuar, corregir o supervisar la acción dentro de su alcance.
3. **Separación entre identidad/confianza y autorización operacional.** PASS conserva hechos de identidad, credenciales, postura de seguridad, confianza y administración que le pertenezcan; SHELL consume esos hechos cuando correspondan y emite la decisión de acceso contextual. PASS no decide el estado del expediente empresarial y SHELL no se convierte en almacén de credenciales.
4. **Sustrato no equivale a propietario.** Supabase, incluido Storage cuando aplique, persiste datos y archivos conforme al contrato de su propietario. Compartir infraestructura no habilita a una aplicación a escribir objetos de otro dominio.
5. **Evidencia no equivale a estado empresarial.** EVID-ARC conserva prueba, trazabilidad, linaje, integridad y relaciones de evidencia; no transforma un recibo, hash, archivo o evento de auditoría en la fuente canónica del hecho empresarial demostrado.
6. **Notificación no equivale a finalización.** ANIMA puede entregar mensajes, activaciones, recordatorios, solicitudes guiadas o estados de entrega; la recepción o lectura de un mensaje no cambia el resultado empresarial salvo que el usuario ejecute una acción que vuelva como comando al propietario y este la acepte.
7. **Analítica no equivale a maestro.** VISO consume proyecciones, eventos y consultas autorizadas para indicadores y alertas. Sus datos derivados son reconstruibles y no pueden escribir de vuelta el estado canónico.
8. **Sin escritura cruzada.** Una aplicación no modifica tablas, objetos, archivos o estados empresariales de otra aplicación como atajo. Toda mutación se solicita al propietario mediante un comando explícito y vuelve como resultado, estado o evento.
9. **Mínima proyección.** Cada contrato transporta únicamente los atributos requeridos por la finalidad declarada. El consumidor recibe referencias canónicas y una proyección mínima cuando no necesita el expediente completo.
10. **Trazabilidad de extremo a extremo.** Toda interacción relevante conserva identidad del contrato y versión, propietario, consumidor, recurso canónico, actor o principal técnico, contexto organizacional aplicable, finalidad, correlación, causalidad, tiempo, resultado y referencia a la evidencia producida cuando corresponda.
11. **Idempotencia y reconciliación.** Comandos, eventos, trabajos, webhooks o entregas reintentables usan identidad estable de operación. Un mismo identificador y mismo contenido no puede producir más de un efecto; un identificador reutilizado con contenido incompatible genera conflicto explícito. Los resultados ambiguos se reconcilian antes de reintentar de forma que pueda duplicar efectos.
12. **Contrato versionado.** Todo intercambio mantiene una versión explícita. Un cambio incompatible exige versión mayor, periodo de convivencia cuando sea necesario, corte controlado y posibilidad de retorno; el consumidor no interpreta silenciosamente una versión incompatible.
13. **Resultado verdadero.** Aceptación técnica, encolamiento, entrega, proyección y finalización empresarial son estados distintos. Ningún componente presenta éxito empresarial cuando solo existe recepción, procesamiento pendiente o entrega técnica.
14. **Evidencia después de hechos confirmados, salvo precondición explícita.** Los eventos que acreditan una mutación empresarial se emiten después de la confirmación del propietario. Cuando una evidencia sea requisito previo para confirmar el hecho, esa condición debe estar declarada en el contrato; no se presume.
15. **Fallos visibles.** Un fallo de autorización, persistencia, evidencia, notificación, proyección, seguridad o dominio se representa con un resultado distinguible y trazable; no se oculta mediante estados optimistas o copias locales que aparenten convergencia.

#### Elementos lógicos mínimos de todo contrato

| Elemento                   | Regla canónica                                                                                                                              |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Identidad y versión        | El contrato y su versión deben ser identificables y auditables.                                                                             |
| Propietario y consumidor   | Debe quedar explícito qué aplicación conserva autoridad y cuál consume o solicita.                                                          |
| Patrón de interacción      | Debe ser `QUERY`, `COMMAND`, `EVENT`, `STATUS` o `PROJECTION`; no se admite una escritura implícita fuera de estos límites.                 |
| Recurso canónico           | Debe existir una referencia inequívoca al proceso, expediente, documento, identidad u objeto propietario afectado.                          |
| Actor y contexto           | Cuando aplique, se conserva actor o principal técnico, organización o dominio, sede o contexto operacional y finalidad de la acción.        |
| Alcance de información     | Se declaran los datos mínimos necesarios, su sensibilidad y las restricciones de uso relevantes.                                            |
| Correlación y causalidad   | Las operaciones encadenadas deben poder reconstruirse entre origen, solicitud, resultado y efectos posteriores.                             |
| Idempotencia               | Es obligatoria para toda operación que pueda repetirse o entregarse más de una vez.                                                         |
| Consistencia               | Se declara si la respuesta es local fuerte, lectura acotada o proyección eventual; no se presume consistencia fuerte entre aplicaciones.    |
| Resultado                  | Se distingue aceptación, procesamiento, finalización, rechazo, conflicto, indisponibilidad y resultado desconocido cuando corresponda.      |
| Evidencia                  | Se conserva referencia suficiente para demostrar quién hizo qué, sobre qué recurso, bajo qué contrato, con qué resultado y en qué momento.  |
| Privacidad y ciclo de vida | Cuando aplique, se conserva finalidad, minimización, retención, disposición, revocación o legal hold sin duplicar una política competidora. |

#### Contrato con SHELL

**Autoridad que conserva SHELL**

- identidad de la aplicación y contexto compartido de navegación o sesión que le pertenezca;
- decisión de acceso contextual para iniciar, ver, continuar, corregir o supervisar una acción;
- reglas transversales de entrada, retorno y traspaso entre aplicaciones cuando sean responsabilidad de SHELL.

**Interacciones permitidas**

- una aplicación de dominio puede consultar a SHELL el contexto y la decisión de acceso aplicable;
- SHELL puede consultar al propietario para presentar estado o referencias autorizadas;
- SHELL puede enviar un `COMMAND` al propietario cuando el usuario solicita una mutación empresarial desde una superficie de SHELL;
- cambios de contexto o decisiones de acceso pueden propagarse mediante `EVENT` o `STATUS` cuando el contrato concreto lo requiera.

**Límites obligatorios**

- una autorización positiva de SHELL habilita la acción dentro del alcance concedido, pero no reemplaza las reglas empresariales del propietario;
- la aplicación receptora vuelve a verificar contrato, recurso, contexto y autoridad antes de ejecutar una mutación;
- SHELL no escribe directamente el expediente empresarial ni mantiene una copia editable alternativa;
- ante ausencia de una decisión positiva verificable para una mutación protegida, no se ejecuta la mutación.

#### Contrato con Supabase y Storage

**Autoridad que conserva el propietario**

- la aplicación propietaria conserva la semántica, reglas, ciclo de vida y autoridad de sus registros aunque estos residan en infraestructura Supabase;
- el propietario del documento o de la evidencia conserva también la autoridad lógica sobre los archivos que le correspondan.

**Reglas de persistencia**

1. Supabase es sustrato compartido, no un dominio empresarial independiente.
2. Una aplicación solo muta objetos para los que el contrato le atribuye propiedad o una operación explícitamente autorizada; no usa acceso al sustrato como permiso de escritura cruzada.
3. Las transacciones del propietario confirman primero su estado canónico; efectos externos posteriores usan mecanismos desacoplados, idempotentes y reconciliables cuando corresponda.
4. Storage conserva el binario bajo una referencia gobernada; el registro empresarial, el archivo y la evidencia mantienen identidades relacionables sin convertirse en copias competidoras.
5. Un archivo sin registro, un registro sin archivo, una versión divergente o una disposición incompleta se considera inconsistencia reconciliable y no se oculta.
6. Este contrato no fija esquema físico, nombre de tablas, políticas RLS, grants, triggers, funciones ni rutas de Storage; esas decisiones corresponden a su fase de implementación y deben preservar estas reglas.

#### Contrato con EVID-ARC

**Autoridad que conserva EVID-ARC**

- estructura de prueba y auditoría transversal;
- linaje entre hecho fuente, evidencia, archivo o artefacto demostrativo;
- integridad, procedencia, tiempo, actor, versión, hash o metadatos probatorios cuando el tipo de evidencia los requiera;
- relación entre evidencia, retención, disposición y legal hold cuando sea parte del ciclo probatorio.

**Reglas de intercambio**

1. La aplicación propietaria referencia el hecho empresarial que la evidencia demuestra; EVID-ARC no reemplaza ese hecho.
2. La evidencia se vincula al recurso canónico y al contrato que originó el intercambio.
3. Cuando la prueba se registra después del hecho confirmado, una falla de canal de evidencia no autoriza a reescribir el estado empresarial; queda una obligación explícita de reconciliación.
4. Cuando la evidencia sea una precondición del hecho, el propietario no confirma la transición hasta satisfacer el requisito declarado.
5. Exportaciones, paquetes de auditoría, copias probatorias o derivados conservan procedencia, versión y relación con el objeto fuente.
6. La evidencia no puede ser modificada desde una aplicación consumidora para alterar retroactivamente el resultado empresarial demostrado.

#### Contrato con ANIMA

**Autoridad que conserva ANIMA**

- registro, activación y experiencia guiada que le pertenezcan;
- entrega de notificaciones, recordatorios o solicitudes de interacción;
- estado técnico de entrega o interacción cuando sea responsabilidad de ANIMA.

**Reglas de intercambio**

1. ANIMA consume `EVENT`, `STATUS` o `PROJECTION` mínimos del propietario para informar o guiar al usuario.
2. La notificación conserva referencia al recurso canónico y no copia el expediente completo salvo necesidad y autorización explícitas.
3. Una acción empresarial iniciada desde ANIMA se envía como `COMMAND` a la aplicación propietaria; ANIMA no ejecuta la mutación en almacenamiento ajeno.
4. El propietario vuelve a verificar autoridad, precondiciones y estado antes de aceptar el comando.
5. Entregado, leído, fallido o reintentado son estados de comunicación; no equivalen por sí solos a aprobado, pagado, recibido, cerrado, firmado o cualquier otro estado empresarial.
6. Los reintentos de notificación no generan acciones empresariales duplicadas.

#### Contrato con VISO

**Autoridad que conserva VISO**

- métricas, indicadores, alertas, comparativos y vistas derivadas que le pertenezcan;
- estado de frescura y disponibilidad de sus propias proyecciones.

**Reglas de intercambio**

1. VISO consume `QUERY`, `EVENT` o `PROJECTION` autorizados; la proyección es derivada y reconstruible.
2. La vista conserva referencia a la fuente, versión o corte temporal suficiente para interpretar su vigencia.
3. Una proyección atrasada se identifica como tal; no se presenta como estado actual si no puede demostrarse.
4. VISO no modifica el registro propietario desde su proyección.
5. Una acción correctiva iniciada desde VISO se emite como `COMMAND` al propietario correspondiente y el resultado vuelve separado de la métrica o alerta que la originó.
6. Un agregado no habilita por sí mismo acceso al detalle; el detalle vuelve a evaluarse contra autorización y finalidad.

#### Contrato con PASS

**Autoridad que conserva PASS**

- credenciales, mecanismos de seguridad, hechos de confianza, postura o administración de identidad que sean de su dominio;
- resultados técnicos de acciones administrativas o de seguridad que le pertenezcan.

**Reglas de intercambio**

1. PASS entrega únicamente hechos de identidad, confianza, seguridad o administración necesarios para la finalidad solicitada; no expone secretos como datos de integración ordinaria.
2. SHELL puede consumir los hechos de PASS que necesite para su decisión de acceso contextual, sin trasladar a PASS la autoridad de autorización empresarial o operacional que corresponde a SHELL.
3. Una aplicación de dominio puede consultar hechos de PASS cuando el contrato lo requiera, pero no deriva permisos más amplios que los concedidos por SHELL y sus propias reglas empresariales.
4. Las acciones administrativas sobre seguridad se solicitan a PASS mediante su contrato; ninguna aplicación escribe directamente su almacenamiento como sustituto.
5. Un resultado de confianza o seguridad no modifica por sí mismo el expediente empresarial; puede actuar como precondición declarada para permitir o negar una acción.
6. Ante indisponibilidad de PASS, una operación que requiera verificar un hecho de confianza no inventa un resultado positivo ni reutiliza una autoridad fuera del contrato vigente.

#### Contrato entre aplicaciones de dominio

1. Cada aplicación propietaria conserva su expediente, hechos, documentos y estados empresariales.
2. `QUERY` obtiene información sin mutar al propietario.
3. `COMMAND` solicita una mutación al propietario; aceptación del comando no implica finalización hasta que el propietario confirme el resultado.
4. `EVENT` comunica un hecho ya confirmado por el propietario y puede entregarse más de una vez; el consumidor debe deduplicar.
5. `STATUS` comunica progreso técnico, de ejecución o entrega sin redefinir el estado empresarial.
6. `PROJECTION` materializa una vista derivada, de solo lectura y reconciliable.
7. Cuando una aplicación necesita un dato de otra, conserva la referencia canónica y solo la proyección mínima necesaria; no abre una segunda fuente editable.
8. Ningún dominio realiza DML, modificación de archivo o transición de estado directamente sobre objetos propiedad de otro dominio.
9. Una falla del propietario no habilita un fallback de escritura en otro componente. El comando conserva su identidad, resultado conocido o desconocido y condición de reintento o reconciliación.

#### Matriz canónica de autoridad y comportamiento

| Participante          | Fuente de verdad que conserva                                           | Puede solicitar o consumir                                                                       | Puede producir                                                                       | Prohibición principal                                                                          |
| --------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| SHELL                 | contexto compartido y decisión de acceso que le pertenezca              | contexto, referencias y estado autorizado de dominios; hechos de confianza de PASS               | decisión contextual, handoff, comandos hacia propietarios, eventos o estados propios | convertirse en expediente empresarial o escribir directamente el dominio                       |
| Supabase / Storage    | ninguna autoridad empresarial por el solo hecho de persistir            | operaciones emitidas por propietarios autorizados                                                | persistencia, disponibilidad y referencias técnicas                                  | usar infraestructura compartida como permiso de escritura cruzada o fuente de verdad adicional |
| EVID-ARC              | evidencia, linaje e integridad probatoria                               | hechos confirmados, referencias canónicas y metadatos mínimos                                    | evidencia, relaciones probatorias, exportaciones o paquetes auditables               | redefinir el estado empresarial demostrado                                                     |
| ANIMA                 | registro, activación, notificación e interacción guiada propia          | eventos, estados y proyecciones mínimas; resultados del propietario                              | mensajes, estados de entrega e interacción; comandos de usuario hacia propietario    | equiparar entrega de mensaje con resultado empresarial o mutar almacenamiento ajeno            |
| VISO                  | métricas, alertas y proyecciones derivadas                              | consultas, eventos y proyecciones autorizadas                                                    | indicadores, alertas, cortes y comandos correctivos hacia propietario                | transformar proyección o agregado en maestro o escribir de vuelta el registro fuente           |
| PASS                  | credenciales, seguridad, confianza y administración de identidad propia | solicitudes de verificación o administración autorizadas                                         | hechos y resultados de seguridad/confianza                                           | asumir autoridad sobre expediente empresarial o sustituir la decisión contextual de SHELL      |
| Aplicación de dominio | expediente, hechos, documentos y estados empresariales de su dominio    | contexto autorizado, hechos de seguridad, evidencia, notificación y proyecciones según finalidad | consultas, resultados, eventos, estados y respuestas a comandos                      | escribir directamente el dominio de otra aplicación o delegar su autoridad en un consumidor    |

#### Consistencia, reintentos y reconciliación

1. Una operación local del propietario puede exigir consistencia fuerte dentro de su propia frontera; una lectura compartida declara su nivel de consistencia y una proyección transversal se trata como eventual salvo contrato más restrictivo.
2. No se crea una transacción distribuida implícita entre aplicaciones para aparentar atomicidad empresarial.
3. Los eventos pueden entregarse al menos una vez; todo consumidor que produzca un efecto debe deduplicar por identidad estable.
4. Los comandos reintentables conservan identidad y semántica. Un timeout con resultado desconocido obliga a consultar o reconciliar antes de repetir una operación no segura.
5. La entrega técnica se registra separada del hecho empresarial. Un mensaje, evento o trabajo fallido puede quedar pendiente de recuperación sin revertir un hecho ya confirmado, salvo que el contrato haya declarado esa entrega como precondición.
6. La reconciliación compara referencia canónica, versión, propietario, consumidor, resultado y efectos derivados; nunca corrige divergencias sobrescribiendo historia sin rastro.
7. Copias, proyecciones o índices que no puedan demostrar su relación con la fuente se marcan como inconsistentes y no se usan para decidir una mutación.

#### Fallos y degradación por frontera

| Frontera              | Comportamiento obligatorio ante fallo                                                                                                                                          |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| SHELL                 | sin decisión positiva verificable no se ejecuta una mutación protegida; el propietario no infiere permiso a partir de una copia incompleta de roles o contexto                 |
| Supabase / Storage    | no se reporta éxito si la confirmación necesaria no ocurrió; el reintento conserva identidad y respeta la semántica idempotente de la operación                                |
| EVID-ARC              | si la evidencia era precondición, el hecho no se confirma; si era posterior al hecho, se conserva el hecho confirmado y una obligación reconciliable de completar la evidencia |
| ANIMA                 | la falla de entrega no cambia el resultado empresarial; la comunicación queda reintentable o reconciliable sin duplicar acciones del usuario                                   |
| VISO                  | la proyección se marca atrasada, no disponible o en reconciliación; no se inventa un estado actual ni se escribe al propietario para forzar convergencia                       |
| PASS                  | una verificación de confianza requerida no se presume satisfactoria; la operación dependiente permanece negada, bloqueada o pendiente según su contrato                        |
| Aplicación de dominio | una indisponibilidad no habilita escritura alternativa en otro componente; la solicitud conserva identidad, estado y posibilidad de recuperación controlada                    |

#### Privacidad, minimización y ciclo de vida

1. Cada intercambio declara finalidad y transporta únicamente la información necesaria para cumplirla.
2. Sensibilidad, restricciones de uso, retención, disposición y legal hold acompañan la referencia o la proyección cuando sean necesarias para que el consumidor cumpla su obligación; no se crean políticas paralelas divergentes.
3. Tokens, secretos, credenciales y material criptográfico no viajan como metadatos ordinarios de negocio, tickets, eventos o evidencias.
4. Revocación, anonimización, eliminación, reemplazo o bloqueo de un objeto no se considera completado mientras existan copias o derivados obligatorios que deban reconciliarse conforme a su contrato y política aplicable.
5. Las proyecciones y cachés deben poder identificar su fuente y quedar fuera de uso cuando ya no sean válidas para la finalidad o versión correspondiente.
6. Una exportación o copia externa conserva relación con la fuente y no adquiere autoridad canónica por salir de la plataforma.

#### Versionado y compatibilidad

1. Todo contrato tiene versión explícita y consumidores identificables.
2. Los cambios compatibles pueden convivir sin alterar el significado aprobado del contrato vigente.
3. Un cambio que elimine campos requeridos, cambie autoridad, semántica, cardinalidad, comportamiento de error, idempotencia, consistencia o finalidad se trata como incompatible y requiere versión mayor.
4. Una transición incompatible define convivencia, corte, reconciliación de trabajos pendientes y retorno seguro antes de retirar la versión anterior.
5. Un consumidor que no soporte la versión recibida falla de forma explícita; no interpreta el payload con reglas de otra versión.

#### Resultado material de INFO-INT-002

Quedan definidos siete límites contractuales coordinados: SHELL, Supabase/Storage, EVID-ARC, ANIMA, VISO, PASS y aplicaciones de dominio. Todos comparten los cinco patrones de interacción aprobados, una única regla de autoridad por hecho, prohibición de escritura cruzada, separación entre resultado técnico y empresarial, y obligaciones comunes de versionado, minimización, trazabilidad, idempotencia y reconciliación.

La definición es deliberadamente lógica y no introduce endpoints, tablas, schemas, buckets, triggers, funciones, RLS, grants, colas, topics, secretos o despliegues. La materialización física pertenece a las tareas de implementación propietarias y debe preservar este contrato.

#### Cobertura canónica existente

La conducta observable materializada por esta tarea ya está cubierta directamente por `TREQ-INTEGRATION-021` y transversalmente por `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-006`, `TREQ-INTEGRATION-020` y `TREQ-INTEGRATION-023`. El requisito directo ya declara a `INFO-INT-001` a `INFO-INT-003` y `EVID-ARC-001` a `EVID-ARC-010` dentro de su responsabilidad, por lo que no corresponde duplicar cobertura.

#### Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

- Requisitos creados: **0**.
- Requisitos modificados: **0**.
- Requisitos obsoletos: **0**.

#### Criterios de aceptación

1. Están definidos los límites de autoridad de SHELL, Supabase/Storage, EVID-ARC, ANIMA, VISO, PASS y las aplicaciones propietarias de dominio.
2. Cada frontera declara qué puede consumir, qué puede producir y qué comportamiento está prohibido.
3. Los contratos usan únicamente `QUERY`, `COMMAND`, `EVENT`, `STATUS` y `PROJECTION` como patrones transversales y conservan la semántica aprobada de cada uno.
4. Ningún contrato autoriza escritura cruzada, fuente de verdad duplicada, éxito empresarial ficticio o mutación basada en proyección no autoritativa.
5. La frontera SHELL/PASS separa autorización contextual de identidad, credenciales y confianza.
6. La frontera Supabase/Storage separa persistencia física de autoridad empresarial.
7. La frontera EVID-ARC separa evidencia y auditoría de estado empresarial y declara el tratamiento de evidencia previa o posterior al hecho.
8. ANIMA y VISO quedan definidos como consumidores transversales sin apropiarse del expediente empresarial.
9. Están definidos versionado, compatibilidad, consistencia, idempotencia, resultado desconocido, reintento, reconciliación, minimización y ciclo de vida.
10. La tarea no realiza cambios físicos de Supabase, código, configuración o despliegue.
11. La cobertura TREQ queda satisfecha documentalmente por requisitos vigentes, sin crear ni modificar filas del registro canónico.

#### Continuidad

**ÚLTIMA TAREA APROBADA:** INFO-INT-001 — Definir modelo de integraciones con terceros.  
**TAREA ACTUAL APROBADA:** INFO-INT-002 — Definir contratos con SHELL, Supabase, EVID-ARC, ANIMA, VISO, PASS y aplicaciones de dominio.  
**SIGUIENTE TAREA RESERVADA:** BLOQUE AA COMPLETO — GOBIERNO DE INFORMACIÓN.


### [ ] INFO-INT-003 — Definir contratos con encargados, asesores, autoridades, proveedores y destinatarios externos
