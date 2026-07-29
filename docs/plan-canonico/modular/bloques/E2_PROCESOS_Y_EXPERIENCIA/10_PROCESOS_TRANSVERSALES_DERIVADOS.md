### TAREAS TRANSVERSALES TO-BE DERIVADAS DE OPS-AUD-001

Estas tareas se ejecutan dentro de BLOQUE E2 después de consolidar la línea base
de E1. Deben reutilizar el catálogo de procesos, actores, pantallas y brechas; no
crearán inventarios paralelos.

### ✅ OPS-CAN-001 — Diseñar la arquitectura objetivo de canales corporativos y comerciales

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `UX-STATION-001 — Inventariar puestos físicos, zonas de trabajo y condiciones reales de operación` — APROBADA  
**Siguiente tarea reservada:** `OPS-LOG-001 — Diseñar el proceso transversal objetivo de Bodega y Abastecimiento`  
**Artefacto producido:** `OPS-CHANNEL-ARCHITECTURE-001`  
**Ámbito:** Vento Group y sus marcas, sedes, canales corporativos, comerciales, transaccionales y de atención  
**Cambios en código, cuentas externas, dominios, redes, migraciones o Supabase:** no autorizados

---

#### 1. Propósito

Definir una arquitectura objetivo única para gobernar cómo Vento Group publica,
recibe, identifica, enruta, atiende, transforma, responde, mide y conserva las
interacciones que llegan por canales corporativos y comerciales.

La arquitectura deberá cubrir como mínimo los canales ya identificados en la
línea base documental:

- web corporativa y páginas de marca;
- Instagram y demás perfiles sociales vigentes;
- correo corporativo y alias;
- WhatsApp;
- ManyChat u otra automatización conversacional;
- llamadas;
- Rappi u otros marketplaces;
- Shopify u otro canal de comercio electrónico;
- atención presencial y POS;
- Vento Pass y sus comunicaciones permitidas;
- catering y captación B2B;
- encuestas, QR y mecanismos de retroalimentación.

La tarea no presupone que todos estos canales estén activos, correctamente
configurados o sean definitivos. Cada instancia real deberá quedar inventariada,
verificada y gobernada antes de su implementación objetivo.

---

#### 2. Decisión canónica

```text
CANAL
→ CAPTA O PUBLICA UNA INTERACCIÓN
→ NO SE CONVIERTE EN PROPIETARIO DEL HECHO EMPRESARIAL
```

La arquitectura objetivo será:

```text
PERSONA, EMPRESA O PLATAFORMA EXTERNA
        ↓
ENDPOINT DE CANAL IDENTIFICADO
        ↓
ADAPTADOR O INTERFAZ CONTROLADA
        ↓
SOBRE CANÓNICO DE INTERACCIÓN
        ↓
CLASIFICACIÓN Y ENRUTAMIENTO
        ↓
PROCESO `VPROC-*` PROPIETARIO
        ↓
APLICACIÓN O REGISTRO CANÓNICO
        ↓
PROYECCIÓN DE RESPUESTA AUTORIZADA
        ↓
CANAL DE SALIDA
```

Por tanto:

```text
WHATSAPP ≠ SISTEMA DE PEDIDOS
INSTAGRAM ≠ CRM
SHOPIFY ≠ CONTABILIDAD
RAPPI ≠ FUENTE FINAL DE INVENTARIO
CORREO ≠ EXPEDIENTE
MANYCHAT ≠ AUTORIDAD EMPRESARIAL
```

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- cierre documental de BLOQUE E1;
- `OPS-GOV-001` y sus decisiones de gobierno organizativo;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001`;
- `VPROC-0017`, `VPROC-0040` a `VPROC-0050`, `VPROC-0053`,
  `VPROC-0056`, `VPROC-0057`, `VPROC-0064` y `VPROC-0068`;
- separación entre identidad cliente, identidad laboral, proveedor,
  contraparte B2B, plataforma externa y principal técnico;
- prohibición de autorización derivada únicamente del nombre del rol;
- propiedad funcional distribuida entre PULSO, PASS, FOGO, NEXO, ORIGO,
  NUMERA, ANIMA/TALENTO y las capacidades transversales futuras;
- `INT-APP-001` a `INT-APP-010`, `INT-EXT-001` a `INT-EXT-020`,
  `INT-SALES-001` a `INT-SALES-011` e `INT-MKT-001` a `INT-MKT-003`
  como tareas propietarias posteriores de contratos e integraciones, no de los
  hechos empresariales originales.

No se crean inventarios paralelos de clientes, pedidos, pagos, productos,
reclamos, reservas, entregas, candidatos, proveedores o documentos.

---

#### 4. Conceptos canónicos

##### 4.1. Familia de canal

Clase funcional, por ejemplo: web, red social, correo, mensajería, llamada,
marketplace, comercio electrónico, atención presencial o aplicación propia.

##### 4.2. Endpoint de canal

Instancia concreta y verificable:

- dominio o subdominio;
- página o formulario;
- perfil social;
- número de WhatsApp;
- bandeja de correo;
- alias;
- cuenta de marketplace;
- tienda;
- línea telefónica;
- QR;
- aplicación y ambiente.

##### 4.3. Cuenta, alias y credencial

La cuenta identifica al titular externo o técnico. El alias define una dirección
o punto de entrada. La credencial permite operar técnicamente. Ninguno de los
tres equivale al proceso, actor empresarial o autorización final.

##### 4.4. Interacción

Unidad recibida o emitida por el canal: mensaje, formulario, llamada, evento,
pedido, webhook, comentario, respuesta, clic, encuesta o documento.

##### 4.5. Caso empresarial

Instancia canónica creada después de clasificar la interacción: oportunidad,
pedido, reserva, reclamo, solicitud, pago, entrega, cobranza, requerimiento,
incidente o expediente.

##### 4.6. Conversación

Agrupación de interacciones relacionadas. Una conversación puede originar más
de un caso, pero no deberá sustituir el estado canónico de ninguno.

---

#### 5. Familias objetivo de canal

| Código            | Familia o endpoint conocido                                                           | Propósito objetivo                                                                                           | Procesos principales de destino                                                                                                             | Propiedad funcional del hecho                                                                                           | Límites obligatorios                                                                                                                           |
| ----------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `CAN-WEB-CORP`    | web corporativa de Vento Group                                                        | identidad corporativa, marcas, contacto, información institucional, oportunidades y enlaces oficiales        | `VPROC-0002`, `VPROC-0056`, `VPROC-0057`, `VPROC-0064`                                                                                      | gobierno empresarial para información institucional; Marketing para contenido; proceso receptor para cada caso          | no publicar estructura, dirección, política, oferta o contacto no aprobado; no guardar oportunidades solo en correo o formulario               |
| `CAN-WEB-BRAND`   | páginas, menús y landings de marca                                                    | publicar oferta, sedes, horarios, disponibilidad proyectada, promociones y llamados a la acción              | `VPROC-0017`, `VPROC-0040`, `VPROC-0045`, `VPROC-0056`, `VPROC-0057`                                                                        | cada proceso propietario conserva su dato; Marketing gobierna la publicación                                            | la página no mantiene stock, precios, recompensas o estados independientes; toda proyección lleva versión y vigencia                           |
| `CAN-SOCIAL`      | Instagram y otros perfiles sociales vigentes                                          | contenido, comunidad, consultas y captación                                                                  | `VPROC-0056`, `VPROC-0057`, `VPROC-0046`, `VPROC-0068`                                                                                      | Marketing para publicación; proceso receptor para consulta, reclamo o medición                                          | comentarios y mensajes no se convierten automáticamente en pedidos, reclamos cerrados ni consentimiento comercial ilimitado                    |
| `CAN-EMAIL`       | correo corporativo, buzones funcionales y alias                                       | comunicación formal, oportunidades, proveedores, autoridades, soporte y documentos                           | `VPROC-0005`, `VPROC-0019` a `VPROC-0022`, `VPROC-0041`, `VPROC-0046`, `VPROC-0052`, `VPROC-0057`, `VPROC-0058`, `VPROC-0060`, `VPROC-0064` | cada alias tendrá propietario de proceso, suplente y custodio técnico                                                   | el buzón no es expediente ni fuente final; adjuntos y decisiones materiales se trasladan al registro canónico con correlación                  |
| `CAN-MSG`         | WhatsApp, ManyChat y mensajería equivalente                                           | consulta, toma asistida de datos, pedido, reserva, soporte, reclamo y notificación                           | `VPROC-0040` a `VPROC-0047`, `VPROC-0053`, `VPROC-0057`, `VPROC-0068`                                                                       | el proceso clasificado conserva propiedad; Marketing solo gobierna flujos conversacionales y contenido aprobado         | el bot no promete stock, precio, compensación, crédito o fecha sin consultar la fuente; el chat no es autorización ni consentimiento universal |
| `CAN-VOICE`       | llamadas entrantes y salientes                                                        | consulta, reserva, catering, cobranza, reclamo y coordinación permitida                                      | `VPROC-0041`, `VPROC-0046`, `VPROC-0047`, `VPROC-0053`, `VPROC-0057`                                                                        | proceso receptor y actor laboral identificado                                                                           | la llamada relevante genera registro mínimo; no se grabará ni almacenará información sensible sin política y fundamento aprobados              |
| `CAN-MARKETPLACE` | Rappi y marketplaces equivalentes                                                     | recibir pedidos, estados, pagos o entregas administrados por tercero                                         | `VPROC-0040`, `VPROC-0042`, `VPROC-0043`, `VPROC-0050`                                                                                      | PULSO conserva pedido interno; NEXO conserva entrega; NUMERA consume hechos económicos conciliados                      | estados externos requieren traducción, idempotencia y conciliación; el marketplace no es cliente, inventario, pago final ni cierre contable    |
| `CAN-ECOM`        | Shopify u otro comercio electrónico                                                   | catálogo proyectado, pedido, pago, identidad y seguimiento                                                   | `VPROC-0017`, `VPROC-0040`, `VPROC-0042`, `VPROC-0043`, `VPROC-0045`, `VPROC-0049`, `VPROC-0050`                                            | PULSO/PASS/NEXO/NUMERA según el hecho                                                                                   | la tienda no crea un segundo catálogo maestro ni saldos paralelos; webhooks y reintentos son idempotentes                                      |
| `CAN-PRESENCIAL`  | salón, mostrador, caja y POS                                                          | atención, pedido, pago, entrega, identificación y reclamo asistidos                                          | `VPROC-0038`, `VPROC-0039`, `VPROC-0042`, `VPROC-0043`, `VPROC-0045`, `VPROC-0046`                                                          | PULSO y procesos operativos correspondientes                                                                            | la atención asistida separa actor laboral y cliente; el empleado no acepta, firma o redime por el cliente sin confirmación válida              |
| `CAN-PASS`        | Vento Pass, notificaciones y superficies propias de cliente                           | identidad, fidelización, beneficios, pedido o seguimiento permitido, preferencias y mensajes transaccionales | `VPROC-0040`, `VPROC-0045`, `VPROC-0047`, `VPROC-0049`, `VPROC-0056`, `VPROC-0068`                                                          | PASS conserva identidad cliente, consentimientos, ledger y proyecciones permitidas; otros procesos conservan sus hechos | no duplicar pedido, pago, entrega o promoción; separar mensaje transaccional de marketing y respetar opt-out                                   |
| `CAN-B2B`         | formulario, correo, llamada, contacto directo, cotización y propuesta de catering/B2B | captar, calificar, cotizar, aprobar condiciones y transferir a producción, facturación y entrega             | `VPROC-0041`, `VPROC-0053`, `VPROC-0057`                                                                                                    | responsable comercial del caso; FOGO, PULSO, NEXO y NUMERA conservan sus etapas                                         | una consulta no bloquea capacidad; una aceptación cliente no sustituye aprobación interna, crédito, costeo ni disponibilidad                   |
| `CAN-FEEDBACK`    | encuesta, QR, formulario o mensaje de satisfacción                                    | medir experiencia y convertir casos críticos en reclamos separados                                           | `VPROC-0046`, `VPROC-0068`                                                                                                                  | propietario de la medición y proceso de reclamos cuando se abra caso                                                    | encuesta, incentivo, reclamo y compensación permanecen separados; anonimato y sesgo quedan explícitos                                          |

Los códigos identifican familias objetivo, no cuentas ni endpoints físicos. La
lista definitiva de dominios, handles, números, buzones y cuentas se obtendrá del
registro canónico de canales durante implementación y validación.

---

#### 6. Registro canónico de canales

Cada endpoint deberá tener una fila versionada con, como mínimo:

| Grupo          | Campos obligatorios                                                                                             |
| -------------- | --------------------------------------------------------------------------------------------------------------- |
| identidad      | `channel_endpoint_id`, familia, proveedor, nombre interno, URL/handle/número/alias permitido, ambiente y estado |
| organización   | empresa o titular jurídico, marca, sede cuando aplique, país, idioma y zona horaria                             |
| propósito      | finalidades autorizadas, audiencias y tipos de interacción aceptados                                            |
| propiedad      | propietario empresarial, responsable operativo, suplente, aprobador de cambios y custodio técnico               |
| enrutamiento   | procesos `VPROC-*`, tipos de caso, aplicación destino, prioridad, horario, SLA y escalamiento                   |
| identidad      | reglas de cliente, trabajador, proveedor, candidato, B2B, autoridad y actor técnico                             |
| consentimiento | base o finalidad, versión, preferencias, opt-out, retención y restricciones de uso                              |
| integración    | adaptador, versión contractual, eventos, identificadores externos, idempotencia y reconciliación                |
| seguridad      | método de autenticación, MFA, referencia a bóveda, recuperación, dispositivos autorizados y revisión de acceso  |
| continuidad    | contingencia, canal alterno, mensaje degradado, reconciliación y responsable de recuperación                    |
| medición       | volumen, disponibilidad, respuesta, resolución, conversión, transferencias, duplicados, fallos y calidad        |
| evidencia      | fuente, fecha, verificador, última revisión y decisión de conservar, cambiar, fusionar, archivar o retirar      |

No se almacenarán contraseñas, tokens, códigos de recuperación ni secretos en el
registro documental.

---

#### 7. Modelo de propiedad

Cada endpoint tendrá responsabilidades separadas:

```text
PROPIETARIO EMPRESARIAL
→ responde por propósito, audiencia y resultado

PROPIETARIO DEL PROCESO
→ conserva el caso y la verdad empresarial

RESPONSABLE OPERATIVO
→ atiende dentro del horario y alcance asignados

CUSTODIO TÉCNICO
→ administra configuración, integración, seguridad y recuperación

APROBADOR DE CONTENIDO O CAMBIO
→ autoriza publicación, campaña o modificación material

