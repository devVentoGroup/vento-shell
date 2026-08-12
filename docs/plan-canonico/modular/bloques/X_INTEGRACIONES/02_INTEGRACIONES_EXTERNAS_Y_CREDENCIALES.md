### MINI-BLOQUE — INTEGRACIONES EXTERNAS Y CREDENCIALES

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **integraciones externas y credenciales** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-EXT-001` a `INT-EXT-020` — 20 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Inventariar sistemas externos, proveedores, propietarios y finalidad” y concluye con “Prohibir credenciales compartidas entre integraciones”.
<!-- PLAN-SECTION-META:END -->

### ✅ INT-EXT-001 — Inventariar sistemas externos, proveedores, propietarios y finalidad

**Estado:** APROBADA  
**Tarea anterior:** `INT-APP-010 — Evitar escrituras cruzadas sin contrato` — APROBADA  
**Tarea siguiente:** `INT-EXT-002 — Definir principal técnico independiente por integración` — RESERVADA  
**Tipo de tarea:** documental; inventario materializado y clasificación de sistemas externos, plataformas, proveedores, propietarios internos, finalidades, evidencia disponible y vacíos de binding, sin crear credenciales, endpoints, contratos físicos ni integraciones nuevas  
**Bloque:** X — Integraciones  
**Mini-bloque:** Integraciones externas y credenciales  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`  
**Implementación física autorizada:** ninguna  
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, cuentas externas, proveedores, configuración remota, despliegues o datos:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar un inventario único de los sistemas externos y plataformas con las que VENTO tiene evidencia técnica actual, configuración observable o una relación externa explícitamente documentada, separando con precisión:

- sistema o plataforma externa;
- proveedor o prestador conocido;
- propietario funcional interno;
- custodio técnico o frontera de integración;
- finalidad empresarial o técnica;
- modalidad observada o esperada;
- evidencia disponible;
- nivel de certeza del binding;
- vacíos que deben resolverse en las tareas posteriores `INT-EXT-*`.

La tarea elimina cuatro ambigüedades:

```text
PLATAFORMA NOMBRADA
≠ INTEGRACIÓN ACTIVA
```

```text
PROVEEDOR
≠ PROPIETARIO DEL HECHO EMPRESARIAL
```

```text
SDK / URL / WEBHOOK / CUENTA / TOKEN
≠ AUTORIDAD EMPRESARIAL
```

```text
CÓDIGO OBSERVADO
≠ OPERACIÓN REMOTA VALIDADA
```

---

#### 2. Resultado sustantivo

Se aprueba `VENTO-EXTERNAL-SYSTEM-INVENTORY-001`, compuesto por **21 identidades de inventario** con decisión explícita y sin duplicados.

Balance materializado:

| Control                                                                  |    Resultado |
| ------------------------------------------------------------------------ | -----------: |
| Identidades esperadas según evidencia y fuentes consumidas en esta tarea |       **21** |
| Identidades materializadas                                               | **21 de 21** |
| Identificadores únicos                                                   |       **21** |
| Identidades duplicadas                                                   |        **0** |
| Filas sin finalidad                                                      |        **0** |
| Filas sin propietario funcional o regla explícita de propiedad           |        **0** |
| Filas sin clasificación de evidencia                                     |        **0** |
| Proveedores fabricados por inferencia                                    |        **0** |
| Integraciones declaradas productivas sin evidencia operativa             |        **0** |
| Credenciales o secretos materializados                                   |        **0** |
| Endpoints nuevos definidos                                               |        **0** |
| Requisitos de prueba creados o modificados                               |        **0** |

Las identidades `EXT-SYS-001` a `EXT-SYS-021` son **identidades internas de este inventario documental**. No son tareas del roadmap, permisos, proveedores, credenciales ni identificadores de objetos externos.

---

#### 3. Fuentes y contratos preservados

La tarea consume y conserva sin redefinir:

- `INT-APP-001` a `INT-APP-010`, incluidos productor, consumidor, autoridad independiente, idempotencia, trazabilidad y prohibición de escritura cruzada;
- `OPS-CAN-001` y su arquitectura objetivo de canales, que distingue una familia de canal de una instancia realmente verificada;
- `CONT-INT-003`, que separa proveedor, contrato, servicio, capacidad, dependencia, endpoint y credencial y prohíbe inventar proveedor, SLA, alternativa o failover;
- los contratos vigentes del BLOQUE Z para infraestructura, red, telemetría, soporte y dependencias técnicas;
- los contratos de AA para finalidad, minimización, custodia y evidencia;
- los contratos de AB para métricas y proyecciones sin convertirse en fuente del hecho;
- las responsabilidades de E4 para capacidades transversales de integración, notificación, trabajo asíncrono, evidencia y monitoreo cuando estén materializadas;
- la propiedad funcional de cada aplicación sobre sus hechos empresariales;
- la regla de que toda modificación de Supabase perteneciente a VENTO se gobierna y versiona desde `vento-shell`;
- el registro `04A` vigente y su cobertura existente de requisitos de integración.

La tarea no convierte una mención histórica, una guía de configuración o una dependencia de paquete en prueba de operación productiva.

---

#### 4. Criterio de inclusión

Una identidad entra en `VENTO-EXTERNAL-SYSTEM-INVENTORY-001` cuando cumple al menos una de estas condiciones:

1. existe código vigente que llama, recibe o procesa datos de la plataforma;
2. existe configuración vigente que enlaza una aplicación VENTO con la plataforma;
3. existe un contrato canónico que exige tratar una instancia externa ya reconocida;
4. existe una plataforma o canal nombrado por una fuente canónica y debe conservarse explícitamente como `DOCUMENTADO_SIN_BINDING_ACREDITADO` para impedir que se confunda con una integración activa;
5. existe un sistema externo vigente reconocido por el plan, aunque el proveedor concreto todavía no esté acreditado.

No basta para crear una fila:

- una librería utilitaria sin contraparte externa;
- una dependencia de desarrollo;
- una herramienta de repositorio;
- una tecnología disponible comercialmente pero no referenciada por VENTO;
- una posibilidad de arquitectura;
- un proveedor sugerido sin evidencia actual.

---

#### 5. Clasificación de evidencia

Los siguientes valores son **etiquetas documentales de evidencia de INT-EXT-001** y no estados universales de Vento OS:

| Estado documental                    | Significado                                                                                                                                                           |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BINDING_TECNICO_OBSERVADO`          | Código vigente identifica la plataforma y ejecuta o prepara una interacción técnica concreta.                                                                         |
| `BINDING_CONDICIONAL_OBSERVADO`      | Existe código/configuración concreta, pero su funcionamiento depende de variables, secretos, flags, cuenta o habilitación no verificados en esta tarea.               |
| `CONFIGURACION_OBSERVADA`            | Existe configuración de hosting, routing, proyecto o runtime, sin validación remota de operación.                                                                     |
| `DOCUMENTADO_SIN_BINDING_ACREDITADO` | Una fuente canónica o guía vigente reconoce el sistema/canal, pero no se demostró un binding técnico actual suficiente.                                               |
| `PROVEEDOR_NO_ACREDITADO`            | La existencia del sistema o familia externa está reconocida, pero la identidad contractual o técnica exacta del proveedor no está acreditada en las fuentes actuales. |

Ninguno de estos valores equivale a `VALIDADO`, `PRODUCTIVO`, `READY`, `SLA_CUMPLIDO` ni `ALTA_DISPONIBILIDAD`.

---

#### 6. Modelo de propiedad

Cada fila distingue como mínimo:

```text
PROVEEDOR / PLATAFORMA EXTERNA
→ presta una capacidad o transporta una interacción

PROPIETARIO FUNCIONAL VENTO
→ conserva el hecho, decisión o resultado empresarial

