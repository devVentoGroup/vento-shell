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


### [ ] INFO-INT-002 — Definir contratos con SHELL, Supabase, EVID-ARC, ANIMA, VISO, PASS y aplicaciones de dominio
### [ ] INFO-INT-003 — Definir contratos con encargados, asesores, autoridades, proveedores y destinatarios externos