SUPLENTE
→ evita abandono por ausencia o rotación
```

La propiedad funcional no autoriza por sí sola. Cada acción seguirá exigiendo
permiso, alcance, contexto, estado y segregación canónicos.

Queda prohibido:

- un canal sin propietario o suplente;
- una cuenta personal como único acceso empresarial;
- una contraseña compartida como modelo ordinario;
- que Marketing sea propietario automático de pedidos, pagos o reclamos;
- que Tecnología sea propietaria del resultado empresarial por custodiar la
  integración;
- que el trabajador que recibe el mensaje pueda resolver cualquier tipo de caso;
- que una plataforma externa modifique directamente maestros o hechos internos.

---

#### 8. Sobre canónico de interacción

Toda entrada que deba crear, modificar o correlacionar un caso deberá
normalizarse en un sobre mínimo:

```text
interaction_id
channel_endpoint_id
provider
external_interaction_id
conversation_id
received_at / occurred_at
sender_reference
sender_type_claimed
brand / business_context
site_context cuando aplique
language
intent_claimed
payload_reference
attachment_references
consent_context
correlation_key
idempotency_key
adapter_version
verification_status
routing_status
```

Los adjuntos permanecerán referenciados y sometidos a validación de tipo,
tamaño, malware, sensibilidad y retención. El sobre no replicará el contenido
completo cuando no sea necesario.

---

#### 9. Clasificación y enrutamiento

| Intención o hecho recibido                                 | Proceso propietario                                                   | Regla de transferencia                                                                 |
| ---------------------------------------------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| información institucional, marca, sede o contacto          | `VPROC-0002`, `VPROC-0056` o `VPROC-0057`                             | responder desde contenido aprobado o crear oportunidad si requiere seguimiento         |
| empleo, candidatura o hoja de vida                         | `VPROC-0005`                                                          | crear referencia de candidato; no tratar como cliente ni conservar en bandeja general  |
| solicitud o contacto de proveedor                          | `VPROC-0019`, `VPROC-0020`, `VPROC-0021`, `VPROC-0022` o `VPROC-0052` | clasificar etapa; adjuntar al caso de compra, recepción u obligación correspondiente   |
| consulta de oferta o disponibilidad                        | `VPROC-0017`                                                          | consultar proyección vigente; no prometer desde memoria o texto fijo del canal         |
| pedido externo                                             | `VPROC-0040`                                                          | normalizar, deduplicar, validar y transferir a PULSO o proceso comercial propietario   |
| catering o venta B2B                                       | `VPROC-0041`                                                          | crear oportunidad/caso B2B y conservar versiones de requisitos y propuesta             |
| modificación, cancelación o devolución                     | `VPROC-0042`                                                          | relacionar con pedido y estado vigente; no ejecutar efectos derivados desde el canal   |
| pago o soporte de pago                                     | `VPROC-0043`                                                          | crear intento o evidencia correlacionada; conciliación posterior obligatoria           |
| identidad, puntos o beneficios                             | `VPROC-0045`                                                          | verificar relación cliente; usar ledger y consentimiento canónicos                     |
| reclamo, incidente de servicio o solicitud de compensación | `VPROC-0046`                                                          | abrir caso; separar hecho alegado, investigación, decisión y compensación              |
| reserva, evento o comunicación operativa                   | `VPROC-0047`                                                          | verificar capacidad y condiciones antes de confirmar                                   |
| estado, novedad o prueba de entrega                        | `VPROC-0049` o `VPROC-0050`                                           | correlacionar con entrega y receptor; no cerrar por mensaje aislado                    |
| cobranza o cartera                                         | `VPROC-0053`                                                          | verificar contraparte, obligación, horario y finalidad                                 |
| contenido o promoción                                      | `VPROC-0056`                                                          | publicar solo pieza, audiencia, vigencia y aprobación canónicas                        |
| consulta u oportunidad digital                             | `VPROC-0057`                                                          | crear lead/caso con origen, consentimiento, responsable y siguiente acción             |
| soporte tecnológico                                        | `VPROC-0058`                                                          | abrir incidente o solicitud técnica; no tratarlo como reclamo comercial                |
| autoridad, asesor o requerimiento formal                   | `VPROC-0064`                                                          | registrar expediente, vencimiento, responsable y evidencia formal                      |
| encuesta o satisfacción                                    | `VPROC-0068`                                                          | conservar muestra, versión y consentimiento; abrir reclamo solo mediante caso separado |

Si una interacción contiene varias intenciones, podrá originar casos vinculados.
Cada caso tendrá un propietario y estado propios; no se utilizará una categoría
ambigua como `OTRO` para conservar indefinidamente trabajo sin enrutar.

---

#### 10. Estados de enrutamiento

```text
RECEIVED
→ VALIDATING
→ CLASSIFIED
→ ROUTED
→ ACKNOWLEDGED
→ IN_PROGRESS
→ RESPONDED
→ RESOLVED O TRANSFERRED
```

Estados de excepción:

```text
NEEDS_IDENTITY
NEEDS_CONSENT
NEEDS_HUMAN_REVIEW
DUPLICATE
UNSUPPORTED
QUARANTINED
FAILED_RETRYABLE
FAILED_FINAL
```

`RESPONDED` no equivale a `RESOLVED`. Un mensaje automático no cerrará el caso.

---

#### 11. Identidad, consentimiento y privacidad

1. El canal no determinará por sí solo que dos contactos pertenecen a la misma
   persona o empresa.
2. Teléfono, correo, usuario social, cookie, device token y cuenta de marketplace
   son referencias; la vinculación con una identidad canónica deberá validarse.
3. Cliente, pagador, receptor, reclamante, candidato, proveedor, contacto B2B,
   autoridad y trabajador permanecerán diferenciados.
4. Un mensaje entrante autoriza responder sobre esa interacción cuando exista
   fundamento aplicable; no concede marketing indefinido ni reutilización para
   otra finalidad.
5. Consentimientos y preferencias tendrán propósito, canal, versión, fecha,
   fuente y revocación.
6. Las proyecciones de respuesta incluirán solo los datos necesarios.
7. Las bandejas y exportaciones no mostrarán secretos, medios de pago completos,
   datos laborales, notas internas o información de terceros.
8. La eliminación, anonimización o retención seguirá el proceso documental y las
   obligaciones aplicables; borrar un mensaje del proveedor no prueba eliminación
   del caso canónico ni viceversa.

---

#### 12. Publicación y coherencia de contenido

Todo contenido publicable deberá tener:

- pieza o dato fuente;
- versión;
- marca y audiencia;
- canal y formato;
- responsable;
- aprobación cuando corresponda;
- fecha de inicio y retiro;
- restricciones territoriales o de sede;
- enlaces y llamados a la acción;
- medición;
- estado de publicación por endpoint.

Oferta, disponibilidad, horario, precio, promoción y beneficio se proyectarán
desde su fuente canónica. Si un canal no puede actualizarse con la frescura
requerida, deberá mostrar una advertencia o limitar la promesa comercial.

Una campaña retirada no podrá permanecer activa por caché, automatización,
programación, publicación duplicada o reintento tardío.

---

#### 13. Pedidos, pagos y entregas de canales externos

##### 13.1. Pedido

Cada pedido externo tendrá:

```text
external_order_id
internal_order_id
channel_endpoint_id
contract_version
original_payload_reference
normalized_snapshot
state_mapping_version
correlation_key
idempotency_key
reconciliation_status
```

##### 13.2. Pago

El canal o proveedor podrá informar una operación técnica. PULSO y NUMERA
conservarán confirmación, soporte y conciliación según sus contratos. No se
creará una venta pagada por un texto, captura o webhook no validado.

##### 13.3. Entrega

Un estado `delivered` de tercero no sustituye receptor, evidencia, novedad y
conciliación interna. NEXO conserva el hecho logístico y PASS/PULSO presentan
solo la proyección permitida.

##### 13.4. Reintentos

```text
REINTENTO DEL PROVEEDOR
≠ NUEVO PEDIDO
≠ NUEVO COBRO
≠ NUEVA ENTREGA
≠ NUEVA COMPENSACIÓN
```

---

#### 14. Horarios, SLA y escalamiento

Cada combinación endpoint–tipo de caso deberá definir:

- horario de atención;
- tiempo objetivo de acuse;
- tiempo objetivo de primera respuesta humana;
- tiempo objetivo de resolución o transferencia;
- prioridad y criterios de urgencia;
- responsable primario y suplente;
- reglas fuera de horario;
- escalamiento por vencimiento;
- mensaje de contingencia;
- destino de casos sin clasificar;
- calendario y zona horaria.

Fuera de horario el canal podrá confirmar recepción y comunicar expectativas.
No podrá prometer resolución, disponibilidad, entrega o compensación no
verificadas.

Toda interacción material deberá terminar en uno de estos resultados:

```text
CASO CREADO
RESPUESTA AUTORIZADA
TRANSFERENCIA A OTRO PROCESO
RECHAZO JUSTIFICADO
DUPLICADO CORRELACIONADO
CIERRE CON EVIDENCIA
```

No podrá quedar únicamente como mensaje leído, estrella, etiqueta o conversación
sin responsable.

---

#### 15. Seguridad y administración de cuentas

1. Toda cuenta empresarial tendrá titular empresarial, custodio, responsable y
   suplente.
2. Se preferirán usuarios nominativos, MFA, roles delegados y recuperación
   institucional.
3. Las credenciales y tokens permanecerán en bóveda o mecanismo aprobado; el
   documento solo guardará referencias.
4. El acceso se revisará al cambiar cargo, proveedor, agencia o relación laboral.
5. Una agencia o tercero no será propietario único del dominio, cuenta, píxel,
   catálogo, número o historial.
6. Dominios, DNS, correo, redes, tiendas y marketplaces tendrán procedimiento de
   recuperación y evidencia de titularidad.
7. Webhooks validarán firma, timestamp, origen, versión y replay.
8. Automatizaciones y bots usarán principales técnicos acotados; nunca
   credenciales personales ni `service_role` como bypass general.
9. La exportación o sincronización masiva exigirá permiso, finalidad, minimización
   y auditoría.
10. Los cambios sensibles de configuración requerirán doble control cuando el
    riesgo lo justifique.

---

#### 16. Continuidad y operación degradada

Cada canal deberá definir:

- detección de indisponibilidad;
- canal alterno autorizado;
- mensaje degradado;
- captura temporal mínima;
- numeración o correlación de contingencia;
- responsable de reconciliación;
- tratamiento de duplicados;
- recuperación de mensajes o pedidos pendientes;
- verificación de publicación posterior;
- comunicación al cliente o contraparte;
- cierre del incidente en `VPROC-0058` o `VPROC-0062` cuando aplique.

La contingencia manual no podrá:

- crear un catálogo paralelo permanente;
- reutilizar una cuenta personal sin control;
- omitir consentimiento o relación con el caso;
- declarar pagado, entregado o resuelto un hecho no conciliado;
- perder el origen del canal, actor, momento o versión.

---

#### 17. Métricas objetivo

##### 17.1. Salud del canal

- disponibilidad del endpoint;
- fallos de autenticación e integración;
- webhook rechazado o reintentado;
- mensajes no ingeridos;
- latencia de publicación;
- discrepancias entre contenido esperado y publicado.

##### 17.2. Flujo operativo

- volumen por endpoint, intención y marca;
- porcentaje clasificado automáticamente y revisado por persona;
- tiempo de acuse, primera respuesta, transferencia y resolución;
- casos sin propietario o vencidos;
- tasa de duplicados y reingresos;
- transferencias incorrectas;
- backlog dentro y fuera de horario.

##### 17.3. Resultado empresarial

- consultas convertidas en oportunidades;
- oportunidades convertidas en pedido o propuesta;
- abandono por canal;
- cancelaciones, sustituciones y devoluciones;
- discrepancias de pedido, pago y entrega;
- reclamos y reincidencia;
- consentimiento, opt-out y contactos bloqueados;
- satisfacción y sesgos conocidos.

Alcance, impresiones, seguidores o aperturas podrán utilizarse como contexto,
pero no sustituirán métricas de resultado, calidad, servicio y trazabilidad.

---

#### 18. Secuencia de adopción futura

1. inventariar endpoints, titulares, accesos, cuentas, números, dominios y alias;
2. confirmar propósito, marca, empresa y audiencia;
3. eliminar o aislar endpoints huérfanos y accesos personales no gobernados;
4. asignar propietario empresarial, proceso, custodio y suplente;
5. clasificar los tipos de interacción permitidos;
6. definir sobre, adaptador, contrato, seguridad e idempotencia;
7. implementar enrutamiento y registros canónicos;
8. ejecutar en paralelo con el flujo anterior;
9. conciliar volumen, casos, pedidos, pagos y respuestas;
10. corregir divergencias;
11. realizar cutover controlado;
12. archivar o retirar endpoints legacy;
13. conservar exportación, evidencia y rollback sin reactivar doble fuente;
14. certificar métricas, continuidad y recuperación.

Un endpoint no se migrará únicamente porque el nuevo flujo “recibe mensajes”. Se
exigirá demostrar que no pierde casos, pagos, pedidos, consentimientos,
adjuntos, estados, responsables ni evidencia.

---

#### 19. Fronteras con tareas posteriores

| Decisión posterior                                                           | Tarea propietaria                                                                                                              |
| ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| proceso transversal de bodega y abastecimiento recibido por canales internos | `OPS-LOG-001`                                                                                                                  |
| proceso completo de venta B2B del Centro de Producción                       | `OPS-B2B-001`                                                                                                                  |
| capacidades y responsabilidades del personal que atiende canales             | `CAP-TAL-001` a `CAP-TAL-006`                                                                                                  |
| principios de experiencia y consistencia de superficies                      | `UX-BASE-001` a `UX-BASE-015`                                                                                                  |
| disponibilidad, seguridad, conectividad, observabilidad y continuidad        | `NFR-REQ-001` a `NFR-REQ-011`                                                                                                  |
| modalidades físicas para atención en estaciones                              | `UX-STATION-002` a `UX-STATION-012`                                                                                            |
| adaptadores, eventos, APIs, webhooks y contratos externos                    | `INT-APP-001` a `INT-APP-010`; `INT-EXT-001` a `INT-EXT-020`; `INT-SALES-001` a `INT-SALES-011`; `INT-MKT-001` a `INT-MKT-003` |
| pantallas de bandejas, configuración, campañas y casos                       | `PROC-SCREEN-001` a `PROC-SCREEN-028`                                                                                          |
| asignación de emisoras, consumidoras y prohibición de escrituras cruzadas    | `INT-APP-002`, `INT-APP-003` e `INT-APP-010`                                                                                   |

No se crea una nueva tarea para cada canal. Las diferencias de canal se
conservan como configuración y contratos dentro de los procesos existentes.

---

#### 20. Requisitos de prueba derivados

**Resultado:** GENERA OCHO REQUISITOS DE PRUEBA.

```text
TREQ-PROC-199
TREQ-PROC-200
TREQ-PROC-201
TREQ-PROC-202
TREQ-PROC-203
TREQ-PROC-204
TREQ-PROC-205
TREQ-PROC-206
```

Las filas completas se incorporan en el registro canónico regenerado. No se
entregan filas sueltas.

---

#### 21. Criterios de aceptación

- [ ] Las familias conocidas de web, redes, correo, mensajería, llamadas,
      marketplace, e-commerce, atención presencial, aplicación propia, B2B y
      feedback están cubiertas.
- [ ] Canal, endpoint, cuenta, alias, interacción, conversación y caso empresarial
      están diferenciados.
- [ ] Cada familia tiene propósitos, procesos destino, propietarios y límites.
- [ ] Existe un registro canónico de endpoints con campos suficientes para
      titularidad, seguridad, enrutamiento, continuidad y medición.
- [ ] La arquitectura no crea una fuente paralela de clientes, pedidos, pagos,
      productos, reclamos, reservas, entregas o documentos.
- [ ] Las intenciones principales se enrutan a procesos `VPROC-*` explícitos.
- [ ] Los casos multintención se separan y correlacionan.
- [ ] Identidad, consentimiento, privacidad, opt-out y retención están definidos.
- [ ] Publicación, oferta, disponibilidad, promociones y beneficios consumen
      fuentes canónicas y versiones vigentes.
- [ ] Pedidos, pagos y entregas externos tienen correlación, idempotencia y
      reconciliación.
- [ ] Cada tipo de caso define horario, SLA, responsable, suplente y escalamiento.
- [ ] No quedan bandejas, cuentas, alias o automatizaciones sin propietario.
- [ ] MFA, recuperación, bóveda, revisión de acceso y webhooks seguros están
      exigidos documentalmente.
- [ ] La contingencia conserva origen, actor, momento, caso e idempotencia.
- [ ] Las métricas miden salud, flujo y resultado; no solo métricas de vanidad.
- [ ] Cada decisión diferida tiene una tarea propietaria concreta.
- [ ] No se modificaron cuentas, plataformas, código, migraciones ni Supabase.
- [ ] `OPS-LOG-001` permanece sin iniciar.

---

#### 22. Estado y continuidad

```text
UX-STATION-001 APROBADA
OPS-CAN-001 APROBADA
OPS-LOG-001 NO INICIADA
```

No se inicia `OPS-LOG-001` hasta aprobación expresa de esta tarea.


**Dependencias:** cierre de E1, `OPS-GOV-001`, `PROC-CAT-001` y `PROC-CAT-002`.  
**Propósito:** definir propósito, propietario, actores, entradas, salidas, métricas y fronteras de la web corporativa, Instagram, correo, alias, catering, captación B2B y demás canales.  
**Continuidad:** alimenta BLOQUE X, contratos de pantallas y roadmaps de las aplicaciones consumidoras.

### ✅ OPS-LOG-001 — Diseñar el proceso transversal objetivo de Bodega y Abastecimiento

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `OPS-CAN-001 — Diseñar la arquitectura objetivo de canales corporativos y comerciales` — APROBADA  
**Siguiente tarea reservada:** `OPS-B2B-001 — Diseñar el proceso objetivo de venta B2B del Centro de Producción`  
**Artefacto producido:** `OPS-WAREHOUSE-SUPPLY-TOBE-001`  
**Ámbito:** compras, recepción comercial, ingreso físico, almacenamiento, producción abastecedora, inventario, solicitudes internas, alistamiento, despacho, transporte, recepción, retornos y conciliación  
**Cambios en código, datos, migraciones, RLS, RPC, Supabase o operación física:** no autorizados

---

#### 1. Propósito

Diseñar el proceso transversal objetivo de **Bodega y Abastecimiento** de extremo
a extremo, desde la aparición de una necesidad hasta la disponibilidad efectiva,
la entrega aceptada, la resolución de diferencias y la conciliación de sus
efectos físicos, comerciales, productivos y económicos.

El proceso deberá coordinar sin fusionar:

- necesidades de compra y reposición;
- abastecimiento desde inventario existente;
- producción requerida para surtir sedes o áreas;
- compra a proveedor;
- recepción comercial y documental;
- ingreso físico, inspección, lote, condición y ubicación;
- almacenamiento y control por LOC, posición, lote y LPN;
- solicitud y remisión interna;
- reserva, alistamiento, empaque, carga y manifiesto;
- planificación y ejecución de transporte;
- entrega, recepción, rechazo, faltante, sobrante y retorno;
- reutilizables, contenedores y cadena de custodia;
- obligaciones, costos y conciliaciones económicas derivadas.

Esta tarea define el proceso objetivo y sus contratos empresariales. No diseña
todavía las pantallas definitivas, tablas físicas, políticas RLS, migraciones,
hardware, impresoras, dispositivos, rutas técnicas ni implementación.

---

#### 2. Decisión canónica

```text
NECESIDAD
→ PLAN DE ABASTECIMIENTO
→ FUENTE APROBADA
→ EJECUCIÓN POR DOMINIO PROPIETARIO
→ RECEPCIÓN O ENTREGA CON EVIDENCIA
→ CONCILIACIÓN TRANSVERSAL
```

La cadena no tendrá una aplicación propietaria universal.

```text
ORIGO
→ necesidad de compra, proveedor, comparación, aprobación, orden y recepción comercial