CUSTODIO TÉCNICO / FRONTERA DE INTEGRACIÓN
→ implementa y opera el binding autorizado sin apropiarse del hecho
```

Reglas:

1. el proveedor no adquiere propiedad empresarial por emitir un callback, receipt, status o token;
2. una aplicación consumidora no adquiere propiedad del hecho de otra aplicación;
3. `vento-shell` conserva la propiedad de las modificaciones Supabase de VENTO;
4. BLOQUE X gobierna el contrato de integración externa y su identidad técnica;
5. BLOQUE Z conserva infraestructura, health técnico, red, telemetría y soporte tecnológico cuando apliquen;
6. E4 conserva la capacidad transversal cuando la integración use un servicio E4 materializado;
7. las tareas `INT-EXT-002..020` especializan identidad técnica, credenciales, contratos, autenticidad, idempotencia, retry, cuarentena, auditoría, contingencia y retiro; esta tarea no adelanta esas decisiones.

---

#### 7. `VENTO-EXTERNAL-SYSTEM-INVENTORY-001`

| ID            | Sistema / plataforma                     | Proveedor o prestador acreditado                                                   | Evidencia                            | Propietario funcional VENTO                                                                                                  | Custodio técnico / frontera                                                                   | Finalidad                                                                                              | Modalidad observada o documentada                                                                                             | Decisión de INT-EXT-001                                                                                                |
| ------------- | ---------------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | Supabase                                                                           | `BINDING_TECNICO_OBSERVADO`          | cada aplicación o dominio conserva sus hechos; Supabase no es propietario funcional                                          | `vento-shell` para cambios Supabase de VENTO; BLOQUE X/Z según el binding                     | base de datos, autenticación, Storage, Edge Functions, Realtime y capacidades efectivamente consumidas | SDK, REST/Auth, RPC, Edge Functions y configuración compartida observada en repositorios VENTO                                | `INVENTARIADO`; no se acredita failover, SLA ni operación de todos los componentes por todas las aplicaciones          |
| `EXT-SYS-002` | Wompi                                    | Wompi                                                                              | `BINDING_CONDICIONAL_OBSERVADO`      | dominio propietario del pago; el proveedor conserva solo su transacción externa                                              | BLOQUE X + `vento-shell` para el webhook y binding Supabase                                   | iniciar, correlacionar y confirmar resultados de pago conforme al contrato propietario                 | `payments-webhook` valida checksum, correlaciona transacción, reconoce duplicados y aplica resultado mediante RPC propietaria | `INVENTARIADO`; código observado, operación remota/SLA/failover no validados                                           |
| `EXT-SYS-003` | RevenueCat                               | RevenueCat                                                                         | `BINDING_CONDICIONAL_OBSERVADO`      | PASS / dominio Club conserva suscripción y entitlement VENTO                                                                 | BLOQUE X + `vento-shell`; PASS como consumidor móvil                                          | compras in-app, suscripción Club, entitlement y restauración de compras                                | SDK móvil `react-native-purchases` y webhook `club-revenuecat-webhook` con secreto                                            | `INVENTARIADO`; no se acredita disponibilidad productiva ni alternativa                                                |
| `EXT-SYS-004` | Resend                                   | Resend                                                                             | `BINDING_CONDICIONAL_OBSERVADO`      | ANIMA conserva invitación, trabajador, vínculo y estado de onboarding                                                        | BLOQUE X + `vento-shell` para la función; ANIMA consume el resultado                          | enviar correo de invitación para creación de contraseña                                                | `staff-invitations-create` usa `RESEND_API_KEY` y API de envío de correo                                                      | `INVENTARIADO`; envío efectivo depende de secreto/configuración y no se validó remotamente                             |
| `EXT-SYS-005` | Expo / EAS Update                        | Expo                                                                               | `CONFIGURACION_OBSERVADA`            | ANIMA y PASS conservan comportamiento y estado de sus aplicaciones                                                           | responsables técnicos de ANIMA/PASS y BLOQUE T/Z según fase                                   | build/runtime móvil, actualizaciones y metadatos de release                                            | proyectos Expo/EAS y URLs `u.expo.dev` configurados en aplicaciones móviles                                                   | `INVENTARIADO`; configuración presente, operación de cada entorno no validada                                          |
| `EXT-SYS-006` | Expo Push Service                        | Expo                                                                               | `BINDING_TECNICO_OBSERVADO`          | PASS conserva mensaje, pedido, audiencia y resultado empresarial                                                             | BLOQUE X/E4 + binding en `vento-shell`                                                        | entrega técnica de notificaciones push de mensajes de pedido                                           | Edge Function envía lotes a la API de Expo Push y trata tokens `DeviceNotRegistered`                                          | `INVENTARIADO`; entrega técnica no equivale a lectura ni acción del usuario                                            |
| `EXT-SYS-007` | Sentry                                   | Sentry                                                                             | `BINDING_CONDICIONAL_OBSERVADO`      | ANIMA conserva contexto funcional; la telemetría no es fuente del hecho empresarial                                          | ANIMA + BLOQUE Z para observabilidad; BLOQUE X para frontera externa cuando aplique           | captura de errores/crashes y contexto de actualización móvil                                           | SDK Sentry y plugin Expo; inicialización condicionada a DSN/configuración                                                     | `INVENTARIADO`; activación runtime no se presume si no existe DSN vigente                                              |
| `EXT-SYS-008` | Google Maps / Google Reviews             | Google                                                                             | `BINDING_CONDICIONAL_OBSERVADO`      | PASS conserva experiencia, sede, cobertura y resultado; Google no es fuente empresarial de VENTO                             | PASS para consumo; BLOQUE X para binding externo cuando aplique                               | mapas, coordenadas, navegación/reseñas y vista previa cartográfica                                     | URLs Maps/Reviews y API key opcional para mapa configuradas en PASS                                                           | `INVENTARIADO`; no se acredita contrato, cuota ni disponibilidad remota                                                |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | Apple                                                                              | `BINDING_CONDICIONAL_OBSERVADO`      | PASS conserva identidad/loyalty del cliente; ANIMA conserva identidad laboral cuando use su contrato propio                  | PASS wallet API y BLOQUE X; integración laboral ANIMA permanece separada                      | generar pases Wallet y notificar actualizaciones del pase                                              | generación `.pkpass`, certificados y push HTTP/2 a APNs observados en PASS                                                    | `INVENTARIADO`; credenciales, certificados vigentes y operación remota no se validan en esta tarea                     |
| `EXT-SYS-010` | Vercel                                   | Vercel                                                                             | `CONFIGURACION_OBSERVADA`            | cada aplicación conserva su funcionalidad y datos; Vercel no adquiere propiedad del proceso                                  | responsables técnicos de cada aplicación + BLOQUE Z/T; BLOQUE X para APIs externas publicadas | hosting de superficies/API web y rutas de retorno o wallet cuando corresponda                          | `vercel.json` en PASS y referencias de redirect/API web en ANIMA                                                              | `INVENTARIADO`; despliegue remoto y configuración efectiva no fueron validados                                         |
| `EXT-SYS-011` | Zebra BrowserPrint                       | Zebra Technologies / Zebra                                                         | `BINDING_TECNICO_OBSERVADO`          | NEXO conserva trabajo de impresión, documento/etiqueta y resultado logístico                                                 | NEXO + PRINT/E4/BLOQUE Z según contrato; BLOQUE X para binding externo                        | detectar, seleccionar y conectar impresoras Zebra locales                                              | NEXO usa `window.BrowserPrint` y enumera dispositivos de tipo printer                                                         | `INVENTARIADO`; disponibilidad física de impresoras y agente BrowserPrint no se presume                                |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | Google                                                                             | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | ANIMA conserva identidad laboral y elegibilidad del carnet                                                                   | ANIMA + BLOQUE X; cualquier cambio Supabase pertenece a `vento-shell`                         | carnet laboral digital en Android                                                                      | guía vigente documenta issuer, clase Generic, cuenta de servicio y `employee-wallet-pass`                                     | `INVENTARIADO_COMO_DOCUMENTADO`; no se declara binding productivo ni credenciales vigentes                             |
| `EXT-SYS-013` | POS externo vigente                      | `NO_ACREDITADO_EN_FUENTES_ACTUALES`                                                | `PROVEEDOR_NO_ACREDITADO`            | el hecho de venta permanece bajo el contrato de transición hacia PULSO; NEXO/NUMERA/PASS consumen efectos cuando corresponda | BLOQUE X; `INT-POS-001` debe auditar el binding exacto                                        | fuente temporal del hecho de venta, estados, medios de pago y documento fiscal mientras corresponda    | el plan define adaptador, staging, mapeo, idempotencia y conciliación futuros                                                 | `INVENTARIADO`; proveedor, endpoints, API, webhooks y límites quedan a `INT-POS-001`                                   |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico  | Shopify, como plataforma nombrada; relación contractual no acreditada              | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | PULSO/PASS/NEXO/NUMERA según el hecho; ninguna tienda externa se vuelve maestro                                              | BLOQUE X y propietario del canal cuando exista instancia verificada                           | catálogo proyectado, pedido, pago, identidad y seguimiento según alcance aprobado                      | `OPS-CAN-001` reconoce Shopify u otro e-commerce como familia objetivo; existe documentación histórica de PASS                | `INVENTARIADO_COMO_CANDIDATO_DOCUMENTADO`; no se declara cuenta o integración activa                                   |
| `EXT-SYS-015` | Rappi / marketplace                      | Rappi, como plataforma nombrada; relación contractual no acreditada                | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | PULSO conserva pedido interno; NEXO entrega; NUMERA hechos económicos conciliados                                            | BLOQUE X y propietario del canal cuando exista binding                                        | recibir pedidos, estados, pagos o entregas administrados por tercero                                   | `OPS-CAN-001` lo reconoce como marketplace conocido                                                                           | `INVENTARIADO_COMO_CANDIDATO_DOCUMENTADO`; no se declara integración activa                                            |
| `EXT-SYS-016` | ManyChat / automatización conversacional | ManyChat, como plataforma nombrada; relación contractual no acreditada             | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | el proceso clasificado conserva el caso; Marketing gobierna contenido aprobado                                               | BLOQUE X + propietario del canal cuando exista binding                                        | automatización de consulta, captación, soporte, pedido o mensajería permitida                          | `OPS-CAN-001` lo reconoce como automatización conversacional posible                                                          | `INVENTARIADO_COMO_CANDIDATO_DOCUMENTADO`; no se acredita cuenta, bot ni API activa                                    |
| `EXT-SYS-017` | WhatsApp                                 | plataforma nombrada; proveedor/API contractual `NO_ACREDITADO_EN_FUENTES_ACTUALES` | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | el proceso receptor conserva caso, pedido, soporte o reclamo                                                                 | BLOQUE X + propietario del canal cuando exista binding                                        | mensajería con clientes, soporte, consultas, pedidos o notificaciones según finalidad aprobada         | `OPS-CAN-001` reconoce WhatsApp dentro de `CAN-MSG`                                                                           | `INVENTARIADO_COMO_CANAL`; no se declara proveedor API, número, cuenta ni webhook activo                               |
| `EXT-SYS-018` | Instagram / perfiles sociales            | plataforma nombrada; relación contractual/API no acreditada                        | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | Marketing conserva publicación; el proceso receptor conserva cada caso derivado                                              | propietario de Marketing/canal + BLOQUE X si existe integración                               | contenido, comunidad, consultas y captación                                                            | `OPS-CAN-001` reconoce Instagram y redes sociales vigentes                                                                    | `INVENTARIADO_COMO_CANAL`; no se declara API, cuenta o automatización activa                                           |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_ACREDITADO_EN_FUENTES_ACTUALES`                                                | `PROVEEDOR_NO_ACREDITADO`            | cada proceso receptor conserva expediente/caso; el buzón no es fuente final                                                  | propietario del alias + custodio técnico; BLOQUE X si existe integración                      | comunicación formal, oportunidades, proveedores, soporte y documentos                                  | `OPS-CAN-001` reconoce correo corporativo y alias como canal                                                                  | `INVENTARIADO_COMO_CANAL`; proveedor de correo, buzones concretos e integración API permanecen pendientes de evidencia |
| `EXT-SYS-020` | Telefonía / canal de voz                 | `NO_ACREDITADO_EN_FUENTES_ACTUALES`                                                | `PROVEEDOR_NO_ACREDITADO`            | el proceso receptor conserva reserva, catering, cobranza, reclamo o coordinación                                             | propietario operativo del canal + custodio técnico; BLOQUE X si existe integración            | llamadas entrantes/salientes asociadas a procesos aprobados                                            | `OPS-CAN-001` reconoce llamadas como familia `CAN-VOICE`                                                                      | `INVENTARIADO_COMO_CANAL`; operador, numeración, grabación e integración no se presumen                                |
| `EXT-SYS-021` | Transporte externo                       | `NO_ACREDITADO_EN_FUENTES_ACTUALES`                                                | `PROVEEDOR_NO_ACREDITADO`            | NEXO o el proceso logístico propietario conserva salida, custodia, entrega y conciliación                                    | BLOQUE X + propietario logístico; continuidad consume solo evidencia externa correlacionada   | ejecutar o informar transporte/entrega cuando el proceso use un tercero                                | `CONT-INT-003` reconoce transporte como familia externa, sin binding concreto                                                 | `INVENTARIADO_COMO_FAMILIA`; proveedor, SLA, tracking, API y alternativa permanecen pendientes de evidencia            |