FOGO
→ planificación productiva, orden, lote, consumo, calidad, empaque y cierre productivo

NEXO
→ producto físico, existencias, LOC, movimientos, condición, remisión, carga,
  custodia, transporte, recepción y retornos

NUMERA
→ obligación, pago, hechos económicos, costos y conciliación financiera
```

Por tanto:

```text
ORDEN DE COMPRA ≠ EXISTENCIA
RECEPCIÓN COMERCIAL ≠ INGRESO FÍSICO
PRODUCCIÓN TERMINADA ≠ STOCK DISPONIBLE
PREPARADO ≠ CARGADO
CARGADO ≠ DESPACHADO
DESPACHADO ≠ RECIBIDO
RECIBIDO ≠ ACEPTADO SIN DIFERENCIAS
MOVIMIENTO DE INVENTARIO ≠ OBLIGACIÓN O PAGO
```

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- cierre documental de BLOQUE E1;
- `OPS-GOV-001`, `OPS-ACT-001`, `OPS-PLAN-001` a `OPS-PLAN-004`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001`;
- `OPS-CAN-001`;
- `VPROC-0015`, `VPROC-0018` a `VPROC-0037`, `VPROC-0048`,
  `VPROC-0049`, `VPROC-0051`, `VPROC-0052`, `VPROC-0054`,
  `VPROC-0067` y, cuando corresponda, `VPROC-0069`;
- la frontera `GAP-OWN-004` entre recepción comercial ORIGO e ingreso físico
  NEXO;
- la frontera entre transporte interno NEXO y entrega comercial de pedidos
  gobernada por PULSO;
- la regla de que servicios de impresión, colas, notificaciones, Storage,
  Realtime, webhooks o principales técnicos no adquieren propiedad empresarial;
- la prohibición de autorización derivada únicamente del nombre del rol;
- la separación aprobada entre iniciador, ejecutor, supervisor, aprobador,
  entregador, conductor y receptor;
- la posibilidad de exigir PIN, reautenticación, firma u otra evidencia reforzada
  en transferencias de custodia, sin tratar la firma dibujada como identidad o
  permiso por sí sola.

La finalidad de `OPS-LOG-001` es orquestar procesos ya catalogados. No crea un
nuevo proceso monolítico ni una nueva fuente de verdad.

---

#### 4. Alcance territorial y organizativo

##### 4.1. Nodo central real

La capacidad principal de Bodega y Abastecimiento opera desde el **Centro de
Producción**.

```text
CENTRO DE PRODUCCIÓN
→ BODEGA, RECEPCIÓN, ALMACENAMIENTO, ALISTAMIENTO, DESPACHO Y LOGÍSTICA CENTRAL
```

`Centro de Distribución` no se tratará como sede física independiente mientras
no exista y sea aprobado mediante evidencia, gobierno organizativo y alta
canónica.

##### 4.2. Nodos abastecidos

El proceso deberá admitir, según producto, política y capacidad aprobadas:

- áreas internas del Centro de Producción;
- Vento Café;
- Saudo;
- Molka;
- Oficina 1 únicamente para suministros, activos o consumibles que realmente le
  correspondan;
- otros nodos futuros solo después de alta canónica.

##### 4.3. Área versus sede

**Bodega y Abastecimiento** es una responsabilidad y área operativa. No se
convierte automáticamente en una empresa, marca, sede, LOC o rol.

La ausencia temporal de una persona con cargo de bodeguero no elimina la
responsabilidad ni habilita a cualquier trabajador a asumirla sin asignación,
permiso, turno, sede, área y trazabilidad.

---

#### 5. Conceptos canónicos

##### 5.1. Señal de demanda

Hecho que informa una posible necesidad: consumo, stock mínimo, pedido, plan de
producción, pronóstico, conteo, vencimiento, devolución, apertura de sede o
solicitud humana.

No reserva inventario ni autoriza compra o producción.

##### 5.2. Necesidad de abastecimiento

Necesidad validada y priorizada con producto, presentación o unidad, cantidad,
nodo destino, fecha requerida, finalidad, criticidad y fuente de evidencia.

##### 5.3. Caso de abastecimiento

Contenedor de coordinación que relaciona una o más necesidades con decisiones
de fuente y ejecuciones propietarias. No sustituye órdenes, lotes, movimientos,
remisiones, viajes, obligaciones o pagos.

##### 5.4. Fuente de cumplimiento

Origen elegido por línea:

- stock disponible en el nodo autorizado;
- stock de otro LOC o nodo autorizado;
- producción interna;
- compra externa;
- sustitución aprobada;
- cumplimiento parcial;
- backorder;
- rechazo o cancelación justificada.

##### 5.5. Reserva

Compromiso de una cantidad elegible para una necesidad. No equivale a retiro,
consumo, carga o recepción.

##### 5.6. Remisión interna

Documento y caso operativo que coordina abastecimiento entre nodos, con
cantidades conciliables por etapa. No es factura, orden de compra, viaje, LPN,
manifiesto ni movimiento de inventario.

##### 5.7. LPN

Identidad logística de una unidad manipulable o agrupación controlada. No es una
ubicación, producto, contenedor reutilizable, activo, lote ni cantidad por sí
solo.

##### 5.8. Transferencia de custodia

Aceptación explícita de responsabilidad sobre recursos identificados, cantidades,
condición y evidencia desde un actor o nodo hacia otro.

##### 5.9. Diferencia

Brecha entre cantidades, identidad, condición, temperatura, lote, presentación,
documento o tiempo esperado y observado. Nunca se resuelve sobrescribiendo el
hecho original.

---

#### 6. Procesos propietarios participantes

| Tramo                       | Procesos principales                                   | Propietaria | Resultado protegido                                                                     | Frontera                                                                                               |
| --------------------------- | ------------------------------------------------------ | ----------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| maestro físico              | `VPROC-0015`, `VPROC-0018`                             | NEXO        | producto, presentación, unidad, especificación, alérgeno, restricción y criterio físico | FOGO aplica controles por lote; PULSO consume oferta; ningún consumidor mantiene un maestro competidor |
| necesidad y compra          | `VPROC-0019` a `VPROC-0021`                            | ORIGO       | necesidad de compra, comparación, decisión, orden y condiciones                         | una señal o selección de proveedor no autoriza por sí sola la compra                                   |
| recepción comercial         | `VPROC-0022`                                           | ORIGO       | conformidad contra orden, proveedor, documento, precio y cantidades comerciales         | no registra stock ni ubicación física                                                                  |
| almacenamiento e inventario | `VPROC-0023` a `VPROC-0027`                            | NEXO        | LOC, movimientos, saldo, condición, vencimiento, cuarentena y ajuste                    | no reabre la compra ni sustituye la decisión de calidad productiva                                     |
| abastecimiento interno      | `VPROC-0028`                                           | NEXO        | solicitud, preparación, custodia, tránsito y recepción entre nodos                      | no crea compra, plan de producción ni entrega comercial a cliente                                      |
| activos y reutilizables     | `VPROC-0029` a `VPROC-0032`; `VPROC-0067`              | NEXO        | activos, vehículos, contenedores, reutilizables, kits y retornos                        | no confunde estas entidades con stock o LPN                                                            |
| producción abastecedora     | `VPROC-0033` a `VPROC-0037`                            | FOGO        | plan, orden, lote, consumo, calidad, empaque, rendimiento y cierre                      | NEXO reserva/entrega materiales y recibe terminados liberados                                          |
| transporte interno          | `VPROC-0048`, `VPROC-0049`                             | NEXO        | plan de ruta, viaje, carga, custodia, entrega, rechazo y retorno                        | no cierra el pedido comercial de PULSO                                                                 |
| efecto económico            | `VPROC-0051`, `VPROC-0052`, `VPROC-0054`, `VPROC-0069` | NUMERA      | hecho económico, obligación, pago, costo, presupuesto y conciliación                    | no crea ni corrige el hecho físico o comercial original                                                |

---

#### 7. Modelo transversal de extremo a extremo

| Etapa     | Acción objetivo                       | Propietaria del resultado                                                           | Entrada mínima                                                         | Salida mínima                                                   | Prohibición principal                                                     |
| --------- | ------------------------------------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `LOG-01`  | detectar señal de demanda             | aplicación que origina el hecho                                                     | consumo, stock, pedido, plan, conteo o solicitud                       | señal identificada y deduplicable                               | comprar, producir o reservar automáticamente por existir la señal         |
| `LOG-02`  | validar necesidad                     | ORIGO para compra; NEXO para abastecimiento interno; FOGO para necesidad productiva | producto, unidad, destino, cantidad, fecha, finalidad y evidencia      | necesidad aceptada, corregida, rechazada o devuelta             | crear una necesidad ambigua o sin destino y unidad canónicos              |
| `LOG-03`  | consolidar y priorizar                | coordinación operativa con cada propietaria                                         | necesidades compatibles y horizonte                                    | caso de abastecimiento y prioridades                            | fusionar necesidades perdiendo su origen o responsable                    |
| `LOG-04`  | elegir fuente por línea               | propietario de la ejecución resultante                                              | disponibilidad, capacidad, lead time, vida útil, costo y restricciones | fuente propuesta y luego autorizada                             | convertir recomendación en compra, producción o traslado sin autoridad    |
| `LOG-05A` | ejecutar compra                       | ORIGO                                                                               | necesidad aprobada y fuente externa                                    | orden emitida y trazable                                        | registrar inventario o pago desde la orden                                |
| `LOG-05B` | ejecutar producción                   | FOGO                                                                                | necesidad aceptada y capacidad aprobada                                | orden, lote, calidad y producto terminado liberado              | declarar stock disponible antes del resultado liberado e ingresado        |
| `LOG-05C` | asignar stock                         | NEXO                                                                                | stock elegible y necesidad aprobada                                    | reserva o asignación por línea                                  | consumir o mover por el solo hecho de reservar                            |
| `LOG-06`  | recibir comercialmente                | ORIGO                                                                               | orden, proveedor, entrega, documento y observación                     | recepción comercial conforme, parcial, condicionada o rechazada | crear entrada física implícita                                            |
| `LOG-07`  | inspeccionar e ingresar físicamente   | NEXO, con calidad cuando aplique                                                    | evento aceptado, producto, lote, condición y cantidades                | ingreso, cuarentena o rechazo físico                            | asumir que lo facturado fue lo realmente recibido y ubicado               |
| `LOG-08`  | almacenar y custodiar                 | NEXO                                                                                | existencia elegible y LOC compatible                                   | ubicación, custodia y disponibilidad derivada                   | ubicar en LOC incompatible o sin capacidad y condición válidas            |
| `LOG-09`  | solicitar abastecimiento interno      | NEXO, originado por el área o proceso consumidor                                    | destino, producto, unidad, cantidad y fecha                            | remisión o solicitud interna versionada                         | tratar una solicitud como despacho confirmado                             |
| `LOG-10`  | reservar, alistar y verificar         | NEXO; FOGO participa si debe producir                                               | solicitud vigente y stock o producción disponible                      | cantidades asignadas, preparadas y diferencias                  | sustituir, redondear o reducir sin dejar decisión y evidencia             |
| `LOG-11`  | empacar, etiquetar y consolidar carga | NEXO; FOGO conserva empaque productivo                                              | líneas preparadas, LPN y restricciones                                 | bultos, contenedores, manifiesto y plan de carga                | confundir empaque productivo con unidad logística o contenedor retornable |
| `LOG-12`  | cargar y transferir custodia          | NEXO                                                                                | vehículo, conductor, carga y documentación válidos                     | carga aceptada por custodio y despacho habilitado               | declarar cargado o despachado sin actor y evidencia                       |
| `LOG-13`  | ejecutar ruta                         | NEXO                                                                                | viaje publicado, paradas y carga                                       | llegada, entrega, rechazo, novedad o retorno por parada         | usar una ruta configurada por producto como viaje físico                  |
| `LOG-14`  | recibir y aceptar                     | NEXO, mediante receptor autorizado                                                  | entrega identificada, cantidades y condición                           | recepción, diferencias, aceptación y custodia destino           | permitir que conductor o despachador se autoacepte la entrega             |
| `LOG-15`  | resolver diferencias y retornos       | propietaria del hecho afectado                                                      | faltante, sobrante, daño, rechazo, retorno o incidente                 | decisión, compensación física y cierre vinculado                | ajustar saldos, compra o costo mediante sobrescritura destructiva         |
| `LOG-16`  | conciliar y cerrar                    | NEXO, ORIGO, FOGO y NUMERA por sus efectos                                          | todos los resultados correlacionados                                   | cierre transversal sin pendientes huérfanos                     | considerar completo por un único estado agregado                          |

---

#### 8. Entrada única de necesidades

Toda necesidad deberá conservar:

- `need_id` estable;
- proceso y aplicación de origen;
- actor o principal técnico originador;
- empresa, sede, área y punto de consumo;
- producto y presentación o unidad canónicas;
- cantidad solicitada y unidad;
- fecha y ventana requeridas;
- finalidad o demanda relacionada;
- prioridad y motivo;
- evidencia y observaciones;
- política de sustitución;
- posibilidad de cumplimiento parcial;
- referencia a pedido, plan, lote, conteo, mínimo, incidente o presupuesto cuando
  aplique;
- clave de correlación e idempotencia.

No se aceptará una necesidad cuyo único contenido sea texto libre como “hace
falta”, “mandar varios” o “comprar lo de siempre”.

Una misma necesidad podrá dividirse en varias fuentes, pero conservará su origen
y la reconciliación de todas sus líneas.

---

#### 9. Políticas de demanda, reposición y prioridad

##### 9.1. Señales admisibles

- solicitud humana del área consumidora;
- mínimo, máximo o punto de reorden aprobado;
- consumo real e histórico;
- demanda comercial aceptada;
- plan productivo aprobado;
- faltante o diferencia confirmada;
- vencimiento próximo o stock no utilizable;
- apertura, evento o mantenimiento autorizado;
- devolución o reproceso que exija reemplazo.

##### 9.2. Parámetros por producto y nodo

Según aplique, la política deberá versionar:

- horizonte de planificación;
- stock de seguridad;
- mínimo y máximo;
- lead time;
- frecuencia y días de despacho;
- vida útil y tiempo de consumo;
- presentación mínima y múltiplo;
- MOQ de proveedor;
- capacidad de almacenamiento;
- cadena de frío;
- criticidad;
- sustituciones permitidas;
- fuentes preferidas y prohibidas;
- cobertura objetivo y tolerancia.

##### 9.3. Regla de automatización

Una regla podrá crear una señal o propuesta, pero no una compra, producción,
ajuste o despacho material sin el gate aprobado para ese proceso.

```text
UMBRAL ALCANZADO
→ PROPUESTA O NECESIDAD
≠ ORDEN DE COMPRA
≠ ORDEN DE PRODUCCIÓN
≠ AJUSTE
≠ DESPACHO
```

##### 9.4. Prioridad

La prioridad deberá derivarse de criterios versionados y visibles, por ejemplo:

- seguridad e inocuidad;
- continuidad de una sede;
- pedido o compromiso ya aceptado;
- vida útil;
- fecha requerida;
- indisponibilidad total;
- impacto económico;
- capacidad y consolidación logística.

El orden no podrá alterarse silenciosamente por el rol, canal o sede que haga más
presión.

---

#### 10. Decisión de fuente

Cada línea deberá evaluar de forma reproducible:

1. stock elegible en el nodo de origen permitido;
2. reservas y compromisos existentes;
3. condición, lote, liberación y vencimiento;
4. unidad, presentación y conversiones;
5. capacidad de producción y materiales;
6. capacidad, lead time y condiciones de proveedor;
7. frecuencia de despacho y transporte;
8. costo y presupuesto como restricciones, no como hechos físicos;
9. posibilidad de parcialidad, sustitución o backorder;
10. riesgo de pérdida, merma y obsolescencia.

Resultados permitidos por línea:

```text
STOCK_ASIGNADO
TRASLADO_AUTORIZADO
PRODUCCIÓN_REQUERIDA
COMPRA_REQUERIDA
SUSTITUCIÓN_PENDIENTE_DE_ACEPTACIÓN
CUMPLIMIENTO_PARCIAL
BACKORDER
RECHAZADA
CANCELADA
```

La recomendación automática deberá exponer sus supuestos y no podrá ocultar que
faltan datos de inventario, capacidad, lead time, costo o vida útil.

---

#### 11. Carril de compra externa

##### 11.1. Necesidad y consolidación

ORIGO recibirá necesidades de compra normalizadas, evitando que correos,
mensajes, hojas de cálculo, mínimos o remisiones se conviertan en órdenes
paralelas.

##### 11.2. Selección y aprobación

Cotizaciones, proveedor sugerido, precio histórico y recomendación podrán apoyar
la decisión, pero:

```text
COMPARACIÓN
≠ SELECCIÓN APROBADA
≠ ORDEN EMITIDA
```

Urgencias y excepciones deberán conservar motivo, autoridad, umbral, proveedor,
condición y revisión posterior.

##### 11.3. Orden

La orden deberá conservar, como mínimo:

- proveedor y sede receptora;
- líneas, unidades, cantidades y tolerancias;
- precio, impuestos, condiciones y moneda cuando apliquen;
- fechas y ventanas de entrega;
- documentos requeridos;
- criterios de calidad y frío;
- política de recepción parcial, exceso, sustitución y rechazo;
- aprobador y versión.

##### 11.4. Recepción comercial ORIGO

La recepción comercial verificará:

- correspondencia con orden;
- proveedor y documento;
- líneas y cantidades comerciales;
- precio o condición aplicable;
- parcialidad, sobrante, faltante o sustitución;
- aceptación, aceptación condicionada o rechazo;
- soporte para obligación económica.

No creará por sí sola stock, lote, LPN, ubicación o disponibilidad.

---

#### 12. Ingreso físico y frontera ORIGO–NEXO

El contrato será explícito:

```text
ORIGO CONFIRMA RECEPCIÓN COMERCIAL
        ↓ evento correlacionado e idempotente
NEXO INSPECCIONA E INGRESA EL HECHO FÍSICO
        ↓
LOC / LOTE / CONDICIÓN / LPN / CUSTODIA
```

NEXO deberá poder registrar:

- cantidad observada físicamente;
- producto y presentación reales;
- lote, serial o fecha relevante;
- vencimiento o vida útil;
- temperatura y condición cuando corresponda;
- bulto, LPN o contenedor;
- LOC, posición y capacidad;
- cuarentena, rechazo o disponibilidad;
- actor receptor y evidencia.

Si la recepción comercial y la observación física divergen, ambas se conservan.
La diferencia abre resolución; no se fuerza una igualdad ni se reescribe la
orden.

Una recepción física sin orden podrá existir únicamente mediante flujo de
excepción aprobado, con origen, motivo, autoridad, conciliación posterior y
prohibición de normalizarla como práctica ordinaria.

---

#### 13. Carril de producción abastecedora

Cuando la fuente sea producción:

```text
NECESIDAD ACEPTADA
→ PLAN PRODUCTIVO FOGO
→ RESERVA Y ENTREGA DE MATERIALES NEXO
→ ORDEN Y LOTE FOGO
→ EJECUCIÓN Y CONSUMO FOGO
→ CALIDAD Y LIBERACIÓN FOGO
→ EMPAQUE PRODUCTIVO FOGO
→ INGRESO DE TERMINADO NEXO
→ DISPONIBILIDAD PARA ABASTECIMIENTO
```

Reglas:

1. una remisión o mínimo puede originar una señal, no una orden productiva
   aprobada;
2. FOGO conserva receta, versión, escala, lote, ejecución y calidad;
3. NEXO conserva disponibilidad, reserva y movimiento de ingredientes;
4. el consumo productivo se correlaciona con la orden y lote;
5. un producto no liberado no se publica como stock utilizable;
6. empaque, etiqueta y presentación producida deben coincidir con el maestro y
   versión aprobados;
7. NEXO recibe el terminado con lote, cantidad, condición, ubicación y evento de
   origen;
8. rendimiento, merma y reproceso permanecen en FOGO; sus efectos físicos se
   reflejan mediante movimientos NEXO correlacionados;
9. NUMERA consume los hechos, pero no calcula consumo o producción sustituyendo
   los registros propietarios.

---

#### 14. Almacenamiento, LOC, lote, LPN y condición

##### 14.1. Jerarquía física

```text
SEDE
→ ÁREA
→ LOC
→ ZONA
→ POSICIÓN
```

La jerarquía exacta podrá variar por instalación, pero cada existencia deberá
resolver a un lugar físico válido y no a texto libre.

##### 14.2. Compatibilidad

Antes de ubicar se validará, según aplique:

- tipo de producto;
- temperatura;
- higiene y alérgenos;
- capacidad, peso y volumen;
- incompatibilidades;
- seguridad;
- lote y vencimiento;
- cuarentena o liberación;
- acceso y custodia;
- rotación FEFO/FIFO aprobada.

##### 14.3. Lotes y FEFO

FEFO será una regla de selección basada en fechas y condición válidas, no una
simple ordenación de pantalla.

No se podrá surtir:

- lote vencido;
- lote bloqueado o no liberado;
- cantidad ya reservada;
- existencia en condición incompatible;
- producto sin trazabilidad requerida;
- cantidad cuyo factor de conversión no esté resuelto.

##### 14.4. LPN y bultos

El LPN deberá admitir creación, contenido, división, consolidación, ubicación,
movimiento, carga, custodia, recepción, vaciado y cierre auditables.

Un bulto físico podrá contener varias líneas compatibles. Una línea podrá estar
distribuida en varios bultos. La relación deberá ser explícita.

##### 14.5. Contenedores reutilizables

Canastas, bandejas, cajas, racks u otros retornables deberán conservar:

- tipo e instancia o cantidad controlada;
- entregador y receptor;
- contenido cuando aplique;
- custodia;
- fecha esperada de retorno;
- condición;
- devolución, pérdida o sustitución.

No se confundirán con LPN, empaque desechable, activo individual o stock de
producto.

---

#### 15. Abastecimiento interno y remisiones

##### 15.1. Inicio

La solicitud deberá originarse desde un área o proceso autorizado, o desde una
regla que cree una propuesta. Deberá identificar destino, fecha, ventana,
producto, presentación, cantidad y finalidad.

##### 15.2. Cantidades por etapa

La cantidad no será un único campo mutable. Cada línea conservará, según
aplique:

```text
SOLICITADA
ACEPTADA O COMPROMETIDA
ASIGNADA
PRODUCIDA Y LIBERADA
PREPARADA
EMPACADA
CARGADA
DESPACHADA
RECIBIDA
ACEPTADA
FALTANTE
SOBRANTE
DAÑADA O RECHAZADA
RETORNADA
```

Los valores existentes `requested`, `in_production`, `ready_for_transport`,
`in_transit` y `completed` pueden permanecer como estados de alto nivel si la
máquina canónica los aprueba, pero no sustituirán las cantidades, custodias y
resultados por etapa.

##### 15.3. Parcialidad

La remisión deberá permitir:

- aceptación parcial de la solicitud;
- abastecimiento desde varias fuentes;
- producción parcial;
- despacho parcial;
- entrega parcial;
- recepción parcial;
- backorder o cancelación del saldo;
- cierre únicamente cuando cada línea tenga resultado terminal conciliado.

##### 15.4. Sustitución

Toda sustitución deberá declarar:

- producto original y sustituto;
- equivalencia o diferencia;
- cantidad y unidad;
- razón;
- actor que propone;
- actor que acepta;
- efecto sobre receta, costo, alérgenos, presentación o servicio;
- evidencia y vigencia.

No se inferirá equivalencia porque dos productos tengan nombre parecido.

##### 15.5. Solicitud urgente

La urgencia deberá conservar motivo, impacto, solicitante, autoridad, fuente,
ventana, costos o riesgos adicionales y revisión posterior. No habilita bypass de
inventario, compra, calidad, custodia o seguridad.

---

#### 16. Alistamiento, empaque, carga y manifiesto

##### 16.1. Ola o lote de alistamiento

Las solicitudes compatibles podrán agruparse para eficiencia, conservando línea,
origen, destino, prioridad, lote y resultado individual.

##### 16.2. Picking

El alistador deberá recibir una instrucción ejecutable que incluya:

- LOC y posición;
- producto, presentación y unidad;
- lote o regla de selección;
- cantidad;
- LPN o contenedor;
- destino;
- restricciones y evidencia requerida.

El sistema deberá detectar sustitución de ubicación, lote o producto y no aceptar
un escaneo distinto sin flujo autorizado.

##### 16.3. Verificación

Según riesgo, se aplicará:

- segundo conteo;
- peso o medición;
- escaneo;
- fotografía;
- control de temperatura;
- revisión de lote y vencimiento;
- verificación de completitud del kit;
- revisión de empaque y etiqueta.

##### 16.4. Plan de carga

El plan de carga deberá considerar:

- vehículo y capacidad;
- peso y volumen;
- frío y compatibilidad;
- orden de paradas y descarga;
- fragilidad;
- seguridad;
- bultos, LPN y contenedores;
- retornos esperados;
- conductor y apoyos.

##### 16.5. Manifiesto

El manifiesto identificará el viaje, vehículo, conductor, paradas, remisiones,
bultos, LPN, contenedores, cantidades, restricciones, documentación y versión.
No será una copia mutable independiente de las remisiones.

---

#### 17. Despacho, transporte y cadena de custodia

##### 17.1. Gate de despacho

No se despachará si falta, según aplique:

- vehículo disponible y apto;
- conductor y turno válidos;
- plan publicado;
- carga conciliada;
- documentos;
- evidencia de frío o condición;
- autorización;
- aceptación de custodia;
- conectividad o procedimiento de contingencia aprobado.

##### 17.2. Transferencia al conductor

```text
RESPONSABLE DE BODEGA ENTREGA
+
CONDUCTOR ACEPTA CARGA Y CONDICIÓN
+
SISTEMA CONSERVA RECURSOS, CANTIDADES, MOMENTO Y EVIDENCIA
=
CUSTODIA EN TRÁNSITO
```

El despacho no se probará solo por cambiar el estado.

##### 17.3. Viaje y paradas

Un viaje podrá agrupar varias remisiones y destinos. Cada parada conservará:

- ventana;
- llegada;
- inicio y fin de servicio;
- receptor;
- líneas y bultos previstos;
- resultado individual;
- novedad;
- retorno;
- evidencia.

La configuración de “ruta de abastecimiento” de un producto o sede no se
confundirá con un viaje físico publicado.

##### 17.4. Cadena de frío

Cuando aplique, deberán definirse:

- rango objetivo;
- punto y frecuencia de medición;
- dispositivo o método;
- actor responsable;
- excursión y tolerancia;
- retención preventiva;
- decisión de calidad;
- evidencia y calibración.

Una excursión no se resolverá borrando o sustituyendo la lectura.

---

#### 18. Recepción en destino

El receptor autorizado deberá poder:

1. identificar viaje, remisión y versión;
2. verificar sellos, bultos, LPN y contenedores;
3. comparar cantidad despachada y observada;
4. registrar condición, temperatura, daño o faltante;
5. aceptar total o parcialmente;
6. rechazar líneas o bultos con motivo;
7. registrar retorno o custodia pendiente;
8. confirmar ubicación destino;
9. firmar o confirmar cuando la política lo exija.

La evidencia reforzada podrá ser:

- PIN individual;
- reautenticación;
- firma dibujada vinculada a identidad validada;
- firma electrónica;
- fotografía;
- escaneo;
- combinación proporcional al riesgo.

```text
FIRMA DIBUJADA
≠ IDENTIDAD
≠ PERMISO
≠ ACEPTACIÓN VÁLIDA SIN CONTEXTO
```

El conductor no podrá firmar como receptor. El despachador no podrá aceptar su
propia entrega en destino. Las excepciones deberán conservar autorización y
control compensatorio.

---

#### 19. Diferencias, devoluciones y logística inversa

Tipos mínimos:

- faltante;
- sobrante;
- producto distinto;
- presentación o unidad incorrecta;
- lote o vencimiento no esperado;
- daño o condición inaceptable;
- temperatura fuera de rango;
- bulto o LPN faltante;
- contenedor no retornado;
- entrega no realizada;
- rechazo total o parcial;
- retorno sin origen;
- duplicado;
- documento o precio divergente.

Cada diferencia deberá conservar:

- esperado y observado;
- actor, momento y lugar;
- evidencia;
- estado de investigación;
- custodio actual;
- decisión y autoridad;
- movimiento correctivo o retorno;
- efecto comercial, productivo o económico;
- causa y acción preventiva.

No se corregirá modificando retroactivamente la cantidad despachada para hacerla
coincidir con la recibida.

---

#### 20. Inventario, movimientos y ajustes

##### 20.1. Ledger

NEXO conservará movimientos inmutables y proyecciones reconciliables por:

- empresa y sede;
- área, LOC y posición;
- producto y presentación;
- unidad;
- lote o serial;
- LPN;
- condición y estado;
- reserva y disponibilidad;
- origen y destino;
- proceso, documento y actor.

##### 20.2. Conteo

El conteo será una observación independiente del saldo esperado.

```text
CONTEO
→ DIFERENCIA
→ INVESTIGACIÓN
→ DECISIÓN
→ AJUSTE AUTORIZADO
```

Quien cuenta o investiga no aprobará por sí solo el ajuste correspondiente.

##### 20.3. Conversión y presentaciones

Toda conversión deberá usar el perfil vigente y conservar unidad de entrada,
unidad de stock, factor, precisión, redondeo y residuo. No se aplicarán gramos,
unidades, paquetes o presentaciones predeterminadas por ausencia de datos.

##### 20.4. Reserva y disponible

```text
FÍSICO
-
CUARENTENA
-
RESERVADO
-
NO ELEGIBLE
=
DISPONIBLE SEGÚN POLÍTICA
```

La interfaz podrá presentar una cifra resumida, pero deberá permitir explicar su
composición.

---

#### 21. Efectos económicos y NUMERA

NUMERA recibirá eventos correlacionados, no copias reconstruidas de la operación.

Ejemplos:

- orden aprobada como compromiso cuando la política lo defina;
- recepción comercial aceptada;
- factura o documento de proveedor;
- obligación y vencimiento;
- pago y conciliación bancaria;
- movimiento valorizable;
- consumo productivo;
- producto terminado;
- merma o disposición;
- transporte y costo informado;
- diferencia y resolución.

Reglas:

1. una orden no crea automáticamente obligación definitiva;
2. un ingreso físico no prueba precio, impuesto o factura;
3. una factura no prueba recepción física;
4. un pago no corrige una diferencia de inventario;
5. NUMERA no modifica cantidades operativas para cuadrar el costo;
6. los cierres podrán generar restatements versionados, no sobrescrituras;
7. `VPROC-0054` gobierna costos, distribución, cierre y rentabilidad;
8. el presupuesto permanece en `VPROC-0069` y no se confunde con gasto real.

---

#### 22. Autorización y segregación

Toda acción material deberá resolver:

```text
ACTOR EFECTIVO
+
PERMISO ATÓMICO
+
EMPRESA, SEDE, ÁREA Y RECURSO
+
TURNO, CHECK-IN Y ROL OPERATIVO CUANDO APLIQUE
+
ESTADO Y PRECONDICIONES
+
SEGREGACIÓN
+
EVIDENCIA
```

Separaciones mínimas:

- solicitante ≠ aprobador de compra crítica;
- comprador ≠ aprobador final cuando aplique segregación;
- receptor comercial ≠ aprobador de diferencia material;
- receptor físico ≠ autoridad que resuelve su propia discrepancia;
- contador ≠ aprobador de su ajuste;
- productor ≠ liberador de calidad cuando se exija control independiente;
- alistador ≠ receptor destino;
- despachador ≠ conductor cuando la política exija doble control;
- conductor ≠ receptor;
- creador de obligación ≠ aprobador y pagador sin excepción controlada.

`bodeguero`, `conductor_logistica`, `gerencia_operativa` o cualquier otro nombre
de rol no concederán autoridad por sí solos.

---

#### 23. Estados, eventos y correlación