---

#### 8. Reconciliación cuantitativa del inventario

Distribución por evidencia:

| Clasificación                        | Cantidad |
| ------------------------------------ | -------: |
| `BINDING_TECNICO_OBSERVADO`          |    **3** |
| `BINDING_CONDICIONAL_OBSERVADO`      |    **6** |
| `CONFIGURACION_OBSERVADA`            |    **2** |
| `DOCUMENTADO_SIN_BINDING_ACREDITADO` |    **6** |
| `PROVEEDOR_NO_ACREDITADO`            |    **4** |
| **Total**                            |   **21** |

Reconciliación:

```text
21 IDENTIDADES
= 3 BINDINGS TÉCNICOS OBSERVADOS
+ 6 BINDINGS CONDICIONALES OBSERVADOS
+ 2 CONFIGURACIONES OBSERVADAS
+ 6 SISTEMAS/CANALES DOCUMENTADOS SIN BINDING ACREDITADO
+ 4 IDENTIDADES CON PROVEEDOR NO ACREDITADO
```

La distribución describe evidencia disponible, no madurez productiva.

---

#### 9. Separación entre sistema, instancia, cuenta y credencial

El inventario identifica la **familia o plataforma externa**. No crea todavía el registro físico de cuentas, tenants, proyectos, endpoints o secretos.

Para cada integración futura deberá distinguirse:

```text
external_system_id
external_instance_id
provider_account_ref
integration_principal_id
external_credential_id
contract_version
endpoint_ref
business_owner_ref
technical_owner_ref
```

Esta tarea solo materializa `external_system_id` en forma documental mediante `EXT-SYS-*` y la propiedad/finalidad asociadas.

`INT-EXT-002` deberá definir el principal técnico independiente por integración sin reutilizar usuario humano o autoridad empresarial.

---

#### 10. Sistemas con binding técnico observado

La evidencia actual permite afirmar existencia de binding de código para:

- Supabase;
- Wompi;
- RevenueCat;
- Resend;
- Expo/EAS y Expo Push;
- Sentry;
- Google Maps/Reviews;
- Apple Wallet/APNs;
- Vercel como configuración de hosting/runtime;
- Zebra BrowserPrint.

La afirmación se limita a **código o configuración vigente observados**.

No implica:

- entorno productivo funcionando;
- credenciales vigentes;
- cuenta contractual confirmada;
- SLA;
- capacidad;
- failover;
- monitoreo completo;
- conciliación terminada;
- cobertura E2E.

---

#### 11. Sistemas o canales documentados sin binding acreditado

Se conservan explícitamente como inventario documental:

- Google Wallet para carnet laboral ANIMA;
- POS externo vigente;
- Shopify/e-commerce;
- Rappi/marketplace;
- ManyChat/automatización conversacional;
- WhatsApp;
- Instagram/redes sociales;
- correo corporativo;
- telefonía;
- transporte externo.

Estas entradas evitan dos errores opuestos:

1. omitir una dependencia o canal ya reconocido por las fuentes;
2. presentarlo como integración activa sin evidencia técnica actual.

---

#### 12. Dependencias externas que no se convierten todavía en sistema de integración

`CONT-INT-003` reconoce además nube, energía, ISP y proveedores críticos como familias de dependencia.

INT-EXT-001 **no crea una identidad de sistema digital concreta** para esas familias cuando las fuentes actuales no acreditan:

- proveedor exacto;
- cuenta/tenant/enlace;
- API o interfaz;
- endpoint;
- credencial;
- objeto externo consumido;
- binding técnico.

Por tanto:

| Familia                                            | Resultado en INT-EXT-001                              | Propietario de resolución                                                              |
| -------------------------------------------------- | ----------------------------------------------------- | -------------------------------------------------------------------------------------- |
| nube no atribuida a una plataforma ya inventariada | `PENDIENTE_DE_EVIDENCIA`                              | BLOQUE Z + arquitectura/implementación propietaria + `INT-EXT-*` si aparece un binding |
| energía                                            | `FUERA_DE_ALCANCE_COMO_SISTEMA_DIGITAL_HASTA_BINDING` | BLOQUE Z / continuidad / propietario físico                                            |
| ISP                                                | `FUERA_DE_ALCANCE_COMO_SISTEMA_DIGITAL_HASTA_BINDING` | BLOQUE Z / continuidad; `INT-EXT-*` solo si existe interfaz técnica                    |
| proveedor crítico genérico                         | `FUERA_DE_ALCANCE_COMO_SISTEMA_DIGITAL_HASTA_BINDING` | ORIGO/BLOQUE Z/continuidad según capacidad                                             |

No se fabrica un proveedor para cerrar estas filas.

---

#### 13. Prohibiciones derivadas del inventario

Queda prohibido interpretar `VENTO-EXTERNAL-SYSTEM-INVENTORY-001` como autorización para:

1. crear cuentas externas;
2. comprar planes o servicios;
3. generar API keys, OAuth clients, certificados o secretos;
4. reutilizar credenciales existentes entre integraciones;
5. revelar valores de secretos;
6. crear endpoints;
7. desplegar webhooks;
8. registrar números, handles o aliases por inferencia;
9. habilitar flags;
10. activar una integración documentada como candidata;
11. conceder `service_role` a un tercero;
12. permitir escritura directa del proveedor en tablas internas;
13. declarar productivo un binding observado;
14. declarar disponible un proveedor por existir código;
15. asignar SLA, RTO, RPO o MBCO al proveedor sin contrato/evidencia;
16. inventar proveedor alterno o failover;
17. cambiar la propiedad funcional de un hecho;
18. avanzar decisiones de `INT-EXT-002..020` dentro de esta tarea.

---

#### 14. Handoff obligatorio a `INT-EXT-002..020`

Cada fila conserva un trabajo posterior concreto sin dejar pendientes narrativos sin dueño.

| Tema pendiente                                               | Tarea propietaria |
| ------------------------------------------------------------ | ----------------- |
| principal técnico independiente                              | `INT-EXT-002`     |
| separación entre credencial del proveedor y credencial VENTO | `INT-EXT-003`     |
| mecanismo de autenticación aplicable                         | `INT-EXT-004`     |
| alcance mínimo de credencial                                 | `INT-EXT-005`     |
| separación de ambientes                                      | `INT-EXT-006`     |
| almacenamiento seguro de secretos                            | `INT-EXT-007`     |
| rotación, expiración y revocación                            | `INT-EXT-008`     |
| contratos de entrada/salida versionados                      | `INT-EXT-009`     |
| webhook, polling o modalidad híbrida                         | `INT-EXT-010`     |
| firma, origen, timestamp y replay                            | `INT-EXT-011`     |
| idempotencia y deduplicación                                 | `INT-EXT-012`     |
| mapeo de identificadores externos/canónicos                  | `INT-EXT-013`     |
| conservación controlada de payload original                  | `INT-EXT-014`     |
| rate limits, retry, backoff y circuit breaker                | `INT-EXT-015`     |
| cuarentena y dead-letter                                     | `INT-EXT-016`     |
| auditoría, métricas, alertas y conciliación                  | `INT-EXT-017`     |
| contingencia ante indisponibilidad                           | `INT-EXT-018`     |
| retiro y revocación al finalizar integración                 | `INT-EXT-019`     |
| prohibición de credenciales compartidas                      | `INT-EXT-020`     |

Los bindings específicos del POS externo continúan además bajo `INT-POS-001..024`.

---

#### 15. Condiciones de salida de vacíos de evidencia

Una fila que hoy esté `DOCUMENTADO_SIN_BINDING_ACREDITADO` o `PROVEEDOR_NO_ACREDITADO` solo podrá elevar su certeza cuando una tarea propietaria aporte evidencia verificable de, según corresponda:

- proveedor o plataforma exacta;
- instancia/cuenta/tenant;
- propietario empresarial;
- custodio técnico;
- finalidad autorizada;
- contrato de entrada/salida;
- principal técnico;
- autenticación;
- referencia de credencial;
- endpoint o modalidad;
- ambiente;
- identificadores externos;
- evidencia de ejecución o validación.

La falta de uno de esos elementos no se rellena por convención ni conocimiento externo.

---

#### 16. Seguridad, privacidad y minimización

El inventario registra **referencias**, nunca secretos.

No contiene ni autoriza almacenar:

- API keys;
- service role keys;
- client secrets;
- certificados privados;
- archivos P12;
- claves P8;
- JSON de cuentas de servicio;
- webhook secrets;
- passwords;
- cookies de sesión;
- tokens de acceso o refresh;
- números de recuperación;
- payload sensible completo cuando una referencia es suficiente.

Las tareas posteriores deberán conservar finalidad, clasificación, acceso mínimo, ambiente, vigencia, revocación y auditabilidad.

---

#### 17. Relación con propiedad empresarial

El inventario preserva estas reglas:

- Supabase, Vercel, Expo y Sentry son infraestructura/plataformas técnicas, no propietarias de procesos VENTO;
- Wompi no se convierte en fuente final del hecho de pago VENTO por emitir un estado externo;
- RevenueCat no sustituye el contrato interno de Club/PASS;
- Resend y Expo Push transportan comunicaciones, no confirman comprensión ni acción;
- Google Maps/Reviews no se convierten en maestro de sedes, cobertura o reputación interna;
- Apple Wallet/Google Wallet proyectan una credencial o pase, no sustituyen identidad ni autorización VENTO;
- Zebra BrowserPrint transporta trabajo hacia un periférico, no confirma por sí solo el resultado empresarial;
- Shopify, Rappi, ManyChat, WhatsApp, Instagram, correo y voz no se convierten en fuentes maestras por ser canales;
- el POS externo conserva una fuente temporal solo bajo su contrato de transición; no obtiene acceso a estructuras internas;
- transporte externo aporta estado/evidencia, no confirma automáticamente la entrega canónica de VENTO.

---

#### 18. Estado del resultado

| Resultado                                       | Estado                                                                   |
| ----------------------------------------------- | ------------------------------------------------------------------------ |
| inventario de identidades externas              | `ESPECIFICADO`                                                           |
| proveedor por identidad cuando existe evidencia | `ESPECIFICADO`                                                           |
| propietario funcional por identidad             | `ESPECIFICADO`                                                           |
| finalidad por identidad                         | `ESPECIFICADO`                                                           |
| clasificación de evidencia por identidad        | `ESPECIFICADO`                                                           |
| principal técnico por integración               | `FUERA_DE_ALCANCE` — `INT-EXT-002`                                       |
| credenciales/autenticación/secretos             | `FUERA_DE_ALCANCE` — `INT-EXT-003..008`                                  |
| contratos y transporte detallados               | `FUERA_DE_ALCANCE` — `INT-EXT-009..017`                                  |
| contingencia y retiro                           | `FUERA_DE_ALCANCE` — `INT-EXT-018..020`                                  |
| validación remota/productiva de cada proveedor  | `PENDIENTE_DE_EVIDENCIA` — fase propietaria de implementación/validación |

---

#### 19. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

Justificación: esta tarea materializa un inventario documental de identidades, proveedores conocidos, propiedad, finalidad y nivel de evidencia. No introduce un nuevo comportamiento ejecutable, permiso, estado empresarial, protocolo, transporte, mecanismo de autenticación, retry, idempotencia, endpoint, efecto o autorización.

La cobertura vigente ya protege, entre otros aspectos:

- coherencia de dominios/URLs/ambientes externos;
- autenticidad y trazabilidad de webhooks y cadenas técnicas;
- idempotencia y deduplicación;
- captura única y ausencia de fuentes competidoras;
- separación de propiedad empresarial;
- contratos de fuentes externas y procesos que consumen `INT-EXT-*`.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

---

#### 20. Criterios de aceptación

1. existe un inventario materializado y no una plantilla vacía;
2. existen exactamente 21 identidades `EXT-SYS-*`;
3. los 21 identificadores son únicos;
4. cada identidad tiene sistema/plataforma;
5. cada identidad tiene proveedor conocido o declaración explícita de proveedor no acreditado;
6. cada identidad tiene propietario funcional o regla explícita de propiedad distribuida;
7. cada identidad tiene custodio técnico o frontera de integración;
8. cada identidad tiene finalidad;
9. cada identidad tiene clasificación de evidencia;
10. cada identidad tiene decisión explícita de INT-EXT-001;
11. código observado no se presenta como operación productiva validada;
12. configuración observada no se presenta como servicio remoto validado;
13. plataforma documentada no se presenta como integración activa;
14. no se inventa proveedor del POS externo;
15. no se inventa proveedor de correo, telefonía o transporte;
16. Shopify, Rappi, ManyChat, WhatsApp e Instagram conservan el nivel de evidencia realmente disponible;
17. Supabase no adquiere propiedad funcional;
18. Wompi no adquiere propiedad del hecho de pago VENTO;
19. RevenueCat no adquiere propiedad del dominio PASS/Club;
20. canales de mensajería no se convierten en fuentes maestras;
21. proveedores técnicos no obtienen `service_role` por inferencia;
22. ningún secreto aparece en el inventario;
23. no se crea ningún endpoint;
24. no se crea ninguna credencial;
25. no se ejecuta integración externa;
26. no se ejecuta cambio Supabase;
27. no se ejecuta código productivo;
28. todos los pendientes de identidad técnica y credenciales tienen destino `INT-EXT-002..020`;
29. el POS externo conserva destino específico `INT-POS-001..024`;
30. los vacíos de nube/energía/ISP/proveedor crítico no se cierran inventando sistemas;
31. se crean cero requisitos de prueba;
32. se modifican cero requisitos de prueba;
33. la continuidad queda reservada exclusivamente en `INT-EXT-002`.

---

#### 21. Límites de la tarea

INT-EXT-001 no:

- crea principal técnico;
- selecciona método de autenticación;
- define scopes de credencial;
- crea o rota secretos;
- define cuentas concretas no acreditadas;
- publica endpoints;
- configura webhooks;
- prueba proveedores remotos;
- contrata servicios;
- cambia planes comerciales;
- selecciona proveedor sustituto;
- ejecuta polling;
- crea colas;
- crea staging de payloads;
- ejecuta conciliación;
- cambia código;
- cambia Supabase;
- cambia la ruta canónica;
- inicia `INT-EXT-002`.

---

#### 22. Continuidad

ÚLTIMA TAREA APROBADA

`INT-APP-010 — Evitar escrituras cruzadas sin contrato`

TAREA ACTUAL APROBADA

`INT-EXT-001 — Inventariar sistemas externos, proveedores, propietarios y finalidad`

SIGUIENTE TAREA RESERVADA

`INT-EXT-002 — Definir principal técnico independiente por integración`


### ✅ INT-EXT-002 — Definir principal técnico independiente por integración