El proceso transversal no tendrá un único estado capaz de ocultar sus dominios.
Cada objeto conservará su propia máquina de estados.

El caso de abastecimiento podrá materializar una proyección agregada derivada,
por ejemplo:

```text
NECESIDAD_PENDIENTE
FUENTE_EN_DECISIÓN
EN_COMPRA
EN_PRODUCCIÓN
EN_ASIGNACIÓN
EN_ALISTAMIENTO
EN_TRANSPORTE
RECEPCIÓN_PARCIAL
CON_DIFERENCIAS
CERRADO
CANCELADO
```

Estos nombres son semántica documental y no autorizan todavía un enum o tabla.
La proyección deberá derivarse de eventos propietarios, no reescribirlos.

Eventos mínimos correlacionables:

- necesidad creada, aceptada, dividida o cancelada;
- fuente propuesta y aprobada;
- orden de compra emitida;
- recepción comercial registrada;
- ingreso físico registrado;
- cuarentena, liberación o rechazo;
- reserva creada o liberada;
- orden de producción publicada y lote cerrado;
- remisión solicitada, asignada, preparada, cargada y despachada;
- custodia transferida;
- parada atendida;
- recepción aceptada, rechazada o parcial;
- retorno registrado;
- diferencia resuelta;
- obligación, pago o costo conciliado;
- caso cerrado.

Cada evento tendrá identificador, versión de esquema, tiempo empresarial y de
procesamiento, causa, correlación, actor o principal técnico, recurso, resultado
e idempotencia.

---

#### 24. Operación offline, concurrencia e idempotencia

##### 24.1. Offline

La captura offline podrá admitirse únicamente para acciones expresamente
aprobadas. Deberá conservar:

- actor original;
- turno, sede y área;
- dispositivo;
- recurso y versión;
- momento del hecho;
- cantidad y unidad;
- evidencia;
- clave idempotente;
- dependencia causal;
- estado `PENDIENTE_DE_SINCRONIZACIÓN` visible.

Al sincronizar se revalidarán permiso, estado, revocaciones, versión y conflictos.

##### 24.2. Concurrencia

El sistema deberá detectar, entre otros:

- dos reservas sobre la misma disponibilidad;
- dos alistadores sobre la misma línea;
- modificación de solicitud durante preparación;
- recepción contra versión de remisión obsoleta;
- doble carga o despacho;
- dos ajustes para una misma diferencia;
- repetición de recepción comercial o física;
- evento productivo o de compra fuera de orden.

##### 24.3. Idempotencia

```text
REINTENTO
≠ NUEVA NECESIDAD
≠ NUEVA ORDEN
≠ NUEVA RECEPCIÓN
≠ NUEVO MOVIMIENTO
≠ NUEVO DESPACHO
≠ NUEVA ENTREGA
≠ NUEVA OBLIGACIÓN
```

##### 24.4. Compensación

Si una cadena falla parcialmente, cada dominio aplicará compensaciones explícitas
sin borrar el hecho previo. Ejemplos: liberar reserva, crear retorno, revertir
movimiento mediante contramovimiento, cancelar saldo pendiente o bloquear
obligación hasta resolver diferencia.

---

#### 25. Contingencia y continuidad

Cada tramo deberá declarar:

- criticidad;
- operación mínima permitida;
- formato manual controlado;
- numeración o correlación temporal;
- actor autorizado;
- límite de tiempo o volumen;
- custodia de evidencia;
- prohibiciones durante contingencia;
- reconciliación y revisión posterior;
- criterio de retorno a operación normal.

Casos mínimos:

- pérdida de red;
- pérdida de energía;
- tablet o escáner no disponible;
- impresora o etiqueta no disponible;
- caída de ORIGO, NEXO, FOGO o NUMERA;
- vehículo no disponible;
- conductor ausente;
- cámara fría o equipo crítico fuera de servicio;
- proveedor incumplido;
- diferencia crítica o retiro de producto;
- imposibilidad de recibir en destino.

La contingencia no habilita cuentas compartidas, firmas genéricas, movimientos
sin origen, compras sin aprobación o cierres sin conciliación.

---

#### 26. Métricas objetivo

##### 26.1. Demanda y cobertura

- necesidades por origen, destino y criticidad;
- cobertura disponible y proyectada;
- fill rate por línea y solicitud;
- cumplimiento completo y parcial;
- backorder y cancelación;
- días de inventario y stockout;
- precisión de mínimos, máximos y pronóstico.

##### 26.2. Compra y proveedor

- lead time solicitado, prometido y real;
- cumplimiento de cantidad, fecha, precio y calidad;
- recepción parcial, rechazo y diferencia;
- urgencias y compras fuera de planificación;
- concentración y dependencia de proveedor.

##### 26.3. Bodega

- tiempo de recepción a disponibilidad;
- exactitud de ubicación y picking;
- productividad de alistamiento sin sacrificar calidad;
- ocupación y capacidad;
- rotación, vencimiento, merma y cuarentena;
- diferencias de conteo;
- LPN o contenedores abiertos y huérfanos.

##### 26.4. Transporte

- puntualidad de salida y llegada;
- primera entrega efectiva;
- utilización de vehículo y carga;
- diferencia entre cargado, entregado y recibido;
- custodias abiertas;
- retornos y contenedores pendientes;
- incidentes, kilómetros y combustible informado;
- excursiones de temperatura.

##### 26.5. Conciliación

- recepción comercial sin ingreso físico;
- ingreso sin origen aceptado;
- producción liberada sin ingreso;
- remisión sin recepción terminal;
- entrega sin aceptación;
- retorno sin cierre;
- obligación sin recepción o documento;
- costo sin hecho de origen;
- eventos duplicados o fuera de orden.

Las métricas no podrán incentivar velocidad a costa de inocuidad, exactitud,
custodia o evidencia.

---

#### 27. Secuencia futura de adopción

1. validar físicamente la línea base de `UX-STATION-001` aplicable a bodega,
   recepción, producción, despacho, conductor y recepción satélite;
2. inventariar fuentes y flujos legacy, hojas, chats, formularios, tablas,
   remisiones y documentos;
3. materializar maestros y contratos canónicos de producto, unidad, LOC, lote,
   LPN, contenedor, vehículo y actor;
4. implementar la entrada única de necesidades;
5. implementar planificación y decisión de fuente sin ejecución automática;
6. cerrar la frontera ORIGO–NEXO de recepción;
7. cerrar la frontera FOGO–NEXO de materiales y producto terminado;
8. implementar remisión, cantidades por etapa y parcialidad;
9. implementar alistamiento, carga, custodia, ruta, recepción y retornos;
10. integrar NUMERA mediante eventos reconciliables;
11. ejecutar evaluación dual con flujos legacy;
12. conciliar cantidades, estados, costos, custodias y evidencias;
13. pilotar en Centro de Producción y un nodo satélite;
14. corregir brechas;
15. realizar cutover gradual;
16. retirar fuentes competidoras y formatos temporales;
17. certificar continuidad, recuperación y cierre transversal.

No se activará descuento o incremento real de inventario únicamente porque la
interfaz de remisiones funcione. La activación deberá superar autorización,
contratos, conciliación, piloto y rollback controlado.

---

#### 28. Fronteras con tareas posteriores

| Decisión posterior                                                           | Tarea propietaria                                                                                                                            |
| ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| proceso objetivo de venta B2B y demanda del Centro de Producción             | `OPS-B2B-001`                                                                                                                                |
| capacidades, cobertura horaria, reemplazos y responsabilidades               | `CAP-TAL-001` a `CAP-TAL-006`                                                                                                                |
| principios base de experiencia                                               | `UX-BASE-001` a `UX-BASE-015`                                                                                                                |
| disponibilidad, seguridad, rendimiento, continuidad y observabilidad         | `NFR-REQ-001` a `NFR-REQ-011`                                                                                                                |
| estaciones, modalidades, periféricos y contingencia física                   | `UX-STATION-002` a `UX-STATION-012`                                                                                                          |
| dominio NEXO de producto, LOC, movimientos, LPN, custodia, flota y logística | `NEXO-DOM-001` a `NEXO-DOM-036`                                                                                                              |
| experiencia NEXO de bodega, conductor, despacho, tránsito y recepción        | `NEXO-UX-001` a `NEXO-UX-042`                                                                                                                |
| autorización NEXO                                                            | `NEXO-AUTH-001` a `NEXO-AUTH-030`                                                                                                            |
| experiencia, autorización y contratos ORIGO                                  | `ORIGO-UX-001` a `ORIGO-UX-016`; `ORIGO-AUTH-001` a `ORIGO-AUTH-015`                                                                         |
| planificación, ejecución y calidad FOGO                                      | `FOGO-UX-001` a `FOGO-UX-015`; `FOGO-AUTH-001` a `FOGO-AUTH-016`; `CAP-SCOPE-008`; paquete E5 FOGO                                           |
| obligaciones, pagos, costos y conciliación                                   | `NUMERA-DOM-001` a `NUMERA-DOM-018`; `NUMERA-UX-001` a `NUMERA-UX-028`; `NUMERA-AUTH-001` a `NUMERA-AUTH-015`; `INT-APP-001` a `INT-APP-010` |
| contratos de eventos, colas, evidencia e integraciones                       | `INT-APP-001` a `INT-APP-010`; `INT-DB-001` a `INT-DB-008`; `QUEUE-ARC-001` a `QUEUE-ARC-010`; `EVID-ARC-001` a `EVID-ARC-010`               |
| impresión y etiquetas                                                        | `PRINT-ARC-001` a `PRINT-ARC-020`                                                                                                            |
| pantallas definitivas y cobertura                                            | `PROC-SCREEN-001` a `PROC-SCREEN-028`; `PROC-COVER-001` a `PROC-COVER-010`                                                                   |
| auditoría y transformación física de Supabase                                | BLOQUE E3 y futuras migraciones exclusivamente en `vento-shell`                                                                              |

Toda brecha detectada en implementación deberá vincularse a una tarea concreta de
esta tabla o generar una tarea explícita conforme a la regla canónica global. No
se dejarán pendientes narrativos sin dueño.

---

#### 29. Requisitos de prueba derivados

**Resultado:** GENERA DIEZ REQUISITOS DE PRUEBA.

```text
TREQ-PROC-207
TREQ-PROC-208
TREQ-PROC-209
TREQ-PROC-210
TREQ-PROC-211
TREQ-PROC-212
TREQ-PROC-213
TREQ-PROC-214
TREQ-PROC-215
TREQ-PROC-216
```

Las filas completas se incorporan en el registro canónico regenerado. No se
entregan filas sueltas.

---

#### 30. Criterios de aceptación

- [ ] Se preserva que el Centro de Producción aloja la bodega y logística central
      y no se inventa un Centro de Distribución físico.
- [ ] Bodega y Abastecimiento se define como capacidad y área, no como sede,
      empresa, rol o aplicación.
- [ ] Necesidad, caso, fuente, reserva, orden, lote, movimiento, remisión, viaje,
      LPN, contenedor, custodia, obligación y costo están diferenciados.
- [ ] ORIGO, FOGO, NEXO y NUMERA conservan propiedad única de sus resultados.
- [ ] La frontera entre recepción comercial e ingreso físico es explícita e
      idempotente.
- [ ] La cadena de producción conserva materiales, receta, lote, calidad,
      terminado e ingreso NEXO separados y correlacionados.
- [ ] La entrada de necesidades exige producto, unidad, destino, cantidad, fecha,
      finalidad, evidencia e idempotencia.
- [ ] La decisión de fuente considera stock elegible, reservas, producción,
      compra, lead time, vida útil, capacidad y restricciones.
- [ ] Una señal o umbral no ejecuta compra, producción, ajuste o despacho sin
      autoridad.
- [ ] LOC, posición, lote, condición, FEFO, LPN, capacidad y compatibilidad están
      definidos.
- [ ] Remisiones conservan cantidades independientes por etapa y admiten
      parcialidad, backorder, sustitución y cierre por línea.
- [ ] Picking, verificación, empaque, carga, manifiesto y despacho están
      separados.
- [ ] Viaje, ruta configurada, parada, entrega, recepción y retorno están
      diferenciados.
- [ ] Cada transferencia de custodia exige actores distintos, recurso, cantidad,
      condición, momento y evidencia.
- [ ] El conductor no puede autoaceptar la entrega y la firma dibujada no se
      considera identidad o permiso.
- [ ] Diferencias y devoluciones conservan esperado, observado, evidencia,
      custodio, decisión y efecto correctivo.
- [ ] Conteo y ajuste permanecen separados y el ledger no se sobrescribe.
- [ ] NUMERA consume hechos correlacionados sin recrear la operación.
- [ ] Offline, concurrencia, reintentos y compensaciones no generan duplicados.
- [ ] La contingencia define operación mínima y reconciliación posterior.
- [ ] Las métricas cubren demanda, compra, bodega, transporte y conciliación.
- [ ] Cada decisión diferida tiene tarea propietaria exacta.
- [ ] No se modificaron código, datos, migraciones, Supabase ni operación física.
- [ ] `OPS-B2B-001` permanece sin iniciar.

---

#### 31. Estado y continuidad

```text
OPS-CAN-001 APROBADA
OPS-LOG-001 APROBADA
OPS-B2B-001 NO INICIADA
```

No se inicia `OPS-B2B-001` hasta aprobación expresa de esta tarea.


**Dependencias:** cierre de E1, `OPS-GOV-001`, `OPS-ACT-001` y `PROC-CAT-002`.  
**Propósito:** diseñar de extremo a extremo solicitud, compra, recepción de proveedor, recepción de producción, almacenamiento, conteo, alistamiento, despacho, entrega al conductor, carga, reemplazos y cobertura horaria.  
**Propiedad:** ORIGO conserva compras y recepción comercial; NEXO conserva inventario, ubicación, movimientos, alistamiento y logística; FOGO conserva producción; NUMERA consume hechos económicos.  
**Límite:** no duplica las tareas UX de ORIGO o NEXO; les entrega el contrato transversal aprobado.

### ✅ OPS-B2B-001 — Diseñar el proceso objetivo de venta B2B del Centro de Producción

**Estado:** APROBADA  
**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal  
**Tarea anterior:** `OPS-LOG-001 — Diseñar el proceso transversal objetivo de Bodega y Abastecimiento` — APROBADA  
**Siguiente tarea reservada:** `CAP-TAL-001 — Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA`  
**Artefacto producido:** `OPS-B2B-COMMERCIAL-FULFILLMENT-TOBE-001`  
**Proceso canónico principal:** `VPROC-0041 — Gestionar cotización, aprobación, capacidad, producción, facturación y entrega de catering o venta B2B`  
**Aplicación propietaria del compromiso comercial:** `pulso`  
**Naturaleza:** capacidad futura condicionada; diseño aprobado no equivale a lanzamiento, oferta pública ni disponibilidad operativa  
**Cambios en código, datos, migraciones, RLS, RPC, Supabase, precios reales, contratos o operación física:** no autorizados

---

#### 1. Propósito

Diseñar el proceso objetivo completo para convertir una oportunidad empresarial o
solicitud de catering en un compromiso comercial B2B **viable, aprobado,
producible, entregable, facturable y conciliable**, sin prometer capacidad,
precio, crédito, inventario o fecha antes de que los dominios propietarios los
confirmen.

El diseño deberá cubrir:

- identificación y validación de la contraparte;
- oportunidad, requerimientos y calificación comercial;
- catálogo, presentación, especificación y disponibilidad B2B;
- costeo, precio, descuento, impuestos y margen;
- capacidad productiva, materiales, almacenamiento y logística;
- cotización, revisión, aprobación y vigencia;
- aceptación del cliente y prueba de autoridad del representante;
- anticipo, pago, crédito, cartera y riesgo de contraparte;
- reserva de capacidad y creación del compromiso operativo;
- compra, producción, inventario, alistamiento, despacho y entrega;
- cambios, sustituciones, cancelaciones, devoluciones y reclamos;
- facturación, reconocimiento económico, cobro y conciliación;
- cierre, métricas, trazabilidad, contingencia y readiness.

Esta tarea no abre ventas B2B ni fija productos, tarifas, márgenes, descuentos,
montos de crédito, zonas de entrega o fechas reales. Esos valores deberán surgir
de datos, aprobaciones, configuraciones y pruebas posteriores.

---

#### 2. Decisión canónica

```text
OPORTUNIDAD O SOLICITUD
→ REQUERIMIENTOS VERIFICADOS
→ OFERTA Y COSTO VIGENTES
→ CAPACIDAD Y LOGÍSTICA CONFIRMADAS
→ COTIZACIÓN APROBADA
→ ACEPTACIÓN VÁLIDA DEL CLIENTE
→ CONDICIONES DE PAGO O CRÉDITO CUMPLIDAS
→ CAPACIDAD RESERVADA
→ CUMPLIMIENTO OPERATIVO
→ ENTREGA Y ACEPTACIÓN
→ FACTURACIÓN, CARTERA Y CONCILIACIÓN
→ CIERRE COMERCIAL
```