**Estado:** APROBADA  
**Tarea anterior:** `INT-EXT-001 — Inventariar sistemas externos, proveedores, propietarios y finalidad` — APROBADA  
**Tarea siguiente:** `INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento` — RESERVADA  
**Tipo de tarea:** documental; definición normativa y materializada del principal técnico no humano por frontera de integración externa, con decisión explícita para `EXT-SYS-001` a `EXT-SYS-021`, sin emitir credenciales, seleccionar mecanismos de autenticación, crear secretos, cuentas, endpoints, ejecutar cambios físicos ni modificar Supabase  
**Bloque:** X — Integraciones  
**Mini-bloque:** Integraciones externas y credenciales  
**Fase:** exclusivamente documental  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`  
**Implementación física autorizada:** ninguna  
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, cuentas externas, configuración productiva o despliegues:** ninguno  
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir qué significa y cómo se asigna el `IntegrationPrincipal` para las integraciones externas inventariadas por `INT-EXT-001`, de forma que cada binding técnico material pueda atribuirse a una identidad técnica no humana propia de su frontera de ejecución sin reutilizar usuarios humanos, autoridad empresarial, cuentas genéricas ni credenciales privilegiadas como identidad funcional.

La tarea resuelve documentalmente la separación entre:

```text
QUIÉN EJECUTA TÉCNICAMENTE
≠ QUIÉN ACTÚA COMO HUMANO
≠ QUIÉN AUTORIZA EL EFECTO EMPRESARIAL
≠ QUÉ CREDENCIAL AUTENTICA
≠ QUÉ PROVEEDOR PRESTA LA CAPACIDAD
```

El resultado no emite una identidad física, no crea una cuenta en terceros y no decide todavía si una credencial concreta es emitida por el proveedor o por Vento.

---

#### 2. Resultado sustantivo

Queda materializado el contrato documental de principal técnico para las **21 identidades** `EXT-SYS-001` a `EXT-SYS-021` heredadas de `VENTO-EXTERNAL-SYSTEM-INVENTORY-001`.

Para cada identidad se determina:

- la frontera semántica del principal técnico;
- la identidad humana que debe permanecer separada cuando exista;
- la autoridad empresarial que no puede derivarse del principal;
- el estado documental de la decisión;
- el estado de materialización física que sí puede afirmarse con la evidencia actual;
- el propietario del siguiente paso físico;
- la condición objetiva para salir del estado pendiente o no aplicable.

Balance:

| Control                                                                          |    Resultado |
| -------------------------------------------------------------------------------- | -----------: |
| Identidades heredadas esperadas                                                  |       **21** |
| Decisiones documentales materializadas                                           | **21 de 21** |
| Identidades faltantes                                                            |        **0** |
| Identidades duplicadas                                                           |        **0** |
| Decisiones documentales `ESPECIFICADO`                                           |       **21** |
| Materializaciones físicas `PENDIENTE_DE_EVIDENCIA`                               |       **11** |
| Materializaciones físicas `NO_APLICA` en el estado actual sin binding acreditado |       **10** |
| Usuarios humanos reutilizados como principal técnico                             |        **0** |
| `service_role` declarado como principal técnico                                  |        **0** |
| Credenciales emitidas o modificadas                                              |        **0** |
| Mecanismos de autenticación seleccionados                                        |        **0** |
| Cambios físicos                                                                  |        **0** |
| Requisitos `TREQ-*` creados o modificados                                        |        **0** |

---

#### 3. Entradas canónicas preservadas

La tarea consume y preserva, sin redefinir:

- `INT-EXT-001` y `VENTO-EXTERNAL-SYSTEM-INVENTORY-001`, incluidas las 21 identidades `EXT-SYS-*`, sus proveedores acreditados o no acreditados, evidencia, propietarios, custodios técnicos, finalidad y decisión vigente;
- la separación ya aprobada entre `external_system_id`, `external_instance_id`, `provider_account_ref`, `integration_principal_id`, `external_credential_id`, `contract_version`, `endpoint_ref`, `business_owner_ref` y `technical_owner_ref`;
- `SHELL-CON-017` como destino de materialización futura del contrato compartido de principal técnico de integración;
- `SHELL-CON-018` como destino separado de la referencia de credencial externa sin secreto;
- el modelo de BLOQUE Z que distingue servicio del sistema, cuenta técnica, `service_role`, credencial de integración, soporte remoto y actor humano;
- el modelo de auditoría transversal que separa principal autenticado, actor humano efectivo y principal técnico;
- la regla de que compartir infraestructura, conexión o credencial no transfiere propiedad funcional;
- la propiedad de `vento-shell` sobre cualquier modificación Supabase perteneciente a VENTO;
- la secuencia documental `INT-EXT-001 → INT-EXT-002 → INT-EXT-003`.

No se modifica ninguna clasificación de evidencia aprobada por `INT-EXT-001`.

---

#### 4. Definición canónica de `IntegrationPrincipal`

`IntegrationPrincipal` es la **identidad lógica técnica, no humana y atribuible** bajo la cual una integración VENTO ejecuta una interacción con una frontera externa o procesa una interacción proveniente de ella.

Su función es responder de forma estable:

```text
QUÉ INTEGRACIÓN TÉCNICA EJECUTÓ O RECIBIÓ ESTA INTERACCIÓN
```

No responde por sí sola:

```text
QUÉ HUMANO ORIGINÓ LA INTENCIÓN
QUÉ PERMISO EMPRESARIAL EXISTÍA
QUÉ SECRETO SE UTILIZÓ
QUÉ CUENTA COMERCIAL POSEE VENTO EN EL PROVEEDOR
QUÉ ENDPOINT FUE INVOCADO
QUÉ RESULTADO EMPRESARIAL QUEDÓ CONFIRMADO
```

Un principal técnico puede permanecer lógicamente estable aunque una credencial sea rotada, siempre que la implementación posterior conserve la misma frontera, propósito y autoridad técnica aprobados.

---

#### 5. Separaciones obligatorias

Se fija la siguiente separación:

```text
ACTOR HUMANO
≠
INTEGRATION PRINCIPAL
≠
PERMISSION KEY
≠
PROVIDER ACCOUNT REF
≠
EXTERNAL CREDENTIAL ID
≠
API KEY / TOKEN / SECRET / CERTIFICADO
≠
ENDPOINT REF
≠
SERVICE ROLE
```

Reglas:

1. un usuario humano no se reutiliza como principal técnico de una integración;
2. el principal técnico no recibe autoridad empresarial por existir;
3. una `PermissionKey` expresa capacidad empresarial y no identidad técnica;
4. `provider_account_ref` identifica la cuenta o relación externa cuando exista, no al ejecutor VENTO;
5. `external_credential_id` referencia una credencial y permanece separado del principal;
6. una API key, token, secreto, certificado o clave privada es material de autenticación, no identidad empresarial;
7. `endpoint_ref` identifica destino o superficie técnica, no al principal;
8. `service_role` es una credencial privilegiada y no una sesión humana, principal empresarial ni permiso universal;
9. un callback o webhook autenticado identifica una fuente externa, pero no sustituye al principal técnico interno que procesa la interacción;
10. el actor humano causal, cuando exista, permanece explícito y separado del principal técnico.

---

#### 6. Independencia y cardinalidad

La independencia se define por **frontera material de integración**, no por el nombre del proveedor.

Reglas:

1. cada binding material tendrá una decisión explícita de `integration_principal_id` antes de entrar en operación;
2. dos integraciones independientes no reutilizarán un principal técnico genérico para evitar su atribución individual;
3. una misma plataforma externa puede requerir varios principales cuando existan bindings materialmente distintos por aplicación, finalidad, dirección, cuenta, componente o frontera de ejecución;
4. dos capacidades del mismo proveedor no se fusionan únicamente por compartir marca o contrato comercial;
5. la existencia de un solo `EXT-SYS-*` no obliga a una relación física uno-a-uno con un único principal;
6. un cambio de credencial no crea automáticamente un principal nuevo;
7. un cambio de finalidad, frontera de confianza o integración independiente exige reevaluar el vínculo del principal;
8. el contexto de ambiente debe quedar distinguible en la ejecución técnica; la separación física de credenciales por ambiente pertenece a `INT-EXT-006`;
9. un principal no podrá usarse para ampliar el alcance técnico de otro binding por conveniencia;
10. si no existe binding acreditado, no se fabrica un principal físico: la decisión documental queda especificada y la materialización permanece `NO_APLICA` hasta que exista una integración autorizada.

---

#### 7. Contrato documental mínimo

Toda materialización posterior del principal técnico deberá poder resolver, sin exponer secretos:

| Dimensión                  | Regla                                                                                                |
| -------------------------- | ---------------------------------------------------------------------------------------------------- |
| `external_system_id`       | identidad `EXT-SYS-*` propietaria de la familia externa                                              |
| `external_instance_id`     | instancia concreta cuando exista y esté acreditada                                                   |
| `integration_principal_id` | identidad técnica estable de la frontera de integración                                              |
| `provider_account_ref`     | cuenta externa relacionada cuando corresponda, separada del principal                                |
| `external_credential_id`   | referencia opaca a la credencial utilizada, nunca el valor secreto                                   |
| `contract_version`         | contrato técnico aplicable a la interacción                                                          |
| `endpoint_ref`             | destino o superficie técnica cuando exista                                                           |
| `business_owner_ref`       | propietaria del hecho o decisión empresarial                                                         |
| `technical_owner_ref`      | responsable técnico de la integración                                                                |
| actor humano causal        | se conserva aparte cuando una persona originó, aprobó o supervisó la acción                          |
| ambiente                   | debe ser identificable sin convertirlo en autoridad empresarial                                      |
| finalidad técnica          | capacidad exacta que el principal puede ejecutar                                                     |
| vigencia                   | condición temporal o de ciclo de vida aplicable                                                      |
| estado                     | activo, suspendido, revocado o equivalente solamente cuando el contrato físico futuro lo materialice |
| correlación                | vínculo con request, command, event, intento o evidencia según el contrato consumidor                |

La tarea no crea valores físicos para esas dimensiones cuando las fuentes actuales no los acreditan.

---

#### 8. Dirección de confianza

El principal técnico se interpreta según la dirección de la interacción sin mezclar identidades.

##### 8.1 Salida VENTO → tercero

```text
ACTOR / PROCESO VENTO
→ autorización empresarial
→ principal técnico de integración
→ credencial técnica referenciada
→ proveedor externo
```

El proveedor recibe una interacción técnica, pero la autorización empresarial permanece en VENTO.

##### 8.2 Entrada tercero → VENTO

```text
FUENTE EXTERNA
→ prueba de autenticidad del proveedor
→ receptor/adaptador VENTO
→ principal técnico interno del procesamiento
→ contrato propietario
→ efecto empresarial solo después de validación
```

La identidad del proveedor y el principal interno no se fusionan.

##### 8.3 Bridge local o dispositivo

```text
ACTOR HUMANO
→ aplicación VENTO
→ principal técnico / binding local
→ bridge, agente o dispositivo
```

El equipo físico, navegador, impresora o token de dispositivo no sustituye al actor humano ni al principal lógico.

---

#### 9. Matriz materializada de principal técnico por identidad externa

| `external_system_id` | Sistema / plataforma                     | Evidencia heredada                   | Frontera del principal técnico definida por INT-EXT-002                                                                                                                                                             | Separación humana obligatoria                                                          | Autoridad empresarial preservada                                                          | Estado documental | Estado físico actual     | Propietario y condición de salida                                                                                                                                 |
| -------------------- | ---------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------- | ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001`        | Supabase                                 | `BINDING_TECNICO_OBSERVADO`          | cada servicio o adaptador VENTO que use una frontera Supabase deberá ejecutar bajo principal técnico atribuible a ese binding; `service_role` o una key no sustituyen esa identidad                                 | administrador, desarrollador, trabajador o usuario final permanecen separados          | cada aplicación o dominio conserva sus hechos y decisiones                                | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | `vento-shell` + BLOQUES X/Z; sale cuando el principal canónico y su vínculo físico quedan materializados sin convertir credencial compartida en autoridad         |
| `EXT-SYS-002`        | Wompi                                    | `BINDING_CONDICIONAL_OBSERVADO`      | el adaptador de pagos VENTO tendrá principal técnico propio; la identidad del emisor del webhook y la credencial usada para autenticarlo permanecen separadas                                                       | cliente, cajero, operador o aprobador del pago no son el principal del adaptador       | dominio propietario del pago                                                              | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | BLOQUE X + `vento-shell`; sale con principal de adaptador registrado y correlacionado con la credencial y contrato aprobados                                      |
| `EXT-SYS-003`        | RevenueCat                               | `BINDING_CONDICIONAL_OBSERVADO`      | el binding de suscripción y webhook tendrá principal técnico VENTO independiente; usuario de Club y emisor externo permanecen identidades distintas                                                                 | cliente o administrador de Club no se reutiliza como identidad técnica                 | PASS / dominio Club                                                                       | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | BLOQUE X + `vento-shell` + PASS; sale al existir vínculo canónico entre principal, binding y credencial sin confundir entitlement con autoridad técnica           |
| `EXT-SYS-004`        | Resend                                   | `BINDING_CONDICIONAL_OBSERVADO`      | el servicio de envío de invitaciones tendrá principal técnico no humano propio de la integración de correo; API key y remitente visible no son el principal                                                         | invitador, trabajador invitado y propietario del alias permanecen separados            | ANIMA conserva invitación, vínculo y onboarding                                           | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | BLOQUE X + `vento-shell` + ANIMA; sale cuando el sender técnico queda registrado y auditable con credencial referenciada                                          |
| `EXT-SYS-005`        | Expo / EAS Update                        | `CONFIGURACION_OBSERVADA`            | cada automatización material de build, actualización o publicación deberá tener principal técnico atribuible al binding de la aplicación, sin usar la identidad personal del desarrollador como identidad operativa | desarrollador, revisor o publicador humano permanece causalmente separado              | ANIMA y PASS conservan comportamiento y estado de sus aplicaciones                        | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | responsables técnicos ANIMA/PASS + BLOQUES T/Z; sale cuando la ejecución automatizada posee identidad canónica y el humano queda registrado aparte cuando aplique |
| `EXT-SYS-006`        | Expo Push Service                        | `BINDING_TECNICO_OBSERVADO`          | el emisor VENTO de push tendrá principal técnico propio; token del dispositivo y destinatario no representan al emisor                                                                                              | autor del mensaje, cliente y operador permanecen separados                             | PASS conserva mensaje, pedido, audiencia y resultado empresarial                          | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | BLOQUES X/E4 + `vento-shell`; sale con principal del sender registrado, correlación auditable y credencial separada                                               |
| `EXT-SYS-007`        | Sentry                                   | `BINDING_CONDICIONAL_OBSERVADO`      | la emisión o carga de telemetría tendrá principal técnico atribuible por aplicación y binding; el usuario observado nunca se convierte en identidad del sistema emisor                                              | usuario monitoreado, desarrollador y operador permanecen separados                     | ANIMA conserva el contexto funcional; telemetría no decide hechos empresariales           | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | ANIMA + BLOQUE Z/X; sale cuando la integración activa acredita principal, finalidad y vínculo de credencial sin reutilizar identidad humana                       |
| `EXT-SYS-008`        | Google Maps / Google Reviews             | `BINDING_CONDICIONAL_OBSERVADO`      | cualquier consumo autenticado de API tendrá principal técnico del binding VENTO; una navegación pública o enlace de reseña sin binding autenticado no crea por sí sola un principal                                 | cliente, revisor y operador permanecen separados                                       | PASS conserva sede, cobertura, experiencia y resultado                                    | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | PASS + BLOQUE X; sale al acreditar qué binding autenticado existe y registrar su principal sin convertir una API key en identidad                                 |
| `EXT-SYS-009`        | Apple Wallet / PassKit y APNs            | `BINDING_CONDICIONAL_OBSERVADO`      | la emisión/actualización de pases y el sender APNs deberán estar asociados a principal técnico VENTO de su frontera; certificado, clave, push token y pass identity permanecen separados                            | cliente, trabajador y operador permanecen separados                                    | PASS conserva loyalty; ANIMA conserva identidad laboral bajo su contrato propio           | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | PASS/ANIMA + BLOQUE X; sale cuando cada binding aplicable posee principal canónico y credencial referenciada sin mezclar dominios                                 |
| `EXT-SYS-010`        | Vercel                                   | `CONFIGURACION_OBSERVADA`            | toda automatización material de despliegue o runtime externo que actúe por VENTO deberá tener principal técnico atribuible a la aplicación o servicio, separado de la cuenta personal del operador                  | desarrollador, aprobador o administrador humano permanece separado                     | cada aplicación conserva funcionalidad y datos                                            | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | responsables técnicos + BLOQUES Z/T/X; sale cuando la identidad operativa de cada binding relevante queda registrada y auditable                                  |
| `EXT-SYS-011`        | Zebra BrowserPrint                       | `BINDING_TECNICO_OBSERVADO`          | el bridge de impresión NEXO deberá distinguir principal técnico del binding, endpoint/dispositivo y actor humano; la impresora detectada no es el principal                                                         | bodeguero, operador o administrador de impresión permanece separado                    | NEXO conserva trabajo, etiqueta/documento y resultado logístico                           | `ESPECIFICADO`    | `PENDIENTE_DE_EVIDENCIA` | NEXO + PRINT/E4/Z/X; sale cuando el bridge y dispositivo quedan vinculados a identidad técnica canónica sin perder actor real                                     |
| `EXT-SYS-012`        | Google Wallet / Google Pay & Wallet      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | si se materializa el carnet laboral en Google Wallet, el issuer/service binding deberá tener principal técnico no humano propio; cuenta de servicio futura no se confunde con actor laboral                         | trabajador y administrador permanecen separados                                        | ANIMA conserva identidad laboral y elegibilidad                                           | `ESPECIFICADO`    | `NO_APLICA`              | ANIMA + BLOQUE X + `vento-shell` para Supabase; pasa a materialización obligatoria antes de activar un binding autenticado                                        |
| `EXT-SYS-013`        | POS externo vigente                      | `PROVEEDOR_NO_ACREDITADO`            | cualquier adaptador futuro del POS externo deberá tener principal técnico propio de esa integración; la identidad concreta no se define antes de auditar proveedor, interfaz y binding                              | cajero, operador, administrador y proveedor humano permanecen separados                | contrato temporal del hecho de venta; propietarias internas conservan sus efectos         | `ESPECIFICADO`    | `NO_APLICA`              | BLOQUE X + `INT-POS-001`; pasa a materialización obligatoria cuando exista binding exacto acreditado                                                              |
| `EXT-SYS-014`        | Shopify / canal de comercio electrónico  | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | una integración Shopify material tendrá principal técnico VENTO propio del adaptador o canal, separado de cuenta comercial y operador                                                                               | cliente, operador de tienda y administrador permanecen separados                       | PULSO/PASS/NEXO/NUMERA según el hecho propietario                                         | `ESPECIFICADO`    | `NO_APLICA`              | BLOQUE X + propietario del canal; pasa a materialización obligatoria cuando exista instancia y binding verificados                                                |
| `EXT-SYS-015`        | Rappi / marketplace                      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | una integración material con marketplace tendrá principal técnico VENTO propio del adaptador, separado de cuenta del comercio, repartidor y operador                                                                | cliente, operador, repartidor y administrador permanecen separados                     | PULSO conserva pedido, NEXO entrega y NUMERA hecho económico                              | `ESPECIFICADO`    | `NO_APLICA`              | BLOQUE X + propietario del canal; pasa a materialización obligatoria cuando exista binding autenticado acreditado                                                 |
| `EXT-SYS-016`        | ManyChat / automatización conversacional | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | un bot o adaptador futuro tendrá principal técnico propio y no podrá operar bajo la identidad humana del agente ni usar la cuenta del canal como autoridad empresarial                                              | agente, cliente, creador de campaña y administrador permanecen separados               | proceso receptor y Marketing conservan sus decisiones                                     | `ESPECIFICADO`    | `NO_APLICA`              | BLOQUE X + propietario del canal; pasa a materialización obligatoria cuando exista bot, cuenta o API autorizados                                                  |
| `EXT-SYS-017`        | WhatsApp                                 | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | un binding API futuro tendrá principal técnico propio del adaptador VENTO; número, cuenta, contacto, agente o usuario no sustituyen esa identidad                                                                   | cliente, agente y administrador permanecen separados                                   | proceso receptor conserva caso, pedido, soporte o reclamo                                 | `ESPECIFICADO`    | `NO_APLICA`              | BLOQUE X + propietario del canal; pasa a materialización obligatoria cuando se acredite proveedor/API y binding                                                   |
| `EXT-SYS-018`        | Instagram / perfiles sociales            | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | cualquier automatización o API futura tendrá principal técnico propio del binding; perfil social y cuenta humana de administración permanecen separados                                                             | community manager, cliente, creador y administrador permanecen separados               | Marketing conserva publicación y el proceso receptor conserva casos derivados             | `ESPECIFICADO`    | `NO_APLICA`              | propietario de Marketing/canal + BLOQUE X; pasa a materialización obligatoria cuando exista integración API autorizada                                            |
| `EXT-SYS-019`        | Correo corporativo y alias funcionales   | `PROVEEDOR_NO_ACREDITADO`            | solo una automatización o API material de correo requerirá principal técnico; un buzón o alias usado por humanos no se redefine como principal de integración                                                       | remitente humano, receptor, propietario del alias y administrador permanecen separados | cada proceso receptor conserva su expediente o caso                                       | `ESPECIFICADO`    | `NO_APLICA`              | propietario del alias + custodio técnico + BLOQUE X si existe integración; pasa a materialización al acreditarse API o automatización                             |
| `EXT-SYS-020`        | Telefonía / canal de voz                 | `PROVEEDOR_NO_ACREDITADO`            | cualquier CTI, API, bot o automatización futura tendrá principal técnico propio; número telefónico y agente no son identidad técnica de integración                                                                 | agente, cliente, operador y administrador permanecen separados                         | proceso receptor conserva reserva, catering, cobranza, reclamo o coordinación             | `ESPECIFICADO`    | `NO_APLICA`              | propietario operativo + custodio técnico + BLOQUE X si existe integración; pasa a materialización al acreditarse binding técnico                                  |
| `EXT-SYS-021`        | Transporte externo                       | `PROVEEDOR_NO_ACREDITADO`            | cualquier API, tracking o adaptador futuro tendrá principal técnico VENTO propio; conductor, transportista, proveedor y referencia de envío no son el principal del adaptador                                       | conductor, despachador, receptor y operador permanecen separados                       | NEXO o el proceso logístico propietario conserva salida, custodia, entrega y conciliación | `ESPECIFICADO`    | `NO_APLICA`              | BLOQUE X + propietario logístico; pasa a materialización obligatoria cuando proveedor y binding exactos queden acreditados                                        |

---

#### 10. Reconciliación de las 21 decisiones

La matriz preserva exactamente el inventario heredado:

```text
21 IDENTIDADES
= 3 BINDING_TECNICO_OBSERVADO
+ 6 BINDING_CONDICIONAL_OBSERVADO
+ 2 CONFIGURACION_OBSERVADA
+ 6 DOCUMENTADO_SIN_BINDING_ACREDITADO
+ 4 PROVEEDOR_NO_ACREDITADO
```

La decisión de principal queda:

```text
21 ESPECIFICADO DOCUMENTALMENTE
= 11 PENDIENTE_DE_EVIDENCIA PARA MATERIALIZACIÓN FÍSICA
+ 10 NO_APLICA EN EL ESTADO ACTUAL SIN BINDING ACREDITADO
```

`NO_APLICA` no significa que una futura integración pueda omitir principal. Significa que no existe evidencia suficiente para declarar actualmente un binding técnico VENTO que requiera una identidad física. Antes de activar cualquiera de esas integraciones, la decisión deberá pasar a materialización y cumplir este contrato.

---

#### 11. Actor humano y causalidad

Cuando una integración derive de una acción humana, la auditoría deberá preservar ambos planos:

```text
ACTOR HUMANO EFECTIVO
+
PRINCIPAL TÉCNICO DE INTEGRACIÓN
```