Por tanto:

```text
LEAD ≠ CLIENTE B2B APROBADO
CONVERSACIÓN ≠ SOLICITUD COMPLETA
SOLICITUD ≠ COTIZACIÓN
COTIZACIÓN ≠ PEDIDO
ACEPTACIÓN DEL CLIENTE ≠ APROBACIÓN INTERNA
CAPACIDAD ESTIMADA ≠ CAPACIDAD RESERVADA
ANTICIPO ≠ PAGO TOTAL
PRODUCCIÓN TERMINADA ≠ ENTREGA ACEPTADA
FACTURA EMITIDA ≠ CARTERA COBRADA
ENTREGA FÍSICA ≠ CIERRE COMERCIAL
```

`PULSO` conservará el caso, la propuesta, el compromiso comercial, sus versiones,
condiciones y cierre frente al cliente. Los demás dominios conservarán sus hechos
propios y no se convertirán en editores competidores del caso comercial.

---

#### 3. Dependencias y decisiones preservadas

Esta propuesta consume y no reemplaza:

- cierre documental de BLOQUE E1;
- `OPS-GOV-001`, `OPS-PLAN-001` a `OPS-PLAN-004`;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-STATION-001`;
- `OPS-CAN-001` y su arquitectura de canales;
- `OPS-LOG-001` y su contrato transversal de bodega y abastecimiento;
- `VPROC-0015` a `VPROC-0017`, `VPROC-0019` a `VPROC-0028`,
  `VPROC-0033` a `VPROC-0037`, `VPROC-0041` a `VPROC-0054`,
  `VPROC-0056`, `VPROC-0057` y `VPROC-0068` cuando correspondan;
- la propietaria `pulso` aprobada para `VPROC-0041`;
- la frontera AURA → PULSO: AURA califica oportunidad; PULSO crea y gobierna
  cotización, pedido y compromiso operativo;
- la frontera PULSO → FOGO/NEXO/ORIGO/NUMERA: PULSO coordina el compromiso, pero
  no fabrica producción, inventario, compra, entrega o hechos económicos;
- la separación entre pedido, pago, caja, factura, cartera, entrega y reclamo;
- la prohibición de autorizar por nombre de rol;
- la segregación entre preparación, aprobación, ejecución y aceptación;
- las reglas de idempotencia, firma, dispositivos compartidos y evidencia ya
  aprobadas.

`OPS-B2B-001` no crea una nueva aplicación, marca, empresa, sede, caja, inventario
ni canal. Tampoco declara que catering sea una empresa o unidad jurídica
independiente.

---

#### 4. Estado objetivo y condición de capacidad futura

La venta B2B del Centro de Producción permanecerá en estado:

```text
FUTURA_CONTRATADA_POR_DISEÑO
NO_OFERTABLE
NO_NAVEGABLE
NO_OPERATIVA
```

hasta superar la puerta definida en la sección 26.

La aprobación documental de esta tarea autoriza únicamente a utilizar el diseño
como contrato de referencia para tareas posteriores. No autoriza:

- publicar un catálogo B2B;
- aceptar pedidos;
- prometer fechas;
- reservar capacidad;
- abrir crédito;
- emitir tarifas definitivas;
- vender productos no aprobados;
- crear inventario paralelo;
- facturar desde una entidad no confirmada;
- utilizar cuentas personales para recaudo;
- ejecutar pilotos con clientes reales sin puerta expresa.

---

#### 5. Alcance comercial

##### 5.1. Modalidades cubiertas

| Código     | Modalidad                         | Característica material                                                       | Ejemplos de resultado                                   | Regla                                                                                          |
| ---------- | --------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `B2B-PROG` | suministro empresarial programado | entregas repetidas bajo condiciones y frecuencia aprobadas                    | pedido recurrente, calendario, reposición acordada      | cada ocurrencia conserva pedido, capacidad, entrega y factura propias                          |
| `B2B-PUNT` | pedido empresarial puntual        | compra única con cotización o condiciones especiales                          | lote para empresa, cafetería, restaurante o institución | no crea relación recurrente ni crédito por sí solo                                             |
| `CAT-EMP`  | catering empresarial              | producción y servicio o entrega asociados a evento de una organización        | alimentos, bebidas, montaje o entrega acordada          | evento, pedido, producción, logística y aceptación permanecen diferenciados                    |
| `EV-COM`   | evento comercial complejo         | compromiso con fecha, sede, asistentes, restricciones y coordinación especial | evento corporativo, activación o atención programada    | `VPROC-0047` puede administrar reserva y comunicación; `VPROC-0041` conserva la venta compleja |
| `B2B-DIST` | distribución o reventa            | compra para reventa, transformación o distribución                            | catálogo mayorista autorizado                           | solo se habilita si producto, empaque, etiquetado, territorio y política comercial lo permiten |

##### 5.2. Fuera de alcance ordinario

No se asumirán incluidos:

- maquila o fabricación para terceros;
- marca privada;
- desarrollo exclusivo de producto;
- franquicia o licencia de marca;
- exportación;
- consignación;
- distribución exclusiva;
- venta de fórmulas, recetas o propiedad intelectual;
- prestación de servicios industriales ajenos a la capacidad aprobada.

Una solicitud de ese tipo se clasificará, conservará y escalará. No se convertirá
en pedido B2B hasta que exista proceso, evaluación legal, costeo, propiedad,
capacidad y aprobación específicos. Cuando el núcleo sea desarrollo de producto,
la oportunidad se vinculará con `VPROC-0016` sin alterar `VPROC-0041`.

##### 5.3. Frontera frente a una venta ordinaria

Una compra grande no será B2B automáticamente. Se utilizará `VPROC-0041` cuando
exista al menos una condición material como:

- cotización o negociación formal;
- contraparte empresarial;
- precio, descuento o crédito especial;
- producción anticipada o capacidad reservada;
- especificación, empaque o presentación B2B;
- entrega programada o múltiples destinos;
- contrato, orden de compra o documento de aceptación;
- facturación o cartera empresarial;
- evento, catering o coordinación interáreas compleja;
- condiciones de devolución, servicio o aceptación distintas de la venta directa.

Las ventas ordinarias de mostrador, mesa o canal externo permanecerán en
`VPROC-0038`, `VPROC-0039` o `VPROC-0040`.

---

#### 6. Cliente objetivo y contraparte

##### 6.1. Tipos de contraparte admisibles

El proceso podrá evaluar, sin preaprobar, contrapartes como:

- empresas privadas;
- restaurantes, cafeterías, hoteles o comercios;
- instituciones educativas, de salud, culturales o sociales;
- organizadores de eventos;
- entidades públicas cuando el marco contractual y documental sea viable;
- distribuidores o revendedores autorizados;
- organizaciones sin ánimo de lucro;
- personas naturales cuando contraten un evento o catering complejo, conservando
  el tratamiento tributario y contractual correspondiente.

##### 6.2. Identidades diferenciadas

```text
CUENTA B2B
≠ REPRESENTANTE LEGAL
≠ CONTACTO COMERCIAL
≠ CONTACTO OPERATIVO
≠ PAGADOR
≠ RECEPTOR
≠ BENEFICIARIO
≠ USUARIO AUTENTICADO
```

Cada rol de contraparte deberá conservar identidad, facultad, vigencia y alcance.
La aceptación de una cotización por un contacto sin autoridad suficiente no
creará un compromiso válido.

##### 6.3. Expediente mínimo de contraparte

Según riesgo y modalidad, deberá incluir:

- identificador de cuenta;
- razón social o nombre verificable;
- tipo y número de identificación cuando sea necesario;
- datos de facturación;
- direcciones y destinos;
- contactos y funciones;
- representante o autoridad de aceptación;
- consentimiento y finalidades de contacto;
- condiciones de pago;
- estado de crédito o anticipo;
- documentos y vigencias;
- restricciones de entrega;
- historial de pedidos, diferencias y cartera;
- clasificación de riesgo;
- responsable interno.

Se aplicará minimización: logística recibirá únicamente la proyección necesaria
para entregar; producción no recibirá información financiera o personal que no
requiera.

---

#### 7. Propiedad funcional y fronteras

| Dominio                | Responsabilidad propietaria                                                                                                            | No puede sustituir                                                        |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| AURA                   | lead, oportunidad, origen, pipeline, siguiente acción y transferencia a operación                                                      | cotización aprobada, pedido, producción, factura o cartera                |
| PULSO                  | caso B2B, requerimientos, oferta, cotización, versiones, condiciones, pedido, aceptación comercial, cambios y cierre frente al cliente | producción, inventario, compra, entrega física, obligación o cobro        |
| FOGO                   | receta, capacidad productiva, plan, orden, lote, consumo, calidad, rendimiento, empaque productivo y liberación                        | precio comercial, aceptación del cliente, inventario disponible o factura |
| NEXO                   | existencia física, reserva, LOC, LPN, alistamiento, bultos, carga, custodia, ruta, entrega, retorno y diferencia física                | cotización, precio, crédito, producción o facturación                     |
| ORIGO                  | compra de materiales, proveedor, orden y recepción comercial                                                                           | pedido B2B, inventario físico, producción o venta                         |
| NUMERA                 | costo, margen, escenario, obligación, factura económica, pago, cartera, conciliación y rentabilidad                                    | pedido, entrega física o capacidad productiva                             |
| VISO                   | supervisión, aprobación y lectura transversal según permiso                                                                            | edición universal de registros propietarios                               |
| BLOQUE X / adaptadores | intercambio con correo, formularios, WhatsApp, Shopify, ERP, facturación o terceros                                                    | autoridad empresarial o fuente única de verdad                            |

##### 7.1. Handoff AURA → PULSO

La oportunidad deberá transferirse con:

- `opportunity_id`;
- origen y canal;
- contraparte preliminar;
- necesidad y alcance;
- fecha y siguiente acción;
- responsable;
- consentimiento y restricciones;
- adjuntos permitidos;
- correlación e idempotencia.

PULSO aceptará, devolverá o rechazará el handoff. Una conversación o lead no se
convertirá automáticamente en pedido.

##### 7.2. Coordinación sin registro monolítico

El caso B2B podrá mostrar una vista transversal, pero cada dominio conservará su
registro y estados. PULSO mantendrá referencias y proyecciones; no copiará como
campos mutables independientes los hechos propietarios de FOGO, NEXO, ORIGO o
NUMERA.

---

#### 8. Catálogo y oferta B2B

##### 8.1. Producto elegible

Un producto solo podrá ofertarse si tiene:

- identidad canónica activa;
- receta o especificación aprobada cuando aplique;
- presentación y unidad vendible B2B;
- empaque y etiqueta definidos;
- vida útil y condiciones de conservación;
- alérgenos e información obligatoria;
- lote o trazabilidad requerida;
- capacidad productiva o fuente de abastecimiento;
- costo vigente con nivel de confianza aceptable;
- precio o regla de precio aprobados;
- MOQ, múltiplos y tolerancias;
- lead time y corte;
- zonas y modalidades de entrega;
- política de sustitución, devolución y reclamo;
- estado de disponibilidad.

##### 8.2. Disponibilidad comercial

Estados mínimos de oferta:

```text
BORRADOR
EN_VALIDACIÓN
APROBADA_NO_PUBLICADA
PUBLICADA
SUSPENDIDA
AGOTADA_TEMPORALMENTE
RETIRADA
```

La publicación no podrá derivarse solo de que exista un producto o receta.
`VPROC-0017` conservará oferta y disponibilidad; `VPROC-0041` capturará el
snapshot usado en cada cotización.

##### 8.3. Presentaciones y personalización

Se distinguirán:

- producto base;
- presentación comercial;
- unidad de pedido;
- unidad logística;
- empaque;
- etiqueta;
- personalización permitida;
- sustitución aceptable.

Una solicitud personalizada no podrá modificar silenciosamente el maestro. Si
requiere nuevo producto, receta, empaque o etiqueta, se abrirá evaluación
separada y la cotización permanecerá condicionada.

##### 8.4. Catálogo por segmento

La oferta podrá variar por segmento, territorio, volumen, canal o contrato,
siempre mediante reglas versionadas. No se crearán listas de precio privadas en
archivos o chats sin propietario, vigencia y reconciliación.

---

#### 9. Costeo, precio, margen y descuentos

##### 9.1. Costeo mínimo

Antes de aprobar una oferta deberán considerarse, según aplique:

- ingredientes y materiales;
- merma y rendimiento;
- mano de obra directa o estándar;
- empaque, etiquetas y retornables;
- frío, almacenamiento y preparación;
- transporte y última milla;
- comisiones del canal;
- impuestos y retenciones;
- servicio, montaje o equipos;
- costo financiero y riesgo de cartera;
- devoluciones, reprocesos y contingencia;
- costos indirectos asignados conforme a política.

NUMERA conservará costo estándar, real, supuestos, escenarios y vigencia. PULSO
consumirá el resultado autorizado, no recalculará un costo competidor.

##### 9.2. Precio

Cada precio deberá registrar:

- lista o contrato;
- moneda e impuestos aplicables;
- unidad y presentación;
- segmento y territorio;
- cantidad o escalas;
- modalidad de entrega;
- vigencia;
- costo y margen de referencia;
- aprobador;
- causa y evidencia;
- versión.

##### 9.3. Descuentos y excepciones

```text
PRECIO SUGERIDO
≠ PRECIO APROBADO
≠ PRECIO ACEPTADO POR EL CLIENTE
```

Descuentos, bonificaciones, muestras, fletes absorbidos, plazos especiales,
compensaciones o precios por debajo del umbral deberán resolver autoridad,
motivo, impacto de margen y vigencia. Quien prepara la cotización no aprobará su
propia excepción crítica.

No se fijan porcentajes ni montos en esta tarea. Los umbrales serán configuración
versionada y probada.

---

#### 10. Capacidad y promesa comercial

##### 10.1. Capacidad evaluada

La evaluación deberá considerar:

- área productiva;
- receta y equipo;
- personal y cobertura horaria;
- turnos y ventanas;
- materiales e inventario;
- compras requeridas y lead time;
- capacidad nominal y efectiva;
- capacidad ya comprometida;
- tiempos de preparación, enfriamiento, empaque y liberación;
- vida útil;
- almacenamiento;
- vehículos, rutas y destinos;
- limpieza, cambios de línea y alérgenos;
- mantenimiento o indisponibilidad;
- contingencia.

##### 10.2. Niveles de capacidad

```text
ESTIMADA
VALIDADA
OFERTABLE
RESERVADA
CONSUMIDA
LIBERADA
```

Una estimación podrá apoyar una cotización preliminar, pero la promesa firme
exigirá capacidad validada y una reserva asociada a versión, cantidad, fecha y
condiciones.

##### 10.3. Reserva

La reserva deberá:

- tener vigencia;
- identificar productos, cantidades y ventanas;
- diferenciar materiales, producción, almacenamiento y transporte;
- evitar doble compromiso;
- expirar o liberarse de forma auditable;
- revalidarse ante cambio de alcance;
- no consumir inventario ni declarar producción.

##### 10.4. Gate de promesa

PULSO no podrá enviar una cotización firme o confirmar un pedido si faltan los
gates de producto, costo, precio, capacidad, materiales, logística, pago o
crédito aplicables.

---

#### 11. Requerimientos y toma de solicitud

La solicitud deberá capturar, según modalidad:

- contraparte y contactos;
- tipo de solicitud;
- productos o necesidad;
- cantidades y unidades;
- fecha, ventana y destinos;
- frecuencia o recurrencia;
- asistentes o cobertura cuando sea evento;
- restricciones alimentarias y alérgenos declarados;
- empaque, etiquetado y presentación;
- servicio, montaje, equipos o personal;
- documentación requerida;
- presupuesto orientativo, si fue suministrado;
- condiciones de pago;
- requisitos contractuales;
- criterio de aceptación;
- cambios y cancelación;
- evidencia y adjuntos;
- origen, responsable, correlación e idempotencia.

Texto libre podrá complementar, pero no sustituir campos estructurados críticos.
Un requerimiento incompleto se devolverá con preguntas explícitas; no se llenará
por suposición.

---

#### 12. Cotización y versiones

##### 12.1. Contenido mínimo

Una cotización deberá indicar:

- emisor y contraparte;
- número y versión;
- productos, especificaciones y cantidades;
- precio, impuestos y moneda;
- validez;
- fecha y ventana de entrega;
- destinos y flete;
- alcance de servicio;
- supuestos y exclusiones;
- sustituciones permitidas;
- anticipo, saldo, crédito y vencimientos;
- condiciones de cambio y cancelación;
- criterios de aceptación;
- documentos anexos;
- responsable y aprobaciones internas;
- forma válida de aceptación.

##### 12.2. Versionado

Toda modificación material generará nueva versión. La aceptación siempre se
vinculará a la versión exacta y a un snapshot no mutable.

```text
COTIZACIÓN v1 ENVIADA
→ CAMBIO MATERIAL
→ COTIZACIÓN v2
→ v1 NO PUEDE SER ACEPTADA COMO v2
```

##### 12.3. Aprobación interna

Antes de envío, se verificará:

- producto y condiciones;
- costo y margen;
- descuento o excepción;
- capacidad;
- compras requeridas;
- logística;
- crédito o anticipo;
- términos contractuales;
- autoridad según umbral.

##### 12.4. Envío y evidencia

Correo, portal, WhatsApp u otro canal será transporte. PULSO conservará versión,
canal, destinatario, momento y resultado. Un mensaje enviado no prueba lectura o
aceptación.

---

#### 13. Aceptación del cliente y formalización

Formas admisibles, según riesgo y política:

- aceptación autenticada en portal;
- firma electrónica;
- firma manuscrita digitalizada con validación adicional;
- orden de compra verificable;
- correo desde contacto autorizado;
- contrato firmado;
- anticipo con referencia y condiciones explícitas;
- confirmación presencial con actor y evidencia.

```text
FIRMA DIBUJADA
≠ IDENTIDAD COMPROBADA
≠ AUTORIDAD DE REPRESENTACIÓN
≠ ACEPTACIÓN DE UNA VERSIÓN DISTINTA
```

La aceptación deberá conservar:

- cuenta y persona;
- facultad o relación;
- cotización y versión;
- contenido mostrado;
- condiciones aceptadas;
- fecha y canal;
- evidencia;
- resultado de verificación;
- correlación e idempotencia.

La aceptación del cliente no sustituye la aprobación interna ni crea capacidad
si esta expiró o cambió.

---

#### 14. Pago, anticipo, crédito y cartera

##### 14.1. Modalidades

Podrán configurarse, sin aprobarse en esta tarea:

- pago total anticipado;
- anticipo y saldo;
- pago contra entrega;
- crédito empresarial;
- hitos de pago;
- recaudo mediante proveedor autorizado.

##### 14.2. Gate financiero

Antes de reservar o iniciar cumplimiento deberá verificarse el gate aplicable:

- anticipo conciliado;
- crédito aprobado y vigente;
- límite disponible;
- ausencia de bloqueo;
- documento contractual requerido;
- excepción autorizada.

Un comprobante enviado por el cliente no equivaldrá a pago confirmado.
`VPROC-0043` conservará el pago y `VPROC-0053` la cartera y cobranza.

##### 14.3. Crédito

La evaluación de crédito deberá conservar:

- solicitante y cuenta;
- monto y plazo;
- criterio y fuentes;
- aprobador;
- límite;
- vigencia;
- garantías o documentos cuando apliquen;
- exposición actual;
- excepciones;
- revisión y bloqueo.

No se derivará crédito por antigüedad, amistad, cargo del contacto o historial
informal.

---

#### 15. Creación del compromiso operativo

Al cumplirse aceptación y gates, PULSO creará o confirmará un pedido B2B
versionado con:

- caso y cotización origen;
- cuenta y contactos;
- líneas, cantidades y unidades;
- precios y condiciones;
- fechas y destinos;
- modalidad de entrega;
- criterio de aceptación;
- hitos de pago;
- reservas de capacidad;
- requerimientos productivos;
- necesidades de compra;
- requerimientos logísticos;
- correlación y claves idempotentes.

La creación deberá emitir comandos o eventos hacia los dominios responsables.
Un fallo parcial no se ocultará: cada handoff tendrá estado, error, reintento y
recuperación.

---

#### 16. Cumplimiento transversal

| Tramo                          | Propietaria                         | Entrada                                     | Resultado protegido                               | Frontera                                                      |
| ------------------------------ | ----------------------------------- | ------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------- |
| confirmar oferta y pedido      | PULSO                               | cotización aceptada y gates cumplidos       | compromiso comercial versionado                   | no crea producción, inventario, compra ni factura por sí solo |
| comprar faltantes              | ORIGO                               | necesidad correlacionada y aprobada         | orden y recepción comercial                       | no declara material disponible                                |
| reservar y entregar materiales | NEXO                                | necesidad productiva y stock elegible       | reserva y movimiento físico                       | no modifica receta ni producción                              |
| planificar y producir          | FOGO                                | pedido y capacidad reservada                | orden, lote, consumo, calidad y producto liberado | no fija precio ni declara entrega                             |
| ingresar y almacenar terminado | NEXO                                | lote liberado FOGO                          | existencia, LOC, condición, LPN y disponibilidad  | no cierra producción ni venta                                 |
| alistar y despachar            | NEXO                                | pedido y stock asignado                     | bultos, carga, custodia y viaje                   | no factura ni acepta por cliente                              |
| entregar                       | NEXO o tercero contratado           | viaje y carga                               | entrega física, diferencias y evidencia           | no cierra automáticamente caso comercial                      |
| aceptar comercialmente         | PULSO                               | evidencia de entrega y criterio contractual | aceptación, rechazo o pendiente comercial         | no corrige físicamente inventario                             |
| facturar y cobrar              | NUMERA y sistema fiscal aplicable   | hecho comercial válido                      | factura, obligación, pago y cartera               | no crea entrega ni producción                                 |
| conciliar y cerrar             | PULSO con proyecciones propietarias | todos los hitos                             | compromiso cerrado o pendientes explícitos        | no sobrescribe registros fuente                               |

---

#### 17. Producción, calidad y liberación

La producción B2B deberá:

1. usar receta, especificación y versión aprobadas;
2. vincular cada lote al pedido y línea B2B;
3. validar materiales, alérgenos, equipos y capacidad;
4. registrar actor efectivo, turno, cantidades, desperdicio y rendimiento;
5. separar producido, aprobado, rechazado, reprocesado y liberado;
6. conservar muestras, controles o evidencia cuando aplique;
7. aplicar empaque y etiqueta correctos;
8. impedir que un producto no liberado pase a inventario disponible;
9. notificar desviaciones sin cambiar silenciosamente la promesa comercial;
10. emitir hechos consumibles por NEXO y NUMERA mediante contratos idempotentes.

Una desviación de rendimiento o calidad abrirá decisión de recuperación,
parcialidad, sustitución, nueva fecha o cancelación. El sistema no prometerá
recuperación automática.

---

#### 18. Inventario, alistamiento y despacho

Se aplicarán las reglas aprobadas en `OPS-LOG-001`:

- stock elegible por producto, presentación, lote, condición, LOC y reserva;
- FEFO/FIFO cuando corresponda;
- cantidades independientes por etapa;
- LPN, bultos y contenedores diferenciados;
- picking y verificación;
- empaque logístico;
- carga y manifiesto;
- transferencia de custodia;
- parcialidad y backorder;
- reconciliación de diferencias;
- operación offline e idempotencia.

El inventario reservado para B2B no será vendible o utilizable por otros flujos
salvo liberación explícita. Una cancelación deberá liberar reservas y tratar los
productos ya producidos según condición, vida útil y decisión autorizada.

---

#### 19. Entrega y aceptación

##### 19.1. Entrega física

Deberá registrar:

- pedido y versión;
- destino y ventana;
- vehículo o tercero;
- conductor o custodio;
- bultos, LPN y cantidades;
- condición y temperatura;
- receptor;
- llegada, entrega, rechazo o novedad;
- evidencia;
- diferencias y retornos.

##### 19.2. Aceptación comercial

El criterio puede ser:

- entrega de cantidades y condición;
- instalación o montaje;
- verificación de servicio;
- firma o acta;
- período de observación;
- aceptación parcial por línea o hito.

La aceptación física no reemplazará requisitos contractuales adicionales, pero
estos no podrán utilizarse para ocultar una entrega defectuosa.

##### 19.3. Firmas

Según riesgo, se permitirá PIN, OTP, reautenticación, firma dibujada, firma
electrónica, fotografía o escaneo. La evidencia quedará ligada a actor, facultad,
contenido, versión, cantidades, momento y dispositivo.

Conductor, despachador o ejecutivo comercial no podrán aceptar en nombre del
cliente sin representación válida documentada.

---

#### 20. Facturación, hechos económicos y cierre financiero

##### 20.1. Disparador de facturación

La política deberá definir si la factura se emite:

- al aceptar el pedido;
- al recibir anticipo;
- al producir;
- al despachar;
- al entregar;
- por hitos;
- periódicamente para suministro recurrente.

El disparador deberá ser explícito y compatible con la normativa y el contrato.
No se inferirá de un estado genérico.

##### 20.2. Datos mínimos

- emisor confirmado;
- cuenta y datos fiscales;
- pedido, entrega o hito;
- líneas, cantidades y precios;
- impuestos, retenciones y moneda;
- anticipos y saldos;
- vencimiento y condiciones;
- documento fiscal externo e identificador;
- estado, corrección o anulación;
- correlación e idempotencia.

##### 20.3. Cierre

`COMMERCIAL_COMMITMENT_CLOSED` solo será posible cuando:

- cada línea tenga resultado terminal o pendiente con dueño;
- producción y compras estén conciliadas;
- inventario y entrega tengan resultado;
- aceptación o reclamo estén resueltos o vinculados;
- factura, anticipo, pago o cartera estén relacionados;
- devoluciones y compensaciones tengan destino;
- costos y margen puedan calcularse con nivel de confianza declarado;
- no existan custodias, reservas o documentos huérfanos.

Cerrar el compromiso no elimina cartera futura ni garantías; las conserva como
procesos vinculados.

---

#### 21. Cambios, sustituciones y cancelaciones

##### 21.1. Clasificación del cambio

Todo cambio se clasificará como:

- no material;
- material comercial;
- productivo;
- logístico;
- financiero;
- contractual;
- de seguridad o inocuidad.

##### 21.2. Revalidación

Un cambio material exigirá nueva versión y revalidación de:

- precio y margen;
- capacidad;
- materiales;
- fecha;
- logística;
- pago o crédito;
- aceptación del cliente;
- aprobación interna.

##### 21.3. Sustitución

La sustitución conservará original, alternativa, equivalencia, alérgenos,
presentación, cantidad, precio, fecha, impacto y aceptación. No podrá aplicarse
por disponibilidad interna sin consentimiento cuando cambie materialmente lo
contratado.

##### 21.4. Cancelación

La política deberá definir:

- ventana y autoridad;
- costos incurridos;
- anticipo y devolución;
- materiales comprometidos;
- producción iniciada o terminada;
- reservas y liberación;
- producto reutilizable o perecedero;
- transporte;
- factura o nota aplicable;
- evidencia y conciliación.

La cancelación no borrará el pedido ni sus hechos.

---

#### 22. Devoluciones, reclamos y compensaciones

Las devoluciones y reclamos se vincularán con `VPROC-0042` y `VPROC-0046` según
naturaleza. Deberán diferenciar:

- faltante;
- sobrante;
- producto distinto;
- empaque o etiqueta incorrectos;
- daño;
- calidad o inocuidad;
- temperatura;
- entrega tardía;
- servicio incompleto;
- documento o precio;
- cancelación;
- rechazo total o parcial.

Toda compensación deberá indicar causa, autoridad, monto o efecto, relación con
factura, inventario y cartera, y si implica devolución física, reposición,
descuento, nota, reembolso o crédito futuro.

Una respuesta por WhatsApp o una reposición física no cerrará por sí sola el
reclamo comercial y económico.

---

#### 23. Estados canónicos de `VPROC-0041`

Se preserva la máquina aprobada:

```text
COMMERCIAL_REQUEST_RECEIVED
→ REQUIREMENTS_UNDER_REVIEW
→ QUOTATION_PREPARING
→ QUOTATION_PENDING_APPROVAL
→ QUOTATION_SENT
→ CUSTOMER_ACCEPTANCE_PENDING
→ CAPACITY_RESERVED
→ IN_FULFILLMENT
→ DELIVERY_AND_BILLING_PENDING
→ COMMERCIAL_COMMITMENT_CLOSED
```

| Estado                         | Evidencia mínima                                                | No significa                                  |
| ------------------------------ | --------------------------------------------------------------- | --------------------------------------------- |
| `COMMERCIAL_REQUEST_RECEIVED`  | solicitud, contraparte preliminar, canal, fecha y responsable   | oportunidad calificada o pedido               |
| `REQUIREMENTS_UNDER_REVIEW`    | checklist de alcance, faltantes y responsables                  | viabilidad confirmada                         |
| `QUOTATION_PREPARING`          | oferta, costos, precio, capacidad y condiciones en construcción | autorización de envío                         |
| `QUOTATION_PENDING_APPROVAL`   | versión completa y gates requeridos                             | aceptación interna                            |
| `QUOTATION_SENT`               | versión aprobada, destinatario, canal y momento                 | lectura o aceptación del cliente              |
| `CUSTOMER_ACCEPTANCE_PENDING`  | forma de aceptación y vigencia                                  | capacidad reservada                           |
| `CAPACITY_RESERVED`            | aceptación válida, gates financieros y reserva vigente          | producción iniciada o stock retirado          |
| `IN_FULFILLMENT`               | órdenes y handoffs activos por dominio                          | cumplimiento completo                         |
| `DELIVERY_AND_BILLING_PENDING` | producto o servicio listo y resultados por completar            | entrega aceptada o factura cobrada            |
| `COMMERCIAL_COMMITMENT_CLOSED` | conciliación por línea y pendientes residuales asignados        | inexistencia de cartera, garantía o historial |

Subestados, hitos y proyecciones podrán detallar cada dominio, pero no reemplazar
ni contradecir esta máquina.

---

#### 24. Matriz de etapas objetivo

| Etapa    | Acción                               | Responsable primario              | Aprobador o control                         | Entrada                               | Salida                                          | Bloqueo principal                          |
| -------- | ------------------------------------ | --------------------------------- | ------------------------------------------- | ------------------------------------- | ----------------------------------------------- | ------------------------------------------ |
| `B2B-01` | captar y calificar oportunidad       | responsable comercial / AURA      | supervisión comercial                       | contacto y necesidad preliminar       | oportunidad aceptada, devuelta o descartada     | no crear pedido desde mensaje              |
| `B2B-02` | validar contraparte y requerimientos | responsable comercial             | control comercial y financiero según riesgo | cuenta, contactos y alcance           | expediente mínimo y requerimientos verificables | identidad o autoridad insuficiente         |
| `B2B-03` | seleccionar oferta y presentación    | comercial con producto/producción | responsable de producto                     | necesidad validada                    | líneas ofertables o brechas                     | producto no aprobado                       |
| `B2B-04` | evaluar costo y precio               | NUMERA + comercial                | autoridad por umbral                        | oferta, cantidad, entrega y supuestos | escenario y precio propuesto                    | costo no vigente o margen no evaluado      |
| `B2B-05` | validar capacidad y logística        | FOGO + NEXO + ORIGO               | coordinación de operaciones                 | fecha, cantidad y restricciones       | factibilidad, condiciones y reserva provisional | capacidad o material no confirmado         |
| `B2B-06` | preparar cotización                  | responsable comercial             | —                                           | resultados anteriores                 | versión completa                                | datos o condiciones faltantes              |
| `B2B-07` | aprobar cotización                   | gerencia o autoridad definida     | segregación automática y auditoría          | cotización completa                   | aprobada, devuelta o rechazada                  | autoaprobación o excepción sin autoridad   |
| `B2B-08` | enviar y obtener aceptación          | responsable comercial             | verificación de representante               | versión aprobada                      | aceptación válida o rechazo                     | aceptación de versión expirada o distinta  |
| `B2B-09` | cumplir gate financiero              | NUMERA / recaudo                  | autoridad de crédito                        | anticipo o solicitud de crédito       | conciliado, aprobado o bloqueado                | comprobante sin confirmación               |
| `B2B-10` | reservar capacidad                   | coordinación operativa            | controles de concurrencia                   | aceptación y gate financiero          | reserva vigente                                 | doble reserva o capacidad expirada         |
| `B2B-11` | crear pedido y handoffs              | PULSO                             | validación contractual                      | compromiso confirmado                 | órdenes y comandos correlacionados              | duplicado o fallo parcial oculto           |
| `B2B-12` | comprar y producir                   | ORIGO / FOGO                      | aprobadores propietarios                    | necesidades correlacionadas           | materiales y lotes liberados                    | comprar o producir fuera de versión        |
| `B2B-13` | ingresar, reservar y alistar         | NEXO                              | control de inventario                       | productos liberados                   | carga preparada                                 | stock no elegible o sustitución silenciosa |
| `B2B-14` | entregar y aceptar                   | NEXO + receptor cliente           | verificación de custodia                    | pedido y carga                        | entrega, diferencias y aceptación               | autoaceptación o firma no vinculada        |
| `B2B-15` | facturar y gestionar cartera         | NUMERA                            | control financiero                          | hecho facturable                      | factura, pago o cuenta por cobrar               | factura duplicada o sin soporte            |
| `B2B-16` | conciliar y cerrar                   | PULSO con dominios                | supervisión comercial                       | resultados terminales                 | cierre o pendientes asignados                   | cierre por estado único                    |

---

#### 25. Integración, eventos e idempotencia

##### 25.1. Identificadores

Deberán conservarse, sin fusionarse:

- `lead_id`;
- `opportunity_id`;
- `b2b_account_id`;
- `commercial_case_id`;
- `quotation_id` y versión;
- `customer_acceptance_id`;
- `capacity_reservation_id`;
- `b2b_order_id`;
- órdenes de compra y producción;
- reservas y movimientos de inventario;
- remisión, viaje y entrega;
- factura, pago y cuenta por cobrar;
- reclamo, devolución o compensación.

##### 25.2. Sobre de evento

Cada evento material deberá incluir:

- productor y versión;
- proceso, caso y etapa;
- actor o principal técnico;
- recurso y versión;
- correlación y causalidad;
- idempotency key;
- empresa, sede y alcance;
- timestamp del hecho y del registro;
- payload validado;
- resultado y error;
- evidencia y auditoría.

##### 25.3. Fallos parciales

Si PULSO confirma el compromiso pero falla una orden productiva o logística, el
caso quedará bloqueado o en recuperación explícita. No se reenviará sin
idempotencia ni se simulará éxito.

##### 25.4. Webhooks y canales

Formularios, correos, WhatsApp, Shopify, facturación, pagos o transportadores
externos deberán pasar por adaptadores de BLOQUE X. Un webhook no tendrá autoridad
para aprobar precio, capacidad, crédito, entrega o cierre.

---

#### 26. Puerta de viabilidad y readiness

La capacidad no podrá habilitarse hasta demostrar, como mínimo:

| Dimensión      | Condición de paso                                                                                 |
| -------------- | ------------------------------------------------------------------------------------------------- |
| gobierno       | titular, marca o frente, responsables, propietaria y escalamiento confirmados                     |
| cliente        | segmento, expediente, privacidad, consentimiento y autoridad de aceptación definidos              |
| producto       | catálogo piloto, presentaciones, receta o especificación, empaque, etiqueta y vida útil aprobados |
| costeo         | costos y supuestos trazables; margen y excepciones gobernados                                     |
| precio         | listas, vigencias, impuestos, descuentos y aprobaciones versionados                               |
| capacidad      | capacidad efectiva medida, restricciones, personal y contingencia conocidos                       |
| abastecimiento | materiales, proveedores, inventario, lead times y sustituciones definidos                         |
| calidad        | controles, liberación, alérgenos, temperatura y gestión de desviaciones aprobados                 |
| logística      | zonas, ventanas, carga, frío, entrega, retornos y evidencia probados                              |
| financiero     | anticipo, pago, crédito, factura, cartera y conciliación definidos                                |
| contractual    | cotización, aceptación, cambios, cancelación, devolución y responsabilidad revisados              |
| tecnología     | contratos, autorización, idempotencia, auditoría, offline y recuperación implementados            |
| experiencia    | flujos y pantallas validados con actores reales                                                   |
| operación      | procedimientos, formación, cobertura horaria, soporte y SLA listos                                |
| prueba         | escenarios E2E, negativos, concurrencia, contingencia y reconciliación superados                  |
| piloto         | clientes, productos, volumen, fechas, responsables, límites y rollback aprobados                  |

Resultado de puerta:

```text
FAIL
→ no se oferta

PASS_WITH_CONDITIONS
→ piloto limitado con controles explícitos

PASS
→ habilitación gradual según paquete E5 y autorización de lanzamiento
```

La puerta deberá materializarse posteriormente en `READY-GATE-005`,
`PROC-COVER-001` a `PROC-COVER-010` y el paquete E5 propietario.

---

#### 27. Piloto controlado

El piloto deberá limitar:

- número y tipo de clientes;
- productos y presentaciones;
- cantidades y frecuencia;
- zonas y ventanas;
- formas de pago;
- exposición de crédito;
- personal y áreas;
- canales;
- duración;
- criterios de pausa;
- rollback y atención de reclamos.

No se utilizará producción real no conciliada como “prueba informal”. El piloto
deberá mantener captura paralela o reconciliación equivalente si aún existen
métodos manuales.

Criterios mínimos de pausa:

- incumplimiento de inocuidad;
- costo o margen no confiable;
- capacidad sobrecomprometida;
- fallos repetidos de entrega;
- inventario o lote irreconciliable;
- cobro o facturación duplicados;
- datos personales expuestos;
- evidencia o custodia insuficientes;
- operación sin responsable o soporte.

---

#### 28. Operación recurrente y acuerdos marco

Una relación recurrente deberá distinguir:

```text
CUENTA
→ ACUERDO O CONDICIONES MARCO
→ CALENDARIO O FORECAST
→ PEDIDO LIBERADO POR PERIODO
→ CAPACIDAD RESERVADA
→ CUMPLIMIENTO
→ FACTURA Y CARTERA
```

Un forecast no será pedido firme. Un acuerdo marco no reservará indefinidamente
capacidad. Cada liberación conservará versión, cantidades, fechas, aceptación,
idempotencia y conciliación.

Cambios de precio, costo, impuestos, vida útil, capacidad o logística podrán
exigir revisión del acuerdo y no se aplicarán retroactivamente sin regla
contractual.

---

#### 29. Horarios, SLA y contingencia

Deberán definirse por modalidad:

- horario de recepción de solicitudes;
- tiempo de calificación;
- tiempo de cotización;
- vigencia;
- corte de confirmación;
- lead time;
- ventanas de cambio y cancelación;
- tiempos de producción, despacho y entrega;
- tiempo de respuesta a diferencias y reclamos;
- horario de cartera y soporte;
- responsables y suplentes.

Contingencias mínimas:

- caída de canal;
- pérdida de red o energía;
- indisponibilidad de PULSO, FOGO, NEXO, ORIGO o NUMERA;
- fallo de equipo productivo;
- ausencia de personal;
- proveedor incumplido;
- vehículo o frío no disponible;
- pago incierto;
- factura rechazada;
- entrega fallida;
- retiro o alerta de producto.

La contingencia conservará identificador, actor, límites, evidencia,
reconciliación y retorno a operación. No habilitará cotizaciones, firmas,
compras, inventario o cobros genéricos.

---

#### 30. Métricas

##### 30.1. Resultado principal

```text
COMPROMISOS B2B ENTREGADOS Y ACEPTADOS
SEGÚN VERSIÓN, FECHA, CANTIDAD, CALIDAD,
CONDICIONES Y RENTABILIDAD APROBADAS
/
COMPROMISOS B2B CERRADOS
```

##### 30.2. Indicadores de flujo

- tiempo solicitud → requerimientos completos;
- tiempo requerimientos → cotización;
- tiempo cotización → aceptación;
- porcentaje con capacidad confirmada antes de promesa;
- conversión por segmento y origen;
- causas de pérdida;
- cumplimiento de fecha y cantidad;
- exactitud de picking y entrega;
- devoluciones, reclamos y compensaciones;
- tiempo de resolución de diferencias;
- cartera vencida y días de cobro;
- margen esperado versus real;
- merma y reproceso atribuibles;
- utilización de capacidad;
- estabilidad de forecast;
- reservas expiradas o liberadas;
- facturas o eventos con conciliación pendiente.

##### 30.3. Guardas

No se optimizará conversión, volumen, utilización o velocidad sacrificando:

- margen;
- inocuidad;
- calidad;
- cumplimiento;
- privacidad;
- cartera;
- operación de sedes existentes;
- sostenibilidad de la capacidad.

Toda métrica económica mostrará método, fuentes, periodo, frescura y confianza.

---

#### 31. Seguridad, autorización y segregación

Cada acción resolverá:

```text
ACTOR EFECTIVO
+
PERMISO ATÓMICO
+
EMPRESA, SEDE Y RECURSO
+
ETAPA Y ESTADO
+
UMBRAL Y SENSIBILIDAD
+
SEGREGACIÓN
+
FRESCURA
=
ALLOW O DENY
```

Controles mínimos:

- comercial no autoaprueba descuento, crédito o excepción crítica;
- producción no modifica precio o aceptación;
- logística no factura ni acepta por el cliente;
- contador no declara entrega física;
- cliente ve únicamente su proyección;
- canales externos no escriben estados internos directamente;
- service role no actúa como autoridad empresarial;
- simulación y override son explícitos, limitados y auditados;
- exportaciones y datos financieros requieren permisos específicos;
- dispositivos compartidos identifican al trabajador real;
- acciones offline se revalidan al sincronizar.

---

#### 32. Privacidad, documentos y retención

Se clasificarán:

- datos de cuenta;
- contactos;
- documentos tributarios o contractuales;
- precios y descuentos;
- costos y márgenes;
- crédito y cartera;
- restricciones alimentarias;
- firmas;
- comunicaciones;
- evidencia de entrega;
- reclamos;
- información de trabajadores.

Cada documento deberá tener propietario, versión, acceso, retención, vigencia,
relación con caso y protección contra alteración. No se almacenarán contratos,
listas de precios, documentos de identidad o firmas únicamente en chats,
correos personales o dispositivos locales.

---

#### 33. Tareas propietarias posteriores

| Decisión o implementación                           | Tareas propietarias                                                                                          |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| pipeline, oportunidades y transferencia a operación | `AURA-DOM-007`, `AURA-UX-006`, `AURA-INT-002`                                                                |
| arquitectura comercial PULSO y experiencia de venta | `PULSO-UX-001`, `PULSO-UX-007`, `PULSO-UX-009`, `PULSO-UX-013`, `PULSO-UX-021`                               |
| integración venta–inventario–finanzas               | `PULSO-UX-016`, `PULSO-UX-017`, `INT-APP-001` a `INT-APP-010`                                                |
| producción y producto terminado                     | `FOGO-UX-001` a `FOGO-UX-015`, `FOGO-AUTH-001` a `FOGO-AUTH-016`                                             |
| compras y recepción de materiales                   | `ORIGO-UX-001` a `ORIGO-UX-016`, `ORIGO-AUTH-001` a `ORIGO-AUTH-015`                                         |
| inventario, remisión, carga y entrega               | `NEXO-UX-009` a `NEXO-UX-025`, `NEXO-AUTH-001` a `NEXO-AUTH-020`                                             |
| costo, margen, escenarios, cartera y crédito        | `NUMERA-DOM-007`, `NUMERA-DOM-008`, `NUMERA-DOM-016`, `NUMERA-DOM-018`, `NUMERA-AUTH-014`, `NUMERA-AUTH-015` |
| canales y adaptadores externos                      | BLOQUE X; `INT-EXT-001` a `INT-EXT-019`; `AURA-INT-001`, `AURA-INT-002`                                      |
| pantallas transversales                             | `PROC-SCREEN-001` a `PROC-SCREEN-028`                                                                        |
| cobertura, readiness y rollout                      | `PROC-COVER-001` a `PROC-COVER-010`, `READY-GATE-005`                                                        |
| evidencia y documentos                              | `EVID-ARC-001` a `EVID-ARC-010`                                                                              |
| capacidad, horarios y formación del personal        | `CAP-TAL-001` a `CAP-TAL-006` y tareas posteriores de capacitación del dominio                               |

Ninguna de estas referencias autoriza implementación durante `OPS-B2B-001`.

---

#### 34. Riesgos y tratamiento

| Riesgo                                    | Tratamiento canónico                             |
| ----------------------------------------- | ------------------------------------------------ |
| vender antes de tener capacidad           | gate de oferta, reserva y readiness              |
| confundir lead con pedido                 | handoff AURA → PULSO aceptado e idempotente      |
| precio sin costo confiable                | escenario NUMERA, confianza y aprobación         |
| descuento informal                        | umbral, segregación, motivo y versión            |
| aceptación por contacto no autorizado     | expediente de contraparte y prueba de facultad   |
| sobrecompromiso productivo                | reserva versionada y control de concurrencia     |
| inventario prometido dos veces            | reserva NEXO y exclusión de disponibilidad       |
| producción no liberada entregada          | calidad FOGO e ingreso NEXO obligatorios         |
| factura sin entrega o doble factura       | disparador explícito e idempotencia              |
| crédito informal                          | política, límite, vigencia y aprobación NUMERA   |
| entrega sin evidencia                     | receptor real, custodia y aceptación por versión |
| sustitución no consentida                 | decisión y aceptación explícitas                 |
| reclamo cerrado en chat                   | caso formal y conciliación física/económica      |
| catering tratado como empresa o sede      | gobierno y titularidad separados                 |
| piloto convertido en operación permanente | límites, fecha de salida y nueva puerta          |
| canales o archivos paralelos              | registro propietario y adaptadores controlados   |

---

#### 35. Requisitos de prueba derivados

Esta tarea crea:

- `TREQ-PROC-217` — contraparte, cuenta y autoridad de aceptación;
- `TREQ-PROC-218` — catálogo, presentación y disponibilidad B2B;
- `TREQ-PROC-219` — costo, precio, margen, descuento y crédito;
- `TREQ-PROC-220` — evaluación y reserva de capacidad;
- `TREQ-PROC-221` — cotización, versiones y aceptación;
- `TREQ-PROC-222` — orquestación PULSO–ORIGO–FOGO–NEXO–NUMERA;
- `TREQ-PROC-223` — pago, facturación, cartera y cierre financiero;
- `TREQ-PROC-224` — entrega, aceptación, devoluciones y reclamos;
- `TREQ-PROC-225` — cambios, cancelaciones, sustituciones y contingencia;
- `TREQ-PROC-226` — readiness, piloto, métricas y prohibición de activación prematura.

El detalle completo se incorpora en
`04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md`, que deberá reemplazarse de
forma íntegra.

---

#### 36. Criterios de aceptación

`OPS-B2B-001` podrá aprobarse cuando:

- [ ] `VPROC-0041` conserva identidad, propietaria y máquina de estados aprobadas;
- [ ] se diferencian oportunidad, cuenta, cotización, pedido, producción,
      entrega, factura, pago y cartera;
- [ ] se definen modalidades y frontera frente a venta ordinaria;
- [ ] el cliente objetivo no se confunde con contacto, pagador o receptor;
- [ ] catálogo y oferta exigen producto, presentación, costo, capacidad y
      condiciones aprobadas;
- [ ] precio, descuento, margen y crédito tienen gates y segregación;
- [ ] ninguna promesa nace de capacidad estimada o inventario no reservado;
- [ ] cotizaciones y aceptaciones son versionadas e idempotentes;
- [ ] el handoff AURA → PULSO está delimitado;
- [ ] PULSO, FOGO, NEXO, ORIGO y NUMERA conservan verdades separadas;
- [ ] producción, inventario, entrega, facturación y cartera se concilian sin
      cierres implícitos;
- [ ] cambios, cancelaciones, devoluciones y compensaciones preservan historial;
- [ ] firma o mensaje no sustituyen identidad, autoridad ni aceptación válida;
- [ ] se define puerta de viabilidad antes de oferta o piloto;
- [ ] no se fijaron tarifas, márgenes, clientes o contratos reales;
- [ ] no se implementó código, Supabase, migraciones ni operación física;
- [ ] cada brecha posterior tiene tarea propietaria exacta;
- [ ] `CAP-TAL-001` permanece sin iniciar.

---

#### 37. Estado y continuidad

```text
OPS-CAN-001 APROBADA
OPS-LOG-001 APROBADA
OPS-B2B-001 APROBADA
CAP-TAL-001 NO INICIADA
```

La aprobación de `OPS-B2B-001` cerrará el segmento de procesos transversales
TO-BE derivados de `OPS-AUD-001`. La continuidad documental será exclusivamente:

```text
CAP-TAL-001
— Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA
```

No se inicia `CAP-TAL-001` ni se habilita la venta B2B hasta aprobación expresa.


**Dependencias:** cierre de E1, `OPS-PLAN-001`, `OPS-GOV-001` y `PROC-CAT-002`.  
**Propósito:** definir cliente objetivo, catálogo, presentaciones, precios, capacidad, toma de pedido, aprobación, producción, facturación, inventario, despacho, entrega, devoluciones y conciliación.  
**Continuidad:** deberá asignar propietarios entre PULSO o canal comercial, FOGO, NEXO, NUMERA y BLOQUE X antes de E5.  
**Límite:** continúa como capacidad futura hasta superar viabilidad, costeo, capacidad y readiness.