Ejemplos conceptuales:

- un cliente inicia un pago; el adaptador de pago ejecuta técnicamente;
- un administrador invita a un trabajador; el servicio de correo envía técnicamente;
- un trabajador solicita una impresión; el bridge de impresión ejecuta técnicamente;
- un operador aprueba una acción; el adaptador externo la transmite técnicamente.

No se permitirá registrar al servicio como si fuera el humano ni al humano como si fuera el servicio.

En procesos totalmente automáticos, el principal técnico permanece identificable y debe conservarse el proceso, evento o causa que originó la ejecución.

---

#### 12. Principal técnico y autorización empresarial

La existencia de un `IntegrationPrincipal` no concede una `PermissionKey` ni autoriza un efecto.

Secuencia obligatoria cuando exista efecto protegido:

```text
INTENCIÓN O EVENTO
→ principal y fuente autenticables
→ contrato vigente
→ aplicación propietaria
→ autorización empresarial independiente
→ validación de recurso, estado y contexto
→ efecto o rechazo
→ auditoría
```

Reglas:

1. un principal válido puede recibir un rechazo empresarial;
2. una credencial válida puede corresponder a un principal sin permiso para la operación solicitada;
3. un proveedor autenticado no puede ordenar por sí solo una mutación interna;
4. una llamada con `service_role` no sustituye la autorización del dominio propietario;
5. una integración de solo lectura no puede ampliar su función mediante un principal compartido con otra integración;
6. una automatización conserva la misma frontera de propiedad que una acción interactiva.

---

#### 13. Principal técnico y credenciales

La tarea fija únicamente la relación lógica:

```text
INTEGRATION PRINCIPAL
→ puede estar autenticado mediante una credencial referenciada
```

Pero mantiene prohibido:

```text
INTEGRATION PRINCIPAL = SECRET VALUE
INTEGRATION PRINCIPAL = SERVICE ROLE
INTEGRATION PRINCIPAL = CUENTA HUMANA
INTEGRATION PRINCIPAL = PROVIDER ACCOUNT
```

La procedencia de las credenciales queda reservada a `INT-EXT-003`.

El mecanismo de almacenamiento, cifrado, acceso y secreto queda reservado a las tareas posteriores del mismo mini-bloque y a la arquitectura propietaria correspondiente.

---

#### 14. Ciclo de vida requerido para la materialización futura

La implementación física posterior deberá permitir, conforme a su contrato propietario:

- alta explícita del principal;
- vínculo con la integración exacta;
- vínculo con propietario técnico y propietario empresarial;
- referencia a credencial sin secreto;
- activación solo después de autorización aplicable;
- rotación de credenciales sin perder trazabilidad;
- suspensión y revocación;
- retiro sin reutilizar la identidad para otra integración;
- historial de cambios;
- correlación de ejecuciones;
- reconciliación cuando exista ambigüedad sobre identidad o efecto.

La presente tarea no materializa ese ciclo en base de datos ni proveedor externo.

---

#### 15. Estados de evidencia

La tarea usa únicamente estados documentales que no simulan implementación:

| Estado                   | Uso en INT-EXT-002                                                                                                                                  |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ESPECIFICADO`           | la frontera y regla del principal están definidas documentalmente                                                                                   |
| `PENDIENTE_DE_EVIDENCIA` | existe evidencia de binding o configuración material, pero no se acreditó un registro canónico completo del `integration_principal_id` y su vínculo |
| `NO_APLICA`              | no existe binding técnico acreditado en el estado actual; no se crea identidad física por anticipación                                              |

No se utiliza `IMPLEMENTADO` ni `VALIDADO` para ninguna de las 21 identidades.

---

#### 16. Handoffs físicos y documentales

| Pendiente                                                  | Estado en INT-EXT-002   | Propietario                                    | Condición de salida                                                                                     |
| ---------------------------------------------------------- | ----------------------- | ---------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| contrato compartido físico de principal técnico            | `FUERA_DE_ALCANCE`      | `SHELL-CON-017`                                | contrato consumible materializado y probado sin copia divergente                                        |
| referencia física de credencial sin secreto                | `FUERA_DE_ALCANCE`      | `SHELL-CON-018`                                | referencia consumible vinculada al principal sin exponer secreto                                        |
| procedencia proveedor/Vento de la credencial               | `FUERA_DE_ALCANCE`      | `INT-EXT-003`                                  | cada binding aplicable clasificado sin ambigüedad                                                       |
| mecanismo concreto de autenticación                        | `FUERA_DE_ALCANCE`      | `INT-EXT-004`                                  | mecanismo aprobado por integración sin ampliar autoridad                                                |
| scopes y least privilege                                   | `FUERA_DE_ALCANCE`      | `INT-EXT-005`                                  | alcance técnico mínimo materializado                                                                    |
| separación física por ambiente                             | `FUERA_DE_ALCANCE`      | `INT-EXT-006`                                  | credenciales independientes por ambiente según contrato aprobado                                        |
| cuentas compartidas o credenciales humanas existentes      | `FUERA_DE_ALCANCE`      | `INT-EXT-007`                                  | hallazgos inventariados y tratados sin pérdida de operación autorizada                                  |
| ciclo de rotación, revocación y expiración de credenciales | `FUERA_DE_ALCANCE`      | `INT-EXT-008`                                  | ciclo documentado y posteriormente materializado                                                        |
| persistencia física del registro de integración            | `FUERA_DE_ALCANCE`      | `INT-DB-001` a `INT-DB-008` cuando corresponda | infraestructura externa autorizada materializa identidad, credencial y auditoría sin secretos expuestos |
| proveedor y binding exactos del POS externo                | `FUERA_DE_ALCANCE`      | `INT-POS-001`                                  | proveedor, interfaces y límites auditados con evidencia                                                 |
| bindings futuros de canales sin integración acreditada     | `NO_APLICA` actualmente | BLOQUE X + propietario de cada canal           | integración autorizada existe y adopta un principal técnico antes de activarse                          |

No queda pendiente material sin propietario y condición de salida.

---

#### 17. Prohibiciones

Queda prohibido:

1. usar una cuenta personal como `integration_principal_id`;
2. usar correo de una persona como identidad técnica estable del servicio;
3. declarar `service_role` como principal técnico;
4. usar el mismo principal genérico para integraciones independientes;
5. inferir principal desde API key, token, secreto, certificado o nombre de variable;
6. inferir autoridad empresarial desde el principal técnico;
7. inferir permiso desde una cuenta del proveedor;
8. convertir un `external_system_id` en credencial;
9. convertir un endpoint en identidad;
10. convertir un dispositivo o push token en principal del servicio;
11. convertir la identidad externa del proveedor en actor humano VENTO;
12. mezclar actor humano y principal técnico en un solo campo de auditoría;
13. crear una identidad física para un canal que todavía no tiene binding acreditado;
14. declarar una identidad física como implementada por observar solamente código o configuración;
15. compartir un principal para obtener privilegios de otro binding;
16. crear secretos o credenciales dentro de esta tarea;
17. elegir OAuth, API key, HMAC, certificado u otro mecanismo dentro de esta tarea;
18. definir scopes de proveedor dentro de esta tarea;
19. cambiar credenciales por ambiente dentro de esta tarea;
20. modificar Supabase dentro de esta tarea;
21. modificar código dentro de esta tarea;
22. desplegar servicios dentro de esta tarea;
23. cambiar las 21 identidades o clasificaciones heredadas de `INT-EXT-001`;
24. iniciar o desarrollar `INT-EXT-003` dentro de esta tarea.

---

#### 18. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: `INT-EXT-002` materializa para `EXT-SYS-001` a `EXT-SYS-021` una especialización documental de comportamientos ya protegidos por el registro canónico vigente. La cobertura existente ya exige correlación tecnológica y autenticación mínima de integraciones, separación entre principal autenticado, actor humano efectivo y principal técnico, vínculo técnico explícito y no ambiguo, contexto nominal de ejecución de servicios, tratamiento de `service_role` como credencial y no como autoridad empresarial, y prohibición de derivar propiedad o autoridad desde infraestructura o acceso compartidos.

Entre las coberturas vigentes se encuentran `TREQ-INTEGRATION-020`, `TREQ-AUTH-015`, `TREQ-AUTH-021`, `TREQ-SUPABASE-866`, `TREQ-SUPABASE-867`, `TREQ-INTEGRATION-201`, `TREQ-INTEGRATION-290`, `TREQ-INTEGRATION-293`, `TREQ-INTEGRATION-294` y `TREQ-INTEGRATION-315`.

La tarea no crea un permiso, mecanismo ejecutable de autenticación, credencial, secreto, endpoint, estado empresarial, transporte ni efecto nuevo; únicamente instancia la frontera documental del principal técnico para las 21 identidades ya inventariadas.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 19. Criterios de aceptación

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones documentales;
3. no existen identidades faltantes;
4. no existen identidades duplicadas;
5. las clasificaciones heredadas de `INT-EXT-001` permanecen 3 + 6 + 2 + 6 + 4;
6. las 21 decisiones quedan `ESPECIFICADO` documentalmente;
7. 11 identidades con binding o configuración observados permanecen `PENDIENTE_DE_EVIDENCIA` para principal físico canónico;
8. 10 identidades sin binding acreditado permanecen `NO_APLICA` para materialización física actual;
9. `NO_APLICA` obliga a adoptar principal antes de activar un binding futuro;
10. `IntegrationPrincipal` queda definido como identidad lógica técnica no humana y atribuible;
11. principal técnico y actor humano permanecen separados;
12. principal técnico y `PermissionKey` permanecen separados;
13. principal técnico y `provider_account_ref` permanecen separados;
14. principal técnico y `external_credential_id` permanecen separados;
15. principal técnico y secreto permanecen separados;
16. principal técnico y endpoint permanecen separados;
17. `service_role` permanece clasificado como credencial privilegiada y no como principal o autoridad empresarial;
18. un proveedor autenticado no recibe autoridad empresarial por autenticidad técnica;
19. un binding de entrada conserva identidad externa y principal interno separados;
20. un binding de salida conserva actor, principal, credencial y proveedor separados;
21. un bridge local conserva actor, principal y dispositivo separados;
22. una plataforma externa puede tener varios principales cuando existan bindings independientes;
23. dos integraciones independientes no reutilizan un principal genérico;
24. una rotación de credencial no cambia por sí sola el principal lógico;
25. no se crean valores físicos de `integration_principal_id` sin evidencia;
26. no se crean cuentas externas;
27. no se crean credenciales;
28. no se crean secretos;
29. no se seleccionan mecanismos de autenticación;
30. no se definen scopes de proveedor;
31. no se modifica Supabase;
32. no se modifica código;
33. no se ejecuta despliegue;
34. cada pendiente físico tiene propietario y condición de salida;
35. se crean cero requisitos `TREQ-*`;
36. se modifican cero requisitos `TREQ-*`;
37. `INT-EXT-003` permanece reservada.

---

#### 20. Resultado de la tarea

`INT-EXT-002` deja definida y materializada documentalmente la frontera de identidad técnica para las 21 familias externas inventariadas.

El modelo resultante exige que toda integración material pueda distinguir:

```text
SISTEMA EXTERNO
+
INSTANCIA EXTERNA CUANDO EXISTA
+
PRINCIPAL TÉCNICO VENTO
+
CREDENCIAL REFERENCIADA
+
ACTOR HUMANO CUANDO EXISTA
+
PROPIETARIO EMPRESARIAL
+
PROPIETARIO TÉCNICO
+
CONTRATO Y CORRELACIÓN
```

sin convertir esa relación en:

```text
CUENTA HUMANA COMPARTIDA
SERVICE ROLE COMO IDENTIDAD EMPRESARIAL
SECRETO COMO PRINCIPAL
PROVEEDOR COMO AUTORIDAD VENTO
ENDPOINT COMO IDENTIDAD
BINDING NO ACREDITADO COMO IMPLEMENTACIÓN
```

La emisión, procedencia y materialización física de credenciales permanece fuera del alcance de esta tarea.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-001 — Inventariar sistemas externos, proveedores, propietarios y finalidad`

TAREA ACTUAL APROBADA

`INT-EXT-002 — Definir principal técnico independiente por integración`

SIGUIENTE TAREA RESERVADA

`INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento`


### [ ] INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento
### [ ] INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo
### [ ] INT-EXT-005 — Definir alcance mínimo de cada credencial
### [ ] INT-EXT-006 — Separar credenciales de desarrollo, staging y producción
### [ ] INT-EXT-007 — Definir almacenamiento seguro de secretos
### [ ] INT-EXT-008 — Definir rotación, expiración y revocación
### [ ] INT-EXT-009 — Definir contratos de entrada y salida versionados
### [ ] INT-EXT-010 — Definir estrategia webhook, polling o híbrida
### [ ] INT-EXT-011 — Definir validación de firma, origen, timestamp y replay
### [ ] INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo
### [ ] INT-EXT-013 — Definir mapeo de identificadores externos y canónicos
### [ ] INT-EXT-014 — Definir conservación controlada del payload original
### [ ] INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker
### [ ] INT-EXT-016 — Definir cuarentena o dead-letter
### [ ] INT-EXT-017 — Definir auditoría, métricas, alertas y conciliación
### [ ] INT-EXT-018 — Definir contingencia ante indisponibilidad del proveedor
### [ ] INT-EXT-019 — Definir retiro de integración y revocación de credenciales
### [ ] INT-EXT-020 — Prohibir credenciales compartidas entre integraciones

Separación obligatoria:

```text
PermissionKey
→ capacidad empresarial

IntegrationPrincipal
→ identidad técnica de la integración

ExternalCredentialId
→ referencia interna a una credencial

API key, token o secret
→ valor secreto almacenado fuera de tablas expuestas
```

Reglas:

- ninguna integración externa recibirá `service_role`;
- ningún secreto se almacenará en frontend o variable pública;
- los logs registrarán identificadores de credencial, no sus valores;
- una credencial de lectura no se reutilizará para escritura;
- cada entorno tendrá credenciales independientes;
- toda credencial deberá poder revocarse sin modificar contratos empresariales.
